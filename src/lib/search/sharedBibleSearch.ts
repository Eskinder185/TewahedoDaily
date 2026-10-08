/**
 * Shared Bible search adapter for Search Buddy + Bible page (typed and voice).
 *
 * Pipeline (identical for typed and voice transcripts):
 *   raw text → POST /api/chat (via sendSearchBuddyMessage)
 *     → bible_reference | bible_chapter  → stop; render structured result
 *     → bible_search                     → use structured hits
 *     → otherwise                        → ordinary Bible text search only
 *
 * Amharic spoken references are NOT resolved by frontend book/number parsers.
 * No separate voice-only matcher.
 */
import { searchBible, searchBibleText, type BibleSearchOptions } from '../bible/bibleSearch.ts'
import { AiClientError } from '../ai/aiTypes.ts'
import { containsEthiopic } from '../searchBuddy/amharicText.ts'
import {
  searchBuddyApiReady,
  sendSearchBuddyMessage,
} from '../searchBuddy/sendSearchBuddyMessage.ts'
import type { SearchBuddyApiResponse } from '../searchBuddy/apiTypes.ts'
import { resolveBibleDetailPath } from './bibleRoute.ts'
import { prepareSearchBuddyMessage } from './normalizeSearchQuery.ts'
import type { SiteSearchResult } from './types.ts'

export type SharedBibleSearchSource = 'buddy-api' | 'local' | 'local-fallback'

export type SharedBibleSearchResult = {
  /** Message after shared normalization / Bible rewrite. */
  normalizedQuery: string
  /** Structured FastAPI payload when bible_* succeeded. */
  structured: SearchBuddyApiResponse | null
  /** Navigation list (from structured mapping and/or local Supabase). */
  siteResults: SiteSearchResult[]
  empty: boolean
  source: SharedBibleSearchSource
  intentMessage: string | null
  directReference: boolean
}

function truncateExcerpt(text: string): string {
  return text.length > 220 ? `${text.slice(0, 217).trim()}…` : text
}

function siteResultsFromStructured(response: SearchBuddyApiResponse): SiteSearchResult[] {
  if (response.type === 'bible_reference' || response.type === 'bible_chapter') {
    const route = resolveBibleDetailPath(response)
    if (!route) return []
    const bookLabel =
      typeof response.book === 'object' && response.book
        ? String(response.book.name_en || response.book.slug || '').trim()
        : typeof response.book === 'string'
          ? response.book.trim()
          : ''
    const chapter =
      response.chapter !== null && response.chapter !== undefined && response.chapter !== ''
        ? String(response.chapter)
        : ''
    const verse =
      response.type === 'bible_reference' &&
      response.verse !== null &&
      response.verse !== undefined &&
      response.verse !== ''
        ? String(response.verse)
        : ''
    const fromReference =
      typeof response.reference === 'string' && response.reference.trim()
        ? response.reference.trim()
        : ''
    let displayTitle = fromReference
    if (!displayTitle && bookLabel && chapter) {
      displayTitle = verse ? `${bookLabel} ${chapter}:${verse}` : `${bookLabel} ${chapter}`
    }
    if (!displayTitle) displayTitle = bookLabel || 'Bible'
    const firstVerse = Array.isArray(response.verses) ? response.verses[0] : null
    const topText =
      response.type === 'bible_reference' && typeof response.text === 'string'
        ? response.text.trim()
        : ''
    const excerpt =
      (firstVerse && typeof firstVerse.text === 'string' && firstVerse.text.trim()) ||
      topText ||
      undefined
    const slug =
      (typeof response.book === 'object' &&
        response.book &&
        typeof response.book.slug === 'string' &&
        response.book.slug) ||
      route.split('/')[2] ||
      'bible'
    const mapped: SiteSearchResult = {
      sourceType: response.type === 'bible_reference' ? 'bible-verse' : 'bible-chapter',
      sourceId: `buddy:${response.type}:${slug}:${response.chapter || 0}:${verse || 0}`,
      title: displayTitle,
      titleAmharic:
        typeof response.book === 'object' && response.book && typeof response.book.name_am === 'string'
          ? response.book.name_am
          : '',
      description: response.type === 'bible_reference' ? 'Bible reference' : 'Bible chapter',
      route,
      imagePath: null,
      score: 0.001,
      matchKind: 'exact',
      typeLabel: response.type === 'bible_reference' ? 'Bible verse' : 'Bible chapter',
      excerpt: excerpt ? truncateExcerpt(excerpt) : undefined,
    }
    return [mapped]
  }

  if (response.type === 'bible_search') {
    const rows = Array.isArray(response.results) ? response.results : []
    const mapped: SiteSearchResult[] = []
    rows.forEach((hit, index) => {
      const route = resolveBibleDetailPath(hit)
      if (!route) return
      const bookName =
        (typeof hit.book_name === 'string' && hit.book_name.trim()) ||
        (typeof hit.book === 'string' && hit.book.trim()) ||
        (typeof hit.book === 'object' &&
          hit.book &&
          typeof hit.book.name_en === 'string' &&
          hit.book.name_en) ||
        'Bible'
      const chapter = hit.chapter != null && hit.chapter !== '' ? String(hit.chapter) : ''
      const verse = hit.verse_number ?? hit.verse
      const verseStr = verse != null && verse !== '' ? String(verse) : ''
      let title = String(bookName)
      if (chapter) title = `${title} ${chapter}`
      if (verseStr) title = `${title}:${verseStr}`
      const excerpt =
        (typeof hit.excerpt === 'string' && hit.excerpt.trim()) ||
        (typeof hit.text === 'string' && hit.text.trim()) ||
        undefined
      mapped.push({
        sourceType: 'bible-text',
        sourceId: `buddy:bible_search:${route}:${index}`,
        title,
        titleAmharic:
          typeof hit.book === 'object' && hit.book && typeof hit.book.name_am === 'string'
            ? hit.book.name_am
            : '',
        description: 'Bible text',
        route,
        imagePath: null,
        score: 0.02 + index * 0.001,
        matchKind: 'keyword',
        typeLabel: 'Bible text',
        excerpt: excerpt ? truncateExcerpt(excerpt) : undefined,
      })
    })
    return mapped
  }

  return []
}

function intentForStructured(response: SearchBuddyApiResponse): string {
  if (
    response.type === 'bible_reference' &&
    typeof response.reference === 'string' &&
    response.reference.trim()
  ) {
    return `Here is ${response.reference.trim()}.`
  }
  if (response.type === 'bible_chapter') return 'Here is the chapter I found.'
  if (response.type === 'bible_search') return 'Here is the Scripture I found.'
  return 'Here is the Scripture I found.'
}

/**
 * Shared Bible search used by the Bible page (typed + voice).
 * Sends the raw transcript/text to the same Search Buddy chat resolver.
 */
export async function searchBibleShared(
  queryRaw: string,
  options: BibleSearchOptions & { signal?: AbortSignal } = {},
): Promise<SharedBibleSearchResult> {
  // Preserve ASR / typed wording for /api/chat (incl. Ethiopic ፥). Do not
  // run frontend Amharic book/number parsing before the backend resolver.
  const rawForChat = (queryRaw || '').replace(/\s+/g, ' ').trim()
  const normalizedQuery = prepareSearchBuddyMessage(queryRaw) || rawForChat

  if (!rawForChat) {
    return {
      normalizedQuery: '',
      structured: null,
      siteResults: [],
      empty: true,
      source: 'local',
      intentMessage: null,
      directReference: false,
    }
  }

  if (searchBuddyApiReady()) {
    try {
      const { response, empty, normalizedMessage } = await sendSearchBuddyMessage(
        rawForChat,
        options.signal,
      )

      // Structured Bible reference/chapter from backend — stop immediately.
      if (response.type === 'bible_reference' || response.type === 'bible_chapter') {
        const siteResults = empty ? [] : siteResultsFromStructured(response)
        return {
          normalizedQuery: normalizedMessage || normalizedQuery,
          structured: response,
          siteResults,
          empty: siteResults.length === 0,
          source: 'buddy-api',
          intentMessage: empty ? null : intentForStructured(response),
          directReference: true,
        }
      }

      if (response.type === 'bible_search' && !empty) {
        const siteResults = siteResultsFromStructured(response)
        return {
          normalizedQuery: normalizedMessage || normalizedQuery,
          structured: response,
          siteResults,
          empty: siteResults.length === 0,
          source: 'buddy-api',
          intentMessage: intentForStructured(response),
          directReference: false,
        }
      }
      // Non-bible chat/structured types → ordinary text search below (no local ref matcher).
    } catch (error) {
      if (error instanceof AiClientError && error.code === 'aborted') throw error
      // network / timeout / not_configured → local text (or English) fallback
    }
  }

  // Ethiopic: never use the weak frontend reference parser (produces false
  // "no matching book/verse" before the backend had a chance, or when chat
  // returned a non-bible type). Keyword text search only.
  if (containsEthiopic(rawForChat)) {
    const textResults = await searchBibleText(rawForChat, options)
    return {
      normalizedQuery,
      structured: null,
      siteResults: textResults,
      empty: textResults.length === 0,
      source: searchBuddyApiReady() ? 'local-fallback' : 'local',
      intentMessage: textResults.length
        ? `I found ${textResults.length} Bible passage${textResults.length === 1 ? '' : 's'} matching your search.`
        : null,
      directReference: false,
    }
  }

  // English / Latin: local catalog may still resolve classic "John 3:16" when API is down.
  const local = await searchBible(normalizedQuery, options)
  return {
    normalizedQuery,
    structured: null,
    siteResults: local.results,
    empty: local.results.length === 0,
    source: searchBuddyApiReady() ? 'local-fallback' : 'local',
    intentMessage: local.intentMessage,
    directReference: local.directReference,
  }
}

/** Canonical navigation destination for an equivalent query (for tests / callers). */
export function resolveSharedBibleDestination(
  result: SharedBibleSearchResult,
): string | null {
  if (result.structured) {
    const fromStructured = siteResultsFromStructured(result.structured)[0]?.route
    if (fromStructured) return fromStructured
  }
  return result.siteResults[0]?.route ?? null
}
