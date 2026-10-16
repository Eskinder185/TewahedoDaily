import { formatEthiopianLong, gregorianToEthiopian } from '../ethiopianDate'

/** Lightweight home date labels — no calendar/eotc dataset import. */
export function getHomeDayLabels(date: Date = new Date()) {
  const eth = gregorianToEthiopian(date)
  const gregorianLabel = new Intl.DateTimeFormat(undefined, {
    weekday: 'long',
    month: 'long',
    day: 'numeric',
    year: 'numeric',
  }).format(date)
  return {
    gregorianLabel,
    ethiopianLabel: formatEthiopianLong(eth),
    weekday: new Intl.DateTimeFormat(undefined, { weekday: 'long' }).format(date),
  }
}
