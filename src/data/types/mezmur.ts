/** Mezmure Dawit (Psalms): prayer and sacred reading—not “chant” in the workshop sense. English chant-style entries may use a separate JSON under `data/chants/`. */

/** Liturgical / teaching grouping for filters and rails */
export type MezmurCategory =
  | 'praise'
  | 'lament'
  | 'communion'
  | 'feast'
  | 'ordinary'
  | 'other'

/** Rich workshop tagging from chant JSON (`category` object with arrays). */
export type MezmurCategoryDetail = {
  primary: string
  majorHoliday?: string[]
  saints?: string[]
  themes?: string[]
  usage?: string[]
  season?: string[]
  confidence?: string
}

export type MezmurEntry = {
  id: string
  type: 'mezmur'
  title: string
  transliterationTitle: string
  /** Ge’ez or primary script lyrics */
  lyrics: string
  transliterationLyrics: string
  meaning?: string
  /** Full watch URL; thumbnails derived when `thumbnail` omitted */
  youtubeUrl: string
  /** Absolute image URL; if omitted, UI may derive from YouTube */
  thumbnail?: string
  category: MezmurCategory | MezmurCategoryDetail
  feast?: string
  season?: string
  movementGuide?: string
  postureNotes?: string
  instrumentSummary?: string
  /** Workshop source language: `en` for English mezmur pack, `am` for Amharic, etc. */
  language?: string
}
