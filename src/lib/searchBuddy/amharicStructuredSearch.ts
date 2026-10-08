import { AI_TIMEOUTS_MS } from '../ai/aiConfig.ts'
import { aiFetch } from '../ai/aiClient.ts'
import type {
  BibleSearchHit,
  HymnRow,
  PrayerRow,
  SearchBuddyApiResponse,
  SynaxariumRow,
} from './apiTypes.ts'
import { containsEthiopic, normalizeAmharicSearchText } from './amharicText.ts'
import {
  isEmptySearchBuddyResponse,
  parseSearchBuddyResponse,
} from './parseSearchBuddyResponse.ts'

type IntentAlias = {
  patterns: string[]
  englishChat?: string
  direct?: 'calendar_today' | 'fasting_today' | 'synaxarium_today'
}

const AMHARIC_INTENT_ALIASES: IntentAlias[] = [
  {
    patterns: [
      '\u12DB\u122C \u133E\u121D \u1290\u12CD',
      '\u12DB\u122C \u133E\u121D',
    ],
    englishChat: 'fasting today',
    direct: 'fasting_today',
  },
  {
    patterns: [
      '\u12E8\u12DB\u122C \u1240\u1295',
      '\u12DB\u122C \u121D\u1295 \u1240\u1295 \u1290\u12CD',
      '\u12DB\u122C \u121D\u1295 \u1240\u1295',
    ],
    englishChat: 'calendar today',
    direct: 'calendar_today',
  },
  {
    patterns: [
      '\u12E8\u12DB\u122C \u1245\u12F1\u1233\u1295',
      '\u12DB\u122C \u12E8\u121A\u1273\u1230\u1261 \u1245\u12F1\u1233\u1295',
      '\u12DB\u122C \u1245\u12F1\u1233\u1295',
    ],
    direct: 'synaxarium_today',
  },
]

function isRecord(value: unknown): value is Record<string, unknown> {
  return Boolean(value) && typeof value === 'object' && !Array.isArray(value)
}

function matchAmharicIntent(normalized: string): IntentAlias | null {
  const compact = normalized.replace(/\s+/g, ' ').trim()
  if (!compact) return null
  for (const alias of AMHARIC_INTENT_ALIASES) {
    for (const pattern of alias.patterns) {
      if (compact === pattern || compact.includes(pattern)) {
        return alias
      }
    }
  }
  return null
}

async function getJson(path: string, signal?: AbortSignal): Promise<unknown> {
  return aiFetch<unknown>({
    path,
    method: 'GET',
    timeoutMs: AI_TIMEOUTS_MS.chat,
    signal,
    withAuth: true,
  })
}

async function postEnglishChat(message: string, signal?: AbortSignal): Promise<SearchBuddyApiResponse> {
  const raw = await aiFetch<unknown>({
    path: '/api/chat',
    method: 'POST',
    json: {
      message,
      timezone:
        typeof Intl !== 'undefined'
          ? Intl.DateTimeFormat().resolvedOptions().timeZone
          : 'UTC',
    },
    timeoutMs: AI_TIMEOUTS_MS.chat,
    signal,
    withAuth: true,
  })
  return parseSearchBuddyResponse(raw)
}

function asHymnSearch(query: string, payload: unknown): SearchBuddyApiResponse | null {
  if (!isRecord(payload)) return null
  const results = Array.isArray(payload.results) ? (payload.results as HymnRow[]) : []
  if (!results.length) return null
  return {
    type: 'hymn_search',
    query,
    results,
    message: typeof payload.message === 'string' ? payload.message : undefined,
  }
}

function asPrayerSearch(query: string, payload: unknown): SearchBuddyApiResponse | null {
  if (!isRecord(payload)) return null
  const results = Array.isArray(payload.results) ? (payload.results as PrayerRow[]) : []
  if (!results.length) return null
  return { type: 'prayer_search', query, results }
}

function asBibleSearch(query: string, payload: unknown): SearchBuddyApiResponse | null {
  if (!isRecord(payload)) return null
  const results = Array.isArray(payload.results) ? (payload.results as BibleSearchHit[]) : []
  if (!results.length) return null
  return { type: 'bible_search', query, results }
}

function asSynaxariumSearch(query: string, payload: unknown): SearchBuddyApiResponse | null {
  if (!isRecord(payload)) return null
  const results = Array.isArray(payload.results) ? (payload.results as SynaxariumRow[]) : []
  if (!results.length) return null
  return { type: 'synaxarium_search', query, results }
}

function calendarTodayAsTyped(
  payload: unknown,
  type: 'calendar_today' | 'fasting_today' | 'synaxarium_today',
): SearchBuddyApiResponse {
  const base = isRecord(payload) ? payload : {}
  if (type === 'fasting_today') {
    return parseSearchBuddyResponse({ ...base, type: 'fasting_today' })
  }
  if (type === 'synaxarium_today') {
    const commemorations =
      (Array.isArray(base.synaxarium) && base.synaxarium) ||
      (Array.isArray(base.commemorations) && base.commemorations) ||
      (isRecord(base.synaxarium_day) && Array.isArray(base.synaxarium_day.commemorations)
        ? base.synaxarium_day.commemorations
        : [])
    return parseSearchBuddyResponse({
      ...base,
      type: 'synaxarium_today',
      commemorations,
      title:
        (isRecord(base.synaxarium_day) &&
          (base.synaxarium_day.title || base.synaxarium_day.display_date_english)) ||
        base.ethiopian_label ||
        base.title,
      display_date_english: base.ethiopian_label || base.display_date_english,
    })
  }
  return parseSearchBuddyResponse({ ...base, type: 'calendar_today' })
}

async function searchHymnsAmharic(
  normalized: string,
  signal?: AbortSignal,
): Promise<SearchBuddyApiResponse | null> {
  const full = await getJson(
    `/api/hymns/search?q=${encodeURIComponent(normalized)}&limit=12`,
    signal,
  )
  const hit = asHymnSearch(normalized, full)
  if (hit) return hit

  const tokens = normalized.split(/\s+/).filter((t) => t.length >= 2)
  const merged: HymnRow[] = []
  const seen = new Set<string>()
  for (const token of tokens) {
    const part = await getJson(
      `/api/hymns/search?q=${encodeURIComponent(token)}&limit=8`,
      signal,
    )
    if (!isRecord(part) || !Array.isArray(part.results)) continue
    for (const row of part.results) {
      if (!isRecord(row)) continue
      const key = String(row.slug || row.id || row.title_amharic || row.title || '')
      if (!key || seen.has(key)) continue
      seen.add(key)
      merged.push(row as HymnRow)
    }
  }
  if (!merged.length) return null
  return { type: 'hymn_search', query: normalized, results: merged }
}

const UNKNOWN_AMHARIC: SearchBuddyApiResponse = {
  type: 'unknown',
  message: "I couldn't find a matching result yet.",
}

/**
 * Amharic / Ethiopic structured-first Search Buddy path.
 * Never sends Ethiopic text to the LLM chat fallback.
 */
export async function resolveAmharicStructuredSearch(
  rawMessage: string,
  signal?: AbortSignal,
): Promise<SearchBuddyApiResponse | null> {
  if (!containsEthiopic(rawMessage)) return null

  const normalized = normalizeAmharicSearchText(rawMessage)
  if (!normalized) {
    return UNKNOWN_AMHARIC
  }

  const intent = matchAmharicIntent(normalized)
  if (intent) {
    if (intent.englishChat) {
      try {
        const viaChat = await postEnglishChat(intent.englishChat, signal)
        if (viaChat.type !== 'ai' && !isEmptySearchBuddyResponse(viaChat)) {
          return viaChat
        }
      } catch {
        /* fall through to direct GET */
      }
    }
    if (intent.direct) {
      const today = await getJson('/api/calendar/today', signal)
      return calendarTodayAsTyped(today, intent.direct)
    }
  }

  const hymn = await searchHymnsAmharic(normalized, signal)
  if (hymn) return hymn

  const prayerPayload = await getJson(
    `/api/prayers/search?q=${encodeURIComponent(normalized)}&limit=12`,
    signal,
  )
  const prayer = asPrayerSearch(normalized, prayerPayload)
  if (prayer) return prayer

  const biblePayload = await getJson(
    `/api/bible/search?q=${encodeURIComponent(normalized)}&language=am&limit=12`,
    signal,
  )
  const bible = asBibleSearch(normalized, biblePayload)
  if (bible) return bible

  const synPayload = await getJson(
    `/api/synaxarium/search?q=${encodeURIComponent(normalized)}&limit=12`,
    signal,
  )
  const syn = asSynaxariumSearch(normalized, synPayload)
  if (syn) return syn

  return UNKNOWN_AMHARIC
}

export function shouldUseAmharicStructuredPath(message: string): boolean {
  return containsEthiopic(message)
}
