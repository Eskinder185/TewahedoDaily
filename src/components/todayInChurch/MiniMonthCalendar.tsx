import { useMemo } from 'react'
import styles from './MiniMonthCalendar.module.css'

const WEEK_LABELS = ['S', 'M', 'T', 'W', 'T', 'F', 'S'] as const

export type MiniMonthCalendarProps = {
  /** Local “today” for highlighting the cell */
  anchor: Date
  displayYear?: number
  displayMonthIndex?: number
  /** Gregorian day-of-month markers (e.g. from snapshot.miniCalendar.markedDays) */
  markedDays?: number[]
  /** Optional selection (same month as display month) */
  selectedDay?: number | null
  onSelectDay?: (day: number) => void
  onPrevMonth?: () => void
  onNextMonth?: () => void
}

export function MiniMonthCalendar({
  anchor,
  displayYear,
  displayMonthIndex,
  markedDays = [],
  selectedDay = null,
  onSelectDay,
  onPrevMonth,
  onNextMonth,
}: MiniMonthCalendarProps) {
  const year = displayYear ?? anchor.getFullYear()
  const month = displayMonthIndex ?? anchor.getMonth()
  const markSet = useMemo(() => new Set(markedDays), [markedDays])

  const { label, cells, todayDay } = useMemo(
    () => buildMonthGrid(year, month, anchor),
    [year, month, anchor],
  )

  return (
    <div className={styles.wrap}>
      <div className={styles.monthRow}>
        <div className={styles.monthNav}>
          {onPrevMonth ? (
            <button
              type="button"
              className={styles.navBtn}
              onClick={onPrevMonth}
              aria-label="Previous month"
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
              aria-label="Next month"
            >
              ›
            </button>
          ) : null}
        </div>
        <span className={styles.legend}>
          <span className={styles.dot} aria-hidden />
          Observance
        </span>
      </div>
      <div className={styles.weekdays} role="row">
        {WEEK_LABELS.map((d, i) => (
          <span key={`${d}-${i}`} className={styles.wd}>
            {d}
          </span>
        ))}
      </div>
      <div className={styles.grid} role="grid" aria-label={label}>
        {cells.map((cell, idx) => {
          if (cell === null) {
            return <div key={`e-${idx}`} className={styles.cellEmpty} />
          }
          const isToday = cell === todayDay
          const marked = markSet.has(cell)
          const isSelected = selectedDay === cell
          const interactive = Boolean(onSelectDay)
          const cls = `${styles.cell} ${isToday ? styles.today : ''} ${marked ? styles.marked : ''} ${isSelected ? styles.selected : ''}`
          if (!interactive) {
            return (
              <div
                key={cell}
                className={cls}
                role="gridcell"
                aria-current={isToday ? 'date' : undefined}
              >
                <span className={styles.num}>{cell}</span>
              </div>
            )
          }
          return (
            <button
              key={cell}
              type="button"
              className={cls}
              role="gridcell"
              aria-current={isToday ? 'date' : undefined}
              aria-pressed={isSelected}
              onClick={() => onSelectDay!(cell)}
            >
              <span className={styles.num}>{cell}</span>
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
