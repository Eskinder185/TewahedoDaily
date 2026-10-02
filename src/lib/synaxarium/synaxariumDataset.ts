/**
 * Local JSON backup helper only — does NOT import the 1MB synaxariumEntries.json.
 * Public pages must use `synaxariumService.ts` (Supabase).
 * Archived dataset: `archive/local-data/synaxarium/synaxariumEntries.json`
 */
import { gregorianToEthiopian } from '../ethiopianDate'
import type { SynaxariumEntry } from './synaxariumTypes'

export function getAllSynaxariumEntries(): readonly SynaxariumEntry[] {
  return []
}

export function hasDetailedSynaxariumEntry(_entry: SynaxariumEntry | null | undefined): boolean {
  return false
}

/** @deprecated Prefer `getSynaxariumDayWithCommemorations` from synaxariumService (Supabase). */
export function getSynaxariumEntryForEthiopianDate(
  _month: number,
  _day: number,
): SynaxariumEntry | null {
  return null
}

/** @deprecated Prefer Supabase `synaxariumService`. */
export function getSynaxariumEntryForGregorianDate(date: Date): SynaxariumEntry | null {
  void gregorianToEthiopian(date)
  return null
}

export const SYNAXARIUM_DATASET_ARCHIVED = true
