import {
  useCallback,
  useDeferredValue,
  useMemo,
  useState,
} from 'react'
import { useSearchParams } from 'react-router-dom'
import { getAllCalendarEntries, getEntryById } from '../../lib/eotcCalendar/eotcCalendarDataset'
import type { EotcCalendarDatasetRow } from '../../lib/eotcCalendar/eotcTypes'
import {
  filterGalleryRows,
  getFeaturedRows,
  partitionRowsByBucket,
  type GalleryBrowseFilter,
  type ObservanceGalleryBucket,
  OBSERVANCE_GALLERY_BUCKET_ORDER,
} from '../../lib/eotcCalendar/eotcObservanceGalleryModel'
import { useUiLabel, type UiLabelKey } from '../../lib/i18n/uiLabels'
import { ObservanceCard } from './ObservanceCard'
import { EotcObservanceDetailSheet } from './EotcObservanceDetailSheet'
import styles from './EotcObservanceGallery.module.css'

const PAGE_SIZE = 30
const SECTION_PREVIEW = 6

const BUCKET_LABEL: Record<ObservanceGalleryBucket, UiLabelKey> = {
  'major-feast': 'calendarGalleryBucketMajorFeast',
  'minor-feast': 'calendarGalleryBucketMinorFeast',
  movable: 'calendarGalleryBucketMovable',
  fast: 'calendarGalleryBucketFast',
  mary: 'calendarGalleryBucketMary',
  angel: 'calendarGalleryBucketAngel',
  saint: 'calendarGalleryBucketSaint',
  apostle: 'calendarGalleryBucketApostle',
  martyr: 'calendarGalleryBucketMartyr',
  prophet: 'calendarGalleryBucketProphet',
  season: 'calendarGalleryBucketSeason',
  'weekly-observance': 'calendarGalleryBucketWeeklyObservance',
}

const ALL_FILTERS: GalleryBrowseFilter[] = [
  'all',
  ...OBSERVANCE_GALLERY_BUCKET_ORDER,
]

type Props = {
  /** “Today” for resolving next occurrence */
  today: Date
}

export function EotcObservanceGallery({ today }: Props) {
  const t = useUiLabel()
  const [, setSearchParams] = useSearchParams()
  const allRows = useMemo(() => [...getAllCalendarEntries()], [])

  const [query, setQuery] = useState('')
  const deferredQuery = useDeferredValue(query)
  const [filter, setFilter] = useState<GalleryBrowseFilter>('all')
  const [page, setPage] = useState(1)
  const [detail, setDetail] = useState<EotcCalendarDatasetRow | null>(null)

  const filtered = useMemo(
    () => filterGalleryRows(allRows, deferredQuery, filter),
    [allRows, deferredQuery, filter],
  )

  const featured = useMemo(() => getFeaturedRows(allRows), [allRows])
  const featuredIds = useMemo(
    () => new Set(featured.map((r) => r.entry.id)),
    [featured],
  )
  const partitioned = useMemo(() => partitionRowsByBucket(allRows), [allRows])

  const browseMode =
    deferredQuery.trim() === '' && filter === 'all'

  const pagedFlat = useMemo(() => {
    const end = page * PAGE_SIZE
    return filtered.slice(0, end)
  }, [filtered, page])

  const hasMore = pagedFlat.length < filtered.length

  const onOpen = useCallback((row: EotcCalendarDatasetRow) => {
    setDetail(row)
  }, [])

  const onOpenRelated = useCallback((id: string) => {
    const next = getEntryById(id)
    if (next) setDetail(next)
  }, [])

  const onGoToCalendar = useCallback(
    (iso: string, observanceId: string) => {
      setSearchParams(
        (prev) => {
          const n = new URLSearchParams(prev)
          n.set('calDay', iso)
          n.set('calFocus', observanceId)
          return n
        },
        { replace: false },
      )
      requestAnimationFrame(() => {
        document.getElementById('calendar-selected-day')?.scrollIntoView({
          behavior: 'smooth',
          block: 'start',
        })
      })
    },
    [setSearchParams],
  )

  const setFilterAndReset = (f: GalleryBrowseFilter) => {
    setFilter(f)
    setPage(1)
    setQuery('')
  }

  return (
    <section
      id="eotc-observance-gallery"
      className={styles.root}
      aria-labelledby="eotc-gallery-heading"
    >
      <header className={styles.header}>
        <h2 id="eotc-gallery-heading" className={styles.title}>
          {t('calendarGalleryTitle')}
        </h2>
        <p className={styles.deck}>{t('calendarGalleryDeck')}</p>
        <label className={styles.srOnly} htmlFor="eotc-gallery-search">
          {t('calendarGallerySearchPlaceholder')}
        </label>
        <input
          id="eotc-gallery-search"
          className={styles.search}
          type="search"
          enterKeyHint="search"
          autoComplete="off"
          spellCheck={false}
          placeholder={t('calendarGallerySearchPlaceholder')}
          value={query}
          onChange={(e) => {
            setQuery(e.target.value)
            setPage(1)
          }}
        />
        <div
          className={styles.filters}
          role="group"
          aria-label={t('calendarGalleryFilterAria')}
        >
          {ALL_FILTERS.map((f) => {
            const label =
              f === 'all'
                ? t('calendarGalleryFilterAll')
                : t(BUCKET_LABEL[f])
            const on = filter === f
            return (
              <button
                key={f}
                type="button"
                className={`${styles.filterChip} ${on ? styles.filterOn : ''}`.trim()}
                aria-pressed={on}
                onClick={() => setFilterAndReset(f)}
              >
                {label}
              </button>
            )
          })}
        </div>
      </header>

      {browseMode ? (
        <div className={styles.sectionsWrap}>
          {featured.length > 0 ? (
            <section className={styles.section} aria-label={t('calendarGallerySectionFeatured')}>
              <h3 className={styles.sectionTitle}>
                {t('calendarGallerySectionFeatured')}
              </h3>
              <div className={styles.featuredRow}>
                {featured.map((row) => (
                  <div key={row.entry.id} className={styles.featuredItem}>
                    <ObservanceCard row={row} onOpen={onOpen} />
                  </div>
                ))}
              </div>
            </section>
          ) : null}

          {OBSERVANCE_GALLERY_BUCKET_ORDER.map((bucket) => {
            const rows = partitioned.get(bucket) ?? []
            if (rows.length === 0) return null
            const preview = rows
              .filter((r) => !featuredIds.has(r.entry.id))
              .slice(0, SECTION_PREVIEW)
            if (preview.length === 0) return null
            return (
              <section key={bucket} className={styles.section} aria-label={t(BUCKET_LABEL[bucket])}>
                <div className={styles.sectionHead}>
                  <h3 className={styles.sectionTitle}>{t(BUCKET_LABEL[bucket])}</h3>
                  <button
                    type="button"
                    className={styles.sectionAction}
                    onClick={() => {
                      setFilter(bucket)
                      setPage(1)
                      setQuery('')
                      document.getElementById('eotc-observance-gallery')?.scrollIntoView({
                        behavior: 'smooth',
                      })
                    }}
                  >
                    {t('calendarGalleryViewAll')}
                  </button>
                </div>
                <div className={styles.grid}>
                  {preview.map((row) => (
                    <ObservanceCard key={row.entry.id} row={row} onOpen={onOpen} />
                  ))}
                </div>
              </section>
            )
          })}
        </div>
      ) : null}

      {!browseMode ? (
        <div className={styles.results}>
          <p className={styles.meta}>
            {t('calendarGalleryShowing')} {filtered.length}
          </p>
          {filtered.length === 0 ? (
            <p className={styles.empty}>{t('calendarGalleryEmpty')}</p>
          ) : (
            <>
              <div className={styles.grid}>
                {pagedFlat.map((row) => (
                  <ObservanceCard key={row.entry.id} row={row} onOpen={onOpen} />
                ))}
              </div>
              {hasMore ? (
                <button
                  type="button"
                  className={styles.loadMore}
                  onClick={() => setPage((p) => p + 1)}
                >
                  {t('calendarGalleryLoadMore')}
                </button>
              ) : null}
            </>
          )}
        </div>
      ) : null}

      <EotcObservanceDetailSheet
        row={detail}
        open={detail !== null}
        onClose={() => setDetail(null)}
        today={today}
        onGoToCalendar={onGoToCalendar}
        onOpenRelated={onOpenRelated}
      />
    </section>
  )
}
