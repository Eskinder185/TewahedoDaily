import assert from 'node:assert/strict'
import { mkdtempSync, readFileSync, rmSync, writeFileSync } from 'node:fs'
import { tmpdir } from 'node:os'
import { join } from 'node:path'
import { countPendingPassages, missingBatchInputs, shouldPrepareMore, writeMissingJson } from './campaign-orchestrator'
import { validateSourceBatch } from '../../src/lib/play/amharicBibleQuestionGenerator'
import { exclusionReasons, loadAudit, parseSingleColumnExport, type Candidate } from './prepare-play-source-batch'

assert.equal(countPendingPassages([
  { status: 'completed', passageCount: 20 },
  { status: 'pending_generation', passageCount: 20 },
  { status: 'pending_generation', passageCount: 6 },
] as Parameters<typeof countPendingPassages>[0]), 26)
assert.equal(shouldPrepareMore(200, 1000, 51, 150), true)
assert.equal(shouldPrepareMore(999, 1000, 145, 150), true)
assert.equal(shouldPrepareMore(1000, 1000, 145, 150), false)
assert.equal(shouldPrepareMore(200, 1000, 151, 150), false)

const scratch = mkdtempSync(join(tmpdir(), 'tewahedo-queue-'))
try {
  assert.equal(missingBatchInputs(scratch).length, 5)
  const source = join(scratch, 'source-batch.json')
  writeFileSync(source, '{"source":"preserve"}')
  assert.deepEqual(missingBatchInputs(scratch), ['source-manifest.json', 'eligibility-report.json', 'existing-prompts.json', 'gemini-prompt.json'])
  assert.equal(readFileSync(source, 'utf8'), '{"source":"preserve"}')
  assert.equal(writeMissingJson(source, { source: 'replacement' }), false)
  assert.equal(readFileSync(source, 'utf8'), '{"source":"preserve"}')
  for (const name of missingBatchInputs(scratch)) assert.equal(writeMissingJson(join(scratch, name), { recovered: true }), true)
  assert.deepEqual(missingBatchInputs(scratch), [])
  assert.equal(writeMissingJson(join(scratch, 'source-manifest.json'), { recovered: false }), false)
} finally {
  rmSync(scratch, { recursive: true, force: true })
}

const manifest = JSON.parse(readFileSync('artifacts/faith-challenges/campaign-manifest.json', 'utf8'))
assert.equal(manifest.pendingPassages, countPendingPassages(manifest.batches))
assert.equal(manifest.preparedPassages, manifest.usedPassages.length)
assert.equal(manifest.acceptedQuestions, new Set(JSON.parse(readFileSync('artifacts/faith-challenges/library/all-drafts.json', 'utf8')).drafts.map((draft: { question: { id: string } }) => draft.question.id)).size)
assert.ok(manifest.batches.some((batch: { passageCount: number }) => batch.passageCount < 20))
const routes = new Set<string>()
const passageIds = new Set<string>()
const verseIds = new Set<string>()
for (const item of manifest.usedPassages as Array<{ route: string; passageId: string; verseIds: string[] }>) {
  assert.equal(routes.has(item.route), false)
  assert.equal(passageIds.has(item.passageId), false)
  routes.add(item.route)
  passageIds.add(item.passageId)
  for (const verseId of item.verseIds) {
    assert.equal(verseIds.has(verseId), false)
    verseIds.add(verseId)
  }
}
const rawCandidates = JSON.parse(readFileSync('exports/play-source-candidates.json', 'utf8'))
const candidates = parseSingleColumnExport(JSON.stringify(rawCandidates), 'candidate') as Candidate[]
const byRoute = new Map(candidates.map((item) => [`/bible/${item.book.slug}/${item.chapter.chapter_number}`, item]))
const audit = await loadAudit('artifacts/bible-audit')
for (const batch of manifest.batches.slice(50) as Array<{ batchId: string; sourceHash: string }>) {
  const source = JSON.parse(readFileSync(join('artifacts/faith-challenges', batch.batchId, 'source-batch.json'), 'utf8'))
  assert.equal((await validateSourceBatch(source)).sourceHash, batch.sourceHash)
  for (const passage of source.passages) {
    const route = `/bible/${passage.book.slug}/${passage.chapter.chapter_number}`
    const candidate = byRoute.get(route)
    assert.ok(candidate)
    assert.deepEqual(exclusionReasons(candidate, audit), [])
  }
}
console.log('Campaign queue count, partial-batch progress, and interrupted-input checks passed.')
