import {
  gregorianToEthiopian,
  type EthiopianDateParts,
} from '../ethiopianDate'

function stripLocalDate(d: Date): Date {
  return new Date(d.getFullYear(), d.getMonth(), d.getDate())
}

/**
 * Inverse of `gregorianToEthiopian` for one Ethiopic civil date (linear scan; fast enough for bundle size).
 */
export function ethiopianPartsToGregorian(
  ethYear: number,
  ethMonth: number,
  ethDay: number,
): Date {
  const start = new Date(ethYear + 7, 7, 1)
  for (let i = 0; i < 400; i++) {
    const g = new Date(
      start.getFullYear(),
      start.getMonth(),
      start.getDate() + i,
    )
    const e = gregorianToEthiopian(g)
    if (e.year === ethYear && e.month === ethMonth && e.day === ethDay) {
      return stripLocalDate(g)
    }
  }
  return stripLocalDate(start)
}

/** Lexicographic (month, day) order within one Ethiopian year (Meskerem … Pagumen). */
export function ethMonthDayTupleCompare(
  m1: number,
  d1: number,
  m2: number,
  d2: number,
): number {
  if (m1 !== m2) return m1 - m2
  return d1 - d2
}

/**
 * Inclusive range on the Ethiopic calendar within `eth.year` (no year-wrap;
 * suffices for current EOTC season JSON).
 */
export function ethDateInInclusiveFixedRange(
  eth: EthiopianDateParts,
  startM: number,
  startD: number,
  endM: number,
  endD: number,
): boolean {
  const t = ethMonthDayTupleCompare(eth.month, eth.day, startM, startD)
  const u = ethMonthDayTupleCompare(eth.month, eth.day, endM, endD)
  return t >= 0 && u <= 0
}
