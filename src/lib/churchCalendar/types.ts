import type { EthiopianDateParts } from '../ethiopianDate'
import type { UpcomingObservanceUiKind } from '../../data/types/churchDay'

export type { UpcomingObservanceUiKind }

/**
 * Single source of truth for “Today in Church” + hero date lines.
 * Replace `source: 'mock'` payloads by wiring `buildChurchDaySnapshot` to a real provider.
 */
export type ChurchCalendarSource = 'mock' | 'live'

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
export type UpcomingObservance = {
  id: string
  title: string
  transliterationTitle?: string
  shortDescription?: string
  meaning?: string
  observance?: string
  /** Short, scannable (e.g. “Eth: Tahsas 12”) */
  dateEthiopian: string
  /** Optional second line (e.g. “Greg: Dec 21”) */
  dateGregorian?: string
  /**
   * Optional Gregorian anchor (local civil day) so the UI can jump the calendar
   * to this observance when the user selects it.
   */
  gregorianAnchorIso?: string
  kind: UpcomingObservanceUiKind
  scheduling?: ObservanceScheduling
  ruleSummary?: string
  relatedPrayerHint?: string
  relatedChantHint?: string
}

export type MovableObservanceOnDay = {
  id: string
  catalogEventId: string
  /** Paschal-cycle rows use `'movable'`; EOTC fixed/monthly highlights may use `'fixed'`. */
  scheduling: 'movable' | 'fixed'
  title: string
  transliterationTitle?: string
  shortDescription: string
  meaning: string
  observance: string
  ruleSummary?: string
  relatedPrayerHint?: string
  relatedChantHint?: string
}

export type Commemoration = {
  /** When the day maps to a catalog event, prefer this for feast/saint imagery. */
  catalogEventId?: string
  title: string
  subtitle?: string
  transliterationTitle?: string
  
  /** Day type classification for clear understanding */
  observanceType: ObservanceType[]
  
  /** Summary of what this day represents - educational overview */
  summary: string
  
  /** What the day means in Orthodox life and theology */
  significance: string
  
  /** Practical guidance for observing this day */
  practicalGuidance: string
  
  /** Prayer and chant guidance */
  prayAndChant?: string
  
  /** Additional notes about the observance */
  notes?: string
  
  /** What this observance is — one short sentence */
  shortDescription: string
  /** Why it matters in Tewahedo life */
  meaning: string
  /** How it is usually lived in parish and home */
  observance: string
  /** Legacy single line (often mirrors shortDescription); prefer shortDescription in UI */
  whyTodayShort: string
  /** Expanded note or pastor-facing paragraph */
  whyTodayLong: string
}

export type LiturgicalSeason = {
  id?: string
  title: string
  transliterationTitle?: string
  /** Short clause for chips (keeps hero + section aligned) */
  summary: string
  shortDescription: string
  meaning: string
  observance: string
}

export type FastingContext = {
  /** Wednesday / Friday discipline when applicable */
  weeklyFast: string | null
  /** Great Lent, Advent fast, etc. — null when none in mock */
  seasonalFast: string | null
}

export type ChurchDaySnapshot = {
  source: ChurchCalendarSource
  /** Local “today” used for the snapshot */
  referenceDate: Date
  gregorian: {
    year: number
    monthIndex: number
    day: number
    labelLong: string
  }
  ethiopian: EthiopianDateParts & {
    labelLong: string
  }
  weekday: {
    long: string
  }
  commemoration: Commemoration
  /** Movable (Paschal-cycle) observances on this civil day — fixed synaxarium stays primary. */
  movableOnDay: MovableObservanceOnDay[]
  season: LiturgicalSeason
  fasting: FastingContext
  upcoming: UpcomingObservance[]
  /** Gregorian month view for the mini calendar + dot markers */
  miniCalendar: {
    year: number
    monthIndex: number
    markedDays: number[]
  }
}
