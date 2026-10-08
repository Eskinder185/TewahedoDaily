import { AI_TIMEOUTS_MS } from '../ai/aiConfig.ts'
import { aiFetch } from '../ai/aiClient.ts'
import {
  fetchBibleSearchApi,
  fetchHymnsSearchApi,
} from '../search/structuredSearchApi.ts'
import type {
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

/**
 * ASR / typed Bible-reference signals (incl. common misrecognitions).
 * Presence of any signal means: try POST /api/chat before hymn search.
 */
const AMHARIC_BIBLE_REFERENCE_SIGNALS = [
  '\u121D\u12D5\u122B\u134D', // ምዕራፍ
  '\u121D\u12D5\u122B\u1265', // ምዕራብ (ASR)
  '\u121D\u122B\u134D', // ምራፍ (ASR)
  '\u1241\u1325\u122D', // ቁጥር
  '\u12C8\u1295\u130C\u120D', // ወንጌል
  '\u12C8\u1295\u1308\u120D', // ወንገል (ASR)
  '\u12CB\u1295\u130C\u120D', // ዋንጌል (ASR)
  '\u12C8\u1295\u130C\u12F5', // ወንጌድ (ASR)
] as const

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

/** True when the query looks like a scripture reference, not a hymn title. */
export function looksLikeAmharicBibleReference(text: string): boolean {
  const raw = (text || '').replace(/\s+/g, ' ').trim()
  if (!raw || !containsEthiopic(raw)) return false

  const hay = normalizeAmharicSearchText(raw)
  if (!hay) return false

  if (AMHARIC_BIBLE_REFERENCE_SIGNALS.some((signal) => hay.includes(signal))) {
    return true
  }

  // Digit chapter:verse (Ethiopic ፥ or ASCII :) — check raw before punctuation strip.
  // e.g. ዮሐንስ 3፥16 / ዮሐንስ 3:16
  if (/\d+\s*[\u1365:]\s*\d+/.test(raw)) return true

  // After normalize (፥ → space): "ዮሐንስ 3 16"
  if (/\d+\s+\d+/.test(hay)) return true

  return false
}

function explicitlyAsksForHymns(text: string): boolean {
  const hay = normalizeAmharicSearchText(text)
  if (!hay) return false
  return (
    hay.includes('\u1218\u12DD\u1219\u122D') || // መዝሙር
    /\bmezmur\b/i.test(hay) ||
    /\bhymn\b/i.test(hay)
  )
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

/** POST /api/chat — used for English intents and Amharic Bible references. */
async function postChat(message: string, signal?: AbortSignal): Promise<SearchBuddyApiResponse> {
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

function isResolvedBibleStructured(response: SearchBuddyApiResponse): boolean {
  if (response.type !== 'bible_reference' && response.type !== 'bible_chapter') {
    return false
  }
  return !isEmptySearchBuddyResponse(response)
}

function asPrayerSearch(query: string, payload: unknown): SearchBuddyApiResponse | null {
  if (!isRecord(payload)) return null
  const results = Array.isArray(payload.results) ? (payload.results as PrayerRow[]) : []
  if (!results.length) return null
  return { type: 'prayer_search', query, results }
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
  const full = await fetchHymnsSearchApi(normalized, { limit: 12, signal })
  if (full.results.length) {
    return { type: 'hymn_search', query: normalized, results: full.results }
  }

  const tokens = normalized.split(/\s+/).filter((t) => t.length >= 2)
  const merged: HymnRow[] = []
  const seen = new Set<string>()
  for (const token of tokens) {
    const part = await fetchHymnsSearchApi(token, { limit: 8, signal })
    for (const row of part.results) {
      const key = String(row.slug || row.id || row.title_amharic || row.title || '')
      if (!key || seen.has(key)) continue
      seen.add(key)
      merged.push(row)
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
 * Amharic / Ethiopic structured Search Buddy path.
 *
 * Priority:
 * 1. Calendar / fasting / synaxarium today intents
 * 2. Bible-reference signals → POST /api/chat with the raw transcript (before hymns)
 * 3. Hymns only when the query is not Bible-like (or user explicitly asked for hymns)
 * 4. Prayers / keyword bible_search / synaxarium search
 */
export async function resolveAmharicStructuredSearch(
  rawMessage: string,
  signal?: AbortSignal,
): Promise<SearchBuddyApiResponse | null> {
  if (!containsEthiopic(rawMessage)) return null

  // Keep ASR wording for /api/chat; only collapse whitespace.
  const rawForChat = rawMessage.replace(/\s+/g, ' ').trim()
  const normalized = normalizeAmharicSearchText(rawMessage)
  if (!normalized && !rawForChat) {
    return UNKNOWN_AMHARIC
  }

  const intent = matchAmharicIntent(normalized || rawForChat)
  if (intent) {
    if (intent.englishChat) {
      try {
        const viaChat = await postChat(intent.englishChat, signal)
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

  const bibleLike = looksLikeAmharicBibleReference(rawForChat)
  const wantsHymns = explicitlyAsksForHymns(rawForChat)

  // Bible references MUST resolve before hymn search.
  if (bibleLike) {
    try {
      const bibleChat = await postChat(rawForChat, signal)
      if (isResolvedBibleStructured(bibleChat)) {
        return bibleChat
      }
    } catch {
      /* try keyword bible GET next */
    }

    try {
      const bibleApi = await fetchBibleSearchApi(normalized || rawForChat, {
        language: 'am',
        limit: 12,
        signal,
      })
      if (bibleApi.results.length) {
        return { type: 'bible_search', query: normalized || rawForChat, results: bibleApi.results }
      }
    } catch {
      /* gateway blip — do not abort the whole Amharic route */
    }

    // Bible-looking query: never fall through to hymns unless user asked for hymns.
    if (!wantsHymns) {
      return UNKNOWN_AMHARIC
    }
  }

  // Hymn search only for non-Bible queries (or explicit hymn asks).
  if (!bibleLike || wantsHymns) {
    try {
      const hymn = await searchHymnsAmharic(normalized || rawForChat, signal)
      if (hymn) return hymn
    } catch {
      /* continue */
    }
  }

  try {
    const prayerPayload = await getJson(
      `/api/prayers/search?q=${encodeURIComponent(normalized || rawForChat)}&limit=12`,
      signal,
    )
    const prayer = asPrayerSearch(normalized || rawForChat, prayerPayload)
    if (prayer) return prayer
  } catch {
    /* continue */
  }

  if (!bibleLike) {
    try {
      const bibleApi = await fetchBibleSearchApi(normalized || rawForChat, {
        language: 'am',
        limit: 12,
        signal,
      })
      if (bibleApi.results.length) {
        return { type: 'bible_search', query: normalized || rawForChat, results: bibleApi.results }
      }
    } catch {
      /* continue */
    }
  }

  try {
    const synPayload = await getJson(
      `/api/synaxarium/search?q=${encodeURIComponent(normalized || rawForChat)}&limit=12`,
      signal,
    )
    const syn = asSynaxariumSearch(normalized || rawForChat, synPayload)
    if (syn) return syn
  } catch {
    /* continue */
  }

  return UNKNOWN_AMHARIC
}

export function shouldUseAmharicStructuredPath(message: string): boolean {
  return containsEthiopic(message)
}
