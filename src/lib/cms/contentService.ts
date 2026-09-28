import { db } from './mezmurService'
import type { ContentStatus, ContentType } from '../supabase/cms.types'
import type { Json } from '../supabase/database.types'
export const contentKinds = ['saints', 'feasts', 'prayers', 'articles'] as const
export type EditorialKind = (typeof contentKinds)[number]
export const contentPath = (kind: string, slug: string) =>
  kind === 'mezmur' ? `/practice/mezmur/${slug}` : `/content/${kind}/${slug}`
export const teachingCategories = [
  'Church teaching',
  'Saints',
  'Feasts',
  'Bible study',
  'Church history',
  'The Seven Mysteries',
]
export type Related = { type: ContentType; id: string; title?: string }
export type EditorialContent = {
  id: string
  slug: string
  title: string
  title_amharic: string | null
  title_oromo: string | null
  description: string | null
  body: string | null
  body_amharic: string | null
  body_oromo: string | null
  thumbnail_url: string | null
  audio_url: string | null
  date_notes: string | null
  related_content: Related[]
  status: ContentStatus
  created_by: string | null
  updated_at: string
  published_at: string | null
  commemoration_month?: number | null
  commemoration_day?: number | null
  ethiopian_month?: number | null
  ethiopian_day?: number | null
  is_movable?: boolean
  fasting_info?: string | null
  teaching_category?: string | null
  transliteration?: string | null
}
export function emptyContent(): EditorialContent {
  return {
    id: crypto.randomUUID(),
    slug: '',
    title: '',
    title_amharic: '',
    title_oromo: '',
    description: '',
    body: '',
    body_amharic: '',
    body_oromo: '',
    thumbnail_url: '',
    audio_url: '',
    date_notes: '',
    related_content: [],
    status: 'draft',
    created_by: null,
    updated_at: '',
    published_at: null,
    is_movable: false,
    commemoration_month: null,
    commemoration_day: null,
    ethiopian_month: null,
    ethiopian_day: null,
    fasting_info: '',
    teaching_category: null,
    transliteration: '',
  }
}
export async function getContent(kind: EditorialKind, id: string) {
  const { data, error } = await db()
    .from(kind)
    .select('*')
    .eq('id', id)
    .single()
  if (error) throw error
  return data as unknown as EditorialContent
}
export async function listContent(
  kind: EditorialKind,
  q = '',
  status = '',
  page = 1,
  category = '',
) {
  let query = db()
    .from(kind)
    .select(
      'id,slug,title,title_amharic,status,updated_at,thumbnail_url,description',
      { count: 'exact' },
    )
  const text = q
    .replace(/[,().%_*\\]/g, ' ')
    .slice(0, 200)
    .trim()
  if (text)
    query = query.or(`title.ilike.%${text}%,title_amharic.ilike.%${text}%`)
  if (status) query = query.eq('status', status as ContentStatus)
  if (category && kind === 'articles')
    query = query.filter('teaching_category', 'eq', category)
  const { data, error, count } = await query
    .order('updated_at', { ascending: false })
    .order('id')
    .range((page - 1) * 24, page * 24 - 1)
  if (error) throw error
  return { items: data, total: count || 0 }
}
export async function saveContent(
  kind: EditorialKind,
  input: EditorialContent,
  existing?: EditorialContent,
) {
  const { data, error } = await db().rpc('save_cms_content', {
    content_kind: kind,
    payload: input as unknown as Json,
    expected_updated_at: existing?.updated_at || null,
  })
  if (error) throw error
  return data as unknown as EditorialContent
}
export async function contentHistory(kind: EditorialKind, id: string) {
  const [versions, authors] = await Promise.all([
    db()
      .from('content_versions')
      .select('*')
      .eq('content_type', kind)
      .eq('content_id', id)
      .order('created_at', { ascending: false })
      .limit(50),
    db().rpc('cms_version_authors', {}),
  ])
  if (versions.error) throw versions.error
  if (authors.error) throw authors.error
  return { versions: versions.data, authors: authors.data }
}
export async function lookupContent(kind: ContentType, q = '') {
  let query = db().from(kind).select('id,title,slug').eq('status', 'published')
  if (q)
    query = query.ilike(
      'title',
      '%' + q.replace(/[%_]/g, '').slice(0, 100) + '%',
    )
  const { data, error } = await query.order('title').limit(50)
  if (error) throw error
  return data
}
export async function publicRelations(relations: Related[]) {
  return (
    await Promise.all(
      (['mezmur', ...contentKinds] as const).map(async (kind) => {
        const ids = relations
          .filter((r) => r.type === kind)
          .slice(0, 30)
          .map((r) => r.id)
        if (!ids.length) return []
        const { data, error } = await db()
          .from(kind)
          .select('id,title,slug')
          .in('id', ids)
          .eq('status', 'published')
          .limit(30)
        if (error) throw error
        return data.map((row) => ({ ...row, type: kind }))
      }),
    )
  ).flat()
}
