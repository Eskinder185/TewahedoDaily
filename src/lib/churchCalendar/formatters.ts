import { formatEthiopianLong } from '../ethiopianDate'
import type { EthiopianDateParts } from '../ethiopianDate'

const WEEKDAYS_LONG = [
  'Sunday',
  'Monday',
  'Tuesday',
  'Wednesday',
  'Thursday',
  'Friday',
  'Saturday',
] as const

export function formatGregorianLong(date: Date): string {
  return new Intl.DateTimeFormat('en-US', {
    weekday: 'long',
    month: 'long',
    day: 'numeric',
    year: 'numeric',
  }).format(date)
}

export function formatWeekdayLong(date: Date): string {
  return WEEKDAYS_LONG[date.getDay()] ?? ''
}

export function formatEthiopianLabel(parts: EthiopianDateParts): string {
  return formatEthiopianLong(parts)
}
