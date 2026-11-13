/**
 * Controlled fuzzy matching for Latin transliterations of Amharic/Geʽez/Tigrinya/Oromo text.
 * Hymn titles have no single spelling (Egziabher / Igziabher / Egziaber, Qidus / Kidus, Tsion / Zion), so a
 * strict match makes a known hymn vanish after a small spelling change. This module compares a "skeleton" of each
 * word. It is a SEARCH representation only: stored titles and lyrics are never rewritten, and results found this
 * way are labelled as similar spellings and ranked below exact, phrase and lyric matches.
 *
 * Rules (documented, conservative, each justified by common romanization variation):
 *  - case, diacritics and apostrophes/ʽ ignored
 *  - ch/ts/tz/c → c; sh → s; q/k → k; ph → f; w/v → w; z/zh → z (zh is a common alternative for ዠ)
 *  - h is silent or doubled in many romanizations (Egziabher/Egziaber) → dropped
 *  - vowels carry the least stable spelling → dropped, except that an initial vowel is kept as one marker
 *  - doubled letters collapse
 */
import { foldEthiopicChar, foldWord } from './textMatch.ts'

const WORD = /[\p{L}\p{N}]+/gu

const FIDEL = /[ሀ-ፗ]/u
const ROW = 8
const FIDEL_START = 0x1200
const FIDEL_END = 0x1357

const rowBase = (code: number) => FIDEL_START + Math.floor((code - FIDEL_START) / ROW) * ROW

/**
 * Ethiopic words: every letter becomes its consonant (the first form of its row of eight), after the documented
 * orthographic-variant folding (ሠ/ሰ, ዐ/አ …); doubled letters collapse. So ይበራል, ያበራል and ይብብራል compare equal
 * (the vowel form is the least stable part of a typed or heard word), while different consonants never do.
 */
export function ethiopicSkeletonWord(raw: string): string {
  let out = ''
  for (const char of raw.normalize('NFC')) {
    const folded = foldEthiopicChar(char)
    const code = folded.codePointAt(0) ?? 0
    if (code < FIDEL_START || code > FIDEL_END) continue
    const base = String.fromCodePoint(rowBase(code))
    if (!out.endsWith(base)) out += base
  }
  return out
}

/** A regex source (no groups, safe inside a PostgREST quoted value) matching any vowel form of each consonant in a word. */
export function ethiopicLooseRegex(raw: string): string {
  const skeleton = ethiopicSkeletonWord(raw)
  let out = ''
  for (const base of skeleton) {
    const baseCode = base.codePointAt(0) as number
    // The row itself plus every row folded into the same variant family.
    let members = ''
    for (let code = FIDEL_START; code <= FIDEL_END; code += ROW) {
      const sample = String.fromCodePoint(code)
      const sameFamily = [...Array(ROW).keys()].some((offset) => rowBase((foldEthiopicChar(String.fromCodePoint(code + offset)).codePointAt(0)) as number) === baseCode)
      if (sameFamily || code === baseCode) members += `${sample}-${String.fromCodePoint(Math.min(code + ROW - 1, FIDEL_END))}`
    }
    out += `[${members}]+`
  }
  return out
}

export function skeletonWord(raw: string): string {
  if (FIDEL.test(raw)) return ethiopicSkeletonWord(raw)
  let w = foldWord(raw).replace(/[^a-z0-9]/g, '')
  if (!w) return ''
  w = w.replace(/tsh|tch|ch|ts|tz/g, 'c').replace(/sh/g, 's').replace(/zh/g, 'z').replace(/ph/g, 'f').replace(/[qk]/g, 'k').replace(/[vw]/g, 'w').replace(/x/g, 'ks')
  w = w.replace(/^h(?=[aeiouy])/, '') // Hamelmale / Amelmale
  const initialVowel = /^[aeiouy]/.test(w)
  w = w.replace(/[aeiouyh]/g, '').replace(/(.)\1+/g, '$1')
  return (initialVowel ? 'a' : '') + w
}

export function skeletonWords(text: string): string[] {
  return (text.match(WORD) ?? []).map(skeletonWord).filter(Boolean)
}

const STOP = new Set(['a', 'wa', 'ya', 'le', 'ye', 'be', 'ke', 'ne', 'ta'])

/** Fraction of the query's skeleton words found (equal, or one a prefix of the other when ≥3 long) in the candidate. */
export function skeletonCoverage(query: string, candidate: string): number {
  const q = [...new Set(skeletonWords(query))].filter((w) => w.length >= 2 || !STOP.has(w))
  if (!q.length) return 0
  const c = skeletonWords(candidate)
  if (!c.length) return 0
  let hit = 0
  for (const qw of q) {
    if (c.some((cw) => cw === qw || (qw.length >= 3 && cw.length >= 3 && (cw.startsWith(qw) || qw.startsWith(cw))))) hit += 1
  }
  return hit / q.length
}

/** A query this short is too ambiguous for fuzzy matching (one or two letters of skeleton). */
export function fuzzyEligible(query: string): boolean {
  const words = skeletonWords(query)
  return words.length > 0 && words.join('').length >= 4
}

export type FuzzyTitleHit<T> = { item: T; coverage: number }

/** Rank titles by skeleton coverage; keeps only strong matches (all words, or ≥75% of three or more). */
export function fuzzyTitleMatches<T>(items: T[], query: string, titleOf: (item: T) => string, limit = 10): FuzzyTitleHit<T>[] {
  if (!fuzzyEligible(query)) return []
  const wordCount = new Set(skeletonWords(query)).size
  const floor = wordCount >= 3 ? 0.75 : 1
  const hits: FuzzyTitleHit<T>[] = []
  for (const item of items) {
    const coverage = skeletonCoverage(query, titleOf(item))
    if (coverage >= floor) hits.push({ item, coverage })
  }
  // Prefer candidates whose title is about the same length as the query: avoids a short query matching long titles first.
  const qLen = skeletonWords(query).length
  return hits
    .sort((a, b) => b.coverage - a.coverage || Math.abs(skeletonWords(titleOf(a.item)).length - qLen) - Math.abs(skeletonWords(titleOf(b.item)).length - qLen))
    .slice(0, limit)
}
