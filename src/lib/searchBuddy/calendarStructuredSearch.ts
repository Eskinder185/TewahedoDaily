/**
 * Direct Search Buddy → FastAPI calendar / synaxarium day routing.
 * Backend payloads are the source of truth — never invent feast content.
 */
import { AI_TIMEOUTS_MS } from '../ai/aiConfig.ts'
import { aiFetch } from '../ai/aiClient.ts'
import { ETHIOPIAN_MONTH_NAMES } from '../ethiopianDate.ts'
import { ethMonthFromEnglishName } from '../eotcCalendar/eotcEthiopianMonthNames.ts'
import { normalizeAmharicSearchText } from './amharicText.ts'
import { parseSearchBuddyResponse } from './parseSearchBuddyResponse.ts'
import type { SearchBuddyApiResponse } from './apiTypes.ts'

export type CalendarFocus = 'general' | 'fasting' | 'season'

export type CalendarRoute =
  | { kind: 'synaxarium_today' }
  | { kind: 'calendar_today'; focus: CalendarFocus }
  | { kind: 'calendar_date'; dateValue: string; focus: CalendarFocus }
  | { kind: 'calendar_day'; month: number; day: number }
  | { kind: 'calendar_search'; query: string }

/** Normalize common ASR / spelling variants for feast·fast·today intents. */
export function normalizeCalendarIntentText(text: string): string {
  let hay = normalizeAmharicSearchText(text)
  if (!hay) {
    hay = (text || '').replace(/\s+/g, ' ').trim().toLowerCase()
  }
  if (!hay) return ''
  // በአሉ → በዓሉ, በአል → በዓል
  hay = hay.replace(/\u1260\u12A0\u1209/g, '\u1260\u12D3\u1209')
  hay = hay.replace(/\u1260\u12A0\u120D/g, '\u1260\u12D3\u120D')
  // ፆም → ጾም
  hay = hay.replace(/\u1346\u121D/g, '\u133E\u121D')
  // ምንድዳው / ምንድን ነው → ምንድነው
  hay = hay.replace(/\u121D\u1295\u12F5\u12F3\u12CD/g, '\u121D\u1295\u12F5\u1290\u12CD')
  hay = hay.replace(/\u121D\u1295\u12F5\u1295\s+\u1290\u12CD/g, '\u121D\u1295\u12F5\u1290\u12CD')
  return hay.replace(/\s+/g, ' ').trim()
}

const TODAY_SIGNALS = [
  '\u12DB\u122C', // ዛሬ
  '\u12E8\u12DB\u122C', // የዛሬ
  'today',
] as const

const TOMORROW_SIGNALS = [
  '\u1290\u1308', // ነገ
  'tomorrow',
] as const

const FEAST_SIGNALS = [
  '\u1260\u12D3\u120D', // በዓል
  '\u1260\u12D3\u1209', // በዓሉ
  'feast',
  'observance',
] as const

const FAST_SIGNALS = [
  '\u133E\u121D', // ጾም
  '\u1346\u121D', // ፆም
  'fasting',
  'fast',
] as const

const SEASON_SIGNALS = ['liturgical season', 'liturgical', 'season'] as const

const WHAT_SIGNALS = [
  '\u121D\u1295\u12F5\u1290\u12CD', // ምንድነው
  '\u121D\u1295\u12F5\u1295', // ምንድን
  '\u121D\u1295\u12F5\u12F3\u12CD', // ምንድዳው
  '\u121D\u1295', // ምን
  'what',
] as const

const SYNAXARIUM_SIGNALS = [
  '\u1235\u1295\u12AD\u1233\u122D', // ስንክሳር
  'synaxarium',
] as const

const MONTH_NAME_PATTERN = ETHIOPIAN_MONTH_NAMES.join('|')

function includesAny(hay: string, signals: readonly string[]): boolean {
  const lower = hay.toLowerCase()
  return signals.some((s) => lower.includes(s.toLowerCase()))
}

function isRecord(value: unknown): value is Record<string, unknown> {
  return Boolean(value) && typeof value === 'object' && !Array.isArray(value)
}

export function userTimezone(): string {
  return typeof Intl !== 'undefined'
    ? Intl.DateTimeFormat().resolvedOptions().timeZone || 'UTC'
    : 'UTC'
}

/** Today's calendar date (YYYY-MM-DD) in the given IANA timezone. */
export function gregorianYmdInTimezone(timeZone: string, dayOffset = 0): string {
  const formatter = new Intl.DateTimeFormat('en-CA', {
    timeZone,
    year: 'numeric',
    month: '2-digit',
    day: '2-digit',
  })
  const today = formatter.format(new Date())
  if (!dayOffset) return today
  const [y, m, d] = today.split('-').map((part) => Number(part))
  const utc = new Date(Date.UTC(y, m - 1, d + dayOffset))
  const yy = utc.getUTCFullYear()
  const mm = String(utc.getUTCMonth() + 1).padStart(2, '0')
  const dd = String(utc.getUTCDate()).padStart(2, '0')
  return `${yy}-${mm}-${dd}`
}

function parseGregorianDateValue(hay: string): string | null {
  const iso = hay.match(/\b(20\d{2}|19\d{2})-(\d{1,2})-(\d{1,2})\b/)
  if (iso) {
    const y = iso[1]
    const m = String(Number(iso[2])).padStart(2, '0')
    const d = String(Number(iso[3])).padStart(2, '0')
    return `${y}-${m}-${d}`
  }
  const slash = hay.match(/\b(\d{1,2})[\/.](\d{1,2})[\/.](20\d{2}|19\d{2})\b/)
  if (slash) {
    const m = String(Number(slash[1])).padStart(2, '0')
    const d = String(Number(slash[2])).padStart(2, '0')
    return `${slash[3]}-${m}-${d}`
  }
  return null
}

function parseEthiopianMonthDay(hay: string): { month: number; day: number } | null {
  const re = new RegExp(`\\b(${MONTH_NAME_PATTERN})\\s+(\\d{1,2})\\b`, 'i')
  const match = hay.match(re)
  if (!match) return null
  const month = ethMonthFromEnglishName(match[1])
  const day = Number(match[2])
  if (!month || !Number.isFinite(day) || day < 1 || day > 30) return null
  return { month, day }
}

function detectFocus(hay: string): CalendarFocus {
  if (includesAny(hay, FAST_SIGNALS) || /\bfast(?:ing)?\b/i.test(hay)) return 'fasting'
  if (includesAny(hay, SEASON_SIGNALS) && !includesAny(hay, FEAST_SIGNALS)) return 'season'
  return 'general'
}

function hasCalendarDomainSignal(hay: string): boolean {
  return (
    includesAny(hay, FEAST_SIGNALS) ||
    includesAny(hay, FAST_SIGNALS) ||
    includesAny(hay, SEASON_SIGNALS) ||
    includesAny(hay, WHAT_SIGNALS) ||
    /\bobservance\b/i.test(hay) ||
    /\bliturgical\b/i.test(hay)
  )
}

/**
 * Detect structured calendar / synaxarium-day routing.
 * Synaxarium-today is separate from calendar endpoints.
 */
export function detectCalendarRoute(text: string): CalendarRoute | null {
  const hay = normalizeCalendarIntentText(text)
  if (!hay) return null

  const hasToday = includesAny(hay, TODAY_SIGNALS)
  const hasTomorrow = includesAny(hay, TOMORROW_SIGNALS)
  const hasFeast = includesAny(hay, FEAST_SIGNALS)
  const hasFast = includesAny(hay, FAST_SIGNALS)
  const hasSynax = includesAny(hay, SYNAXARIUM_SIGNALS)
  const hasWhat = includesAny(hay, WHAT_SIGNALS)
  const focus = detectFocus(hay)

  // Synaxarium today — not calendar, not hymns
  if (
    (hasToday && hasSynax) ||
    /\btoday'?s?\s+synaxarium\b/i.test(hay) ||
    /\bsynaxarium\s+today\b/i.test(hay)
  ) {
    return { kind: 'synaxarium_today' }
  }

  // English phrase shortcuts
  if (/\btomorrow'?s?\s+feast\b/i.test(hay) || /\bfeast\s+tomorrow\b/i.test(hay)) {
    return {
      kind: 'calendar_date',
      dateValue: gregorianYmdInTimezone(userTimezone(), 1),
      focus: 'general',
    }
  }
  if (/\btoday'?s?\s+feast\b/i.test(hay) || /\bfeast\s+today\b/i.test(hay)) {
    return { kind: 'calendar_today', focus: 'general' }
  }
  if (/\bfast(?:ing)?\s+today\b/i.test(hay) || /\btoday'?s?\s+fast\b/i.test(hay)) {
    return { kind: 'calendar_today', focus: 'fasting' }
  }

  const gregorian = parseGregorianDateValue(hay)
  if (gregorian && hasCalendarDomainSignal(hay)) {
    return { kind: 'calendar_date', dateValue: gregorian, focus }
  }

  const ethDay = parseEthiopianMonthDay(hay)
  if (ethDay && (hasCalendarDomainSignal(hay) || !hasSynax)) {
    // Bare "Meskerem 17" is a calendar day lookup
    if (!hasSynax || hasFeast || hasFast || hasWhat) {
      return { kind: 'calendar_day', month: ethDay.month, day: ethDay.day }
    }
  }

  // Tomorrow + feast/fast/what → /api/calendar/date for tomorrow
  if (hasTomorrow && (hasFeast || hasFast || hasWhat || hasCalendarDomainSignal(hay))) {
    return {
      kind: 'calendar_date',
      dateValue: gregorianYmdInTimezone(userTimezone(), 1),
      focus,
    }
  }

  // Today + feast/fast/what/season → /api/calendar/today
  if (hasToday && (hasFeast || hasFast || hasWhat || includesAny(hay, SEASON_SIGNALS))) {
    return { kind: 'calendar_today', focus }
  }

  // Legacy calendar phrases
  if (
    hay.includes('\u12E8\u12DB\u122C \u1240\u1295') ||
    hay.includes('\u12DB\u122C \u121D\u1295 \u1240\u1295')
  ) {
    return { kind: 'calendar_today', focus: 'general' }
  }

  // General calendar text search (feast/fast/observance names) — not hymn fallback
  if ((hasFeast || hasFast || includesAny(hay, SEASON_SIGNALS) || /\bobservance\b/i.test(hay)) && !hasSynax) {
    const query = cleanCalendarSearchQuery(hay)
    if (query.length >= 2) {
      return { kind: 'calendar_search', query }
    }
  }

  return null
}

/** Strip intent filler words so /api/calendar/search matches feast names (e.g. Meskel). */
function cleanCalendarSearchQuery(hay: string): string {
  return hay
    .replace(/\b(what|is|the|a|an|about|tell|me|please|today|tomorrow|feast|fasting|fast|observance|liturgical|season)\b/gi, ' ')
    .replace(/\u12DB\u122C|\u12E8\u12DB\u122C|\u1290\u1308/g, ' ')
    .replace(/\u1260\u12D3\u120D|\u1260\u12D3\u1209/g, ' ')
    .replace(/\u133E\u121D|\u1346\u121D/g, ' ')
    .replace(/\u121D\u1295\u12F5\u1290\u12CD|\u121D\u1295\u12F5\u1295|\u121D\u1295\u12F5\u12F3\u12CD|\u121D\u1295/g, ' ')
    .replace(/\s+/g, ' ')
    .trim()
}

const UNKNOWN_CALENDAR: SearchBuddyApiResponse = {
  type: 'unknown',
  message: "I couldn't find a matching result yet.",
}

/** Backward-compatible today/fast/synax detector used by older tests. */
export function detectCalendarTodayIntent(
  text: string,
): 'calendar_today' | 'fasting_today' | 'synaxarium_today' | null {
  const route = detectCalendarRoute(text)
  if (!route) return null
  if (route.kind === 'synaxarium_today') return 'synaxarium_today'
  if (route.kind === 'calendar_today' || route.kind === 'calendar_date') {
    return route.focus === 'fasting' ? 'fasting_today' : 'calendar_today'
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

function hasStructuredCalendarPayload(payload: unknown): boolean {
  if (!isRecord(payload)) return false
  if (Array.isArray(payload.results) && payload.results.length > 0) return true
  if (Array.isArray(payload.observances) && payload.observances.length > 0) return true
  if (Array.isArray(payload.synaxarium) && payload.synaxarium.length > 0) return true
  if (Array.isArray(payload.monthly_commemorations) && payload.monthly_commemorations.length > 0) {
    return true
  }
  const keys = [
    'gregorian_date',
    'ethiopian_label',
    'ethiopian_date',
    'primary_observance',
    'active_fast',
    'fasting_status',
    'season',
    'synaxarium_day',
    'ethiopian_month_number',
  ]
  return keys.some((key) => {
    const value = payload[key]
    if (typeof value === 'string') return Boolean(value.trim())
    return value !== null && value !== undefined
  })
}

function asCalendarTyped(
  payload: unknown,
  type: 'calendar_today' | 'calendar_day' | 'fasting_today' | 'season_today',
): SearchBuddyApiResponse | null {
  if (!hasStructuredCalendarPayload(payload)) return null
  const base = isRecord(payload) ? payload : {}
  return parseSearchBuddyResponse({ ...base, type })
}

function asCalendarSearch(query: string, payload: unknown): SearchBuddyApiResponse | null {
  if (!isRecord(payload)) return null
  const results = Array.isArray(payload.results) ? payload.results : []
  if (!results.length) return null
  return parseSearchBuddyResponse({
    type: 'calendar_search',
    query: typeof payload.query === 'string' ? payload.query : query,
    count: typeof payload.count === 'number' ? payload.count : results.length,
    results,
  })
}

function asSynaxariumToday(payload: unknown): SearchBuddyApiResponse | null {
  if (!isRecord(payload)) return null
  const day = isRecord(payload.day) ? payload.day : null
  const commemorations = Array.isArray(payload.commemorations)
    ? payload.commemorations
    : Array.isArray(payload.results)
      ? payload.results
      : []
  if (!day && !commemorations.length) return null
  return parseSearchBuddyResponse({
    type: 'synaxarium_today',
    commemorations,
    title:
      textOrNull(day?.display_date_english) ||
      textOrNull(day?.title) ||
      textOrNull(payload.title),
    title_amharic: textOrNull(day?.display_date_amharic) || textOrNull(payload.title_amharic),
    display_date_english: textOrNull(day?.display_date_english),
    display_date_amharic: textOrNull(day?.display_date_amharic),
    day_slug: textOrNull(day?.slug),
    day,
  })
}

function textOrNull(value: unknown): string | null {
  if (typeof value !== 'string') return null
  const trimmed = value.trim()
  return trimmed || null
}

async function fetchCalendarToday(signal?: AbortSignal): Promise<unknown> {
  const tz = encodeURIComponent(userTimezone())
  return getJson(`/api/calendar/today?tz=${tz}`, signal)
}

async function fetchCalendarDate(dateValue: string, signal?: AbortSignal): Promise<unknown> {
  return getJson(`/api/calendar/date?date_value=${encodeURIComponent(dateValue)}`, signal)
}

async function fetchCalendarDay(
  month: number,
  day: number,
  signal?: AbortSignal,
): Promise<unknown> {
  return getJson(`/api/calendar/day?month=${month}&day=${day}`, signal)
}

async function fetchCalendarSearch(query: string, signal?: AbortSignal): Promise<unknown> {
  return getJson(`/api/calendar/search?q=${encodeURIComponent(query)}&limit=12`, signal)
}

async function resolveSynaxariumToday(signal?: AbortSignal): Promise<SearchBuddyApiResponse | null> {
  // Use backend today (timezone-aware) to pick Ethiopian month/day, then synaxarium day API.
  const today = await fetchCalendarToday(signal)
  if (!isRecord(today)) return null
  const eth = isRecord(today.ethiopian_date) ? today.ethiopian_date : null
  const synaxariumDay = isRecord(today.synaxarium_day) ? today.synaxarium_day : null
  const monthName =
    textOrNull(eth?.month_name) ||
    (typeof eth?.month === 'number'
      ? ETHIOPIAN_MONTH_NAMES[eth.month - 1]
      : null) ||
    textOrNull(synaxariumDay?.ethiopian_month)
  const dayNum =
    typeof eth?.day === 'number'
      ? eth.day
      : typeof synaxariumDay?.ethiopian_day === 'number'
        ? synaxariumDay.ethiopian_day
        : null
  if (!monthName || dayNum == null) return null

  const payload = await getJson(
    `/api/synaxarium/day?month=${encodeURIComponent(monthName)}&day=${dayNum}`,
    signal,
  )
  return asSynaxariumToday(payload)
}

function responseTypeForFocus(
  focus: CalendarFocus,
): 'calendar_today' | 'fasting_today' | 'season_today' {
  if (focus === 'fasting') return 'fasting_today'
  if (focus === 'season') return 'season_today'
  return 'calendar_today'
}

/**
 * Resolve calendar / synaxarium-day structured Search Buddy responses.
 * Returns null when the query is not calendar-shaped.
 * When calendar-shaped: returns structured data or unknown — never null after routing
 * (callers must STOP; no hymn / AI feast invention).
 */
export async function resolveCalendarStructuredSearch(
  rawMessage: string,
  options?: { signal?: AbortSignal },
): Promise<SearchBuddyApiResponse | null> {
  const signal = options?.signal
  const route = detectCalendarRoute(rawMessage)
  if (!route) return null

  try {
    if (route.kind === 'synaxarium_today') {
      return (await resolveSynaxariumToday(signal)) || UNKNOWN_CALENDAR
    }

    if (route.kind === 'calendar_today') {
      const payload = await fetchCalendarToday(signal)
      return asCalendarTyped(payload, responseTypeForFocus(route.focus)) || UNKNOWN_CALENDAR
    }

    if (route.kind === 'calendar_date') {
      const payload = await fetchCalendarDate(route.dateValue, signal)
      return asCalendarTyped(payload, responseTypeForFocus(route.focus)) || UNKNOWN_CALENDAR
    }

    if (route.kind === 'calendar_day') {
      const payload = await fetchCalendarDay(route.month, route.day, signal)
      return asCalendarTyped(payload, 'calendar_day') || UNKNOWN_CALENDAR
    }

    if (route.kind === 'calendar_search') {
      const payload = await fetchCalendarSearch(route.query, signal)
      const hit = asCalendarSearch(route.query, payload)
      if (hit) return hit
      // Retry original cleaned text if filler stripping over-trimmed
      const fallbackQ = normalizeCalendarIntentText(rawMessage)
      if (fallbackQ && fallbackQ !== route.query) {
        const retry = asCalendarSearch(
          fallbackQ,
          await fetchCalendarSearch(fallbackQ, signal),
        )
        if (retry) return retry
      }
      return UNKNOWN_CALENDAR
    }
  } catch {
    return UNKNOWN_CALENDAR
  }

  return UNKNOWN_CALENDAR
}

/** True when Ethiopic text should prefer the Amharic structured path. */
export function looksLikeCalendarQuery(text: string): boolean {
  return detectCalendarRoute(text) !== null
}

export function isCalendarStructuredResponse(
  response: SearchBuddyApiResponse | null | undefined,
): boolean {
  if (!response) return false
  return [
    'calendar_today',
    'calendar_day',
    'calendar_search',
    'fasting_today',
    'fast_today',
    'calendar_fast',
    'season_today',
    'calendar_season',
    'ethiopian_date_today',
    'synaxarium_today',
    'synaxarium_day',
  ].includes(response.type)
}
