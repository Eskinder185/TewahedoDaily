/**
 * TEWAHEDODAILY — MATHEMATICALLY ACCURATE ETHIOPIAN CALENDAR ENGINE
 *
 * Implements deterministic bidirectional calendar conversion using integer
 * Julian Day Number (JDN) arithmetic based on the Beyene–Kudlek algorithm.
 *
 * Guaranteed Properties:
 * 1. Exact round-trip consistency: G -> E -> G and E -> G -> E.
 * 2. Strict leap year rules: Year % 4 === 3 for modern positive years.
 * 3. 13 Ethiopian months: Months 1-12 have exactly 30 days; Pagume has 5 (or 6 in leap years).
 * 4. Timezone-safe date-only arithmetic: Immune to UTC midnight shifts.
 */

export interface CivilDate {
  year: number
  month: number // 1..12
  day: number   // 1..31
}

export interface EthiopianDate {
  year: number
  month: number // 1..13
  day: number   // 1..30 (or 1..6 for Pagume)
}

/** Julian Day Number offset for Ethiopian Calendar epoch */
export const ETHIOPIC_JDN_OFFSET = 1723856

export const ETHIOPIAN_MONTH_NAMES_EN = [
  'Meskerem',
  'Tikimt',
  'Hidar',
  'Tahsas',
  'Tir',
  'Yekatit',
  'Megabit',
  'Miyazya',
  'Ginbot',
  'Sene',
  'Hamle',
  'Nehase',
  'Pagume',
] as const

export const ETHIOPIAN_MONTH_NAMES_AM = [
  'መስከረም',
  'ጥቅምት',
  'ኅዳር',
  'ታኅሣሥ',
  'ጥር',
  'የካቲት',
  'መጋቢት',
  'ሚያዝያ',
  'ግንቦት',
  'ሰኔ',
  'ሐምሌ',
  'ነሐሴ',
  'ጳጉሜ',
] as const

export const WEEKDAYS_EN = [
  'Sunday',
  'Monday',
  'Tuesday',
  'Wednesday',
  'Thursday',
  'Friday',
  'Saturday',
] as const

export const WEEKDAYS_AM = [
  'እሑድ',
  'ሰኞ',
  'ማክሰኞ',
  'ረቡዕ',
  'ሐሙስ',
  'ዓርብ',
  'ቀዳሜ',
] as const

/**
 * Calculates Julian Day Number for a Gregorian civil date.
 */
export function gregorianToJDN(year: number, month: number, day: number): number {
  const a = Math.floor((14 - month) / 12)
  const y = year + 4800 - a
  const m = month + 12 * a - 3
  return (
    day +
    Math.floor((153 * m + 2) / 5) +
    365 * y +
    Math.floor(y / 4) -
    Math.floor(y / 100) +
    Math.floor(y / 400) -
    32045
  )
}

/**
 * Calculates Gregorian civil date from a Julian Day Number.
 */
export function jdnToGregorian(jdn: number): CivilDate {
  const a = jdn + 32044
  const b = Math.floor((4 * a + 3) / 146097)
  const c = a - Math.floor((146097 * b) / 4)
  const d = Math.floor((4 * c + 3) / 1461)
  const e = c - Math.floor((1461 * d) / 4)
  const m = Math.floor((5 * e + 2) / 153)
  const day = e - Math.floor((153 * m + 2) / 5) + 1
  const month = m + 3 - 12 * Math.floor(m / 10)
  const year = 100 * b + d - 4800 + Math.floor(m / 10)
  return { year, month, day }
}

/**
 * Calculates Julian Day Number for an Ethiopian date.
 */
export function ethiopianToJDN(year: number, month: number, day: number): number {
  return ETHIOPIC_JDN_OFFSET + 365 * year + Math.floor(year / 4) + (month - 1) * 30 + day - 1
}

/**
 * Calculates Ethiopian date from a Julian Day Number.
 */
export function jdnToEthiopian(jdn: number): EthiopianDate {
  const r = (jdn - ETHIOPIC_JDN_OFFSET) % 1461
  const n = (r % 365) + 365 * Math.floor(r / 1460)
  const ethYear =
    4 * Math.floor((jdn - ETHIOPIC_JDN_OFFSET) / 1461) +
    Math.floor(r / 365) -
    Math.floor(r / 1460)
  const ethMonth = Math.floor(n / 30) + 1
  const ethDay = (n % 30) + 1
  return { year: ethYear, month: ethMonth, day: ethDay }
}

/**
 * Resolves local civil date in a specified timezone.
 * Defaults to client system timezone.
 */
export function getCivilDateInTimezone(date: Date, timeZone?: string): CivilDate {
  if (timeZone) {
    try {
      const formatter = new Intl.DateTimeFormat('en-US', {
        timeZone,
        year: 'numeric',
        month: 'numeric',
        day: 'numeric',
      })
      const parts = formatter.formatToParts(date)
      const y = parseInt(parts.find((p) => p.type === 'year')?.value || '0', 10)
      const m = parseInt(parts.find((p) => p.type === 'month')?.value || '0', 10)
      const d = parseInt(parts.find((p) => p.type === 'day')?.value || '0', 10)
      if (y && m && d) return { year: y, month: m, day: d }
    } catch {}
  }
  return {
    year: date.getFullYear(),
    month: date.getMonth() + 1,
    day: date.getDate(),
  }
}

/**
 * Deterministically converts a Gregorian Date or CivilDate to Ethiopian date.
 */
export function gregorianToEthiopian(
  date: Date | CivilDate,
  timeZone?: string
): EthiopianDate {
  const civil = date instanceof Date ? getCivilDateInTimezone(date, timeZone) : date
  const jdn = gregorianToJDN(civil.year, civil.month, civil.day)
  return jdnToEthiopian(jdn)
}

/**
 * Deterministically converts an Ethiopian date to Gregorian CivilDate.
 */
export function ethiopianToGregorian(ethDate: EthiopianDate): CivilDate {
  const jdn = ethiopianToJDN(ethDate.year, ethDate.month, ethDate.day)
  return jdnToGregorian(jdn)
}

/**
 * True if Ethiopian year is a leap year (Luke / ሉቃስ cycle, Pagume has 6 days).
 */
export function isEthiopianLeapYear(year: number): boolean {
  return (year % 4 + 4) % 4 === 3
}

/**
 * Returns number of days in an Ethiopian month.
 * Months 1-12 always have 30 days. Pagume (13) has 6 in leap years, 5 otherwise.
 */
export function daysInEthiopianMonth(year: number, month: number): number {
  if (month >= 1 && month <= 12) return 30
  if (month === 13) return isEthiopianLeapYear(year) ? 6 : 5
  throw new RangeError(`Invalid Ethiopian month: ${month}`)
}

/**
 * Adds integer days to an Ethiopian date using pure JDN arithmetic.
 */
export function addEthiopianDays(ethDate: EthiopianDate, amount: number): EthiopianDate {
  const jdn = ethiopianToJDN(ethDate.year, ethDate.month, ethDate.day) + amount
  return jdnToEthiopian(jdn)
}

/**
 * Returns localized Ethiopian month name.
 */
export function getEthiopianMonthName(month: number, locale: 'en' | 'am' = 'en'): string {
  if (month < 1 || month > 13) return `Month ${month}`
  const list = locale === 'am' ? ETHIOPIAN_MONTH_NAMES_AM : ETHIOPIAN_MONTH_NAMES_EN
  return list[month - 1]
}

/**
 * Returns weekday index (0=Sunday ... 6=Saturday) and localized name.
 */
export function getEthiopianWeekday(
  date: Date | CivilDate | EthiopianDate,
  locale: 'en' | 'am' = 'en'
): { index: number; name: string } {
  let jdn: number
  if ('year' in date && 'month' in date && 'day' in date) {
    if (date.month > 12) {
      jdn = ethiopianToJDN(date.year, date.month, date.day)
    } else {
      jdn = gregorianToJDN(date.year, date.month, date.day)
    }
  } else {
    const d = date as Date
    jdn = gregorianToJDN(d.getFullYear(), d.getMonth() + 1, d.getDate())
  }

  const index = (jdn + 1) % 7
  const list = locale === 'am' ? WEEKDAYS_AM : WEEKDAYS_EN
  return { index, name: list[index] }
}

/**
 * Returns the Gregorian date range for an Ethiopian year (Meskerem 1 to Pagume 5/6).
 */
export function getEthiopianYearRange(ethYear: number): {
  startGregorian: CivilDate
  endGregorian: CivilDate
} {
  const startGregorian = ethiopianToGregorian({ year: ethYear, month: 1, day: 1 })
  const endMonth = 13
  const endDay = daysInEthiopianMonth(ethYear, endMonth)
  const endGregorian = ethiopianToGregorian({ year: ethYear, month: endMonth, day: endDay })
  return { startGregorian, endGregorian }
}

/**
 * Formats Ethiopian date string.
 */
export function formatEthiopianDate(
  ethDate: EthiopianDate,
  locale: 'en' | 'am' = 'en',
  options?: { includeYear?: boolean }
): string {
  const monthName = getEthiopianMonthName(ethDate.month, locale)
  if (options?.includeYear !== false) {
    return locale === 'am'
      ? `${monthName} ${ethDate.day} ቀን ${ethDate.year} ዓ.ም.`
      : `${monthName} ${ethDate.day}, ${ethDate.year} E.C.`
  }
  return `${monthName} ${ethDate.day}`
}
