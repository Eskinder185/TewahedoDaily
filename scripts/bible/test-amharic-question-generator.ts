import assert from 'node:assert/strict'
import { spawnSync } from 'node:child_process'
import { existsSync, mkdtempSync, readFileSync, rmSync, writeFileSync } from 'node:fs'
import { tmpdir } from 'node:os'
import { join } from 'node:path'
import { buildAmharicQuestionPrompt, validateAmharicQuestionResponse, validateSourceBatch,
  type SourceBatch } from '../../src/lib/play/amharicBibleQuestionGenerator'

const edition = { id: '00000000-0000-0000-0000-000000000001', code: 'am', review_status: 'reviewed', is_public: true,
  publication_status: 'published' as const, canon_code: 'fixture-ethiopian-canon',
  numbering_scheme: 'source', updated_at: '2026-10-01T00:00:00Z' }
const book = { id: '00000000-0000-0000-0000-000000000002', slug: 'fixture-book', name_am: 'የሙከራ መጽሐፍ',
  canonical_number: 70, source_status: 'available' as const }
const sourceBook = { id: '00000000-0000-0000-0000-000000000003', edition_id: edition.id, canonical_book_id: book.id,
  review_status: 'reviewed', is_public: true, publication_status: 'published' as const,
  updated_at: '2026-10-02T00:00:00Z' }
const chapter = { id: '00000000-0000-0000-0000-000000000004', source_book_id: sourceBook.id, chapter_number: 7,
  updated_at: '2026-10-03T00:00:00Z' }
const verseA = { id: '00000000-0000-0000-0000-000000000005', chapter_id: chapter.id, verse_number: 2, source_order: 2,
  text: 'በተራራው ላይ አበባ አደገች።', updated_at: '2026-10-03T00:00:00Z' }
const verseB = { id: '00000000-0000-0000-0000-000000000006', chapter_id: chapter.id, verse_number: 5, source_order: 5,
  text: 'ብርሃን በጨለማ ውስጥ በራ።', updated_at: '2026-10-03T00:00:00Z' }
const batch: SourceBatch = { version: 1, passages: [
  { id: 'passage-trivia', edition, book, sourceBook, chapter, verses: [verseA] },
  { id: 'passage-finish', edition, book, sourceBook, chapter, verses: [verseB] },
] }
const modelId = 'fixture-model-exact'
const { sourceHash } = await validateSourceBatch(batch)
const prompt = await buildAmharicQuestionPrompt(batch, modelId)
assert.equal(prompt.sourceHash, sourceHash)
assert.match(prompt.prompt, /Amharic prompts, answers and explanations first/)
assert.match(prompt.prompt, /Do not infer missing verses, renumber chapters/)
assert.equal(prompt.schema.additionalProperties, false)

const trivia = { passageId: 'passage-trivia', game: 'trivia', category: 'Bible', difficulty: 'beginner',
  prompt: { am: 'በተራራው ላይ ምን አደገች?', en: 'What grew on the mountain?' },
  options: [
    { key: 'a', text: { am: 'አበባ', en: 'Flower' } },
    { key: 'b', text: { am: 'ወንዝ', en: 'River' } },
    { key: 'c', text: { am: 'ዛፍ', en: 'Tree' } },
    { key: 'd', text: { am: 'ቤት', en: 'House' } },
  ], correctKey: 'a', explanation: { am: 'በምንጩ ውስጥ አበባ ተጠቅሷል።', en: 'The source mentions a flower.' },
  evidence: { verseId: verseA.id, quoteAm: 'አበባ' }, excerpt: null }
const finish = { passageId: 'passage-finish', game: 'finish-the-verse', category: 'Bible', difficulty: 'growing',
  prompt: { am: 'የተሰጠውን ሐረግ ጨርሱ።', en: 'Finish the supplied phrase.' },
  options: [
    { key: 'a', text: { am: 'በራ', en: 'Shone' } },
    { key: 'b', text: { am: 'ጠፋ', en: 'Vanished' } },
    { key: 'c', text: { am: 'አደገ', en: 'Grew' } },
    { key: 'd', text: { am: 'ተኛ', en: 'Slept' } },
  ], correctKey: 'a', explanation: { am: 'ሐረጉ በራ በሚለው ይቀጥላል።', en: 'The phrase continues with shone.' },
  evidence: { verseId: verseB.id, quoteAm: 'በራ' },
  excerpt: { am: 'ብርሃን በጨለማ ውስጥ', en: 'Light in darkness' } }
const response = { version: 1, sourceHash, modelId, questions: [trivia, finish] }
const result = await validateAmharicQuestionResponse(batch, modelId, response)
assert.equal(result.drafts.length, 2)
assert.ok(result.drafts.every((draft) => draft.status === 'draft' && draft.editorialReviewRequired &&
  draft.question.verifiedLocales.length === 0 && draft.provenance.modelId === modelId))
assert.equal(result.drafts[0].question.source.sourceId, verseA.id)
assert.equal(result.drafts[0].provenance.canonCode, edition.canon_code)
assert.equal(result.drafts[0].provenance.numberingScheme, edition.numbering_scheme)
assert.equal(result.drafts[0].question.source.route, '/bible/fixture-book/7?edition=am#verse-2')
assert.equal(result.drafts[1].question.excerpt?.am, finish.excerpt.am)
assert.deepEqual(result.drafts.map((draft) => draft.question.category), ['Bible', 'Bible'])
assert.deepEqual((await validateAmharicQuestionResponse(batch, modelId, response)).drafts, result.drafts)

async function rejects(code: string, source: unknown, value: unknown, existing: string[] = []) {
  await assert.rejects(validateAmharicQuestionResponse(source, modelId, value, existing),
    (error: unknown) => error instanceof Error && 'code' in error && error.code === code)
}
await assert.rejects(validateSourceBatch({ ...batch, passages: [{ ...batch.passages[0], edition: { ...edition, code: 'web' } }] }),
  /reviewed, public Amharic source/)
await assert.rejects(validateSourceBatch({ ...batch, passages: [{ ...batch.passages[0], sourceBook: { ...sourceBook, is_public: false } }] }),
  /reviewed, public Amharic source/)
await assert.rejects(validateSourceBatch({ ...batch, passages: [{ ...batch.passages[0], verses: [{ ...verseA, chapter_id: 'wrong' }] }] }),
  /missing, blank, duplicate, or mismatched/)
await assert.rejects(validateSourceBatch({ ...batch, passages: Array.from({ length: 21 }, () => batch.passages[0]) }),
  /bounded passages/)
await rejects('GENERATION_RESPONSE_INVALID', batch, { ...response, modelId: 'substituted-model' })
await rejects('GENERATION_RESPONSE_INVALID', { ...batch, passages: [{ ...batch.passages[0], verses: [{ ...verseA, text: 'changed' }] }, batch.passages[1]] }, response)
await rejects('QUESTION_EVIDENCE_UNSUPPORTED', batch, { ...response, questions: [{ ...trivia, evidence: { ...trivia.evidence, quoteAm: 'ያልተጠቀሰ' } }] })
await rejects('QUESTION_EVIDENCE_UNSUPPORTED', batch, { ...response, questions: [{ ...trivia,
  options: [{ ...trivia.options[0], text: { am: 'አበ', en: 'Flo' } }, ...trivia.options.slice(1)],
  evidence: { ...trivia.evidence, quoteAm: 'አበ' } }] })
await rejects('QUESTION_ANSWER_AMBIGUOUS', batch, { ...response, questions: [{ ...trivia,
  options: [trivia.options[0], { key: 'b', text: { am: 'አደገች', en: 'Grew' } }, ...trivia.options.slice(2)] }] })
await rejects('QUESTION_ANSWER_AMBIGUOUS', batch, { ...response, questions: [{ ...trivia,
  options: [trivia.options[0], { key: 'b', text: { am: 'አበባ', en: 'Flower' } }, ...trivia.options.slice(2)] }] })
await rejects('QUESTION_VERSE_FRAGMENT_INVALID', batch, { ...response, questions: [{ ...finish,
  excerpt: { ...finish.excerpt, am: 'ብርሃን' } }] })
await rejects('QUESTION_DUPLICATE', batch, { ...response, questions: [trivia] }, [trivia.prompt.am])
await rejects('QUESTION_DUPLICATE', batch, { ...response, questions: [trivia] }, ['በተራራው ላይ ምን በእውነት አደገች?'])
await rejects('QUESTION_SHAPE_INVALID', batch, { ...response, questions: [{ ...trivia, category: 'New Testament' }] })
await rejects('QUESTION_OPTIONS_INVALID', batch, { ...response, questions: [{ ...trivia, options: trivia.options.slice(0, 3) }] })

const dir = mkdtempSync(join(tmpdir(), 'td-amharic-generator-'))
try {
  const sourcePath = join(dir, 'source.json')
  const responsePath = join(dir, 'response.json')
  const promptPath = join(dir, 'prompt.json')
  const draftPath = join(dir, 'drafts.json')
  const reportPath = join(dir, 'report.json')
  writeFileSync(sourcePath, JSON.stringify(batch))
  writeFileSync(responsePath, JSON.stringify(response))
  const run = spawnSync(process.execPath, ['--import', 'tsx', 'scripts/bible/generate-amharic-play-drafts.ts',
    '--source', sourcePath, '--model', modelId, '--prompt-out', promptPath,
    '--response-in', responsePath, '--draft-out', draftPath, '--report-out', reportPath],
  { encoding: 'utf8', timeout: 10_000 })
  assert.equal(run.status, 0, run.stderr)
  const output = JSON.parse(readFileSync(draftPath, 'utf8'))
  assert.equal(output.status, 'draft')
  assert.equal(output.drafts.length, 2)
  assert.equal(output.drafts[0].question.verifiedLocales.length, 0)
  assert.equal(JSON.parse(readFileSync(reportPath, 'utf8')).publication, 'not_allowed')
  const promptOnly = join(dir, 'prompt-only.json')
  const prepare = spawnSync(process.execPath, ['--import', 'tsx', 'scripts/bible/generate-amharic-play-drafts.ts',
    '--source', sourcePath, '--model', modelId, '--prompt-out', promptOnly], { encoding: 'utf8', timeout: 10_000 })
  assert.equal(prepare.status, 0, prepare.stderr)
  assert.equal(JSON.parse(readFileSync(promptOnly, 'utf8')).sourceHash, sourceHash)
  const invalidResponse = join(dir, 'invalid-response.json')
  const invalidDrafts = join(dir, 'invalid-drafts.json')
  writeFileSync(invalidResponse, JSON.stringify({ ...response, sourceHash: '0'.repeat(64) }))
  const invalid = spawnSync(process.execPath, ['--import', 'tsx', 'scripts/bible/generate-amharic-play-drafts.ts',
    '--source', sourcePath, '--model', modelId, '--prompt-out', join(dir, 'invalid-prompt.json'),
    '--response-in', invalidResponse, '--draft-out', invalidDrafts, '--report-out', join(dir, 'invalid-report.json')],
  { encoding: 'utf8', timeout: 10_000 })
  assert.notEqual(invalid.status, 0)
  assert.equal(existsSync(invalidDrafts), false, 'invalid responses must not produce drafts')
  const repeat = spawnSync(process.execPath, ['--import', 'tsx', 'scripts/bible/generate-amharic-play-drafts.ts',
    '--source', sourcePath, '--model', modelId, '--prompt-out', promptPath], { encoding: 'utf8', timeout: 10_000 })
  assert.notEqual(repeat.status, 0, 'existing output must not be overwritten')
} finally { rmSync(dir, { recursive: true, force: true }) }
console.log('Amharic-first offline question foundation passed.')
