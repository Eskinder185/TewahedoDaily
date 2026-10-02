import { db, errorMessage, slugify, statuses } from './mezmurService'
import type { ContentStatus } from '../supabase/cms.types'
import {
  parseKeywordsFromDb,
  serializeKeywordsForDb,
} from '../synaxarium/keywords'

export type StructureKind = 'prayers' | 'liturgy' | 'synaxarium'

type CollectionTables = {
  collections: string
  sections: string
  entries?: string
}

const TABLES: Record<Exclude<StructureKind, 'synaxarium'>, CollectionTables> = {
  prayers: {
    collections: 'prayer_collections',
    sections: 'prayer_sections',
    entries: 'prayers',
  },
  liturgy: {
    collections: 'liturgy_collections',
    sections: 'liturgy_sections',
    entries: 'liturgy_entries',
  },
}

export type CollectionRow = {
  id: string
  slug: string
  title: string
  title_amharic: string | null
  description: string | null
  sort_order: number
  status: ContentStatus
  image_path?: string | null
  image_alt?: string | null
  featured?: boolean | null
  card_label?: string | null
  created_at?: string
  updated_at?: string
}

export type SectionRow = {
  id: string
  collection_id: string
  slug: string
  title: string
  title_amharic: string | null
  description: string | null
  sort_order: number
  status: ContentStatus
}

export type EntryRow = {
  id: string
  section_id: string | null
  collection_id?: string | null
  slug: string
  title: string | null
  title_amharic: string | null
  text_amharic?: string | null
  text_english?: string | null
  text_oromo?: string | null
  transliteration?: string | null
  speaker?: string | null
  content_type?: string | null
  sort_order: number
  status: ContentStatus
  source_page_start?: number | null
  source_page_end?: number | null
}

export type SynaxariumDayRow = {
  id: string
  slug: string
  ethiopian_month: string
  ethiopian_month_number: number
  ethiopian_day: number
  display_date_amharic: string | null
  display_date_english: string | null
  summary: string | null
  image_path: string | null
  image_alt: string | null
  status: ContentStatus
}

export type SynaxariumCommemorationRow = {
  id: string
  day_id: string
  day_slug?: string | null
  slug: string
  title: string
  title_amharic: string | null
  commemoration_type: string | null
  summary: string | null
  summary_amharic?: string | null
  body_amharic: string | null
  body_english: string | null
  scripture_references: string | null
  keywords: string[] | string | null
  image_path: string | null
  image_alt: string | null
  featured: boolean | null
  sort_order: number
  status: ContentStatus
  content_review_status?: string | null
}

export async function listCollections(kind: 'prayers' | 'liturgy') {
  const table = TABLES[kind].collections
  const { data, error } = await db()
    .from(table as never)
    .select('*')
    .order('sort_order', { ascending: true })
    .order('title', { ascending: true })
  if (error) throw error
  return (data || []) as unknown as CollectionRow[]
}

export async function getCollection(kind: 'prayers' | 'liturgy', id: string) {
  const { data, error } = await db()
    .from(TABLES[kind].collections as never)
    .select('*')
    .eq('id', id)
    .single()
  if (error) throw error
  return data as unknown as CollectionRow
}

export async function saveCollection(
  kind: 'prayers' | 'liturgy',
  input: Partial<CollectionRow> & { title: string; slug?: string },
  existing?: CollectionRow | null,
) {
  const payload = {
    slug: (input.slug || slugify(input.title)).trim(),
    title: input.title.trim(),
    title_amharic: input.title_amharic || null,
    description: input.description || null,
    sort_order: input.sort_order ?? 0,
    status: (input.status || 'draft') as ContentStatus,
    image_path: input.image_path || null,
    image_alt: input.image_alt || null,
    featured: Boolean(input.featured),
    card_label: input.card_label || null,
    updated_at: new Date().toISOString(),
  }
  if (existing) {
    const { data, error } = await db()
      .from(TABLES[kind].collections as never)
      .update(payload as never)
      .eq('id', existing.id)
      .select('*')
      .single()
    if (error) throw error
    return data as unknown as CollectionRow
  }
  const { data, error } = await db()
    .from(TABLES[kind].collections as never)
    .insert(payload as never)
    .select('*')
    .single()
  if (error) throw error
  return data as unknown as CollectionRow
}

export async function deleteCollection(kind: 'prayers' | 'liturgy', id: string) {
  const { error } = await db()
    .from(TABLES[kind].collections as never)
    .delete()
    .eq('id', id)
  if (error) throw error
}

export async function listSections(kind: 'prayers' | 'liturgy', collectionId: string) {
  const { data, error } = await db()
    .from(TABLES[kind].sections as never)
    .select('*')
    .eq('collection_id', collectionId)
    .order('sort_order', { ascending: true })
  if (error) throw error
  return (data || []) as unknown as SectionRow[]
}

export async function saveSection(
  kind: 'prayers' | 'liturgy',
  input: Partial<SectionRow> & { title: string; collection_id: string; slug?: string },
  existing?: SectionRow | null,
) {
  const payload = {
    collection_id: input.collection_id,
    slug: (input.slug || slugify(input.title)).trim(),
    title: input.title.trim(),
    title_amharic: input.title_amharic || null,
    description: input.description || null,
    sort_order: input.sort_order ?? 0,
    status: (input.status || 'draft') as ContentStatus,
    updated_at: new Date().toISOString(),
  }
  if (existing) {
    const { data, error } = await db()
      .from(TABLES[kind].sections as never)
      .update(payload as never)
      .eq('id', existing.id)
      .select('*')
      .single()
    if (error) throw error
    return data as unknown as SectionRow
  }
  const { data, error } = await db()
    .from(TABLES[kind].sections as never)
    .insert(payload as never)
    .select('*')
    .single()
  if (error) throw error
  return data as unknown as SectionRow
}

export async function deleteSection(kind: 'prayers' | 'liturgy', id: string) {
  const { error } = await db()
    .from(TABLES[kind].sections as never)
    .delete()
    .eq('id', id)
  if (error) throw error
}

export async function listEntries(kind: 'prayers' | 'liturgy', sectionId: string) {
  const table = TABLES[kind].entries!
  let query = db()
    .from(table as never)
    .select('*')
    .eq('section_id', sectionId)
    .order('sort_order', { ascending: true })

  // Cap page size for liturgy (thousands of rows)
  if (kind === 'liturgy') {
    query = query.range(0, 199)
  }

  const { data, error } = await query
  if (error) throw error
  return (data || []) as unknown as EntryRow[]
}

export async function saveEntry(
  kind: 'prayers' | 'liturgy',
  input: Partial<EntryRow> & { title?: string | null; section_id: string; slug?: string },
  existing?: EntryRow | null,
) {
  const title = (input.title || 'Untitled').trim()
  const base: Record<string, unknown> = {
    section_id: input.section_id,
    slug: (input.slug || slugify(title) || `entry-${crypto.randomUUID().slice(0, 8)}`).trim(),
    title,
    title_amharic: input.title_amharic || null,
    text_amharic: input.text_amharic || null,
    text_english: input.text_english || null,
    text_oromo: input.text_oromo || null,
    transliteration: input.transliteration || null,
    sort_order: input.sort_order ?? 0,
    status: (input.status || 'draft') as ContentStatus,
    updated_at: new Date().toISOString(),
  }
  if (kind === 'liturgy') {
    base.speaker = input.speaker || null
    base.content_type = input.content_type || null
    base.source_page_start = input.source_page_start ?? null
    base.source_page_end = input.source_page_end ?? null
  }
  if (input.collection_id) base.collection_id = input.collection_id

  const table = TABLES[kind].entries!
  if (existing) {
    const { data, error } = await db()
      .from(table as never)
      .update(base as never)
      .eq('id', existing.id)
      .select('*')
      .single()
    if (error) throw error
    return data as unknown as EntryRow
  }
  const { data, error } = await db()
    .from(table as never)
    .insert(base as never)
    .select('*')
    .single()
  if (error) throw error
  return data as unknown as EntryRow
}

export async function deleteEntry(kind: 'prayers' | 'liturgy', id: string) {
  const { error } = await db()
    .from(TABLES[kind].entries! as never)
    .delete()
    .eq('id', id)
  if (error) throw error
}

export async function reorderRows(
  table: string,
  orderedIds: string[],
) {
  const updates = orderedIds.map((id, index) =>
    db()
      .from(table as never)
      .update({ sort_order: index, updated_at: new Date().toISOString() } as never)
      .eq('id', id),
  )
  const results = await Promise.all(updates)
  const failed = results.find((r) => r.error)
  if (failed?.error) throw failed.error
}

export async function listSynaxariumDays() {
  const { data, error } = await db()
    .from('synaxarium_days' as never)
    .select('*')
    .order('ethiopian_month_number', { ascending: true })
    .order('ethiopian_day', { ascending: true })
  if (error) throw error
  return (data || []) as unknown as SynaxariumDayRow[]
}

export async function getSynaxariumDay(id: string) {
  const { data, error } = await db()
    .from('synaxarium_days' as never)
    .select('*')
    .eq('id', id)
    .single()
  if (error) throw error
  return data as unknown as SynaxariumDayRow
}

export async function saveSynaxariumDay(
  input: Partial<SynaxariumDayRow> & {
    ethiopian_month: string
    ethiopian_month_number: number
    ethiopian_day: number
    slug?: string
  },
  existing?: SynaxariumDayRow | null,
) {
  const slug =
    input.slug ||
    slugify(`${input.ethiopian_month}-${input.ethiopian_day}`) ||
    `day-${input.ethiopian_month_number}-${input.ethiopian_day}`
  const payload = {
    slug,
    ethiopian_month: input.ethiopian_month,
    ethiopian_month_number: input.ethiopian_month_number,
    ethiopian_day: input.ethiopian_day,
    display_date_amharic: input.display_date_amharic || null,
    display_date_english: input.display_date_english || null,
    summary: input.summary || null,
    image_path: input.image_path || null,
    image_alt: input.image_alt || null,
    status: (input.status || 'draft') as ContentStatus,
    updated_at: new Date().toISOString(),
  }
  if (existing) {
    const { data, error } = await db()
      .from('synaxarium_days' as never)
      .update(payload as never)
      .eq('id', existing.id)
      .select('*')
      .single()
    if (error) throw error
    return data as unknown as SynaxariumDayRow
  }
  const { data, error } = await db()
    .from('synaxarium_days' as never)
    .insert(payload as never)
    .select('*')
    .single()
  if (error) throw error
  return data as unknown as SynaxariumDayRow
}

export async function listCommemorations(dayId: string) {
  const { data, error } = await db()
    .from('synaxarium_commemorations' as never)
    .select('*')
    .eq('day_id', dayId)
    .order('sort_order', { ascending: true })
  if (error) throw error
  return ((data || []) as unknown as SynaxariumCommemorationRow[]).map((row) => ({
    ...row,
    keywords: parseKeywordsFromDb(row.keywords),
  }))
}

export async function saveCommemoration(
  input: Partial<SynaxariumCommemorationRow> & { title: string; day_id: string; slug?: string },
  existing?: SynaxariumCommemorationRow | null,
) {
  const base = {
    day_id: input.day_id,
    day_slug: input.day_slug || null,
    slug: (input.slug || slugify(input.title)).trim(),
    title: input.title.trim(),
    title_amharic: input.title_amharic || null,
    commemoration_type: input.commemoration_type || null,
    summary: input.summary || null,
    body_amharic: input.body_amharic || null,
    body_english: input.body_english || null,
    scripture_references: input.scripture_references || null,
    keywords: serializeKeywordsForDb(input.keywords),
    image_path: input.image_path || null,
    image_alt: input.image_alt || null,
    featured: Boolean(input.featured),
    sort_order: input.sort_order ?? 0,
    status: (input.status || 'draft') as ContentStatus,
    updated_at: new Date().toISOString(),
  }
  const withReview = {
    ...base,
    summary_amharic: input.summary_amharic || null,
    content_review_status: input.content_review_status || null,
  }

  const write = async (payload: Record<string, unknown>) => {
    if (existing) {
      const { data, error } = await db()
        .from('synaxarium_commemorations' as never)
        .update(payload as never)
        .eq('id', existing.id)
        .select('*')
        .single()
      if (error) throw error
      return data as unknown as SynaxariumCommemorationRow
    }
    const { data, error } = await db()
      .from('synaxarium_commemorations' as never)
      .insert(payload as never)
      .select('*')
      .single()
    if (error) throw error
    return data as unknown as SynaxariumCommemorationRow
  }

  try {
    return await write(withReview)
  } catch (cause) {
    const message =
      cause && typeof cause === 'object' && 'message' in cause
        ? String((cause as { message?: unknown }).message)
        : ''
    if (/summary_amharic|content_review_status|column .* does not exist/i.test(message)) {
      return write(base)
    }
    throw cause
  }
}

export async function deleteCommemoration(id: string) {
  const { error } = await db()
    .from('synaxarium_commemorations' as never)
    .delete()
    .eq('id', id)
  if (error) throw error
}

export { errorMessage, statuses, slugify }
export type { ContentStatus }
