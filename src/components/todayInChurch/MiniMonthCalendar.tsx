import { useMemo } from 'react'
import type { CalendarCellMarkKind, CalendarDayCellMark } from '../../lib/churchCalendar'
import { useUiLabel } from '../../lib/i18n/uiLabels'
import { useLocale } from '../../lib/i18n/locale'
import { useTranslation } from '../../i18n'
import styles from './MiniMonthCalendar.module.css'

const MARK_PRIMARY_CLASS: Record<CalendarCellMarkKind, string> = {
  majorFeast: styles.markMajorFeast,
  feast: styles.markFeast,
  fast: styles.markFast,
  mary: styles.markMary,
  saint: styles.markSaint,
  recurring: styles.markRecurring,
  season: styles.markSeason,
  movable: styles.markMovable,
}

export type MiniMonthCalendarProps = {
  /** Local “today” for highlighting the cell */
  anchor: Date
  displayYear?: number
  displayMonthIndex?: number
  /** Gregorian day-of-month markers (legacy single-style dot). */
  markedDays?: number[]
  /**
   * Rich per-day marks (feast / fast / saint / season / movable). When set, overrides `markedDays` styling.
   */
  dayMarks?: ReadonlyMap<number, CalendarDayCellMark>
  /** Optional selection (same month as display month) */
  selectedDay?: number | null
  onSelectDay?: (day: number) => void
  onPrevMonth?: () => void
  onNextMonth?: () => void
}

function civilDatePhrase(year: number, monthIndex: number, day: number, locale: string): string {
  const d = new Date(year, monthIndex, day)
  return new Intl.DateTimeFormat(locale, {
    weekday: 'long',
    month: 'long',
    day: 'numeric',
    year: 'numeric',
  }).format(d)
}

function cellAriaLabel(
  year: number,
  monthIndex: number,
  day: number,
  mark: CalendarDayCellMark | undefined,
  markedLegacy: boolean,
  locale: string,
  t: (key: string) => string,
): string {
  const datePart = civilDatePhrase(year, monthIndex, day, locale)
  if (mark?.label) {
    const fastNote = mark.alsoFast ? ` ${t('calendar.dayCell.alsoFast')}` : ''
    return `${datePart}. ${mark.label}.${fastNote}`
  }
  if (markedLegacy) {
    return `${datePart}. ${t('calendar.dayCell.liturgicalObservance')}`
  }
  return datePart
}

export function MiniMonthCalendar({
  anchor,
  displayYear,
  displayMonthIndex,
  markedDays = [],
  dayMarks,
  selectedDay = null,
  onSelectDay,
  onPrevMonth,
  onNextMonth,
}: MiniMonthCalendarProps) {
  const t = useUiLabel()
  const tr = useTranslation()
  const { locale } = useLocale()
  const year = displayYear ?? anchor.getFullYear()
  const month = displayMonthIndex ?? anchor.getMonth()
  const markSet = useMemo(() => new Set(markedDays), [markedDays])

  const { label, cells, todayDay } = useMemo(
    () => buildMonthGrid(year, month, anchor, locale),
    [year, month, anchor, locale],
  )
  const weekLabels = [
    tr('calendar.weekdays.sunShort'),
    tr('calendar.weekdays.monShort'),
    tr('calendar.weekdays.tueShort'),
    tr('calendar.weekdays.wedShort'),
    tr('calendar.weekdays.thuShort'),
    tr('calendar.weekdays.friShort'),
    tr('calendar.weekdays.satShort'),
  ]
  const legendLabels = [
    tr('calendar.filters.majorFeasts'),
    tr('calendar.upcoming.labelFeast'),
    tr('calendar.upcoming.labelMary'),
    tr('calendar.filters.saints'),
    tr('calendar.filters.rhythm'),
    tr('calendar.filters.fast'),
    tr('calendar.filters.paschal'),
    tr('calendar.upcoming.labelSeason'),
  ]
  const markScreenReader: Record<CalendarCellMarkKind, string> = {
    majorFeast: tr('calendar.dayCell.majorFeastDay'),
    feast: tr('calendar.dayCell.feastDay'),
    fast: tr('calendar.dayCell.fastDay'),
    mary: tr('calendar.dayCell.marianObservance'),
    saint: tr('calendar.dayCell.saintCommemoration'),
    recurring: tr('calendar.dayCell.weeklyOrMonthlyRhythm'),
    season: tr('calendar.dayCell.liturgicalSeason'),
    movable: tr('calendar.dayCell.paschalCycle'),
  }

  const gridRegionLabel = `${t('calendarGridRegion')}: ${label}`

  return (
    <div className={styles.wrap}>
      <div className={styles.monthRow}>
        <div className={styles.monthNav}>
          {onPrevMonth ? (
            <button
              type="button"
              className={styles.navBtn}
              onClick={onPrevMonth}
              aria-label={t('calPrevMonth')}
            >
              ‹
            </button>
          ) : null}
          <p className={styles.month}>{label}</p>
          {onNextMonth ? (
            <button
              type="button"
              className={styles.navBtn}
              onClick={onNextMonth}
              aria-label={t('calNextMonth')}
            >
              ›
            </button>
          ) : null}
        </div>
        <ul className={styles.legend} aria-label={t('calendarDayMarkersLegend')}>
          {(
            [
              ['majorFeast', styles.cueMajorFeast, legendLabels[0]],
              ['feast', styles.cueFeast, legendLabels[1]],
              ['mary', styles.cueMary, legendLabels[2]],
              ['saint', styles.cueSaint, legendLabels[3]],
              ['recurring', styles.cueRecurring, legendLabels[4]],
              ['fast', styles.cueFast, legendLabels[5]],
              ['movable', styles.cueMovable, legendLabels[6]],
              ['season', styles.cueSeason, legendLabels[7]],
            ] as const
          ).map(([_, cueClass, label]) => (
            <li key={label} className={styles.legendItem}>
              <span className={`${styles.legendCue} ${cueClass}`} aria-hidden />
              <span>{label}</span>
            </li>
          ))}
        </ul>
      </div>
      <div className={styles.weekdays} aria-hidden="true">
        {weekLabels.map((d, i) => (
          <span key={`${d}-${i}`} className={styles.wd}>
            {d}
          </span>
        ))}
      </div>
      <div
        key={`${year}-${month}`}
        className={styles.grid}
        role="region"
        aria-label={gridRegionLabel}
      >
        {cells.map((cell, idx) => {
          if (cell === null) {
            return <div key={`e-${idx}`} className={styles.cellEmpty} aria-hidden="true" />
          }
          const isToday = cell === todayDay
          const mark = dayMarks?.get(cell)
          const markedLegacy = !dayMarks && markSet.has(cell)
          const isSelected = selectedDay === cell
          const interactive = Boolean(onSelectDay)
          const hasMark = Boolean(mark) || markedLegacy

          const markKind = mark?.primary
          const markClass = markKind
            ? MARK_PRIMARY_CLASS[markKind] ?? ''
            : ''

          const cls = [
            styles.cell,
            isToday ? styles.today : '',
            hasMark ? styles.hasMark : '',
            markedLegacy && !mark ? styles.markedLegacy : '',
            markClass,
            mark?.alsoFast && mark.primary !== 'fast' ? styles.alsoFast : '',
            isSelected ? styles.selected : '',
          ]
            .filter(Boolean)
            .join(' ')

          const baseAria = cellAriaLabel(year, month, cell, mark, markedLegacy, locale, tr)
          const aria =
            interactive && isSelected
              ? `${baseAria} ${t('calendarDaySelectedSuffix')}`
              : baseAria

          const kindSr = markKind
            ? markScreenReader[markKind]
            : markedLegacy
              ? tr('calendar.dayCell.liturgicalObservance')
              : ''
          const fastSr = mark?.alsoFast && mark.primary !== 'fast' ? ` ${tr('calendar.dayCell.includesFasting')}` : ''

          if (!interactive) {
            return (
              <div
                key={cell}
                className={cls}
                aria-label={aria}
                aria-current={isToday ? 'date' : undefined}
              >
                <span className={styles.num}>{cell}</span>
                {kindSr ? (
                  <span className={styles.srOnly}>
                    {kindSr}
                    {fastSr}
                  </span>
                ) : null}
              </div>
            )
          }
          return (
            <button
              key={cell}
              type="button"
              className={cls}
              aria-label={aria}
              aria-current={isToday ? 'date' : undefined}
              onClick={() => onSelectDay!(cell)}
            >
              <span className={styles.num}>{cell}</span>
              {kindSr ? (
                <span className={styles.srOnly}>
                  {kindSr}
                  {fastSr}
                </span>
              ) : null}
            </button>
          )
        })}
      </div>
    </div>
  )
}

function buildMonthGrid(year: number, month: number, anchor: Date, locale: string) {
  const first = new Date(year, month, 1)
  const startPad = first.getDay()
  const daysInMonth = new Date(year, month + 1, 0).getDate()
  const label = new Intl.DateTimeFormat(locale, {
    month: 'long',
    year: 'numeric',
  }).format(first)

  const cells: (number | null)[] = []
  for (let i = 0; i < startPad; i++) cells.push(null)
  for (let d = 1; d <= daysInMonth; d++) cells.push(d)

  const isSameMonth =
    anchor.getFullYear() === year && anchor.getMonth() === month
  const todayDay = isSameMonth ? anchor.getDate() : null

  return { label, cells, todayDay }
}
