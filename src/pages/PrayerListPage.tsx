import { useEffect, useMemo, useState } from 'react'
import { Link } from 'react-router-dom'
import { PageSection } from '../components/ui/PageSection'
import {
  libraryCollectionPath,
  loadPrayerLibraryCollections,
  searchPrayerLibrary,
} from '../lib/prayers/prayerLibrary'
import type { PrayerLibraryCollection, PrayerSearchResult } from '../lib/prayers/prayerLibraryTypes'
import { getWeekdayPrayerRhythm } from '../lib/prayers/weekdayPrayerRhythm'
import { resolveContentMediaUrl } from '../lib/cms/contentMedia'
import { useUiLabel } from '../lib/i18n/uiLabels'
import { useTranslation } from '../i18n'
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

export function PrayerListPage() {
  const t = useUiLabel()
  const tr = useTranslation()
  const [query, setQuery] = useState('')
  const [collections, setCollections] = useState<PrayerLibraryCollection[]>([])
  const [collectionsLoading, setCollectionsLoading] = useState(true)
  const [collectionsError, setCollectionsError] = useState<string>()
  const [results, setResults] = useState<PrayerSearchResult[]>([])
  const [searchLoading, setSearchLoading] = useState(false)
  const [searchError, setSearchError] = useState<string>()
  const [reloadTick, setReloadTick] = useState(0)
  const rhythm = useMemo(() => getWeekdayPrayerRhythm(), [])

  useEffect(() => {
    let active = true
    queueMicrotask(() => {
      if (!active) return
      setCollectionsLoading(true)
      setCollectionsError(undefined)
    })
    void loadPrayerLibraryCollections()
      .then((rows) => {
        if (!active) return
        setCollections(rows)
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
        setCollectionsLoading(false)
      })
    return () => {
      active = false
    }
  }, [reloadTick])

  useEffect(() => {
    const normalized = query.trim()
    let active = true
    if (!normalized) {
      queueMicrotask(() => {
        if (!active) return
        setResults([])
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
      void searchPrayerLibrary(normalized)
        .then((rows) => {
          if (!active) return
          setResults(rows)
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

  return (
    <PageSection variant="tint">
      <div className={styles.shell}>
        <header className={styles.head}>
          <p className={styles.eyebrow}>{t('navPrayers')}</p>
          <h1 className={styles.title}>{tr('prayers.hero.title')}</h1>
          <p className={styles.deck}>{tr('prayers.hero.description')}</p>
        </header>

        {isSearching ? (
          <section className={styles.searchResults} aria-label={tr('prayers.search.resultsAria')}>
            <section className={styles.tools} aria-label={tr('prayers.search.searchAria')}>
              <label className={styles.searchLabel} htmlFor="prayer-search">
                <span>{tr('prayers.search.label')}</span>
                <input
                  id="prayer-search"
                  className={styles.search}
                  type="search"
                  value={query}
                  placeholder={tr('prayers.search.placeholder')}
                  onChange={(event) => setQuery(event.target.value)}
                />
              </label>
            </section>
            <div className={styles.resultsHead}>
              <h2>{tr('prayers.search.resultsTitle')}</h2>
              <p>{searchLoading ? 'Searching…' : resultsCountLabel}</p>
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
                  <h2>
                    {rhythm.weekday} / <span lang="am">{rhythm.weekdayAmharic}</span>
                  </h2>
                  <p className={styles.rhythmSub}>{tr('prayers.dailyRhythm.subtitle')}</p>
                </div>
              </div>
              <ul className={styles.rhythmList}>
                {rhythm.items.map((item, index) => (
                  <li key={item.id}>
                    <Link className={styles.rhythmLink} to={item.to}>
                      <span className={styles.rhythmNum} aria-hidden>
                        {index + 1}
                      </span>
                      <span className={styles.rhythmText}>
                        <strong>{item.title}</strong>
                        <small>{item.label}</small>
                        <span>{item.subtitle}</span>
                      </span>
                      <span className={styles.rhythmOpen} aria-hidden>
                        {tr('prayers.collection.open')} →
                      </span>
                    </Link>
                  </li>
                ))}
              </ul>
            </section>

            <section className={styles.tools} aria-label={tr('prayers.search.searchAria')}>
              <label className={styles.searchLabel} htmlFor="prayer-search">
                <span>{tr('prayers.search.label')}</span>
                <input
                  id="prayer-search"
                  className={styles.search}
                  type="search"
                  value={query}
                  placeholder={tr('prayers.search.placeholder')}
                  onChange={(event) => setQuery(event.target.value)}
                />
              </label>
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
