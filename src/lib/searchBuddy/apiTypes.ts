/**
 * FastAPI Search Buddy / chat response contracts.
 * Fields are optional where backends may omit them — renderers must not invent data.
 */

export type SearchBuddyResponseType =
  | 'bible_search'
  | 'bible_reference'
  | 'bible_chapter'
  | 'hymn_search'
  | 'hymn_occasion'
  | 'prayer_search'
  | 'prayer_collection'
  | 'prayer_section'
  | 'synaxarium_search'
  | 'synaxarium_day'
  | 'synaxarium_today'
  | 'ai'
  | 'calendar_day'
  | 'calendar_today'
  | 'calendar_search'
  | 'calendar_fast'
  | 'calendar_season'
  | 'fasting_today'
  | 'fast_today'
  | 'season_today'
  | 'ethiopian_date_today'
  | 'liturgy_search'
  | 'teaching_search'
  | 'unknown'

export type BibleVerseRow = {
  verse?: number | string | null
  verse_number?: number | string | null
  text?: string | null
  text_amharic?: string | null
  text_english?: string | null
  [key: string]: unknown
}

/** Nested book object returned by GET /api/bible/search and chat bible_* types. */
export type BibleBookRef = {
  id?: string | null
  slug?: string | null
  name_en?: string | null
  name_am?: string | null
  [key: string]: unknown
}

export type BibleSearchHit = {
  book?: string | BibleBookRef | null
  book_name?: string | null
  book_slug?: string | null
  book_name_amharic?: string | null
  reference?: string | null
  chapter?: number | string | null
  verse?: number | string | null
  verse_number?: number | string | null
  text?: string | null
  text_amharic?: string | null
  text_english?: string | null
  excerpt?: string | null
  [key: string]: unknown
}

export type HymnRow = {
  id?: string | null
  slug?: string | null
  title?: string | null
  title_amharic?: string | null
  title_english?: string | null
  title_transliteration?: string | null
  form?: string | null
  preview?: string | null
  youtube_url?: string | null
  audio_url?: string | null
  zemari?: string | null
  singer_name?: string | null
  primary_language?: string | null
  occasion?: string | null
  occasion_label?: string | null
  [key: string]: unknown
}

export type PrayerRow = {
  id?: string | null
  slug?: string | null
  title?: string | null
  title_amharic?: string | null
  preview?: string | null
  collection_slug?: string | null
  section_slug?: string | null
  sort_order?: number | null
  [key: string]: unknown
}

export type SynaxariumRow = {
  id?: string | null
  slug?: string | null
  title?: string | null
  title_amharic?: string | null
  preview?: string | null
  commemoration_type?: string | null
  day_slug?: string | null
  display_date_english?: string | null
  display_date_amharic?: string | null
  sort_order?: number | null
  [key: string]: unknown
}

export type BibleSearchResponse = {
  type: 'bible_search'
  query?: string
  results?: BibleSearchHit[]
  message?: string
}

export type BibleReferenceResponse = {
  type: 'bible_reference'
  book?: string | BibleBookRef | null
  book_name?: string | null
  book_slug?: string | null
  chapter?: number | string | null
  verse?: number | string | null
  verse_end?: number | string | null
  end_verse?: number | string | null
  language?: string | null
  text?: string | null
  text_amharic?: string | null
  text_english?: string | null
  verses?: BibleVerseRow[]
  message?: string
  reference?: string | null
}

export type BibleChapterResponse = {
  type: 'bible_chapter'
  book?: string | BibleBookRef | null
  book_name?: string | null
  book_slug?: string | null
  chapter?: number | string | null
  language?: string | null
  verses?: BibleVerseRow[]
  message?: string
  reference?: string | null
}

export type HymnSearchResponse = {
  type: 'hymn_search'
  query?: string
  results?: HymnRow[]
  message?: string
}

export type HymnOccasionResponse = {
  type: 'hymn_occasion'
  occasion?: string | null
  occasion_label?: string | null
  results?: HymnRow[]
  message?: string
}

export type PrayerSearchResponse = {
  type: 'prayer_search'
  query?: string
  results?: PrayerRow[]
  message?: string
}

export type PrayerCollectionResponse = {
  type: 'prayer_collection'
  collection_slug?: string | null
  title?: string | null
  title_amharic?: string | null
  prayers?: PrayerRow[]
  message?: string
}

export type PrayerSectionResponse = {
  type: 'prayer_section'
  collection_slug?: string | null
  section_slug?: string | null
  title?: string | null
  title_amharic?: string | null
  prayers?: PrayerRow[]
  message?: string
}

export type SynaxariumSearchResponse = {
  type: 'synaxarium_search'
  query?: string
  results?: SynaxariumRow[]
  message?: string
}

export type SynaxariumDayResponse = {
  type: 'synaxarium_day'
  day_slug?: string | null
  title?: string | null
  title_amharic?: string | null
  display_date_english?: string | null
  display_date_amharic?: string | null
  commemorations?: SynaxariumRow[]
  message?: string
}

export type AiAssistantResponse = {
  type: 'ai'
  answer?: string | null
  message?: string | null
  sources?: Array<{ title?: string; url?: string; excerpt?: string }>
}

/** Shared optional calendar/today fields — render only what the API returns. */
export type CalendarTodayFields = {
  ethiopian_date?: string | null
  ethiopian_date_english?: string | null
  ethiopian_date_amharic?: string | null
  display_date_english?: string | null
  display_date_amharic?: string | null
  gregorian_date?: string | null
  gregorian_date_english?: string | null
  primary_observance?: string | null
  observance?: string | null
  observance_title?: string | null
  fasting?: boolean | string | null
  fasting_status?: string | null
  is_fasting?: boolean | null
  active_fast?: string | null
  fast_name?: string | null
  fast_type?: string | null
  liturgical_season?: string | null
  season?: string | null
  season_name?: string | null
  synaxarium_count?: number | null
  commemorations_count?: number | null
  summary?: string | null
  scripture?: string | null
  scripture_reference?: string | null
  scripture_references?: Array<string | null> | null
  message?: string | null
  title?: string | null
  title_amharic?: string | null
  commemorations?: SynaxariumRow[]
  results?: SynaxariumRow[]
  [key: string]: unknown
}

export type CalendarTodayResponse = CalendarTodayFields & {
  type: 'calendar_today' | 'calendar_day'
}

/** Hit from GET /api/calendar/search — render only returned fields. */
export type CalendarSearchHit = {
  source_type?: string | null
  slug?: string | null
  title?: string | null
  title_amharic?: string | null
  category?: string | null
  preview?: string | null
  summary?: string | null
  description?: string | null
  ethiopian_month_number?: number | null
  ethiopian_day?: number | null
  fasting_notes?: string | null
  season_notes?: string | null
  scripture_references?: string | null
  [key: string]: unknown
}

export type CalendarSearchResponse = {
  type: 'calendar_search'
  query?: string | null
  count?: number | null
  results?: CalendarSearchHit[]
  message?: string | null
}

export type FastingTodayResponse = CalendarTodayFields & {
  type: 'fasting_today' | 'fast_today' | 'calendar_fast'
}

export type SeasonTodayResponse = CalendarTodayFields & {
  type: 'season_today' | 'calendar_season'
}

export type EthiopianDateTodayResponse = CalendarTodayFields & {
  type: 'ethiopian_date_today'
}

export type SynaxariumTodayResponse = CalendarTodayFields & {
  type: 'synaxarium_today'
}

/**
 * Future liturgy/teaching payloads and unmodeled types.
 * Use a distinct `type` set so known response members stay discriminable.
 */
export type GenericTypedResponse = {
  type: 'liturgy_search' | 'teaching_search' | 'unknown'
  message?: string
  results?: unknown[]
  raw?: unknown
  /** Present when the backend sent a type not yet in this union. */
  originalType?: string
  [key: string]: unknown
}

export type SearchBuddyApiResponse =
  | BibleSearchResponse
  | BibleReferenceResponse
  | BibleChapterResponse
  | HymnSearchResponse
  | HymnOccasionResponse
  | PrayerSearchResponse
  | PrayerCollectionResponse
  | PrayerSectionResponse
  | SynaxariumSearchResponse
  | SynaxariumDayResponse
  | SynaxariumTodayResponse
  | AiAssistantResponse
  | CalendarTodayResponse
  | CalendarSearchResponse
  | FastingTodayResponse
  | SeasonTodayResponse
  | EthiopianDateTodayResponse
  | GenericTypedResponse

export const KNOWN_SEARCH_BUDDY_TYPES = [
  'bible_search',
  'bible_reference',
  'bible_chapter',
  'hymn_search',
  'hymn_occasion',
  'prayer_search',
  'prayer_collection',
  'prayer_section',
  'synaxarium_search',
  'synaxarium_day',
  'synaxarium_today',
  'ai',
  'calendar_day',
  'calendar_today',
  'calendar_search',
  'calendar_fast',
  'calendar_season',
  'fasting_today',
  'fast_today',
  'season_today',
  'ethiopian_date_today',
  'liturgy_search',
  'teaching_search',
] as const satisfies readonly SearchBuddyResponseType[]
