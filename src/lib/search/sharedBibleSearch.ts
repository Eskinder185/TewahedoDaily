/**
 * Shared Bible search adapter for Search Buddy + Bible page (typed and voice).
 *
 * Pipeline:
 *   raw text → resolveBibleQuery (POST /api/chat)
 *     → bible_reference | bible_chapter  → stop; render structured result
 *     → otherwise                        → ordinary Bible text search only
 *
 * No frontend Amharic book/number/ASR matching.
 */
import { searchBible, searchBibleText, type BibleSearchOptions } from '../bible/bibleSearch.ts'
import { AiClientError } from '../ai/aiTypes.ts'
import { containsEthiopic } from '../searchBuddy/amharicText.ts'
import type { SearchBuddyApiResponse } from '../searchBuddy/apiTypes.ts'
import { resolveBibleDetailPath } from './bibleRoute.ts'
import { canResolveBibleQuery, resolveBibleQuery } from './resolveBibleQuery.ts'
import type { SiteSearchResult } from './types.ts'

export type SharedBibleSearchSource = 'buddy-api' | 'local' | 'local-fallback'

export type SharedBibleSearchResult = {
  normalizedQuery: string
  structured: SearchBuddyApiResponse | null
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
    return [
      {
        sourceType: response.type === 'bible_reference' ? 'bible-verse' : 'bible-chapter',
        sourceId: `buddy:${response.type}:${slug}:${response.chapter || 0}:${verse || 0}`,
        title: displayTitle,
        titleAmharic:
          typeof response.book === 'object' &&
          response.book &&
          typeof response.book.name_am === 'string'
            ? response.book.name_am
            : '',
        description: response.type === 'bible_reference' ? 'Bible reference' : 'Bible chapter',
        route,
        imagePath: null,
        score: 0.001,
        matchKind: 'exact',
        typeLabel: response.type === 'bible_reference' ? 'Bible verse' : 'Bible chapter',
        excerpt: excerpt ? truncateExcerpt(excerpt) : undefined,
      },
    ]
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
 * Bible page + shared adapter: raw text → resolveBibleQuery → optional text search.
 */
export async function searchBibleShared(
  queryRaw: string,
  options: BibleSearchOptions & { signal?: AbortSignal } = {},
): Promise<SharedBibleSearchResult> {
  const rawForChat = (queryRaw || '').replace(/\s+/g, ' ').trim()

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

  if (canResolveBibleQuery()) {
    try {
      const resolved = await resolveBibleQuery(rawForChat, { signal: options.signal })

      // bible_reference / bible_chapter — stop; do not run local book matching.
      if (
        resolved.response.type === 'bible_reference' ||
        resolved.response.type === 'bible_chapter'
      ) {
        const siteResults = resolved.empty ? [] : siteResultsFromStructured(resolved.response)
        return {
          normalizedQuery: resolved.query,
          structured: resolved.response,
          siteResults,
          empty: siteResults.length === 0,
          source: 'buddy-api',
          intentMessage: resolved.empty ? null : intentForStructured(resolved.response),
          directReference: true,
        }
      }

      if (resolved.response.type === 'bible_search' && !resolved.empty) {
        const siteResults = siteResultsFromStructured(resolved.response)
        return {
          normalizedQuery: resolved.query,
          structured: resolved.response,
          siteResults,
          empty: siteResults.length === 0,
          source: 'buddy-api',
          intentMessage: intentForStructured(resolved.response),
          directReference: false,
        }
      }
      // Non-bible chat types → ordinary text search (not local reference parsing).
    } catch (error) {
      if (error instanceof AiClientError && error.code === 'aborted') throw error
    }
  }

  // Ethiopic: keyword text search only — never the weak local reference parser.
  if (containsEthiopic(rawForChat)) {
    const textResults = await searchBibleText(rawForChat, options)
    return {
      normalizedQuery: rawForChat,
      structured: null,
      siteResults: textResults,
      empty: textResults.length === 0,
      source: canResolveBibleQuery() ? 'local-fallback' : 'local',
      intentMessage: textResults.length
        ? `I found ${textResults.length} Bible passage${textResults.length === 1 ? '' : 's'} matching your search.`
        : null,
      directReference: false,
    }
  }

  // English / Latin offline fallback only when chat is unavailable.
  const local = await searchBible(rawForChat, options)
  return {
    normalizedQuery: rawForChat,
    structured: null,
    siteResults: local.results,
    empty: local.results.length === 0,
    source: canResolveBibleQuery() ? 'local-fallback' : 'local',
    intentMessage: local.intentMessage,
    directReference: local.directReference,
  }
}

export function resolveSharedBibleDestination(
  result: SharedBibleSearchResult,
): string | null {
  if (result.structured) {
    const fromStructured = siteResultsFromStructured(result.structured)[0]?.route
    if (fromStructured) return fromStructured
  }
  return result.siteResults[0]?.route ?? null
}
