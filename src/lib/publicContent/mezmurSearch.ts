import Fuse from 'fuse.js'
import { supabase } from '../supabase/client'
import { normalizeStringList } from '../normalize/stringList'
import {
  canonicalizeCategory,
  canonicalizeOccasion,
  categoryMatchValues,
  displayClassification,
  occasionMatchValues,
} from './taxonomy'
import {
  classificationLabel,
  normalizeLanguageParam,
} from './labels'
import type { MezmurCard } from './service'

export type MezmurSearchDoc = MezmurCard & {
  search_keywords: string[]
  /** Normalized Latin title for exact/prefix boosts */
  titleNorm: string
  titleAmharicNorm: string
  keywordsText: string
}

export type MezmurSearchHit = {
  item: MezmurCard
  score: number
  matchKind: 'exact' | 'prefix' | 'fuzzy' | 'amharic' | 'keyword' | 'meta'
}

export type MezmurSearchResult = {
  items: MezmurCard[]
  total: number
  page: number
  suggestions: MezmurCard[]
  hasStrongMatch: boolean
  closest: MezmurCard[]
}

const CATALOG_TTL_MS = 5 * 60 * 1000
const PAGE_FETCH = 500

let catalogCache: { at: number; docs: MezmurSearchDoc[] } | null = null
let catalogPromise: Promise<MezmurSearchDoc[]> | null = null

/** Search-only Latin normalization — does not mutate stored titles. */
export function normalizeLatinSearchText(value: string): string {
  return value
    .normalize('NFKD')
    .replace(/[\u0300-\u036f]/g, '')
    .toLowerCase()
    .replace(/['’`´]/g, '')
    .replace(/[-_/\\]+/g, ' ')
    .replace(/[^\p{L}\p{N}\s]/gu, ' ')
    .replace(/\s+/g, ' ')
    .trim()
}

export function normalizeAmharicSearchText(value: string): string {
  return value.replace(/\s+/g, ' ').trim()
}

function one<T>(value: T | T[] | null | undefined): T | null {
  if (!value) return null
  return Array.isArray(value) ? value[0] || null : value
}

type RawRow = {
  id: string
  slug: string
  title: string
  title_amharic: string | null
  thumbnail_url: string | null
  thumbnail_path?: string | null
  audio_url: string | null
  youtube_url: string | null
  featured: boolean
  published_at: string | null
  created_at: string
  language?: string | null
  form?: 'mezmur' | 'werb' | null
  category?: string | null
  occasion?: string | null
  saint_or_angel?: string | null
  themes?: unknown
  search_keywords?: unknown
  singers?: { id: string; name: string } | { id: string; name: string }[] | null
  categories?:
    | { id: string; name: string; slug: string }
    | { id: string; name: string; slug: string }[]
    | null
}

function mapSearchDoc(row: RawRow): MezmurSearchDoc {
  const singer = one(row.singers)
  const categoryRel = one(row.categories)
  const categoryText = displayClassification(row.category)
  const categoryCanonical = canonicalizeCategory(categoryText) || categoryText
  const keywords = normalizeStringList(row.search_keywords)
  const title = row.title || ''
  const titleAmharic = row.title_amharic || ''
  const form = row.form === 'werb' || row.form === 'mezmur' ? row.form : 'mezmur'

  return {
    id: row.id,
    slug: row.slug,
    title,
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
    languages: [],
    form,
    language: row.language || null,
    category: categoryCanonical,
    occasion: displayClassification(canonicalizeOccasion(row.occasion) || row.occasion),
    saint_or_angel: displayClassification(row.saint_or_angel),
    themes: normalizeStringList(row.themes),
    search_keywords: keywords,
    titleNorm: normalizeLatinSearchText(title),
    titleAmharicNorm: normalizeAmharicSearchText(titleAmharic),
    keywordsText: keywords.join(' '),
  }
}

function toCard(doc: MezmurSearchDoc): MezmurCard {
  const {
    search_keywords: _k,
    titleNorm: _t,
    titleAmharicNorm: _a,
    keywordsText: _kw,
    ...card
  } = doc
  return card
}

async function fetchAllPublishedSearchRows(): Promise<RawRow[]> {
  if (!supabase) return []

  // Keep this select schema-safe: live DB stores search_keywords/themes/tags as TEXT
  // (often pipe-separated), not text[]. Never filter with cs/@> against these columns.
  const selectClassified = `
    id, slug, title, title_amharic, thumbnail_url, thumbnail_path, image_alt,
    audio_url, youtube_url, featured, published_at, created_at,
    language, form, category, occasion, saint_or_angel, themes, search_keywords,
    singers ( id, name ),
    categories ( id, name, slug )
  `
  const selectBase = `
    id, slug, title, title_amharic, thumbnail_url, thumbnail_path, image_alt,
    audio_url, youtube_url, featured, published_at, created_at,
    singers ( id, name ),
    categories ( id, name, slug )
  `

  let useClassified = true
  const rows: RawRow[] = []

  for (let offset = 0; ; offset += PAGE_FETCH) {
    const { data, error } = await supabase
      .from('mezmur')
      .select(useClassified ? selectClassified : selectBase)
      .eq('status', 'published')
      .order('created_at', { ascending: false })
      .order('id')
      .range(offset, offset + PAGE_FETCH - 1)

    if (error) {
      if (import.meta.env.DEV) {
        console.error('[mezmurSearch] catalog fetch', {
          code: error.code,
          message: error.message,
          details: error.details,
          hint: error.hint,
        })
      }
      if (
        useClassified &&
        (error.code === '42703' ||
          /column .* does not exist/i.test(error.message || '') ||
          /operator does not exist/i.test(error.message || ''))
      ) {
        useClassified = false
        offset -= PAGE_FETCH
        continue
      }
      throw error
    }

    const batch = (data || []) as unknown as RawRow[]
    rows.push(...batch)
    if (batch.length < PAGE_FETCH) break
  }

  return rows
}

export async function loadMezmurSearchCatalog(force = false): Promise<MezmurSearchDoc[]> {
  if (!force && catalogCache && Date.now() - catalogCache.at < CATALOG_TTL_MS) {
    return catalogCache.docs
  }
  if (!force && catalogPromise) return catalogPromise

  catalogPromise = (async () => {
    const rows = await fetchAllPublishedSearchRows()
    const docs = rows.map(mapSearchDoc)
    catalogCache = { at: Date.now(), docs }
    return docs
  })()

  try {
    return await catalogPromise
  } finally {
    catalogPromise = null
  }
}

function matchesLanguage(doc: MezmurSearchDoc, language: string): boolean {
  const lang = normalizeLanguageParam(language)
  if (!lang) return true
  const field = (doc.language || '').toLowerCase()
  if (lang === 'amharic' || lang === 'am') {
    return (
      ['amharic', 'am', 'geez', 'gez'].includes(field) ||
      Boolean(doc.title_amharic?.trim())
    )
  }
  if (lang === 'english' || lang === 'en') {
    return ['english', 'en'].includes(field)
  }
  return true
}

function matchesFilters(
  doc: MezmurSearchDoc,
  filters: {
    language?: string
    form?: string
    category?: string
    occasion?: string
    featuredOnly?: boolean
  },
): boolean {
  if (filters.featuredOnly && !doc.featured) return false
  if (filters.form === 'mezmur' || filters.form === 'werb') {
    if (doc.form !== filters.form) return false
  }
  if (!matchesLanguage(doc, filters.language || '')) return false

  const categoryCanonical = canonicalizeCategory(filters.category || '')
  if (categoryCanonical) {
    const values = new Set(categoryMatchValues(categoryCanonical).map((v) => v.toLowerCase()))
    const docCat = (doc.category || '').toLowerCase()
    if (!values.has(docCat) && canonicalizeCategory(doc.category || '') !== categoryCanonical) {
      return false
    }
  }

  const occasionCanonical = canonicalizeOccasion(filters.occasion || '')
  if (occasionCanonical) {
    const values = new Set(occasionMatchValues(occasionCanonical).map((v) => v.toLowerCase()))
    const docOcc = (doc.occasion || '').toLowerCase()
    if (!values.has(docOcc) && canonicalizeOccasion(doc.occasion || '') !== occasionCanonical) {
      return false
    }
  }

  return true
}

function sortDocs(docs: MezmurSearchDoc[], sort: string): MezmurSearchDoc[] {
  const copy = [...docs]
  if (sort === 'title-desc' || sort === 'za') {
    return copy.sort((a, b) => b.title.localeCompare(a.title) || a.id.localeCompare(b.id))
  }
  if (sort === 'alphabetical' || sort === 'title' || sort === 'az') {
    return copy.sort((a, b) => a.title.localeCompare(b.title) || a.id.localeCompare(b.id))
  }
  if (sort === 'published') {
    return copy.sort(
      (a, b) =>
        String(b.published_at || '').localeCompare(String(a.published_at || '')) ||
        a.id.localeCompare(b.id),
    )
  }
  return copy.sort(
    (a, b) =>
      String(b.created_at || '').localeCompare(String(a.created_at || '')) ||
      a.id.localeCompare(b.id),
  )
}

function rankHit(doc: MezmurSearchDoc, queryNorm: string, queryRaw: string, fuseScore: number): MezmurSearchHit {
  const qAm = normalizeAmharicSearchText(queryRaw)
  let matchKind: MezmurSearchHit['matchKind'] = 'fuzzy'
  let score = fuseScore

  if (doc.titleNorm === queryNorm && queryNorm) {
    matchKind = 'exact'
    score = Math.min(score, 0.001)
  } else if (queryNorm && doc.titleNorm.startsWith(queryNorm)) {
    matchKind = 'prefix'
    score = Math.min(score, 0.05)
  } else if (qAm && doc.titleAmharicNorm.includes(qAm)) {
    matchKind = 'amharic'
    score = Math.min(score, 0.08)
  } else if (
    queryNorm &&
    normalizeLatinSearchText(doc.keywordsText).includes(queryNorm)
  ) {
    matchKind = 'keyword'
    score = Math.min(score, Math.max(fuseScore, 0.12))
  } else if (
    queryNorm &&
    (normalizeLatinSearchText(doc.singer_name || '').includes(queryNorm) ||
      normalizeLatinSearchText(doc.category || '').includes(queryNorm) ||
      normalizeLatinSearchText(doc.occasion || '').includes(queryNorm))
  ) {
    matchKind = 'meta'
    score = Math.min(score, Math.max(fuseScore, 0.18))
  }

  return { item: toCard(doc), score, matchKind }
}

const KIND_RANK: Record<MezmurSearchHit['matchKind'], number> = {
  exact: 0,
  prefix: 1,
  amharic: 2,
  fuzzy: 3,
  keyword: 4,
  meta: 5,
}

export function searchMezmurCatalog(
  docs: MezmurSearchDoc[],
  queryRaw: string,
  options: {
    language?: string
    form?: string
    category?: string
    occasion?: string
    featuredOnly?: boolean
    sort?: string
    page?: number
    pageSize?: number
    suggestionLimit?: number
  } = {},
): MezmurSearchResult {
  const page = Math.max(1, options.page || 1)
  const pageSize = Math.max(1, options.pageSize || 24)
  const suggestionLimit = options.suggestionLimit ?? 6
  const filtered = docs.filter((doc) =>
    matchesFilters(doc, {
      language: options.language,
      form: options.form,
      category: options.category,
      occasion: options.occasion,
      featuredOnly: options.featuredOnly,
    }),
  )

  const query = queryRaw.trim()
  if (!query) {
    const sorted = sortDocs(filtered, options.sort || 'recent')
    const from = (page - 1) * pageSize
    const pageItems = sorted.slice(from, from + pageSize).map(toCard)
    return {
      items: pageItems,
      total: sorted.length,
      page,
      suggestions: [],
      hasStrongMatch: true,
      closest: [],
    }
  }

  const queryNorm = normalizeLatinSearchText(query)
  const fuse = new Fuse(filtered, {
    keys: [
      { name: 'title', weight: 0.42 },
      { name: 'titleNorm', weight: 0.22 },
      { name: 'title_amharic', weight: 0.28 },
      { name: 'keywordsText', weight: 0.12 },
      { name: 'singer_name', weight: 0.06 },
      { name: 'category', weight: 0.04 },
      { name: 'occasion', weight: 0.04 },
    ],
    threshold: 0.42,
    distance: 140,
    ignoreLocation: true,
    minMatchCharLength: 1,
    shouldSort: true,
    includeScore: true,
  })

  const fuseHits = fuse.search(queryNorm || query)
  const ranked = fuseHits
    .map((hit) => rankHit(hit.item, queryNorm, query, hit.score ?? 1))
    .sort((a, b) => {
      const kindDiff = KIND_RANK[a.matchKind] - KIND_RANK[b.matchKind]
      if (kindDiff !== 0) return kindDiff
      if (a.score !== b.score) return a.score - b.score
      return a.item.title.localeCompare(b.item.title)
    })

  const hasStrongMatch = ranked.some(
    (hit) =>
      hit.matchKind === 'exact' ||
      hit.matchKind === 'prefix' ||
      hit.matchKind === 'amharic' ||
      hit.score <= 0.28,
  )

  const from = (page - 1) * pageSize
  const pageItems = ranked.slice(from, from + pageSize).map((hit) => hit.item)
  const suggestions = ranked.slice(0, suggestionLimit).map((hit) => hit.item)
  const closest = !hasStrongMatch ? ranked.slice(0, Math.min(8, ranked.length)).map((h) => h.item) : []

  return {
    items: pageItems,
    total: ranked.length,
    page,
    suggestions,
    hasStrongMatch,
    closest,
  }
}

export async function suggestMezmurTitles(
  query: string,
  filters: {
    language?: string
    form?: string
    category?: string
    occasion?: string
  } = {},
  limit = 6,
): Promise<MezmurCard[]> {
  if (!query.trim()) return []
  const docs = await loadMezmurSearchCatalog()
  return searchMezmurCatalog(docs, query, { ...filters, page: 1, pageSize: limit, suggestionLimit: limit })
    .suggestions
}
