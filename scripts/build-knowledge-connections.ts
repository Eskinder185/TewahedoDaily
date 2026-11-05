/** Offline candidates only. Never promotes a generated relationship to editorially confirmed. */
import { createHash } from 'node:crypto'
import { readFileSync, readdirSync, mkdirSync, writeFileSync } from 'node:fs'
import { resolve } from 'node:path'
import { normalizeForSearch, matchContent } from '../src/lib/language/index.ts'
import { LEGACY_CALENDAR_CONNECTIONS, type KnowledgeConnection } from '../src/lib/knowledge/connections.ts'
import { parseCsvText } from '../src/lib/cms/mezmurCsvImport.ts'
import { CATEGORY_ENTRIES } from '../src/lib/mezmur/taxonomyAliases.ts'

const source = resolve('reports/mezmur-lyric-cleanup/mezmur_cleaned_classified.csv')
const sourceBytes = readFileSync(source)
const sourceSha256 = createHash('sha256').update(sourceBytes).digest('hex')
const sourceRows = parseCsvText(sourceBytes.toString('utf8'))
const rows = sourceRows.rows
const deepRows = parseCsvText(readFileSync('reports/mezmur-lyric-cleanup/deep-classification/mezmur_deep_classified.csv', 'utf8')).rows
const semanticEvidence = parseCsvText(readFileSync('reports/mezmur-lyric-cleanup/deep-classification/mezmur_classification_evidence.csv', 'utf8')).rows
const evidenceByImport = new Map<string, typeof semanticEvidence>()
for (const evidence of semanticEvidence) evidenceByImport.set(evidence.import_id,
  [...(evidenceByImport.get(evidence.import_id) || []), evidence])
const bySlug = new Map(rows.map(row => [row.slug, row]))
const cards = JSON.parse(readFileSync('scripts/calendar_cards_dump.json', 'utf8')) as Array<{ id: string; slug: string; title: string; ethiopian_month_number?: number; ethiopian_day?: number; is_monthly?: boolean }>
const cardBySlug = new Map(cards.map(card => [card.slug, card]))
const rejected: Array<{ id: string; reason: string }> = []
const relationships: KnowledgeConnection[] = []

for (const candidate of LEGACY_CALENDAR_CONNECTIONS) {
  const row = bySlug.get(candidate.from.id)
  const card = cardBySlug.get(candidate.to.id)
  if (!row || row.status !== 'published' || !card) { rejected.push({ id: candidate.id, reason: 'Missing current published hymn or calendar card' }); continue }
  relationships.push({ ...candidate, from: { ...candidate.from, id: row.import_id || row.slug, slug: row.slug },
    to: { ...candidate.to, id: card.id },
    provenance: { ...candidate.provenance, sourceHash: sourceSha256 },
    evidence: [{ kind: 'source-metadata', text: candidate.evidence[0].text, sourceId: card.id }],
  })
}

const saintIds: Record<string, string> = { 'kidus-uriel': 'archangel:uriel', 'kidus-michael': 'archangel:michael' }
const themeSlugs = new Set(CATEGORY_ENTRIES.filter(entry => entry.group === 'theme').map(entry => entry.slug))
for (const row of deepRows) {
  if (row.semantic_review_status !== 'full_lyrics_reviewed'
    || (!saintIds[row.proposed_primary_slug] && !themeSlugs.has(row.proposed_primary_slug))) continue
  const original = rows.find(item => item.import_id === row.import_id)
  if (!original || original.status !== 'published' || original.lyrics_amharic !== row.lyrics_amharic) continue
  const excerpts = evidenceByImport.get(row.import_id) || []
  if (!excerpts.length || excerpts.some(item => !original[item.lyric_field]?.includes(item.lyric_excerpt))) {
    rejected.push({ id: `semantic:${row.import_id}`, reason: 'Missing or nonliteral full-lyric evidence' }); continue
  }
  const isSaint = Boolean(saintIds[row.proposed_primary_slug])
  relationships.push({ id: `${isSaint ? 'semantic-primary-saint' : 'semantic-theme'}:${row.import_id}`,
    from: { kind: 'hymn', id: row.import_id, slug: row.slug, name: row.title },
    to: { kind: isSaint ? 'saint' : 'theme', id: isSaint ? saintIds[row.proposed_primary_slug] : `theme:${row.proposed_primary_slug}`,
      name: row.proposed_primary_category },
    relation: isSaint ? 'primary-saint' : 'theological-theme', sourceType: 'hymn-lyrics',
    evidence: [...excerpts.map(item => ({ kind: 'thematic' as const, text: item.lyric_excerpt, sourceId: row.import_id })),
      { kind: 'source-metadata', text: row.semantic_reason, sourceId: row.import_id }],
    confidence: row.semantic_confidence === 'high' ? 0.85 : 0.65, editorialStatus: 'proposed',
    provenance: { source: 'reports/mezmur-lyric-cleanup/deep-classification/mezmur_deep_classified.csv', version: 'batch-001', sourceHash: sourceSha256 } })
}

for (const card of cards) {
  if (!Number.isInteger(card.ethiopian_month_number) || !Number.isInteger(card.ethiopian_day)) continue
  relationships.push({ id: `calendar-date:${card.id}`, from: { kind: 'feast', id: card.id, name: card.title },
    to: { kind: 'calendar-day', id: `ethiopian:${card.ethiopian_month_number}:${card.ethiopian_day}${card.is_monthly ? ':monthly' : ''}` },
    relation: 'commemoration-date', sourceType: 'calendar-catalog',
    evidence: [{ kind: 'source-metadata', text: card.title, sourceId: card.id }], confidence: 1,
    editorialStatus: 'proposed', provenance: { source: 'scripts/calendar_cards_dump.json', version: 'calendar-export-v1' } })
}

type Passage = { id: string; edition: { review_status: string; is_public: boolean; publication_status: string; code: string };
  sourceBook: { review_status: string; is_public: boolean; publication_status: string };
  book: { id: string; slug: string }; chapter: { chapter_number: number };
  verses: Array<{ id: string; verse_number: number; text: string }> }
const batches = readdirSync('artifacts/faith-challenges', { withFileTypes: true })
  .filter(entry => entry.isDirectory() && /^batch-\d+$/u.test(entry.name))
const verseById = new Map<string, { passage: Passage; verse: Passage['verses'][number]; normalized: string }>()
for (const batch of batches) {
  const file = resolve('artifacts/faith-challenges', batch.name, 'source-batch.json')
  let data: { passages: Passage[] }
  try { data = JSON.parse(readFileSync(file, 'utf8')) as { passages: Passage[] } } catch { continue }
  for (const passage of data.passages || []) {
    if (passage.edition?.review_status !== 'reviewed' || !passage.edition.is_public || passage.edition.publication_status !== 'published'
      || passage.sourceBook?.review_status !== 'reviewed' || !passage.sourceBook.is_public || passage.sourceBook.publication_status !== 'published') continue
    for (const verse of passage.verses) {
      const normalized = normalizeForSearch(verse.text)
      if (normalized.length >= 40 && normalized.split(' ').length >= 6) verseById.set(verse.id, { passage, verse, normalized })
    }
  }
}
const byFirstWord = new Map<string, Array<{ passage: Passage; verse: Passage['verses'][number]; normalized: string }>>()
for (const item of verseById.values()) {
  const first = item.normalized.split(' ')[0]
  const bucket = byFirstWord.get(first) || []
  bucket.push(item); byFirstWord.set(first, bucket)
}
for (const row of rows) {
  if (row.status !== 'published') continue
  for (const field of ['lyrics_amharic', 'lyrics_geez', 'lyrics_english']) {
    const lyric = row[field]
    if (!lyric) continue
    const normalized = normalizeForSearch(lyric)
    const words = new Set(normalized.split(' '))
    const matched = new Set<string>()
    for (const word of words) for (const item of byFirstWord.get(word) || []) {
      if (matched.has(item.verse.id) || !normalized.includes(item.normalized)) continue
      const hit = matchContent(lyric, item.verse.text)
      if (!hit || hit.kind !== 'phrase' || hit.matched !== hit.total) continue
      matched.add(item.verse.id)
      const excerpt = lyric.slice(hit.ranges[0][0], hit.ranges[hit.ranges.length - 1][1])
      relationships.push({ id: `scripture-quote:${row.import_id}:${item.verse.id}`,
        from: { kind: 'hymn', id: row.import_id || row.slug, slug: row.slug, name: row.title },
        to: { kind: 'scripture', id: item.verse.id, name: `${item.passage.book.slug} ${item.passage.chapter.chapter_number}:${item.verse.verse_number}` },
        relation: 'scripture-reference', sourceType: 'hymn-lyrics',
        evidence: [{ kind: 'direct-quotation', text: excerpt, sourceId: row.import_id },
          { kind: 'source-metadata', text: item.verse.text, sourceId: item.verse.id }],
        confidence: 0.95, editorialStatus: 'proposed',
        provenance: { source: 'artifacts/faith-challenges/batch-*/source-batch.json', version: 'verified-passage-snapshot-v1', sourceHash: sourceSha256 } })
    }
  }
}

// A strict event rule: both names occur in the original lyric, and the referenced source passage is reviewed and public.
const transfiguration = [...verseById.values()].find(item => item.passage.book.slug === 'matthew'
  && item.passage.chapter.chapter_number === 17 && item.verse.verse_number === 1)
if (transfiguration) for (const row of rows) {
  const lyric = row.lyrics_amharic || ''
  if (row.status !== 'published' || !lyric.includes('ታቦር') || !lyric.includes('ሙሴ')) continue
  relationships.push({ id: `biblical-event:transfiguration:${row.import_id}`,
    from: { kind: 'hymn', id: row.import_id, slug: row.slug, name: row.title },
    to: { kind: 'biblical-event', id: 'transfiguration', name: 'Transfiguration' }, relation: 'biblical-event',
    sourceType: 'hymn-lyrics', evidence: [{ kind: 'clear-event', text: 'ታቦር', sourceId: row.import_id },
      { kind: 'clear-event', text: 'ሙሴ', sourceId: row.import_id },
      { kind: 'source-metadata', text: 'Matthew 17:1-5 (reviewed, published passage snapshot)', sourceId: transfiguration.verse.id }],
    confidence: 0.75, editorialStatus: 'proposed',
    provenance: { source: 'reports/mezmur-lyric-cleanup/mezmur_cleaned_classified.csv', version: 'two-clue-event-v1', sourceHash: sourceSha256 } })
  relationships.push({ id: `scripture-event:matthew-17:${row.import_id}`,
    from: { kind: 'hymn', id: row.import_id, slug: row.slug, name: row.title },
    to: { kind: 'scripture', id: `passage:${transfiguration.passage.book.id}:17:1-5`, name: 'Matthew 17:1-5' },
    relation: 'scripture-reference', sourceType: 'bible-passage',
    evidence: [{ kind: 'clear-event', text: 'ታቦር … ሙሴ', sourceId: row.import_id },
      { kind: 'source-metadata', text: 'Reviewed and published Amharic source passage; this is an event match, not a quotation.', sourceId: transfiguration.verse.id }],
    confidence: 0.7, editorialStatus: 'proposed',
    provenance: { source: 'artifacts/faith-challenges/batch-*/source-batch.json', version: 'event-passages-v1', sourceHash: sourceSha256 } })
}

const output = resolve('artifacts/knowledge-connections/candidates.json')
mkdirSync(resolve('artifacts/knowledge-connections'), { recursive: true })
writeFileSync(output, JSON.stringify({ schema: 'knowledge-connections-v1', sourceSha256, relationships, rejected }, null, 2) + '\n')
const passageCandidates = relationships.filter(item => item.relation === 'scripture-reference'
  && item.evidence.some(evidence => evidence.kind === 'clear-event')).map(item => ({
  hymnSlug: rows.find(row => row.import_id === item.from.id)?.slug || '',
  bookSlug: 'matthew', chapter: 17, reference: item.to.name || 'Matthew 17',
  event: 'Transfiguration', status: 'proposed' as const,
})).filter(item => item.hymnSlug)
writeFileSync(resolve('src/data/knowledgeCandidatePassages.ts'),
  `/** Generated from verified passage snapshots and literal lyric clues; all links await editorial review. */\n` +
  `export const KNOWLEDGE_CANDIDATE_PASSAGES = ${JSON.stringify(passageCandidates, null, 2)} as const\n`)
const legacySlugs = new Set(LEGACY_CALENDAR_CONNECTIONS.map(item => item.from.id))
const lightweightMetadata = Object.fromEntries(rows.filter(row => row.status === 'published'
  && (legacySlugs.has(row.slug) || (row.primary_occasion && row.primary_occasion !== 'General / Anytime')))
  .map(row => [row.slug, { importId: row.import_id || '', category: row.category || '', occasion: row.primary_occasion || '', language: row.primary_language || '' }]))
writeFileSync(resolve('src/data/knowledgeHymnMetadata.ts'),
  `/** Generated source-snapshot metadata. Live mezmur_public existence is still required before display. */\n` +
  `export const KNOWLEDGE_HYMN_METADATA: Record<string, { importId: string; category: string; occasion: string; language: string }> = ${JSON.stringify(lightweightMetadata, null, 2)}\n`)
console.log(JSON.stringify({ output, sourceRows: rows.length, relationships: relationships.length,
  scriptureQuotes: relationships.filter(item => item.evidence.some(e => e.kind === 'direct-quotation')).length,
  biblicalEvents: relationships.filter(item => item.relation === 'biblical-event').length,
  staleLegacyLinks: rejected.length }))
