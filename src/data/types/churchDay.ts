/** YYYY-MM-DD (local civil day the snapshot describes) */
export type IsoDate = string

export type EthiopianDateValue = {
  year: number
  month: number
  day: number
}

export type DataSource = 'mock' | 'live'

export type ObservanceScheduling = 'fixed' | 'movable'
export type ObservanceType = 
  | 'feast' 
  | 'fast' 
  | 'saint-commemoration'
  | 'marian-observance' 
  | 'angel-commemoration'
  | 'movable-feast'
  | 'seasonal-observance'
  | 'mixed-observance'
export type UpcomingObservanceEntry = {
  id: string
  title: string
  transliterationTitle?: string
  shortDescription?: string
  meaning?: string
  observance?: string
  dateEthiopian: string
  dateGregorian?: string
  gregorianAnchorIso?: string
  kind: 'feast' | 'fast' | 'commemoration'
  /** Fixed senksar / fixed civil, vs tied to Fasika (Pascha) */
  scheduling?: ObservanceScheduling
  /** Human-readable rule, e.g. “First Sunday after Fasika” */
  ruleSummary?: string
  relatedPrayerHint?: string
  relatedChantHint?: string
}

/** Movable feast/fast landing on this civil day (alongside fixed synaxarium text). */
export type MovableObservanceOnDay = {
  id: string
  catalogEventId: string
  scheduling: 'movable'
  title: string
  transliterationTitle?: string
  shortDescription: string
  meaning: string
  observance: string
  ruleSummary?: string
  relatedPrayerHint?: string
  relatedChantHint?: string
}

/**
 * Canonical “today in the Church” record.
 * Swap `source` + payload from API while keeping this shape stable for UI.
 */
export type DailyChurchData = {
  source: DataSource
  gregorianDate: IsoDate
  gregorianLabel: string
  ethiopianDate: EthiopianDateValue
  ethiopianLabel: string
  dayName: string
  
  /** Day type classification for clear understanding */
  observanceType: ObservanceType[]
  
  /** Summary of what this day represents - educational overview */
  summary: string
  
  /** What this day means in Orthodox life and theology */
  significance: string
  
  /** Practical guidance for observing this day */
  practicalGuidance: string
  
  /** Prayer and chant guidance */
  prayAndChant?: string
  
  /** Additional notes about the observance */
  notes?: string
  
  season: {
    id?: string
    title: string
    transliterationTitle?: string
    summary: string
    shortDescription?: string
    meaning?: string
    observance?: string
  }
  /** Single line for chips (combined fast context) */
  fast: string | null
  fastWeekly: string | null
  fastSeasonal: string | null
  feast: string
  saint: string
  /** Canonical `calendarEvents.json` id when this day is tied to a catalog row. */
  catalogEventId?: string
  transliterationTitle?: string
  /** One sentence: what the observance is (may mirror legacy `shortMeaning`). */
  shortDescription?: string
  meaning?: string
  observance?: string
  /** @deprecated Prefer shortDescription; kept for older snapshots */
  shortMeaning?: string
  longMeaning: string
  /** Paschal-cycle observances that fall on this Gregorian civil day. */
  movableObservancesOnDay?: MovableObservanceOnDay[]
  upcomingObservances: UpcomingObservanceEntry[]
  miniCalendar: {
    year: number
    monthIndex: number
    markedDays: number[]
  }
}
