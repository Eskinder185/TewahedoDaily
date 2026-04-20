import type { EthiopianDateParts } from '../ethiopianDate'
import { gregorianToEthiopian } from '../ethiopianDate'
import { addDays, sameLocalCalendarDay } from '../churchCalendar/pascha'
import type { EotcCalendarEntry, EotcSeasonRange } from './eotcTypes'
import { anchorToGregorian, stripLocalCalendarDate } from './liturgicalCalendarContext'
import {
  ethDateInInclusiveFixedRange,
  ethiopianPartsToGregorian,
} from './ethiopianGregorianBridge'
import { ethMonthFromEnglishName } from './eotcEthiopianMonthNames'

const WEEKDAY_TO_JS: Record<string, number> = {
  sunday: 0,
  monday: 1,
  tuesday: 2,
  wednesday: 3,
  thursday: 4,
  friday: 5,
  saturday: 6,
}

function civilDayOrder(d: Date): number {
  return stripLocalCalendarDate(d).getTime()
}

function betweenInclusiveLocal(d: Date, a: Date, b: Date): boolean {
  const t = civilDayOrder(d)
  return t >= civilDayOrder(a) && t <= civilDayOrder(b)
}

/**
 * Gregorian local civil date of this movable entry for the given Pascha year context,
 * or null if anchors/offsets cannot be resolved.
 *
 * Rule: `anchorToGregorian(anchor, pascha) + offsetFromAnchor` days. This matches the
 * bundled dataset (all `movable` rows use `nineveh-fast` + day offsets from that Monday).
 */
export function resolveMovableOccurrenceGregorian(
  entry: EotcCalendarEntry,
  pascha: Date | null,
): Date | null {
  if (entry.date.kind !== 'movable') return null
  if (!pascha) return null
  const anchor = entry.date.movableAnchor
  if (!anchor) return null
  const base = anchorToGregorian(anchor, pascha)
  if (!base) return null
  const off = entry.date.offsetFromAnchor ?? 0
  return addDays(base, off)
}

function matchSeasonRange(
  sr: EotcSeasonRange,
  d: Date,
  pascha: Date | null,
): boolean {
  if (sr.startFixed && sr.endFixed) {
    const sm = ethMonthFromEnglishName(sr.startFixed.ethiopianMonth)
    const em = ethMonthFromEnglishName(sr.endFixed.ethiopianMonth)
    if (sm == null || em == null) return false
    const eth = gregorianToEthiopian(d)
    return ethDateInInclusiveFixedRange(
      eth,
      sm,
      sr.startFixed.ethiopianDay,
      em,
      sr.endFixed.ethiopianDay,
    )
  }

  if (!pascha) return false

  if (sr.startAnchor && sr.endAnchor) {
    const sa = anchorToGregorian(sr.startAnchor, pascha)
    const ea = anchorToGregorian(sr.endAnchor, pascha)
    if (!sa || !ea) return false
    const start = addDays(sa, sr.startOffset ?? 0)
    const end = addDays(ea, sr.endOffset ?? 0)
    return betweenInclusiveLocal(d, start, end)
  }

  if (sr.startAnchor && sr.endFixed && !sr.endAnchor) {
    const sa = anchorToGregorian(sr.startAnchor, pascha)
    if (!sa) return false
    const start = addDays(sa, sr.startOffset ?? 0)
    const em = ethMonthFromEnglishName(sr.endFixed.ethiopianMonth)
    if (em == null) return false
    const pentecostG = anchorToGregorian('pentecost', pascha)
    if (!pentecostG) return false
    const ethP = gregorianToEthiopian(pentecostG)
    let endG = ethiopianPartsToGregorian(
      ethP.year,
      em,
      sr.endFixed.ethiopianDay,
    )
    if (civilDayOrder(endG) < civilDayOrder(start)) {
      endG = ethiopianPartsToGregorian(
        ethP.year + 1,
        em,
        sr.endFixed.ethiopianDay,
      )
    }
    return (
      civilDayOrder(d) >= civilDayOrder(start) &&
      civilDayOrder(d) <= civilDayOrder(endG)
    )
  }

  return false
}

export function matchesFixedEntry(
  entry: EotcCalendarEntry,
  eth: EthiopianDateParts,
): boolean {
  if (entry.date.kind !== 'fixed') return false
  const em = ethMonthFromEnglishName(entry.date.ethiopianMonth)
  const ed = entry.date.ethiopianDay
  if (em == null || ed == null) return false
  return eth.month === em && eth.day === ed
}

export function matchesMonthlyRecurringEntry(
  entry: EotcCalendarEntry,
  eth: EthiopianDateParts,
): boolean {
  if (entry.date.kind !== 'monthly-recurring') return false
  const dom = entry.date.monthlyRecurringDay
  if (dom == null) return false
  return eth.day === dom
}

export function matchesWeeklyRecurringEntry(
  entry: EotcCalendarEntry,
  selectedDate: Date,
): boolean {
  if (entry.date.kind !== 'weekly-recurring') return false
  const w = entry.date.weeklyRecurringDay?.toLowerCase()
  if (!w) return false
  const js = WEEKDAY_TO_JS[w]
  if (js === undefined) return false
  return stripLocalCalendarDate(selectedDate).getDay() === js
}

export function matchesSeasonEntry(
  entry: EotcCalendarEntry,
  selectedDate: Date,
  pascha: Date | null,
): boolean {
  if (entry.date.kind !== 'season') return false
  if (!entry.date.seasonRange) return false
  if (!pascha) return false
  return matchSeasonRange(entry.date.seasonRange, selectedDate, pascha)
}

export function matchesMovableEntry(
  entry: EotcCalendarEntry,
  selectedDate: Date,
  pascha: Date | null,
): boolean {
  if (entry.date.kind !== 'movable') return false
  const target = resolveMovableOccurrenceGregorian(entry, pascha)
  if (!target) return false
  return sameLocalCalendarDay(stripLocalCalendarDate(selectedDate), target)
}

export function matchesEntryForContext(
  entry: EotcCalendarEntry,
  selectedDate: Date,
  eth: EthiopianDateParts,
  pascha: Date | null,
): boolean {
  switch (entry.date.kind) {
    case 'fixed':
      return matchesFixedEntry(entry, eth)
    case 'monthly-recurring':
      return matchesMonthlyRecurringEntry(entry, eth)
    case 'weekly-recurring':
      return matchesWeeklyRecurringEntry(entry, selectedDate)
    case 'season':
      return matchesSeasonEntry(entry, selectedDate, pascha)
    case 'movable':
      return matchesMovableEntry(entry, selectedDate, pascha)
    default:
      return false
  }
}
