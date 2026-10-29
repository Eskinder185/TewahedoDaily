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
import { ChurchLibrarySources, type ChurchLibraryOutcome } from './ChurchLibrarySources'
import { ChurchLibrarySearchError, searchChurchLibrary } from '../../lib/searchBuddy/churchLibrarySearch'
import { listPopularChurchLibraryFaqs, searchChurchLibraryFaq, type ChurchLibraryFaqMatch } from '../../lib/searchBuddy/churchLibraryFaq'
import { ChurchLibraryFaqAnswer } from './ChurchLibraryFaqAnswer'
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

  const [draft, setDraft] = useState(() => snapshot.query)
  const [documentOutcome, setDocumentOutcome] = useState<DocumentOutcome>({ kind: 'idle' })
  const [libraryOutcome, setLibraryOutcome] = useState<ChurchLibraryOutcome>({ kind: 'idle' })
  const [faqMatch, setFaqMatch] = useState<ChurchLibraryFaqMatch | null>(null)
  const [popularFaqs, setPopularFaqs] = useState<Array<{ stableId: string; question: string }>>([])
  const faqContextRef = useRef<string | null>(null)
  const [websiteOutcome, setWebsiteOutcome] = useState<WebsiteOutcome>({ kind: 'idle' })
  const [calendarOutcome, setCalendarOutcome] = useState<CalendarOutcome>({ kind: 'idle' })
  const [pendingClarification, setPendingClarification] = useState<PendingClarification | null>(null)
  const [selectedDomain, setSelectedDomain] = useState<'all' | 'bible' | 'mezmur' | 'prayer' | 'calendar' | 'library'>('all')
  const draftRef = useRef(draft)
  const websiteRequestRef = useRef(0)
  const documentRequestRef = useRef(0)
  const libraryRequestRef = useRef(0)
  const websiteAbortRef = useRef<AbortController | null>(null)
  const documentAbortRef = useRef<AbortController | null>(null)
  const libraryAbortRef = useRef<AbortController | null>(null)
  const [voiceRemountKey, setVoiceRemountKey] = useState(0)
  const titleId = useId()
  const limitId = useId()
  const welcomeId = useId()
  const inputRef = useRef<HTMLTextAreaElement>(null)
  const panelRef = useRef<HTMLElement>(null)
  const bodyRef = useRef<HTMLDivElement>(null)
  const fabRef = useRef<HTMLButtonElement>(null)
  const prevOpenRef = useRef(open)

  useEffect(() => {
    if (prevOpenRef.current && !open) {
      window.setTimeout(() => {
        fabRef.current?.focus()
      }, 0)
    }
    prevOpenRef.current = open
  }, [open])

  const apiReady = isAiApiConfigured()
  const overLimit = draft.trim().length > FAITH_AND_ORDER_QUERY_MAX
  const busy = websiteOutcome.kind === 'loading' || documentOutcome.kind === 'loading' || libraryOutcome.kind === 'loading'
  const showWelcome =
    websiteOutcome.kind === 'idle' && documentOutcome.kind === 'idle' && libraryOutcome.kind === 'idle' && calendarOutcome.kind === 'idle'
  const activeQuery =
    (calendarOutcome.kind !== 'idle' ? calendarOutcome.query : null) ||
    (websiteOutcome.kind !== 'idle' ? websiteOutcome.query : null) ||
    (documentOutcome.kind !== 'idle' ? documentOutcome.query : null) ||
    (libraryOutcome.kind !== 'idle' ? libraryOutcome.query : null)

  useEffect(() => {
    draftRef.current = draft
  }, [draft])

  useEffect(() => {
    void listPopularChurchLibraryFaqs(uiLocale === 'am' ? 'am' : 'en').then(setPopularFaqs)
  }, [uiLocale])

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

  function cancelSearch() {
    websiteRequestRef.current += 1
    documentRequestRef.current += 1
    libraryRequestRef.current += 1
    websiteAbortRef.current?.abort()
    documentAbortRef.current?.abort()
    libraryAbortRef.current?.abort()
    websiteAbortRef.current = null
    documentAbortRef.current = null
    libraryAbortRef.current = null
    setWebsiteOutcome((prev) => (prev.kind === 'loading' ? { kind: 'idle' } : prev))
    setDocumentOutcome((prev) => (prev.kind === 'loading' ? { kind: 'idle' } : prev))
    setLibraryOutcome((prev) => (prev.kind === 'loading' ? { kind: 'idle' } : prev))
    if (calendarOutcome.kind !== 'idle' && calendarOutcome.result.kind !== 'clarify' && calendarOutcome.result.kind !== 'suggest') {
      setCalendarOutcome({ kind: 'idle' })
    }
    window.setTimeout(() => inputRef.current?.focus(), 0)
  }

  useEffect(() => {
    if (!open) return
    const mainEl = document.getElementById('main')
    const headerEl = document.querySelector('header[data-header]') as HTMLElement | null
    const inertTargets = [mainEl, headerEl].filter(Boolean) as HTMLElement[]
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
    }
  }, [open, closePanel])

  useEffect(() => {
    if (!open) {
      websiteAbortRef.current?.abort()
      documentAbortRef.current?.abort()
      libraryAbortRef.current?.abort()
      websiteAbortRef.current = null
      documentAbortRef.current = null
      libraryAbortRef.current = null
    }
    return () => {
      websiteAbortRef.current?.abort()
      documentAbortRef.current?.abort()
      libraryAbortRef.current?.abort()
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
          const failedNames = response.sources.filter((source) => source.status === 'failed').map((source) => source.name)
          const notice = failedNames.length === 1 && failedNames[0] === 'bible'
            ? 'Bible search is temporarily unavailable. Please try again.'
            : 'Search is temporarily unavailable. Please try again.'
          setWebsiteOutcome({
            kind: 'error',
            query,
            notice,
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
    setDocumentOutcome({ kind: 'loading', query: userQuery, topic })
    if (!apiReady) {
      // Direct Supabase Church Library search for topic query without remote AI
      void searchChurchLibrary(topic.documentQuery, controller.signal)
        .then(() => {
          if (requestId !== documentRequestRef.current) return
          setDocumentOutcome({ kind: 'idle' })
        })
        .catch(() => {
          if (requestId !== documentRequestRef.current) return
          setDocumentOutcome({ kind: 'idle' })
        })
      return
    }
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

  function startLibrarySearch(query: string) {
    const trimmed = query.trim()
    if (!trimmed || trimmed.length < 2) {
      setLibraryOutcome({ kind: 'idle' })
      return
    }
    const requestId = ++libraryRequestRef.current
    libraryAbortRef.current?.abort()
    const controller = new AbortController()
    libraryAbortRef.current = controller
    setLibraryOutcome({ kind: 'loading', query })
    void searchChurchLibrary(query, controller.signal)
      .then((response) => {
        if (requestId !== libraryRequestRef.current) return
        setLibraryOutcome(response.results.length ? { kind: 'results', query, response } : { kind: 'empty', query, response })
      })
      .catch((cause) => {
        if (requestId !== libraryRequestRef.current) return
        if (isSearchBuddyAbort(cause)) {
          setLibraryOutcome({ kind: 'idle' })
          return
        }
        logSearchBuddyDiagnostic(cause, 'church-library')
        const notice = cause instanceof ChurchLibrarySearchError
          ? cause.code === 'permission'
            ? 'Church Library search was denied by the database permissions.'
            : cause.code === 'not_installed'
              ? 'Church Library search is not installed or the database schema cache is stale.'
              : cause.code === 'timeout'
                ? 'Church Library search timed out. Other Search Buddy catalogs remain available.'
                : cause.message
          : t('searchBuddy.churchLibraryUnavailable')
        setLibraryOutcome({ kind: 'error', query, notice })
      })
  }

  function runSearch(raw: string) {
    const query = raw.trim()
    if (!query || query.length > FAITH_AND_ORDER_QUERY_MAX) return
    setDraft('')
    setFaqMatch(null)
    void searchChurchLibraryFaq(query, uiLocale === 'am' ? 'am' : 'en', faqContextRef.current)
      .then((match) => {
        setFaqMatch(match)
        if (match) faqContextRef.current = match.stableId
      })
      .catch(() => setFaqMatch(null))
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
    if (!followUpOnly) startLibrarySearch(parsed.originalQuery)
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
    setLibraryOutcome({ kind: 'idle' })
    setCalendarOutcome({ kind: 'idle' })
    setPendingClarification(null)
    setFaqMatch(null)
    faqContextRef.current = null
    setVoiceRemountKey((key) => key + 1)
    clearSession()
    window.setTimeout(() => inputRef.current?.focus(), 0)
  }

  const liveStatus = [
    websiteOutcome.kind === 'loading' ? t('searchBuddy.website.searching') : '',
    documentOutcome.kind === 'loading' ? t('searchBuddy.faith.searchingPassage') : '',
    libraryOutcome.kind === 'loading' ? 'Searching the Church Library…' : '',
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
              {websiteOutcome.kind !== 'idle' || documentOutcome.kind !== 'idle' || libraryOutcome.kind !== 'idle' || calendarOutcome.kind !== 'idle' ? (
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
              <>
                <ChatStarterPrompts
                  welcomeId={welcomeId}
                  title={t('searchBuddy.welcomeTitle')}
                  copy={t('searchBuddy.welcomeCopy')}
                  groupAria={t('searchBuddy.suggestionsAria')}
                  prompts={EXAMPLE_KEYS.map((key) => t(key))}
                  onSelect={(prompt) => void runSearch(prompt)}
                />
                {!!popularFaqs.length && (
                  <section className={styles.popularQuestions} aria-labelledby="popular-church-questions">
                    <h3 id="popular-church-questions">{uiLocale === 'am' ? 'ተወዳጅ ጥያቄዎች' : 'Popular Questions'}</h3>
                    <div>{popularFaqs.map((faq) => <button type="button" key={faq.stableId} onClick={() => runSearch(faq.question)}>{faq.question}</button>)}</div>
                  </section>
                )}
              </>
            ) : (
              <div>
                {activeQuery ? (
                  <p className={styles.queryEcho}>
                    <span className={styles.queryLabelPrefix}>{t('searchBuddy.faith.queryLabel')}</span>{' '}
                    <span>{activeQuery}</span>
                  </p>
                ) : null}
                <div style={{ display: 'flex', gap: '0.4rem', flexWrap: 'wrap', margin: '0.75rem 0 1rem' }} role="tablist" aria-label="Search domains">
                  {([
                    ['all', 'All'],
                    ['bible', 'Bible'],
                    ['mezmur', 'Mezmurs'],
                    ['prayer', 'Prayers'],
                    ['calendar', 'Calendar'],
                    ['library', 'Church Library'],
                  ] as const).map(([dom, label]) => (
                    <button
                      key={dom}
                      type="button"
                      onClick={() => setSelectedDomain(dom)}
                      style={{
                        background: selectedDomain === dom ? 'var(--color-primary, #1e3a8a)' : 'rgba(255, 255, 255, 0.08)',
                        color: selectedDomain === dom ? '#ffffff' : 'inherit',
                        border: '1px solid ' + (selectedDomain === dom ? 'transparent' : 'rgba(255, 255, 255, 0.15)'),
                        borderRadius: '9999px',
                        padding: '0.25rem 0.75rem',
                        fontSize: '0.825rem',
                        fontWeight: 600,
                        cursor: 'pointer',
                      }}
                      role="tab"
                      aria-selected={selectedDomain === dom}
                    >
                      {label}
                    </button>
                  ))}
                </div>
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
                  domainFilter={selectedDomain}
                />
                <SourcePassagePane
                  outcome={documentOutcome}
                  busy={documentOutcome.kind === 'loading'}
                  onRetry={(query, topic) => startDocumentSearch(query, topic)}
                />
                {faqMatch && (selectedDomain === 'all' || selectedDomain === 'library') ? <ChurchLibraryFaqAnswer match={faqMatch} /> : null}
                {(selectedDomain === 'all' || selectedDomain === 'library') && (
                  <ChurchLibrarySources
                    outcome={libraryOutcome}
                    onRetry={startLibrarySearch}
                    showEmptyNotice={selectedDomain === 'library' || documentOutcome.kind !== 'idle'}
                  />
                )}
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
        className={`${styles.fab} ${open ? styles.fabHidden : ''}`.trim()}
        aria-hidden={open}
        aria-label={t('searchBuddy.fabAria')}
        aria-haspopup="dialog"
        aria-expanded={open}
        tabIndex={open ? -1 : 0}
        onClick={() => {
          setDraft(snapshot.query)
          setOpen(true)
        }}
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
