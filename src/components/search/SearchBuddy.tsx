import {
  useEffect,
  useId,
  useRef,
  useState,
  type FormEvent,
  type RefObject,
} from 'react'
import { createPortal } from 'react-dom'
import { useNavigate } from 'react-router-dom'
import { useTranslation } from '../../i18n'
import { useLocale } from '../../lib/i18n/locale'
import { useAuth } from '../../lib/auth/useAuth'
import { canAttemptAiChat, friendlyAiError, postAiChat } from '../../lib/ai'
import { shouldAttemptAiAnswer } from '../../lib/search/aiRouting'
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
import { MezmurVoiceSearch } from './MezmurVoiceSearch'
import { SearchResultCard } from './SearchResultCard'
import { SearchBuddyResults } from './results/SearchBuddyResults'
import styles from './SearchBuddy.module.css'

/** Compact empty-state examples the FastAPI backend already understands. */
const API_EXAMPLE_QUERIES = [
  'John 3:16',
  'Calendar today',
  'Fasting today',
  'Search hymns for Gena',
  "Today's Synaxarium",
  'Morning prayers',
] as const

const LOCAL_STARTER_KEYS = [
  { key: 'meskel', query: 'Find Meskel hymns' },
  { key: 'learnPray', query: 'Learn how to pray' },
  { key: 'zemari', query: 'Find a Zemari' },
  { key: 'synaxarium', query: "today's Synaxarium" },
  { key: 'fasting', query: 'Show fasting information' },
  { key: 'calendar', query: 'Open Calendar' },
] as const

const FOCUSABLE =
  'a[href], button:not([disabled]), input:not([disabled]), [tabindex]:not([tabindex="-1"])'

function getFocusableIn(container: HTMLElement | null): HTMLElement[] {
  if (!container) return []
  return Array.from(container.querySelectorAll<HTMLElement>(FOCUSABLE)).filter(
    (el) => !el.hasAttribute('disabled') && el.getAttribute('aria-hidden') !== 'true',
  )
}

/** Day/commemoration hits only — not the Synaxarium hub page. */
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

function formatReply(
  reply: SearchBuddyReply | null,
  t: (key: string, params?: Record<string, string | number>) => string,
  fallbackMessage: string,
): string {
  if (!reply) return fallbackMessage
  const withPartial = (msg: string, partial?: boolean) =>
    partial ? `${msg} ${t('searchBuddy.partial')}` : msg
  switch (reply.kind) {
    case 'searching':
      return ''
    case 'unavailable':
      return t('searchBuddy.unavailable')
    case 'zero':
      return t('searchBuddy.zero')
    case 'favorites':
      return t('searchBuddy.favoritesMessage')
    case 'opening':
      return t('searchBuddy.opening', { title: reply.title })
    case 'foundOne':
      return withPartial(t('searchBuddy.foundOne', { title: reply.title }), reply.partial)
    case 'foundMany':
      return withPartial(t('searchBuddy.foundMany', { count: reply.count }), reply.partial)
    case 'generic':
      return ''
    default:
      return fallbackMessage
  }
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
  const requestIdRef = useRef(0)
  const aiAbortRef = useRef<AbortController | null>(null)
  const titleId = useId()
  const previewTitleId = useId()
  const welcomeId = useId()
  const inputId = useId()
  const inputRef = useRef<HTMLInputElement>(null)
  const closeRef = useRef<HTMLButtonElement>(null)
  const panelRef = useRef<HTMLElement>(null)
  const bodyRef = useRef<HTMLDivElement>(null)
  const fabRef = useRef<HTMLButtonElement>(null)
  const backToResultsRef = useRef<HTMLButtonElement>(null)
  const restoreScrollPending = useRef(false)

  const apiReady = searchBuddyApiReady()
  const devApiNotice = missingApiUrlDevMessage()

  const {
    query,
    results,
    suggestions,
    message,
    reply,
    hasSearched,
    showAll,
    preview,
    error,
    resultsScrollTop,
    aiAnswer,
    apiResponse,
    apiEmpty,
    lastSuccessfulQuery,
    remoteError,
  } = snapshot

  function cancelAiRequest() {
    if (aiAbortRef.current) {
      aiAbortRef.current.abort()
      aiAbortRef.current = null
    }
  }

  const showWelcome = !hasSearched && !busy && !preview
  const showApiResults = Boolean(apiResponse) && !preview
  const showLocalResults = !showApiResults && results.length > 0 && !preview
  const submittedQuery = (lastSuccessfulQuery || query).trim()

  const statusMessage = error
    ? message || t('searchBuddy.unavailable')
    : showWelcome
      ? ''
      : apiResponse
        ? apiEmpty
          ? t('searchBuddy.zero')
          : ''
        : formatReply(reply, t, message || '')

  const visibleResults = showAll ? results : results.slice(0, INITIAL_RESULT_COUNT)
  const hasMore = results.length > INITIAL_RESULT_COUNT && !showAll
  const exampleQueries = apiReady
    ? API_EXAMPLE_QUERIES
    : LOCAL_STARTER_KEYS.map((starter) => starter.query)

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
    persistScroll(bodyRef.current.scrollTop)
  }

  async function runLocalSearch(q: string, requestId: number, options?: { keepRemoteError?: string }) {
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
    setSnapshot({
      query: q,
      results: localized,
      reply: replyFromResponse({ ...response, results: localized }),
      message: '',
      followUp,
      suggestions: response.zeroResults
        ? zeroResultSuggestions().map((result) =>
            localizeResult(result, t, Boolean(user?.id)),
          )
        : [],
      error: false,
      hasSearched: true,
      preview: null,
      aiAnswer: null,
      apiResponse: null,
      apiEmpty: false,
      lastSuccessfulQuery: q,
      remoteError: options?.keepRemoteError ?? null,
    })

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
    // Keep prior successful results visible while the new request loads.
    setSnapshot({
      query: q,
      error: false,
      hasSearched: true,
      showAll: false,
      preview: null,
      reply: { kind: 'searching' },
      message: '',
      resultsScrollTop: 0,
      aiAnswer: null,
      remoteError: null,
    })

    try {
      if (apiReady) {
        const controller = new AbortController()
        aiAbortRef.current = controller
        try {
          const { response, empty } = await sendSearchBuddyMessage(q, controller.signal)
          if (requestId !== requestIdRef.current) return
          setSnapshot({
            query: q,
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
          })
          return
        } catch (apiErr) {
          if (requestId !== requestIdRef.current) return
          const notice = searchBuddyErrorMessage(apiErr)
          if (!notice) return
          try {
            await runLocalSearch(q, requestId, { keepRemoteError: notice })
            return
          } catch {
            // Preserve any prior deterministic results; only mark remote failure.
            setSnapshot({
              error: false,
              reply: results.length || apiResponse ? { kind: 'generic' } : { kind: 'unavailable' },
              message: notice,
              remoteError: notice,
              aiAnswer: null,
            })
            return
          }
        } finally {
          if (aiAbortRef.current === controller) aiAbortRef.current = null
        }
      }

      await runLocalSearch(q, requestId)
    } catch {
      if (requestId !== requestIdRef.current) return
      setSnapshot({
        error: true,
        reply: { kind: 'unavailable' },
        message: t('searchBuddy.unavailable'),
        remoteError: t('searchBuddy.unavailable'),
        aiAnswer: null,
      })
    } finally {
      if (requestId === requestIdRef.current) setBusy(false)
    }
  }

  function onSubmit(e: FormEvent) {
    e.preventDefault()
    void runSearch(query)
  }

  function clearQuery() {
    setSnapshot({ query: '' })
    inputRef.current?.focus()
  }

  function resetSession() {
    cancelAiRequest()
    clearSession()
    setBusy(false)
    inputRef.current?.focus()
  }

  function retryLast() {
    const q = (lastSuccessfulQuery || query).trim()
    if (q) void runSearch(q)
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
            <button
              ref={closeRef}
              type="button"
              className={styles.close}
              aria-label={t('searchBuddy.close')}
              onClick={() => setOpen(false)}
            >
              ×
            </button>
          </header>

          {!preview ? (
            <div className={styles.composer}>
              <form className={styles.form} onSubmit={onSubmit} role="search">
                <label className={styles.srOnly} htmlFor={inputId}>
                  {t('searchBuddy.inputAria')}
                </label>
                <div className={styles.composerField}>
                  <span className={styles.composerIcon} aria-hidden>
                    ⌕
                  </span>
                  <input
                    id={inputId}
                    ref={inputRef}
                    value={query}
                    onChange={(e) => setSnapshot({ query: e.target.value })}
                    placeholder={t('searchBuddy.placeholder')}
                    autoComplete="off"
                    enterKeyHint="search"
                    disabled={busy}
                    spellCheck={false}
                  />
                  {query ? (
                    <button
                      type="button"
                      className={styles.clearInput}
                      aria-label={t('searchBuddy.clearInput')}
                      onClick={clearQuery}
                      disabled={busy}
                    >
                      ×
                    </button>
                  ) : null}
                </div>
                <button
                  type="submit"
                  className={styles.submitBtn}
                  disabled={busy || !query.trim()}
                  aria-label={t('searchBuddy.find')}
                >
                  {busy ? t('searchBuddy.findBusy') : t('searchBuddy.find')}
                </button>
              </form>
              <div className={styles.composerTools}>
                <MezmurVoiceSearch
                  compact
                  active={open && !preview && !busy}
                  onTranscript={(text) => {
                    setSnapshot({ query: text })
                  }}
                />
              </div>
            </div>
          ) : null}

          <div ref={bodyRef} className={styles.body} onScroll={onBodyScroll}>
            {preview ? (
              <SynaxariumPreview
                result={preview}
                backRef={backToResultsRef}
                onBack={backToResults}
                onOpenFull={() => openFullPage(preview)}
              />
            ) : (
              <>
                {devApiNotice && !apiReady ? (
                  <p className={styles.devNotice} role="status">
                    {devApiNotice}
                  </p>
                ) : null}

                {showWelcome ? (
                  <div className={styles.welcome} id={welcomeId}>
                    <p className={styles.welcomeTitle}>{t('searchBuddy.welcomeTitle')}</p>
                    <p className={styles.welcomeCopy}>{t('searchBuddy.welcomeCopy')}</p>
                    <div className={styles.suggestions} role="group" aria-label={t('searchBuddy.suggestionsAria')}>
                      {exampleQueries.map((example) => {
                        const localKey = LOCAL_STARTER_KEYS.find((s) => s.query === example)?.key
                        return (
                          <button
                            key={example}
                            type="button"
                            className={styles.chip}
                            disabled={busy}
                            onClick={() => {
                              setSnapshot({ query: example })
                              void runSearch(example)
                            }}
                          >
                            {apiReady || !localKey
                              ? example
                              : t(`searchBuddy.starters.${localKey}`)}
                          </button>
                        )
                      })}
                    </div>
                  </div>
                ) : null}

                {hasSearched ? (
                  <div className={styles.sessionBar}>
                    <button
                      type="button"
                      className={styles.sessionClear}
                      onClick={resetSession}
                    >
                      {t('searchBuddy.clearSession')}
                    </button>
                  </div>
                ) : null}

                {busy ? (
                  <div className={styles.loading} role="status" aria-live="polite">
                    <span className={styles.loadingDots} aria-hidden>
                      <span />
                      <span />
                      <span />
                    </span>
                    <p className={styles.loadingText}>{t('searchBuddy.searching')}</p>
                  </div>
                ) : null}

                {remoteError ? (
                  <div className={styles.errorCard} role="alert">
                    <p className={styles.errorText}>{remoteError}</p>
                    <button
                      type="button"
                      className={styles.retryBtn}
                      onClick={retryLast}
                      disabled={busy || !(lastSuccessfulQuery || query).trim()}
                    >
                      {t('searchBuddy.retry')}
                    </button>
                  </div>
                ) : null}

                {statusMessage ? (
                  <p className={styles.message} role="status" aria-live="polite">
                    {statusMessage}
                  </p>
                ) : null}

                {aiAnswer?.status === 'thinking' ? (
                  <p className={styles.aiNotice} role="status">
                    {t('searchBuddy.aiThinking')}
                  </p>
                ) : null}

                {aiAnswer?.status === 'success' && aiAnswer.answer ? (
                  <div className={styles.aiAnswer} aria-live="polite">
                    <p className={styles.aiAnswerLabel}>{t('searchBuddy.aiAnswerLabel')}</p>
                    <p className={styles.aiAnswerText}>{aiAnswer.answer}</p>
                    {aiAnswer.sources?.length ? (
                      <ul className={styles.aiSources}>
                        {aiAnswer.sources.map((source, index) => (
                          <li key={source.id || `${source.title}-${index}`}>
                            {source.url ? (
                              <a href={source.url} target="_blank" rel="noreferrer">
                                {source.title}
                              </a>
                            ) : (
                              <span>{source.title}</span>
                            )}
                            {source.excerpt ? (
                              <span className={styles.aiSourceExcerpt}> — {source.excerpt}</span>
                            ) : null}
                          </li>
                        ))}
                      </ul>
                    ) : null}
                  </div>
                ) : null}

                {!busy && hasSearched && submittedQuery && (showApiResults || showLocalResults || apiEmpty) ? (
                  <p className={styles.queryLabel}>
                    <span className={styles.queryLabelPrefix}>{t('searchBuddy.youAsked')}</span>{' '}
                    <span className={styles.queryLabelText}>{submittedQuery}</span>
                  </p>
                ) : null}

                {showApiResults ? (
                  <div className={styles.results} aria-live="polite">
                    <SearchBuddyResults response={apiResponse} empty={apiEmpty} />
                  </div>
                ) : null}

                {showLocalResults ? (
                  <div className={styles.results} aria-live="polite">
                    {visibleResults.map((result) => (
                      <SearchResultCard
                        key={`${result.sourceType}:${result.sourceId}:${result.route}`}
                        result={result}
                        preferPreview={isSynaxariumResult(result)}
                        onOpen={() => handleResultOpen(result)}
                        onPreview={
                          isSynaxariumResult(result) ? () => openPreview(result) : undefined
                        }
                      />
                    ))}
                  </div>
                ) : null}

                {showLocalResults && hasMore ? (
                  <button
                    type="button"
                    className={styles.seeMore}
                    onClick={() => setSnapshot({ showAll: true })}
                  >
                    {t('searchBuddy.seeMore', { count: results.length - INITIAL_RESULT_COUNT })}
                  </button>
                ) : null}

                {!busy && hasSearched && !results.length && !apiResponse && suggestions.length ? (
                  <div className={styles.nearby}>
                    <p className={styles.nearbyLabel}>{t('searchBuddy.tryNearby')}</p>
                    <div className={styles.results}>
                      {suggestions.map((result) => (
                        <SearchResultCard
                          key={`suggest:${result.sourceType}:${result.route}`}
                          result={result}
                          onOpen={() => {
                            if (bodyRef.current) persistScroll(bodyRef.current.scrollTop)
                            setOpen(false)
                          }}
                        />
                      ))}
                    </div>
                  </div>
                ) : null}

                {!busy && hasSearched && apiEmpty ? (
                  <div className={styles.suggestions}>
                    {API_EXAMPLE_QUERIES.slice(0, 4).map((example) => (
                      <button
                        key={`retry:${example}`}
                        type="button"
                        className={styles.chip}
                        onClick={() => {
                          setSnapshot({ query: example })
                          void runSearch(example)
                        }}
                      >
                        {example}
                      </button>
                    ))}
                  </div>
                ) : null}
              </>
            )}
          </div>
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
