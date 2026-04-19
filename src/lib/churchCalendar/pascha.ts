import { PASCHA_GREGORIAN_ISO } from '../../data/paschaGregorianTable'

/** Local calendar date (no time-of-day semantics). */
export function parseIsoLocalDate(iso: string): Date | null {
  const t = iso.trim()
  const p = t.split('-').map((x) => Number.parseInt(x, 10))
  if (p.length !== 3 || p.some((n) => Number.isNaN(n))) return null
  const [y, m, d] = p
  if (m < 1 || m > 12 || d < 1 || d > 31) return null
  const dt = new Date(y, m - 1, d)
  if (dt.getFullYear() !== y || dt.getMonth() !== m - 1 || dt.getDate() !== d) return null
  return dt
}

export function toIsoLocalDate(d: Date): string {
  const y = d.getFullYear()
  const m = String(d.getMonth() + 1).padStart(2, '0')
  const day = String(d.getDate()).padStart(2, '0')
  return `${y}-${m}-${day}`
}

export function addDays(d: Date, days: number): Date {
  const x = new Date(d)
  x.setDate(x.getDate() + days)
  return x
}

export function sameLocalCalendarDay(a: Date, b: Date): boolean {
  return (
    a.getFullYear() === b.getFullYear() &&
    a.getMonth() === b.getMonth() &&
    a.getDate() === b.getDate()
  )
}

/**
 * Gregorian date of Fasika for the given civil year Pascha normally falls in,
 * or null when the table has not been extended yet.
 */
export function resolvePaschaGregorianDate(gregorianYear: number): Date | null {
  const iso = PASCHA_GREGORIAN_ISO[gregorianYear]
  if (!iso) return null
  return parseIsoLocalDate(iso)
}

/** First Sunday strictly after Fasika (ዳግም ትንሣኤ / Thomas Sunday / “New Sunday”). */
export function damawiTensaeFromPascha(pascha: Date): Date {
  const probe = addDays(pascha, 1)
  let d = new Date(probe)
  while (d.getDay() !== 0) {
    d = addDays(d, 1)
  }
  return d
}
