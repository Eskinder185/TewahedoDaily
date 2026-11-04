import assert from 'node:assert/strict'
import { cardLocale, cardQuestionDraft, mergeCardBank, publishedCard, validateCardContent } from '../src/lib/play/cardContent'
import type { StudioRecord } from '../src/lib/play/contentStudio'
import type { PublishedCardClient } from '../src/lib/play/contentService'
import type { QuestionLibraryClient } from '../src/lib/play/questionLibraryService'
import type { MatchPair, WhoAmICard } from '../src/lib/play/types'
import type { QuestionRow } from '../src/lib/play/questionLibrary'

process.env.VITE_SUPABASE_URL = 'https://card-adapter-fixture.invalid'
process.env.VITE_SUPABASE_PUBLISHABLE_KEY = 'synthetic-public-key'
const { fromQuestionRow, studioStorage } = await import('../src/lib/play/contentStudio')
const { loadPublishedGameCards } = await import('../src/lib/play/contentService')
const { createQuestionLibraryApi } = await import('../src/lib/play/questionLibraryService')

const source = { label: 'Synthetic Genesis reference', route: '/bible/genesis/1', kind: 'bible' as const }
const who: WhoAmICard = { id: 'synthetic-who', category: 'biblical-people', answer: { en: 'Synthetic identity', am: 'የሙከራ ማንነት' }, explanation: { en: 'Synthetic explanation', am: 'የሙከራ ማብራሪያ' }, source, verifiedLocales: ['en', 'am'] }
const pair: MatchPair = { id: 'synthetic-pair', category: 'Bible', left: { en: 'Synthetic left', am: 'የሙከራ ግራ' }, right: { en: 'Synthetic right', am: 'የሙከራ ቀኝ' }, explanation: who.explanation, source, verifiedLocales: ['en', 'am'] }
const row = (game: 'who-am-i' | 'match', payload: WhoAmICard | MatchPair): QuestionRow => ({ ...cardQuestionDraft(game, payload), id: '22222222-2222-4222-8222-222222222222', question_id: payload.id,
  status: 'published', published_at: '2026-11-03T12:00:00Z', updated_at: '2026-11-03T12:00:00Z', review_notes: null })
let passed = 0
const test = async (name: string, run: () => void | Promise<void>) => { await run(); passed++; console.log(`PASS ${name}`) }
await test('Unverified Amharic uses English in public play but remains inspectable in staff tests', () => {
  assert.equal(cardLocale(['en'], 'am'), 'en')
  assert.equal(cardLocale(['en', 'am'], 'am'), 'am')
  assert.equal(cardLocale(['en'], 'am', true), 'am')
})
for (const [game, payload] of [['who-am-i', who], ['match', pair]] as const) {
  await test(`${game}: existing schema round-trips bilingual cards and sources`, () => {
    assert.deepEqual(validateCardContent(game, payload), [])
    assert.deepEqual(publishedCard(game, row(game, payload)), payload)
  })
  await test(`${game}: every unpublished state and missing/invalid publication timestamp is rejected`, () => {
    for (const status of ['draft', 'review', 'approved', 'rejected', 'archived']) assert.equal(publishedCard(game, { ...row(game, payload), status }), null)
    for (const published_at of [null, '', 'invalid']) assert.equal(publishedCard(game, { ...row(game, payload), published_at }), null)
  })
  await test(`${game}: mismatched identifiers, game, category and references are rejected`, () => {
    for (const change of [{ stable_id: 'wrong' }, { question_id: 'wrong' }, { game_type: 'trivia' }, { category: 'wrong' }, { source_references: [] }]) assert.equal(publishedCard(game, { ...row(game, payload), ...change }), null)
  })
  await test(`${game}: malformed text, unsupported fields and unsafe sources are rejected`, () => {
    assert.ok(validateCardContent(game, { ...payload, verifiedLocales: ['am'] }).length)
    assert.ok(validateCardContent(game, { ...payload, explanation: { en: 'Only English' } }).length)
    assert.ok(validateCardContent(game, { ...payload, branches: [] }).length)
    for (const route of ['//evil.invalid', '/bible/%5cevil', 'javascript:alert(1)', '/hymns/no-kind-match']) assert.ok(validateCardContent(game, { ...payload, source: { ...source, route } }).length)
  })
  await test(`${game}: published loader asserts server filters and rejects bad responses`, async () => {
    let response: unknown[] | null = [row(game, payload)]; let error: unknown = null
    const calls: unknown[][] = []
    const query = { select(...args: unknown[]) { calls.push(['select', ...args]); return this }, eq(...args: unknown[]) { calls.push(['eq', ...args]); return this },
      not(...args: unknown[]) { calls.push(['not', ...args]); return this }, order() { return this }, async limit(count: number) { assert.equal(count, 1000); return { data: response, error } } }
    const client = { from: (table: string) => { assert.equal(table, 'play_content_items'); return query } } as PublishedCardClient
    assert.deepEqual(await loadPublishedGameCards(game, client), [payload])
    assert.ok(calls.some(call => JSON.stringify(call) === JSON.stringify(['eq', 'game_type', game])))
    assert.ok(calls.some(call => JSON.stringify(call) === JSON.stringify(['eq', 'status', 'published'])))
    assert.ok(calls.some(call => JSON.stringify(call) === JSON.stringify(['not', 'published_at', 'is', null])))
    response = [{ ...row(game, payload), status: 'draft' }]; await assert.rejects(loadPublishedGameCards(game, client), /incompatible/)
    response = [row(game, payload), row(game, payload)]; await assert.rejects(loadPublishedGameCards(game, client), /identifiers/)
    response = null; await assert.rejects(loadPublishedGameCards(game, client), /invalid response/)
    error = new Error('Synthetic unavailable'); await assert.rejects(loadPublishedGameCards(game, client), /could not be loaded/)
    assert.deepEqual(await loadPublishedGameCards(game, null), [])
  })
}
await test('Stable-ID overrides and duplicate-side rejection do not mutate static banks', () => {
  const original = structuredClone(pair)
  const edited = { ...pair, explanation: { en: 'Updated approved explanation' } }
  assert.deepEqual(mergeCardBank('match', [pair], [edited]), [edited])
  assert.equal(mergeCardBank('match', [pair], [{ ...pair, id: 'duplicate-answer' }]).length, 1)
  assert.equal(mergeCardBank('who-am-i', [who], [{ ...who, id: 'duplicate-identity' }]).length, 1)
  assert.deepEqual(pair, original)
})
await test('Saved local card/collection reopens with the exact real-engine payload', () => {
  const values = new Map<string, string>()
  const storage = { getItem: (key: string) => values.get(key) || null, setItem: (key: string, value: string) => { values.set(key, value) } }
  const owner = '11111111-1111-4111-8111-111111111111'
  const store = studioStorage(storage, owner, 'editor')
  for (const draft of [{ game: 'who-am-i', content: who }, { game: 'match', content: [pair] }] as const) {
    const record: StudioRecord = { version: 1, id: crypto.randomUUID(), owner, name: 'Synthetic saved engine content', status: 'draft', updatedAt: '2026-11-03T12:00:00Z', draft: structuredClone(draft) as StudioRecord['draft'] }
    store.save(record)
    assert.deepEqual(store.load().find(item => item.id === record.id)?.draft, draft)
    assert.equal(publishedCard(draft.game, record), null, 'a local Studio draft is never a public database row')
  }
})
await test('Existing server card drafts reopen in the Studio and save matching identifiers', async () => {
  let saved: unknown
  const query = { select() { return this }, eq() { return this }, insert(value: unknown) { saved = value; return this }, update(value: unknown) { saved = value; return this },
    async single() { return { data: { ...row('who-am-i', who), status: 'draft', published_at: null }, error: null } } }
  const client = { from: () => query, rpc: async () => { throw new Error('Publication must not be called') } } as unknown as QuestionLibraryClient
  const api = createQuestionLibraryApi(client, async () => ({ profileRole: 'editor' }))
  const result = await api.save(cardQuestionDraft('who-am-i', who))
  assert.equal((saved as { question_id: string }).question_id, who.id)
  assert.deepEqual(fromQuestionRow(result, 'owner')?.draft.content, who)
  assert.deepEqual(fromQuestionRow({ ...row('match', pair), status: 'draft' }, 'owner')?.draft.content, [pair])
})
console.log(`${passed} passed, 0 failed`)
