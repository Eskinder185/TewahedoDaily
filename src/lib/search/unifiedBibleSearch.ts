/**
 * @deprecated Prefer `searchBibleShared` — kept as a thin re-export for older imports.
 * Bible page + Search Buddy share `sharedBibleSearch` / `sendSearchBuddyMessage`.
 */
export {
  searchBibleShared as searchBibleUnified,
  type SharedBibleSearchResult as UnifiedBibleSearchResult,
} from './sharedBibleSearch.ts'
