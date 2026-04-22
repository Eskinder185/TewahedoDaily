import { useMemo, useState } from 'react'
import { buildChurchDaySnapshot } from '../../lib/churchCalendar'
import {
  buildSelectedDayObservanceModel,
  getEntriesForDate,
  type EotcCalendarDatasetRow,
} from '../../lib/eotcCalendar'
import { type UiLabelKey, useUiLabel } from '../../lib/i18n/uiLabels'
import { ChurchDayDetailBody } from './ChurchDayDetailBody'
import { dayObservanceChips } from './churchDayChips'
import styles from './SelectedChurchDayPanel.module.css'

type Props = {
  date: Date
  today: Date
  onPrevDay: () => void
  onNextDay: () => void
  /** `/calendar` route: tighter mobile reading stack and detail tabs tuned for phones. */
  calendarPageLayout?: boolean
}

const EOTC_TIER_PANEL_LABEL: Record<number, UiLabelKey> = {
  1: 'calendarPanelGroupTier1',
  2: 'calendarPanelGroupTier2',
  3: 'calendarPanelGroupTier3',
  4: 'calendarPanelGroupTier4',
  5: 'calendarPanelGroupTier5',
  6: 'calendarPanelGroupTier6',
  7: 'calendarPanelGroupTier7',
  8: 'calendarPanelGroupTier8',
}

export function SelectedChurchDayPanel({
  date,
  today,
  onPrevDay,
  onNextDay,
  calendarPageLayout = false,
}: Props) {
  const t = useUiLabel()
  const snapshot = useMemo(() => buildChurchDaySnapshot(date), [date])
  const [isPrimaryStoryExpanded, setIsPrimaryStoryExpanded] = useState(false)

  const calendarObservanceModel = useMemo(() => {
    if (!calendarPageLayout) return null
    return buildSelectedDayObservanceModel(getEntriesForDate(date))
  }, [calendarPageLayout, date])

  const sortedEotc: EotcCalendarDatasetRow[] | undefined =
    calendarPageLayout && calendarObservanceModel
      ? calendarObservanceModel.sortedRows
      : undefined

  const primaryEotc = calendarObservanceModel?.primary ?? undefined
  const primaryTypeLabel = primaryEotc
    ? primaryEotc.entry.category.primary.replace(/-/g, ' ')
    : null

  const secondaryTierPreview = useMemo(() => {
    if (!calendarObservanceModel || calendarObservanceModel.secondaryTierIds.length === 0)
      return ''
    const ids = calendarObservanceModel.secondaryTierIds
    const parts = ids.slice(0, 3).map((tier) => t(EOTC_TIER_PANEL_LABEL[tier] ?? 'calendarPanelGroupTier5'))
    const extra = ids.length > 3 ? ' …' : ''
    return parts.join(' · ') + extra
  }, [calendarObservanceModel, t])

  const observanceChips = useMemo(() => {
    const raw = dayObservanceChips(snapshot)
      .filter((c) => !c.startsWith('Ethiopian:'))
      .slice(0, 8)
    if (calendarPageLayout && primaryEotc) {
      const b = primaryEotc.entry.display.calendarBadge?.trim()
      if (b && !raw.includes(b)) return [b, ...raw].slice(0, 8)
    }
    return raw
  }, [snapshot, calendarPageLayout, primaryEotc])

  const isToday =
    date.getFullYear() === today.getFullYear() &&
    date.getMonth() === today.getMonth() &&
    date.getDate() === today.getDate()

  const { commemoration, season, fasting, movableOnDay } = snapshot

  const fastingSummary = [fasting.seasonalFast, fasting.weeklyFast]
    .filter(Boolean)
    .join(' · ')

  const headlineTitle =
    calendarPageLayout && primaryEotc
      ? primaryEotc.entry.englishTitle?.trim() || primaryEotc.entry.title
      : commemoration.title

  const headlineTranslit =
    calendarPageLayout && primaryEotc
      ? primaryEotc.entry.transliterationTitle?.trim() || undefined
      : commemoration.transliterationTitle?.trim() || undefined

  const leadDeck =
    (calendarPageLayout && primaryEotc
      ? primaryEotc.entry.summary.short
      : commemoration.shortDescription?.trim() ||
        commemoration.whyTodayShort?.trim()) || ''

  const movableSummary =
    movableOnDay.length > 0
      ? movableOnDay.map((m) => m.title).join(' · ')
      : ''

  const dayNav = (
    <div className={styles.nav}>
      <button
        type="button"
        className={styles.navBtn}
        onClick={onPrevDay}
        aria-label={t('calendarPreviousDay')}
      >
        ‹
      </button>
      <button
        type="button"
        className={styles.navBtn}
        onClick={onNextDay}
        aria-label={t('calendarNextDay')}
      >
        ›
      </button>
    </div>
  )

  return (
    <section
      className={`${styles.root} ${calendarPageLayout ? styles.rootCalendarPageMobile : ''}`.trim()}
      aria-labelledby="selected-church-day-title"
    >
      <div className={styles.inner}>
        <header
          className={`${styles.head} ${calendarPageLayout ? styles.headCalendarMobile : ''}`.trim()}
        >
          {calendarPageLayout ? (
            <div className={styles.dateRibbon}>
              <div className={styles.dateRibbonMain}>
                <p className={styles.dateRibbonWeekday}>{snapshot.weekday.long}</p>
                <p className={styles.dateRibbonGregorian}>{snapshot.gregorian.labelLong}</p>
                <p className={styles.dateRibbonEthiopian} lang="am">
                  {snapshot.ethiopian.labelLong}
                </p>
              </div>
              {dayNav}
            </div>
          ) : null}
          <div className={styles.headMain}>
            <p className={styles.eyebrow}>
              {calendarPageLayout
                ? t('calendarPanelCommemorationEyebrow')
                : isToday
                  ? 'This day'
                  : 'Selected day'}
            </p>
            {calendarPageLayout && primaryEotc?.entry.display.calendarBadge?.trim() ? (
              <p className={styles.primaryBadgeRow}>
                <span className={styles.primaryBadge}>
                  {primaryEotc.entry.display.calendarBadge.trim()}
                </span>
              </p>
            ) : null}
            <h2 id="selected-church-day-title" className={styles.primaryTitle}>
              {headlineTitle}
            </h2>
            {headlineTranslit ? (
              <p className={styles.primaryTranslit}>{headlineTranslit}</p>
            ) : null}
            {!calendarPageLayout ? (
              <p className={styles.dayMeta}>
                <span className={styles.weekdayEm}>{snapshot.weekday.long}</span>
                <span aria-hidden> · </span>
                <span>{snapshot.gregorian.labelLong}</span>
                <span aria-hidden> · </span>
                <span lang="am">{snapshot.ethiopian.labelLong}</span>
              </p>
            ) : null}
          </div>
          {!calendarPageLayout ? dayNav : null}
        </header>

        {calendarPageLayout && calendarObservanceModel?.primaryStory ? (
          <div className={styles.primaryStoryWrap}>
            {calendarObservanceModel.primaryStory.short ? (
              <p className={styles.primaryStoryShort}>
                {calendarObservanceModel.primaryStory.short}
              </p>
            ) : null}
            {primaryTypeLabel ? (
              <p className={styles.primaryStoryType}>
                <span className={styles.primaryStoryK}>Type</span>
                <span className={styles.primaryStoryTypeValue}>{primaryTypeLabel}</span>
              </p>
            ) : null}
            {isPrimaryStoryExpanded ? (
              <>
                {calendarObservanceModel.primaryStory.why ? (
                  <div className={styles.primaryStoryBlock}>
                    <h3 className={styles.primaryStoryK}>{t('calendarWhyMatters')}</h3>
                    <p className={styles.primaryStoryP}>{calendarObservanceModel.primaryStory.why}</p>
                  </div>
                ) : null}
                {calendarObservanceModel.primaryStory.connection ? (
                  <div className={styles.primaryStoryBlock}>
                    <h3 className={styles.primaryStoryK}>{t('calendarPanelConnectionHeading')}</h3>
                    <p className={styles.primaryStoryP}>
                      {calendarObservanceModel.primaryStory.connection}
                    </p>
                  </div>
                ) : null}
              </>
            ) : null}
            {(calendarObservanceModel.primaryStory.why ||
              calendarObservanceModel.primaryStory.connection) && (
              <button
                type="button"
                className={styles.primaryStoryToggle}
                onClick={() => setIsPrimaryStoryExpanded((prev) => !prev)}
              >
                {isPrimaryStoryExpanded ? 'See less' : 'See more'}
              </button>
            )}
          </div>
        ) : null}

        {calendarPageLayout &&
        calendarObservanceModel?.primary &&
        calendarObservanceModel.secondaryCount > 0 ? (
          <details className={styles.alsoOnDayDetails}>
            <summary className={styles.alsoOnDaySummary}>
              <span className={styles.alsoOnDaySummaryLead}>
                <span className={styles.alsoOnDaySummaryTitle}>
                  {t('calendarPanelAlsoOnDayHeading')}
                </span>
                <span className={styles.alsoOnDaySummaryCount} aria-hidden>
                  ({calendarObservanceModel.secondaryCount})
                </span>
              </span>
              <span className={styles.alsoOnDaySummaryHint}>{t('calendarPanelSecondaryExpandHint')}</span>
              {secondaryTierPreview ? (
                <span className={styles.alsoOnDayTierPreview}>{secondaryTierPreview}</span>
              ) : null}
            </summary>
            <div className={styles.alsoOnDayDetailsBody}>
              {calendarObservanceModel.secondaryGroups.map((g, groupIdx) => {
                const labelKey = EOTC_TIER_PANEL_LABEL[g.tier] ?? 'calendarPanelGroupTier5'
                return (
                  <div key={`${g.tier}-${groupIdx}`} className={styles.alsoGroup}>
                    <p className={styles.alsoGroupLabel}>{t(labelKey)}</p>
                    <ul className={styles.alsoItemList}>
                      {g.rows.map((r) => {
                        const e = r.entry
                        const title = e.englishTitle?.trim() || e.title
                        const deck = e.summary.short?.trim()
                        const badge = e.display.calendarBadge?.trim()
                        const panel = e.summary.panel?.trim()
                        const why = e.summary.whyItMatters?.trim()
                        const conn = e.summary.connection?.trim()
                        const cat =
                          e.category.secondary.length > 0
                            ? `${e.category.primary} · ${e.category.secondary.join(' · ')}`
                            : e.category.primary
                        const toneLine = `${e.observance.fastStatus} · ${e.observance.liturgicalTone}`
                        return (
                          <li key={e.id} className={styles.alsoItem}>
                            <div className={styles.alsoItemHead}>
                              {badge ? <span className={styles.alsoItemBadge}>{badge}</span> : null}
                              <span className={styles.alsoItemTitle}>{title}</span>
                            </div>
                            {deck ? <p className={styles.alsoItemDeck}>{deck}</p> : null}
                            <details className={styles.alsoItemMore}>
                              <summary className={styles.alsoItemMoreSummary}>
                                {t('calendarPanelObservanceMoreSummary')}
                              </summary>
                              <div className={styles.alsoItemMoreBody}>
                                {panel ? <p className={styles.alsoItemMoreP}>{panel}</p> : null}
                                {why ? (
                                  <div className={styles.alsoItemMoreBlock}>
                                    <p className={styles.alsoItemMoreK}>{t('calendarWhyMatters')}</p>
                                    <p className={styles.alsoItemMoreP}>{why}</p>
                                  </div>
                                ) : null}
                                {conn ? (
                                  <div className={styles.alsoItemMoreBlock}>
                                    <p className={styles.alsoItemMoreK}>
                                      {t('calendarPanelConnectionHeading')}
                                    </p>
                                    <p className={styles.alsoItemMoreP}>{conn}</p>
                                  </div>
                                ) : null}
                                <p className={styles.alsoItemMoreMeta}>
                                  <span className={styles.alsoItemMoreMetaK}>
                                    {t('calendarPanelMetaObservance')}
                                  </span>
                                  {toneLine}
                                </p>
                                <p className={styles.alsoItemMoreMeta}>
                                  <span className={styles.alsoItemMoreMetaK}>
                                    {t('calendarPanelMetaCategory')}
                                  </span>
                                  {cat}
                                </p>
                                {e.observance.commonPractices.length > 0 ? (
                                  <div className={styles.alsoItemMoreBlock}>
                                    <p className={styles.alsoItemMoreMetaK}>
                                      {t('calendarPanelCommonPractices')}
                                    </p>
                                    <ul className={styles.alsoItemPractices}>
                                      {e.observance.commonPractices.map((line, pi) => (
                                        <li key={`${e.id}-practice-${pi}`}>{line}</li>
                                      ))}
                                    </ul>
                                  </div>
                                ) : null}
                              </div>
                            </details>
                          </li>
                        )
                      })}
                    </ul>
                  </div>
                )
              })}
            </div>
          </details>
        ) : null}

        {calendarPageLayout && !primaryEotc && leadDeck ? (
          <p className={styles.observanceLead}>{leadDeck}</p>
        ) : null}

        <section className={styles.quickContext} aria-label={t('calendarQuickContextAria')}>
          {season.summary && season.summary !== 'Church year' ? (
            <p className={styles.contextLine}>
              <span className={styles.quickLabel}>Season</span>
              {season.summary}
            </p>
          ) : null}
          {fastingSummary ? (
            <p className={styles.contextLine}>
              <span className={styles.quickLabel}>Fasting</span>
              {fastingSummary}
            </p>
          ) : null}
          {movableSummary ? (
            <p className={styles.contextLine}>
              <span className={styles.quickLabel}>Paschal cycle</span>
              {movableSummary}
            </p>
          ) : null}
          {!calendarPageLayout && leadDeck ? <p className={styles.leadDeck}>{leadDeck}</p> : null}
        </section>

        {observanceChips.length > 0 ? (
          <section className={styles.observanceStrip} aria-label={t('calendarObservanceTagsAria')}>
            <ul className={styles.observanceChipList}>
              {observanceChips.map((c) => (
                <li key={c}>
                  <span className={styles.observanceChip}>{c}</span>
                </li>
              ))}
            </ul>
          </section>
        ) : null}

        <div className={styles.body} key={snapshot.gregorian.labelLong}>
          <ChurchDayDetailBody
            snapshot={snapshot}
            calendarPageLayout={calendarPageLayout}
            eotcOrderedRows={sortedEotc}
          />
        </div>
      </div>
    </section>
  )
}
