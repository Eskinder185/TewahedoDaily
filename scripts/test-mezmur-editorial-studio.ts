import assert from 'node:assert/strict'
import { readFileSync } from 'node:fs'
import { createHash } from 'node:crypto'
import {
  activeEvents, catalogSummary, createEditorialSearchIndex, makeReviewEvent, previewBulkCategory, rollbackGroup,
  searchEditorialRows, validateAudit, validateCatalog,
} from '../src/lib/mezmur/editorialReview.ts'

const raw = JSON.parse(readFileSync('artifacts/mezmur-editorial-studio/catalog.json', 'utf8'))
const catalog = validateCatalog(raw)
assert.equal(catalog.rows.length, 2531)
assert.equal(catalog.semanticCompleted, 25)
const sourceHash = createHash('sha256').update(readFileSync('reports/mezmur-lyric-cleanup/mezmur_cleaned_classified.csv')).digest('hex')
assert.equal(catalog.sourceSha256, sourceHash)
const summary = catalogSummary(catalog, [])
assert.equal(summary.total, 2531)
assert.equal(summary.classified + summary.unclassified, summary.total)
assert.equal(summary.semanticProposals, 25)
assert.equal(summary.approved, 0)
assert.ok(summary.possibleDuplicates > 0)

const reviewed = catalog.rows.find(row => row.semanticReviewed && row.proposedCategorySlug === 'kidus-uriel')!
assert.ok(reviewed.evidence.length)
assert.ok(reviewed.evidence.every(item => reviewed.lyrics[item.field].includes(item.text)))
assert.ok(searchEditorialRows(catalog.rows, reviewed.importId).some(row => row.importId === reviewed.importId))
assert.ok(searchEditorialRows(catalog.rows, reviewed.titleAmharic).some(row => row.importId === reviewed.importId))
assert.equal(searchEditorialRows(catalog.rows, '').length, catalog.rows.length)
const searchIndex = createEditorialSearchIndex(catalog.rows)
assert.deepEqual(searchEditorialRows(catalog.rows, reviewed.titleAmharic, searchIndex).map(row => row.importId),
  searchEditorialRows(catalog.rows, reviewed.titleAmharic).map(row => row.importId))

const basics = { catalog, row: reviewed, events: [], role: 'editor', reviewerId: 'staff-1', kind: 'category' as const,
  decision: 'approve' as const, note: '', now: '2026-11-05T12:00:00.000Z', id: 'decision-1' }
assert.throws(() => makeReviewEvent({ ...basics, role: 'user' }), /Editor access/)
const approved = makeReviewEvent(basics)
assert.equal(approved.originalTextHash, reviewed.originalTextHash)
assert.equal(approved.selectedValue, reviewed.proposedCategorySlug)
assert.equal(approved.previousValue, reviewed.currentCategory)
assert.deepEqual(approved.evidence, reviewed.evidence.map(item => item.text))
assert.equal(catalogSummary(catalog, [approved]).approved, 1)
assert.throws(() => makeReviewEvent({ ...basics, row: { ...reviewed, evidence: [] } }), /literal evidence/)
assert.throws(() => makeReviewEvent({ ...basics, row: { ...reviewed, evidence: [{ text: 'fabricated', field: 'lyrics_amharic' }] } }), /Evidence no longer matches/)
assert.throws(() => makeReviewEvent({ ...basics, decision: 'select', selectedValue: 'unsupported', note: 'test' }), /supported taxonomy/)
assert.throws(() => makeReviewEvent({ ...basics, decision: 'reject' }), /Explain the rejection/)
const occasion = makeReviewEvent({ ...basics, kind: 'occasion', decision: 'select', selectedValue: 'general', note: 'Editor verified use' })
assert.equal(occasion.kind, 'occasion')
assert.equal(catalogSummary(catalog, [occasion]).approved, 0)

const pair = catalog.rows.filter(row => row.semanticReviewed && row.proposedCategorySlug === 'virgin-mary' && row.confidence === 'high' && !row.conflict).slice(0, 2)
assert.equal(pair.length, 2)
const preview = previewBulkCategory(catalog, pair.map(row => row.importId), [])
assert.equal(preview.eligible, true)
assert.equal(previewBulkCategory(catalog, [pair[0].importId, reviewed.importId], []).eligible, false)
assert.equal(previewBulkCategory(catalog, [pair[0].importId, pair[1].importId], [makeReviewEvent({ ...basics, row: pair[0], id: 'existing' })]).eligible, false)
const group = 'bulk-1'
const events = pair.map((row, i) => makeReviewEvent({ ...basics, row, id: `bulk-${i}`, groupId: group }))
assert.equal(catalogSummary(catalog, events).approved, 2)
const rollback = rollbackGroup(catalog, events, group, 'staff-1', 'editor')
assert.equal(activeEvents([...events, ...rollback]).size, 0)
assert.equal(catalogSummary(catalog, [...events, ...rollback]).approved, 0)
assert.throws(() => rollbackGroup(catalog, [...events, ...rollback], group, 'staff-1', 'editor'), /already rolled back/)
assert.deepEqual(validateAudit({ schema: 'mezmur-editorial-audit-v1', sourceSha256: catalog.sourceSha256, events }, catalog), events)
assert.throws(() => validateAudit({ schema: 'mezmur-editorial-audit-v1', sourceSha256: 'wrong', events }, catalog), /source/)
assert.throws(() => validateAudit({ schema: 'mezmur-editorial-audit-v1', sourceSha256: catalog.sourceSha256,
  events: [{ ...approved, originalTextHash: 'wrong' }] }, catalog), /invalid or mismatched/)

console.log('Mezmur editorial studio: 2531 source rows, 25 semantic reviews, authorization, evidence, decisions, bulk and rollback passed')
