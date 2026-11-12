/**
 * People type requests, not just keywords: "find the hymn with the words …", "mezmur that says …", "ዮሐንስ 3:16 ፈልግ".
 * extractSearchRequest separates the request wrapper from the thing to look for, on a search representation only.
 * The original text is kept by the caller; nothing here rewrites stored content.
 */
export type SearchRequest = {
  /** The text to search for, with the wrapper removed. Equals the input when no wrapper was found. */
  text: string
  /** What the person said they want, when they said so. */
  wants: 'lyric' | 'title' | 'scripture' | null
  /** True when a wrapper was removed. */
  wrapped: boolean
}

const LEAD = '(?:(?:please|can you|could you|i (?:want|need|am looking|\'m looking) (?:to find|for))\\s+)?(?:find|search(?: for)?|look(?:ing)? for|show(?: me)?|get|open|play|where is)'
const OBJECT = '(?:(?:the|a|an|that)\\s+)?(?:hymn|mezmur|mezmur|song|chant|lyrics?|verse)s?'
const LYRIC_CUE = '(?:(?:with|having|containing|that (?:says?|goes|has|contains|starts?(?: with)?|begins?(?: with)?)|which (?:says?|goes|has)|saying|lines?|words?|starting with|beginning with)\\s+)+(?:(?:the|these)\\s+)?(?:(?:words?|lyrics?|lines?|phrase)\\s*)?(?:of\\s+)?'
const SCRIPTURE = /\b(?:verse|chapter|bible|scripture)\b/i

export function extractSearchRequest(input: string): SearchRequest {
  const original = input.replace(/\s+/g, ' ').trim()
  let text = original.replace(/^["“'‘]+|["”'’]+$/g, '')
  let wants: SearchRequest['wants'] = null

  const full = new RegExp(`^${LEAD}\\s+${OBJECT}\\s+${LYRIC_CUE}(.+)$`, 'i').exec(text)
  const cueOnly = new RegExp(`^${OBJECT}\\s+${LYRIC_CUE}(.+)$`, 'i').exec(text)
  const named = new RegExp(`^${LEAD}\\s+${OBJECT}\\s+(?:called|named|titled|entitled)\\s+(.+)$`, 'i').exec(text)
  const bare = new RegExp(`^${LEAD}\\s+(?:${OBJECT}\\s+)?(.+)$`, 'i').exec(text)

  if (full?.[1]) { text = full[1]; wants = 'lyric' }
  else if (cueOnly?.[1]) { text = cueOnly[1]; wants = 'lyric' }
  else if (named?.[1]) { text = named[1]; wants = 'title' }
  else if (bare?.[1] && !SCRIPTURE.test(original)) { text = bare[1] }
  else if (bare?.[1]) { text = bare[1]; wants = 'scripture' }

  text = text.replace(/^["“'‘]+|["”'’]+$/g, '').replace(/\s*[.?!።]+$/, '').trim()
  if (!text) return { text: original, wants: null, wrapped: false }
  return { text, wants, wrapped: text !== original.replace(/^["“'‘]+|["”'’]+$/g, '') }
}
