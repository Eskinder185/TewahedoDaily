/**
 * Public prayer data types + helpers.
 * Runtime prayer text comes from Supabase via prayerSupabase / services/prayers.
 * Local JSON/TS content files are import backups only — not used at runtime here.
 */
import type { TselotPrayer } from '../practice/types'
import { TSELOT_PRIMARY_LABEL } from '../practice/types'

export type PrayerCollectionId = string

export type PrayerCollection = {
  id: PrayerCollectionId
  title: string
  amharicTitle: string
  description: string
  order: number
}

export type CollectionPrayer = TselotPrayer & {
  collection: string
  collectionSlug: PrayerCollectionId
  section: string
  chapter: string
  order: number
  youtubeId?: string
  youtubeUrl?: string
  /** Language-specific titles from Supabase when available. */
  titles?: {
    amharic: string
    geez: string
    english: string
    fallback: string
  }
  /** Numeric Psalm number when this is a Mezmure Dawit entry. */
  psalmNumber?: number
}

/** Canonical collection slugs known to the product (not a runtime content source). */
export const CANONICAL_PRAYER_COLLECTION_SLUGS = [
  'zewter-tselot',
  'wudase-mariam',
  'mezmure-dawit',
  'yekidane-tselot',
  'meharene-ab',
] as const

export function categoryLabel(prayer: CollectionPrayer): string {
  return TSELOT_PRIMARY_LABEL[prayer.categoryPrimary]
}

/** @deprecated Prefer loadPrayerCollections() from Supabase. */
export function getPrayerCollection(slug?: string | null): PrayerCollection | undefined {
  if (!slug) return undefined
  const id = slug.trim().toLowerCase()
  if (!id) return undefined
  return {
    id,
    title: id,
    amharicTitle: '',
    description: '',
    order: 0,
  }
}

/** @deprecated Prefer loadPrayerCollection() from Supabase. Always empty — no local runtime content. */
export function getCollectionPrayers(_collectionSlug?: string | null): CollectionPrayer[] {
  return []
}

/** @deprecated Prefer loadPrayer() from Supabase. */
export function findCollectionPrayer(
  _collectionSlug?: string | null,
  _prayerSlug?: string | null,
): CollectionPrayer | undefined {
  return undefined
}

/** @deprecated Prefer loadPrayer() from Supabase. */
export function findPrayerByLegacySlug(_slug?: string | null): CollectionPrayer | undefined {
  return undefined
}

/** @deprecated Prefer Supabase counts. */
export function collectionPrayerCount(_collectionSlug: string): number {
  return 0
}
