/**
 * Approximate (typo / vowel-form tolerant) matching inside STORED text, shared by the Mezmur Library and the Bible.
 * Everything here decides whether stored text matches what was typed and where. It never rewrites stored text:
 * excerpts are slices of it (whitespace flattened one-for-one, so highlight offsets stay aligned).
 *
 * - Amharic/Geʽez: words compare by consonant (vowel forms, doubled letters and orthographic families ignored).
 * - Latin: a word matches when it is within one edit (substitution, insertion, deletion, transposition) of a stored
 *   word. Words shorter than four letters must match exactly, so short words cannot match by accident.
 * Every significant typed word must be accounted for; there are no partial guesses.
 */
import { ethiopicSkeletonWord } from './translitSkeleton.ts'
import { foldWord, isStopword, type Excerpt } from './textMatch.ts'

export type ApproximateMatch = {
  excerpt: Excerpt
  /** Total edits between what was typed and the stored words that matched. */
  distance: number
  /** Characters from the first to the last matched word: smaller means the words sit together. */
  span: number
  /** Share of ALL typed words (function words included) found in the stored text: a verse with "is my" outranks one without. */
  coverage: number
}

const ETHIOPIC_WORD = /[ሀ-፿]+/gu
const LATIN_WORD = /\p{L}[\p{L}'’ʼ]*/gu

/** Levenshtein distance. */
export function editDistance(a: string, b: string): number {
  const row = Array.from({ length: b.length + 1 }, (_, i) => i)
  for (let i = 1; i <= a.length; i += 1) {
    let diagonal = row[0]
    row[0] = i
    for (let j = 1; j <= b.length; j += 1) {
      const above = row[j]
      row[j] = Math.min(row[j] + 1, row[j - 1] + 1, diagonal + (a[i - 1] === b[j - 1] ? 0 : 1))
      diagonal = above
    }
  }
  return row[b.length]
}

/** One edit, counting an adjacent transposition (teh/the) as one. */
export function withinOneEdit(a: string, b: string): boolean {
  if (a === b) return true
  if (Math.abs(a.length - b.length) > 1) return false
  if (editDistance(a, b) <= 1) return true
  if (a.length === b.length) {
    for (let i = 0; i + 1 < a.length; i += 1) {
      if (a[i] !== b[i]) return a[i] === b[i + 1] && a[i + 1] === b[i] && a.slice(i + 2) === b.slice(i + 2)
    }
  }
  return false
}

function windowed(stored: string, spans: Array<{ start: number; end: number }>, distance: number, coverage = 1): ApproximateMatch {
  const first = Math.min(...spans.map((s) => s.start))
  const last = Math.max(...spans.map((s) => s.end))
  const from = Math.max(0, first - 60)
  const to = Math.min(stored.length, Math.max(last + 60, from + 120))
  return {
    excerpt: { text: stored.slice(from, to).replace(/\s/g, ' '), ranges: spans.map((s) => [s.start - from, s.end - from] as [number, number]).sort((x, y) => x[0] - y[0]), kind: 'words' },
    distance,
    span: last - first,
    coverage,
  }
}

export function approximateAmharicMatch(stored: string, query: string): ApproximateMatch | null {
  const typed = [...query.matchAll(ETHIOPIC_WORD)].map((m) => m[0])
  const wanted = [...new Map(typed.map((word) => [ethiopicSkeletonWord(word), word])).entries()].filter(([skeleton]) => skeleton.length >= 2)
  if (!wanted.length) return null
  const words = [...stored.matchAll(ETHIOPIC_WORD)].map((m) => ({ start: m.index ?? 0, end: (m.index ?? 0) + m[0].length, word: m[0], skeleton: ethiopicSkeletonWord(m[0]) }))
  const found: Array<{ start: number; end: number }> = []
  let distance = 0
  for (const [skeleton, word] of wanted) {
    const hit = words.filter((w) => w.skeleton === skeleton).sort((a, b) => editDistance(a.word, word) - editDistance(b.word, word) || a.start - b.start)[0]
    if (!hit) return null
    found.push({ start: hit.start, end: hit.end })
    distance += editDistance(hit.word, word)
  }
  return windowed(stored, found, distance)
}

/** Significant Latin query words (folded, de-duplicated, stopwords removed). */
export function latinQueryWords(query: string): Array<{ raw: string; folded: string }> {
  const seen = new Map<string, string>()
  for (const m of query.matchAll(LATIN_WORD)) {
    const folded = foldWord(m[0])
    if (folded.length >= 2 && !isStopword(folded) && !seen.has(folded)) seen.set(folded, m[0])
  }
  return [...seen.entries()].map(([folded, raw]) => ({ raw, folded }))
}

/** Lowercase, accents and apostrophes removed; no phonetic folding, so edit distance reflects real typing slips. */
const plain = (word: string) => word.normalize('NFD').replace(/\p{M}/gu, '').toLowerCase().replace(/['’ʼ]/g, '')

export function approximateLatinMatch(stored: string, query: string): ApproximateMatch | null {
  const wanted = latinQueryWords(query)
  if (!wanted.length) return null
  const words = [...stored.matchAll(LATIN_WORD)].map((m) => ({ start: m.index ?? 0, end: (m.index ?? 0) + m[0].length, folded: foldWord(m[0]), plain: plain(m[0]) }))
  const found: Array<{ start: number; end: number }> = []
  let distance = 0
  for (const { raw, folded } of wanted) {
    const typed = plain(raw)
    const exact = words.find((w) => w.folded === folded || w.plain === typed)
    const near = exact ?? (typed.length >= 4 ? words.find((w) => w.plain.length >= 4 && withinOneEdit(w.plain, typed)) : undefined)
    if (!near) return null
    found.push({ start: near.start, end: near.end })
    if (!exact) distance += 1
  }
  const everyTyped = [...query.matchAll(LATIN_WORD)].map((m) => plain(m[0]))
  const present = new Set(words.map((w) => w.plain))
  const coverage = everyTyped.length ? everyTyped.filter((w) => present.has(w) || words.some((t) => w.length >= 4 && t.plain.length >= 4 && withinOneEdit(t.plain, w))).length / everyTyped.length : 1
  return windowed(stored, found, distance, coverage)
}

/**
 * Regex source for database candidate retrieval: the word with any single edit (substitution, deletion, insertion,
 * transposition). Letters only, so it is safe inside a PostgREST quoted value. Verified locally afterwards.
 */
export function latinLooseRegex(word: string): string {
  const w = word.toLowerCase().replace(/[^a-z]/g, '')
  if (w.length < 4) return w
  const alts = new Set<string>()
  for (let i = 0; i < w.length; i += 1) {
    alts.add(w.slice(0, i) + '[a-z]' + w.slice(i + 1)) // substitution (also matches the exact word)
    alts.add(w.slice(0, i) + w.slice(i + 1)) // deletion
    if (i + 1 < w.length) alts.add(w.slice(0, i) + w[i + 1] + w[i] + w.slice(i + 2)) // transposition
  }
  for (let i = 0; i <= w.length; i += 1) alts.add(w.slice(0, i) + '[a-z]' + w.slice(i)) // insertion
  return [...alts].join('|')
}
