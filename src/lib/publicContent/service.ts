import { supabase } from '../supabase/client'
import type { ContentType, CmsTables } from '../supabase/cms.types'
import { parseYoutubeVideoId } from '../../data/utils/youtube'
import {
  classificationLabel,
  normalizeLanguageParam,
} from './labels'
import {
  categoryOptions,
  displayClassification,
  occasionOptions,
} from './taxonomy'
import {
  loadMezmurSearchCatalog,
  searchMezmurCatalog,
} from './mezmurSearch'

/** Public mezmur library uses Supabase only when the browser client is configured. */
export const useLegacyMezmur = !supabase

export const PAGE_SIZE = 24

export type PublicTag = {
  id: string
  name: string
  slug: string
  kind: string
}

export type ClassificationFields = {
  language: string | null
  form: 'mezmur' | 'werb' | null
  category: string | null
  occasion: string | null
  occasion_tags: string[]
  saint_or_angel: string | null
  saint_tags: string[]
  themes: string[]
  search_keywords: string[]
  source: string | null
}

export type PublicMezmur = CmsTables['mezmur']['Row'] &
  ClassificationFields & {
    singer_name: string | null
    category_name: string | null
    languages: string[]
    tags: PublicTag[]
  }

export type MezmurCard = Pick<
  PublicMezmur,
  | 'id'
  | 'slug'
  | 'title'
  | 'title_amharic'
  | 'thumbnail_url'
  | 'audio_url'
  | 'youtube_url'
  | 'featured'
  | 'published_at'
  | 'created_at'
  | 'singer_name'
  | 'category_name'
  | 'languages'
  | 'form'
  | 'language'
  | 'category'
  | 'occasion'
  | 'saint_or_angel'
  | 'themes'
>

export type Discovery = {
  items: MezmurCard[]
  total: number
  page: number
  hasStrongMatch?: boolean
  closest?: MezmurCard[]
  suggestions?: MezmurCard[]
}
export type Facets = {
  singers: { id: string; name: string }[]
  categories: { id: string; name: string; value: string }[]
  occasions: { slug: string; name: string }[]
  saints: { slug: string; name: string }[]
  themes: { slug: string; name: string }[]
}
export type SearchResult = {
  kind: ContentType
  slug: string
  title: string
  title_amharic: string | null
  description: string | null
}

export function database() {
  if (!supabase) throw new Error('The content service is not configured.')
  return supabase
}

export const pageNumber = (params: URLSearchParams) =>
  Math.min(10000, Math.max(1, Math.floor(Number(params.get('page'))) || 1))

function sanitizeSearch(raw: string) {
  return raw.replace(/[,().%_*\\]/g, ' ').trim().slice(0, 200)
}

/** Preserve human taxonomy strings (spaces, slashes); strip PostgREST-hostile chars. */
function sanitizeClassificationFilter(value: string) {
  return value
    .trim()
    .replace(/[,().*\\]/g, ' ')
    .replace(/\s+/g, ' ')
    .slice(0, 120)
}

function sanitizeFilterToken(value: string) {
  return value.trim().toLowerCase().replace(/[^a-z0-9_-]+/g, '-').replace(/^-+|-+$/g, '')
}

function logDevError(
  context: string,
  error: { code?: string; message?: string; details?: string; hint?: string },
) {
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
  const language = normalizeLanguageParam(params.get('language') || '')
  const categoryRaw = sanitizeClassificationFilter(params.get('category') || '')
  const occasionRaw = sanitizeClassificationFilter(params.get('occasion') || '')
  const form = sanitizeFilterToken(params.get('form') || '')
  const featuredOnly = params.get('featured') === 'yes'
  const sort = params.get('sort') || 'recent'

  // Always load lightweight published metadata once, then filter/fuzzy in the browser.
  // Live `search_keywords` / tag columns are TEXT (not text[]) — never use PostgREST cs/@>.
  try {
    const catalog = await loadMezmurSearchCatalog()
    const result = searchMezmurCatalog(catalog, q, {
      language,
      form,
      category: categoryRaw,
      occasion: occasionRaw,
      featuredOnly,
      sort,
      page,
      pageSize: PAGE_SIZE,
      suggestionLimit: 6,
    })
    return {
      items: result.items,
      total: result.total,
      page: result.page,
      hasStrongMatch: q ? result.hasStrongMatch : true,
      closest: q ? result.closest : [],
      suggestions: result.suggestions,
    }
  } catch (error) {
    const err = error as { code?: string; message?: string; details?: string; hint?: string }
    logDevError('discover table', err)
    throw error
  }
}

export async function discover(params: URLSearchParams): Promise<Discovery> {
  return discoverViaTable(params)
}

async function facetsViaTable(): Promise<Facets> {
  // Prefer canonical taxonomy for public filters (stable labels, no NA, no duplicates).
  const categories = categoryOptions().map((item) => ({
    id: item.value,
    name: item.label,
    value: item.value,
  }))
  const occasions = occasionOptions().map((item) => ({
    slug: item.value,
    name: item.label,
  }))
  return { singers: [], categories, occasions, saints: [], themes: [] }
}

export async function facets(): Promise<Facets> {
  return facetsViaTable()
}

export async function detail(slug: string): Promise<PublicMezmur | null> {
  const normalized = slug.trim()
  if (!normalized) return null

  // Hymns Practice SoT: mezmur_data_import only (do not query public.mezmur).
  try {
    const { getMezmurBySlug } = await import('./hymnBrowse')
    const imported = await getMezmurBySlug(normalized)
    if (imported) {
      const form =
        imported.form === 'werb' || imported.form === 'wereb'
          ? 'werb'
          : imported.form === 'mezmur'
            ? 'mezmur'
            : null
      return {
        id: imported.id,
        slug: imported.slug,
        title: imported.title,
        title_amharic: imported.title_amharic,
        title_oromo: null,
        description: imported.description,
        lyrics_amharic: imported.lyrics_amharic,
        transliteration: imported.lyrics_transliteration,
        lyrics_english: imported.lyrics_english,
        lyrics_geez: imported.lyrics_geez,
        lyrics_oromo: imported.lyrics_oromo,
        youtube_url: imported.youtube_url,
        audio_url: imported.audio_url,
        thumbnail_url: imported.thumbnail_url,
        thumbnail_path: imported.image_path,
        image_alt: imported.image_alt,
        status: (imported.status as PublicMezmur['status']) || 'published',
        featured: false,
        published_at: null,
        created_at: '',
        updated_at: '',
        created_by: null,
        updated_by: null,
        singer_id: imported.singer_id,
        category_id: null,
        language: imported.language,
        form,
        category: null,
        occasion: imported.occasion_slugs[0] || null,
        occasion_tags: imported.occasion_slugs,
        saint_or_angel: null,
        saint_tags: [],
        themes: [],
        search_keywords: imported.search_keywords,
        source: null,
        singer_name: imported.singer_name,
        category_name: null,
        languages: imported.language ? [imported.language] : [],
        tags: [],
      } as unknown as PublicMezmur
    }
  } catch (cause) {
    logDevError('detail import', cause as { message?: string; code?: string })
    throw cause instanceof Error ? cause : new Error('Unable to load hymn.')
  }

  return null
}

export async function searchSite(
  query: string,
  page = 1,
): Promise<{ items: SearchResult[]; total: number }> {
  const params = new URLSearchParams({
    q: query,
    page: String(page),
    sort: 'published',
  })
  const result = await discover(params)
  return {
    items: result.items.map((item) => ({
      kind: 'mezmur' as const,
      slug: item.slug,
      title: item.title,
      title_amharic: item.title_amharic,
      description: null,
    })),
    total: result.total,
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
  const trimmed = reference.trim()
  if (!trimmed) return ''

  // Absolute URLs and bare content-media paths
  if (/^https?:\/\//i.test(trimmed) || !trimmed.startsWith('storage://')) {
    try {
      const { resolveContentMediaUrl } = await import('../cms/contentMedia')
      const resolved = resolveContentMediaUrl(trimmed)
      if (resolved) return resolved
    } catch {
      /* fall through */
    }
  }

  if (trimmed.startsWith('storage://')) {
    const [bucket, ...path] = trimmed.slice(10).split('/')
    if (bucket === 'content-media') {
      const { resolveContentMediaUrl } = await import('../cms/contentMedia')
      return resolveContentMediaUrl(trimmed)
    }
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
  const url = new URL(trimmed)
  if (url.protocol !== 'https:') throw new Error('Unsupported media URL.')
  return url.href
}

export function publicMezmurToPracticePayload(item: PublicMezmur, youtubeUrl?: string | null) {
  const activeUrl = youtubeUrl || item.youtube_url || ''
  const videoId = parseYoutubeVideoId(activeUrl)
  const lyricsGez = item.lyrics_amharic?.trim() || ''
  return {
    form: item.form || 'mezmur',
    entryId: item.id,
    title: item.title,
    transliterationTitle: item.title,
    titleAmharic: item.title_amharic?.trim() || undefined,
    lyricsGez,
    transliterationLyrics: item.transliteration?.trim() || '',
    lyricsEnglish: item.lyrics_english?.trim() || undefined,
    singerName: item.singer_name?.trim() || undefined,
    videoId,
    audioUrl: item.audio_url?.trim() || undefined,
    watchUrl: activeUrl.trim() || (videoId ? `https://www.youtube.com/watch?v=${videoId}` : undefined),
    learning: {
      meaning: item.description?.trim() || undefined,
      categoryLabel: displayClassification(item.category_name || item.category) || undefined,
      themesLine:
        item.themes
          ?.map(classificationLabel)
          .filter(Boolean)
          .join(', ') || undefined,
    },
  }
}

export { classificationLabel, normalizeLanguageParam }
