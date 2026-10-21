import type { AppLocale } from '../i18n/locale'
import { ETHIOPIAN_MONTH_NAMES, gregorianToEthiopian } from '../ethiopianDate'

/** Interface names for the Ethiopian months. These are labels, not Scripture. */
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
  'ጳጉሜን',
] as const

function intlLocale(locale: AppLocale): string {
  return locale === 'am' ? 'am' : 'en-US'
}

export function formatGregorianShort(date: Date, locale: AppLocale): string {
  const formatted = date.toLocaleDateString(intlLocale(locale), {
    month: 'short',
    day: 'numeric',
  })
  return locale === 'en' ? formatted.toUpperCase() : formatted
}

export function formatGregorianLong(date: Date, locale: AppLocale): string {
  return date.toLocaleDateString(intlLocale(locale), {
    weekday: 'long',
    month: 'long',
    day: 'numeric',
    year: 'numeric',
  })
}

export function formatGregorianMonth(date: Date, locale: AppLocale): string {
  return date.toLocaleDateString(intlLocale(locale), {
    month: 'long',
    day: 'numeric',
    year: 'numeric',
  })
}

export function formatEthiopianDay(date: Date, locale: AppLocale, withYear = false): string {
  const eth = gregorianToEthiopian(date)
  const names = locale === 'am' ? ETHIOPIAN_MONTH_NAMES_AM : ETHIOPIAN_MONTH_NAMES
  const name = names[eth.month - 1] || String(eth.month)
  return withYear ? `${name} ${eth.day}, ${eth.year}` : `${name} ${eth.day}`
}
