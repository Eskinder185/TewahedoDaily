// Converter test. Fixture candidates are built from the local audited snapshot purely to exercise
// the audit/hash gates; fixture IDs are synthetic and this output is never sent to a model.
import assert from 'node:assert/strict'
import { readFileSync } from 'node:fs'
import { validateSourceBatch } from '../../src/lib/play/amharicBibleQuestionGenerator'
import { exclusionReasons, loadAudit, parseCsv, parseSingleColumnExport, preparePlaySourceBatch, type Candidate } from './prepare-play-source-batch'

const audit = await loadAudit('artifacts/bible-audit')
const files = parseCsv(readFileSync('artifacts/bible-audit/10-file-level-report.csv', 'utf8')).filter((row) => row.edition === 'am')
let serial = 0
const uuid = () => `00000000-0000-4000-8000-${String(++serial).padStart(12, '0')}`
const edition = { id: uuid(), code: 'am', name: 'fixture', language_code: 'am', review_status: 'reviewed', is_public: true,
  source_metadata: {}, source_edition: null, attribution: null, rights_status: 'unknown', canon_code: 'eotc-81',
  numbering_scheme: 'source', publication_status: 'published', created_at: 't', updated_at: '2026-10-01T00:00:00Z' } as const

function candidate(sourceBook: number, chapterNumber: number, verseCount = 5): Candidate {
  const file = files.find((row) => Number(row.source_book) === sourceBook)!
  const json = JSON.parse(readFileSync(`artifacts/bible-audit/original-snapshot/am/${file.source_file.split('/').pop()}`, 'utf8'))
  const chapter = json.chapters.find((item: { chapter: number }) => item.chapter === chapterNumber)
  const bookId = uuid(); const sourceId = uuid(); const chapterId = uuid()
  return {
    edition: { ...edition },
    book: { id: bookId, canonical_number: sourceBook, collection: 'old', slug: file.canonical_book, name_en: null,
      name_am: json.book_name_am, sort_order: sourceBook, source_status: 'available', created_at: 't', updated_at: 't' },
    sourceBook: { id: sourceId, edition_id: edition.id, canonical_book_id: bookId, source_book_number: sourceBook,
      source_file: file.source_file, source_name_en: null, source_name_am: null, source_short_name_en: null,
      source_short_name_am: null, source_order: sourceBook, source_part: null, source_metadata: {}, review_status: 'reviewed',
      is_public: true, publication_status: 'published', created_at: 't', updated_at: '2026-10-02T00:00:00Z' },
    chapter: { id: chapterId, source_book_id: sourceId, chapter_number: chapterNumber, source_order: chapterNumber,
      created_at: 't', updated_at: '2026-10-03T00:00:00Z' },
    sectionOrder: 1,
    verses: chapter.sections[0].verses.slice(0, verseCount).map((verse: { verse: number; text: string }, index: number) => ({
      id: uuid(), chapter_id: chapterId, section_id: uuid(), verse_number: verse.verse, source_order: index + 1,
      text: verse.text, updated_at: '2026-10-03T00:00:00Z' })),
  }
}

// Clean chapters pass every gate.
const clean = [candidate(8, 1), candidate(1, 2), candidate(6, 1), candidate(7, 2)]
for (const item of clean) assert.deepEqual(exclusionReasons(item, audit), [], `${item.book.slug} ${item.chapter.chapter_number} should be eligible`)
// Exodus 30 (source book 2) carries unresolved REPEATED_TEXT_IN_CHAPTER signals.
assert.ok(exclusionReasons(candidate(2, 30), audit).some((reason) => reason.startsWith('unresolved_anomaly_')))
// Text changed after the audit is excluded rather than trusted.
const edited = candidate(8, 2)
edited.verses[0] = { ...edited.verses[0], text: `${edited.verses[0].text} ` }
assert.ok(exclusionReasons(edited, audit).includes('database_text_differs_from_audited_snapshot'))
// Direct (section-less) verses cannot be matched to the audit and are excluded.
assert.ok(exclusionReasons({ ...candidate(8, 3), sectionOrder: 0 }, audit).includes('snapshot_position_unknown_direct_verses'))

// Unknown rights block the batch but still produce an eligibility report.
const blocked = await preparePlaySourceBatch({ candidates: [...clean, candidate(2, 30)], inventory: [], localQuestions: [], audit, count: 3, maxVerses: 5 })
assert.match(String(blocked.blocked), /rights_status is "unknown"/)
assert.equal(blocked.eligibility.eligibleChapters, 4)
assert.equal('batch' in blocked, false)

// With transferable rights the existing exporter builds a batch accepted by the generator contract.
const licensed = clean.map((item) => ({ ...item, edition: { ...item.edition, rights_status: 'public_domain' as const } }))
const inventory = [{ stable_id: 'x', status: 'draft', source: { route: '/bible/ruth/1?edition=am#verse-1' }, prompt: { am: 'ነባር ጥያቄ' } }]
const ready = await preparePlaySourceBatch({ candidates: licensed, inventory, localQuestions: [], audit, count: 3, maxVerses: 5 })
assert.equal(ready.blocked, null)
assert.ok('batch' in ready)
if ('batch' in ready) {
  await validateSourceBatch(ready.batch)
  assert.equal(ready.batch.passages.length, 3)
  assert.equal(ready.batch.passages.some((passage) => passage.book.slug === 'ruth'), false, 'used route must be skipped')
  assert.deepEqual(ready.existingPrompts, ['ነባር ጥያቄ'])
  assert.ok(ready.sourceBytes <= 65_536)
}

// Both SQL Editor export formats parse.
const row = { question: { stable_id: 'a', prompt: { am: 'ጥ' } } }
assert.deepEqual(parseSingleColumnExport(JSON.stringify([row]), 'question'), [row.question])
assert.deepEqual(parseSingleColumnExport(`question\n"${JSON.stringify(row.question).replaceAll('"', '""')}"\n`, 'question'), [row.question])

// Owner authorization tests:
// 1. Invalid or incomplete owner authorization throws.
const invalidAuth = { mode: 'owner_authorized' as const, basis: 'short', authorizedBy: 'owner', recordedAt: new Date().toISOString() }
await assert.rejects(preparePlaySourceBatch({ candidates: clean, inventory: [], localQuestions: [], audit, count: 2, maxVerses: 5, ownerAuthorization: invalidAuth }),
  /written basis \(10\+ characters\)/)

// 2. Deliberate owner authorization permits export when database rights_status is 'unknown'.
const validAuth = {
  mode: 'owner_authorized' as const,
  basis: 'Website owner confirmed authorization for AI-assisted Faith Challenges generation using controlled Bible content.',
  authorizedBy: 'site-owner',
  recordedAt: '2026-11-03T20:00:00.000Z',
}
const authorizedResult = await preparePlaySourceBatch({
  candidates: [...clean, candidate(2, 30)],
  inventory: [],
  localQuestions: [],
  audit,
  count: 3,
  maxVerses: 5,
  ownerAuthorization: validAuth,
})
assert.equal(authorizedResult.blocked, null)
assert.ok('batch' in authorizedResult)
if ('batch' in authorizedResult) {
  await validateSourceBatch(authorizedResult.batch)
  assert.equal(authorizedResult.batch.passages.length, 3)
  // Database rights status remains unchanged as 'unknown'
  assert.equal(authorizedResult.batch.passages[0].edition.review_status, 'reviewed')
  assert.equal(authorizedResult.eligibility.rights.rightsStatus, 'unknown')
  assert.equal(authorizedResult.manifest.rightsStatus, 'unknown')
  // Manifest records explicit authorization basis, scoped only to Bible edition
  assert.equal(authorizedResult.manifest.externalAiTransfer, 'permitted_owner_authorized')
  const sourceUse = authorizedResult.manifest.sourceUse as Record<string, unknown>
  assert.equal(sourceUse.mode, 'owner_authorized')
  assert.equal(sourceUse.authorizedBy, 'site-owner')
  assert.equal((sourceUse.scope as Record<string, unknown>).kind, 'bible_edition')
  assert.deepEqual(sourceUse.excludedScopes, ['church-library', 'mezmur', 'synaxarium', 'images', 'third-party'])
  assert.equal(sourceUse.databaseRightsStatusUnchanged, 'unknown')
}

// 3. Source integrity checks CANNOT be bypassed by owner authorization:
// Anomaly chapters (Exodus 30) are STILL excluded.
const anomalyOnly = [candidate(2, 30)]
const anomalyResult = await preparePlaySourceBatch({
  candidates: anomalyOnly,
  inventory: [],
  localQuestions: [],
  audit,
  count: 1,
  maxVerses: 5,
  ownerAuthorization: validAuth,
})
assert.equal(anomalyResult.eligibility.eligibleChapters, 0)
assert.ok(anomalyResult.eligibility.exclusionReasonCounts['unresolved_anomaly_repeated_text_in_chapter'] >= 1)
assert.match(String(anomalyResult.blocked), /eligible/i)

console.log('Faith Challenges source-batch converter checks passed.')

