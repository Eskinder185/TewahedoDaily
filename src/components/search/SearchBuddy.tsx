import { useCallback, useEffect, useId, useRef, useState } from 'react'
import { createPortal } from 'react-dom'
import { useTranslation } from '../../i18n'
import { useLocale } from '../../lib/i18n/locale'
import { useSearchBuddy } from '../../lib/search/searchBuddySession'
import {
  FAITH_AND_ORDER_QUERY_MAX,
  FaithAndOrderQueryError,
  searchFaithAndOrder,
} from '../../lib/searchBuddy/faithAndOrderSearch.ts'
import {
  isSearchBuddyAbort,
  logSearchBuddyDiagnostic,
  searchBuddyRetryAfterSeconds,
  searchBuddyUserNotice,
} from '../../lib/searchBuddy/errorMessages.ts'
import { isAiApiConfigured } from '../../lib/ai/aiConfig.ts'
import { searchSite } from '../../lib/search/searchSite'
import { shouldSearchFaithAndOrder, type TeachingTopic } from '../../lib/searchBuddy/teachingTopics.ts'
import {
  pendingFromResult,
  resolveCalendarQuestion,
} from '../../lib/searchBuddy/calendarQuestion.ts'
import {
  parseQuestion,
  type PendingClarification,
} from '../../lib/searchBuddy/questionParse.ts'
import { ChatComposer } from './ChatComposer'
import { ChatStarterPrompts } from './ChatStarterPrompts'
import { CalendarAnswerPane, type CalendarOutcome } from './CalendarAnswerPane'
import { SourcePassagePane, type DocumentOutcome } from './SourcePassageCard'
import { WebsiteSearchPane, type WebsiteOutcome } from './WebsiteSearchResults'
import styles from './SearchBuddy.module.css'

const FOCUSABLE =
  'a[href], button:not([disabled]), textarea:not([disabled]), input:not([disabled]), [tabindex]:not([tabindex="-1"])'

const EXAMPLE_KEYS = [
  'searchBuddy.prompts.gena',
  'searchBuddy.prompts.prayer',
  'searchBuddy.prompts.john',
  'searchBuddy.starters.calendar',
  'searchBuddy.prompts.sacraments',
] as const

function getFocusableIn(container: HTMLElement | null): HTMLElement[] {
  if (!container) return []
  return Array.from(container.querySelectorAll<HTMLElement>(FOCUSABLE)).filter(
    (el) => !el.hasAttribute('disabled') && el.getAttribute('aria-hidden') !== 'true',
  )
}

function isQueryTooLong(error: unknown): error is FaithAndOrderQueryError {
  return (
    error instanceof FaithAndOrderQueryError ||
    (typeof error === 'object' &&
      error !== null &&
      (error as { name?: string }).name === 'FaithAndOrderQueryError' &&
      (error as { code?: string }).code === 'too_long')
  )
}

export function SearchBuddy() {
  const t = useTranslation()
  const { uiLocale } = useLocale()
  const { open, setOpen, snapshot, setSnapshot, clearSession } = useSearchBuddy()

  const [draft, setDraft] = useState('')
  const [documentOutcome, setDocumentOutcome] = useState<DocumentOutcome>({ kind: 'idle' })
  const [websiteOutcome, setWebsiteOutcome] = useState<WebsiteOutcome>({ kind: 'idle' })
  const [calendarOutcome, setCalendarOutcome] = useState<CalendarOutcome>({ kind: 'idle' })
  const [pendingClarification, setPendingClarification] = useState<PendingClarification | null>(null)
  const draftRef = useRef(draft)
  const websiteRequestRef = useRef(0)
  const documentRequestRef = useRef(0)
  const websiteAbortRef = useRef<AbortController | null>(null)
  const documentAbortRef = useRef<AbortController | null>(null)
  const [voiceRemountKey, setVoiceRemountKey] = useState(0)
  const titleId = useId()
  const limitId = useId()
  const welcomeId = useId()
  const inputRef = useRef<HTMLTextAreaElement>(null)
  const panelRef = useRef<HTMLElement>(null)
  const bodyRef = useRef<HTMLDivElement>(null)
  const fabRef = useRef<HTMLButtonElement>(null)
  const openRef = useRef(open)
  openRef.current = open

  const apiReady = isAiApiConfigured()
  const overLimit = draft.trim().length > FAITH_AND_ORDER_QUERY_MAX
  const busy = websiteOutcome.kind === 'loading' || documentOutcome.kind === 'loading'
  const showWelcome =
    websiteOutcome.kind === 'idle' && documentOutcome.kind === 'idle' && calendarOutcome.kind === 'idle'
  const activeQuery =
    (calendarOutcome.kind !== 'idle' ? calendarOutcome.query : null) ||
    (websiteOutcome.kind !== 'idle' ? websiteOutcome.query : null) ||
    (documentOutcome.kind !== 'idle' ? documentOutcome.query : null)

  useEffect(() => {
    draftRef.current = draft
  }, [draft])

  useEffect(() => {
    setSnapshot((prev) => {
      if (
        !prev.messages.length &&
        !prev.aiAnswer &&
        !prev.apiResponse &&
        !prev.results.length &&
        !prev.suggestions.length &&
        !prev.preview &&
        !prev.followUp
      ) {
        return prev
      }
      return {
        ...prev,
        messages: [],
        aiAnswer: null,
        apiResponse: null,
        results: [],
        suggestions: [],
        preview: null,
        followUp: null,
        reply: null,
        remoteError: null,
        message: '',
        error: false,
      }
    })
  }, [setSnapshot])

  const closePanel = useCallback(() => {
    const nextDraft = draftRef.current
    setSnapshot((prev) => (prev.query === nextDraft ? prev : { ...prev, query: nextDraft }))
    setOpen(false)
  }, [setOpen, setSnapshot])

  const wasOpenRef = useRef(open)
  useEffect(() => {
    if (open && !wasOpenRef.current) setDraft(snapshot.query)
    wasOpenRef.current = open
  }, [open, snapshot.query])

  function cancelSearch() {
    websiteRequestRef.current += 1
    documentRequestRef.current += 1
    websiteAbortRef.current?.abort()
    documentAbortRef.current?.abort()
    websiteAbortRef.current = null
    documentAbortRef.current = null
    setWebsiteOutcome((prev) => (prev.kind === 'loading' ? { kind: 'idle' } : prev))
    setDocumentOutcome((prev) => (prev.kind === 'loading' ? { kind: 'idle' } : prev))
    if (calendarOutcome.kind !== 'idle' && calendarOutcome.result.kind !== 'clarify' && calendarOutcome.result.kind !== 'suggest') {
      setCalendarOutcome({ kind: 'idle' })
    }
    window.setTimeout(() => inputRef.current?.focus(), 0)
  }

  useEffect(() => {
    if (!open) return
    const fab = fabRef.current
    const mainEl = document.getElementById('main')
    const inertTargets = [mainEl].filter(Boolean) as HTMLElement[]
    for (const el of inertTargets) el.setAttribute('inert', '')

    const timer = window.setTimeout(() => {
      inputRef.current?.focus()
    }, 40)

    const trapTab = (event: KeyboardEvent) => {
      if (event.key === 'Escape') {
        event.preventDefault()
        closePanel()
        return
      }
      if (event.key !== 'Tab' || !panelRef.current) return
      const nodes = getFocusableIn(panelRef.current)
      if (nodes.length === 0) return
      const first = nodes[0]
      const last = nodes[nodes.length - 1]
      const active = document.activeElement as HTMLElement | null
      if (event.shiftKey) {
        if (!active || active === first || !panelRef.current.contains(active)) {
          event.preventDefault()
          last.focus()
        }
      } else if (!active || active === last || !panelRef.current.contains(active)) {
        event.preventDefault()
        first.focus()
      }
    }

    const onFocusIn = (event: FocusEvent) => {
      if (!panelRef.current) return
      const target = event.target as Node | null
      if (target && panelRef.current.contains(target)) return
      if (target === fabRef.current) {
        event.preventDefault()
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
      if (!openRef.current) fab?.focus()
    }
  }, [open, closePanel])

  useEffect(() => {
    if (!open) {
      websiteAbortRef.current?.abort()
      documentAbortRef.current?.abort()
      websiteAbortRef.current = null
      documentAbortRef.current = null
    }
    return () => {
      websiteAbortRef.current?.abort()
      documentAbortRef.current?.abort()
    }
  }, [open])

  function startWebsiteSearch(query: string) {
    const requestId = ++websiteRequestRef.current
    websiteAbortRef.current?.abort()
    const controller = new AbortController()
    websiteAbortRef.current = controller
    setWebsiteOutcome({ kind: 'loading', query })
    void searchSite(query, {
      limit: 8,
      language: uiLocale === 'am' ? 'am' : 'en',
      signal: controller.signal,
    })
      .then((response) => {
        if (requestId !== websiteRequestRef.current) return
        if (response.failed) {
          setWebsiteOutcome({
            kind: 'error',
            query,
            notice: t('searchBuddy.website.catalogFailed'),
            response,
          })
          return
        }
        setWebsiteOutcome(
          response.results.length === 0
            ? { kind: 'empty', query, response }
            : { kind: 'results', query, response },
        )
      })
      .catch((error) => {
        if (requestId !== websiteRequestRef.current) return
        if (isSearchBuddyAbort(error)) {
          setWebsiteOutcome((prev) => (prev.kind === 'loading' ? { kind: 'idle' } : prev))
          return
        }
        logSearchBuddyDiagnostic(error, 'website')
        const retrySeconds = searchBuddyRetryAfterSeconds(error)
        setWebsiteOutcome({
          kind: 'error',
          query,
          notice: searchBuddyUserNotice(error, uiLocale) || t('searchBuddy.errors.unknown'),
          retryAvailableAt:
            retrySeconds != null && retrySeconds > 0 ? Date.now() + retrySeconds * 1000 : undefined,
        })
      })
  }

  function startDocumentSearch(userQuery: string, topic: TeachingTopic) {
    const requestId = ++documentRequestRef.current
    documentAbortRef.current?.abort()
    const controller = new AbortController()
    documentAbortRef.current = controller
    if (!apiReady) {
      setDocumentOutcome({
        kind: 'error',
        query: userQuery,
        topic,
        notice: t('searchBuddy.errors.notConfigured'),
      })
      return
    }
    setDocumentOutcome({ kind: 'loading', query: userQuery, topic })
    void searchFaithAndOrder(topic.documentQuery, { signal: controller.signal, limit: 5 })
      .then((response) => {
        if (requestId !== documentRequestRef.current) return
        if (response.generated !== false || response.mode !== 'exact_document_search') {
          throw new Error('unexpected document mode')
        }
        setDocumentOutcome(
          response.status === 'no_matching_passage' || response.results.length === 0
            ? { kind: 'empty', query: userQuery, topic, response }
            : { kind: 'matches', query: userQuery, topic, response },
        )
      })
      .catch((error) => {
        if (requestId !== documentRequestRef.current) return
        if (isSearchBuddyAbort(error)) {
          setDocumentOutcome((prev) => (prev.kind === 'loading' ? { kind: 'idle' } : prev))
          return
        }
        if (isQueryTooLong(error)) return
        logSearchBuddyDiagnostic(error, 'faith-and-order')
        const retrySeconds = searchBuddyRetryAfterSeconds(error)
        setDocumentOutcome({
          kind: 'error',
          query: userQuery,
          topic,
          notice: searchBuddyUserNotice(error, uiLocale) || t('searchBuddy.errors.unknown'),
          retryAvailableAt:
            retrySeconds != null && retrySeconds > 0 ? Date.now() + retrySeconds * 1000 : undefined,
        })
      })
  }

  function runSearch(raw: string) {
    const query = raw.trim()
    if (!query || query.length > FAITH_AND_ORDER_QUERY_MAX) return
    setDraft('')
    const parsed = parseQuestion(query, { pending: pendingClarification })
    const followUpOnly = parsed.isFollowUp
    if (!followUpOnly) setPendingClarification(null)

    if (parsed.domain === 'calendar' && parsed.calendar) {
      const result = resolveCalendarQuestion(parsed)
      setCalendarOutcome({ kind: 'result', query: parsed.originalQuery, result })
      setPendingClarification(pendingFromResult(result))
    } else {
      setCalendarOutcome({ kind: 'idle' })
      setPendingClarification(null)
    }

    if (!followUpOnly) startWebsiteSearch(parsed.originalQuery)
    const topic = shouldSearchFaithAndOrder(parsed.originalQuery)
    if (topic) startDocumentSearch(parsed.originalQuery, topic)
    else {
      documentAbortRef.current?.abort()
      documentAbortRef.current = null
      documentRequestRef.current += 1
      setDocumentOutcome({ kind: 'idle' })
    }
  }

  function resetSearch() {
    cancelSearch()
    setDraft('')
    setWebsiteOutcome({ kind: 'idle' })
    setDocumentOutcome({ kind: 'idle' })
    setCalendarOutcome({ kind: 'idle' })
    setPendingClarification(null)
    setVoiceRemountKey((key) => key + 1)
    clearSession()
    window.setTimeout(() => inputRef.current?.focus(), 0)
  }

  const liveStatus = [
    websiteOutcome.kind === 'loading' ? t('searchBuddy.website.searching') : '',
    documentOutcome.kind === 'loading' ? t('searchBuddy.faith.searchingPassage') : '',
  ]
    .filter(Boolean)
    .join(' ')

  const panel =
    open &&
    createPortal(
      <div className={styles.root}>
        <div className={styles.backdrop} aria-hidden="true" onClick={closePanel} />
        <section
          ref={panelRef}
          className={styles.panel}
          role="dialog"
          aria-modal="true"
          aria-labelledby={titleId}
          aria-describedby={showWelcome ? welcomeId : undefined}
          aria-busy={busy || undefined}
        >
          <header className={styles.header}>
            <div className={styles.headerCopy}>
              <h2 id={titleId}>{t('searchBuddy.title')}</h2>
              <p>{t('searchBuddy.subtitle')}</p>
            </div>
            <div className={styles.headerActions}>
              {websiteOutcome.kind !== 'idle' || documentOutcome.kind !== 'idle' || calendarOutcome.kind !== 'idle' ? (
                <button
                  type="button"
                  className={styles.newChat}
                  onClick={resetSearch}
                  aria-label={t('searchBuddy.faith.newSearchAria')}
                >
                  {t('searchBuddy.faith.newSearch')}
                </button>
              ) : null}
              <button type="button" className={styles.close} aria-label={t('searchBuddy.close')} onClick={closePanel}>
                ×
              </button>
            </div>
          </header>

          <div ref={bodyRef} className={styles.body}>
            <p className={styles.srOnly} aria-live="polite">
              {liveStatus}
            </p>
            {showWelcome ? (
              <ChatStarterPrompts
                welcomeId={welcomeId}
                title={t('searchBuddy.welcomeTitle')}
                copy={t('searchBuddy.welcomeCopy')}
                groupAria={t('searchBuddy.suggestionsAria')}
                prompts={EXAMPLE_KEYS.map((key) => t(key))}
                onSelect={(prompt) => void runSearch(prompt)}
              />
            ) : (
              <div>
                {activeQuery ? (
                  <p className={styles.queryEcho}>
                    <span className={styles.queryLabelPrefix}>{t('searchBuddy.faith.queryLabel')}</span>{' '}
                    <span>{activeQuery}</span>
                  </p>
                ) : null}
                <CalendarAnswerPane
                  outcome={calendarOutcome}
                  onChoose={(optionId) => {
                    if (calendarOutcome.kind === 'result' && calendarOutcome.result.kind === 'suggest') {
                      const option = calendarOutcome.result.options.find((row) => row.id === optionId)
                      const label = option?.labelEn || optionId
                      void runSearch(
                        calendarOutcome.result.language === 'am'
                          ? `የ${option?.labelAm || label} በዓል መቼ ነው?`
                          : `When is ${label} feast?`,
                      )
                      return
                    }
                    void runSearch(optionId)
                  }}
                  onOpen={closePanel}
                />
                <WebsiteSearchPane
                  outcome={websiteOutcome}
                  onRetry={(query) => startWebsiteSearch(query)}
                  onOpen={closePanel}
                  hideQueryEcho
                />
                <SourcePassagePane
                  outcome={documentOutcome}
                  busy={documentOutcome.kind === 'loading'}
                  onRetry={(query, topic) => startDocumentSearch(query, topic)}
                />
              </div>
            )}
          </div>

          <ChatComposer
            leading={
              <>
                <p id={limitId} className={styles.queryMeter} aria-live="polite">
                  {t('searchBuddy.faith.overLimit', {
                    count: draft.trim().length,
                    max: FAITH_AND_ORDER_QUERY_MAX,
                  })}
                </p>
                {overLimit ? (
                  <p className={styles.limitNotice} role="alert">
                    {t('searchBuddy.questionTooLong', { max: FAITH_AND_ORDER_QUERY_MAX })}
                  </p>
                ) : null}
              </>
            }
            value={draft}
            onChange={setDraft}
            onSubmit={() => void runSearch(draft)}
            busy={busy}
            voiceActive={open}
            voiceRemountKey={voiceRemountKey}
            inputRef={inputRef}
            placeholder={t('searchBuddy.placeholder')}
            inputAria={t('searchBuddy.inputAria')}
            sendLabel={t('searchBuddy.send')}
            sendBusyLabel={t('searchBuddy.sendBusy')}
            clearLabel={t('searchBuddy.clearInput')}
            dictateAria={t('searchBuddy.dictateAria')}
            onCancel={busy ? cancelSearch : undefined}
            cancelLabel={t('searchBuddy.cancel')}
            cancelAria={t('searchBuddy.cancelAria')}
            describedBy={limitId}
            invalid={overLimit}
            submitDisabled={overLimit}
          />
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
