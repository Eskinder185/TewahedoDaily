import assert from 'node:assert/strict'
import { existsSync, readFileSync } from 'node:fs'
import { join } from 'node:path'
import { validateAmharicQuestionResponse, validateSourceBatch } from '../../src/lib/play/amharicBibleQuestionGenerator'
import { previewQuestionImport } from '../../src/lib/play/questionLibrary'

const root = 'artifacts/faith-challenges'
const library = JSON.parse(readFileSync(join(root, 'library/all-drafts.json'), 'utf8'))
const manifest = JSON.parse(readFileSync(join(root, 'campaign-manifest.json'), 'utf8'))
assert.equal(library.totalDrafts, manifest.acceptedQuestions)
assert.equal(manifest.acceptedQuestions, new Set(library.drafts.map((draft: { question: { id: string } }) => draft.question.id)).size)
assert.equal(manifest.geminiExecution.callsMade, 0)
const ids = new Set<string>()
const passages = new Set<string>()
for (const draft of library.drafts) {
  assert.equal(draft.status, 'draft')
  assert.deepEqual(draft.question.verifiedLocales, [])
  assert.equal(ids.has(draft.question.id), false)
  assert.equal(passages.has(draft.provenance.passageId), false)
  ids.add(draft.question.id)
  passages.add(draft.provenance.passageId)
}
for (const batchId of manifest.completedBatches.filter((id: string) => id !== 'batch-001')) {
  const number = Number(batchId.slice(-3))
  const dir = join(root, batchId)
  const source = JSON.parse(readFileSync(join(dir, 'source-batch.json'), 'utf8'))
  const sourceManifest = JSON.parse(readFileSync(join(dir, 'source-manifest.json'), 'utf8'))
  const responseFile = existsSync(join(dir, 'gemini-response.json')) ? 'gemini-response.json' : 'offline-response.json'
  const response = existsSync(join(dir, responseFile)) ? JSON.parse(readFileSync(join(dir, responseFile), 'utf8')) : null
  const drafts = JSON.parse(readFileSync(join(dir, 'drafts.json'), 'utf8'))
  const report = JSON.parse(readFileSync(join(dir, 'report.json'), 'utf8'))
  const cms = readFileSync(join(dir, 'cms-import.json'), 'utf8')
  const hash = (await validateSourceBatch(source)).sourceHash
  assert.equal(hash, sourceManifest.sourceHash)
  if (response) assert.equal(hash, response.sourceHash)
  assert.equal(hash, drafts.sourceHash)
  if (response) {
    const checked = await validateAmharicQuestionResponse(source, response.modelId, response, [])
    assert.equal(checked.drafts.length, 20)
    if (number >= 8) {
      assert.deepEqual(checked.drafts.map((draft) => draft.question), drafts.drafts.map((draft: { question: unknown }) => draft.question))
    }
  }
  for (const draft of drafts.drafts) {
    const passage = source.passages.find((item: { id: string }) => item.id === draft.provenance.passageId)
    const verse = passage?.verses.find((item: { id: string }) => item.id === draft.provenance.evidenceVerseId)
    const answer = draft.question.options.find((item: { key: string }) => item.key === draft.question.correctKey)
    assert.ok(verse?.text.includes(answer?.text.am))
  }
  assert.equal(report.accepted, drafts.drafts.length)
  assert.equal(report.rejected, 0)
  const preview = previewQuestionImport(cms, new Set<string>())
  assert.equal(preview.errors.length, 0)
  assert.equal(preview.items.length, drafts.drafts.length)
  console.log(`${batchId}: ${drafts.drafts.length} source-verified drafts, CMS preview passed`)
}
const aggregate = JSON.parse(readFileSync(join(root, 'library/cms-import-all.json'), 'utf8'))
assert.equal(aggregate.length, manifest.acceptedQuestions)
let packaged = 0
for (const part of manifest.cmsImportParts as Array<{ path: string; count: number }>) {
  const preview = previewQuestionImport(readFileSync(part.path, 'utf8'), new Set<string>())
  assert.equal(preview.errors.length, 0)
  assert.equal(preview.items.length, part.count)
  packaged += part.count
}
assert.equal(packaged, manifest.acceptedQuestions)
console.log(`Offline campaign aggregate: ${manifest.acceptedQuestions} unique draft IDs and passages; ${manifest.pendingBatches[0]} next`)
