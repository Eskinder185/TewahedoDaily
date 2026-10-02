import {
  useEffect,
  useId,
  useRef,
  useState,
  type KeyboardEvent,
} from 'react'
import { Link, useNavigate } from 'react-router-dom'
import { PageSection } from '../components/ui/PageSection'
import {
  libraryCollectionPath,
  loadPrayerLibraryCollections,
  suggestPrayerLibrary,
} from '../lib/prayers/prayerLibrary'
import type { PrayerLibraryCollection, PrayerSearchResult } from '../lib/prayers/prayerLibraryTypes'
import {
  LEARN_HOW_TO_PRAY_CARD,
  listPublishedPrayerGuides,
  type PrayerGuide,
} from '../lib/prayers/prayerGuides'
import { useDailyPrayerRhythm } from '../hooks/useDailyPrayerRhythm'
import { resolveContentMediaUrl } from '../lib/cms/contentMedia'
import { useUiLabel } from '../lib/i18n/uiLabels'
import { useTranslation } from '../i18n'
import { useAuth } from '../lib/auth/useAuth'
import { listReadingProgress } from '../lib/userContent/readingProgressService'
import type { ReadingProgressRecord } from '../lib/userContent/types'
import { getLastPrayerHubVisit, getRecentPrayerHubPaths } from '../lib/prayers/prayerHubActivity'
import styles from './PrayerListPage.module.css'

function collectionCountLabel(
  collection: PrayerLibraryCollection,
  tr: (key: string, vars?: Record<string, string | number>) => string,
) {
  const count = collection.itemCount
  if (collection.countKind === 'psalms') {
    return count === 1
      ? tr('prayers.collection.psalmsCountOne', { count })
      : tr('prayers.collection.psalmsCountOther', { count })
  }
  if (collection.countKind === 'prayers') {
    return count === 1
      ? tr('prayers.collection.prayersCountOne', { count })
      : tr('prayers.collection.prayersCountOther', { count })
  }
  if (collection.countKind === 'days') {
    return count === 1
      ? tr('prayers.collection.daysCountOne', { count })
      : tr('prayers.collection.daysCountOther', { count })
  }
  if (collection.countKind === 'commemorations') {
    return count === 1
      ? tr('prayers.collection.commemorationsCountOne', { count })
      : tr('prayers.collection.commemorationsCountOther', { count })
  }
  return count === 1
    ? tr('prayers.collection.sectionsCountOne', { count })
    : tr('prayers.collection.sectionsCountOther', { count })
}

function PraySearchField({
  query,
  onQueryChange,
  suggestions,
  onPick,
  hasStrongMatch,
}: {
  query: string
  onQueryChange: (value: string) => void
  suggestions: PrayerSearchResult[]
  onPick: (route: string) => void
  hasStrongMatch: boolean
}) {
  const tr = useTranslation()
  const listboxId = useId()
  const [open, setOpen] = useState(false)
  const [active, setActive] = useState(-1)
  const wrapRef = useRef<HTMLDivElement>(null)

  useEffect(() => {
    setOpen(suggestions.length > 0 && query.trim().length > 0)
    setActive(-1)
  }, [suggestions, query])

  useEffect(() => {
    function onDoc(event: MouseEvent) {
      if (!wrapRef.current?.contains(event.target as Node)) setOpen(false)
    }
    document.addEventListener('mousedown', onDoc)
    return () => document.removeEventListener('mousedown', onDoc)
  }, [])

  function onKeyDown(event: KeyboardEvent<HTMLInputElement>) {
    if (!open || !suggestions.length) {
      if (event.key === 'Escape') setOpen(false)
      return
    }
    if (event.key === 'ArrowDown') {
      event.preventDefault()
      setActive((i) => (i + 1) % suggestions.length)
    } else if (event.key === 'ArrowUp') {
      event.preventDefault()
      setActive((i) => (i <= 0 ? suggestions.length - 1 : i - 1))
    } else if (event.key === 'Enter' && active >= 0) {
      event.preventDefault()
      onPick(suggestions[active].route)
      setOpen(false)
    } else if (event.key === 'Escape') {
      setOpen(false)
      setActive(-1)
    }
  }

  return (
    <div className={styles.searchWrap} ref={wrapRef}>
      <label className={styles.searchLabel} htmlFor="prayer-search">
        <span>{tr('prayers.search.label')}</span>
        <input
          id="prayer-search"
          className={styles.search}
          type="search"
          role="combobox"
          aria-expanded={open}
          aria-controls={listboxId}
          aria-autocomplete="list"
          aria-activedescendant={active >= 0 ? `${listboxId}-opt-${active}` : undefined}
          value={query}
          placeholder={tr('prayers.search.placeholder')}
          onChange={(event) => onQueryChange(event.target.value)}
          onKeyDown={onKeyDown}
          onFocus={() => suggestions.length && setOpen(true)}
        />
      </label>
      {open ? (
        <ul
          id={listboxId}
          className={styles.suggestList}
          role="listbox"
          aria-label={tr('prayers.search.resultsAria')}
        >
          {!hasStrongMatch ? (
            <li className={styles.suggestHint} role="presentation">
              No exact match — closest suggestions
            </li>
          ) : null}
          {suggestions.map((item, index) => (
            <li key={item.id} role="option" aria-selected={active === index} id={`${listboxId}-opt-${index}`}>
              <button
                type="button"
                className={`${styles.suggestItem} ${active === index ? styles.suggestActive : ''}`}
                onMouseEnter={() => setActive(index)}
                onClick={() => {
                  onPick(item.route)
                  setOpen(false)
                }}
              >
                <span className={styles.resultKicker}>{item.metadata}</span>
                <strong>{item.title}</strong>
                {item.titleAmharic ? <span lang="am">{item.titleAmharic}</span> : null}
              </button>
            </li>
          ))}
        </ul>
      ) : null}
    </div>
  )
}

export function PrayerListPage() {
  const t = useUiLabel()
  const tr = useTranslation()
  const navigate = useNavigate()
  const { session } = useAuth()
  const [query, setQuery] = useState('')
  const [collections, setCollections] = useState<PrayerLibraryCollection[]>([])
  const [collectionsLoading, setCollectionsLoading] = useState(true)
  const [collectionsError, setCollectionsError] = useState<string>()
  const [guides, setGuides] = useState<PrayerGuide[]>([])
  const [results, setResults] = useState<PrayerSearchResult[]>([])
  const [suggestions, setSuggestions] = useState<PrayerSearchResult[]>([])
  const [hasStrongMatch, setHasStrongMatch] = useState(true)
  const [searchLoading, setSearchLoading] = useState(false)
  const [searchError, setSearchError] = useState<string>()
  const [reloadTick, setReloadTick] = useState(0)
  const [continueItems, setContinueItems] = useState<ReadingProgressRecord[]>([])
  const { rhythm, loading: rhythmLoading, error: rhythmError, reload: reloadRhythm } =
    useDailyPrayerRhythm()

  useEffect(() => {
    let active = true
    queueMicrotask(() => {
      if (!active) return
      setCollectionsLoading(true)
      setCollectionsError(undefined)
    })
    void Promise.all([loadPrayerLibraryCollections(), listPublishedPrayerGuides()])
      .then(([rows, publishedGuides]) => {
        if (!active) return
        setCollections(rows)
        const hasLearn = publishedGuides.some((guide) => guide.slug === 'learn-how-to-pray')
        setGuides(
          hasLearn
            ? publishedGuides
            : [
                {
                  id: LEARN_HOW_TO_PRAY_CARD.id,
                  slug: LEARN_HOW_TO_PRAY_CARD.slug,
                  title: LEARN_HOW_TO_PRAY_CARD.title,
                  titleAmharic: LEARN_HOW_TO_PRAY_CARD.titleAmharic,
                  summary: LEARN_HOW_TO_PRAY_CARD.summary,
                  summaryAmharic: '',
                  status: 'draft',
                  sortOrder: 0,
                  sourceTitle: '',
                  sourceReference: '',
                  reviewStatus: 'draft',
                  publishedAt: null,
                  createdAt: '',
                  updatedAt: '',
                },
                ...publishedGuides,
              ],
        )
        setCollectionsLoading(false)
      })
      .catch((cause) => {
        if (!active) return
        const message =
          cause && typeof cause === 'object' && 'message' in cause
            ? String((cause as { message?: unknown }).message)
            : "We couldn't load the prayer library."
        if (import.meta.env.DEV) console.error('[prayers] library', cause)
        setCollectionsError(import.meta.env.DEV ? message : "We couldn't load the prayer library.")
        setCollections([])
        setGuides([])
        setCollectionsLoading(false)
      })
    return () => {
      active = false
    }
  }, [reloadTick])

  useEffect(() => {
    let active = true
    void listReadingProgress(session?.user.id, 6).then((result) => {
      if (!active) return
      if (result.items.length) {
        setContinueItems(result.items)
        return
      }
      // Fallback to hub activity for guests / empty progress
      const last = getLastPrayerHubVisit()
      const recent = getRecentPrayerHubPaths()
      const paths = last ? [last.path, ...recent.filter((p) => p !== last.path)] : recent
      setContinueItems(
        paths.slice(0, 4).map((path, index) => ({
          id: `hub:${path}`,
          contentType: 'collection' as const,
          route: path.startsWith('/prayers/')
            ? path
                .replace('/prayers/zeweter', '/pray/zewter-tselot')
                .replace('/prayers/wudase-mariam', '/pray/wudase-mariam')
                .replace('/prayers/mezmure-dawit', '/pray/mezmure-dawit')
                .replace('/prayers/yekidane-tselot', '/pray/yekidane-tselot')
                .replace('/prayers/meharene-ab', '/pray/meharene-ab')
            : path,
          title: path.split('/').pop()?.replace(/-/g, ' ') || path,
          updatedAt: new Date(Date.now() - index).toISOString(),
          source: 'local' as const,
        })),
      )
    })
    return () => {
      active = false
    }
  }, [session?.user.id, reloadTick])

  useEffect(() => {
    const normalized = query.trim()
    let active = true
    if (!normalized) {
      queueMicrotask(() => {
        if (!active) return
        setResults([])
        setSuggestions([])
        setHasStrongMatch(true)
        setSearchError(undefined)
        setSearchLoading(false)
      })
      return () => {
        active = false
      }
    }
    queueMicrotask(() => {
      if (!active) return
      setSearchLoading(true)
      setSearchError(undefined)
    })
    const timeout = window.setTimeout(() => {
      void suggestPrayerLibrary(normalized, 8)
        .then((suggest) => {
          if (!active) return
          setResults(suggest.results)
          setSuggestions(suggest.suggestions)
          setHasStrongMatch(suggest.hasStrongMatch)
          setSearchLoading(false)
        })
        .catch((cause) => {
          if (!active) return
          const message =
            cause && typeof cause === 'object' && 'message' in cause
              ? String((cause as { message?: unknown }).message)
              : "We couldn't search prayers."
          if (import.meta.env.DEV) console.error('[prayers] search', cause)
          setSearchError(import.meta.env.DEV ? message : "We couldn't search prayers.")
          setResults([])
          setSuggestions([])
          setSearchLoading(false)
        })
    }, 300)
    return () => {
      active = false
      window.clearTimeout(timeout)
    }
  }, [query])

  const isSearching = query.trim().length > 0
  const resultsCountLabel =
    results.length === 1
      ? tr('prayers.search.resultsCountOne', { count: results.length })
      : tr('prayers.search.resultsCountOther', { count: results.length })

  const searchField = (
    <section className={styles.tools} aria-label={tr('prayers.search.searchAria')}>
      <PraySearchField
        query={query}
        onQueryChange={setQuery}
        suggestions={suggestions}
        hasStrongMatch={hasStrongMatch}
        onPick={(route) => navigate(route)}
      />
      {!session ? (
        <p className={styles.continueHint}>
          <Link to="/account">Sign in</Link> to sync favorites and continue reading across devices.
          Progress on this device is saved locally.
        </p>
      ) : null}
    </section>
  )

  return (
    <PageSection variant="tint">
      <div className={styles.shell}>
        <header className={styles.head}>
          <p className={styles.eyebrow}>{t('navPrayers')}</p>
          <h1 className={styles.title}>{tr('prayers.hero.title')}</h1>
          <p className={styles.deck}>{tr('prayers.hero.description')}</p>
        </header>

        {!isSearching && continueItems.length > 0 ? (
          <section className={styles.continue} aria-label="Continue reading">
            <div className={styles.continueHead}>
              <h2>Continue Reading</h2>
              {!session ? (
                <Link className={styles.openLink} to="/account">
                  Save your progress
                </Link>
              ) : null}
            </div>
            <ul className={styles.continueList}>
              {continueItems.map((item) => (
                <li key={item.id}>
                  <Link className={styles.continueLink} to={item.route || '/pray'}>
                    <strong>{item.title || item.contentSlug || 'Continue'}</strong>
                    <span>
                      {[item.collectionSlug, item.sectionSlug].filter(Boolean).join(' · ') ||
                        item.contentType}
                    </span>
                    <span className={styles.continueCta}>Continue →</span>
                  </Link>
                </li>
              ))}
            </ul>
          </section>
        ) : null}

        {isSearching ? (
          <section className={styles.searchResults} aria-label={tr('prayers.search.resultsAria')}>
            {searchField}
            <div className={styles.resultsHead}>
              <h2>
                {hasStrongMatch ? tr('prayers.search.resultsTitle') : 'No exact match found'}
              </h2>
              <p>
                {searchLoading
                  ? 'Searching…'
                  : hasStrongMatch
                    ? resultsCountLabel
                    : 'Closest matches'}
              </p>
            </div>
            {searchError ? (
              <div className={styles.empty} role="alert">
                <h2>{searchError}</h2>
                <p>Please try again in a moment.</p>
              </div>
            ) : null}
            {!searchLoading && !searchError && results.length === 0 ? (
              <div className={styles.empty}>
                <h2>{tr('prayers.search.emptyTitle')}</h2>
                <p>{tr('prayers.search.emptyHint')}</p>
              </div>
            ) : null}
            {results.length > 0 ? (
              <ul className={styles.resultList}>
                {results.map((result) => (
                  <li key={result.id}>
                    <Link className={styles.resultLink} to={result.route}>
                      <span className={styles.resultKicker}>{result.metadata}</span>
                      <strong>{result.title}</strong>
                      {result.titleAmharic ? <span lang="am">{result.titleAmharic}</span> : null}
                      <small>{result.excerpt}</small>
                    </Link>
                  </li>
                ))}
              </ul>
            ) : null}
          </section>
        ) : (
          <>
            <section className={styles.rhythm} aria-label={tr('prayers.dailyRhythm.title')}>
              <div className={styles.rhythmHead}>
                <div>
                  <p className={styles.eyebrow}>{tr('prayers.dailyRhythm.title')}</p>
                  {rhythmLoading && !rhythm ? (
                    <div className={styles.rhythmTitleSkeleton} aria-hidden />
                  ) : rhythm ? (
                    <h2>
                      {rhythm.weekday} / <span lang="am">{rhythm.weekdayAmharic}</span>
                    </h2>
                  ) : (
                    <h2>Today</h2>
                  )}
                  <p className={styles.rhythmSub}>{tr('prayers.dailyRhythm.subtitle')}</p>
                  {rhythm?.ethiopianDateLabel ? (
                    <p className={styles.rhythmEthDate}>{rhythm.ethiopianDateLabel}</p>
                  ) : null}
                </div>
              </div>

              {rhythm?.context.length ? (
                <ul className={styles.rhythmContext} aria-label="Today in the Church">
                  {rhythm.context.map((chip) => (
                    <li key={`${chip.kind}-${chip.title}`}>
                      <span className={styles.rhythmContextKind}>{chip.label}</span>
                      <strong>{chip.title}</strong>
                      {chip.titleAmharic ? <span lang="am">{chip.titleAmharic}</span> : null}
                    </li>
                  ))}
                </ul>
              ) : null}

              {rhythmError && !rhythm ? (
                <div className={styles.rhythmError} role="alert">
                  <p>{rhythmError}</p>
                  <button type="button" className={styles.openLink} onClick={reloadRhythm}>
                    Try again
                  </button>
                </div>
              ) : null}

              <ul className={styles.rhythmList}>
                {rhythmLoading && !rhythm
                  ? [1, 2, 3].map((n) => (
                      <li key={`skeleton-${n}`}>
                        <div className={styles.rhythmSkeleton} aria-hidden>
                          <span className={styles.rhythmNum}>{n}</span>
                          <span className={styles.rhythmSkeletonText}>
                            <span />
                            <span />
                            <span />
                          </span>
                        </div>
                      </li>
                    ))
                  : null}
                {rhythm
                  ? rhythm.items.map((item, index) => (
                      <li key={item.id}>
                        <Link className={styles.rhythmLink} to={item.to}>
                          <span className={styles.rhythmNum} aria-hidden>
                            {index + 1}
                          </span>
                          <span className={styles.rhythmText}>
                            <strong>{item.title}</strong>
                            <small lang={item.id === 'wudase' || item.id === 'psalms' ? 'am' : undefined}>
                              {item.label}
                            </small>
                            <span>{item.subtitle}</span>
                          </span>
                          <span className={styles.rhythmOpen} aria-hidden>
                            {tr('prayers.collection.open')} →
                          </span>
                        </Link>
                      </li>
                    ))
                  : null}
              </ul>
            </section>

            {searchField}

            <section className={styles.learn} aria-label="Learn about prayer">
              <p className={styles.learnEyebrow}>Learn How to Pray</p>
              <ul className={styles.learnGrid}>
                {guides.map((guide) => (
                  <li key={guide.id}>
                    <article className={styles.learnCard}>
                      <div className={styles.learnBody}>
                        <h2 className={styles.learnTitle}>{guide.title}</h2>
                        {guide.titleAmharic ? (
                          <p className={styles.learnAmharic} lang="am">
                            {guide.titleAmharic}
                          </p>
                        ) : null}
                        <p className={styles.learnText}>
                          {guide.slug === 'learn-how-to-pray'
                            ? 'Build a foundation for Orthodox prayer through guided practice and teaching.'
                            : guide.summary || LEARN_HOW_TO_PRAY_CARD.summary}
                        </p>
                      </div>
                      {guide.slug === 'learn-how-to-pray' ? (
                        <div className={styles.learnActions}>
                          <Link className={styles.openLink} to="/pray/learn-how-to-pray">
                            Start Guided Practice
                          </Link>
                          <Link
                            className={styles.openLinkSecondary}
                            to="/pray/learn-how-to-pray#learn-about-prayer"
                          >
                            Explore the Guide
                          </Link>
                        </div>
                      ) : (
                        <Link className={styles.openLink} to={`/pray/${guide.slug}`}>
                          Read guide →
                        </Link>
                      )}
                    </article>
                  </li>
                ))}
              </ul>
            </section>

            {collectionsLoading ? <p role="status">Loading prayers…</p> : null}
            {collectionsError ? (
              <div className={styles.empty} role="alert">
                <h2>{collectionsError}</h2>
                <button type="button" className={styles.openLink} onClick={() => setReloadTick((n) => n + 1)}>
                  Try again
                </button>
              </div>
            ) : null}
            {!collectionsLoading && !collectionsError && collections.length === 0 ? (
              <div className={styles.empty}>
                <h2>No prayer collections found.</h2>
              </div>
            ) : null}

            <ul className={styles.collectionGrid} aria-label={tr('prayers.title')}>
              {collections
                .filter((collection) => Boolean(collection.title?.trim()))
                .map((collection, index) => {
                  const title = collection.title.trim()
                  const titleAmharic = collection.titleAmharic?.trim() || ''
                  const description = collection.description?.trim() || ''
                  const imageUrl = collection.imagePath
                    ? resolveContentMediaUrl(collection.imagePath)
                    : ''
                  return (
                    <li key={`${collection.sourceType}-${collection.id}`}>
                      <article className={styles.collectionCard}>
                        {imageUrl ? (
                          <img
                            className={styles.collectionImage}
                            src={imageUrl}
                            alt={collection.imageAlt || ''}
                            loading="lazy"
                            decoding="async"
                          />
                        ) : null}
                        <div className={styles.collectionBody}>
                          <p className={styles.collectionOrder}>{String(index + 1).padStart(2, '0')}</p>
                          <h2 className={styles.collectionTitle}>{title}</h2>
                          {titleAmharic ? (
                            <p className={styles.collectionAmharic} lang="am">
                              {titleAmharic}
                            </p>
                          ) : null}
                          {description ? <p className={styles.collectionText}>{description}</p> : null}
                          <p className={styles.collectionMeta}>{collectionCountLabel(collection, tr)}</p>
                        </div>
                        <Link className={styles.openLink} to={libraryCollectionPath(collection)}>
                          {tr('prayers.collection.openCollection')}
                        </Link>
                      </article>
                    </li>
                  )
                })}
            </ul>
          </>
        )}

        {!isSearching ? (
          <section className={styles.tagNote} aria-label={tr('prayers.search.secondaryTagsTitle')}>
            <h2>{tr('prayers.search.secondaryTagsTitle')}</h2>
            <p>{tr('prayers.search.secondaryTagsHelper', { firstTag: 'Daily' })}</p>
          </section>
        ) : null}
      </div>
    </PageSection>
  )
}
