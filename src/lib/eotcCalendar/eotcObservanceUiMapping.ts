import type {
  ObservanceType,
  UpcomingObservanceUiKind,
} from '../../data/types/churchDay'
import type { EotcCalendarDatasetRow } from './eotcTypes'

/**
 * Map one EOTC dataset row to UI “chip” / card kind for upcoming lists.
 * Aligns with `eotcRowToCellMarkKind` in `calendarMonthDayMarks` where possible.
 */
export function mapEotcDatasetRowToUiKind(
  row: EotcCalendarDatasetRow,
): UpcomingObservanceUiKind {
  const e = row.entry
  const k = e.date.kind
  const p = e.category.primary
  const fs = e.observance.fastStatus

  if (k === 'weekly-recurring') return 'weekly'
  if (k === 'season') return 'season'
  if (p === 'mary') return 'marian'
  if (p === 'angel') return 'angel'
  if (p === 'saint' || p === 'martyr' || p === 'apostle') return 'saint'

  if (
    p === 'fast' ||
    (fs === 'fast' &&
      p !== 'major-feast' &&
      p !== 'minor-feast' &&
      k !== 'movable')
  ) {
    return 'fast'
  }
  if (fs === 'fast' && k === 'movable') return 'fast'
  if (p === 'major-feast' || p === 'minor-feast') return 'feast'
  if (k === 'monthly-recurring') return 'commemoration'
  if (k === 'movable') {
    if (fs === 'fast') return 'fast'
    return 'feast'
  }
  return 'commemoration'
}

/** Derive `DailyChurchData.observanceType` tags from EOTC category + date kind. */
export function mapEotcDatasetRowToObservanceTypes(
  row: EotcCalendarDatasetRow,
): ObservanceType[] {
  const e = row.entry
  const p = e.category.primary
  const k = e.date.kind
  const fs = e.observance.fastStatus

  const out: ObservanceType[] = []
  const push = (t: ObservanceType) => {
    if (!out.includes(t)) out.push(t)
  }

  if (p === 'mary') push('marian-observance')
  else if (p === 'angel') push('angel-commemoration')
  else if (p === 'saint' || p === 'martyr' || p === 'apostle') {
    push('saint-commemoration')
  } else if (p === 'major-feast' || p === 'minor-feast') {
    push(k === 'movable' ? 'movable-feast' : 'feast')
  }

  if (fs === 'fast' || p === 'fast') push('fast')
  if (k === 'season') push('seasonal-observance')

  if (out.length === 0) push('mixed-observance')
  return out
}
