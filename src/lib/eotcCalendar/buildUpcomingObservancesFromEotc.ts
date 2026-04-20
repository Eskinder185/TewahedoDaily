import type { UpcomingObservanceEntry } from '../../data/types/churchDay'
import { toGregorianIsoDate } from '../../data/utils/gregorianIso'
import {
  formatEthiopianLong,
  gregorianToEthiopian,
} from '../ethiopianDate'
import { formatGregorianLong } from '../churchCalendar/formatters'
import { addDays } from '../churchCalendar/pascha'
import { stripLocalCalendarDate } from './liturgicalCalendarContext'
import { mapEotcDatasetRowToUiKind } from './eotcObservanceUiMapping'
import {
  getEntriesForDate,
  type EotcCalendarRowSource,
} from './eotcDateResolution'
import { sortEotcEntriesForCalendarPanel } from './eotcCalendarPanelOrdering'
import type { EotcCalendarDatasetRow } from './eotcTypes'

function eotcRowToUpcomingEntry(
  row: EotcCalendarDatasetRow,
  anchorLocalDay: Date,
): UpcomingObservanceEntry {
  const e = row.entry
  const d = stripLocalCalendarDate(anchorLocalDay)
  const eth = gregorianToEthiopian(d)
  const iso = toGregorianIsoDate(d)
  const kind = mapEotcDatasetRowToUiKind(row)

  const scheduling: UpcomingObservanceEntry['scheduling'] =
    e.date.kind === 'movable' ? 'movable' : 'fixed'

  return {
    id: e.id,
    title: e.englishTitle?.trim() || e.title,
    transliterationTitle: e.transliterationTitle ?? undefined,
    shortDescription: e.summary.short,
    meaning: e.summary.whyItMatters,
    observance: e.observance.commonPractices.join(', '),
    dateEthiopian: formatEthiopianLong(eth),
    dateGregorian: formatGregorianLong(d),
    gregorianAnchorIso: iso,
    kind,
    scheduling,
    ruleSummary: e.date.gregorianHint ?? undefined,
  }
}

/**
 * Forward-scan civil days; first time an entry id appears is its “next” local anchor
 * (dedupes weekly / season rows naturally).
 */
export function buildUpcomingObservancesFromEotc(
  referenceLocalDay: Date,
  options?: {
    horizonDays?: number
    maxItems?: number
    rows?: EotcCalendarRowSource
  },
): UpcomingObservanceEntry[] {
  const horizon = options?.horizonDays ?? 420
  const maxItems = options?.maxItems ?? 64
  const rowSource = options?.rows

  const ref = stripLocalCalendarDate(referenceLocalDay)
  const seen = new Set<string>()
  const out: UpcomingObservanceEntry[] = []

  for (let i = 0; i < horizon; i++) {
    const d = addDays(ref, i)
    const rows = sortEotcEntriesForCalendarPanel(getEntriesForDate(d, rowSource))
    for (const row of rows) {
      const id = row.entry.id
      if (seen.has(id)) continue
      seen.add(id)
      out.push(eotcRowToUpcomingEntry(row, d))
      if (out.length >= maxItems) return out
    }
  }

  return out
}
