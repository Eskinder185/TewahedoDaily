import { AI_TIMEOUTS_MS } from '../ai/aiConfig.ts'
import { aiFetch } from '../ai/aiClient.ts'
import { fetchBibleSearchApi } from '../search/structuredSearchApi.ts'
import { resolveBibleQuery } from '../search/resolveBibleQuery.ts'
import { searchHymns } from '../search/searchHymns.ts'
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

export type AmharicStructuredSearchOptions = {
  signal?: AbortSignal
  /**
   * True when Search Buddy is opened from Mezmur Practice (/practice…).
   * Allows hymn API for lyric/title queries that are not Bible-like.
   */
  hymnContext?: boolean
}

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
  '\u121D\u12D5\u122B\u134D',  // chapter
  '\u121D\u12D5\u122B\u1265',  // chapter ASR
  '\u121D\u122B\u134D',  // chapter ASR short
  '\u1241\u1325\u122D',  // verse
  '\u12C8\u1295\u130C\u120D',  // gospel
  '\u12C8\u1295\u1308\u120D',  // gospel ASR
  '\u12CB\u1295\u130C\u120D',  // gospel ASR
  '\u12C8\u1295\u130C\u12F5',  // gospel ASR
] as const

const BIBLE_BOOK_HINTS = [
  '\u12EE\u1210\u1295\u1235',  // John
  '\u12EE\u1200\u1295\u1235',  // John ASR
  '\u12E8\u12EE\u1200\u1295\u1235',  // of John ASR
  '\u12E8\u12EE\u1210\u1295\u1235',  // of John
  '\u12D8\u134D\u1325\u1228\u1275',  // Genesis
  '\u12A6\u122A\u1275',  // Orit
  '\u121B\u1274\u12CA\u1235',  // Matthew
  '\u121B\u122D\u1246\u1235',  // Mark
  '\u1209\u1243\u1235',  // Luke
  '\u122E\u121C',  // Romans
  '\u12D8\u132D\u12A0\u1275',  // Exodus
  '\u12D8\u120C\u12CA\u1275',  // Leviticus
  '\u12D8\u1219\u12CA\u1275',  // Numbers
  '\u12D8\u12D3\u130D\u120D',  // Deuteronomy
  '\u1218\u12DD\u1219\u122D',  // Psalms / mezmur word when numbered
] as const

const AMHARIC_NUMBER_WORDS = [
  '\u12A0\u1295\u12F5', // አንድ
  '\u1201\u1208\u1275', // ሁለት
  '\u1236\u1235\u1275', // ሶስት
  '\u12A0\u122B\u1275', // አራት
  '\u12A0\u121D\u1235\u1275', // አምስት
  '\u1235\u12F5\u1235\u1275', // ስድስት
  '\u1230\u1263\u1275', // ሰባት
  '\u1235\u121D\u1295\u1275', // ስምንት
  '\u12D8\u1320\u129D', // ዘጠኝ
  '\u12A0\u1235\u122D', // አስር
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

function hasChapterVerseNumberCue(raw: string, hay: string): boolean {
  if (/\d+\s*[\u1365:]\s*\d+/.test(raw)) return true
  if (/\d+/.test(hay)) return true
  return AMHARIC_NUMBER_WORDS.some((w) => hay.includes(w))
}

function hasBibleBookHint(hay: string): boolean {
  return BIBLE_BOOK_HINTS.some((hint) => hay.includes(hint))
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

  // Digit chapter:verse (Ethiopic ፥ or ASCII :)
  if (/\d+\s*[\u1365:]\s*\d+/.test(raw)) return true

  // After normalize (፥ → space): "ዮሐንስ 3 16"
  if (/\d+\s+\d+/.test(hay)) return true

  // Known book name + chapter/verse-like numbers (spoken or digits)
  if (hasBibleBookHint(hay) && hasChapterVerseNumberCue(raw, hay)) {
    return true
  }

  return false
}

export function explicitlyAsksForHymns(text: string): boolean {
  const hay = normalizeAmharicSearchText(text)
  if (!hay) return false

  const hasMezmurWord = hay.includes('\u1218\u12DD\u1219\u122D')
  const hasLatinHymn = /\bmezmur\b/i.test(hay) || /\bhymn\b/i.test(hay)

  // Mezmur + chapter/verse cues means Psalms, not a hymn-library ask.
  if (hasMezmurWord && looksLikeAmharicBibleReference(text) && !hasLatinHymn) {
    return false
  }

  return hasMezmurWord || hasLatinHymn
}

/** Strong title match so Search Buddy does not treat lyrics/noise as hymns. */
export function isConfidentHymnTitleMatch(query: string, hymn: HymnRow): boolean {
  const q = normalizeAmharicSearchText(query).toLowerCase()
  if (!q || q.length < 2) return false
  const titles = [
    hymn.title_amharic,
    hymn.title,
    hymn.title_english,
    hymn.title_transliteration,
  ]
    .map((s) => normalizeAmharicSearchText(String(s || '')).toLowerCase())
    .filter(Boolean)

  for (const t of titles) {
    if (t === q) return true
    if (t.includes(q) || q.includes(t)) {
      if (q.length >= 4 || t.length <= q.length + 2) return true
    }
  }
  return false
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

/** POST /api/chat — English calendar/fasting intent aliases only. */
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

/** Full-query hymn search via shared searchHymns helper (no per-token fallback). */
async function searchHymnsFullQuery(
  query: string,
  signal?: AbortSignal,
): Promise<SearchBuddyApiResponse | null> {
  const q = query.replace(/\s+/g, ' ').trim()
  if (!q) return null
  const full = await searchHymns(q, { limit: 12, signal })
  if (!full.results.length) return null
  return { type: 'hymn_search', query: q, results: full.results }
}

const UNKNOWN_AMHARIC: SearchBuddyApiResponse = {
  type: 'unknown',
  message: "I couldn't find a matching result yet.",
}

/**
 * Amharic / Ethiopic structured Search Buddy path.
 *
 * Strict priority:
 * 1. Calendar / fasting / synaxarium today intents
 * 2. Bible-like → POST /api/chat (raw) → stop on bible_reference / bible_chapter
 * 3. Hymns only when explicit / Mezmur context / confident title match
 * 4. Prefer unknown over the wrong structured domain
 */
export async function resolveAmharicStructuredSearch(
  rawMessage: string,
  signalOrOptions?: AbortSignal | AmharicStructuredSearchOptions,
): Promise<SearchBuddyApiResponse | null> {
  const options: AmharicStructuredSearchOptions =
    signalOrOptions instanceof AbortSignal || signalOrOptions === undefined
      ? { signal: signalOrOptions }
      : signalOrOptions
  const signal = options.signal
  const hymnContext = Boolean(options.hymnContext)

  if (!containsEthiopic(rawMessage)) return null

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

  // Bible references MUST resolve before hymn search — never fall through to hymns.
  if (bibleLike) {
    try {
      const bible = await resolveBibleQuery(rawForChat, { signal })
      if (bible.resolved) {
        return bible.response
      }
      // Backend returned bible_* but empty — still stop; do not run hymns.
      if (
        bible.response.type === 'bible_reference' ||
        bible.response.type === 'bible_chapter'
      ) {
        return bible.response
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
      /* gateway blip */
    }

    // Ambiguous / unresolved Bible-shaped query: prefer no structured domain.
    return UNKNOWN_AMHARIC
  }

  // Hymn routing — not a generic Amharic fallback.
  const queryForHymns = normalized || rawForChat
  if (wantsHymns || hymnContext) {
    try {
      const hymn = await searchHymnsFullQuery(queryForHymns, signal)
      if (hymn) return hymn
    } catch {
      /* continue */
    }
  } else {
    // Search Buddy (non-Mezmur): only confident title matches.
    try {
      const hymn = await searchHymnsFullQuery(queryForHymns, signal)
      const top =
        hymn && hymn.type === 'hymn_search' && Array.isArray(hymn.results)
          ? hymn.results[0]
          : undefined
      if (hymn && top && isConfidentHymnTitleMatch(queryForHymns, top)) {
        return hymn
      }
    } catch {
      /* continue */
    }
  }

  try {
    const prayerPayload = await getJson(
      `/api/prayers/search?q=${encodeURIComponent(queryForHymns)}&limit=12`,
      signal,
    )
    const prayer = asPrayerSearch(queryForHymns, prayerPayload)
    if (prayer) return prayer
  } catch {
    /* continue */
  }

  // Do not run keyword bible_search for non-Bible-like Amharic — that returns the
  // wrong domain for hymn lyrics. Bible keyword search only happens above when bibleLike.

  try {
    const synPayload = await getJson(
      `/api/synaxarium/search?q=${encodeURIComponent(queryForHymns)}&limit=12`,
      signal,
    )
    const syn = asSynaxariumSearch(queryForHymns, synPayload)
    if (syn) return syn
  } catch {
    /* continue */
  }

  return UNKNOWN_AMHARIC
}

export function shouldUseAmharicStructuredPath(message: string): boolean {
  return containsEthiopic(message)
}
