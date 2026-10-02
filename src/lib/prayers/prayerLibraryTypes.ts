/** Shared public Pray-library types for prayer / liturgy / synaxarium sources. */

export type PrayerLibrarySourceType = 'prayer' | 'liturgy' | 'synaxarium'

export type PrayerLibraryCountKind = 'sections' | 'psalms' | 'prayers' | 'days' | 'commemorations'

export type PrayerLibraryCollection = {
  id: string
  slug: string
  title: string
  titleAmharic: string
  description: string
  sortOrder: number
  status: 'published'
  sourceType: PrayerLibrarySourceType
  itemCount: number
  countKind: PrayerLibraryCountKind
  imagePath?: string
  imageAlt?: string
}

export type PrayerSearchResult = {
  id: string
  sourceType: PrayerLibrarySourceType
  title: string
  titleAmharic: string
  excerpt: string
  route: string
  metadata: string
}

export type LiturgyCollection = {
  id: string
  slug: string
  title: string
  titleAmharic: string
  description: string
  sortOrder: number
  imagePath?: string
  imageAlt?: string
}

export type LiturgySection = {
  id: string
  slug: string
  title: string
  titleAmharic: string
  description: string
  sortOrder: number
  collectionId: string
  collectionSlug: string
}

export type LiturgyEntry = {
  id: string
  slug: string
  title: string
  titleAmharic: string
  textAmharic: string
  textEnglish: string
  textOromo: string
  transliteration: string
  speaker: string
  contentType: string
  sortOrder: number
  sectionId: string
  collectionId: string
  collectionSlug: string
  sectionSlug: string
}

export type SynaxariumDay = {
  id: string
  slug: string
  ethiopianMonth: string
  ethiopianMonthNumber: number
  ethiopianDay: number
  displayDateEnglish: string
  displayDateAmharic: string
  summary: string
  imagePath?: string
  imageAlt?: string
}

export type SynaxariumCommemoration = {
  id: string
  slug: string
  dayId: string
  daySlug: string
  title: string
  titleAmharic: string
  commemorationType: string
  summary: string
  summaryAmharic?: string
  bodyAmharic: string
  bodyEnglish: string
  scriptureReferences: string
  keywords: string[]
  sortOrder: number
  imagePath?: string
  imageAlt?: string
  featured?: boolean
  isMonthly?: boolean
  imagePosition?: string
  contentReviewStatus?: string | null
}

/** Day plus ordered published commemorations (calendar / pray detail). */
export type SynaxariumDayBundle = {
  day: SynaxariumDay
  commemorations: SynaxariumCommemoration[]
}

/** Lightweight month-cell preview (no full body text). */
export type SynaxariumMonthDayPreview = {
  day: SynaxariumDay
  primaryTitle: string
  primaryTitleAmharic: string
  commemorationsCount: number
}
