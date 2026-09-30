/**
 * Canonical Synaxarium API for the public site and CMS.
 * Runtime source of truth: public.synaxarium_days + public.synaxarium_commemorations.
 * Do not use local JSON (synaxariumDataset) for Calendar or Pray Synaxarium pages.
 */
export {
  countSynaxariumCommemorations,
  countSynaxariumDays,
  getSynaxariumCommemorationsForDay,
  getSynaxariumCommemorationsForEthiopianDay,
  getSynaxariumDay,
  getSynaxariumDayBySlug,
  getSynaxariumDays,
  getSynaxariumDaysForMonth,
  getSynaxariumDayWithCommemorations,
  getSynaxariumMonthDayPreviews,
  pickSynaxariumImagePath,
  searchSynaxarium,
  SYNAXARIUM_LIBRARY_SORT_ORDER,
} from '../prayers/synaxariumSupabase'

/** Alias matching the request naming. */
export { getSynaxariumDay as getSynaxariumDayByDate } from '../prayers/synaxariumSupabase'
export { getSynaxariumCommemorationsForDay as getCommemorationsForDay } from '../prayers/synaxariumSupabase'

export {
  formatCommemorationTypeLabel,
  getCalendarCards,
  imagePositionToObjectPosition,
  localizedCardText,
  nextGregorianForEthiopianDate,
  normalizeImagePosition,
  cardCategoryBadge,
  resolveCardSummary,
  resolveCardWhatIsIt,
  resolveCardWhy,
  resolveCardImportant,
  resolveCardFasting,
  resolveCardSeason,
  resolveCardImageCaption,
  resolveCardScripture,
} from './calendarCards'
export type { CalendarCard, CalendarCardImagePosition } from './calendarCards'

export type {
  SynaxariumCommemoration,
  SynaxariumDay,
  SynaxariumDayBundle,
  SynaxariumMonthDayPreview,
} from '../prayers/prayerLibraryTypes'
