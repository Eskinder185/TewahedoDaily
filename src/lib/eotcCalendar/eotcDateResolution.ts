import { EOTC_TAGGED_ENTRIES } from './eotcCalendarDataset'
import type { EotcCalendarDatasetRow } from './eotcTypes'
import {
  matchesEntryForContext,
  matchesFixedEntry,
  matchesMonthlyRecurringEntry,
  matchesMovableEntry,
  matchesSeasonEntry,
  matchesWeeklyRecurringEntry,
} from './eotcEntryDateMatchers'
import {
  buildLiturgicalCalendarContext,
  stripLocalCalendarDate,
} from './liturgicalCalendarContext'

/** Optional override for tests or filtered corpora (defaults to full bundled dataset). */
export type EotcCalendarRowSource = readonly EotcCalendarDatasetRow[]

function resolveRows(rows?: EotcCalendarRowSource): readonly EotcCalendarDatasetRow[] {
  return rows ?? EOTC_TAGGED_ENTRIES
}

/**
 * All dataset rows whose `date.kind` rules match the selected local civil day.
 * Includes weekly-recurring rows (e.g. Wednesday / Friday fasts).
 */
export function getEntriesForDate(
  selectedDate: Date,
  rows?: EotcCalendarRowSource,
): EotcCalendarDatasetRow[] {
  const d = stripLocalCalendarDate(selectedDate)
  const { ethiopian, pascha } = buildLiturgicalCalendarContext(d)
  return [...resolveRows(rows)].filter((r) =>
    matchesEntryForContext(r.entry, d, ethiopian, pascha),
  )
}

export function getFixedEntriesForDate(
  selectedDate: Date,
  rows?: EotcCalendarRowSource,
): EotcCalendarDatasetRow[] {
  const d = stripLocalCalendarDate(selectedDate)
  const { ethiopian } = buildLiturgicalCalendarContext(d)
  return [...resolveRows(rows)].filter(
    (r) => r.entry.date.kind === 'fixed' && matchesFixedEntry(r.entry, ethiopian),
  )
}

export function getMonthlyRecurringEntriesForDate(
  selectedDate: Date,
  rows?: EotcCalendarRowSource,
): EotcCalendarDatasetRow[] {
  const d = stripLocalCalendarDate(selectedDate)
  const { ethiopian } = buildLiturgicalCalendarContext(d)
  return [...resolveRows(rows)].filter(
    (r) =>
      r.entry.date.kind === 'monthly-recurring' &&
      matchesMonthlyRecurringEntry(r.entry, ethiopian),
  )
}

export function getWeeklyRecurringEntriesForDate(
  selectedDate: Date,
  rows?: EotcCalendarRowSource,
): EotcCalendarDatasetRow[] {
  const d = stripLocalCalendarDate(selectedDate)
  return [...resolveRows(rows)].filter(
    (r) =>
      r.entry.date.kind === 'weekly-recurring' &&
      matchesWeeklyRecurringEntry(r.entry, d),
  )
}

export function getSeasonEntriesForDate(
  selectedDate: Date,
  rows?: EotcCalendarRowSource,
): EotcCalendarDatasetRow[] {
  const d = stripLocalCalendarDate(selectedDate)
  const { pascha } = buildLiturgicalCalendarContext(d)
  return [...resolveRows(rows)].filter(
    (r) =>
      r.entry.date.kind === 'season' && matchesSeasonEntry(r.entry, d, pascha),
  )
}

export function getMovableEntriesForDate(
  selectedDate: Date,
  rows?: EotcCalendarRowSource,
): EotcCalendarDatasetRow[] {
  const d = stripLocalCalendarDate(selectedDate)
  const { pascha } = buildLiturgicalCalendarContext(d)
  return [...resolveRows(rows)].filter(
    (r) =>
      r.entry.date.kind === 'movable' && matchesMovableEntry(r.entry, d, pascha),
  )
}

/**
 * Entries merged into daily church UI: same as `getEntriesForDate`, but omits
 * `weekly-recurring` rows so Wednesday/Friday rhythm stays on existing fast chips.
 */
export function collectEotcMatchesForLocalDay(
  selectedDate: Date,
  rows?: EotcCalendarRowSource,
): EotcCalendarDatasetRow[] {
  return getEntriesForDate(selectedDate, rows).filter(
    (r) => r.entry.date.kind !== 'weekly-recurring',
  )
}
