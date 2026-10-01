import type { SupabaseClient } from '@supabase/supabase-js'
import { supabase } from '../supabase/client'
import type { CollectionPrayer, PrayerCollection } from './prayerCollections'
import { compareByPsalmNumber, getPsalmNumber } from './psalmNumber'

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
  title_geez: string | null
  title_english: string | null
  text_amharic: string | null
  text_geez: string | null
  text_english: string | null
  text_oromo: string | null
  transliteration: string | null
  thumbnail_url: string | null
  collection_id: string | null
  section_id: string | null
  collection_slug: string | null
  section_slug: string | null
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
  if (normalized === 'zeweter-tselot' || normalized === 'zeweter') return 'zewter-tselot'
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
  const titleAmharic = (row.title_amharic || '').trim()
  const titleGeez = (row.title_geez || '').trim()
  const titleEnglish = (row.title_english || '').trim()
  const fallbackTitle = (row.title || '').trim()
  const displayTitle = titleAmharic || titleGeez || titleEnglish || fallbackTitle

  const amharic = (row.text_amharic || '').trim()
  const geez = (row.text_geez || '').trim()
  const english = (row.text_english || '').trim()
  const oromo = (row.text_oromo || '').trim()
  const englishOrOromo = english || oromo

  const psalmNumber =
    collection.slug === 'mezmure-dawit' ? getPsalmNumber(row) : null
  const order = psalmNumber ?? row.sort_order

  return {
    id: row.id,
    slug: row.slug,
    title: displayTitle,
    transliterationTitle: fallbackTitle && fallbackTitle !== displayTitle ? fallbackTitle : titleEnglish,
    titles: {
      amharic: titleAmharic,
      geez: titleGeez,
      english: titleEnglish,
      fallback: fallbackTitle || displayTitle,
    },
    collection: collection.title,
    collectionSlug: collection.slug as CollectionPrayer['collectionSlug'],
    section: section?.title ?? '',
    chapter: section?.title ?? '',
    order,
    psalmNumber: psalmNumber ?? undefined,
    categoryPrimary: collection.slug === 'wudase-mariam' ? 'mary' : 'liturgical',
    categoryUsage: [collection.slug, ...(section ? [section.slug] : [])],
    categorySeason: [],
    categoryConfidence: 'high',
    summary: { amharic: '', english: section?.description ?? '' },
    text: { amharic, geez, english: englishOrOromo },
    transliteration: {
      amharic: '',
      geez: '',
      english: (row.transliteration || '').trim(),
    },
    source: { bookTitle: collection.title, fullTextLink: '', audioUrl: '' },
    purposeLine: fallbackTitle || displayTitle,
    fullText: [amharic, geez, englishOrOromo].filter(Boolean).join('\n\n'),
  }
}

function sortCollectionPrayers(
  collectionSlug: string,
  prayers: CollectionPrayer[],
): CollectionPrayer[] {
  if (collectionSlug !== 'mezmure-dawit') {
    return [...prayers].sort((a, b) => a.order - b.order || a.slug.localeCompare(b.slug))
  }
  return [...prayers].sort((a, b) =>
    compareByPsalmNumber(
      { slug: a.slug, title: a.transliterationTitle || a.title, order: a.order },
      { slug: b.slug, title: b.transliterationTitle || b.title, order: b.order },
    ),
  )
}

/** Public published prayer collections (dynamic — new CMS rows appear automatically). */
export async function getPrayerCollections(): Promise<PrayerCollectionView[]> {
  return loadPrayerCollections()
}

export async function loadPrayerCollections(): Promise<PrayerCollectionView[]> {
  if (!prayerDb) {
    throw new Error('Supabase is not configured for prayer collections.')
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
          const [
            { count: prayerCount, error: prayerCountError },
            { count: sectionCount, error: sectionCountError },
          ] = await Promise.all([
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

    return remote.sort((a, b) => a.order - b.order)
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

  if (!prayerDb) {
    throw new Error('Supabase is not configured for prayer collections.')
  }

  try {
    const { data: collection, error: collectionError } = await prayerDb
      .from('prayer_collections')
      .select('*')
      .eq('slug', slug)
      .eq('status', 'published')
      .maybeSingle()
    if (collectionError) throw collectionError
    if (!collection) return null

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

    // Soft-link Wudase weekday prayers to sections when section_id is still null.
    const mappedPrayers = sortCollectionPrayers(
      collection.slug,
      prayerRows.map((prayer) => {
        let section = prayer.section_id ? sectionById.get(prayer.section_id) : undefined
        if (!section && collection.slug === 'wudase-mariam') {
          const weekday = prayer.slug.replace(/^wudase-mariam-/, '')
          section = sectionRows.find((row) => row.slug === weekday || row.slug === prayer.slug)
        }
        return mapPrayer(prayer, collection, section)
      }),
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
        if (row?.section_id === section.id) return true
        if (collection.slug === 'wudase-mariam') {
          return (
            prayer.slug === section.slug ||
            prayer.slug === `wudase-mariam-${section.slug}` ||
            prayer.slug.endsWith(`-${section.slug}`)
          )
        }
        return false
      }),
    }))

    // Mezmure Dawit: keep import-group sections out of the public reading model.
    const publicSections =
      collection.slug === 'mezmure-dawit'
        ? []
        : sectionsView

    return {
      collection: mapCollection(collection, mappedPrayers.length, publicSections.length || sectionRows.length),
      sections: publicSections,
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
    throw new Error('Supabase is not configured for prayers.')
  }

  try {
    const { data: collection, error: collectionError } = await prayerDb
      .from('prayer_collections')
      .select('*')
      .eq('slug', collectionSlug)
      .eq('status', 'published')
      .maybeSingle()
    if (collectionError) throw collectionError
    if (!collection) return undefined

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

  if (!prayerDb) {
    throw new Error('Supabase is not configured for prayer search.')
  }

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
          `title_geez.ilike.${pattern}`,
          `title_english.ilike.${pattern}`,
          `text_amharic.ilike.${pattern}`,
          `text_geez.ilike.${pattern}`,
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
    return (prayers ?? []).flatMap((prayer) => {
      const collection = prayer.collection_id ? collectionById.get(prayer.collection_id) : undefined
      if (!collection) {
        if (import.meta.env.DEV) {
          console.warn('[prayers] orphan prayer missing collection', {
            prayerId: prayer.id,
            slug: prayer.slug,
            collection_id: prayer.collection_id,
            collection_slug: prayer.collection_slug,
          })
        }
        return []
      }
      if (collection.slug === 'divine-liturgy') return []
      const section = prayer.section_id ? sectionById.get(prayer.section_id) : undefined
      if (prayer.section_id && section && section.collection_id !== collection.id && import.meta.env.DEV) {
        console.warn('[prayers] section/collection mismatch', {
          prayerId: prayer.id,
          slug: prayer.slug,
          collection_id: collection.id,
          section_id: section.id,
          section_collection_id: section.collection_id,
        })
      }
      return [mapPrayer(prayer, collection, section)]
    }).slice(0, 24)
  } catch (error) {
    logPrayerError('searchPrayers', error)
    throw error
  }
}
