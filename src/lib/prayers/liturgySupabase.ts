import type { SupabaseClient } from '@supabase/supabase-js'
import { supabase } from '../supabase/client'
import type {
  LiturgyCollection,
  LiturgyEntry,
  LiturgySection,
} from './prayerLibraryTypes'

type Status = 'draft' | 'pending_review' | 'published' | 'rejected' | 'archived'

type CollectionRow = {
  id: string
  slug: string
  title: string
  title_amharic: string | null
  description: string | null
  sort_order: number
  status: Status
  image_path?: string | null
  image_alt?: string | null
}

type SectionRow = {
  id: string
  collection_id: string
  collection_slug?: string | null
  slug: string
  title: string
  title_amharic: string | null
  description: string | null
  sort_order: number
  status: Status
}

type EntryRow = {
  id: string
  collection_id: string
  section_id: string
  collection_slug?: string | null
  collection_title?: string | null
  section_slug?: string | null
  section_title?: string | null
  section_sort_order?: number | null
  slug: string
  title: string | null
  title_amharic: string | null
  text_amharic: string | null
  text_english: string | null
  text_oromo: string | null
  transliteration: string | null
  speaker: string | null
  content_type: string | null
  sort_order: number
  source_page_start?: number | null
  source_page_end?: number | null
  status: Status
}

type Table<Row> = {
  Row: Row
  Insert: Partial<Row>
  Update: Partial<Row>
  Relationships: []
}

type LiturgyDatabase = {
  public: {
    Tables: {
      liturgy_collections: Table<CollectionRow>
      liturgy_sections: Table<SectionRow>
      liturgy_entries: Table<EntryRow>
    }
    Views: Record<never, never>
    Functions: Record<never, never>
    Enums: Record<never, never>
    CompositeTypes: Record<never, never>
  }
}

const db = supabase as unknown as SupabaseClient<LiturgyDatabase> | null

function logError(context: string, error: unknown) {
  if (!import.meta.env.DEV) return
  if (error && typeof error === 'object') {
    const e = error as { code?: string; message?: string; details?: string; hint?: string }
    console.error(`[liturgy] ${context}`, {
      code: e.code,
      message: e.message,
      details: e.details,
      hint: e.hint,
    })
    return
  }
  console.error(`[liturgy] ${context}`, error)
}

function mapCollection(row: CollectionRow): LiturgyCollection {
  return {
    id: row.id,
    slug: row.slug,
    title: row.title,
    titleAmharic: row.title_amharic ?? '',
    description: row.description ?? '',
    sortOrder: row.sort_order,
    imagePath: row.image_path ?? undefined,
    imageAlt: row.image_alt ?? undefined,
  }
}

function mapSection(row: SectionRow): LiturgySection {
  return {
    id: row.id,
    slug: row.slug,
    title: row.title,
    titleAmharic: row.title_amharic ?? '',
    description: row.description ?? '',
    sortOrder: row.sort_order,
    collectionId: row.collection_id,
    collectionSlug: row.collection_slug ?? 'divine-liturgy',
  }
}

function mapEntry(row: EntryRow): LiturgyEntry {
  return {
    id: row.id,
    slug: row.slug,
    title: row.title?.trim() || '',
    titleAmharic: row.title_amharic?.trim() || '',
    textAmharic: row.text_amharic ?? '',
    textEnglish: row.text_english ?? '',
    textOromo: row.text_oromo ?? '',
    transliteration: row.transliteration ?? '',
    speaker: row.speaker ?? '',
    contentType: row.content_type ?? '',
    sortOrder: row.sort_order,
    sectionId: row.section_id,
    collectionId: row.collection_id,
    collectionSlug: row.collection_slug?.trim() || '',
    sectionSlug: row.section_slug?.trim() || '',
  }
}

export function isPublicSpeakerLabel(speaker: string | null | undefined): boolean {
  const value = (speaker || '').trim().toLowerCase()
  if (!value || value === 'unknown' || value === 'instruction' || value === 'n/a') return false
  return true
}

export function formatSpeakerLabel(speaker: string): string {
  const raw = speaker.trim()
  if (!raw) return ''
  return raw.replace(/[-_]+/g, ' ').replace(/\b\w/g, (c) => c.toUpperCase())
}

/** Published liturgy collections from liturgy_collections only. */
export async function getLiturgyCollections(): Promise<LiturgyCollection[]> {
  if (!db) return []
  try {
    const { data, error } = await db
      .from('liturgy_collections')
      .select('id,slug,title,title_amharic,description,sort_order,status,image_path,image_alt')
      .eq('status', 'published')
      .order('sort_order')
    if (error) throw error
    return (data ?? []).map(mapCollection)
  } catch (error) {
    logError('getLiturgyCollections', error)
    throw error
  }
}

export async function getLiturgyCollectionBySlug(slugInput?: string | null) {
  const slug = slugInput?.trim().toLowerCase()
  if (!slug || !db) return null
  try {
    const { data, error } = await db
      .from('liturgy_collections')
      .select('id,slug,title,title_amharic,description,sort_order,status,image_path,image_alt')
      .eq('slug', slug)
      .eq('status', 'published')
      .maybeSingle()
    if (error) throw error
    return data ? mapCollection(data) : null
  } catch (error) {
    logError(`getLiturgyCollectionBySlug(${slug})`, error)
    throw error
  }
}

/** Sections for one collection — never loads liturgy_entries. */
export async function getLiturgySections(collectionId: string): Promise<LiturgySection[]> {
  if (!db) return []
  try {
    const { data, error } = await db
      .from('liturgy_sections')
      .select(
        'id,collection_id,collection_slug,slug,title,title_amharic,description,sort_order,status',
      )
      .eq('collection_id', collectionId)
      .eq('status', 'published')
      .order('sort_order')
    if (error) throw error
    return (data ?? []).map(mapSection)
  } catch (error) {
    logError('getLiturgySections', error)
    throw error
  }
}

export async function getLiturgySectionBySlug(collectionSlug: string, sectionSlug: string) {
  if (!db) return null
  try {
    const collection = await getLiturgyCollectionBySlug(collectionSlug)
    if (!collection) return null
    const { data, error } = await db
      .from('liturgy_sections')
      .select(
        'id,collection_id,collection_slug,slug,title,title_amharic,description,sort_order,status',
      )
      .eq('collection_id', collection.id)
      .eq('slug', sectionSlug)
      .eq('status', 'published')
      .maybeSingle()
    if (error) throw error
    return data ? mapSection({ ...data, collection_slug: data.collection_slug ?? collection.slug }) : null
  } catch (error) {
    logError(`getLiturgySectionBySlug(${collectionSlug}/${sectionSlug})`, error)
    throw error
  }
}

/** Entries for one section only — does not load the full liturgy corpus. */
export async function getLiturgyEntriesForSection(
  sectionId: string,
  collectionId?: string,
): Promise<LiturgyEntry[]> {
  if (!db) return []
  const pageSize = 1000
  const rows: EntryRow[] = []
  try {
    for (let from = 0; ; from += pageSize) {
      const to = from + pageSize - 1
      let query = db
        .from('liturgy_entries')
        .select(
          'id,collection_id,section_id,collection_slug,section_slug,slug,title,title_amharic,text_amharic,text_english,text_oromo,transliteration,speaker,content_type,sort_order,status',
        )
        .eq('section_id', sectionId)
        .eq('status', 'published')
        .order('sort_order')
        .range(from, to)
      if (collectionId) query = query.eq('collection_id', collectionId)
      const { data, error } = await query
      if (error) throw error
      const page = data ?? []
      rows.push(...page)
      if (page.length < pageSize) break
    }
    return rows.map(mapEntry)
  } catch (error) {
    logError('getLiturgyEntriesForSection', error)
    throw error
  }
}

export async function countLiturgySections(collectionId: string): Promise<number> {
  if (!db) return 0
  const { count, error } = await db
    .from('liturgy_sections')
    .select('id', { count: 'exact', head: true })
    .eq('collection_id', collectionId)
    .eq('status', 'published')
  if (error) throw error
  return count ?? 0
}

/** Server-side search over liturgy_entries only (not public.prayers). */
export async function searchLiturgyEntries(query: string, limit = 12): Promise<LiturgyEntry[]> {
  if (!db || !query.trim()) return []
  const pattern = `%${query.trim()}%`
  try {
    const { data, error } = await db
      .from('liturgy_entries')
      .select(
        'id,collection_id,section_id,collection_slug,section_slug,slug,title,title_amharic,text_amharic,text_english,text_oromo,transliteration,speaker,content_type,sort_order,status',
      )
      .eq('status', 'published')
      .or(
        [
          `title.ilike.${pattern}`,
          `title_amharic.ilike.${pattern}`,
          `text_amharic.ilike.${pattern}`,
          `text_english.ilike.${pattern}`,
          `text_oromo.ilike.${pattern}`,
          `transliteration.ilike.${pattern}`,
          `speaker.ilike.${pattern}`,
          `content_type.ilike.${pattern}`,
        ].join(','),
      )
      .order('sort_order')
      .limit(limit)
    if (error) throw error
    return (data ?? []).map(mapEntry)
  } catch (error) {
    logError('searchLiturgyEntries', error)
    throw error
  }
}

export {
  getLiturgyCollections as getPublishedLiturgyCollections,
  searchLiturgyEntries as searchLiturgy,
  getLiturgyEntriesForSection as getLiturgyEntries,
}
