import { LANGUAGE_ENTITIES, type LanguageEntity } from './entities.ts'
import { normalizeForSearch, normalizedSpans, type OrthographyOptions } from './normalization.ts'
import { matchText, type TextMatch } from '../search/textMatch.ts'

export { LANGUAGE_ENTITIES, normalizeForSearch, normalizedSpans }
export type { LanguageEntity, OrthographyOptions }

export type EntityHit = {
  entity: LanguageEntity
  matchedAlias: string
  method: 'exact' | 'normalized' | 'alias' | 'fuzzy'
  confidence: number
  ambiguous: boolean
  range?: [number, number]
}

type IndexedAlias = { entity: LanguageEntity; alias: string; normalized: string; length: number }
const aliases: IndexedAlias[] = LANGUAGE_ENTITIES.flatMap((entity) =>
  [...new Set([entity.names.en, entity.names.am, entity.names.gez, ...entity.aliases].filter((value): value is string => Boolean(value)))]
    .map((alias) => ({ entity, alias, normalized: normalizeForSearch(alias), length: normalizedSpans(alias).length }))
    .filter((entry) => entry.normalized && entry.length >= 1),
)
const aliasesByFirst = new Map<string, IndexedAlias[]>()
for (const entry of aliases) {
  const first = entry.normalized.split(' ')[0]
  const bucket = aliasesByFirst.get(first) ?? []
  bucket.push(entry)
  aliasesByFirst.set(first, bucket)
}
const configuredIndexes = new Map<string, { entries: IndexedAlias[]; byFirst: Map<string, IndexedAlias[]> }>()
function aliasIndex(options: OrthographyOptions = {}) {
  if (options.foldEthiopicVariants !== false && options.foldLatinVariants !== false) return { entries: aliases, byFirst: aliasesByFirst }
  const key = `${options.foldEthiopicVariants !== false}:${options.foldLatinVariants !== false}`
  const cached = configuredIndexes.get(key)
  if (cached) return cached
  const entries = aliases.map((entry) => ({ ...entry, normalized: normalizeForSearch(entry.alias, options) }))
  const byFirst = new Map<string, IndexedAlias[]>()
  for (const entry of entries) {
    const first = entry.normalized.split(' ')[0]
    const bucket = byFirst.get(first) ?? []
    bucket.push(entry)
    byFirst.set(first, bucket)
  }
  const index = { entries, byFirst }
  configuredIndexes.set(key, index)
  return index
}

function editDistanceAtMostOne(a: string, b: string): boolean {
  if (Math.abs(a.length - b.length) > 1) return false
  let i = 0; let j = 0; let edits = 0
  while (i < a.length && j < b.length) {
    if (a[i] === b[j]) { i++; j++; continue }
    if (++edits > 1) return false
    if (a.length >= b.length) i++
    if (a.length <= b.length) j++
  }
  return edits + Number(i < a.length || j < b.length) <= 1
}

function uniqueBest(hits: EntityHit[]): EntityHit[] {
  const byId = new Map<string, EntityHit>()
  for (const hit of hits) {
    const old = byId.get(hit.entity.id)
    if (!old || hit.confidence > old.confidence || (hit.confidence === old.confidence && hit.matchedAlias.length > old.matchedAlias.length)) byId.set(hit.entity.id, hit)
  }
  const sorted = [...byId.values()].sort((a, b) => b.confidence - a.confidence || b.matchedAlias.length - a.matchedAlias.length || a.entity.id.localeCompare(b.entity.id))
  if (sorted.length > 1 && sorted[0].confidence === sorted[1].confidence) {
    for (const hit of sorted) if (hit.confidence === sorted[0].confidence) hit.ambiguous = true
  }
  return sorted
}

/** Whole-query resolution. Fuzzy matching is restricted to long Latin names and never auto-selects ties. */
export function identifyEntity(query: string, options: { fuzzy?: boolean; kinds?: readonly LanguageEntity['kind'][]; orthography?: OrthographyOptions } = {}): EntityHit[] {
  const normalized = normalizeForSearch(query, options.orthography)
  if (!normalized) return []
  const pool = aliasIndex(options.orthography).entries.filter((entry) => !options.kinds || options.kinds.includes(entry.entity.kind))
  const exact = pool.filter((entry) => entry.normalized === normalized).map((entry): EntityHit => ({
    entity: entry.entity, matchedAlias: entry.alias,
    method: entry.alias === query.trim() ? 'exact' : entry.alias.toLowerCase() === query.trim().toLowerCase() ? 'normalized' : 'alias',
    confidence: entry.alias === query.trim() ? 1 : 0.96, ambiguous: false,
  }))
  if (exact.length) return uniqueBest(exact)
  if (options.fuzzy !== true || normalized.length < 5 || /[\u1200-\u139f]/u.test(normalized)) return []
  return uniqueBest(pool.filter((entry) => entry.normalized.length >= 5 && editDistanceAtMostOne(entry.normalized, normalized))
    .map((entry) => ({ entity: entry.entity, matchedAlias: entry.alias, method: 'fuzzy' as const, confidence: 0.72, ambiguous: false })))
}

/** Literal mentions with source offsets. A mention is evidence, never a hymn classification. */
export function recognizeEntities(text: string, options: OrthographyOptions = {}): EntityHit[] {
  const spans = normalizedSpans(text, options)
  if (!spans.length) return []
  const index = aliasIndex(options)
  const hits: EntityHit[] = []
  for (let i = 0; i < spans.length; i++) {
    for (const entry of index.byFirst.get(spans[i].value) ?? []) {
      if (entry.length > spans.length - i) continue
      if (spans.slice(i, i + entry.length).map((span) => span.value).join(' ') !== entry.normalized) continue
      const end = spans[i + entry.length - 1].end
      hits.push({ entity: entry.entity, matchedAlias: entry.alias, method: 'alias', confidence: 0.9, ambiguous: false, range: [spans[i].start, end] })
    }
  }
  // Prefer a full name over a contained short name, with linear overlap selection.
  hits.sort((a, b) => (a.range?.[0] ?? 0) - (b.range?.[0] ?? 0) || (b.range?.[1] ?? 0) - (a.range?.[1] ?? 0))
  const longest: EntityHit[] = []
  let activeStart = -1
  let activeEnd = -1
  for (const hit of hits) {
    const [start, end] = hit.range as [number, number]
    if (start < activeEnd && !(start === activeStart && end === activeEnd)) continue
    longest.push(hit)
    activeStart = start
    activeEnd = end
  }
  const seen = new Set<string>()
  const distinct = longest.filter((hit) => {
    const key = `${hit.entity.id}:${hit.range?.join(':')}`
    if (seen.has(key)) return false
    seen.add(key)
    return true
  })
  for (const hit of distinct) {
    hit.ambiguous = distinct.some((other) => other !== hit && other.range?.[0] === hit.range?.[0] && other.range?.[1] === hit.range?.[1])
  }
  return distinct.sort((a, b) => (a.range?.[0] ?? 0) - (b.range?.[0] ?? 0) || a.entity.id.localeCompare(b.entity.id))
}

/** Search alternatives only for a unique, complete entity query. No fuzzy expansion. */
export function entitySearchVariants(query: string, limit = 8): string[] {
  const hits = identifyEntity(query)
  if (hits.length !== 1 || hits[0].ambiguous) return [query]
  const entity = hits[0].entity
  return [...new Set([query, entity.names.am, entity.names.en, ...entity.aliases].filter((value): value is string => Boolean(value)))]
    .filter((value) => normalizedSpans(value).length <= 4)
    .slice(0, Math.max(1, limit))
}

/** Reuse the offset-preserving lyric/verse matcher for arbitrary content fields. */
export function matchContent(text: string, query: string, options: { entityAliases?: boolean } = {}): (TextMatch & { query: string }) | null {
  for (const variant of options.entityAliases ? entitySearchVariants(query) : [query]) {
    const match = matchText(text, variant)
    if (match) return { ...match, query: variant }
  }
  return null
}
