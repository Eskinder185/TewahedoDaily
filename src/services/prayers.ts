/**
 * Public Pray data layer — normal prayers from Supabase.
 * Prefer importing from here in pages/hooks rather than scattering queries.
 */
export {
  canonicalPrayerCollectionSlug,
  getPrayerBySlug,
  getPrayerCollectionBySlug,
  getPrayerCollections,
  getPrayerSections,
  getPrayersForSection,
  loadPrayer,
  loadPrayerCollection,
  loadPrayerCollections,
  searchPrayers,
  type PrayerCollectionBundle,
  type PrayerCollectionView,
  type PrayerSectionView,
  type PrayerCollectionRow,
  type PrayerSectionRow,
  type PrayerRow,
} from '../lib/prayers/prayerSupabase'

export type { CollectionPrayer, PrayerCollection } from '../lib/prayers/prayerCollections'
