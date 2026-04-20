import type { DailyChurchData } from '../../data/types/churchDay'
import { parseGregorianAnchorIso } from '../churchCalendar/upcomingObservanceDisplay'
import { EOTC_TAGGED_ENTRIES } from './eotcCalendarDataset'
import { collectEotcMatchesForLocalDay } from './eotcDateResolution'

function combineFastChip(
  weekly: string | null,
  seasonal: string | null,
): string | null {
  if (weekly && seasonal) return `${weekly} · ${seasonal}`
  return weekly ?? seasonal ?? null
}

function priority(te: { entry: { display?: { priority?: number } } }): number {
  return te.entry.display?.priority ?? 50
}

function pickEotcFastSeasonLabel(
  matches: ReturnType<typeof collectEotcMatchesForLocalDay>,
): string | null {
  let best: { p: number; label: string } | null = null
  for (const te of matches) {
    if (te.collection !== 'fasts') continue
    if (te.entry.date.kind !== 'season') continue
    if (te.entry.observance.fastStatus !== 'fast') continue
    const p = priority(te)
    const label = te.entry.summary.short
    if (!best || p < best.p) best = { p, label }
  }
  return best?.label ?? null
}

/**
 * Enrich mock/liturgical daily church data with EOTC-derived seasonal fast copy.
 * Movable/secondary cards are supplied upstream from `getEntriesForDate` (EOTC JSON).
 */
export function mergeEotcIntoDailyChurch(data: DailyChurchData): DailyChurchData {
  const ref =
    parseGregorianAnchorIso(data.gregorianDate) ??
    new Date(
      new Date().getFullYear(),
      new Date().getMonth(),
      new Date().getDate(),
    )

  const matches = collectEotcMatchesForLocalDay(ref, EOTC_TAGGED_ENTRIES)

  const fastLabel = pickEotcFastSeasonLabel(matches)
  let fastSeasonal = data.fastSeasonal
  if (fastLabel) {
    fastSeasonal = fastSeasonal ? `${fastSeasonal} · ${fastLabel}` : fastLabel
  }

  const fast = combineFastChip(data.fastWeekly, fastSeasonal)

  return {
    ...data,
    fastSeasonal,
    fast,
  }
}
