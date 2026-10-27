/**
 * Unified site search result — used by Search Buddy, autocomplete, and future /search.
 * Every result must resolve to a real public route.
 */

export type SiteSearchSourceType =
  | 'page'
  | 'mezmur'
  | 'zemari'
  | 'hymn_collection'
  | 'hymn_section'
  | 'prayer'
  | 'prayer_collection'
  | 'prayer_section'
  | 'liturgy'
  | 'guide'
  | 'calendar'
  | 'synaxarium'
  | 'synaxarium_commemoration'
  | 'bible-book'
  | 'bible-chapter'
  | 'bible-verse'
  | 'bible-range'
  | 'bible-text'
  | 'saint'
  | 'feast'
  | 'learn'
  | 'church_library'
  | 'account'
  | 'other'

export type SiteSearchResult = {
  sourceType: SiteSearchSourceType
  sourceId: string
  title: string
  titleAmharic: string
  description: string
  route: string
  imagePath: string | null
  score: number
  matchKind: 'exact' | 'alias' | 'prefix' | 'fuzzy' | 'keyword' | 'intent' | 'personal'
  typeLabel: string
  /** Optional bilingual date line for Synaxarium / calendar hits */
  dateLabel?: string
  /** Short verified excerpt (never invented) */
  excerpt?: string
  /** Source label when available (e.g. Synaxarium) */
  sourceLabel?: string
}

export type SiteSearchResponse = {
  query: string
  /** Query actually executed after follow-up resolution */
  resolvedQuery: string
  results: SiteSearchResult[]
  intentMessage: string | null
  zeroResults: boolean
  /**
   * True when at least one queried catalog failed.
   * Remains true when every result list is empty, so a failure is not
   * reported as “no matching information.”
   */
  partial: boolean
  /** True when every catalog that was queried failed. */
  failed: boolean
  sources: SiteSourceReport[]
  totalCount: number
  isFollowUp: boolean
}

export type SiteSourceStatus = 'matches' | 'empty' | 'failed'

/** Outcome of one website catalog. Present even when that catalog returned nothing. */
export type SiteSourceReport = {
  name: string
  status: SiteSourceStatus
  count: number
}
