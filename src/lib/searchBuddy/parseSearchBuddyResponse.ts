import {
  KNOWN_SEARCH_BUDDY_TYPES,
  type SearchBuddyApiResponse,
} from './apiTypes.ts'

const STRUCTURED_TYPES = new Set<string>(KNOWN_SEARCH_BUDDY_TYPES)

function isRecord(value: unknown): value is Record<string, unknown> {
  return Boolean(value) && typeof value === 'object' && !Array.isArray(value)
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
