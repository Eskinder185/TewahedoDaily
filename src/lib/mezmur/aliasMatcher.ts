/**
 * Unicode-safe alias matching for Mezmur taxonomy aliases.
 *
 * - Normalization is used for matching only; stored text is never changed.
 * - Ethiopic: folds orthographic variants (ሀ/ሐ/ኀ/ሃ, ሰ/ሠ, አ/ዐ/ኣ/እ, ጸ/ፀ, ጎ/ጐ…),
 *   treats Ethiopic punctuation as spaces, keeps every meaningful character.
 * - Latin: NFKD, removes diacritics, lower-cases, folds common transliteration
 *   variants (doubled letters, ph→f, apostrophes).
 * - Boundaries: an Ethiopic alias may carry a fused grammatical prefix
 *   (የ ለ በ ከ ወ ዘ እ ስለ እንደ …) and a short suffix (≤ 3 letters, e.g. -ን -ም
 *   -ችን), but never sits inside an unrelated longer word. `exactOnly`
 *   aliases must stand alone. Latin aliases match whole words only.
 */
import { normalizeEthiopic } from './mezmurClassification'
import {
  ALL_ENTRIES,
  TAXONOMY_ALIASES,
  type TaxonomyAlias,
  type TaxonomyEntry,
  type TaxonomyKind,
} from './taxonomyAliases'

const ETH_CHAR = '\\u1200-\\u139F\\u2D80-\\u2DDF'
const ETH_RE = new RegExp(`[${ETH_CHAR}]`)

/** Normalize Ethiopic text for matching (does not mutate input). */
export function normalizeEthiopicForMatch(text: string): string {
  if (!text) return ''
  return normalizeEthiopic(text.normalize('NFC'))
    .replace(/[\u200B-\u200D\uFEFF]/g, '')
    .replace(/[ኣ]/g, 'አ')
    .replace(/[ዃ]/g, 'ኳ')
    .replace(/ሃ/g, 'ሀ')
    // scanned booklets confuse አ/እ constantly (አግዚአብሔር, አስጢፋኖስ); fold for matching only
    .replace(/እ/g, 'አ')
    .replace(/[፡።፣፤፥፦፧፨!?.,;:"'“”‘’()[\]{}«»‹›<>|*+=~_`^#%&@\\/-]+/g, ' ')
    .replace(/\s+/g, ' ')
    .trim()
}

/** Normalize Latin / transliterated text for matching (does not mutate input). */
export function normalizeLatinForMatch(text: string): string {
  if (!text) return ''
  return text
    .normalize('NFKD')
    .replace(/[̀-ͯ]/g, '')
    .toLowerCase()
    .replace(/['’`ʼ´]/g, '')
    .replace(/\bst\.?\s/g, 'saint ')
    // Ge'ez/Amharic "holy / saint" in its common Latin spellings
    .replace(/\b(?:kidus|kiddus|qidus|qiddus|qedus|qeddus|kedus|keddus|kudus|kidist|qidist|qedist|kidest)\b/g, 'saint')
    .replace(/ph/g, 'f')
    .replace(/([a-z])\1+/g, '$1')
    .replace(/[^a-z0-9]+/g, ' ')
    .replace(/\s+/g, ' ')
    .trim()
}

export function isEthiopic(text: string): boolean {
  return ETH_RE.test(text)
}

const ETH_PREFIX = '(?:ስለ|አንደ|ወደ|አስከ|ከነ|በነ|የነ|ለነ|ሀበ|የ|ለ|በ|ከ|ወ|ዘ|አ)?'
const ETH_SUFFIX = `[${ETH_CHAR}]{0,3}`

function escapeRe(s: string): string {
  return s.replace(/[.*+?^${}()|[\]\\]/g, '\\$&')
}

/**
 * Regex body for a normalized Ethiopic alias. A final 6th-order letter may
 * appear in another vowel order of the same consonant, because Amharic/Ge'ez
 * possessives and case endings change it (መስቀል → መስቀሉ, ተክሊል → ተክሊሉ).
 * The 4th order (-a) is only allowed before plural possessives, so that
 * ያሬድ does not match the adjective ያሬዳዊ ("Yaredic").
 */
function ethiopicBody(core: string, flexFinal: boolean): string {
  const words = core.split(' ')
  const last = words[words.length - 1]
  const ch = last.codePointAt(last.length - 1) || 0
  if (flexFinal && last.length >= 3 && ch >= 0x1200 && ch <= 0x137f && (ch - 0x1200) % 8 === 5) {
    const base = ch - 5
    const c = (n: number) => String.fromCodePoint(base + n)
    // any order except 4th (-a); -a only before plural possessives (መስቀላችን), never as in ያሬዳዊ
    const finalLetter = `(?:[${c(0)}-${c(2)}${c(4)}-${c(7)}]|${c(3)}(?=ችን|ቸው|ችሁ))`
    words[words.length - 1] = `${escapeRe(last.slice(0, -1))}${finalLetter}`
    return words.map((w, i) => (i === words.length - 1 ? w : escapeRe(w))).join('\\s+')
  }
  return words.map(escapeRe).join('\\s+')
}

export interface CompiledAlias {
  alias: TaxonomyAlias
  regex: RegExp
  /** Cheap prefilter: normalized core text that must be present (literal aliases). */
  core: string | null
  ethiopic: boolean
}

function compile(alias: TaxonomyAlias): CompiledAlias {
  const ethiopic = alias.script === 'ethiopic'
  if (alias.pattern) {
    return { alias, regex: new RegExp(alias.pattern, 'gu'), core: null, ethiopic }
  }
  if (ethiopic) {
    const core = normalizeEthiopicForMatch(alias.alias)
    const body = ethiopicBody(core, !alias.exactOnly)
    const first = core.split(' ')[0]
    const prefilter = core.includes(' ') ? first : alias.exactOnly ? core : core.slice(0, -1)
    const src = alias.exactOnly
      ? `(?<![${ETH_CHAR}])${body}(?![${ETH_CHAR}])`
      : `(?<![${ETH_CHAR}])${ETH_PREFIX}${body}${ETH_SUFFIX}(?![${ETH_CHAR}])`
    return { alias, regex: new RegExp(src, 'gu'), core: prefilter, ethiopic }
  }
  const core = normalizeLatinForMatch(alias.alias)
  const body = core.split(' ').map(escapeRe).join(' ')
  return { alias, regex: new RegExp(`(?<![a-z0-9])${body}(?![a-z0-9])`, 'g'), core, ethiopic }
}

let compiledCache: CompiledAlias[] | null = null

/** All aliases usable as lyric evidence, compiled once. */
export function compiledEvidenceAliases(): CompiledAlias[] {
  if (!compiledCache) {
    compiledCache = TAXONOMY_ALIASES.filter((a) => !a.searchOnly && a.strength > 0).map(compile)
  }
  return compiledCache
}

export interface AliasHit {
  compiled: CompiledAlias
  lineIndex: number
  start: number
  end: number
  text: string
}

/**
 * Find alias hits on pre-normalized lines.
 * Overlapping hits of the same kind (category vs occasion) are resolved by
 * keeping the longest match, so "ገብረ መንፈስ ቅዱስ" does not also count as
 * "መንፈስ ቅዱስ", and "ትንሣኤሽ" (Filseta) does not also count as "ትንሣኤ".
 */
export function findAliasHits(
  ethLines: string[],
  latLines: string[],
  aliases: CompiledAlias[] = compiledEvidenceAliases(),
): AliasHit[] {
  const raw: AliasHit[] = []
  for (let i = 0; i < ethLines.length; i++) {
    const eth = ethLines[i]
    const lat = latLines[i]
    for (const c of aliases) {
      const target = c.ethiopic ? eth : lat
      if (!target) continue
      if (c.core && !target.includes(c.core)) continue
      c.regex.lastIndex = 0
      let m: RegExpExecArray | null
      while ((m = c.regex.exec(target))) {
        raw.push({ compiled: c, lineIndex: i, start: m.index, end: m.index + m[0].length, text: m[0] })
        if (m[0].length === 0) c.regex.lastIndex++
      }
    }
  }
  // overlap resolution per (line, script, kind): longest span wins
  // longest span first; on equal length an exact alias beats an ambiguous one, then higher strength
  raw.sort(
    (a, b) =>
      b.end - b.start - (a.end - a.start) ||
      Number(a.compiled.alias.ambiguous) - Number(b.compiled.alias.ambiguous) ||
      b.compiled.alias.strength - a.compiled.alias.strength,
  )
  const kept: AliasHit[] = []
  const taken = new Map<string, Array<[number, number]>>()
  for (const h of raw) {
    const a = h.compiled.alias
    const bucket = a.canonical === 'General' ? 'god' : a.kind
    const key = `${h.lineIndex}|${h.compiled.ethiopic ? 'e' : 'l'}|${bucket}`
    const spans = taken.get(key) || []
    const overlaps = spans.some(([s, e]) => h.start < e && s < h.end)
    if (overlaps && !h.compiled.alias.pattern) continue
    spans.push([h.start, h.end])
    taken.set(key, spans)
    kept.push(h)
  }
  return kept
}

// ---------------------------------------------------------------------------
// Search-term resolution
// ---------------------------------------------------------------------------

export interface TaxonomyTermMatch {
  kind: TaxonomyKind
  canonical: string
  entry: TaxonomyEntry
  matchedAlias: string
  /** true for names, titles and transliterations; false for contextual clues / ambiguous words. */
  exact: boolean
}

function isExactAlias(a: TaxonomyAlias): boolean {
  return !a.ambiguous && a.type !== 'contextual_phrase'
}

let termIndex: Map<string, TaxonomyAlias[]> | null = null

function normTerm(text: string): string {
  return isEthiopic(text) ? normalizeEthiopicForMatch(text) : normalizeLatinForMatch(text)
}

function buildTermIndex(): Map<string, TaxonomyAlias[]> {
  const index = new Map<string, TaxonomyAlias[]>()
  for (const alias of TAXONOMY_ALIASES) {
    if (alias.pattern) continue
    if (alias.kind === 'category' && alias.canonical === 'General' && alias.type === 'contextual_phrase') continue
    const key = normTerm(alias.alias)
    if (!key) continue
    const list = index.get(key) || []
    list.push(alias)
    index.set(key, list)
  }
  return index
}

/**
 * Resolve a free-text search term ("Saint Michael", "Mikael", "ቅዱስ ሚካኤል",
 * "Nativity", "ገና") to existing canonical taxonomy entries. Exact-alias match
 * on the whole normalized term; categories and occasions can both match.
 */
export function resolveTaxonomyTerms(term: string, options: { exactOnly?: boolean } = {}): TaxonomyTermMatch[] {
  if (!termIndex) termIndex = buildTermIndex()
  const key = normTerm(term || '')
  if (!key) return []
  const hits = (termIndex.get(key) || []).filter((a) => !options.exactOnly || isExactAlias(a))
  const out: TaxonomyTermMatch[] = []
  const seen = new Set<string>()
  // prefer strong / non-ambiguous aliases first
  for (const a of [...hits].sort((x, y) => Number(x.ambiguous) - Number(y.ambiguous) || y.strength - x.strength)) {
    const id = `${a.kind}|${a.canonical}`
    if (seen.has(id)) continue
    seen.add(id)
    const entry = ALL_ENTRIES.find((e) => e.kind === a.kind && e.canonical === a.canonical)
    if (entry) out.push({ kind: a.kind, canonical: a.canonical, entry, matchedAlias: a.alias, exact: isExactAlias(a) })
  }
  return out
}

/** Search strings (normalized) that should find content for a canonical entry. */
export function searchVariantsFor(kind: TaxonomyKind, canonical: string): { ethiopic: string[]; latin: string[] } {
  const ethiopic = new Set<string>()
  const latin = new Set<string>()
  for (const a of TAXONOMY_ALIASES) {
    if (a.kind !== kind || a.canonical !== canonical || a.pattern) continue
    if (a.ambiguous || a.strength < 3) continue
    if (a.script === 'ethiopic') ethiopic.add(normalizeEthiopicForMatch(a.alias))
    else latin.add(normalizeLatinForMatch(a.alias))
  }
  return { ethiopic: [...ethiopic].filter(Boolean), latin: [...latin].filter(Boolean) }
}

/** True when `text` contains a whole-word occurrence of any variant. */
export function textContainsVariant(text: string, variants: { ethiopic: string[]; latin: string[] }): boolean {
  if (!text) return false
  const eth = normalizeEthiopicForMatch(text)
  const lat = normalizeLatinForMatch(text)
  for (const v of variants.ethiopic) {
    if (!eth.includes(v.slice(0, -1))) continue
    const re = new RegExp(`(?<![${ETH_CHAR}])${ETH_PREFIX}${ethiopicBody(v, true)}${ETH_SUFFIX}(?![${ETH_CHAR}])`, 'u')
    if (re.test(eth)) return true
  }
  for (const v of variants.latin) {
    if (!lat.includes(v)) continue
    if (new RegExp(`(?<![a-z0-9])${escapeRe(v)}(?![a-z0-9])`).test(lat)) return true
  }
  return false
}
