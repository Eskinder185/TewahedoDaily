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
}

export type SiteSearchResponse = {
  query: string
  results: SiteSearchResult[]
  intentMessage: string | null
  zeroResults: boolean
}
