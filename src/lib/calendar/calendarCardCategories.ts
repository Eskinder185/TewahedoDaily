/**
 * Calendar card categories & display labels (public-facing).
 * Values stored in calendar_cards.category; card_type remains for visual kind.
 */

export const CALENDAR_CARD_CATEGORIES = [
  'Holiday',
  'Great Feast',
  'Feast',
  'Fast',
  'Season',
  'Angel',
  'Saint',
  'Marian',
  'Christ',
  'Holy Trinity',
  'Holy Spirit',
  'Apostle',
  'Prophet',
  'Martyr',
  'Cross',
  'Church Event',
  'Commemoration',
  'Other',
] as const

export type CalendarCardCategory = (typeof CALENDAR_CARD_CATEGORIES)[number]

const CATEGORY_ALIASES: Record<string, CalendarCardCategory> = {
  holiday: 'Holiday',
  'great feast': 'Great Feast',
  'great-feast': 'Great Feast',
  feast: 'Feast',
  fast: 'Fast',
  season: 'Season',
  angel: 'Angel',
  saint: 'Saint',
  mary: 'Marian',
  marian: 'Marian',
  christ: 'Christ',
  'holy trinity': 'Holy Trinity',
  'holy-trinity': 'Holy Trinity',
  'holy spirit': 'Holy Spirit',
  'holy-spirit': 'Holy Spirit',
  apostle: 'Apostle',
  prophet: 'Prophet',
  martyr: 'Martyr',
  cross: 'Cross',
  'church event': 'Church Event',
  'church-event': 'Church Event',
  commemoration: 'Commemoration',
  other: 'Other',
}

/** Human-readable category for badges — never raw lowercase DB values. */
export function formatCalendarCardCategory(
  category?: string | null,
  fallbackType?: string | null,
): string {
  const raw = (category || '').trim()
  if (raw) {
    const alias = CATEGORY_ALIASES[raw.toLowerCase()]
    if (alias) return alias
    // Already human-looking (Title Case / mixed)
    if (/[A-Z]/.test(raw) || /\s/.test(raw)) return raw
    return raw
      .replace(/[_-]+/g, ' ')
      .split(/\s+/)
      .filter(Boolean)
      .map((part) => part.charAt(0).toUpperCase() + part.slice(1).toLowerCase())
      .join(' ')
  }
  const type = (fallbackType || '').trim().toLowerCase()
  if (type && CATEGORY_ALIASES[type]) return CATEGORY_ALIASES[type]
  if (type) {
    return type
      .replace(/[_-]+/g, ' ')
      .split(/\s+/)
      .filter(Boolean)
      .map((part) => part.charAt(0).toUpperCase() + part.slice(1))
      .join(' ')
  }
  return 'Commemoration'
}

/** Split scripture_references into clean lines for display. */
export function parseScriptureReferences(raw?: string | null): string[] {
  const text = (raw || '').trim()
  if (!text) return []
  return text
    .split(/[\n;]+/)
    .flatMap((line) => line.split(/,(?=\s*[A-Za-z1-9])/))
    .map((part) => part.trim())
    .filter(Boolean)
}
