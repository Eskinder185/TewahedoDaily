import { supabase } from '../supabase/client'
import type { ContentType, CmsTables } from '../supabase/cms.types'
import { parseYoutubeVideoId } from '../../data/utils/youtube'
import {
  classificationLabel,
  languageCodeFromNormalized,
  normalizeLanguageParam,
} from './labels'
import {
  canonicalizeCategory,
  canonicalizeOccasion,
  categoryMatchValues,
  categoryOptions,
  displayClassification,
  isNaClassification,
  occasionMatchValues,
  occasionOptions,
} from './taxonomy'

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

export type Discovery = { items: MezmurCard[]; total: number; page: number }
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

type MezmurJoinRow = CmsTables['mezmur']['Row'] &
  Partial<ClassificationFields> & {
    singers: { id: string; name: string } | { id: string; name: string }[] | null
    categories:
      | { id: string; name: string; slug: string }
      | { id: string; name: string; slug: string }[]
      | null
    mezmur_tags:
      | {
          tags: { id: string; name: string; slug: string; kind?: string | null } | null
        }[]
      | null
  }

const CARD_BASE = `
  id, slug, title, title_amharic, thumbnail_url, thumbnail_path, image_alt, audio_url, youtube_url,
  featured, published_at, created_at, singer_id, category_id,
  singers ( id, name ),
  categories ( id, name, slug )
`

const CARD_CLASSIFIED = `
  ${CARD_BASE},
  language, form, category, occasion, saint_or_angel, themes
`

const DETAIL_BASE = `
  *,
  singers ( id, name ),
  categories ( id, name, slug ),
  mezmur_tags ( tags ( id, name, slug ) )
`

let classificationEnabled: boolean | null = null

async function hasClassificationColumns(): Promise<boolean> {
  if (classificationEnabled !== null) return classificationEnabled
  if (!supabase) {
    classificationEnabled = false
    return false
  }
  const { error } = await supabase
    .from('mezmur')
    .select('language,form,category,occasion,saint_or_angel,themes,search_keywords')
    .eq('status', 'published')
    .limit(1)
  if (error && (error.code === '42703' || /column .* does not exist/i.test(error.message || ''))) {
    classificationEnabled = false
    return false
  }
  if (error) {
    // Other errors (RLS etc.) — assume columns may exist; prefer classified select and fall back per query.
    classificationEnabled = true
    return true
  }
  classificationEnabled = true
  return true
}

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

function asStringArray(value: unknown): string[] {
  return Array.isArray(value)
    ? value.filter((item): item is string => typeof item === 'string' && item.trim().length > 0)
    : []
}

export function languagesFromRow(row: {
  language?: string | null
  lyrics_amharic?: string | null
  lyrics_english?: string | null
  lyrics_oromo?: string | null
  title_amharic?: string | null
  title_oromo?: string | null
  language_codes?: string[] | null
}): string[] {
  const codes = new Set<string>()
  const fromField = languageCodeFromNormalized(row.language || '')
  if (fromField) codes.add(fromField)
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
            : tag.slug.startsWith('saint-') || tag.slug.startsWith('st-') || tag.slug.startsWith('qedus-')
              ? 'saint'
              : 'topic')
    tags.push({ id: tag.id, name: tag.name, slug: tag.slug, kind })
  }
  return tags.sort((a, b) => a.name.localeCompare(b.name))
}

function resolveForm(row: MezmurJoinRow, tags: PublicTag[]): 'mezmur' | 'werb' {
  if (row.form === 'werb' || row.form === 'mezmur') return row.form
  if (tags.some((tag) => tag.slug === 'form-werb')) return 'werb'
  return 'mezmur'
}

function mapCard(row: MezmurJoinRow): MezmurCard {
  const singer = one(row.singers)
  const categoryRel = one(row.categories)
  const tags = tagsFromRow(row)
  const form = resolveForm(row, tags)
  const categoryText = displayClassification(row.category)
  const categoryCanonical = canonicalizeCategory(categoryText) || categoryText
  return {
    id: row.id,
    slug: row.slug,
    title: row.title,
    title_amharic: row.title_amharic,
    thumbnail_url: row.thumbnail_path || row.thumbnail_url,
    audio_url: row.audio_url,
    youtube_url: row.youtube_url,
    featured: row.featured,
    published_at: row.published_at,
    created_at: row.created_at,
    singer_name: singer?.name || null,
    category_name: categoryCanonical
      ? classificationLabel(categoryCanonical)
      : displayClassification(categoryRel?.name),
    languages: languagesFromRow(row),
    form,
    language: row.language || null,
    category: categoryCanonical,
    occasion: displayClassification(canonicalizeOccasion(row.occasion) || row.occasion),
    saint_or_angel: displayClassification(row.saint_or_angel),
    themes: asStringArray(row.themes).filter((theme) => !isNaClassification(theme)),
  }
}

function mapDetail(row: MezmurJoinRow): PublicMezmur {
  const card = mapCard(row)
  const tags = tagsFromRow(row)
  return {
    ...row,
    language: row.language || null,
    form: card.form,
    category: card.category,
    occasion: card.occasion,
    occasion_tags: asStringArray(row.occasion_tags).filter((v) => !isNaClassification(v)),
    saint_or_angel: card.saint_or_angel,
    saint_tags: asStringArray(row.saint_tags).filter((v) => !isNaClassification(v)),
    themes: card.themes,
    search_keywords: asStringArray(row.search_keywords),
    source: row.source || null,
    singer_name: card.singer_name,
    category_name: card.category_name,
    languages: card.languages,
    tags,
  }
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
  const classified = await hasClassificationColumns()
  const page = pageNumber(params)
  const q = sanitizeSearch(params.get('q') || '')
  const language = normalizeLanguageParam(params.get('language') || '')
  const categoryRaw = sanitizeClassificationFilter(params.get('category') || '')
  const occasionRaw = sanitizeClassificationFilter(params.get('occasion') || '')
  const form = sanitizeFilterToken(params.get('form') || '')
  const featuredOnly = params.get('featured') === 'yes'
  const sort = params.get('sort') || 'recent'

  const categoryCanonical = canonicalizeCategory(categoryRaw)
  const occasionCanonical = canonicalizeOccasion(occasionRaw)
  const categoryValues = categoryCanonical ? categoryMatchValues(categoryCanonical) : []
  const occasionValues = occasionCanonical ? occasionMatchValues(occasionCanonical) : []

  let query = database()
    .from('mezmur')
    .select(classified ? CARD_CLASSIFIED : CARD_BASE, { count: 'exact' })
    .eq('status', 'published')

  if (featuredOnly) query = query.eq('featured', true)

  if (classified) {
    if (language === 'amharic' || language === 'am') {
      query = query.or(
        'language.eq.amharic,language.eq.am,language.eq.geez,language.eq.gez,lyrics_amharic.not.is.null,title_amharic.not.is.null',
      )
    } else if (language === 'english' || language === 'en') {
      query = query.or('language.eq.english,language.eq.en,lyrics_english.not.is.null')
    }

    if (form === 'mezmur' || form === 'werb') {
      query = query.eq('form', form as 'mezmur' | 'werb')
    }
    if (categoryValues.length > 0) {
      query = query.in('category', categoryValues)
    }
    if (occasionValues.length > 0) {
      query = query.in('occasion', occasionValues)
    }

    if (q) {
      const token = q.replace(/\s+/g, '-').toLowerCase()
      query = query.or(
        [
          `title.ilike.%${q}%`,
          `title_amharic.ilike.%${q}%`,
          `title_oromo.ilike.%${q}%`,
          `lyrics_amharic.ilike.%${q}%`,
          `lyrics_english.ilike.%${q}%`,
          `transliteration.ilike.%${q}%`,
          `description.ilike.%${q}%`,
          `occasion.ilike.%${q}%`,
          `category.ilike.%${q}%`,
          `search_keywords.cs.{${token}}`,
          `search_keywords.cs.{${q.toLowerCase()}}`,
        ].join(','),
      )
    }
  } else {
    if (language === 'amharic' || language === 'am') {
      query = query.or('lyrics_amharic.not.is.null,title_amharic.not.is.null')
    } else if (language === 'english' || language === 'en') {
      query = query.not('lyrics_english', 'is', null)
    }
    if (q) {
      query = query.or(
        [
          `title.ilike.%${q}%`,
          `title_amharic.ilike.%${q}%`,
          `lyrics_amharic.ilike.%${q}%`,
          `lyrics_english.ilike.%${q}%`,
          `transliteration.ilike.%${q}%`,
          `description.ilike.%${q}%`,
        ].join(','),
      )
    }
  }

  if (sort === 'title-desc' || sort === 'za') {
    query = query.order('title', { ascending: false }).order('id')
  } else if (sort === 'alphabetical' || sort === 'title' || sort === 'az') {
    query = query.order('title', { ascending: true }).order('id')
  } else if (sort === 'published') {
    query = query.order('published_at', { ascending: false, nullsFirst: false }).order('id')
  } else {
    query = query.order('created_at', { ascending: false, nullsFirst: false }).order('id')
  }

  const from = (page - 1) * PAGE_SIZE
  const { data, error, count } = await query.range(from, from + PAGE_SIZE - 1)
  if (error) {
    if (error.code === '42703' && classified) {
      classificationEnabled = false
      return discoverViaTable(params)
    }
    logDevError('discover table', error)
    throw error
  }

  return {
    items: ((data || []) as unknown as MezmurJoinRow[]).map(mapCard),
    total: count || 0,
    page,
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

  const { data, error } = await database()
    .from('mezmur')
    .select(DETAIL_BASE)
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
  const lyricsGez =
    item.lyrics_amharic?.trim() ||
    item.lyrics_english?.trim() ||
    item.lyrics_oromo?.trim() ||
    ''
  return {
    form: item.form || 'mezmur',
    entryId: item.id,
    title: item.title,
    transliterationTitle: item.title,
    titleAmharic: item.title_amharic?.trim() || undefined,
    lyricsGez,
    transliterationLyrics: item.transliteration?.trim() || '',
    lyricsEnglish: item.lyrics_english?.trim() || undefined,
    videoId,
    audioUrl: item.audio_url?.trim() || undefined,
    watchUrl: videoId ? `https://www.youtube.com/watch?v=${videoId}` : undefined,
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
