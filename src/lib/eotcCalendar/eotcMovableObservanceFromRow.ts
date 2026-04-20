import type { MovableObservanceOnDay } from '../../data/types/churchDay'
import type { EotcCalendarDatasetRow } from './eotcTypes'

/**
 * Snapshot “secondary” row for home/detail movable sections — same shape as legacy catalog cards.
 * `catalogEventId` holds the EOTC entry id (stable key for imagery + deep links).
 */
export function eotcDatasetRowToMovableObservanceOnDay(
  row: EotcCalendarDatasetRow,
): MovableObservanceOnDay {
  const entry = row.entry
  const scheduling =
    entry.date.kind === 'movable' ? 'movable' : 'fixed'
  return {
    id: entry.id,
    catalogEventId: entry.id,
    scheduling,
    title: entry.englishTitle?.trim() || entry.title,
    transliterationTitle: entry.transliterationTitle ?? undefined,
    shortDescription: entry.summary.short,
    meaning: entry.summary.whyItMatters ?? entry.summary.short,
    observance: entry.observance.commonPractices.join(', '),
    ruleSummary: entry.date.gregorianHint ?? undefined,
  }
}
