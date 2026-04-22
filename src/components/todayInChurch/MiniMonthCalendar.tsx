import { useMemo } from 'react'
import type { CalendarCellMarkKind, CalendarDayCellMark } from '../../lib/churchCalendar'
import { useUiLabel } from '../../lib/i18n/uiLabels'
import styles from './MiniMonthCalendar.module.css'

const WEEK_LABELS = ['S', 'M', 'T', 'W', 'T', 'F', 'S'] as const

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

const MARK_SCREEN_READER: Record<CalendarCellMarkKind, string> = {
  majorFeast: 'Great feast day.',
  feast: 'Feast day.',
  fast: 'Fast day.',
  mary: 'Marian observance.',
  saint: 'Saint or angel commemoration.',
  recurring: 'Weekly or monthly church rhythm.',
  season: 'Liturgical season.',
  movable: 'Paschal-cycle observance.',
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

function civilDatePhrase(year: number, monthIndex: number, day: number): string {
  const d = new Date(year, monthIndex, day)
  return new Intl.DateTimeFormat('en-US', {
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
): string {
  const datePart = civilDatePhrase(year, monthIndex, day)
  if (mark?.label) {
    const fastNote = mark.alsoFast ? ' Also includes a fast day.' : ''
    return `${datePart}. ${mark.label}.${fastNote}`
  }
  if (markedLegacy) {
    return `${datePart}. Liturgical observance.`
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
  const year = displayYear ?? anchor.getFullYear()
  const month = displayMonthIndex ?? anchor.getMonth()
  const markSet = useMemo(() => new Set(markedDays), [markedDays])

  const { label, cells, todayDay } = useMemo(
    () => buildMonthGrid(year, month, anchor),
    [year, month, anchor],
  )

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
              ['majorFeast', styles.cueMajorFeast, 'Great feast'],
              ['feast', styles.cueFeast, 'Feast'],
              ['mary', styles.cueMary, 'Mary'],
              ['saint', styles.cueSaint, 'Saint'],
              ['recurring', styles.cueRecurring, 'Rhythm'],
              ['fast', styles.cueFast, 'Fast'],
              ['movable', styles.cueMovable, 'Paschal'],
              ['season', styles.cueSeason, 'Season'],
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
        {WEEK_LABELS.map((d, i) => (
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

          const baseAria = cellAriaLabel(year, month, cell, mark, markedLegacy)
          const aria =
            interactive && isSelected
              ? `${baseAria} ${t('calendarDaySelectedSuffix')}`
              : baseAria

          const kindSr = markKind
            ? MARK_SCREEN_READER[markKind]
            : markedLegacy
              ? 'Liturgical observance.'
              : ''
          const fastSr = mark?.alsoFast && mark.primary !== 'fast' ? ' Includes fasting.' : ''

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

function buildMonthGrid(year: number, month: number, anchor: Date) {
  const first = new Date(year, month, 1)
  const startPad = first.getDay()
  const daysInMonth = new Date(year, month + 1, 0).getDate()
  const label = new Intl.DateTimeFormat('en-US', {
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
