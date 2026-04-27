import synaxariumData from '../../data/synaxariumEntries.json'
import { gregorianToEthiopian } from '../ethiopianDate'
import type { SynaxariumCalendarData, SynaxariumEntry } from './synaxariumTypes'

const DATA = synaxariumData as SynaxariumCalendarData

const BY_ETHIOPIAN_MONTH_DAY = new Map<string, SynaxariumEntry>()

for (const entry of DATA.entries) {
  BY_ETHIOPIAN_MONTH_DAY.set(
    monthDayKey(entry.ethiopianMonthNumber, entry.ethiopianDay),
    entry,
  )
}

function monthDayKey(month: number, day: number): string {
  return `${month}-${day}`
}

export function getAllSynaxariumEntries(): readonly SynaxariumEntry[] {
  return DATA.entries
}

export function getSynaxariumEntryForEthiopianDate(
  month: number,
  day: number,
): SynaxariumEntry | null {
  return BY_ETHIOPIAN_MONTH_DAY.get(monthDayKey(month, day)) ?? null
}

export function getSynaxariumEntryForGregorianDate(date: Date): SynaxariumEntry | null {
  const eth = gregorianToEthiopian(date)
  return getSynaxariumEntryForEthiopianDate(eth.month, eth.day)
}

export function hasDetailedSynaxariumEntry(entry: SynaxariumEntry | null): boolean {
  return entry?.status === 'verified'
}
