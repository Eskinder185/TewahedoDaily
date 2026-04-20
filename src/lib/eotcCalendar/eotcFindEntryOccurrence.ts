import { addDays } from '../churchCalendar/pascha'
import { stripLocalCalendarDate } from './liturgicalCalendarContext'
import { getEntriesForDate } from './eotcDateResolution'
import type { EotcCalendarRowSource } from './eotcDateResolution'

/**
 * Next local civil day (including `from` at start-of-day semantics) on which
 * the bundled resolvers surface this entry id.
 */
export function findNextCivilDayForEntry(
  entryId: string,
  from: Date,
  options?: { maxDays?: number; rows?: EotcCalendarRowSource },
): Date | null {
  const maxDays = options?.maxDays ?? 800
  const rows = options?.rows
  const start = stripLocalCalendarDate(from)
  for (let i = 0; i < maxDays; i++) {
    const d = addDays(start, i)
    const hits = getEntriesForDate(d, rows)
    if (hits.some((h) => h.entry.id === entryId)) return d
  }
  return null
}
