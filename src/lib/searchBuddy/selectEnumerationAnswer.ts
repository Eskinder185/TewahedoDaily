/**
 * Chooses which already-returned Church Library hit to quote as the answer to a
 * list-style question ("What are the five …?", "ዘርዝር …").
 *
 * Pure and deterministic. It never creates, rewrites, merges or translates text:
 * the result is always one of the input hit objects (same reference), or null.
 * A null result means "keep the existing first-result behaviour", which is what
 * callers must do for non-enumeration questions, weak or ambiguous evidence,
 * and count mismatches. It never reorders hits and cannot see anything the
 * retrieval/publication gates did not already return.
 */

export type EnumerationCandidate = {
  passage_id: string
  excerpt: string
}

const ENGLISH_COUNTS: Record<string, number> = {
  one: 1, two: 2, three: 3, four: 4, five: 5, six: 6, seven: 7, eight: 8, nine: 9, ten: 10,
  eleven: 11, twelve: 12,
}

// Amharic count words; matched as token prefixes so definite forms (አምስቱ) are recognised.
const AMHARIC_COUNTS: ReadonlyArray<readonly [string, number]> = [
  ['አንድ', 1], ['ሁለት', 2], ['ሦስት', 3], ['ሶስት', 3], ['አራት', 4], ['አምስት', 5], ['ስድስት', 6],
  ['ሰባት', 7], ['ሰብዓት', 7], ['ስምንት', 8], ['ዘጠኝ', 9], ['አሥር', 10], ['አስር', 10],
  // Definite forms ("the five …"), whose final vowel differs.
  ['ሁለቱ', 2], ['ሦስቱ', 3], ['ሶስቱ', 3], ['አራቱ', 4], ['አምስቱ', 5], ['ስድስቱ', 6], ['ሰባቱ', 7],
  ['ስምንቱ', 8], ['ዘጠኙ', 9], ['አሥሩ', 10], ['አስሩ', 10],
]

const ETHIOPIC_DIGITS: Record<string, number> = {
  '፩': 1, '፪': 2, '፫': 3, '፬': 4, '፭': 5, '፮': 6, '፯': 7, '፰': 8, '፱': 9, '፲': 10,
}

const ENGLISH_LIST_INTENT =
  /\b(list|name|enumerate|what\s+are\s+the|which\s+are\s+the|what\s+were\s+the|identify)\b/i
const AMHARIC_LIST_INTENT = /(ዘርዝር|ዘርዝሩ|ምንድን\s+ናቸው|እነማን\s+ናቸው|ምን\s+ምን\s+ናቸው|የትኞቹ)/u

const STOPWORDS = new Set([
  'a', 'an', 'the', 'of', 'in', 'on', 'to', 'and', 'or', 'is', 'are', 'was', 'were', 'what', 'which',
  'who', 'how', 'many', 'list', 'name', 'enumerate', 'identify', 'me', 'us', 'please', 'tell', 'about',
  'for', 'by', 'with', 'does', 'do', 'church', 'ethiopian', 'orthodox', 'tewahedo',
])

const MIN_ITEMS = 3
/** A candidate must contain at least this share of the question's key terms. */
const MIN_RELEVANCE = 0.5
/** The best candidate must beat the runner-up by this much, otherwise it is ambiguous. */
const MIN_MARGIN = 0.1

function tokens(text: string): string[] {
  return (text.toLowerCase().match(/[\p{L}\p{N}]+/gu) ?? []).filter(Boolean)
}

/** The count the question asks for ("five", "5", "አምስቱ", "፭"), or null when it names none. */
export function expectedCount(question: string): number | null {
  for (const token of tokens(question)) {
    if (/^\d{1,2}$/.test(token)) return Number(token)
    if (token in ENGLISH_COUNTS) return ENGLISH_COUNTS[token]
    if (token in ETHIOPIC_DIGITS) return ETHIOPIC_DIGITS[token]
    const amharic = AMHARIC_COUNTS.find(([word]) => token.startsWith(word))
    if (amharic) return amharic[1]
  }
  return null
}

export function isEnumerationQuestion(question: string): boolean {
  if (!question.trim()) return false
  return ENGLISH_LIST_INTENT.test(question) || AMHARIC_LIST_INTENT.test(question)
}

/**
 * Number of consecutive numbered items (1., 2., 3. … or ፩., ፪. …) the excerpt
 * contains, starting from 1. Markers must be followed by whitespace so page
 * numbers and decimals are not mistaken for list items.
 */
export function numberedItemCount(excerpt: string): number {
  const markers: number[] = []
  const pattern = /(?:^|[\s(])(\d{1,2}|[፩-፲])[.)፡](?=\s)/gmu
  for (const match of excerpt.matchAll(pattern)) {
    const raw = match[1]
    markers.push(raw in ETHIOPIC_DIGITS ? ETHIOPIC_DIGITS[raw] : Number(raw))
  }
  let next = 1
  for (const value of markers) {
    if (value === next) next += 1
  }
  return next - 1
}

function keyTerms(question: string): string[] {
  const countWords = new Set([...Object.keys(ENGLISH_COUNTS)])
  return [...new Set(tokens(question))].filter(
    (token) =>
      token.length > 1 &&
      !/^\d+$/.test(token) &&
      !STOPWORDS.has(token) &&
      !countWords.has(token) &&
      !(token in ETHIOPIC_DIGITS) &&
      !AMHARIC_COUNTS.some(([word]) => token.startsWith(word)) &&
      !/^(ዘርዝር|ዘርዝሩ|ምንድን|ናቸው|እነማን|የትኞቹ)$/u.test(token),
  )
}

function relevance(terms: readonly string[], excerpt: string): number {
  if (!terms.length) return 0
  const haystack = new Set(tokens(excerpt))
  const hay = [...haystack]
  const present = terms.filter(
    (term) => haystack.has(term) || (term.length >= 4 && hay.some((word) => word.startsWith(term.slice(0, term.length - 1)))),
  )
  return present.length / terms.length
}

/**
 * Returns the hit to use as the answer, or null to keep the current
 * first-result behaviour. The returned value, when not null, is one of `hits`.
 */
export function selectEnumerationAnswer<T extends EnumerationCandidate>(
  question: string,
  hits: readonly T[],
): T | null {
  if (hits.length < 2 || !isEnumerationQuestion(question)) return null

  const wanted = expectedCount(question)
  const terms = keyTerms(question)
  if (!terms.length) return null

  const scored = hits.flatMap((hit) => {
    const items = numberedItemCount(hit.excerpt)
    if (items < MIN_ITEMS) return []
    if (wanted !== null && items !== wanted) return []
    const score = relevance(terms, hit.excerpt)
    return score >= MIN_RELEVANCE ? [{ hit, score }] : []
  })
  if (!scored.length) return null

  // Stable order: higher score first, earlier retrieval rank wins an exact tie.
  const rank = new Map(hits.map((hit, index) => [hit, index]))
  scored.sort((a, b) => b.score - a.score || (rank.get(a.hit) ?? 0) - (rank.get(b.hit) ?? 0))

  const [best, runnerUp] = scored
  if (runnerUp && best.score - runnerUp.score < MIN_MARGIN) return null
  return best.hit
}
