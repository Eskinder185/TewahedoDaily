/**
 * Ethiopian Orthodox calendar dataset (`src/data/eotc_calendar_json`).
 *
 * Prefer importing from this barrel for types, dataset helpers, date resolution,
 * and liturgical context. `mergeEotcIntoDailyChurch` remains a separate import where
 * mock daily church data is assembled.
 */

export type {
  EotcCalendarCollectionFile,
  EotcCalendarConfigFile,
  EotcCalendarDatasetRow,
  EotcCalendarEntry,
  EotcCalendarIndexFile,
  EotcCalendarIndexCollection,
  EotcCategory,
  EotcConfidenceLevel,
  EotcContent,
  EotcDateKind,
  EotcDisplay,
  EotcEntryDate,
  EotcObservance,
  EotcSeasonRange,
  EotcSource,
  EotcSummary,
  EotcTaggedEntry,
} from './eotcTypes'

export {
  EOTC_TAGGED_ENTRIES,
  getAllCalendarEntries,
  getCalendarConfig,
  getCalendarIndex,
  getEntriesByCategory,
  getEntryById,
  getFeaturedEntries,
} from './eotcCalendarDataset'

export type { EotcCalendarRowSource } from './eotcDateResolution'

export {
  collectEotcMatchesForLocalDay,
  getEntriesForDate,
  getFixedEntriesForDate,
  getMonthlyRecurringEntriesForDate,
  getMovableEntriesForDate,
  getSeasonEntriesForDate,
  getWeeklyRecurringEntriesForDate,
} from './eotcDateResolution'

export type { LiturgicalCalendarContext } from './liturgicalCalendarContext'

export {
  anchorToGregorian,
  buildLiturgicalCalendarContext,
  resolvePaschaForLocalCivilDay,
  stripLocalCalendarDate,
} from './liturgicalCalendarContext'

export { ethMonthFromEnglishName } from './eotcEthiopianMonthNames'

export {
  matchesEntryForContext,
  matchesFixedEntry,
  matchesMonthlyRecurringEntry,
  matchesMovableEntry,
  matchesSeasonEntry,
  matchesWeeklyRecurringEntry,
  resolveMovableOccurrenceGregorian,
} from './eotcEntryDateMatchers'

export {
  formatRelatedEntryLabels,
  getEotcPanelTier,
  sortEotcEntriesForCalendarPanel,
} from './eotcCalendarPanelOrdering'

export type {
  EotcSecondaryTierGroup,
  PrimaryObservanceStory,
  SelectedDayObservanceModel,
} from './buildSelectedDayObservanceModel'

export { buildSelectedDayObservanceModel } from './buildSelectedDayObservanceModel'

export { buildUpcomingObservancesFromEotc } from './buildUpcomingObservancesFromEotc'

export { eotcDatasetRowToMovableObservanceOnDay } from './eotcMovableObservanceFromRow'

export {
  mapEotcDatasetRowToObservanceTypes,
  mapEotcDatasetRowToUiKind,
} from './eotcObservanceUiMapping'

export type {
  ObservanceGalleryBucket,
  GalleryBrowseFilter,
  ObservancePlaceholderVisual,
} from './eotcObservanceGalleryModel'

export {
  filterGalleryRows,
  formatEntryDateHint,
  formatObservanceStateLabel,
  galleryBucketToPlaceholderVisual,
  getObservanceGalleryBucket,
  getFeaturedRows,
  partitionRowsByBucket,
  OBSERVANCE_GALLERY_BUCKET_ORDER,
} from './eotcObservanceGalleryModel'

export { findNextCivilDayForEntry } from './eotcFindEntryOccurrence'

export type { EotcCalendarSearchOptions, EotcContentCategoryFilter } from './eotcCalendarSearch'

export {
  DEFAULT_MAX_EOTC_SEARCH_RESULTS,
  EOTC_CONTENT_CATEGORY_FILTERS,
  getEotcEntrySearchHaystack,
  normalizeEotcSearchQuery,
  rowMatchesCategoryFilters,
  searchEotcCalendarEntries,
} from './eotcCalendarSearch'
