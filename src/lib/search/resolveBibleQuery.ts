/**
 * Shared Bible reference resolver for Search Buddy + Bible page.
 *
 * Source of truth: POST /api/chat with the raw typed/voice transcript.
 * No frontend book-name, spoken-number, or ASR-variant matching.
 */
import { AI_TIMEOUTS_MS, isAiApiConfigured } from '../ai/aiConfig.ts'
import { aiFetch } from '../ai/aiClient.ts'
import { AiClientError } from '../ai/aiTypes.ts'
import type { SearchBuddyApiResponse } from '../searchBuddy/apiTypes.ts'
import {
  isEmptySearchBuddyResponse,
  parseSearchBuddyResponse,
} from '../searchBuddy/parseSearchBuddyResponse.ts'
import { resolveBibleDetailPath } from './bibleRoute.ts'

export type ResolveBibleQueryResult = {
  /** Raw query sent to the backend. */
  query: string
  response: SearchBuddyApiResponse
  empty: boolean
  /** True when backend returned a usable bible_reference or bible_chapter. */
  resolved: boolean
  /** Navigation path when resolved, e.g. /bible/john/2#verse-3 */
  route: string | null
}

/**
 * Resolve a Bible reference / chapter via POST /api/chat.
 * Typed and voice (after transcribe) must pass the same raw text here.
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

  if (!isAiApiConfigured()) {
    throw new AiClientError(
      'not_configured',
      import.meta.env.DEV
        ? 'Set VITE_TEWAHEDO_AI_API_URL in .env.local and restart Vite.'
        : 'Bible lookup is temporarily unavailable.',
    )
  }

  const payload = {
    message: query,
    timezone:
      typeof Intl !== 'undefined'
        ? Intl.DateTimeFormat().resolvedOptions().timeZone
        : 'UTC',
  }

  let raw: unknown
  try {
    raw = await aiFetch<unknown>({
      path: '/api/chat',
      method: 'POST',
      json: payload,
      timeoutMs: AI_TIMEOUTS_MS.chat,
      signal: options.signal,
      withAuth: true,
    })
  } catch (error) {
    // One retry on gateway blips — does not change matching logic.
    if (
      error instanceof AiClientError &&
      (error.code === 'unavailable' || error.code === 'timeout') &&
      !options.signal?.aborted
    ) {
      raw = await aiFetch<unknown>({
        path: '/api/chat',
        method: 'POST',
        json: payload,
        timeoutMs: AI_TIMEOUTS_MS.chat,
        signal: options.signal,
        withAuth: true,
      })
    } else {
      throw error
    }
  }

  const response = parseSearchBuddyResponse(raw)
  const empty = isEmptySearchBuddyResponse(response)
  const resolved =
    (response.type === 'bible_reference' || response.type === 'bible_chapter') && !empty
  const route =
    response.type === 'bible_reference' || response.type === 'bible_chapter'
      ? resolveBibleDetailPath(response)
      : null

  return { query, response, empty, resolved, route }
}

export function canResolveBibleQuery(): boolean {
  return isAiApiConfigured()
}
