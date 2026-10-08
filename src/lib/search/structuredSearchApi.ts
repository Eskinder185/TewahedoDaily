/**
 * Shared FastAPI structured search clients for Bible + Hymns.
 * Used by Search Buddy Amharic path, Bible page, and Mezmur library.
 *
 * Confirmed contracts (live gateway 2026-10-08):
 * - GET /api/hymns/search?q=&limit= → { query, count, results: HymnRow[] }
 * - GET /api/bible/search?q=&language=en|am&limit= → { query, language, count, results }
 *   Hits may nest `book: { slug, name_en, name_am }` with chapter/verse/text.
 * - POST /api/chat handles English bible_reference / bible_chapter (not this module).
 * - GET /api/capabilities → 404 on current gateway (do not depend on it).
 */
import { AI_TIMEOUTS_MS, isAiApiConfigured } from '../ai/aiConfig.ts'
import { aiFetch } from '../ai/aiClient.ts'
import type { BibleSearchHit, HymnRow } from '../searchBuddy/apiTypes.ts'

export type StructuredSearchLanguage = 'am' | 'en'

function isRecord(value: unknown): value is Record<string, unknown> {
  return Boolean(value) && typeof value === 'object' && !Array.isArray(value)
}

function asTrimmedString(value: unknown): string {
  return typeof value === 'string' ? value.trim() : ''
}

/** Flatten nested FastAPI book objects onto BibleSearchHit for shared renderers. */
export function normalizeBibleSearchHit(raw: unknown): BibleSearchHit | null {
  if (!isRecord(raw)) return null
  const bookField = raw.book
  let bookSlug = asTrimmedString(raw.book_slug)
  let bookName = asTrimmedString(raw.book_name)
  let bookAm = ''
  let bookFlat: string | null = null

  if (isRecord(bookField)) {
    bookSlug = bookSlug || asTrimmedString(bookField.slug)
    bookName = bookName || asTrimmedString(bookField.name_en) || asTrimmedString(bookField.name_am)
    bookAm = asTrimmedString(bookField.name_am)
    bookFlat = bookName || bookSlug || null
  } else if (typeof bookField === 'string' && bookField.trim()) {
    bookFlat = bookField.trim()
    bookName = bookName || bookFlat
  }

  const reference = asTrimmedString(raw.reference)
  const chapter =
    typeof raw.chapter === 'number' || typeof raw.chapter === 'string' ? raw.chapter : null
  const verseRaw = raw.verse_number ?? raw.verse
  const verse =
    typeof verseRaw === 'number' || typeof verseRaw === 'string' ? verseRaw : null
  return {
    ...raw,
    book: bookFlat,
    book_name: bookName || bookFlat,
    book_slug: bookSlug || undefined,
    book_name_amharic: bookAm || undefined,
    chapter,
    verse,
    verse_number: verse,
    text: asTrimmedString(raw.text) || null,
    text_amharic: asTrimmedString(raw.text_amharic) || null,
    text_english: asTrimmedString(raw.text_english) || null,
    excerpt: asTrimmedString(raw.excerpt) || null,
    reference: reference || undefined,
  }
}

function normalizeHymnRow(raw: unknown): HymnRow | null {
  if (!isRecord(raw)) return null
  const slug = asTrimmedString(raw.slug)
  const id = asTrimmedString(raw.id) || asTrimmedString(raw.mezmur_id)
  if (!slug && !id && !asTrimmedString(raw.title) && !asTrimmedString(raw.title_amharic)) {
    return null
  }
  return {
    ...raw,
    id: id || null,
    slug: slug || null,
    title: asTrimmedString(raw.title) || null,
    title_amharic: asTrimmedString(raw.title_amharic) || null,
    title_english: asTrimmedString(raw.title_english) || null,
    title_transliteration: asTrimmedString(raw.title_transliteration) || null,
    form: asTrimmedString(raw.form) || null,
    preview: asTrimmedString(raw.preview) || null,
    youtube_url: asTrimmedString(raw.youtube_url) || null,
    audio_url: asTrimmedString(raw.audio_url) || null,
    zemari: asTrimmedString(raw.zemari) || null,
    singer_name: asTrimmedString(raw.singer_name) || null,
    primary_language: asTrimmedString(raw.primary_language) || null,
  }
}

export type HymnsApiSearchResult = {
  query: string
  count: number
  results: HymnRow[]
}

export type BibleApiSearchResult = {
  query: string
  language: StructuredSearchLanguage
  count: number
  results: BibleSearchHit[]
}

/**
 * GET /api/hymns/search — returns [] when unconfigured or invalid payload.
 * Throws AiClientError on network/timeout (callers may catch and fall back).
 */
export async function fetchHymnsSearchApi(
  query: string,
  options: { limit?: number; signal?: AbortSignal } = {},
): Promise<HymnsApiSearchResult> {
  const q = query.trim()
  const limit = Math.min(50, Math.max(1, options.limit ?? 12))
  if (!q || !isAiApiConfigured()) {
    return { query: q, count: 0, results: [] }
  }
  const raw = await aiFetch<unknown>({
    path: `/api/hymns/search?q=${encodeURIComponent(q)}&limit=${limit}`,
    method: 'GET',
    timeoutMs: AI_TIMEOUTS_MS.chat,
    signal: options.signal,
    withAuth: true,
  })
  if (!isRecord(raw)) return { query: q, count: 0, results: [] }
  const rows = Array.isArray(raw.results) ? raw.results : []
  const results: HymnRow[] = []
  const seen = new Set<string>()
  for (const row of rows) {
    const hymn = normalizeHymnRow(row)
    if (!hymn) continue
    const key = (hymn.slug || hymn.id || hymn.title_amharic || hymn.title || '').toLowerCase()
    if (!key || seen.has(key)) continue
    seen.add(key)
    results.push(hymn)
  }
  return {
    query: asTrimmedString(raw.query) || q,
    count: typeof raw.count === 'number' ? raw.count : results.length,
    results,
  }
}

/**
 * GET /api/bible/search — keyword verse search.
 * Note: exact references like "John 3:16" often return count 0 here;
 * use POST /api/chat or local searchBible for references.
 */
export async function fetchBibleSearchApi(
  query: string,
  options: {
    language?: StructuredSearchLanguage
    limit?: number
    signal?: AbortSignal
  } = {},
): Promise<BibleApiSearchResult> {
  const q = query.trim()
  const language: StructuredSearchLanguage = options.language === 'am' ? 'am' : 'en'
  const limit = Math.min(50, Math.max(1, options.limit ?? 12))
  if (!q || !isAiApiConfigured()) {
    return { query: q, language, count: 0, results: [] }
  }
  const raw = await aiFetch<unknown>({
    path: `/api/bible/search?q=${encodeURIComponent(q)}&language=${language}&limit=${limit}`,
    method: 'GET',
    timeoutMs: AI_TIMEOUTS_MS.chat,
    signal: options.signal,
    withAuth: true,
  })
  if (!isRecord(raw)) return { query: q, language, count: 0, results: [] }
  const rows = Array.isArray(raw.results) ? raw.results : []
  const results = rows
    .map((row) => normalizeBibleSearchHit(row))
    .filter((row): row is BibleSearchHit => Boolean(row))
  return {
    query: asTrimmedString(raw.query) || q,
    language,
    count: typeof raw.count === 'number' ? raw.count : results.length,
    results,
  }
}

export function canAttemptStructuredSearchApi(): boolean {
  return isAiApiConfigured()
}
