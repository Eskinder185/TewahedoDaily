import type { SearchBuddyApiResponse } from '../searchBuddy/apiTypes.ts'

/**
 * Short conversational lead-in for structured results.
 * English copy only — never invents Amharic religious content.
 */
export function assistantLeadForResponse(
  response: SearchBuddyApiResponse | null | undefined,
  empty?: boolean,
): string {
  if (!response) return ''
  if (empty) return "I couldn't find a matching result yet."

  switch (response.type) {
    case 'fasting_today':
    case 'fast_today':
    case 'calendar_fast':
      return "Here is today's fasting information."
    case 'calendar_today':
    case 'calendar_day':
      return "Here is today's church calendar."
    case 'season_today':
    case 'calendar_season':
      return "Here is today's liturgical season."
    case 'ethiopian_date_today':
      return "Here is today's Ethiopian date."
    case 'synaxarium_today':
      return "Here are today's commemorations."
    case 'synaxarium_search':
    case 'synaxarium_day':
      return 'Here is what I found in the Synaxarium.'
    case 'bible_reference': {
      const ref =
        typeof response.reference === 'string' && response.reference.trim()
          ? response.reference.trim()
          : ''
      return ref ? `Here is ${ref}.` : 'Here is the Scripture I found.'
    }
    case 'bible_chapter':
    case 'bible_search':
      return 'Here is the Scripture I found.'
    case 'hymn_search':
    case 'hymn_occasion':
      return 'Here are the hymns I found.'
    case 'prayer_search':
    case 'prayer_collection':
    case 'prayer_section':
      return 'Here are the prayers I found.'
    case 'ai':
      return ''
    case 'unknown':
      return typeof response.message === 'string' && response.message.trim()
        ? response.message.trim()
        : "I couldn't find a matching result yet."
    default:
      return 'Here is what I found.'
  }
}
