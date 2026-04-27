/** Top-level category for filters and cards */
export type TselotPrayerPrimary =
  | 'mary'
  | 'daily'
  | 'christ'
  | 'saints'
  | 'liturgical'
  | 'repentance'
  | 'holy-week'
  | 'feast'

export type PrayerEntryCategory = {
  primary: TselotPrayerPrimary
  usage: string[]
  season: string[]
  confidence: string
}

export type PrayerEntryTextBlock = {
  amharic: string
  geez: string
  english: string
}

export type PrayerEntrySummary = {
  amharic: string
  english: string
}

export type PrayerEntrySource = {
  bookTitle: string
  fullTextLink: string
  audioUrl: string
}

/** Canonical row shape in `tselot/tselot.json` */
export type PrayerEntry = {
  type: 'prayer'
  id: string
  slug?: string
  collection?: string
  collectionSlug?: string
  section?: string
  chapter?: string | number
  order?: number
  title: string
  transliterationTitle: string
  category: PrayerEntryCategory
  text: PrayerEntryTextBlock
  transliteration: PrayerEntryTextBlock
  summary: PrayerEntrySummary
  source: PrayerEntrySource
}

export const TSELOT_PRIMARY_LABEL: Record<TselotPrayerPrimary, string> = {
  mary: 'Mary',
  daily: 'Daily',
  christ: 'Christ',
  saints: 'Saints',
  liturgical: 'Liturgical',
  repentance: 'Repentance',
  'holy-week': 'Holy week',
  feast: 'Feast',
}
