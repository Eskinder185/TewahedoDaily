import assert from 'node:assert/strict'
process.env.VITE_SUPABASE_URL = 'https://database-play.invalid'
process.env.VITE_SUPABASE_PUBLISHABLE_KEY = 'synthetic-public-key'
const { STUDIO_GAMES, newStudioRecord, toQuestionDraft, isServerStudioDraft, newHistoryTimelineRecord } = await import('../src/lib/play/contentStudio')
const { toStudioActivityDraft, validateLibraryDraft, fromLibraryRow, publicActivityDraft } = await import('../src/lib/play/studioActivity')
const { createPublishedContentLoader } = await import('../src/lib/play/publishedContent')
const { createQuestionLibraryApi } = await import('../src/lib/play/questionLibraryService')
const { fetchSelectedMezmurLyrics } = await import('../src/lib/play/selectedMezmurSource')
import type { QuestionDraft, QuestionRow } from '../src/lib/play/questionLibrary'
import type { PublicContentClient } from '../src/lib/play/publishedContent'
import type { StudioGame } from '../src/lib/play/contentStudio'
import type { QuestionLibraryClient } from '../src/lib/play/questionLibraryService'
import type { SelectedMezmurClient } from '../src/lib/play/selectedMezmurSource'

const owner = '11111111-1111-4111-8111-111111111111'
let passed = 0
const test = async (name: string, run: () => unknown | Promise<unknown>) => { await run(); passed++; console.log(`PASS ${name}`) }
function fixture(game: StudioGame) {
  const record = newStudioRecord(game, owner)
  if (record.draft.game === 'who-am-i') record.draft.content.verifiedLocales = ['en']
  if (record.draft.game === 'match') record.draft.content.forEach(pair => { pair.verifiedLocales = ['en'] })
  if (record.draft.game === 'finish-the-mezmur') Object.assign(record.draft.content, { slug: 'fixture-song', title: 'Synthetic source', lyrics_amharic: Array.from({ length: 6 }, (_, i) => `የሙከራ ግጥም ቃል ${i}`).join('\n') })
  return record
}
function published(draft: QuestionDraft): QuestionRow { return { ...draft, id: crypto.randomUUID(), question_id: draft.stable_id, status: 'published', published_at: '2026-11-04T12:00:00Z', updated_at: '2026-11-04T12:00:00Z', review_notes: null } }
function fake(initial: QuestionRow[], ignoreFilters = false) {
  let rows = initial, calls = 0
  const requests: { table: string; filters: [string, string][]; start: number; end: number; signal?: AbortSignal }[] = []
  const client = { from(table: string) {
    const filters: [string, string][] = []; let signal: AbortSignal | undefined
    return { select() { return this }, eq(k: string, v: string) { filters.push([k, v]); return this }, not(k: string) { assert.equal(k, 'published_at'); return this },
      order() { return this }, abortSignal(s: AbortSignal) { signal = s; return this }, async range(start: number, end: number) {
        calls++; requests.push({ table, filters, start, end, signal })
        return { data: rows.filter(row => ignoreFilters || filters.every(([k, v]) => row[k as keyof QuestionRow] === v)).slice(start, end + 1), error: null }
      } }
  } } as unknown as PublicContentClient
  return { client, requests, calls: () => calls, set: (next: QuestionRow[]) => { rows = next } }
}
const publicSources = async <T>(sources: T[]) => sources
for (const { id: game } of STUDIO_GAMES) await test(`${game}: existing Studio payload round-trips through published-only typed loader`, async () => {
  const record = fixture(game), draft = isServerStudioDraft(record.draft) ? toQuestionDraft(record.draft) : toStudioActivityDraft(record)
  assert.deepEqual(validateLibraryDraft(draft), [])
  const row = published(draft), db = fake([row])
  const result = await createPublishedContentLoader(db.client, publicSources)(game)
  assert.equal(result.length, 1); assert.equal(result[0].game, game)
  if (game === 'finish-the-mezmur') {
    const reopened = fromLibraryRow(row, owner)?.draft
    if (reopened?.game !== 'finish-the-mezmur') throw new Error('fixture')
    assert.equal(reopened.content.slug, 'fixture-song'); assert.equal(reopened.content.lyrics_amharic, '', 'never store a rights-stale lyric copy in a public Play row')
  } else assert.deepEqual(fromLibraryRow(row, owner)?.draft, record.draft)
  assert.equal(db.requests[0].table, 'play_content_items')
  assert.deepEqual(db.requests[0].filters, [['game_type', game], ['status', 'published']])
  assert.deepEqual([db.requests[0].start, db.requests[0].end], [0, 99])
})
await test('History chronology stays distinct from quiz questions and uses its actual event/year payload', async () => {
  const record = newHistoryTimelineRecord(owner), draft = toStudioActivityDraft(record)
  assert.deepEqual(validateLibraryDraft(draft), [])
  const db = fake([published(draft)])
  assert.equal((await createPublishedContentLoader(db.client, publicSources)('history'))[0].game, 'history')
})
await test('every unpublished status, missing timestamp, wrong game and mismatched identifier fail closed', async () => {
  const row = published(toQuestionDraft(fixture('trivia').draft))
  for (const change of [{ status: 'draft' }, { status: 'review' }, { status: 'approved' }, { status: 'rejected' }, { status: 'archived' }, { published_at: null }, { published_at: 'invalid' }, { game_type: 'emoji' }, { question_id: 'wrong-id' }]) {
    const db = fake([{ ...row, ...change } as QuestionRow], true)
    await assert.rejects(createPublishedContentLoader(db.client, publicSources)('trivia'), /incompatible/)
  }
})
await test('no client, backend failure and no published content never substitute a static bank', async () => {
  await assert.rejects(createPublishedContentLoader(null, publicSources)('trivia'), /unavailable/)
  assert.deepEqual(await createPublishedContentLoader(fake([]).client, publicSources)('trivia'), [])
})
await test('pending reads deduplicate, but a new session rechecks publication after unpublish', async () => {
  const db = fake([published(toQuestionDraft(fixture('trivia').draft))]), load = createPublishedContentLoader(db.client, publicSources)
  const [a, b] = await Promise.all([load('trivia'), load('trivia')]); assert.deepEqual(a, b); assert.equal(db.calls(), 1)
  db.set([]); assert.deepEqual(await load('trivia'), []); assert.equal(db.calls(), 2)
})
await test('pagination stays game-scoped with stable metadata and no full-library query', async () => {
  const template = toQuestionDraft(fixture('trivia').draft)
  const rows = Array.from({ length: 101 }, (_, i) => { const draft = structuredClone(template); draft.stable_id = `question-${i}`; draft.payload.id = draft.stable_id; return published(draft) })
  const db = fake(rows), load = createPublishedContentLoader(db.client, publicSources)
  assert.equal((await load('trivia')).length, 101); assert.deepEqual(db.requests.map(r => r.start), [0, 100])
})
await test('source availability checks every activity source and excludes private library citations', async () => {
  const row = published(toStudioActivityDraft(fixture('bible-timeline'))), db = fake([row])
  assert.deepEqual(await createPublishedContentLoader(db.client, async () => [])('bible-timeline'), [])
})
await test('duplicate identities, malformed payloads and unauthorized media are rejected', async () => {
  const record = fixture('icon-memory'), draft = toStudioActivityDraft(record), row = published(draft)
  const db = fake([row, { ...row, id: crypto.randomUUID(), stable_id: 'other', question_id: 'other', payload: { ...row.payload, id: 'other' } }])
  await assert.rejects(createPublishedContentLoader(db.client, publicSources)('icon-memory'), /conflicting content/)
  if (record.draft.game !== 'icon-memory') throw new Error('fixture')
  record.draft.content[0].src = 'https://unapproved.invalid/image.png'
  assert.ok(validateLibraryDraft(toStudioActivityDraft(record)).length)
})
await test('unreviewed Amharic stays in editorial storage; public projection uses English', () => {
  const row = published(toStudioActivityDraft(fixture('adventures')))
  const original = JSON.stringify(row)
  const publicDraft = publicActivityDraft(row)
  if (publicDraft.game !== 'adventures') throw new Error('fixture')
  assert.equal(publicDraft.content.title.am, undefined)
  assert.equal(JSON.stringify(row), original)
  row.payload.verifiedLocales = ['en', 'am']
  assert.match(validateLibraryDraft(row).join(' '), /every bilingual field/)
})
await test('activity publication remains blocked before RPC, including staff callers', async () => {
  const row = published(toStudioActivityDraft(fixture('bible-timeline'))); row.status = 'approved'
  let calls = 0
  const client = { from: () => ({ select() { return this }, eq() { return this }, async single() { return { data: row, error: null } } }), rpc: async () => { calls++; return { data: null, error: null } } } as unknown as QuestionLibraryClient
  await assert.rejects(createQuestionLibraryApi(client, async () => ({ profileRole: 'admin' })).review(row.id, 'published', ''), /blocked until/)
  assert.equal(calls, 0)
})
await test('timeout aborts network work and leaves the loader retryable', async () => {
  let signal: AbortSignal | undefined
  const client = { from: () => ({ select() { return this }, eq() { return this }, not() { return this }, order() { return this }, abortSignal(s: AbortSignal) { signal = s; return this }, range: () => new Promise(() => {}) }) } as unknown as PublicContentClient
  await assert.rejects(createPublishedContentLoader(client, publicSources, 10)('trivia'), /timed out/)
  assert.equal(signal?.aborted, true)
})
await test('Mezmur sources are queried by published slug, never from the stored lyric copy', async () => {
  const filters: unknown[] = []
  const client = { from(table: string) { assert.equal(table, 'mezmur_public'); return { select() { return this }, eq(k: string, v: string) { filters.push([k, v]); return this }, not() { return this }, in(k: string, v: string[]) { filters.push([k, v]); return this }, abortSignal() { return this }, async limit() { return { data: [], error: null } } } } } as unknown as SelectedMezmurClient
  assert.deepEqual(await fetchSelectedMezmurLyrics(['fixture-song'], client), [])
  assert.deepEqual(filters, [['status', 'published'], ['slug', ['fixture-song']]])
})
await test('offline conversion is deterministic, draft-only, preserves invalid originals and never authorizes imports', async () => {
  const { preparePlayContentMigration } = await import('./prepare-play-content-migration')
  const a = preparePlayContentMigration(), b = preparePlayContentMigration()
  assert.deepEqual(a, b)
  assert.equal(a.importEnabled, false)
  assert.ok(a.candidates.length > 50)
  assert.ok(a.candidates.some(item => item.validationErrors.length))
  assert.ok(a.candidates.every(item => item.status === 'draft' && item.editorialReviewRequired && !item.importAllowed && item.rightsStatus === 'unverified'))
  assert.equal(new Set(a.candidates.map(item => item.draft.stable_id)).size, a.candidates.length)
})
await test('copied lyrics, unreviewed locale claims and invalid activity ordering cannot enter a shared draft', () => {
  const draft = toStudioActivityDraft(fixture('finish-the-mezmur'))
  delete draft.payload.sourceOnly
  assert.match(validateLibraryDraft(draft).join(' '), /source-only/)
  const record = fixture('bible-timeline'); record.sortOrder = -1
  assert.match(validateLibraryDraft(toStudioActivityDraft(record)).join(' '), /Activity order/)
})
await test('unauthorized shared-draft creation stops before any database operation', async () => {
  let writes = 0
  const client = { from() { writes++; throw new Error('must not query') } } as unknown as QuestionLibraryClient
  const api = createQuestionLibraryApi(client, async () => { throw new Error('Staff access denied') })
  await assert.rejects(api.save(toStudioActivityDraft(fixture('bible-timeline'))), /Staff access denied/)
  assert.equal(writes, 0)
})
await test('editorial activity ordering is stable and comes from the stored metadata', async () => {
  const a = fixture('who-am-i'), b = fixture('who-am-i')
  if (a.draft.game !== 'who-am-i' || b.draft.game !== 'who-am-i') throw new Error('fixture')
  a.draft.content.id = 'database-first'; b.draft.content.id = 'database-second'
  a.sortOrder = 9; b.sortOrder = 1
  const db = fake([published(toStudioActivityDraft(a)), published(toStudioActivityDraft(b))])
  const ordered = await createPublishedContentLoader(db.client, publicSources)('who-am-i')
  assert.equal((ordered[0].content as { id: string }).id, 'database-second')
})
await test('restricted or malformed lyric projections cannot become playable source material', async () => {
  let song: Record<string, unknown> = { slug: 'fixture-song', title: 'Fixture', title_amharic: null, title_english: null, primary_language: 'am', lyrics_amharic: null, lyrics_english: null, lyrics_transliteration: null, youtube_url: null }
  const client = { from() { return { select() { return this }, eq() { return this }, not() { return this }, in() { return this }, abortSignal() { return this }, async limit() { return { data: [song], error: null } } } } } as unknown as SelectedMezmurClient
  assert.deepEqual(await fetchSelectedMezmurLyrics(['fixture-song'], client), [])
  song = { ...song, lyrics_transliteration: { malformed: true } }
  await assert.rejects(fetchSelectedMezmurLyrics(['fixture-song'], client), /invalid format/)
})
console.log(`${passed} passed, 0 failed`)
