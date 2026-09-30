/**
 * Weekday schedule for Today's Prayer Rhythm.
 *
 * IMPORTANT — church calendar verification:
 * Psalm ranges and Wudase weekday slugs below are taken from the project's
 * existing `weekdayPrayerRhythm.ts` mapping (not invented for this change).
 * Confirm against parish practice before treating as authoritative EOTC law.
 */

export type WeekdayIndex = 0 | 1 | 2 | 3 | 4 | 5 | 6

export type WeekdayKey =
  | 'sunday'
  | 'monday'
  | 'tuesday'
  | 'wednesday'
  | 'thursday'
  | 'friday'
  | 'saturday'

export type PsalmRange = {
  from: number
  to: number
}

export type WeekdayLabels = {
  key: WeekdayKey
  english: string
  amharic: string
}

/** Canonical CMS collection slugs (public.prayer_collections). */
export const DAILY_COLLECTION_SLUGS = {
  zewter: 'zewter-tselot',
  wudase: 'wudase-mariam',
  mezmureDawit: 'mezmure-dawit',
} as const

export const WEEKDAY_LABELS: Record<WeekdayIndex, WeekdayLabels> = {
  0: { key: 'sunday', english: 'Sunday', amharic: 'እሁድ' },
  1: { key: 'monday', english: 'Monday', amharic: 'ሰኞ' },
  2: { key: 'tuesday', english: 'Tuesday', amharic: 'ማክሰኞ' },
  3: { key: 'wednesday', english: 'Wednesday', amharic: 'ረቡዕ' },
  4: { key: 'thursday', english: 'Thursday', amharic: 'ሐሙስ' },
  5: { key: 'friday', english: 'Friday', amharic: 'ዓርብ' },
  6: { key: 'saturday', english: 'Saturday', amharic: 'ቅዳሜ' },
}

/**
 * Wudase Mariam weekday → prayer slug under collection `wudase-mariam`.
 * Live DB uses `wudase-mariam-{weekday}`; sections use bare weekday slugs.
 */
export const WUDASE_WEEKDAY_SLUG: Record<WeekdayIndex, string> = {
  0: 'wudase-mariam-sunday',
  1: 'wudase-mariam-monday',
  2: 'wudase-mariam-tuesday',
  3: 'wudase-mariam-wednesday',
  4: 'wudase-mariam-thursday',
  5: 'wudase-mariam-friday',
  6: 'wudase-mariam-saturday',
}

/** Section slug (monday…sunday) for the same weekday. */
export const WUDASE_WEEKDAY_SECTION_SLUG: Record<WeekdayIndex, string> = {
  0: 'sunday',
  1: 'monday',
  2: 'tuesday',
  3: 'wednesday',
  4: 'thursday',
  5: 'friday',
  6: 'saturday',
}

/**
 * Fallback Amharic section titles when Supabase is unavailable.
 * Prefer live `title_amharic` from prayers/sections when loaded.
 */
export const WUDASE_FALLBACK_TITLE_AMHARIC: Record<WeekdayIndex, string> = {
  0: 'ውዳሴ ማርያም እሁድ',
  1: 'ውዳሴ ማርያም ሰኞ',
  2: 'ውዳሴ ማርያም ማክሰኞ',
  3: 'ውዳሴ ማርያም ረቡዕ',
  4: 'ውዳሴ ማርያም ሐሙስ',
  5: 'ውዳሴ ማርያም ዓርብ',
  6: 'ውዳሴ ማርያም ቅዳሜ',
}

/**
 * Project weekday → Psalm range schedule (existing app mapping).
 * Sunday is a rest day (no numeric range).
 * VERIFY: confirm ranges with liturgical authority if needed.
 */
export const PSALM_RANGE_BY_WEEKDAY: Record<WeekdayIndex, PsalmRange | null> = {
  0: null,
  1: { from: 1, to: 30 },
  2: { from: 31, to: 60 },
  3: { from: 61, to: 80 },
  4: { from: 81, to: 110 },
  5: { from: 111, to: 130 },
  6: { from: 131, to: 150 },
}

export function weekdayIndexFromDate(date: Date): WeekdayIndex {
  return date.getDay() as WeekdayIndex
}

export function localCalendarDate(date = new Date()): Date {
  return new Date(date.getFullYear(), date.getMonth(), date.getDate())
}

export function localDateKey(date: Date): string {
  const d = localCalendarDate(date)
  const y = d.getFullYear()
  const m = String(d.getMonth() + 1).padStart(2, '0')
  const day = String(d.getDate()).padStart(2, '0')
  return `${y}-${m}-${day}`
}

export function formatPsalmRangeLabel(range: PsalmRange | null, locale: 'en' | 'am' = 'am'): string {
  if (!range) {
    return locale === 'am' ? 'የዕረፍት ቀን' : 'Rest day'
  }
  if (locale === 'am') return `መዝሙር ${range.from}–${range.to}`
  return `Psalms ${range.from}–${range.to}`
}

export function mezmureDawitRangePath(range: PsalmRange | null): string {
  const base = `/pray/${DAILY_COLLECTION_SLUGS.mezmureDawit}`
  if (!range) return base
  return `${base}?from=${range.from}&to=${range.to}`
}
