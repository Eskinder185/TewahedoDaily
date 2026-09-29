import type { SupabaseClient } from '@supabase/supabase-js'
import { supabase } from '../supabase/client'
import type { CollectionPrayer, PrayerCollection } from './prayerCollections'
import {
  UNMIGRATED_PRAYER_COLLECTIONS,
  UNMIGRATED_PRAYERS,
} from './unmigratedPrayerData'

type Status = 'draft' | 'pending_review' | 'published' | 'rejected' | 'archived'

export type PrayerCollectionRow = {
  id: string
  slug: string
  title: string
  title_amharic: string | null
  description: string | null
  sort_order: number
  status: Status
  published_at: string | null
  image_path?: string | null
  image_alt?: string | null
}

export type PrayerSectionRow = {
  id: string
  collection_id: string
  slug: string
  title: string
  title_amharic: string | null
  description: string | null
  sort_order: number
  status: Status
  published_at: string | null
}

export type PrayerRow = {
  id: string
  slug: string
  title: string
  title_amharic: string | null
  text_amharic: string | null
  text_english: string | null
  text_oromo: string | null
  thumbnail_url: string | null
  collection_id: string | null
  section_id: string | null
  sort_order: number
  status: Status
  published_at: string | null
}

type Table<Row> = {
  Row: Row
  Insert: Partial<Row>
  Update: Partial<Row>
  Relationships: []
}

type PrayerDatabase = {
  public: {
    Tables: {
      prayer_collections: Table<PrayerCollectionRow>
      prayer_sections: Table<PrayerSectionRow>
      prayers: Table<PrayerRow>
    }
    Views: Record<never, never>
    Functions: Record<never, never>
    Enums: Record<never, never>
    CompositeTypes: Record<never, never>
  }
}

export type PrayerCollectionView = PrayerCollection & {
  prayerCount: number
  sectionCount: number
  countLabel?: 'sections' | 'psalms' | 'prayers'
  imagePath?: string
  imageAlt?: string
}

export type PrayerSectionView = {
  id: string
  slug: string
  title: string
  titleAmharic: string
  description: string
  order: number
  prayers: CollectionPrayer[]
}

export type PrayerCollectionBundle = {
  collection: PrayerCollectionView
  sections: PrayerSectionView[]
  prayers: CollectionPrayer[]
}

const prayerDb = supabase as unknown as SupabaseClient<PrayerDatabase> | null

export function canonicalPrayerCollectionSlug(slug?: string | null): string {
  const normalized = slug?.trim().toLowerCase() ?? ''
  if (normalized === 'wudasie-mariam') return 'wudase-mariam'
  return normalized
}

function logPrayerError(context: string, error: unknown) {
  if (!import.meta.env.DEV) return
  if (error && typeof error === 'object') {
    const e = error as { code?: string; message?: string; details?: string; hint?: string }
    console.error(`[prayers] ${context}`, {
      code: e.code,
      message: e.message,
      details: e.details,
      hint: e.hint,
    })
    return
  }
  console.error(`[prayers] ${context}`, error)
}

function countLabelFor(
  slug: string,
  prayerCount: number,
  sectionCount = 0,
): PrayerCollectionView['countLabel'] {
  if (slug === 'mezmure-dawit') return 'psalms'
  if (prayerCount === 1) return 'prayers'
  if (sectionCount > 0) return 'sections'
  return 'prayers'
}

function mapCollection(
  row: PrayerCollectionRow,
  prayerCount = 0,
  sectionCount = 0,
): PrayerCollectionView {
  return {
    id: row.slug as PrayerCollection['id'],
    title: row.title,
    amharicTitle: row.title_amharic ?? '',
    description: row.description ?? '',
    order: row.sort_order,
    prayerCount,
    sectionCount,
    countLabel: countLabelFor(row.slug, prayerCount, sectionCount),
    imagePath: row.image_path ?? undefined,
    imageAlt: row.image_alt ?? undefined,
  }
}

function mapPrayer(
  row: PrayerRow,
  collection: PrayerCollectionRow,
  section?: PrayerSectionRow,
): CollectionPrayer {
  const title = row.title_amharic?.trim() || row.title
  const english = row.text_english ?? ''
  const amharic = row.text_amharic ?? ''
  const oromo = row.text_oromo ?? ''
  return {
    id: row.id,
    slug: row.slug,
    title,
    transliterationTitle: row.title,
    collection: collection.title,
    collectionSlug: collection.slug as CollectionPrayer['collectionSlug'],
    section: section?.title ?? '',
    chapter: section?.title ?? '',
    order: row.sort_order,
    categoryPrimary: collection.slug === 'wudase-mariam' ? 'mary' : 'liturgical',
    categoryUsage: [collection.slug, ...(section ? [section.slug] : [])],
    categorySeason: [],
    categoryConfidence: 'high',
    summary: { amharic: '', english: section?.description ?? '' },
    text: { amharic, geez: '', english: english || oromo },
    transliteration: { amharic: '', geez: '', english: '' },
    source: { bookTitle: collection.title, fullTextLink: '', audioUrl: '' },
    purposeLine: row.title,
    fullText: [amharic, english, oromo].filter(Boolean).join('\n\n'),
  }
}

function unmigratedCollection(slug: string) {
  return UNMIGRATED_PRAYER_COLLECTIONS.find((collection) => collection.id === slug)
}

function unmigratedBundle(slug: string): PrayerCollectionBundle | null {
  const collection = unmigratedCollection(slug)
  if (!collection) return null
  const prayers = UNMIGRATED_PRAYERS.filter((prayer) => prayer.collectionSlug === slug)
  return {
    collection: {
      ...collection,
      prayerCount: prayers.length,
      sectionCount: 0,
      countLabel: countLabelFor(slug, prayers.length, 0),
    },
    sections: [],
    prayers,
  }
}

/** Public published prayer collections (dynamic — new CMS rows appear automatically). */
export async function getPrayerCollections(): Promise<PrayerCollectionView[]> {
  return loadPrayerCollections()
}

export async function loadPrayerCollections(): Promise<PrayerCollectionView[]> {
  if (!prayerDb) {
    return UNMIGRATED_PRAYER_COLLECTIONS.map((collection) => {
      const prayerCount = UNMIGRATED_PRAYERS.filter((p) => p.collectionSlug === collection.id).length
      return {
        ...collection,
        prayerCount,
        sectionCount: 0,
        countLabel: countLabelFor(collection.id, prayerCount, 0),
      }
    })
  }

  try {
    const { data, error } = await prayerDb
      .from('prayer_collections')
      .select('*')
      .eq('status', 'published')
      .order('sort_order')
    if (error) throw error

    const remote = await Promise.all(
      (data ?? [])
        .filter((collection) => collection.slug !== 'divine-liturgy')
        .map(async (collection) => {
        const [{ count: prayerCount, error: prayerCountError }, { count: sectionCount, error: sectionCountError }] =
          await Promise.all([
            prayerDb
              .from('prayers')
              .select('id', { count: 'exact', head: true })
              .eq('collection_id', collection.id)
              .eq('status', 'published'),
            prayerDb
              .from('prayer_sections')
              .select('id', { count: 'exact', head: true })
              .eq('collection_id', collection.id)
              .eq('status', 'published'),
          ])
        if (prayerCountError) throw prayerCountError
        if (sectionCountError) throw sectionCountError
        return mapCollection(collection, prayerCount ?? 0, sectionCount ?? 0)
      }),
    )

    // Only append legacy local collections that are not yet present in Supabase.
    const remoteSlugs = new Set(remote.map((collection) => collection.id))
    const localOnly = UNMIGRATED_PRAYER_COLLECTIONS.filter(
      (collection) => !remoteSlugs.has(collection.id),
    ).map((collection) => {
      const prayerCount = UNMIGRATED_PRAYERS.filter((p) => p.collectionSlug === collection.id).length
      return {
        ...collection,
        prayerCount,
        sectionCount: 0,
        countLabel: countLabelFor(collection.id, prayerCount, 0) as PrayerCollectionView['countLabel'],
      }
    })

    return [...remote, ...localOnly].sort((a, b) => a.order - b.order)
  } catch (error) {
    logPrayerError('loadPrayerCollections', error)
    throw error
  }
}

export async function getPrayerCollectionBySlug(slugInput?: string | null) {
  return loadPrayerCollection(slugInput)
}

export async function loadPrayerCollection(
  slugInput?: string | null,
): Promise<PrayerCollectionBundle | null> {
  const slug = canonicalPrayerCollectionSlug(slugInput)
  if (!slug) return null

  if (!prayerDb) return unmigratedBundle(slug)

  try {
    const { data: collection, error: collectionError } = await prayerDb
      .from('prayer_collections')
      .select('*')
      .eq('slug', slug)
      .eq('status', 'published')
      .maybeSingle()
    if (collectionError) throw collectionError
    if (!collection) return unmigratedBundle(slug)

    const [{ data: sections, error: sectionsError }, { data: prayers, error: prayersError }] =
      await Promise.all([
        prayerDb
          .from('prayer_sections')
          .select('*')
          .eq('collection_id', collection.id)
          .eq('status', 'published')
          .order('sort_order'),
        prayerDb
          .from('prayers')
          .select('*')
          .eq('collection_id', collection.id)
          .eq('status', 'published')
          .order('sort_order'),
      ])
    if (sectionsError) throw sectionsError
    if (prayersError) throw prayersError

    const sectionRows = sections ?? []
    const prayerRows = prayers ?? []
    const sectionById = new Map(sectionRows.map((section) => [section.id, section]))
    const mappedPrayers = prayerRows.map((prayer) =>
      mapPrayer(prayer, collection, prayer.section_id ? sectionById.get(prayer.section_id) : undefined),
    )

    const sectionsView: PrayerSectionView[] = sectionRows.map((section) => ({
      id: section.id,
      slug: section.slug,
      title: section.title,
      titleAmharic: section.title_amharic ?? '',
      description: section.description ?? '',
      order: section.sort_order,
      prayers: mappedPrayers.filter((prayer) => {
        const row = prayerRows.find((item) => item.id === prayer.id)
        return row?.section_id === section.id
      }),
    }))

    // Include unsectioned prayers in a synthetic list by keeping them only in `prayers`.
    return {
      collection: mapCollection(collection, mappedPrayers.length, sectionRows.length),
      sections: sectionsView,
      prayers: mappedPrayers,
    }
  } catch (error) {
    logPrayerError(`loadPrayerCollection(${slug})`, error)
    throw error
  }
}

export async function getPrayerSections(collectionIdOrSlug: string) {
  const bundle = await loadPrayerCollection(collectionIdOrSlug)
  return bundle?.sections ?? []
}

export async function getPrayersForSection(collectionSlug: string, sectionSlug: string) {
  const bundle = await loadPrayerCollection(collectionSlug)
  return bundle?.sections.find((section) => section.slug === sectionSlug)?.prayers ?? []
}

export async function getPrayerBySlug(collectionSlugInput?: string | null, prayerSlug?: string | null) {
  return loadPrayer(collectionSlugInput, prayerSlug)
}

export async function loadPrayer(
  collectionSlugInput?: string | null,
  prayerSlug?: string | null,
): Promise<CollectionPrayer | undefined> {
  const collectionSlug = canonicalPrayerCollectionSlug(collectionSlugInput)
  if (!collectionSlug || !prayerSlug) return undefined

  if (!prayerDb) {
    return UNMIGRATED_PRAYERS.find(
      (prayer) => prayer.collectionSlug === collectionSlug && prayer.slug === prayerSlug,
    )
  }

  try {
    const { data: collection, error: collectionError } = await prayerDb
      .from('prayer_collections')
      .select('*')
      .eq('slug', collectionSlug)
      .eq('status', 'published')
      .maybeSingle()
    if (collectionError) throw collectionError
    if (!collection) {
      return UNMIGRATED_PRAYERS.find(
        (prayer) => prayer.collectionSlug === collectionSlug && prayer.slug === prayerSlug,
      )
    }

    const { data: prayer, error: prayerError } = await prayerDb
      .from('prayers')
      .select('*')
      .eq('collection_id', collection.id)
      .eq('slug', prayerSlug)
      .eq('status', 'published')
      .maybeSingle()
    if (prayerError) throw prayerError
    if (!prayer) return undefined

    let section: PrayerSectionRow | undefined
    if (prayer.section_id) {
      const { data, error } = await prayerDb
        .from('prayer_sections')
        .select('*')
        .eq('id', prayer.section_id)
        .eq('status', 'published')
        .maybeSingle()
      if (error) throw error
      section = data ?? undefined
    }
    return mapPrayer(prayer, collection, section)
  } catch (error) {
    logPrayerError(`loadPrayer(${collectionSlug}/${prayerSlug})`, error)
    throw error
  }
}

export async function searchPrayers(queryInput: string): Promise<CollectionPrayer[]> {
  const query = queryInput.trim().replace(/[%_,().]/g, ' ').replace(/\s+/g, ' ').slice(0, 200)
  if (!query) return []

  const localMatches = UNMIGRATED_PRAYERS.filter((prayer) => {
    const blob = [prayer.title, prayer.transliterationTitle, prayer.text.amharic, prayer.text.english]
      .join(' ')
      .toLowerCase()
    return blob.includes(query.toLowerCase())
  })

  if (!prayerDb) return localMatches.slice(0, 24)

  try {
    const pattern = `%${query}%`
    const { data: prayers, error: prayerError } = await prayerDb
      .from('prayers')
      .select('*')
      .eq('status', 'published')
      .or(
        [
          `title.ilike.${pattern}`,
          `title_amharic.ilike.${pattern}`,
          `text_amharic.ilike.${pattern}`,
          `text_english.ilike.${pattern}`,
          `text_oromo.ilike.${pattern}`,
        ].join(','),
      )
      .order('sort_order')
      .limit(24)
    if (prayerError) throw prayerError

    const collectionIds = [...new Set((prayers ?? []).flatMap((row) => (row.collection_id ? [row.collection_id] : [])))]
    const sectionIds = [...new Set((prayers ?? []).flatMap((row) => (row.section_id ? [row.section_id] : [])))]

    const [{ data: collections, error: collectionError }, { data: sections, error: sectionError }] =
      await Promise.all([
        collectionIds.length
          ? prayerDb.from('prayer_collections').select('*').in('id', collectionIds).eq('status', 'published')
          : Promise.resolve({ data: [] as PrayerCollectionRow[], error: null }),
        sectionIds.length
          ? prayerDb.from('prayer_sections').select('*').in('id', sectionIds).eq('status', 'published')
          : Promise.resolve({ data: [] as PrayerSectionRow[], error: null }),
      ])
    if (collectionError) throw collectionError
    if (sectionError) throw sectionError

    const collectionById = new Map((collections ?? []).map((row) => [row.id, row]))
    const sectionById = new Map((sections ?? []).map((row) => [row.id, row]))
    const remoteMatches = (prayers ?? []).flatMap((prayer) => {
      const collection = prayer.collection_id ? collectionById.get(prayer.collection_id) : undefined
      if (!collection) return []
      // Prefer liturgy_collections for Divine Liturgy content.
      if (collection.slug === 'divine-liturgy') return []
      return [
        mapPrayer(
          prayer,
          collection,
          prayer.section_id ? sectionById.get(prayer.section_id) : undefined,
        ),
      ]
    })

    return remoteMatches.slice(0, 24)
  } catch (error) {
    logPrayerError('searchPrayers', error)
    throw error
  }
}
