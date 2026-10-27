/**
 * Shared Bible reference resolver for Search Buddy + Bible page.
 * Deterministic Supabase + catalog resolution; works with or without remote AI API.
 */
import { AI_TIMEOUTS_MS, isAiApiConfigured } from '../ai/aiConfig.ts'
import { aiFetch } from '../ai/aiClient.ts'
import type { SearchBuddyApiResponse } from '../searchBuddy/apiTypes.ts'
import {
  isEmptySearchBuddyResponse,
  parseSearchBuddyResponse,
} from '../searchBuddy/parseSearchBuddyResponse.ts'
import { resolveBibleDetailPath } from './bibleRoute.ts'
import { parseBibleReference } from '../bible/parseBibleReference.ts'
import { searchBible } from '../bible/bibleSearch.ts'

export type ResolveBibleQueryResult = {
  /** Raw query sent to the resolver. */
  query: string
  response: SearchBuddyApiResponse
  empty: boolean
  /** True when resolver returned a usable bible_reference or bible_chapter. */
  resolved: boolean
  /** Navigation path when resolved, e.g. /bible/john/2#verse-3 */
  route: string | null
}

/**
 * Resolve a Bible reference / chapter via Supabase Bible tables and deterministic parser.
 * Falls back to /api/chat only when the AI backend is configured and local parser needs assist.
 */
export async function resolveBibleQuery(
  text: string,
  options: { signal?: AbortSignal } = {},
): Promise<ResolveBibleQueryResult> {
  const query = (text || '').replace(/\s+/g, ' ').trim()
  if (!query) {
    return {
      query: '',
      response: { type: 'unknown', message: 'Enter a Bible reference or search.' },
      empty: true,
      resolved: false,
      route: null,
    }
  }

  // 1. Instant deterministic parse & Supabase query
  try {
    const parsed = parseBibleReference(query)
    if (parsed.isReference) {
      const bible = await searchBible(query, { textLimit: 4 })
      if (bible.directReference && bible.results.length > 0) {
        const top = bible.results[0]
        const routeParts = top.route.replace(/^\/bible\//, '').split('/')
        const bookSlug = routeParts[0] || parsed.bookQuery.toLowerCase().replace(/\s+/g, '-')
        const chapterNum = parsed.chapter || parseInt(routeParts[1], 10) || 1
        const verseNum = parsed.verseStart || null

        const targetRoute = `/bible/${bookSlug}/${chapterNum}${verseNum ? `#verse-${verseNum}` : ''}`
        const bookRef = {
          slug: bookSlug,
          name_en: top.title.split(' ')[0] || parsed.bookQuery,
          name_am: top.titleAmharic || null,
        }

        const response: SearchBuddyApiResponse = verseNum
          ? {
              type: 'bible_reference',
              book: bookRef,
              book_name: bookRef.name_en,
              book_slug: bookSlug,
              chapter: chapterNum,
              verse: verseNum,
              verse_end: parsed.verseEnd || verseNum,
              text: top.excerpt || '',
            }
          : {
              type: 'bible_chapter',
              book: bookRef,
              book_name: bookRef.name_en,
              book_slug: bookSlug,
              chapter: chapterNum,
            }

        return {
          query,
          response,
          empty: false,
          resolved: true,
          route: targetRoute,
        }
      }
    }
  } catch {
    // Continue to API fallback if configured
  }

  // 2. Remote fallback if AI backend is configured
  if (isAiApiConfigured()) {
    try {
      const payload = {
        message: query,
        timezone:
          typeof Intl !== 'undefined'
            ? Intl.DateTimeFormat().resolvedOptions().timeZone
            : 'UTC',
      }
      const raw = await aiFetch<unknown>({
        path: '/api/chat',
        method: 'POST',
        json: payload,
        timeoutMs: AI_TIMEOUTS_MS.chat,
        signal: options.signal,
        withAuth: true,
      })
      const response = parseSearchBuddyResponse(raw)
      const empty = isEmptySearchBuddyResponse(response)
      const resolved =
        (response.type === 'bible_reference' || response.type === 'bible_chapter') && !empty
      const route =
        response.type === 'bible_reference' || response.type === 'bible_chapter'
          ? resolveBibleDetailPath(response)
          : null

      return { query, response, empty, resolved, route }
    } catch {
      // Continue to empty response
    }
  }

  return {
    query,
    response: { type: 'unknown', message: 'No Bible passage matched.' },
    empty: true,
    resolved: false,
    route: null,
  }
}

export function canResolveBibleQuery(): boolean {
  return true
}
