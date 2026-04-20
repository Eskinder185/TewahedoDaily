import { useDeferredValue, useMemo, useState } from 'react'
import {
  DEFAULT_MAX_EOTC_SEARCH_RESULTS,
  EOTC_CONTENT_CATEGORY_FILTERS,
  searchEotcCalendarEntries,
  type EotcContentCategoryFilter,
} from '../../lib/eotcCalendar'
import { type UiLabelKey, useUiLabel } from '../../lib/i18n/uiLabels'
import styles from './EotcObservanceLookup.module.css'

const FILTER_LABEL_KEYS: Record<EotcContentCategoryFilter, UiLabelKey> = {
  'major-feast': 'calendarEotcFilterMajorFeast',
  fast: 'calendarEotcFilterFast',
  mary: 'calendarEotcFilterMary',
  angel: 'calendarEotcFilterAngel',
  saint: 'calendarEotcFilterSaint',
  season: 'calendarEotcFilterSeason',
  'weekly-observance': 'calendarEotcFilterWeeklyObservance',
}

export function EotcObservanceLookup() {
  const t = useUiLabel()
  const [query, setQuery] = useState('')
  const deferredQuery = useDeferredValue(query)
  const [filters, setFilters] = useState<EotcContentCategoryFilter[]>([])

  const results = useMemo(
    () =>
      searchEotcCalendarEntries({
        query: deferredQuery,
        categoryFilters: filters.length ? filters : undefined,
        maxResults: DEFAULT_MAX_EOTC_SEARCH_RESULTS,
      }),
    [deferredQuery, filters],
  )

  const idle = deferredQuery.trim() === '' && filters.length === 0

  const toggleFilter = (f: EotcContentCategoryFilter) => {
    setFilters((prev) => (prev.includes(f) ? prev.filter((x) => x !== f) : [...prev, f]))
  }

  return (
    <details className={styles.root}>
      <summary className={styles.summary}>{t('calendarEotcLookupSummary')}</summary>
      <div className={styles.body}>
        <p className={styles.hint}>{t('calendarEotcLookupHint')}</p>
        <label className={styles.srOnly} htmlFor="eotc-calendar-search-input">
          {t('calendarEotcLookupPlaceholder')}
        </label>
        <input
          id="eotc-calendar-search-input"
          className={styles.input}
          type="search"
          enterKeyHint="search"
          autoComplete="off"
          spellCheck={false}
          placeholder={t('calendarEotcLookupPlaceholder')}
          value={query}
          onChange={(e) => setQuery(e.target.value)}
        />
        <div className={styles.chips} role="group" aria-label={t('calendarEotcLookupFiltersAria')}>
          {EOTC_CONTENT_CATEGORY_FILTERS.map((f) => {
            const on = filters.includes(f)
            return (
              <button
                key={f}
                type="button"
                className={`${styles.chip} ${on ? styles.chipOn : ''}`.trim()}
                aria-pressed={on}
                onClick={() => toggleFilter(f)}
              >
                {t(FILTER_LABEL_KEYS[f])}
              </button>
            )
          })}
        </div>
        {idle ? (
          <p className={styles.muted}>{t('calendarEotcLookupIdle')}</p>
        ) : results.length === 0 ? (
          <p className={styles.muted}>{t('calendarEotcLookupNoResults')}</p>
        ) : (
          <ul className={styles.list} aria-label={t('calendarEotcLookupResultsAria')}>
            {results.map((row) => {
              const e = row.entry
              const displayTitle = e.englishTitle?.trim() || e.title
              const showNative = Boolean(
                e.englishTitle?.trim() && e.title.trim() !== displayTitle.trim(),
              )
              const badge = e.display.calendarBadge?.trim()
              return (
                <li key={e.id} className={styles.item}>
                  <div className={styles.itemTop}>
                    {badge ? <span className={styles.badge}>{badge}</span> : null}
                    <span className={styles.itemTitle}>{displayTitle}</span>
                  </div>
                  {showNative ? <p className={styles.itemNative}>{e.title}</p> : null}
                  {e.transliterationTitle?.trim() ? (
                    <p className={styles.itemTranslit}>{e.transliterationTitle}</p>
                  ) : null}
                  <p className={styles.itemMeta}>
                    <span className={styles.itemMetaK}>{t('calendarEotcLookupCollection')}</span>
                    {row.collection} · {e.category.primary}
                  </p>
                  {e.summary.short?.trim() ? (
                    <p className={styles.itemDeck}>{e.summary.short.trim()}</p>
                  ) : null}
                </li>
              )
            })}
          </ul>
        )}
      </div>
    </details>
  )
}
