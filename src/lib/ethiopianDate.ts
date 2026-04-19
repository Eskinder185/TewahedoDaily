/** Beyene–Kudlek via JDN; Ethiopic epoch offset per ICU / ethiopic.org references. */
const ETHIOPIC_JDN_OFFSET = 1723856

function mod(i: number, j: number): number {
  return i - j * Math.floor(i / j)
}

export function gregorianToJDN(
  year: number,
  month: number,
  day: number,
): number {
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

export type EthiopianDateParts = {
  year: number
  month: number
  day: number
}

export function gregorianToEthiopian(date: Date): EthiopianDateParts {
  const year = date.getFullYear()
  const month = date.getMonth() + 1
  const day = date.getDate()
  const jdn = gregorianToJDN(year, month, day)
  const r = mod(jdn - ETHIOPIC_JDN_OFFSET, 1461)
  const n = mod(r, 365) + 365 * Math.floor(r / 1460)
  const ethYear =
    4 * Math.floor((jdn - ETHIOPIC_JDN_OFFSET) / 1461) +
    Math.floor(r / 365) -
    Math.floor(r / 1460)
  const ethMonth = Math.floor(n / 30) + 1
  const ethDay = mod(n, 30) + 1
  return { year: ethYear, month: ethMonth, day: ethDay }
}

/** 1 = Meskerem … 13 = Pagumen */
export const ETHIOPIAN_MONTH_NAMES = [
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
  'Pagumen',
] as const

export function formatEthiopianLong(parts: EthiopianDateParts): string {
  const name = ETHIOPIAN_MONTH_NAMES[parts.month - 1] ?? '—'
  return `${name} ${parts.day}, ${parts.year}`
}
