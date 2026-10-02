import type { CollectionPrayer } from './prayerCollections'
import { DAILY_COLLECTION_SLUGS } from './dailyPrayerRhythmSchedule'
import {
  canonicalPrayerCollectionSlug,
  type PrayerCollectionBundle,
  type PrayerSectionView,
} from './prayerSupabase'

/** Re-export canonical slug for Zeweter continuous reader. */
export const ZEWTER_COLLECTION_SLUG = DAILY_COLLECTION_SLUGS.zewter

/** Expected bookends from live CSV / Supabase import (sort_order 1 … 10). */
export const ZEWTER_EXPECTED_FIRST = {
  slug: 'sign-of-the-cross-opening',
  title: 'YeMeskel Milikit',
  titleAmharic: 'የመስቀል ምልክት',
} as const

export const ZEWTER_EXPECTED_LAST = {
  slug: 'magnificat-prayer',
  title: 'Tselote Egzietne Mariam',
  titleAmharic: 'ጸሎተ እግዝእትነ ማርያም',
} as const

export function isZewterCollectionSlug(slug?: string | null): boolean {
  return canonicalPrayerCollectionSlug(slug) === ZEWTER_COLLECTION_SLUG
}

export type ZewterReadingBlock =
  | { kind: 'section'; id: string; slug: string; title: string; titleAmharic: string }
  | { kind: 'prayer'; prayer: CollectionPrayer }

/**
 * Continuous reading order: section.sort_order, then prayer.sort_order within
 * each section. Prayers without a section follow after sectioned prayers,
 * still by sort_order. Flat collections (no sections) use prayer order only.
 */
export function buildZewterReadingBlocks(bundle: PrayerCollectionBundle): ZewterReadingBlock[] {
  const blocks: ZewterReadingBlock[] = []
  const sections = [...bundle.sections].sort((a, b) => a.order - b.order || a.slug.localeCompare(b.slug))
  const placed = new Set<string>()

  for (const section of sections) {
    const sectionPrayers = [...section.prayers].sort(
      (a, b) => a.order - b.order || a.slug.localeCompare(b.slug),
    )
    if (sectionPrayers.length === 0) continue
    blocks.push({
      kind: 'section',
      id: section.id,
      slug: section.slug,
      title: section.title,
      titleAmharic: section.titleAmharic,
    })
    for (const prayer of sectionPrayers) {
      blocks.push({ kind: 'prayer', prayer })
      placed.add(prayer.id)
    }
  }

  const unsectioned = bundle.prayers
    .filter((prayer) => !placed.has(prayer.id))
    .sort((a, b) => a.order - b.order || a.slug.localeCompare(b.slug))

  for (const prayer of unsectioned) {
    blocks.push({ kind: 'prayer', prayer })
  }

  return blocks
}

export function zewterPrayerAnchorId(slug: string): string {
  return slug.trim().toLowerCase()
}

export function zewterSectionAnchorId(slug: string): string {
  return `section-${slug.trim().toLowerCase()}`
}

export function zewterContinuousPath(hash?: string): string {
  const base = `/pray/${ZEWTER_COLLECTION_SLUG}`
  if (!hash) return base
  const clean = hash.replace(/^#/, '')
  return clean ? `${base}#${clean}` : base
}

export type ZewterDevAudit = {
  collectionSlug: string
  sectionCount: number
  prayerCount: number
  firstPrayer: { slug: string; title: string } | null
  lastPrayer: { slug: string; title: string } | null
  firstMatchesExpected: boolean
  lastMatchesExpected: boolean
  duplicateSortOrders: number[]
  prayersMissingSectionId: number
  prayersMissingAllText: number
  sortOrderNeedsRepair: boolean
}

export function auditZewterBundle(bundle: PrayerCollectionBundle): ZewterDevAudit {
  const prayers = [...bundle.prayers].sort((a, b) => a.order - b.order || a.slug.localeCompare(b.slug))
  const first = prayers[0] ?? null
  const last = prayers[prayers.length - 1] ?? null

  const orderCounts = new Map<number, number>()
  for (const prayer of prayers) {
    orderCounts.set(prayer.order, (orderCounts.get(prayer.order) ?? 0) + 1)
  }
  const duplicateSortOrders = [...orderCounts.entries()]
    .filter(([, count]) => count > 1)
    .map(([order]) => order)
    .sort((a, b) => a - b)

  const prayersMissingAllText = prayers.filter(
    (prayer) =>
      !prayer.text.amharic.trim() && !prayer.text.geez.trim() && !prayer.text.english.trim(),
  ).length

  // Flat Zeweter currently has no sections; count "missing section" only when
  // sections exist in the collection (so future sectioned data is visible).
  const prayersMissingSectionId =
    bundle.sections.length > 0
      ? prayers.filter((prayer) => !prayer.section?.trim()).length
      : 0

  const firstMatchesExpected = first?.slug === ZEWTER_EXPECTED_FIRST.slug
  const lastMatchesExpected = last?.slug === ZEWTER_EXPECTED_LAST.slug

  return {
    collectionSlug: bundle.collection.id,
    sectionCount: bundle.sections.length,
    prayerCount: prayers.length,
    firstPrayer: first
      ? { slug: first.slug, title: first.transliterationTitle || first.title }
      : null,
    lastPrayer: last
      ? { slug: last.slug, title: last.transliterationTitle || last.title }
      : null,
    firstMatchesExpected,
    lastMatchesExpected,
    duplicateSortOrders,
    prayersMissingSectionId,
    prayersMissingAllText,
    sortOrderNeedsRepair: !firstMatchesExpected || !lastMatchesExpected || duplicateSortOrders.length > 0,
  }
}

export function logZewterDevAudit(audit: ZewterDevAudit): void {
  if (!import.meta.env.DEV) return
  console.info('[zeweter] continuous reader audit', audit)
  if (audit.sortOrderNeedsRepair) {
    console.warn('[zeweter] sort_order / bookend discrepancy — do not reorder by title in the UI', {
      expectedFirst: ZEWTER_EXPECTED_FIRST,
      expectedLast: ZEWTER_EXPECTED_LAST,
      actualFirst: audit.firstPrayer,
      actualLast: audit.lastPrayer,
      duplicateSortOrders: audit.duplicateSortOrders,
    })
  }
}

/** Sections that contain at least one prayer (for optional headings). */
export function zewterSectionsWithPrayers(sections: PrayerSectionView[]): PrayerSectionView[] {
  return sections
    .filter((section) => section.prayers.length > 0)
    .sort((a, b) => a.order - b.order || a.slug.localeCompare(b.slug))
}
