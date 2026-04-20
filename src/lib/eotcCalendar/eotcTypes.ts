/**
 * TypeScript mirrors of `src/data/eotc_calendar_json/calendar-entry.schema.json`
 * and related bundle files. JSON files remain the source of truth at runtime.
 */

export type EotcDateKind =
  | 'fixed'
  | 'movable'
  | 'monthly-recurring'
  | 'weekly-recurring'
  | 'season'

export type EotcFixedEthDate = {
  ethiopianMonth: string
  ethiopianDay: number
}

/** `seasonRange` object shape used across collections. */
export type EotcSeasonRange = {
  startFixed?: EotcFixedEthDate | null
  endFixed?: EotcFixedEthDate | null
  startAnchor?: string | null
  startOffset?: number | null
  endAnchor?: string | null
  endOffset?: number | null
}

export type EotcEntryDate = {
  kind: EotcDateKind
  ethiopianMonth: string | null
  ethiopianDay: number | null
  gregorianHint?: string | null
  movableAnchor: string | null
  offsetFromAnchor: number | null
  monthlyRecurringDay: number | null
  weeklyRecurringDay: string | null
  seasonRange: EotcSeasonRange | null
}

export type EotcCategory = {
  primary: string
  secondary: string[]
  majorHoliday: boolean
}

export type EotcSummary = {
  short: string
  panel: string
  whyItMatters: string
  connection: string
}

export type EotcObservance = {
  fastStatus: string
  liturgicalTone: string
  commonPractices: string[]
}

export type EotcDisplay = {
  featured: boolean
  priority: number
  calendarBadge: string
  calendarColor: string
  showOnHomepage: boolean
}

export type EotcContent = {
  extended: string
  notes: string[]
  relatedEntries: string[]
}

export type EotcConfidenceLevel = 'high' | 'medium' | 'low'

export type EotcSource = {
  title?: string
  type?: string
  [key: string]: unknown
}

/** One `calendar_entry` object from the JSON schema. */
export type EotcCalendarEntry = {
  type: 'calendar_entry'
  id: string
  title: string
  transliterationTitle: string | null
  englishTitle: string | null
  date: EotcEntryDate
  category: EotcCategory
  summary: EotcSummary
  observance: EotcObservance
  display: EotcDisplay
  content: EotcContent
  searchKeywords?: string[]
  sources?: EotcSource[]
  confidence: EotcConfidenceLevel
}

export type EotcCalendarCollectionFile = {
  type: 'calendar_collection'
  name: string
  entries: EotcCalendarEntry[]
}

export type EotcCalendarConfigFile = {
  type: 'calendar_config'
  version: string
  tradition: string
  calendarSystem: string
  supportedDateKinds: string[]
  movableAnchors: string[]
  defaultDisplayOrder: string[]
  files: string[]
}

export type EotcCalendarIndexCollection = {
  name: string
  file: string
  count: number
}

export type EotcCalendarIndexFile = {
  type: 'calendar_index'
  version: string
  collections: EotcCalendarIndexCollection[]
  totalEntries: number
}

/**
 * Normalized row: canonical entry plus its source collection `name`
 * (from the parent `calendar_collection` object).
 */
export type EotcCalendarDatasetRow = {
  collection: string
  entry: EotcCalendarEntry
}

/** Same shape as `EotcCalendarDatasetRow` — used by date-resolution helpers. */
export type EotcTaggedEntry = EotcCalendarDatasetRow
