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
import { useAuth } from '../../lib/auth/useAuth'
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
import { resolveContentMediaUrl } from '../../lib/cms/contentMedia'
import { MezmurVoiceSearch } from './MezmurVoiceSearch'
import { SearchResultCard } from './SearchResultCard'
import styles from './SearchBuddy.module.css'

const STARTER_KEYS = [
  { key: 'meskel', query: 'Find Meskel hymns' },
  { key: 'learnPray', query: 'Learn how to pray' },
  { key: 'zemari', query: 'Find a Zemari' },
  { key: 'synaxarium', query: "today's Synaxarium" },
  { key: 'fasting', query: 'Show fasting information' },
  { key: 'calendar', query: 'Open Calendar' },
  { key: 'prayers', query: 'Find prayers' },
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
      return t('searchBuddy.searching')
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
      return withPartial(t('searchBuddy.foundGeneric'), reply.partial)
    default:
      return fallbackMessage
  }
}

export function SearchBuddy() {
  const t = useTranslation()
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
  const titleId = useId()
  const previewTitleId = useId()
  const inputRef = useRef<HTMLInputElement>(null)
  const closeRef = useRef<HTMLButtonElement>(null)
  const panelRef = useRef<HTMLElement>(null)
  const bodyRef = useRef<HTMLDivElement>(null)
  const fabRef = useRef<HTMLButtonElement>(null)
  const backToResultsRef = useRef<HTMLButtonElement>(null)
  const restoreScrollPending = useRef(false)

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
  } = snapshot

  const statusMessage = error
    ? t('searchBuddy.unavailable')
    : !hasSearched
      ? t('searchBuddy.defaultMessage')
      : formatReply(reply, t, message || t('searchBuddy.foundGeneric'))

  const visibleResults = showAll ? results : results.slice(0, INITIAL_RESULT_COUNT)
  const hasMore = results.length > INITIAL_RESULT_COUNT && !showAll

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

  function onBodyScroll() {
    if (!bodyRef.current || preview) return
    persistScroll(bodyRef.current.scrollTop)
  }

  async function runSearch(raw: string) {
    const q = raw.trim()
    if (!q) return
    const requestId = ++requestIdRef.current
    setBusy(true)
    setSnapshot({
      query: q,
      error: false,
      hasSearched: true,
      showAll: false,
      results: [],
      suggestions: [],
      preview: null,
      reply: { kind: 'searching' },
      message: '',
      resultsScrollTop: 0,
    })
    try {
      const response = await searchSite(q, {
        limit: 12,
        includePersonal: true,
        userId: user?.id ?? null,
        session: followUpRef.current,
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
      })
    } catch {
      if (requestId !== requestIdRef.current) return
      setSnapshot({
        results: [],
        suggestions: [],
        error: true,
        reply: { kind: 'unavailable' },
        message: '',
        preview: null,
      })
    } finally {
      if (requestId === requestIdRef.current) setBusy(false)
    }
  }

  function onSubmit(e: FormEvent) {
    e.preventDefault()
    void runSearch(query)
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
    // One forward history entry; browser Back returns to the prior page (no loop).
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
                <form className={styles.form} onSubmit={onSubmit}>
                  <input
                    ref={inputRef}
                    value={query}
                    onChange={(e) => setSnapshot({ query: e.target.value })}
                    placeholder={t('searchBuddy.placeholder')}
                    aria-label={t('searchBuddy.inputAria')}
                    autoComplete="off"
                    enterKeyHint="search"
                  />
                  <button type="submit" disabled={busy || !query.trim()}>
                    {busy ? '…' : t('searchBuddy.find')}
                  </button>
                </form>
                <MezmurVoiceSearch
                  compact
                  active={open && !preview}
                  onTranscript={(text) => setSnapshot({ query: text })}
                />

                {!results.length && !busy && !hasSearched ? (
                  <div className={styles.suggestions}>
                    {STARTER_KEYS.map((starter) => (
                      <button
                        key={starter.key}
                        type="button"
                        className={styles.chip}
                        onClick={() => {
                          setSnapshot({ query: starter.query })
                          void runSearch(starter.query)
                        }}
                      >
                        {t(`searchBuddy.starters.${starter.key}`)}
                      </button>
                    ))}
                  </div>
                ) : null}

                {hasSearched ? (
                  <div className={styles.sessionBar}>
                    <button
                      type="button"
                      className={styles.sessionClear}
                      onClick={() => {
                        clearSession()
                        setBusy(false)
                      }}
                    >
                      {t('searchBuddy.clearSession')}
                    </button>
                  </div>
                ) : null}

                <p className={styles.message} role="status" aria-live="polite">
                  {statusMessage}
                </p>

                {busy ? <p className={styles.status}>{t('searchBuddy.looking')}</p> : null}

                <div className={styles.results}>
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

                {hasMore ? (
                  <button
                    type="button"
                    className={styles.seeMore}
                    onClick={() => setSnapshot({ showAll: true })}
                  >
                    {t('searchBuddy.seeMore', { count: results.length - INITIAL_RESULT_COUNT })}
                  </button>
                ) : null}

                {!busy && hasSearched && !results.length && suggestions.length ? (
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
        aria-haspopup="dialog"
        aria-expanded={open}
        tabIndex={open ? -1 : 0}
        onClick={() => setOpen(true)}
      >
        {t('searchBuddy.fab')}
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

