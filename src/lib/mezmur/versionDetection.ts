import { identifyEntity, normalizeForSearch } from '../language/index.ts'
import { transliterateWord } from './ethiopicTransliterator.ts'

export const VERSION_DETECTOR_REVISION = '6'
export const LYRIC_KEYS = ['lyrics_amharic', 'lyrics_geez', 'lyrics_english', 'lyrics_transliteration', 'lyrics_oromo'] as const
export type LyricKey = typeof LYRIC_KEYS[number]
export type VersionRelationship =
  | 'exact-duplicate' | 'normalized-duplicate' | 'alternate-spelling'
  | 'alternate-stanza-structure' | 'extended-or-shortened' | 'different-rendition'
  | 'possible-related-hymn' | 'distinct-hymn'

export type VersionInput = {
  import_id: string
  mezmur_id?: string
  slug: string
  title: string
  title_amharic?: string
  title_english?: string
  category?: string
  primary_occasion?: string
  singer_name?: string
  status?: string
  review_status?: string
  rights_status?: string
} & Partial<Record<LyricKey, string>>

export type PreparedVersion = {
  row: VersionInput
  lyricKey: LyricKey | null
  lyric: string
  spacing: string
  folded: string
  titleKeys: string[]
  lines: string[]
  lineSet: Set<string>
  lineCounts: Map<string, number>
  stanzas: string[]
}

export type VersionEvidence = {
  bodySufficient: boolean
  sharedDistinctiveLines: number
  sharedLines: number
  sharedStanzas: number
  lineCoverage: number
  shorterContainment: number
  titleSimilarity: number
  repeatedLinesDiffer: boolean
  orderDiffers: boolean
  stanzaOrderDiffers: boolean
  explanation: string
}

export type VersionProposal = {
  leftImportId: string
  rightImportId: string
  relationship: VersionRelationship
  confidence: number
  evidence: VersionEvidence
}

const heading = /^(?:(?:verse|chorus|refrain|bridge|intro|outro|አዝማች|መልስ|ቁጥር)\s*(?:\d+|[፩-፲]+)?\s*[:.)-]?)$/iu

export function spacingOnly(text: string): string {
  return text.normalize('NFC').replace(/\s+/gu, ' ').trim()
}

function titleKeys(row: VersionInput): string[] {
  const titles = [row.title, row.title_amharic, row.title_english].filter((s): s is string => Boolean(s?.trim()))
  const keys = titles.map((title) => normalizeForSearch(title)).filter((key) => key.length >= (/[\u1200-\u139f]/u.test(key) ? 3 : 4))
  for (const title of titles) {
    const latin = normalizeForSearch(/[\u1200-\u139f]/u.test(title) ? transliterateWord(title) : title)
    if (/^[a-z][a-z ]{3,}$/u.test(latin)) keys.push(`latin:${latin}`)
    const hit = identifyEntity(title)
    if (hit.length === 1 && !hit[0].ambiguous) keys.push(`entity:${hit[0].entity.id}`)
  }
  return [...new Set(keys)]
}

function lyricLines(text: string): string[] {
  return text.split(/\r?\n/u).map((line) => line.trim()).filter((line) => line && !heading.test(line))
    .map((line) => normalizeForSearch(line.replace(/(?:\/\s*\d+\s*\/|\(\s*[x×]?\d+\s*\))\s*$/iu, '')))
    .filter((line) => line.split(' ').length >= 3 && line.length >= 12)
}

export function prepareVersions(rows: VersionInput[]): PreparedVersion[] {
  return rows.map((row) => {
    const lyricKey = LYRIC_KEYS.find((key) => Boolean(row[key]?.trim())) ?? null
    const lyric = lyricKey ? row[lyricKey] ?? '' : ''
    const lines = lyricLines(lyric)
    const lineCounts = new Map<string, number>()
    for (const line of lines) lineCounts.set(line, (lineCounts.get(line) ?? 0) + 1)
    const stanzas = lyric.split(/\n\s*\n/u).map((stanza) => normalizeForSearch(stanza)).filter(Boolean)
    return {
      row, lyricKey, lyric, spacing: spacingOnly(lyric), folded: normalizeForSearch(lyric),
      titleKeys: titleKeys(row), lines, lineSet: new Set(lines), lineCounts, stanzas,
    }
  })
}

export type CandidateIndex = { pairs: Array<Set<number>>; documentFrequency: Map<string, number>; pairCount: number }

/** Inverted title/rare-line indexes avoid a full all-pairs lyric comparison. */
export function buildCandidateIndex(records: PreparedVersion[]): CandidateIndex {
  const pairs = records.map(() => new Set<number>())
  const linePostings = new Map<string, number[]>()
  const titlePostings = new Map<string, number[]>()
  for (let i = 0; i < records.length; i++) {
    for (const line of records[i].lineSet) {
      const posting = linePostings.get(line) ?? []
      posting.push(i)
      linePostings.set(line, posting)
    }
    for (const title of records[i].titleKeys) {
      const posting = titlePostings.get(title) ?? []
      posting.push(i)
      titlePostings.set(title, posting)
    }
  }
  const documentFrequency = new Map([...linePostings].map(([line, posting]) => [line, posting.length]))
  const addPairs = (posting: number[]) => {
    for (let a = 0; a < posting.length; a++) {
      for (let b = a + 1; b < posting.length; b++) pairs[posting[a]].add(posting[b])
    }
  }
  for (const posting of titlePostings.values()) if (posting.length <= 80) addPairs(posting)
  for (const posting of linePostings.values()) if (posting.length >= 2 && posting.length <= 12) addPairs(posting)
  // Exact and whitespace-normalized duplicates are always candidates, even for a very common title.
  for (const key of ['lyric', 'spacing'] as const) {
    const buckets = new Map<string, number[]>()
    records.forEach((record, i) => {
      const value = record[key]
      if (!value) return
      const posting = buckets.get(value) ?? []
      posting.push(i)
      buckets.set(value, posting)
    })
    for (const posting of buckets.values()) addPairs(posting)
  }
  return { pairs, documentFrequency, pairCount: pairs.reduce((count, posting) => count + posting.size, 0) }
}

function titleSimilarity(left: PreparedVersion, right: PreparedVersion): number {
  if (left.titleKeys.some((key) => right.titleKeys.includes(key))) return 1
  const a = new Set(normalizeForSearch(left.row.title).split(' ').filter((word) => word.length >= 4))
  const b = new Set(normalizeForSearch(right.row.title).split(' ').filter((word) => word.length >= 4))
  const shared = [...a].filter((word) => b.has(word)).length
  return shared / Math.max(1, a.size + b.size - shared)
}

export function compareVersions(left: PreparedVersion, right: PreparedVersion, frequency: ReadonlyMap<string, number>): VersionProposal | null {
  if (left.row.import_id === right.row.import_id) return null
  const sameLyricLanguage = left.lyricKey === right.lyricKey && left.lyricKey !== null
  const title = titleSimilarity(left, right)
  const shared = [...left.lineSet].filter((line) => right.lineSet.has(line))
  const distinctive = shared.filter((line) => (frequency.get(line) ?? 1) <= 12)
  const nonRefrainDistinctive = distinctive.filter((line) => (left.lineCounts.get(line) ?? 0) <= 1 || (right.lineCounts.get(line) ?? 0) <= 1)
  const rightStanzas = new Set(right.stanzas)
  const sharedStanzas = [...new Set(left.stanzas)].filter((stanza) => rightStanzas.has(stanza)).length
  const stanzaOrderDiffers = left.stanzas.join('\n') !== right.stanzas.join('\n')
  const weight = (line: string) => 1 / Math.sqrt(frequency.get(line) ?? 1)
  const sharedWeight = shared.reduce((sum, line) => sum + weight(line), 0)
  const leftWeight = [...left.lineSet].reduce((sum, line) => sum + weight(line), 0)
  const rightWeight = [...right.lineSet].reduce((sum, line) => sum + weight(line), 0)
  const coverage = sharedWeight / Math.max(1, leftWeight, rightWeight)
  const containment = sharedWeight / Math.max(1, Math.min(leftWeight, rightWeight))
  const countsDiffer = shared.some((line) => left.lineCounts.get(line) !== right.lineCounts.get(line))
  const orderDiffers = left.lines.join('\n') !== right.lines.join('\n')
  const allLinesShared = left.lineSet.size > 0 && left.lineSet.size === right.lineSet.size && shared.length === left.lineSet.size
  const enoughBody = nonRefrainDistinctive.length >= 2 && Math.min(left.lineSet.size, right.lineSet.size) >= 3
  const bodySufficient = Math.min(left.folded.split(' ').length, right.folded.split(' ').length) >= 12
    && Math.min(left.lineSet.size, right.lineSet.size) >= 3
  let relationship: VersionRelationship
  let confidence: number
  if (sameLyricLanguage && left.lyric && left.lyric === right.lyric) {
    relationship = 'exact-duplicate'; confidence = 1
  } else if (sameLyricLanguage && left.spacing && left.spacing === right.spacing) {
    relationship = 'normalized-duplicate'; confidence = 0.99
  } else if (sameLyricLanguage && left.folded && left.folded === right.folded && left.folded.split(' ').length >= 12) {
    relationship = 'alternate-spelling'; confidence = 0.93
  } else if (sameLyricLanguage && bodySufficient && allLinesShared && (countsDiffer || orderDiffers || stanzaOrderDiffers)) {
    relationship = 'alternate-stanza-structure'; confidence = 0.9
  } else if (sameLyricLanguage && enoughBody && containment >= 0.8 && coverage >= 0.4 && Math.abs(left.lineSet.size - right.lineSet.size) >= 2) {
    relationship = 'extended-or-shortened'; confidence = 0.83
  } else if (sameLyricLanguage && enoughBody && (coverage >= 0.55 || shared.length / Math.max(left.lineSet.size, right.lineSet.size) >= 0.65) && title >= 0.3) {
    relationship = 'different-rendition'; confidence = 0.76
  } else if (title >= 0.5 || (sameLyricLanguage && distinctive.length >= 2 && coverage >= 0.25)) {
    relationship = left.lyric && right.lyric && sameLyricLanguage && shared.length <= 1
      ? 'distinct-hymn' : 'possible-related-hymn'
    confidence = relationship === 'distinct-hymn' ? 0.88 : 0.48
  } else return null
  const explanation = relationship === 'exact-duplicate'
    ? 'Original lyric text is byte-for-byte equal in the same language field.'
    : relationship === 'normalized-duplicate'
      ? 'Original lyric text differs only in Unicode composition or whitespace.'
    : `${distinctive.length} distinctive lines and ${sharedStanzas} stanzas shared; ${Math.round(coverage * 100)}% of the longer body and ${Math.round(containment * 100)}% of the shorter body overlap. ${title === 1 ? 'Titles match.' : 'Titles differ.'}${sameLyricLanguage ? '' : ' Primary lyric languages differ; no cross-language identity inferred.'}`
  return {
    leftImportId: left.row.import_id, rightImportId: right.row.import_id,
    relationship, confidence,
    evidence: {
      bodySufficient,
      sharedDistinctiveLines: distinctive.length, sharedLines: shared.length, sharedStanzas,
      lineCoverage: Number(coverage.toFixed(3)), shorterContainment: Number(containment.toFixed(3)),
      titleSimilarity: Number(title.toFixed(3)), repeatedLinesDiffer: countsDiffer, orderDiffers, stanzaOrderDiffers,
      explanation,
    },
  }
}

export function proposedFamilies(ids: string[], proposals: VersionProposal[]): string[][] {
  const parent = new Map(ids.map((id) => [id, id]))
  const find = (id: string): string => {
    const current = parent.get(id) ?? id
    if (current === id) return id
    const root = find(current)
    parent.set(id, root)
    return root
  }
  for (const proposal of proposals) {
    if (!proposal.evidence.bodySufficient || proposal.confidence < 0.75 || ['possible-related-hymn', 'distinct-hymn'].includes(proposal.relationship)) continue
    parent.set(find(proposal.rightImportId), find(proposal.leftImportId))
  }
  const groups = new Map<string, string[]>()
  for (const id of ids) {
    const root = find(id)
    const group = groups.get(root) ?? []
    group.push(id)
    groups.set(root, group)
  }
  return [...groups.values()].filter((group) => group.length > 1).map((group) => group.sort()).sort((a, b) => a[0].localeCompare(b[0]))
}
