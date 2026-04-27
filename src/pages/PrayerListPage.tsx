import { useMemo, useState } from 'react'
import { Link } from 'react-router-dom'
import { PageSection } from '../components/ui/PageSection'
import {
  COLLECTION_PRAYERS,
  PRAYER_COLLECTIONS,
  categoryLabel,
  collectionPrayerCount,
} from '../lib/prayers/prayerCollections'
import type { CollectionPrayer } from '../lib/prayers/prayerCollections'
import {
  prayerCollectionPath,
  prayerDetailPath,
} from '../lib/prayers/prayerSlug'
import { getWeekdayPrayerRhythm } from '../lib/prayers/weekdayPrayerRhythm'
import { useUiLabel } from '../lib/i18n/uiLabels'
import styles from './PrayerListPage.module.css'

function searchBlob(prayer: CollectionPrayer): string {
  return [
    prayer.title,
    prayer.transliterationTitle,
    prayer.collection,
    prayer.id,
    prayer.slug,
    prayer.section,
    prayer.chapter,
    prayer.summary.english,
    prayer.summary.amharic,
    prayer.text.english,
    prayer.text.amharic,
    prayer.text.geez,
    prayer.categoryPrimary,
    ...prayer.categoryUsage,
  ]
    .join(' ')
    .toLowerCase()
}

function preview(prayer: CollectionPrayer): string {
  return (
    prayer.summary.english.trim() ||
    prayer.text.english.trim().slice(0, 170) ||
    prayer.text.amharic.trim().slice(0, 170) ||
    'Open this prayer for focused reading.'
  )
}

export function PrayerListPage() {
  const t = useUiLabel()
  const [query, setQuery] = useState('')
  const rhythm = useMemo(() => getWeekdayPrayerRhythm(), [])

  const results = useMemo(() => {
    const q = query.trim().toLowerCase()
    if (!q) return []
    return COLLECTION_PRAYERS.filter((prayer) => searchBlob(prayer).includes(q)).slice(0, 24)
  }, [query])

  const isSearching = query.trim().length > 0

  return (
    <PageSection variant="tint">
      <div className={styles.shell}>
        <header className={styles.head}>
          <p className={styles.eyebrow}>{t('navPrayers')}</p>
          <h1 className={styles.title}>Prayer collections</h1>
          <p className={styles.deck}>
            Open a prayer book first, then choose its chapter, section, or prayer.
          </p>
        </header>

        {isSearching ? (
          <section className={styles.searchResults} aria-label="Search results">
            <section className={styles.tools} aria-label="Prayer search">
              <label className={styles.searchLabel} htmlFor="prayer-search">
                <span>Search all prayers</span>
                <input
                  id="prayer-search"
                  className={styles.search}
                  type="search"
                  value={query}
                  placeholder="Search title, collection, section, or text..."
                  onChange={(event) => setQuery(event.target.value)}
                />
              </label>
            </section>
            <div className={styles.resultsHead}>
              <h2>Search results</h2>
              <p>
                {results.length} {results.length === 1 ? 'result' : 'results'}
              </p>
            </div>
            {results.length === 0 ? (
              <div className={styles.empty}>
                <h2>No prayers match</h2>
                <p>Try a shorter search or a collection name.</p>
              </div>
            ) : (
              <ul className={styles.resultList}>
                {results.map((prayer) => (
                  <li key={`${prayer.collectionSlug}-${prayer.slug}`}>
                    <Link
                      className={styles.resultLink}
                      to={prayerDetailPath(prayer.slug, prayer.collectionSlug)}
                    >
                      <span className={styles.resultKicker}>
                        {prayer.collection}
                        {prayer.chapter ? ` / ${prayer.chapter}` : ''}
                      </span>
                      <strong lang="am">{prayer.title}</strong>
                      {prayer.transliterationTitle ? <span>{prayer.transliterationTitle}</span> : null}
                      <small>{preview(prayer)}</small>
                    </Link>
                  </li>
                ))}
              </ul>
            )}
          </section>
        ) : (
          <>
            <section className={styles.rhythm} aria-label="Today's Prayer Rhythm">
              <div className={styles.rhythmHead}>
                <div>
                  <p className={styles.eyebrow}>Today&apos;s Prayer Rhythm</p>
                  <h2>
                    {rhythm.weekday} / <span lang="am">{rhythm.weekdayAmharic}</span>
                  </h2>
                  <p className={styles.rhythmSub}>A simple daily prayer path</p>
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
                        Open →
                      </span>
                    </Link>
                  </li>
                ))}
              </ul>
            </section>

            <section className={styles.tools} aria-label="Prayer search">
              <label className={styles.searchLabel} htmlFor="prayer-search">
                <span>Search all prayers</span>
                <input
                  id="prayer-search"
                  className={styles.search}
                  type="search"
                  value={query}
                  placeholder="Search title, collection, section, or text..."
                  onChange={(event) => setQuery(event.target.value)}
                />
              </label>
            </section>

            <ul className={styles.collectionGrid} aria-label="Prayer collections">
              {PRAYER_COLLECTIONS.map((collection) => (
                <li key={collection.id}>
                  <article className={styles.collectionCard}>
                    <div>
                      <p className={styles.collectionOrder}>
                        {String(collection.order).padStart(2, '0')}
                      </p>
                      <h2 className={styles.collectionTitle}>{collection.title}</h2>
                      <p className={styles.collectionAmharic} lang="am">
                        {collection.amharicTitle}
                      </p>
                      <p className={styles.collectionText}>{collection.description}</p>
                      <p className={styles.collectionMeta}>
                        {collectionPrayerCount(collection.id)}{' '}
                        {collectionPrayerCount(collection.id) === 1 ? 'section' : 'sections'}
                      </p>
                    </div>
                    <Link className={styles.openLink} to={prayerCollectionPath(collection.id)}>
                      Open Collection
                    </Link>
                  </article>
                </li>
              ))}
            </ul>
          </>
        )}

        {!isSearching ? (
          <section className={styles.tagNote} aria-label="Secondary tags">
            <h2>Secondary tags</h2>
            <p>
              Tags such as {categoryLabel(COLLECTION_PRAYERS[0])}, Mary, repentance, liturgical,
              saints, and feasts remain available inside search results and prayer pages, but the
              main structure is organized by prayer collection.
            </p>
          </section>
        ) : null}
      </div>
    </PageSection>
  )
}
