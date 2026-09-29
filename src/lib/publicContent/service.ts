import { supabase } from '../supabase/client'
import type { ContentType, CmsTables } from '../supabase/cms.types'
import { parseYoutubeVideoId } from '../../data/utils/youtube'

/** Public mezmur library uses Supabase only when the browser client is configured. */
export const useLegacyMezmur = !supabase

export const PAGE_SIZE = 24

export type PublicTag = {
  id: string
  name: string
  slug: string
  kind: string
}

export type PublicMezmur = CmsTables['mezmur']['Row'] & {
  singer_name: string | null
  category_name: string | null
  languages: string[]
  form: 'mezmur' | 'werb'
  tags: PublicTag[]
}

export type MezmurCard = Pick<
  PublicMezmur,
  | 'id'
  | 'slug'
  | 'title'
  | 'title_amharic'
  | 'description'
  | 'thumbnail_url'
  | 'audio_url'
  | 'youtube_url'
  | 'featured'
  | 'published_at'
  | 'singer_name'
  | 'category_name'
  | 'languages'
  | 'form'
  | 'tags'
>

export type Discovery = { items: MezmurCard[]; total: number; page: number }
export type Facets = {
  singers: { id: string; name: string }[]
  categories: { id: string; name: string }[]
  occasions: { slug: string; name: string }[]
}
export type SearchResult = {
  kind: ContentType
  slug: string
  title: string
  title_amharic: string | null
  description: string | null
}

type MezmurJoinRow = CmsTables['mezmur']['Row'] & {
  singers: { id: string; name: string } | { id: string; name: string }[] | null
  categories: { id: string; name: string; slug: string } | { id: string; name: string; slug: string }[] | null
  mezmur_tags:
    | {
        tags: { id: string; name: string; slug: string; kind?: string | null } | null
      }[]
    | null
}

const CARD_SELECT = `
  id, slug, title, title_amharic, title_oromo, description,
  thumbnail_url, audio_url, youtube_url, featured, published_at, created_at, updated_at,
  status, singer_id, category_id,
  singers ( id, name ),
  categories ( id, name, slug ),
  mezmur_tags ( tags ( id, name, slug ) )
`

const DETAIL_SELECT = `
  *,
  singers ( id, name ),
  categories ( id, name, slug ),
  mezmur_tags ( tags ( id, name, slug ) )
`

export function database() {
  if (!supabase) throw new Error('The content service is not configured.')
  return supabase
}

export const pageNumber = (params: URLSearchParams) =>
  Math.min(10000, Math.max(1, Math.floor(Number(params.get('page'))) || 1))

function one<T>(value: T | T[] | null | undefined): T | null {
  if (!value) return null
  return Array.isArray(value) ? value[0] || null : value
}

function sanitizeSearch(raw: string) {
  return raw.replace(/[,().%_*\\]/g, ' ').trim().slice(0, 200)
}

export function languagesFromRow(row: {
  lyrics_amharic?: string | null
  lyrics_english?: string | null
  lyrics_oromo?: string | null
  title_amharic?: string | null
  title_oromo?: string | null
  language_codes?: string[] | null
}): string[] {
  const codes = new Set<string>()
  for (const code of row.language_codes || []) {
    if (code) codes.add(code)
  }
  if (row.lyrics_amharic?.trim() || row.title_amharic?.trim()) codes.add('am')
  if (row.lyrics_english?.trim()) codes.add('en')
  if (row.lyrics_oromo?.trim() || row.title_oromo?.trim()) codes.add('om')
  return [...codes]
}

function tagsFromRow(row: MezmurJoinRow): PublicTag[] {
  const tags: PublicTag[] = []
  for (const link of row.mezmur_tags || []) {
    const tag = link?.tags
    if (!tag?.id) continue
    const kind =
      tag.kind ||
      (tag.slug.startsWith('occasion-')
        ? 'occasion'
        : tag.slug.startsWith('form-')
          ? 'form'
          : tag.slug.startsWith('language-')
            ? 'language'
            : 'topic')
    tags.push({ id: tag.id, name: tag.name, slug: tag.slug, kind })
  }
  return tags.sort((a, b) => a.name.localeCompare(b.name))
}

function formFromTags(tags: PublicTag[]): 'mezmur' | 'werb' {
  if (tags.some((tag) => tag.slug === 'form-werb')) return 'werb'
  return 'mezmur'
}

function mapCard(row: MezmurJoinRow): MezmurCard {
  const singer = one(row.singers)
  const category = one(row.categories)
  const tags = tagsFromRow(row)
  return {
    id: row.id,
    slug: row.slug,
    title: row.title,
    title_amharic: row.title_amharic,
    description: row.description,
    thumbnail_url: row.thumbnail_url,
    audio_url: row.audio_url,
    youtube_url: row.youtube_url,
    featured: row.featured,
    published_at: row.published_at,
    singer_name: singer?.name || null,
    category_name: category?.name || null,
    languages: languagesFromRow(row),
    form: formFromTags(tags),
    tags,
  }
}

function mapDetail(row: MezmurJoinRow): PublicMezmur {
  const card = mapCard(row)
  return {
    ...row,
    singer_name: card.singer_name,
    category_name: card.category_name,
    languages: card.languages,
    form: card.form,
    tags: card.tags,
  }
}

function logDevError(context: string, error: { code?: string; message?: string; details?: string; hint?: string }) {
  if (import.meta.env.DEV) {
    console.error(`[public mezmur] ${context}`, {
      code: error.code,
      message: error.message,
      details: error.details,
      hint: error.hint,
    })
  }
}

async function discoverViaTable(params: URLSearchParams): Promise<Discovery> {
  const page = pageNumber(params)
  const q = sanitizeSearch(params.get('q') || '')
  const language = (params.get('language') || '').trim()
  const singer = (params.get('singer') || '').trim()
  const category = (params.get('category') || '').trim()
  const occasion = (params.get('occasion') || '').trim()
  const form = (params.get('form') || '').trim()
  const featuredOnly = params.get('featured') === 'yes'
  const sort = params.get('sort') || 'recent'

  let query = database()
    .from('mezmur')
    .select(CARD_SELECT, { count: 'exact' })
    .eq('status', 'published')

  if (featuredOnly) query = query.eq('featured', true)
  if (singer) query = query.eq('singer_id', singer)
  if (category) query = query.eq('category_id', category)

  if (language === 'am') {
    query = query.or('lyrics_amharic.not.is.null,title_amharic.not.is.null')
  } else if (language === 'en') {
    query = query.not('lyrics_english', 'is', null)
  } else if (language === 'om') {
    query = query.or('lyrics_oromo.not.is.null,title_oromo.not.is.null')
  }

  if (q) {
    query = query.or(
      [
        `title.ilike.%${q}%`,
        `title_amharic.ilike.%${q}%`,
        `title_oromo.ilike.%${q}%`,
        `lyrics_amharic.ilike.%${q}%`,
        `lyrics_english.ilike.%${q}%`,
        `lyrics_oromo.ilike.%${q}%`,
        `transliteration.ilike.%${q}%`,
        `description.ilike.%${q}%`,
      ].join(','),
    )
  }

  if (occasion) {
    query = query.filter('mezmur_tags.tags.slug', 'eq', occasion)
  }

  if (form === 'werb') {
    query = query.filter('mezmur_tags.tags.slug', 'eq', 'form-werb')
  } else if (form === 'mezmur') {
    // Prefer explicit form-mezmur tags; when tags are absent, rows still appear (no exclude).
    // PostgREST cannot easily say "missing tag OR has form-mezmur", so show all non-werb
    // by excluding form-werb via a not-in subquery is not available — filter client-side after fetch
    // only when we have form tags in the page. For server-side, leave unfiltered and post-filter.
  }

  if (sort === 'alphabetical' || sort === 'title') {
    query = query.order('title', { ascending: true }).order('id')
  } else if (sort === 'published') {
    query = query.order('published_at', { ascending: false, nullsFirst: false }).order('id')
  } else {
    query = query.order('created_at', { ascending: false, nullsFirst: false }).order('id')
  }

  const from = (page - 1) * PAGE_SIZE
  const { data, error, count } = await query.range(from, from + PAGE_SIZE - 1)
  if (error) {
    logDevError('discover table', error)
    throw error
  }

  let items = ((data || []) as unknown as MezmurJoinRow[]).map(mapCard)

  // Singer name search (when q matched title/lyrics only, expand with a second pass is heavy;
  // include singer filter via separate query when q looks like a singer and no title hits — skip for now.

  if (form === 'mezmur') {
    items = items.filter((item) => item.form !== 'werb')
  } else if (form === 'werb') {
    items = items.filter((item) => item.form === 'werb')
  }

  return { items, total: count || 0, page }
}

export async function discover(params: URLSearchParams): Promise<Discovery> {
  // Table path supports `form` and works without undeployed RPCs.
  // Prefer table queries so CMS edits appear after refresh without depending on missing functions.
  return discoverViaTable(params)
}

async function facetsViaTable(): Promise<Facets> {
  const db = database()
  const [singersRes, categoriesRes, tagsRes] = await Promise.all([
    db.from('singers').select('id,name').order('name').limit(500),
    db.from('categories').select('id,name').eq('type', 'mezmur').order('name').limit(500),
    db.from('tags').select('id,name,slug').order('name').limit(500),
  ])
  if (singersRes.error) {
    logDevError('facets singers', singersRes.error)
    throw singersRes.error
  }
  if (categoriesRes.error) {
    logDevError('facets categories', categoriesRes.error)
    throw categoriesRes.error
  }
  if (tagsRes.error) {
    logDevError('facets tags', tagsRes.error)
    throw tagsRes.error
  }

  const occasions = (tagsRes.data || [])
    .filter((tag) => tag.slug.startsWith('occasion-'))
    .map((tag) => ({ slug: tag.slug, name: tag.name }))

  return {
    singers: singersRes.data || [],
    categories: categoriesRes.data || [],
    occasions,
  }
}

export async function facets(): Promise<Facets> {
  const { data, error } = await database().rpc('public_discovery_facets', {})
  if (!error) return data as unknown as Facets
  if (error.code !== 'PGRST202' && !/could not find the function/i.test(error.message || '')) {
    logDevError('public_discovery_facets', error)
    throw error
  }
  return facetsViaTable()
}

export async function detail(slug: string): Promise<PublicMezmur | null> {
  const normalized = slug.trim()
  if (!normalized) return null

  const { data: rpcData, error: rpcError } = await database().rpc('public_mezmur_detail', {
    slug_or_alias: normalized,
  })
  if (!rpcError) return rpcData as unknown as PublicMezmur | null
  if (rpcError.code !== 'PGRST202' && !/could not find the function/i.test(rpcError.message || '')) {
    logDevError('public_mezmur_detail', rpcError)
    throw rpcError
  }

  const { data, error } = await database()
    .from('mezmur')
    .select(DETAIL_SELECT)
    .eq('slug', normalized)
    .eq('status', 'published')
    .maybeSingle()
  if (error) {
    logDevError('detail table', error)
    throw error
  }
  if (!data) return null
  return mapDetail(data as unknown as MezmurJoinRow)
}

export async function searchSite(
  query: string,
  page = 1,
): Promise<{ items: SearchResult[]; total: number }> {
  const q = sanitizeSearch(query)
  if (q.length < 2) return { items: [], total: 0 }

  const { data, error } = await database().rpc('search_public_content', {
    q: q.slice(0, 200),
    page_number: page,
  })
  if (!error) return data as unknown as { items: SearchResult[]; total: number }
  if (error.code !== 'PGRST202' && !/could not find the function/i.test(error.message || '')) {
    logDevError('search_public_content', error)
    throw error
  }

  const from = (Math.max(1, page) - 1) * PAGE_SIZE
  const { data: rows, error: tableError, count } = await database()
    .from('mezmur')
    .select('slug,title,title_amharic,description', { count: 'exact' })
    .eq('status', 'published')
    .or(
      [
        `title.ilike.%${q}%`,
        `title_amharic.ilike.%${q}%`,
        `lyrics_amharic.ilike.%${q}%`,
        `lyrics_english.ilike.%${q}%`,
        `transliteration.ilike.%${q}%`,
      ].join(','),
    )
    .order('published_at', { ascending: false, nullsFirst: false })
    .range(from, from + PAGE_SIZE - 1)
  if (tableError) {
    logDevError('searchSite table', tableError)
    throw tableError
  }
  return {
    items: (rows || []).map((row) => ({
      kind: 'mezmur' as const,
      slug: row.slug,
      title: row.title,
      title_amharic: row.title_amharic,
      description: row.description,
    })),
    total: count || 0,
  }
}

export async function readContent(
  kind: Exclude<ContentType, 'mezmur'>,
  slug: string,
) {
  const { data, error } = await database()
    .from(kind)
    .select('*')
    .eq('slug', slug)
    .eq('status', 'published')
    .maybeSingle()
  if (error) throw error
  return data
}

export async function publicMedia(reference: string | null | undefined) {
  if (!reference) return ''
  if (reference.startsWith('storage://')) {
    const [bucket, ...path] = reference.slice(10).split('/')
    if (
      ![
        'mezmur-images',
        'mezmur-audio',
        'saints',
        'feasts',
        'articles',
        'general-media',
      ].includes(bucket)
    )
      throw new Error('Unsupported media.')
    const { data, error } = await database()
      .storage.from(bucket)
      .createSignedUrl(path.join('/'), 3600)
    if (error) throw error
    return data.signedUrl
  }
  const url = new URL(reference)
  if (url.protocol !== 'https:') throw new Error('Unsupported media URL.')
  return url.href
}

/** Map a public mezmur row into the practice player payload shape. */
export function publicMezmurToPracticePayload(item: PublicMezmur) {
  const videoId = parseYoutubeVideoId(item.youtube_url || '')
  const lyricsGez =
    item.lyrics_amharic?.trim() ||
    item.lyrics_english?.trim() ||
    item.lyrics_oromo?.trim() ||
    ''
  return {
    form: item.form,
    entryId: item.id,
    title: item.title,
    transliterationTitle: item.title,
    lyricsGez,
    transliterationLyrics: item.transliteration?.trim() || '',
    videoId,
    audioUrl: item.audio_url?.trim() || undefined,
    watchUrl: videoId ? `https://www.youtube.com/watch?v=${videoId}` : undefined,
    learning: {
      meaning: item.description?.trim() || undefined,
      categoryLabel: item.category_name || undefined,
      themesLine: item.tags
        .filter((tag) => tag.kind === 'topic')
        .map((tag) => tag.name)
        .join(', ') || undefined,
    },
  }
}
