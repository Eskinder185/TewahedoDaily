import {
  KNOWN_SEARCH_BUDDY_TYPES,
  type BibleBookRef,
  type BibleChapterResponse,
  type BibleReferenceResponse,
  type BibleVerseRow,
  type SearchBuddyApiResponse,
} from './apiTypes.ts'

const STRUCTURED_TYPES = new Set<string>(KNOWN_SEARCH_BUDDY_TYPES)

function isRecord(value: unknown): value is Record<string, unknown> {
  return Boolean(value) && typeof value === 'object' && !Array.isArray(value)
}

function asTrimmedString(value: unknown): string | null {
  if (typeof value !== 'string') return null
  const trimmed = value.trim()
  return trimmed || null
}

function asChapterOrVerse(value: unknown): number | string | null {
  if (typeof value === 'number' && Number.isFinite(value)) return value
  if (typeof value === 'string' && value.trim()) return value.trim()
  return null
}

function normalizeBookRef(raw: unknown): string | BibleBookRef | null {
  if (isRecord(raw)) {
    const slug = asTrimmedString(raw.slug)
    const nameEn = asTrimmedString(raw.name_en)
    const nameAm = asTrimmedString(raw.name_am)
    const id = asTrimmedString(raw.id)
    if (!slug && !nameEn && !nameAm) return null
    return {
      ...raw,
      id,
      slug,
      name_en: nameEn,
      name_am: nameAm,
    }
  }
  return asTrimmedString(raw)
}

function normalizeVerses(raw: unknown): BibleVerseRow[] {
  if (!Array.isArray(raw)) return []
  return raw.filter((row): row is BibleVerseRow => isRecord(row))
}

/**
 * Preserve FastAPI bible_reference shape (nested book + verses) as a first-class
 * structured result — never collapse it into a generic AI answer.
 */
export function normalizeBibleReferenceResponse(
  payload: Record<string, unknown>,
): BibleReferenceResponse {
  const book = normalizeBookRef(payload.book)
  const verse = asChapterOrVerse(payload.verse)
  const endVerse =
    asChapterOrVerse(payload.end_verse) ?? asChapterOrVerse(payload.verse_end)
  return {
    type: 'bible_reference',
    reference: asTrimmedString(payload.reference),
    book,
    book_name: asTrimmedString(payload.book_name),
    book_slug: asTrimmedString(payload.book_slug),
    chapter: asChapterOrVerse(payload.chapter),
    verse,
    verse_end: endVerse,
    end_verse: endVerse,
    language: asTrimmedString(payload.language),
    text: asTrimmedString(payload.text),
    text_amharic: asTrimmedString(payload.text_amharic),
    text_english: asTrimmedString(payload.text_english),
    verses: normalizeVerses(payload.verses),
    message: asTrimmedString(payload.message) || undefined,
  }
}

function normalizeBibleChapterResponse(
  payload: Record<string, unknown>,
): BibleChapterResponse {
  return {
    type: 'bible_chapter',
    reference: asTrimmedString(payload.reference),
    book: normalizeBookRef(payload.book),
    book_name: asTrimmedString(payload.book_name),
    book_slug: asTrimmedString(payload.book_slug),
    chapter: asChapterOrVerse(payload.chapter),
    language: asTrimmedString(payload.language),
    verses: normalizeVerses(payload.verses),
    message: asTrimmedString(payload.message) || undefined,
  }
}

/**
 * Normalize FastAPI chat/search payloads into a typed response.
 * Accepts either a top-level `{ type, ... }` object or `{ data: { type, ... } }`.
 * Never throws — returns a safe `unknown` wrapper on malformed input.
 */
export function parseSearchBuddyResponse(raw: unknown): SearchBuddyApiResponse {
  if (!isRecord(raw)) {
    return {
      type: 'unknown',
      message: 'The assistant returned an unexpected response.',
      results: [],
      raw,
    }
  }

  const payload = isRecord(raw.data) && typeof raw.data.type === 'string' ? raw.data : raw
  const type = typeof payload.type === 'string' ? payload.type.trim() : ''

  if (!type) {
    // Legacy { answer, sources } AI shape
    if (typeof payload.answer === 'string' && payload.answer.trim()) {
      return {
        type: 'ai',
        answer: payload.answer,
        sources: Array.isArray(payload.sources) ? payload.sources : undefined,
      }
    }
    return {
      type: 'unknown',
      message: 'The assistant response was missing a type.',
      ...payload,
    }
  }

  // Structured bible_* must stay structured even if an `answer` field is also present.
  if (type === 'bible_reference') {
    return normalizeBibleReferenceResponse(payload)
  }
  if (type === 'bible_chapter') {
    return normalizeBibleChapterResponse(payload)
  }

  if (STRUCTURED_TYPES.has(type)) {
    return { ...payload, type } as SearchBuddyApiResponse
  }

  // Brand-new backend type: keep payload fields for a safe generic renderer.
  return {
    ...payload,
    type: 'unknown',
    originalType: type,
    message: typeof payload.message === 'string' ? payload.message : undefined,
  }
}

export function isEmptySearchBuddyResponse(response: SearchBuddyApiResponse): boolean {
  switch (response.type) {
    case 'ai': {
      const answer = (response.answer || response.message || '').trim()
      return !answer
    }
    case 'bible_reference': {
      const hasText = Boolean(
        (response.text || response.text_amharic || response.text_english || '').toString().trim(),
      )
      const hasVerses = Array.isArray(response.verses) && response.verses.length > 0
      return !hasText && !hasVerses
    }
    case 'bible_chapter':
      return !(Array.isArray(response.verses) && response.verses.length > 0)
    case 'prayer_collection':
    case 'prayer_section':
      return !(Array.isArray(response.prayers) && response.prayers.length > 0)
    case 'synaxarium_day':
      return !(Array.isArray(response.commemorations) && response.commemorations.length > 0)
    case 'synaxarium_today':
      return !(
        (Array.isArray(response.commemorations) && response.commemorations.length > 0) ||
        (Array.isArray(response.results) && response.results.length > 0) ||
        Boolean(response.title || response.title_amharic || response.ethiopian_date)
      )
    case 'bible_search':
    case 'hymn_search':
    case 'hymn_occasion':
    case 'prayer_search':
    case 'synaxarium_search':
      return !(Array.isArray(response.results) && response.results.length > 0)
    case 'calendar_today':
    case 'calendar_day':
    case 'fasting_today':
    case 'fast_today':
    case 'calendar_fast':
    case 'season_today':
    case 'calendar_season':
    case 'ethiopian_date_today': {
      const fields = [
        response.ethiopian_date,
        response.ethiopian_date_english,
        response.ethiopian_date_amharic,
        response.gregorian_date,
        response.primary_observance,
        response.fast_name,
        response.active_fast,
        response.liturgical_season,
        response.season,
        response.season_name,
        response.summary,
        response.message,
        response.title,
      ]
      return !fields.some((value) => {
        if (typeof value === 'string') return Boolean(value.trim())
        return value !== null && value !== undefined && value !== ''
      })
    }
    case 'liturgy_search':
    case 'teaching_search':
    case 'unknown': {
      if (Array.isArray(response.results)) return response.results.length === 0
      return false
    }
    default:
      return false
  }
}
