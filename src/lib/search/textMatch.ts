/**
 * Shared, dependency-free text matching for lyric and verse search (Mezmur page, Bible page, Search Buddy).
 *
 * It only DECIDES whether stored text matches a query and WHERE, so callers can show the stored passage with
 * the matching words highlighted. It never rewrites, translates or invents text: every returned excerpt is a
 * slice of the stored string and every highlight range points into that slice.
 *
 * Matching is word-aligned. Both sides are folded per word (Unicode NFKC, case, diacritics, Ethiopic
 * punctuation/spacing, Ethiopic orthographic variant families, and a few conservative Latin transliteration
 * variants) so folding never changes word boundaries or offsets.
 */

// Ethiopic letters that are interchangeable in common orthographic variation (ሐ/ሀ/ኀ, ሠ/ሰ, ጸ/ፀ, አ/ዐ ...).
// Same families as backend/app/main.py normalize_hymn_search_text so the API and the browser agree.
const ETHIOPIC_VARIANTS: Record<string, string> = {
  'ሐ': 'ሀ', 'ኀ': 'ሀ', 'ሑ': 'ሁ', 'ኁ': 'ሁ', 'ሒ': 'ሂ', 'ኂ': 'ሂ', 'ሓ': 'ሃ', 'ኃ': 'ሃ',
  'ሔ': 'ሄ', 'ኄ': 'ሄ', 'ሕ': 'ህ', 'ኅ': 'ህ', 'ሖ': 'ሆ', 'ኆ': 'ሆ',
  'ሠ': 'ሰ', 'ሡ': 'ሱ', 'ሢ': 'ሲ', 'ሣ': 'ሳ', 'ሤ': 'ሴ', 'ሥ': 'ስ', 'ሦ': 'ሶ',
  'ፀ': 'ጸ', 'ፁ': 'ጹ', 'ፂ': 'ጺ', 'ፃ': 'ጻ', 'ፄ': 'ጼ', 'ፅ': 'ጽ', 'ፆ': 'ጾ',
  'ዐ': 'አ', 'ዑ': 'ኡ', 'ዒ': 'ኢ', 'ዓ': 'ኣ', 'ዔ': 'ኤ', 'ዕ': 'እ', 'ዖ': 'ኦ',
}
const VARIANT_CHARS = new Set([...Object.keys(ETHIOPIC_VARIANTS), ...Object.values(ETHIOPIC_VARIANTS)])
const ETHIOPIC = /[\u1200-\u139f\u2d80-\u2ddf\uab00-\uab2f]/u

// Small English function-word list: a query matches on its meaningful words, not on "the" and "of".
const STOPWORDS = new Set(['a', 'an', 'and', 'the', 'of', 'to', 'in', 'on', 'is', 'it', 'at', 'by', 'or', 'as', 'be', 'my', 'me', 'we', 'he', 'his', 'her', 'for', 'with', 'that', 'this', 'you', 'your', 'are', 'was'])

const WORD = /[\p{L}\p{N}][\p{L}\p{N}\p{M}]*(?:['’ʼ][\p{L}\p{N}\p{M}]+)*/gu

/** Fold one word for comparison. Conservative: no phonetic guessing beyond the documented rules. */
export function foldWord(raw: string): string {
  let word = raw.normalize('NFKC').toLowerCase().normalize('NFD').replace(/\p{M}/gu, '')
  word = word.replace(/['’ʼʾʿ`´]/g, '')
  let out = ''
  for (const char of word) out += ETHIOPIC_VARIANTS[char] ?? char
  // Latin transliteration spelling variants: ph/f, ck/k, doubled letters (selam/sselam, tsion/tssion).
  if (!ETHIOPIC.test(out)) out = out.replace(/ph/g, 'f').replace(/ck/g, 'k').replace(/([a-z])\1+/g, '$1')
  return out
}

export type WordSpan = { start: number; end: number; folded: string }

/** Words of `text` with their offsets in `text`. Ethiopic punctuation and word spaces are separators. */
export function wordSpans(text: string): WordSpan[] {
  const spans: WordSpan[] = []
  for (const match of text.matchAll(WORD)) {
    const folded = foldWord(match[0])
    if (folded) spans.push({ start: match.index ?? 0, end: (match.index ?? 0) + match[0].length, folded })
  }
  return spans
}

/** Folded query words in order (duplicates kept for phrase matching). */
export function queryWords(query: string): string[] {
  return wordSpans(query).map((span) => span.folded)
}

function isStopword(word: string): boolean {
  return STOPWORDS.has(word)
}

/** True when a stored word satisfies a query word: equal, or a prefix either way (typing, inflection, suffixes). */
export function wordMatches(stored: string, term: string): boolean {
  if (stored === term) return true
  const shorter = stored.length < term.length ? stored : term
  const minimum = ETHIOPIC.test(shorter) ? 3 : 4
  if (term.length >= 3 && stored.startsWith(term)) return true // user typed a stem/prefix
  return shorter.length >= minimum && (stored.startsWith(term) || term.startsWith(stored))
}

export type TextMatch = {
  /** `phrase`: every query word, consecutively. `words`: enough of the meaningful query words. */
  kind: 'phrase' | 'words'
  matched: number
  total: number
  /** Highlight ranges [start, end) into the SAME string that was passed to matchText. */
  ranges: Array<[number, number]>
}

/** Find where `query` matches inside `text`, or null. `text` is never modified. */
export function matchText(text: string, query: string): TextMatch | null {
  const terms = queryWords(query)
  if (!terms.length || !text) return null
  const spans = wordSpans(text)
  if (!spans.length) return null

  // 1. Consecutive phrase.
  for (let i = 0; i + terms.length <= spans.length; i += 1) {
    if (terms.every((term, k) => wordMatches(spans[i + k].folded, term))) {
      return { kind: 'phrase', matched: terms.length, total: terms.length, ranges: spans.slice(i, i + terms.length).map((s) => [s.start, s.end] as [number, number]) }
    }
  }

  // 2. Enough of the meaningful words, close together.
  const significant = terms.filter((term) => !isStopword(term))
  if (!significant.length) return null // only function words: a phrase may match, scattered words may not
  const unique = [...new Set(significant)]
  const required = unique.length === 1 ? 1 : Math.max(2, Math.ceil(unique.length * 0.6))
  const hits: Array<{ term: string; span: WordSpan; index: number }> = []
  for (let index = 0; index < spans.length; index += 1) {
    const span = spans[index]
    for (const term of unique) if (wordMatches(span.folded, term)) hits.push({ term, span, index })
  }
  if (!hits.length) return null

  // Sliding window over hits: O(words * query terms), including long lyrics.
  let right = 0
  let bestStart = 0
  let bestEnd = 0
  let bestDistinct = 0
  const counts = new Map<string, number>()
  for (let left = 0; left < hits.length; left += 1) {
    while (right < hits.length && hits[right].index < hits[left].index + 16) {
      counts.set(hits[right].term, (counts.get(hits[right].term) ?? 0) + 1)
      right += 1
    }
    if (counts.size > bestDistinct) {
      bestDistinct = counts.size
      bestStart = left
      bestEnd = right
    }
    const remaining = (counts.get(hits[left].term) ?? 1) - 1
    if (remaining) counts.set(hits[left].term, remaining)
    else counts.delete(hits[left].term)
  }
  const distinct = bestDistinct
  if (distinct < required) return null
  const best = hits.slice(bestStart, bestEnd)
  return { kind: 'words', matched: distinct, total: unique.length, ranges: best.map((hit) => [hit.span.start, hit.span.end] as [number, number]) }
}

export type Excerpt = { text: string; ranges: Array<[number, number]>; kind: TextMatch['kind'] }

/**
 * A readable slice of `text` around the first match. `text` is whitespace-flattened for display
 * (offsets in the returned ranges refer to the returned excerpt text) and ellipses mark truncation.
 */
export function buildExcerpt(text: string, query: string, maxChars = 180): Excerpt | null {
  const flat = text.replace(/\s+/g, ' ').trim()
  const match = matchText(flat, query)
  if (!match) return null
  const first = match.ranges[0][0]
  let start = Math.max(0, first - Math.floor(maxChars / 3))
  if (start > 0) {
    const space = flat.lastIndexOf(' ', start)
    start = space >= 0 && first - space < maxChars ? space + 1 : start
  }
  let end = Math.min(flat.length, start + maxChars)
  if (end < flat.length) {
    const space = flat.lastIndexOf(' ', end)
    if (space > first) end = space
  }
  const prefix = start > 0 ? '…' : ''
  const suffix = end < flat.length ? '…' : ''
  const slice = flat.slice(start, end)
  const shift = prefix.length - start
  const ranges = match.ranges
    .filter(([from, to]) => from >= start && to <= end)
    .map(([from, to]) => [from + shift, to + shift] as [number, number])
  return { text: prefix + slice + suffix, ranges, kind: match.kind }
}

/** Escape a user string for a PostgREST/Postgres ILIKE pattern, widening Ethiopic variant letters to `_`. */
export function ilikePart(raw: string): string {
  let out = ''
  for (const char of raw.normalize('NFC').toLowerCase()) {
    if (VARIANT_CHARS.has(char)) out += '_'
    else if (char === '%' || char === '\\' || char === '_' || char === '*' || char === '"') out += ''
    else out += char
  }
  return out
}

/** The longest distinctive query words (raw, lowercase) used to bound database candidate retrieval. */
export function retrievalWords(query: string, max = 3): string[] {
  const words = [...query.matchAll(WORD)].map((match) => match[0].normalize('NFC').toLowerCase())
  const meaningful = words.filter((word) => !isStopword(foldWord(word)) && (ETHIOPIC.test(word) ? word.length >= 2 : word.length >= 3))
  const pool = meaningful.length ? meaningful : words
  return [...new Set(pool)].sort((a, b) => b.length - a.length).slice(0, max)
}

/** PostgREST `or=` value for ILIKE over several columns; the value is quoted so spaces/commas are safe. */
export function orIlike(columns: string[], term: string): string {
  const pattern = ilikePart(term)
  if (!pattern.replace(/_/g, '')) return '' // nothing but wildcards: would match every row
  return columns.map((column) => `${column}.ilike."*${pattern}*"`).join(',')
}

/** True when the string contains Ethiopic script. */
export const hasEthiopic = (value: string) => ETHIOPIC.test(value)
