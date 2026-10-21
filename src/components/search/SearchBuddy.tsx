import { useCallback, useEffect, useId, useRef, useState } from 'react'
import { createPortal } from 'react-dom'
import { useTranslation } from '../../i18n'
import { useLocale } from '../../lib/i18n/locale'
import { useSearchBuddy } from '../../lib/search/searchBuddySession'
import {
  FAITH_AND_ORDER_QUERY_MAX,
  FaithAndOrderQueryError,
  fetchFaithAndOrderManifest,
  searchFaithAndOrder,
  type FaithAndOrderManifest,
} from '../../lib/searchBuddy/faithAndOrderSearch.ts'
import {
  isSearchBuddyAbort,
  logSearchBuddyDiagnostic,
  searchBuddyRetryAfterSeconds,
  searchBuddyUserNotice,
} from '../../lib/searchBuddy/errorMessages.ts'
import { isAiApiConfigured } from '../../lib/ai/aiConfig.ts'
import { ChatComposer } from './ChatComposer'
import {
  FaithAndOrderSearchPane,
  FaithAndOrderSectionReader,
  FaithAndOrderToc,
  type FaithAndOrderOutcome,
  type SectionTarget,
} from './FaithAndOrderViews'
import styles from './SearchBuddy.module.css'

const FOCUSABLE =
  'a[href], button:not([disabled]), textarea:not([disabled]), input:not([disabled]), [tabindex]:not([tabindex="-1"])'

type View = { kind: 'search' } | { kind: 'toc' } | ({ kind: 'section' } & SectionTarget)

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

  const [busy, setBusy] = useState(false)
  const [draft, setDraft] = useState('')
  const [manifest, setManifest] = useState<FaithAndOrderManifest | null>(null)
  const [manifestState, setManifestState] = useState<'idle' | 'loading' | 'ready' | 'error'>('idle')
  const [manifestError, setManifestError] = useState<unknown>(null)
  const [outcome, setOutcome] = useState<FaithAndOrderOutcome>({ kind: 'idle' })
  const [view, setView] = useState<View>({ kind: 'search' })
  const draftRef = useRef(draft)
  const requestIdRef = useRef(0)
  const searchAbortRef = useRef<AbortController | null>(null)
  const manifestRef = useRef<FaithAndOrderManifest | null>(null)
  const manifestFlightRef = useRef<Promise<FaithAndOrderManifest> | null>(null)
  const [voiceRemountKey, setVoiceRemountKey] = useState(0)
  const titleId = useId()
  const limitId = useId()
  const welcomeId = useId()
  const inputRef = useRef<HTMLTextAreaElement>(null)
  const panelRef = useRef<HTMLElement>(null)
  const bodyRef = useRef<HTMLDivElement>(null)
  const fabRef = useRef<HTMLButtonElement>(null)
  const backRef = useRef<HTMLButtonElement>(null)
  const openRef = useRef(open)
  openRef.current = open

  const apiReady = isAiApiConfigured()
  const devApiNotice =
    import.meta.env.DEV && !apiReady
      ? 'Developer: VITE_TEWAHEDO_AI_API_URL is not set. Add it to .env.local and restart Vite to search Faith and Order.'
      : null
  const overLimit = draft.trim().length > FAITH_AND_ORDER_QUERY_MAX
  const manifestNotice = manifestError ? searchBuddyUserNotice(manifestError, uiLocale) : null
  const showWelcome = view.kind === 'search' && outcome.kind === 'idle'

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

  const loadManifest = useCallback(() => {
    if (manifestRef.current) return Promise.resolve(manifestRef.current)
    if (manifestFlightRef.current) return manifestFlightRef.current
    setManifestState('loading')
    setManifestError(null)
    const flight = fetchFaithAndOrderManifest()
      .then((doc) => {
        manifestRef.current = doc
        manifestFlightRef.current = null
        setManifest(doc)
        setManifestState('ready')
        return doc
      })
      .catch((error) => {
        manifestFlightRef.current = null
        setManifestState('error')
        setManifestError(error)
        throw error
      })
    manifestFlightRef.current = flight
    return flight
  }, [])

  useEffect(() => {
    if (!open || !apiReady) return
    let cancelled = false
    loadManifest().catch((error) => {
      if (cancelled || isSearchBuddyAbort(error)) return
    })
    return () => {
      cancelled = true
    }
  }, [open, apiReady, loadManifest])

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
    requestIdRef.current += 1
    searchAbortRef.current?.abort()
    searchAbortRef.current = null
    setBusy(false)
    setOutcome((prev) => (prev.kind === 'loading' ? { kind: 'idle' } : prev))
    window.setTimeout(() => inputRef.current?.focus(), 0)
  }

  useEffect(() => {
    if (!open) return
    const fab = fabRef.current
    const mainEl = document.getElementById('main')
    const footerEl = document.querySelector('footer')
    const inertTargets = [mainEl, footerEl].filter(Boolean) as HTMLElement[]
    for (const el of inertTargets) el.setAttribute('inert', '')

    const timer = window.setTimeout(() => {
      if (view.kind === 'search') inputRef.current?.focus()
      else if (view.kind === 'toc') backRef.current?.focus()
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
  }, [open, view.kind, closePanel])

  useEffect(() => {
    if (!open) {
      searchAbortRef.current?.abort()
      searchAbortRef.current = null
    }
    return () => {
      searchAbortRef.current?.abort()
    }
  }, [open])

  async function runSearch(raw: string) {
    const query = raw.trim()
    if (!query || query.length > FAITH_AND_ORDER_QUERY_MAX) return
    const requestId = ++requestIdRef.current
    searchAbortRef.current?.abort()
    const controller = new AbortController()
    searchAbortRef.current = controller
    setBusy(true)
    setView({ kind: 'search' })
    setOutcome({ kind: 'loading', query })
    setDraft('')

    if (!apiReady) {
      setOutcome({
        kind: 'error',
        query,
        notice: t('searchBuddy.errors.notConfigured'),
      })
      setBusy(false)
      return
    }

    try {
      await loadManifest()
      if (requestId !== requestIdRef.current) return
      const response = await searchFaithAndOrder(query, { signal: controller.signal, limit: 5 })
      if (requestId !== requestIdRef.current) return
      if (response.generated !== false || response.mode !== 'exact_document_search') {
        throw new Error('unexpected document mode')
      }
      setOutcome(
        response.status === 'no_matching_passage' || response.results.length === 0
          ? { kind: 'empty', query, response }
          : { kind: 'matches', query, response },
      )
    } catch (error) {
      if (requestId !== requestIdRef.current || isSearchBuddyAbort(error)) {
        if (requestId === requestIdRef.current) setOutcome({ kind: 'idle' })
        return
      }
      if (isQueryTooLong(error)) return
      logSearchBuddyDiagnostic(error, 'faith-and-order')
      const retrySeconds = searchBuddyRetryAfterSeconds(error)
      setOutcome({
        kind: 'error',
        query,
        notice: searchBuddyUserNotice(error, uiLocale) || t('searchBuddy.errors.unknown'),
        retryAvailableAt:
          retrySeconds != null && retrySeconds > 0 ? Date.now() + retrySeconds * 1000 : undefined,
      })
    } finally {
      if (requestId === requestIdRef.current) {
        setBusy(false)
        if (searchAbortRef.current === controller) searchAbortRef.current = null
      }
    }
  }

  function resetSearch() {
    cancelSearch()
    setDraft('')
    setOutcome({ kind: 'idle' })
    setView({ kind: 'search' })
    setVoiceRemountKey((key) => key + 1)
    clearSession()
    window.setTimeout(() => inputRef.current?.focus(), 0)
  }

  function openSection(target: SectionTarget) {
    setView({ kind: 'section', ...target })
  }

  const liveStatus = busy ? t('searchBuddy.faith.searching') : ''

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
              {view.kind !== 'search' ? (
                <button
                  ref={backRef}
                  type="button"
                  className={styles.newChat}
                  onClick={() => setView({ kind: 'search' })}
                >
                  {t('searchBuddy.faith.backToSearch')}
                </button>
              ) : outcome.kind !== 'idle' ? (
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
            {devApiNotice && !apiReady ? (
              <p className={styles.devNotice} role="status">
                {devApiNotice}
              </p>
            ) : null}
            {view.kind === 'toc' && manifest ? (
              <FaithAndOrderToc manifest={manifest} onOpenSection={openSection} />
            ) : null}
            {view.kind === 'section' ? (
              <FaithAndOrderSectionReader
                key={`${view.version}:${view.sectionId}:${view.paragraphId ?? ''}:${view.highlightNumber ?? ''}`}
                target={view}
              />
            ) : null}
            {view.kind === 'search' ? (
              <div id={welcomeId}>
                <FaithAndOrderSearchPane
                  manifest={manifest}
                  manifestState={manifestState}
                  manifestNotice={manifestNotice}
                  outcome={outcome}
                  busy={busy}
                  onSearchTitle={(title) => void runSearch(title)}
                  onOpenToc={() => setView({ kind: 'toc' })}
                  onOpenSection={openSection}
                  onKeywordSearch={() => inputRef.current?.focus()}
                  onRetryManifest={() => {
                    manifestRef.current = null
                    manifestFlightRef.current = null
                    void loadManifest()
                  }}
                  onRetrySearch={(query) => void runSearch(query)}
                />
              </div>
            ) : null}
          </div>

          {view.kind === 'search' ? (
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
          ) : null}
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
