import assert from 'node:assert/strict'
import { readFileSync } from 'node:fs'
import { duplicateQuestionDraft, makeQuestionDraft, previewQuestionImport, QUESTION_GAME_TYPES, validateQuestionDraft, type QuestionDraft, type QuestionRow } from '../src/lib/play/questionLibrary'
import { createQuestionLibraryApi, type QuestionLibraryClient } from '../src/lib/play/questionLibraryService'
import { APPROVED_QUESTIONS } from '../src/lib/play/approvedContent'

function valid(game: QuestionDraft['game_type'] = 'trivia'): QuestionDraft {
  const draft = makeQuestionDraft(game)
  draft.stable_id = `${game}-fixture`
  draft.category = game === 'who-am-i' ? 'biblical-people' : 'Bible'
  draft.payload.id = draft.stable_id
  draft.payload.category = draft.category
  draft.payload.explanation = { en: 'Sourced explanation', am: 'ማብራሪያ' }
  const source = { label: 'Genesis 1:1', route: '/bible/genesis/1', kind: 'bible' as const }
  draft.payload.source = source
  draft.source_references = [source]
  if (game === 'who-am-i') draft.payload.answer = { en: 'Adam', am: 'አዳም' }
  else if (game === 'match') {
    draft.payload.left = { en: 'Creation', am: 'ፍጥረት' }
    draft.payload.right = { en: 'Genesis', am: 'ዘፍጥረት' }
  } else {
    draft.payload.prompt = { en: 'What happened?', am: 'ምን ተከሰተ?' }
    draft.payload.options = ['a', 'b', 'c', 'd'].map((key) => ({ key, text: { en: key, am: key } }))
    if (game === 'emoji') draft.payload.emoji = '🌍'
    if (game === 'finish-the-verse') draft.payload.excerpt = { en: 'In the beginning', am: 'በመጀመሪያ' }
  }
  draft.payload.verifiedLocales = ['en', 'am']
  return draft
}

for (const game of QUESTION_GAME_TYPES) {
  assert.deepEqual(validateQuestionDraft(valid(game)), [], `${game} must accept its existing payload shape`)
}
for (const question of APPROVED_QUESTIONS) {
  assert.deepEqual(validateQuestionDraft({ stable_id: question.id, game_type: question.game,
    category: question.category, difficulty: question.difficulty, payload: question,
    source_references: [question.source] }), [], `${question.id} must retain its published payload format`)
}
const wrongAnswer = valid()
wrongAnswer.payload.correctKey = 'missing'
assert.match(validateQuestionDraft(wrongAnswer).join(' '), /correct answer/i)
const repeatedOption = valid()
repeatedOption.payload.options[1].text.en = repeatedOption.payload.options[0].text.en
assert.match(validateQuestionDraft(repeatedOption).join(' '), /distinct in English/i)
const missingEmoji = valid('emoji')
delete missingEmoji.payload.emoji
assert.match(validateQuestionDraft(missingEmoji).join(' '), /emoji clue/i)
const missingVerse = valid('finish-the-verse')
missingVerse.payload.excerpt = { en: '' }
assert.match(validateQuestionDraft(missingVerse).join(' '), /Verse excerpt/i)
const missingWho = valid('who-am-i')
missingWho.payload.answer = { en: '' }
assert.match(validateQuestionDraft(missingWho).join(' '), /Answer/i)
const missingMatch = valid('match')
missingMatch.payload.right = { en: '' }
assert.match(validateQuestionDraft(missingMatch).join(' '), /Answer/i)
for (const mode of [undefined, null, '', 'unsupported-mode']) {
  const missingMode = valid('finish-the-mezmur')
  if (mode === undefined) delete missingMode.payload.mode
  else missingMode.payload.mode = mode
  assert.match(validateQuestionDraft(missingMode).join(' '), /supported mode/i)
}
for (const mode of ['finish-lyrics', 'missing-word', 'guess-mezmur', 'guess-occasion']) {
  const supportedMode = valid('finish-the-mezmur')
  supportedMode.payload.mode = mode
  assert.deepEqual(validateQuestionDraft(supportedMode), [])
}
const missingAmharic = valid()
missingAmharic.payload.prompt = { en: 'English only' }
assert.match(validateQuestionDraft(missingAmharic).join(' '), /reviewed Amharic/i)
missingAmharic.payload.verifiedLocales = ['en']
assert.deepEqual(validateQuestionDraft(missingAmharic), [], 'English-only questions remain valid')
const unsourced = valid()
unsourced.source_references = []
assert.match(validateQuestionDraft(unsourced).join(' '), /Source references/i)
const copy = duplicateQuestionDraft(valid(), '1234abcd')
assert.equal(copy.stable_id, 'trivia-fixture-copy-1234abcd')
assert.equal(copy.payload.id, copy.stable_id)
assert.deepEqual(validateQuestionDraft(copy), [])
assert.equal(previewQuestionImport(JSON.stringify([valid()]), new Set()).items.length, 1)
assert.match(previewQuestionImport(JSON.stringify([valid(), valid()]), new Set()).errors.join(' '), /already exists/i)
assert.match(previewQuestionImport(JSON.stringify([valid()]), new Set(['trivia-fixture'])).errors.join(' '), /already exists/i)

const rows: QuestionRow[] = []
let authorized = true
let databaseError = ''
let rpcCalls = 0
function query() {
  let id = ''
  let write: Record<string, unknown> | null = null
  let mode: 'insert' | 'update' | null = null
  const api = {
    select() { return api },
    eq(_column: string, value: string) { id = value; return api },
    order() { return Promise.resolve({ data: rows, error: databaseError ? { message: databaseError } : null }) },
    insert(value: Record<string, unknown>) { write = value; mode = 'insert'; return api },
    update(value: Record<string, unknown>) { write = value; mode = 'update'; return api },
    single() {
      if (databaseError) return Promise.resolve({ data: null, error: { message: databaseError } })
      if (mode === 'insert') {
        if (write?.question_id !== write?.stable_id || write?.status !== 'draft') {
          return Promise.resolve({ data: null, error: { message: 'Both identifiers and draft status are required' } })
        }
        if (rows.some((row) => row.question_id === write?.question_id || row.stable_id === write?.stable_id)) {
          return Promise.resolve({ data: null, error: { message: 'duplicate question identifier' } })
        }
        const row = { ...write, id: `uuid-${rows.length + 1}`, review_notes: null, updated_at: 'now', published_at: null } as QuestionRow
        rows.push(row)
        return Promise.resolve({ data: row, error: null })
      }
      if (mode === 'update') {
        const index = rows.findIndex((row) => row.id === id)
        rows[index] = { ...rows[index], ...write } as QuestionRow
        return Promise.resolve({ data: rows[index], error: null })
      }
      return Promise.resolve({ data: rows.find((row) => row.id === id) || null, error: null })
    },
  }
  return api
}
const client: QuestionLibraryClient = {
  from(table) { assert.equal(table, 'play_content_items'); return query() },
  async rpc(name, args) {
    assert.equal(name, 'review_play_content')
    rpcCalls += 1
    const row = rows.find((item) => item.id === args.p_id)
    if (!row) return { data: null, error: { message: 'Not found' } }
    row.status = args.p_status as QuestionRow['status']
    return { data: row, error: null }
  },
}
let role: string = 'admin'
const library = createQuestionLibraryApi(client, async () => {
  if (!authorized) throw new Error('Staff required')
  return { profileRole: role }
})
authorized = false
await assert.rejects(library.save(valid()), /Staff required/)
await assert.rejects(library.list(), /Staff required/)
await assert.rejects(library.get('uuid-1'), /Staff required/)
await assert.rejects(library.review('uuid-1', 'review', ''), /Staff required/)
await assert.rejects(library.importDrafts(JSON.stringify([valid()]), new Set()), /Staff required/)
authorized = true
const created = await library.save(valid())
assert.equal(created.status, 'draft')
assert.equal(created.question_id, created.stable_id)
assert.equal((await library.get(created.id)).stable_id, created.stable_id)
rows[0].question_id = 'legacy-question-id'
const edited = { ...valid(), category: 'Church history', payload: { ...valid().payload, category: 'Church history' } }
assert.equal((await library.save(edited, created.id)).category, 'Church history')
assert.equal(rows[0].question_id, 'legacy-question-id', 'editing must preserve an existing question ID')
await assert.rejects(library.save({ ...edited, stable_id: 'different-id',
  payload: { ...edited.payload, id: 'different-id' } }, created.id), /stable ID cannot change/)
// Six-state workflow: draft -> review (editor or admin) -> approved/rejected (admin) -> published (admin).
role = 'editor'
await assert.rejects(library.review(created.id, 'approved', ''), /not allowed/, 'draft cannot skip review')
await assert.rejects(library.review(created.id, 'archived', ''), /not allowed/, 'editor cannot archive')
await library.review(created.id, 'review', 'Ready for an admin')
assert.equal(rows[0].status, 'review')
await assert.rejects(library.review(created.id, 'approved', ''), /not allowed/, 'editor cannot approve')
await assert.rejects(library.review(created.id, 'draft', ''), /not allowed/, 'editor cannot return review to draft')
await assert.rejects(library.save(edited, created.id), /Return this question to draft/)
role = 'admin'
await assert.rejects(library.review(created.id, 'published', ''), /not allowed/, 'review cannot publish directly')
await library.review(created.id, 'approved', 'Source checked')
assert.equal(rows[0].status, 'approved')
await assert.rejects(library.save(edited, created.id), /Return this question to draft/)
await library.review(created.id, 'published', '')
assert.equal(rows[0].status, 'published')
assert.equal(rpcCalls, 3)
await assert.rejects(library.review(created.id, 'approved', ''), /not allowed/)
await assert.rejects(library.review(created.id, 'review', ''), /not allowed/)
role = 'editor'
await assert.rejects(library.review(created.id, 'draft', ''), /not allowed/, 'editor cannot unpublish')
role = 'user'
await assert.rejects(library.review(created.id, 'draft', ''), /not allowed/, 'non-staff role is rejected client-side')
role = 'super_admin'
await library.review(created.id, 'draft', '')
assert.equal(rows[0].status, 'draft')
await library.review(created.id, 'review', '')
await library.review(created.id, 'rejected', 'Needs correction')
await assert.rejects(library.save(edited, created.id), /Return this question to draft/)
await library.review(created.id, 'archived', '')
assert.equal(rows[0].status, 'archived')
await assert.rejects(library.review(created.id, 'published', ''), /not allowed/, 'archived cannot publish directly')
await assert.rejects(library.save(edited, created.id), /Return this question to draft/)
await library.review(created.id, 'draft', '')
role = 'admin'
const imported = { ...valid('history'), stable_id: 'history-imported' }
imported.payload.id = imported.stable_id
assert.equal(await library.importDrafts(JSON.stringify([imported]), new Set(rows.map((row) => row.stable_id))), 1)
assert.equal(rows.at(-1)?.status, 'draft')
const injected = { ...valid('history'), stable_id: 'history-untrusted',
  question_id: 'forged-id', status: 'published', created_by: 'forged-user' }
injected.payload.id = injected.stable_id
assert.equal(await library.importDrafts(JSON.stringify([injected]), new Set()), 1)
assert.equal(rows.at(-1)?.question_id, 'history-untrusted')
assert.equal(rows.at(-1)?.status, 'draft')
assert.equal('created_by' in rows.at(-1)!, false, 'import must not write editorial audit fields')
const beyondDefaultPage = valid('trivia')
beyondDefaultPage.stable_id = 'trivia-beyond-default-page'
beyondDefaultPage.payload.id = beyondDefaultPage.stable_id
const completeLibrary = createQuestionLibraryApi(client, async () => ({ profileRole: 'admin' }), async () => [{
  ...beyondDefaultPage, id: 'hidden-existing-row', question_id: beyondDefaultPage.stable_id,
  status: 'published', review_notes: null, updated_at: 'now', published_at: 'now',
}])
await assert.rejects(completeLibrary.importDrafts(JSON.stringify([beyondDefaultPage]), new Set()), /already exists/,
  'complete authorized inventory must catch duplicates beyond a default API page')
await assert.rejects(library.importDrafts(JSON.stringify([{ ...imported, stable_id: 'legacy-question-id' }]), new Set()),
  /already exists/)
const invalidForReview = await library.save({ ...valid(), stable_id: 'trivia-invalid-review',
  payload: { ...valid().payload, id: 'trivia-invalid-review' } })
const invalidRow = rows.find((row) => row.id === invalidForReview.id)!
invalidRow.payload.correctKey = 'missing'
await assert.rejects(library.review(invalidForReview.id, 'review', ''), /correct answer/i)
const localOnly = await library.save(valid('who-am-i'))
await library.review(localOnly.id, 'review', '')
await library.review(localOnly.id, 'approved', '')
await assert.rejects(library.review(localOnly.id, 'published', ''), /local card bank/)
databaseError = 'column play_content_items.stable_id does not exist'
await assert.rejects(library.list(), /stable_id does not exist/)

const migration = readFileSync('docs/ai/proposed-migrations/20261102_faith_challenges_live_reconciliation.sql', 'utf8')
assert.match(migration, /new\.question_id is distinct from new\.stable_id/i)
assert.match(migration, /old\.question_id is distinct from new\.question_id/i)
assert.match(migration, /status='published' and published_at is not null/i)
assert.match(migration, /New questions must be drafts/i)
assert.match(migration, /revoke all on public\.play_content_items from public, anon, authenticated/i)
assert.doesNotMatch(migration, /grant [^;]*delete[^;]*play_content_items/i)
const publicService = readFileSync('src/lib/play/contentService.ts', 'utf8')
assert.match(publicService, /\.eq\('status', 'published'\)/)
// Historical baseline migration (already in repo); the live reconciliation proposal replaces its policies.
const playMigration = readFileSync('supabase/migrations/20261031120000_tewahedo_play_milestones_2_4.sql', 'utf8')
assert.match(playMigration, /create policy play_content_public_read[\s\S]*status = 'published' or coalesce\(public\.is_staff\(\), false\)/)
assert.match(playMigration, /create policy play_content_staff_insert[\s\S]*with check \(coalesce\(public\.is_staff\(\), false\)\)/)
assert.match(playMigration, /revoke all on public\.play_content_items from public, anon, authenticated/)
assert.match(playMigration, /grant insert, update, delete on public\.play_content_items to authenticated/)
const importScript = readFileSync('scripts/import-play-content-drafts.ts', 'utf8')
assert.match(importScript, /question_id: item\.id,[\s\S]*stable_id: item\.id/)
console.log('Faith Challenges library, editorial workflow, schema proposal, and public filtering tests passed.')
