import {
  useEffect,
  useId,
  useRef,
  useState,
  type RefObject,
} from 'react'
import { createPortal } from 'react-dom'
import { useNavigate } from 'react-router-dom'
import { useTranslation } from '../../i18n'
import { useLocale } from '../../lib/i18n/locale'
import { useAuth } from '../../lib/auth/useAuth'
import { canAttemptAiChat, friendlyAiError, postAiChat } from '../../lib/ai'
import { shouldAttemptAiAnswer } from '../../lib/search/aiRouting'
import { assistantLeadForResponse } from '../../lib/search/assistantLead'
import { createChatMessageId, type ChatMessage } from '../../lib/search/chatTypes'
import {
  buildSessionContext,
  searchSite,
  zeroResultSuggestions,
} from '../../lib/search/searchSite'
import { INITIAL_RESULT_COUNT } from '../../lib/search/searchCore'
import type { SiteSearchResult } from '../../lib/search/types'
import {
  useSearchBuddy,
  type SearchBuddyReply,
} from '../../lib/search/searchBuddySession'
import {
  missingApiUrlDevMessage,
  searchBuddyApiReady,
  sendSearchBuddyMessage,
} from '../../lib/searchBuddy'
import { searchBuddyErrorMessage } from '../../lib/searchBuddy/errorMessages.ts'
import { resolveContentMediaUrl } from '../../lib/cms/contentMedia'
import { ChatComposer } from './ChatComposer'
import { ChatStarterPrompts, CHAT_STARTER_PROMPTS } from './ChatStarterPrompts'
import { ChatThread } from './ChatThread'
import styles from './SearchBuddy.module.css'

const FOCUSABLE =
  'a[href], button:not([disabled]), textarea:not([disabled]), input:not([disabled]), [tabindex]:not([tabindex="-1"])'

const NEAR_BOTTOM_PX = 96

function getFocusableIn(container: HTMLElement | null): HTMLElement[] {
  if (!container) return []
  return Array.from(container.querySelectorAll<HTMLElement>(FOCUSABLE)).filter(
    (el) => !el.hasAttribute('disabled') && el.getAttribute('aria-hidden') !== 'true',
  )
}

function isSynaxariumResult(result: SiteSearchResult): boolean {
  if (result.sourceType === 'synaxarium_commemoration') return true
  if (result.sourceType !== 'synaxarium') return false
  return /^\/pray\/synaxarium\/[^/]+\/?$/.test(result.route)
}

function localizeResult(
  result: SiteSearchResult,
  t: (key: string) => string,
  signedIn: boolean,
): SiteSearchResult {
  if (result.sourceId === 'personal:favorites') {
    return {
      ...result,
      title: t('searchBuddy.favoritesTitle'),
      description: signedIn
        ? t('searchBuddy.favoritesDescSignedIn')
        : t('searchBuddy.favoritesDescGuest'),
    }
  }
  return result
}

function replyFromResponse(response: {
  zeroResults: boolean
  results: SiteSearchResult[]
  partial: boolean
}): SearchBuddyReply {
  if (response.zeroResults) return { kind: 'zero' }
  const first = response.results[0]
  if (!first) return { kind: 'generic', partial: response.partial }
  if (first.matchKind === 'personal' && first.route === '/saved') {
    return { kind: 'favorites' }
  }
  if (first.matchKind === 'intent' && response.results.length === 1) {
    return { kind: 'opening', title: first.title }
  }
  if (response.results.length === 1) {
    return { kind: 'foundOne', title: first.title, partial: response.partial }
  }
  return { kind: 'foundMany', count: response.results.length, partial: response.partial }
}

function formatLocalLead(
  reply: SearchBuddyReply | null,
  t: (key: string, params?: Record<string, string | number>) => string,
): string {
  if (!reply) return t('searchBuddy.foundGeneric')
  switch (reply.kind) {
    case 'zero':
      return t('searchBuddy.zero')
    case 'favorites':
      return t('searchBuddy.favoritesMessage')
    case 'opening':
      return t('searchBuddy.opening', { title: reply.title })
    case 'foundOne':
      return t('searchBuddy.foundOne', { title: reply.title })
    case 'foundMany':
      return t('searchBuddy.foundMany', { count: reply.count })
    default:
      return t('searchBuddy.foundGeneric')
  }
}

function patchMessage(
  messages: ChatMessage[],
  id: string,
  patch: Partial<ChatMessage>,
): ChatMessage[] {
  return messages.map((m) => (m.id === id ? { ...m, ...patch } : m))
}

export function SearchBuddy() {
  const t = useTranslation()
  const { uiLocale } = useLocale()
  const { user } = useAuth()
  const navigate = useNavigate()
  const {
    open,
    setOpen,
    snapshot,
    setSnapshot,
    persistScroll,
    clearSession,
    followUpRef,
  } = useSearchBuddy()

  const [busy, setBusy] = useState(false)
  const [voiceRemountKey, setVoiceRemountKey] = useState(0)
  const requestIdRef = useRef(0)
  const aiAbortRef = useRef<AbortController | null>(null)
  const stickToBottomRef = useRef(true)
  const titleId = useId()
  const previewTitleId = useId()
  const welcomeId = useId()
  const inputRef = useRef<HTMLTextAreaElement>(null)
  const closeRef = useRef<HTMLButtonElement>(null)
  const panelRef = useRef<HTMLElement>(null)
  const bodyRef = useRef<HTMLDivElement>(null)
  const fabRef = useRef<HTMLButtonElement>(null)
  const backToResultsRef = useRef<HTMLButtonElement>(null)
  const restoreScrollPending = useRef(false)

  const apiReady = searchBuddyApiReady()
  const devApiNotice = missingApiUrlDevMessage()

  const { query, messages, showAll, preview, resultsScrollTop } = snapshot

  const showWelcome = !messages.length && !busy && !preview

  function cancelAiRequest() {
    if (aiAbortRef.current) {
      aiAbortRef.current.abort()
      aiAbortRef.current = null
    }
  }

  useEffect(() => {
    if (!open) return
    const fab = fabRef.current
    const mainEl = document.getElementById('main')
    const footerEl = document.querySelector('footer')
    const inertTargets = [mainEl, footerEl].filter(Boolean) as HTMLElement[]
    for (const el of inertTargets) el.setAttribute('inert', '')

    const timer = window.setTimeout(() => {
      if (preview) {
        backToResultsRef.current?.focus()
      } else {
        inputRef.current?.focus()
      }
      if (restoreScrollPending.current && bodyRef.current && !preview) {
        bodyRef.current.scrollTop = resultsScrollTop
        restoreScrollPending.current = false
      }
    }, 40)

    const trapTab = (e: KeyboardEvent) => {
      if (e.key === 'Escape') {
        e.preventDefault()
        if (preview) {
          setSnapshot({ preview: null })
          restoreScrollPending.current = true
          return
        }
        setOpen(false)
        return
      }
      if (e.key !== 'Tab' || !panelRef.current) return
      const nodes = getFocusableIn(panelRef.current)
      if (nodes.length === 0) return
      const first = nodes[0]
      const last = nodes[nodes.length - 1]
      const active = document.activeElement as HTMLElement | null
      if (e.shiftKey) {
        if (!active || active === first || !panelRef.current.contains(active)) {
          e.preventDefault()
          last.focus()
        }
      } else if (!active || active === last || !panelRef.current.contains(active)) {
        e.preventDefault()
        first.focus()
      }
    }

    const onFocusIn = (e: FocusEvent) => {
      if (!panelRef.current) return
      const target = e.target as Node | null
      if (target && panelRef.current.contains(target)) return
      if (target === fabRef.current) {
        e.preventDefault()
        const nodes = getFocusableIn(panelRef.current)
        nodes[0]?.focus()
      }
    }

    document.addEventListener('keydown', trapTab, true)
    document.addEventListener('focusin', onFocusIn)
    const prev = document.body.style.overflow
    document.body.style.overflow = 'hidden'
    return () => {
      window.clearTimeout(timer)
      document.removeEventListener('keydown', trapTab, true)
      document.removeEventListener('focusin', onFocusIn)
      document.body.style.overflow = prev
      for (const el of inertTargets) el.removeAttribute('inert')
      fab?.focus()
    }
  }, [open, preview, resultsScrollTop, setOpen, setSnapshot])

  useEffect(() => {
    if (open) restoreScrollPending.current = true
  }, [open])

  useEffect(() => {
    if (!open) cancelAiRequest()
    return () => cancelAiRequest()
  }, [open])

  function onBodyScroll() {
    if (!bodyRef.current || preview) return
    const el = bodyRef.current
    const distance = el.scrollHeight - el.scrollTop - el.clientHeight
    stickToBottomRef.current = distance < NEAR_BOTTOM_PX
    persistScroll(el.scrollTop)
  }

  async function runLocalSearch(
    q: string,
    requestId: number,
    assistantId: string,
    options?: { keepRemoteError?: string },
  ) {
    const response = await searchSite(q, {
      limit: 12,
      includePersonal: true,
      userId: user?.id ?? null,
      session: followUpRef.current,
      language: uiLocale === 'am' ? 'am' : 'en',
    })
    if (requestId !== requestIdRef.current) return

    const localized = response.results.map((result) =>
      localizeResult(result, t, Boolean(user?.id)),
    )
    const followUp = buildSessionContext(response.resolvedQuery || q, localized)
    followUpRef.current = followUp
    const reply = replyFromResponse({ ...response, results: localized })
    const suggestions = response.zeroResults
      ? zeroResultSuggestions().map((result) => localizeResult(result, t, Boolean(user?.id)))
      : []

    setSnapshot((prev) => ({
      ...prev,
      query: '',
      results: localized,
      reply,
      message: '',
      followUp,
      suggestions,
      error: false,
      hasSearched: true,
      preview: null,
      aiAnswer: null,
      apiResponse: null,
      apiEmpty: false,
      lastSuccessfulQuery: q,
      remoteError: options?.keepRemoteError ?? null,
      messages: patchMessage(prev.messages, assistantId, {
        status: options?.keepRemoteError ? 'complete' : 'complete',
        text: options?.keepRemoteError
          ? `${options.keepRemoteError} ${formatLocalLead(reply, t)}`.trim()
          : formatLocalLead(reply, t),
        localResults: localized.length ? localized : undefined,
        suggestions: suggestions.length ? suggestions : undefined,
        response: undefined,
        empty: response.zeroResults,
        errorText: undefined,
      }),
    }))

    if (canAttemptAiChat() && !apiReady && shouldAttemptAiAnswer(q, localized)) {
      const controller = new AbortController()
      aiAbortRef.current = controller
      setSnapshot({ aiAnswer: { status: 'thinking' } })
      try {
        const chat = await postAiChat(
          {
            message: q,
            language: uiLocale === 'am' ? 'am' : 'en',
            context: { page: typeof window !== 'undefined' ? window.location.pathname : '/' },
          },
          controller.signal,
        )
        if (requestId !== requestIdRef.current) return
        const answer = (chat.answer || '').trim()
        if (!answer) {
          setSnapshot({ aiAnswer: null })
          return
        }
        setSnapshot({
          aiAnswer: {
            status: 'success',
            answer,
            sources: Array.isArray(chat.sources) ? chat.sources : undefined,
          },
        })
        setSnapshot((prev) => ({
          ...prev,
          messages: patchMessage(prev.messages, assistantId, {
            text: answer,
          }),
        }))
      } catch (aiErr) {
        if (requestId !== requestIdRef.current) return
        const notice = friendlyAiError(aiErr)
        setSnapshot({
          aiAnswer: notice ? { status: 'unavailable', notice } : null,
          remoteError: notice || null,
        })
      } finally {
        if (aiAbortRef.current === controller) aiAbortRef.current = null
      }
    }
  }

  async function runSearch(raw: string) {
    const q = raw.trim()
    if (!q || busy) return
    const requestId = ++requestIdRef.current
    cancelAiRequest()
    setBusy(true)
    stickToBottomRef.current = true

    const userMsg: ChatMessage = {
      id: createChatMessageId(),
      role: 'user',
      createdAt: Date.now(),
      text: q,
      status: 'complete',
    }
    const assistantId = createChatMessageId()
    const assistantMsg: ChatMessage = {
      id: assistantId,
      role: 'assistant',
      createdAt: Date.now(),
      status: 'sending',
      text: t('searchBuddy.lookingUp'),
    }

    setSnapshot((prev) => ({
      ...prev,
      query: '',
      error: false,
      hasSearched: true,
      showAll: false,
      preview: null,
      reply: { kind: 'searching' },
      message: '',
      resultsScrollTop: 0,
      aiAnswer: null,
      remoteError: null,
      messages: [...prev.messages, userMsg, assistantMsg],
    }))

    window.setTimeout(() => inputRef.current?.focus(), 0)

    try {
      if (apiReady) {
        const controller = new AbortController()
        aiAbortRef.current = controller
        try {
          // Display history stays local; API payload remains { message } only.
          const { response, empty } = await sendSearchBuddyMessage(q, controller.signal)
          if (requestId !== requestIdRef.current) return
          const lead = assistantLeadForResponse(response, empty)
          setSnapshot((prev) => ({
            ...prev,
            query: '',
            results: [],
            suggestions: [],
            reply: empty ? { kind: 'zero' } : { kind: 'generic' },
            message: '',
            followUp: null,
            error: false,
            hasSearched: true,
            preview: null,
            aiAnswer: null,
            apiResponse: response,
            apiEmpty: empty,
            lastSuccessfulQuery: q,
            remoteError: null,
            messages: patchMessage(prev.messages, assistantId, {
              status: 'complete',
              text: lead,
              response,
              empty,
              localResults: undefined,
              suggestions: undefined,
              errorText: undefined,
            }),
          }))
          return
        } catch (apiErr) {
          if (requestId !== requestIdRef.current) return
          const notice =
            searchBuddyErrorMessage(apiErr) || t('searchBuddy.reachError')
          try {
            await runLocalSearch(q, requestId, assistantId, { keepRemoteError: notice })
            return
          } catch {
            setSnapshot((prev) => ({
              ...prev,
              error: false,
              reply: { kind: 'unavailable' },
              message: notice,
              remoteError: notice,
              aiAnswer: null,
              messages: patchMessage(prev.messages, assistantId, {
                status: 'error',
                text: undefined,
                errorText: notice,
              }),
            }))
            return
          }
        } finally {
          if (aiAbortRef.current === controller) aiAbortRef.current = null
        }
      }

      await runLocalSearch(q, requestId, assistantId)
    } catch {
      if (requestId !== requestIdRef.current) return
      const notice = t('searchBuddy.reachError')
      setSnapshot((prev) => ({
        ...prev,
        error: true,
        reply: { kind: 'unavailable' },
        message: notice,
        remoteError: notice,
        aiAnswer: null,
        messages: patchMessage(prev.messages, assistantId, {
          status: 'error',
          errorText: notice,
        }),
      }))
    } finally {
      if (requestId === requestIdRef.current) setBusy(false)
    }
  }

  function resetSession() {
    cancelAiRequest()
    requestIdRef.current += 1
    setBusy(false)
    setVoiceRemountKey((k) => k + 1)
    stickToBottomRef.current = true
    clearSession()
    window.setTimeout(() => inputRef.current?.focus(), 0)
  }

  function openPreview(result: SiteSearchResult) {
    if (bodyRef.current) persistScroll(bodyRef.current.scrollTop)
    setSnapshot({ preview: result })
  }

  function backToResults() {
    setSnapshot({ preview: null })
    restoreScrollPending.current = true
    window.setTimeout(() => {
      if (bodyRef.current) {
        bodyRef.current.scrollTop = resultsScrollTop
        restoreScrollPending.current = false
      }
      inputRef.current?.focus()
    }, 40)
  }

  function openFullPage(result: SiteSearchResult) {
    if (bodyRef.current && !preview) persistScroll(bodyRef.current.scrollTop)
    setSnapshot({ preview: null })
    setOpen(false)
    navigate(result.route, { state: { fromSearchBuddy: true } })
  }

  function handleResultOpen(result: SiteSearchResult) {
    if (isSynaxariumResult(result)) {
      openPreview(result)
      return
    }
    if (bodyRef.current) persistScroll(bodyRef.current.scrollTop)
    setOpen(false)
  }

  const liveStatus = busy ? t('searchBuddy.lookingUp') : ''

  const panel =
    open &&
    createPortal(
      <div className={styles.root}>
        <div
          className={styles.backdrop}
          aria-hidden="true"
          onClick={() => setOpen(false)}
        />
        <section
          ref={panelRef}
          className={styles.panel}
          role="dialog"
          aria-modal="true"
          aria-labelledby={preview ? previewTitleId : titleId}
          aria-describedby={showWelcome ? welcomeId : undefined}
          aria-busy={busy || undefined}
        >
          <header className={styles.header}>
            <div className={styles.headerCopy}>
              {preview ? (
                <>
                  <h2 id={previewTitleId}>{t('searchBuddy.previewTitle')}</h2>
                  <p>{t('searchBuddy.previewSubtitle')}</p>
                </>
              ) : (
                <>
                  <h2 id={titleId}>{t('searchBuddy.title')}</h2>
                  <p>{t('searchBuddy.subtitle')}</p>
                </>
              )}
            </div>
            <div className={styles.headerActions}>
              {!preview && messages.length > 0 ? (
                <button
                  type="button"
                  className={styles.newChat}
                  onClick={resetSession}
                  aria-label={t('searchBuddy.newChatAria')}
                >
                  {t('searchBuddy.newChat')}
                </button>
              ) : null}
              <button
                ref={closeRef}
                type="button"
                className={styles.close}
                aria-label={t('searchBuddy.close')}
                onClick={() => setOpen(false)}
              >
                ×
              </button>
            </div>
          </header>

          {preview ? (
            <div ref={bodyRef} className={styles.body}>
              <SynaxariumPreview
                result={preview}
                backRef={backToResultsRef}
                onBack={backToResults}
                onOpenFull={() => openFullPage(preview)}
              />
            </div>
          ) : (
            <>
              {devApiNotice && !apiReady ? (
                <p className={styles.devNotice} role="status">
                  {devApiNotice}
                </p>
              ) : null}

              {showWelcome ? (
                <div className={styles.body}>
                  <ChatStarterPrompts
                    welcomeId={welcomeId}
                    title={t('searchBuddy.welcomeTitle')}
                    copy={t('searchBuddy.welcomeCopy')}
                    groupAria={t('searchBuddy.suggestionsAria')}
                    prompts={CHAT_STARTER_PROMPTS}
                    disabled={busy}
                    onSelect={(prompt) => void runSearch(prompt)}
                  />
                </div>
              ) : (
                <ChatThread
                  messages={messages}
                  bodyRef={bodyRef}
                  onBodyScroll={onBodyScroll}
                  stickToBottomRef={stickToBottomRef}
                  lookingUpLabel={t('searchBuddy.lookingUp')}
                  onOpenResult={handleResultOpen}
                  onPreviewResult={openPreview}
                  isSynaxariumResult={isSynaxariumResult}
                  showAllLocal={showAll}
                  onShowAllLocal={() => setSnapshot({ showAll: true })}
                  seeMoreLabel={(count) => t('searchBuddy.seeMore', { count })}
                  initialLocalCount={INITIAL_RESULT_COUNT}
                  liveStatus={liveStatus}
                />
              )}

              <ChatComposer
                value={query}
                onChange={(next) => setSnapshot({ query: next })}
                onSubmit={() => void runSearch(query)}
                busy={busy}
                voiceActive={open && !preview}
                voiceRemountKey={voiceRemountKey}
                inputRef={inputRef}
                placeholder={t('searchBuddy.placeholder')}
                inputAria={t('searchBuddy.inputAria')}
                sendLabel={t('searchBuddy.send')}
                sendBusyLabel={t('searchBuddy.sendBusy')}
                clearLabel={t('searchBuddy.clearInput')}
              />
            </>
          )}
        </section>
      </div>,
      document.body,
    )

  return (
    <>
      <button
        ref={fabRef}
        type="button"
        className={styles.fab}
        aria-label={t('searchBuddy.fabAria')}
        aria-haspopup="dialog"
        aria-expanded={open}
        tabIndex={open ? -1 : 0}
        onClick={() => setOpen(true)}
      >
        <span className={styles.fabIcon} aria-hidden>
          ⌕
        </span>
        <span className={styles.fabLabel}>{t('searchBuddy.fab')}</span>
      </button>
      {panel}
    </>
  )
}

function SynaxariumPreview({
  result,
  backRef,
  onBack,
  onOpenFull,
}: {
  result: SiteSearchResult
  backRef: RefObject<HTMLButtonElement | null>
  onBack: () => void
  onOpenFull: () => void
}) {
  const t = useTranslation()
  const image = result.imagePath ? resolveContentMediaUrl(result.imagePath) : ''
  const dateLine = result.dateLabel || result.description
  const excerpt = result.excerpt?.trim() || ''
  const source = result.sourceLabel || 'Synaxarium'

  return (
    <div className={styles.preview}>
      <button
        ref={backRef}
        type="button"
        className={styles.backToResults}
        onClick={onBack}
      >
        {t('searchBuddy.backToResults')}
      </button>

      {image ? (
        <img className={styles.previewArt} src={image} alt="" loading="lazy" />
      ) : null}

      <p className={styles.cardType}>{t('searchBuddy.types.synaxarium')}</p>
      {result.titleAmharic ? (
        <p className={styles.cardAm} lang="am">
          {result.titleAmharic}
        </p>
      ) : null}
      <h3 className={styles.previewTitleText}>{result.title}</h3>
      {dateLine ? <p className={styles.previewDate}>{dateLine}</p> : null}
      {excerpt ? <p className={styles.previewExcerpt}>{excerpt}</p> : null}
      <p className={styles.previewSource}>
        {t('searchBuddy.source')}: {source}
      </p>

      <div className={styles.previewActions}>
        <button type="button" className={styles.primaryAction} onClick={onOpenFull}>
          {t('searchBuddy.openFullPage')}
        </button>
      </div>
    </div>
  )
}
