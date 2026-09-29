import { supabase } from '../supabase/client'
import type { CmsTables, ContentStatus } from '../supabase/cms.types'
import type { Json } from '../supabase/database.types'

export type Mezmur = CmsTables['mezmur']['Row']
export type Version = CmsTables['content_versions']['Row']
export type Category = CmsTables['categories']['Row']
export type Singer = CmsTables['singers']['Row']
export type Tag = CmsTables['tags']['Row']
export const statuses: ContentStatus[] = ['draft', 'pending_review', 'published', 'rejected', 'archived']
export function db() {
  if (!supabase) throw new Error('Supabase is not configured.')
  return supabase
}
export function errorMessage(error: unknown) {
  if (typeof error === 'object' && error && 'code' in error) {
    const code = String((error as { code?: unknown }).code || '')
    const message = 'message' in error ? String((error as { message?: unknown }).message || '') : ''
    const details = 'details' in error ? String((error as { details?: unknown }).details || '') : ''
    const hint = 'hint' in error ? String((error as { hint?: unknown }).hint || '') : ''
    if (code === 'PGRST116') return 'This item was not found, or you do not have permission to view it.'
    if (code === '23505') return 'This slug already exists. Choose a unique slug.'
    if (code === '23503') return 'This item is in use, or a selected category, singer, or tag no longer exists. Archive used items instead.'
    if (code === '42501') return 'You do not have permission to make this change. Your role or the content status may have changed.'
    if (code === '42703' || /column .* does not exist/i.test(message)) {
      return import.meta.env.DEV
        ? `Database column mismatch: ${message}`
        : 'This form asked for a field that is not in the database yet.'
    }
    if (code === 'PGRST202') {
      return import.meta.env.DEV
        ? `Missing database function: ${message}${hint ? ` (${hint})` : ''}`
        : 'A required database function is unavailable. Try again later or contact an administrator.'
    }
    if (import.meta.env.DEV && (message || details || hint)) {
      return [message, details, hint].filter(Boolean).join(' — ')
    }
    if (message && !/stack|exception|sqlstate/i.test(message)) return message
  }
  return error && typeof error === 'object' && 'message' in error
    ? String((error as { message?: unknown }).message)
    : 'Something went wrong. Please try again.'
}
export function slugify(text: string) {
  return text.normalize('NFKD').toLowerCase().replace(/[^a-z0-9]+/g, '-').replace(/^-|-$/g, '')
}
export function label(status: string) { return status.replaceAll('_', ' ') }
export const editableKeys = ['title', 'title_amharic', 'title_oromo', 'slug', 'description', 'singer_id', 'category_id', 'lyrics_amharic', 'lyrics_english', 'lyrics_oromo', 'transliteration', 'youtube_url', 'audio_url', 'thumbnail_url', 'thumbnail_path', 'image_alt', 'featured', 'status'] as const
export type MezmurInput = Pick<Mezmur, typeof editableKeys[number]>
export function editable(row: Mezmur): MezmurInput {
  return Object.fromEntries(editableKeys.map(key => [key, row[key as keyof Mezmur] ?? null])) as MezmurInput
}
export function emptyMezmur(): MezmurInput {
  return { title: '', title_amharic: '', title_oromo: '', slug: '', description: '', singer_id: null, category_id: null, lyrics_amharic: '', lyrics_english: '', lyrics_oromo: '', transliteration: '', youtube_url: '', audio_url: '', thumbnail_url: '', thumbnail_path: '', image_alt: '', featured: false, status: 'draft' }
}
export const PAGE_SIZE = 20
export type Filters = { search?: string; status?: string; category?: string; singer?: string; featured?: string; sort?: string; page?: number }
export async function listMezmur(filters: Filters = {}) {
  let query = db().from('mezmur').select('*', { count: 'exact' })
  // Remove PostgREST filter syntax; allow Unicode searches without injecting expressions.
  const search = filters.search?.replace(/[,().%_*\\]/g, ' ').trim()
  if (search) query = query.or(`title.ilike.%${search}%,title_amharic.ilike.%${search}%,title_oromo.ilike.%${search}%`)
  if (statuses.includes(filters.status as ContentStatus)) query = query.eq('status', filters.status as ContentStatus)
  if (filters.category) query = query.eq('category_id', filters.category)
  if (filters.singer) query = query.eq('singer_id', filters.singer)
  if (filters.featured === 'yes' || filters.featured === 'no') query = query.eq('featured', filters.featured === 'yes')
  const sorts = { updated: ['updated_at', false], oldest: ['updated_at', true], title: ['title', true], published: ['published_at', false] } as const
  const [column, ascending] = sorts[filters.sort as keyof typeof sorts] || sorts.updated
  const page = Math.max(1, filters.page || 1)
  const { data, error, count } = await query.order(column, { ascending, nullsFirst: false }).order('id').range((page - 1) * PAGE_SIZE, page * PAGE_SIZE - 1)
  if (error) throw error
  return { rows: data, count: count || 0 }
}
// Always explicitly filter published, even when called from an authenticated browser.
export async function getPublishedMezmur(slug: string) {
  const { data, error } = await db().from('mezmur').select('*').eq('slug', slug).eq('status', 'published').maybeSingle()
  if (error) throw error
  return data
}
export async function listPublishedMezmur(page = 1) { return listMezmur({ status: 'published', sort: 'published', page }) }
export async function getMezmur(id: string) {
  const { data, error } = await db().from('mezmur').select('*').eq('id', id).single()
  if (error) throw error
  return data
}
async function allRows<T>(fetchPage: (offset: number) => PromiseLike<{ data: T[] | null; error: unknown }>) {
  const rows: T[] = []
  for (let offset = 0; ; offset += 500) {
    const { data, error } = await fetchPage(offset)
    if (error) throw error
    rows.push(...(data || []))
    if (!data || data.length < 500) return rows
  }
}
export async function getTaxonomy() {
  const [categories, singers, tags] = await Promise.all([
    allRows<Category>(n => db().from('categories').select('*').order('name').order('id').range(n, n + 499)),
    allRows<Singer>(n => db().from('singers').select('*').order('name').order('id').range(n, n + 499)),
    allRows<Tag>(n => db().from('tags').select('*').order('name').order('id').range(n, n + 499)),
  ])
  return { categories, singers, tags }
}
export async function getTagIds(id: string) {
  const { data, error } = await db().from('mezmur_tags').select('tag_id').eq('mezmur_id', id)
  if (error) throw error
  return data.map(row => row.tag_id)
}
export async function saveMezmur(input: MezmurInput, tags: string[], existing?: Mezmur, id = existing?.id || crypto.randomUUID()) {
  const payload = { ...input, id, title: input.title.trim(), slug: input.slug.trim() }
  const { data, error } = await db().rpc('save_mezmur', { payload: payload as Json, tag_ids: tags, expected_updated_at: existing?.updated_at || null }).single()
  if (error) throw error
  if (!data) throw new Error('No saved record was returned.')
  return data
}
export async function duplicateMezmur(row: Mezmur) {
  const tags = await getTagIds(row.id)
  return saveMezmur({ ...editable(row), title: `${row.title} (copy)`, slug: `${row.slug}-copy-${crypto.randomUUID().slice(0, 8)}`, status: 'draft', featured: false, audio_url: null, thumbnail_url: null }, tags)
}
export async function deleteMezmur(row: Mezmur) {
  const { data, error } = await db().from('mezmur').delete().eq('id', row.id).eq('updated_at', row.updated_at).select('id')
  if (error) throw error
  if (!data.length) throw new Error('Content changed or you no longer have permission. Refresh the list.')
}
export async function getVersions(id: string) {
  const versions = await db()
    .from('content_versions')
    .select('*')
    .eq('content_type', 'mezmur')
    .eq('content_id', id)
    .order('created_at', { ascending: false })
    .order('id', { ascending: false })
    .limit(50)
  if (versions.error) throw versions.error

  const authorIds = [
    ...new Set(
      (versions.data || [])
        .map((row) => row.changed_by)
        .filter((value): value is string => typeof value === 'string' && value.length > 0),
    ),
  ]
  let authors: { id: string; display_name: string }[] = []
  if (authorIds.length) {
    const { data, error } = await db()
      .from('profiles')
      .select('id,display_name')
      .in('id', authorIds)
    if (error) throw error
    authors = (data || []).map((row) => ({
      id: row.id,
      display_name: row.display_name || 'CMS member',
    }))
  }
  return { versions: versions.data, authors }
}
export function parseVersion(version: Version): { input: MezmurInput; tags: string[] | null } | null {
  const snapshot = version.snapshot
  if (!snapshot || typeof snapshot !== 'object' || Array.isArray(snapshot)) return null
  const record = snapshot.record
  if (!record || typeof record !== 'object' || Array.isArray(record) || typeof record.title !== 'string' || typeof record.slug !== 'string') return null
  const input = emptyMezmur()
  for (const key of editableKeys) {
    if (key === 'featured') input.featured = record.featured === true
    else if (key === 'status') input.status = statuses.includes(record.status as ContentStatus) ? record.status as ContentStatus : 'draft'
    else if (typeof record[key] === 'string' || record[key] === null) input[key] = record[key] as string
  }
  return { input, tags: Array.isArray(snapshot.tag_ids) ? snapshot.tag_ids.filter((id): id is string => typeof id === 'string') : null }
}

export async function getDashboard() {
  const types = ['mezmur', 'saints', 'feasts', 'prayers', 'articles'] as const
  const counts = await Promise.all([
    db().from('mezmur').select('id', { count: 'exact', head: true }),
    ...(['published', 'draft', 'pending_review'] as const).map(status => db().from('mezmur').select('id', { count: 'exact', head: true }).eq('status', status)),
    db().from('saints').select('id', { count: 'exact', head: true }),
    db().from('articles').select('id', { count: 'exact', head: true }),
  ])
  for (const result of counts) if (result.error) throw result.error
  async function recent(mode: 'edited' | 'published' | 'review') {
    const rows = await Promise.all(types.map(async type => {
      let query = db().from(type).select('id,title,status,updated_at,published_at')
      if (mode === 'published') query = query.eq('status', 'published')
      if (mode === 'review') query = query.eq('status', 'pending_review')
      const { data, error } = await query.order(mode === 'published' ? 'published_at' : 'updated_at', { ascending: mode === 'review' }).limit(5)
      if (error) throw error
      return data.map(row => ({ ...row, type }))
    }))
    return rows.flat().sort((a, b) => {
      const key = mode === 'published' ? 'published_at' : 'updated_at'
      return mode === 'review' ? (a[key] || '').localeCompare(b[key] || '') : (b[key] || '').localeCompare(a[key] || '')
    }).slice(0, 5)
  }
  const [edited, published, review] = await Promise.all([recent('edited'), recent('published'), recent('review')])
  return { counts: counts.map(result => result.count || 0), edited, published, review }
}
