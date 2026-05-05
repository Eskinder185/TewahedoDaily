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
import { useTranslation } from '../i18n'
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
  const tr = useTranslation()
  const [query, setQuery] = useState('')
  const rhythm = useMemo(() => getWeekdayPrayerRhythm(), [])

  const results = useMemo(() => {
    const q = query.trim().toLowerCase()
    if (!q) return []
    return COLLECTION_PRAYERS.filter((prayer) => searchBlob(prayer).includes(q)).slice(0, 24)
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
              <p>{resultsCountLabel}</p>
            </div>
            {results.length === 0 ? (
              <div className={styles.empty}>
                <h2>{tr('prayers.search.emptyTitle')}</h2>
                <p>{tr('prayers.search.emptyHint')}</p>
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
                      <span className={styles.rhythmOpen} aria-hidden>{tr('prayers.collection.open')} →</span>
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

            <ul className={styles.collectionGrid} aria-label={tr('prayers.title')}>
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
                        {collectionPrayerCount(collection.id) === 1
                          ? tr('prayers.collection.sectionsCountOne', {
                              count: collectionPrayerCount(collection.id),
                            })
                          : tr('prayers.collection.sectionsCountOther', {
                              count: collectionPrayerCount(collection.id),
                            })}
                      </p>
                    </div>
                    <Link className={styles.openLink} to={prayerCollectionPath(collection.id)}>
                      {tr('prayers.collection.openCollection')}
                    </Link>
                  </article>
                </li>
              ))}
            </ul>
          </>
        )}

        {!isSearching ? (
          <section className={styles.tagNote} aria-label={tr('prayers.search.secondaryTagsTitle')}>
            <h2>{tr('prayers.search.secondaryTagsTitle')}</h2>
            <p>{tr('prayers.search.secondaryTagsHelper', { firstTag: categoryLabel(COLLECTION_PRAYERS[0]) })}</p>
          </section>
        ) : null}
      </div>
    </PageSection>
  )
}
