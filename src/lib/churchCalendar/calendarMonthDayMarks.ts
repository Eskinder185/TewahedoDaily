import { buildChurchDaySnapshot } from './buildChurchDaySnapshot'
import type { ChurchDaySnapshot, ObservanceType } from './types'
import { getEntriesForDate, sortEotcEntriesForCalendarPanel } from '../eotcCalendar'
import type { EotcCalendarDatasetRow } from '../eotcCalendar/eotcTypes'

/**
 * Primary mini-calendar decoration. Shapes + border patterns (not color alone) are
 * defined in `MiniMonthCalendar.module.css`.
 */
export type CalendarCellMarkKind =
  | 'majorFeast'
  | 'feast'
  | 'fast'
  | 'mary'
  | 'saint'
  | 'recurring'
  | 'season'
  | 'movable'

export type CalendarDayCellMark = {
  primary: CalendarCellMarkKind
  /** When true, show an extra fast cue alongside non-fast primaries. */
  alsoFast: boolean
  /** Short label for aria-labels (dominant observance). */
  label: string
}

function hasType(types: ObservanceType[] | undefined, t: ObservanceType): boolean {
  return Boolean(types?.includes(t))
}

/** Map one EOTC row → grid mark (visual family). */
export function eotcRowToCellMarkKind(
  row: EotcCalendarDatasetRow,
): CalendarCellMarkKind {
  const e = row.entry
  const p = e.category.primary
  const k = e.date.kind
  const fs = e.observance.fastStatus

  if (k === 'season') return 'season'
  if (k === 'weekly-recurring' || k === 'monthly-recurring') return 'recurring'
  if (p === 'mary') return 'mary'
  if (p === 'angel' || p === 'saint' || p === 'martyr' || p === 'apostle') {
    return 'saint'
  }
  if (p === 'fast' || (fs === 'fast' && p !== 'major-feast' && p !== 'minor-feast')) {
    return 'fast'
  }
  if (p === 'major-feast') return 'majorFeast'
  if (p === 'minor-feast') return 'feast'
  if (k === 'movable') {
    if (p === 'major-feast') return 'majorFeast'
    if (fs === 'fast') return 'fast'
    return 'movable'
  }
  return 'feast'
}

function buildMarkFromEotc(sorted: EotcCalendarDatasetRow[]): CalendarDayCellMark | null {
  if (sorted.length === 0) return null
  const primary = eotcRowToCellMarkKind(sorted[0])
  const anyFast = sorted.some((r) => r.entry.observance.fastStatus === 'fast')
  const alsoFast =
    anyFast && primary !== 'fast' && primary !== 'majorFeast' && primary !== 'feast'

  const head = sorted[0].entry
  const labelBase = head.englishTitle?.trim() || head.title
  const label =
    sorted.length > 1 ? `${labelBase} (+${sorted.length - 1} more)` : labelBase

  return { primary, alsoFast, label }
}

function classifySnapshot(snap: ChurchDaySnapshot): CalendarDayCellMark | null {
  const types = snap.commemoration.observanceType ?? []
  const movableHits = snap.movableOnDay.length > 0

  const feastLikeTypes =
    hasType(types, 'feast') ||
    hasType(types, 'movable-feast') ||
    hasType(types, 'marian-observance') ||
    hasType(types, 'angel-commemoration') ||
    hasType(types, 'mixed-observance')

  const hasFast = hasType(types, 'fast')
  const hasSaint = hasType(types, 'saint-commemoration')
  const hasSeason = hasType(types, 'seasonal-observance')
  const hasMarian = hasType(types, 'marian-observance')
  const hasAngel = hasType(types, 'angel-commemoration')

  const title =
    snap.commemoration.title?.trim() ||
    snap.weekday.long ||
    'Liturgical day'

  if (hasMarian) {
    return {
      primary: 'mary',
      alsoFast: hasFast,
      label: title,
    }
  }
  if (hasAngel || hasSaint) {
    return {
      primary: 'saint',
      alsoFast: hasFast,
      label: title,
    }
  }
  if (feastLikeTypes || movableHits) {
    const primary: CalendarCellMarkKind =
      movableHits && !feastLikeTypes ? 'movable' : 'feast'
    return { primary, alsoFast: hasFast, label: title }
  }
  if (hasFast) {
    return { primary: 'fast', alsoFast: false, label: title }
  }
  if (snap.commemoration.subtitle?.trim()) {
    return { primary: 'saint', alsoFast: hasFast, label: title }
  }
  if (hasSeason) {
    return { primary: 'season', alsoFast: hasFast, label: title }
  }

  return null
}

function classifyDay(
  gregorianYear: number,
  monthIndex: number,
  day: number,
): CalendarDayCellMark | null {
  const d = new Date(gregorianYear, monthIndex, day)
  const rows = getEntriesForDate(d)
  if (rows.length > 0) {
    return buildMarkFromEotc(sortEotcEntriesForCalendarPanel(rows))
  }
  const snap = buildChurchDaySnapshot(d)
  return classifySnapshot(snap)
}

/**
 * For a Gregorian month, derive which civil days carry a notable observance
 * (mini-calendar). Prefers resolved `eotc_calendar_json` rows; falls back to the
 * church snapshot when a day has no EOTC matches.
 */
export function computeCalendarDayMarks(
  gregorianYear: number,
  monthIndex: number,
): ReadonlyMap<number, CalendarDayCellMark> {
  const dim = new Date(gregorianYear, monthIndex + 1, 0).getDate()
  const map = new Map<number, CalendarDayCellMark>()
  for (let day = 1; day <= dim; day++) {
    const mark = classifyDay(gregorianYear, monthIndex, day)
    if (mark) map.set(day, mark)
  }
  return map
}
