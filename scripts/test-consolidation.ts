/**
 * Consolidation contract: the rows scripts/play/consolidate-content.ts would publish, sent through the REAL published-only
 * loaders (the production data path), must give every game its full bundled inventory, with no duplicates and no loss.
 * Offline: a fake PostgREST client only; no network, no database.
 */
import assert from 'node:assert/strict'
process.env.VITE_SUPABASE_URL = 'https://consolidation.invalid'
process.env.VITE_SUPABASE_PUBLISHABLE_KEY = 'synthetic-public-key'
const { buildConsolidation, unitCounts } = await import('./play/consolidate-content')
const { createPublishedContentLoader, createPublishedHubSummaryLoader, summarizePublishedDrafts } = await import('../src/lib/play/publishedContent')
const { STUDIO_GAMES } = await import('../src/lib/play/contentStudio')
import type { QuestionRow } from '../src/lib/play/questionLibrary'
import type { PublicContentClient } from '../src/lib/play/publishedContent'
import counts from '../src/lib/play/generated/counts.json' with { type: 'json' }

let passed = 0
const test = async (name: string, run: () => unknown | Promise<unknown>) => { await run(); passed++; console.log(`PASS ${name}`) }
const { valid, excluded, candidates } = await buildConsolidation()
const rows: QuestionRow[] = valid.map((item, index) => ({ ...item.draft, id: `00000000-0000-4000-8000-${String(index).padStart(12, '0')}`, question_id: item.draft.stable_id, status: 'published',
  published_at: '2026-11-16T12:00:00Z', updated_at: '2026-11-16T12:00:00Z', review_notes: null }) as unknown as QuestionRow)
function client(): PublicContentClient {
  return { from() {
    const filters: [string, string][] = []
    return { select() { return this }, eq(k: string, v: string) { filters.push([k, v]); return this }, not() { return this },
      order() { return this }, abortSignal() { return this }, async range(start: number, end: number) {
        const sorted = rows.filter(row => filters.every(([k, v]) => row[k as keyof QuestionRow] === v)).sort((a, b) => a.question_id.localeCompare(b.question_id))
        return { data: sorted.slice(start, end + 1), error: null }
      } }
  } } as unknown as PublicContentClient
}
const open = async <T>(sources: T[]) => sources
const load = createPublishedContentLoader(client(), open)

await test('every candidate validates and IDs are unique (idempotent upsert key)', () => {
  assert.equal(valid.length, candidates.length)
  assert.equal(new Set(valid.map(item => item.draft.stable_id)).size, valid.length)
  assert.ok(valid.every(item => item.draft.source_references.length > 0), 'published rows need a source reference')
})
await test('building twice yields identical hashes (reproducible)', async () => {
  const again = await buildConsolidation()
  assert.deepEqual(again.valid.map(item => [item.draft.stable_id, item.hash]), valid.map(item => [item.draft.stable_id, item.hash]))
})
const expectedUnits: Record<string, number> = { trivia: counts.trivia.total, emoji: counts.emoji.total, 'finish-the-verse': counts['finish-the-verse'].total, 'who-am-i': counts['who-am-i'].total,
  match: counts.match.total, 'bible-timeline': counts['bible-timeline'].total, adventures: counts.adventures.total }
for (const game of Object.keys(expectedUnits)) await test(`${game}: the published reader returns the full bundled inventory (${expectedUnits[game]})`, async () => {
  const drafts = await load(game as never)
  const summary = summarizePublishedDrafts(drafts)[game as keyof ReturnType<typeof summarizePublishedDrafts>]
  assert.equal(summary.total, expectedUnits[game])
})
await test('history: bundled questions and chronology are both served', async () => {
  const summary = summarizePublishedDrafts(await load('history')).history
  assert.equal(summary.total, counts.history.total)
  assert.equal(summary.timelineEvents, counts.history.timelineEvents, 'chronology events')
})
for (const game of ['feasts', 'saints', 'icon-memory'] as const) await test(`${game}: every bundled image is reachable through published decks`, async () => {
  const drafts = await load(game)
  const images = drafts.flatMap(draft => Array.isArray(draft.content) ? draft.content : [])
  assert.equal(images.length, counts[game].total)
  assert.equal(new Set(images.map((image: { id: string }) => image.id)).size, images.length, 'no repeated image across decks')
})
await test('playable minimums hold for every engine (no "insufficient" state)', async () => {
  const match = summarizePublishedDrafts(await load('match')).match.total
  assert.ok(match >= 4)
  for (const game of ['trivia', 'emoji', 'finish-the-verse'] as const) assert.ok(summarizePublishedDrafts(await load(game))[game].total >= 5, `${game} fills a 5-question round`)
  for (const set of (await load('icon-memory')).flatMap(draft => draft.game === 'icon-memory' ? [draft.content] : [])) assert.ok([4, 6, 8].includes(set.length), 'icon memory set size')
})
await test('hub summary derives from the same rows and is not truncated (all games in one scan)', async () => {
  const summary = await createPublishedHubSummaryLoader(client(), open)()
  assert.equal(rows.length > 100, true)
  for (const [game, total] of Object.entries(expectedUnits)) assert.equal(summary[game as keyof typeof summary].total, total, game)
  const fromRows = unitCounts(valid)
  assert.equal(fromRows.match.units, counts.match.total)
  assert.deepEqual(STUDIO_GAMES.map(entry => entry.id).filter(id => id !== 'finish-the-mezmur' && !(id in summary)), [])
})
await test('excluded content is reported, never silently dropped', () => {
  for (const item of excluded) assert.ok(item.reason && item.game)
  assert.ok(excluded.some(item => item.game === 'finish-the-mezmur'), 'Mezmur is selected from published hymn sources, not copied')
})
console.log(`${passed} passed`)
