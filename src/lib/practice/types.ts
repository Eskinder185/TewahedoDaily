import type { MezmurCategory } from '../../data/types'
import type { TselotPrayerPrimary } from '../../data/types/tselot'

export type { TselotPrayerPrimary } from '../../data/types/tselot'
export { TSELOT_PRIMARY_LABEL } from '../../data/types/tselot'

export type MezmurItem = {
  id: string
  title: string
  youtubeId: string
  thumbnailUrl?: string
  titleTransliteration: string
  lyricsGez: string
  lyricsTransliteration: string
  meaning?: string
  relatedFeast?: string
  category?: MezmurCategory
  feastLine?: string
  seasonLine?: string
  /** Tags from `category.themes` in workshop JSON */
  categoryThemes?: string[]
  /** Tags from `category.usage` */
  categoryUsage?: string[]
  /** Tags from `category.saints` */
  categorySaints?: string[]
  /** Tags from `category.majorHoliday` */
  categoryMajorHoliday?: string[]
  /** `category.confidence` from workshop JSON */
  categoryConfidence?: string
  /** Workshop lyric language (`en`, `am`, …) */
  language?: string
  movementGuide?: string
  postureNotes?: string
  instrumentSummary?: string
}

/** UI model mapped from `PrayerEntry` in `tselot/tselot.json` */
export type TselotPrayer = {
  id: string
  title: string
  transliterationTitle: string
  categoryPrimary: TselotPrayerPrimary
  categoryUsage: string[]
  categorySeason: string[]
  categoryConfidence: string
  summary: { amharic: string; english: string }
  text: { amharic: string; geez: string; english: string }
  transliteration: { amharic: string; geez: string; english: string }
  source: { bookTitle: string; fullTextLink: string; audioUrl: string }
  /** Card subtitle */
  purposeLine: string
  /** Combined non-empty text bodies (for length / search) */
  fullText: string
}
