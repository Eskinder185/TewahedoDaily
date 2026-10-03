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
  /** True when at least one catalog source failed but others returned */
  partial: boolean
  totalCount: number
  isFollowUp: boolean
}
