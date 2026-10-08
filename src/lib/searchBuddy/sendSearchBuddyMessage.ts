import { AI_TIMEOUTS_MS, getAiApiBaseUrl, isAiApiConfigured } from '../ai/aiConfig.ts'
import { aiFetch } from '../ai/aiClient.ts'
import { AiClientError } from '../ai/aiTypes.ts'
import { prepareSearchBuddyMessage } from '../search/normalizeSearchQuery.ts'
import {
  resolveAmharicStructuredSearch,
  shouldUseAmharicStructuredPath,
} from './amharicStructuredSearch.ts'
import {
  isEmptySearchBuddyResponse,
  parseSearchBuddyResponse,
} from './parseSearchBuddyResponse.ts'
import type { SearchBuddyApiResponse } from './apiTypes.ts'

export type SendSearchBuddyResult = {
  response: SearchBuddyApiResponse
  empty: boolean
  /** Query after shared normalization (Bible rewrite, Amharic/ASR cleanup). */
  normalizedMessage: string
}

/**
 * Single Search Buddy API entry point (also used by the Bible page adapter).
 * Shared prepareSearchBuddyMessage → Amharic structured GETs or POST /api/chat.
 */
export async function sendSearchBuddyMessage(
  message: string,
  signal?: AbortSignal,
): Promise<SendSearchBuddyResult> {
  // Preserve ASR wording for Amharic Bible chat; English still gets Bible rewrite.
  const rawTrimmed = (message || '').replace(/\s+/g, ' ').trim()
  const prepared = prepareSearchBuddyMessage(message)
  const forRouting = shouldUseAmharicStructuredPath(rawTrimmed)
    ? rawTrimmed || prepared
    : prepared
  if (!forRouting) {
    throw new AiClientError('bad_request', 'Enter a search question first.')
  }

  const base = getAiApiBaseUrl()
  if (!base) {
    const hint =
      import.meta.env.DEV
        ? 'Set VITE_TEWAHEDO_AI_API_URL in .env.local (e.g. http://10.0.0.86:8000) and restart Vite.'
        : 'Extended Search Buddy answers are temporarily unavailable.'
    throw new AiClientError('not_configured', hint)
  }

  if (shouldUseAmharicStructuredPath(forRouting)) {
    // Pass raw transcript so Bible-like Amharic hits POST /api/chat unchanged.
    const response = await resolveAmharicStructuredSearch(rawTrimmed || forRouting, signal)
    if (response) {
      return {
        response,
        empty: isEmptySearchBuddyResponse(response),
        normalizedMessage: forRouting,
      }
    }
  }

  const raw = await aiFetch<unknown>({
    path: '/api/chat',
    method: 'POST',
    json: {
      message: prepared || forRouting,
      timezone:
        typeof Intl !== 'undefined'
          ? Intl.DateTimeFormat().resolvedOptions().timeZone
          : 'UTC',
    },
    timeoutMs: AI_TIMEOUTS_MS.chat,
    signal,
    withAuth: true,
  })

  const response = parseSearchBuddyResponse(raw)
  return {
    response,
    empty: isEmptySearchBuddyResponse(response),
    normalizedMessage: prepared || forRouting,
  }
}

export function searchBuddyApiReady(): boolean {
  return isAiApiConfigured()
}

export function missingApiUrlDevMessage(): string | null {
  if (!import.meta.env.DEV) return null
  if (isAiApiConfigured()) return null
  return 'Developer: VITE_TEWAHEDO_AI_API_URL is not set. Add it to .env.local and restart Vite to use the FastAPI Search Buddy backend.'
}
