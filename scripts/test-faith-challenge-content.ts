/* eslint-disable @typescript-eslint/no-explicit-any -- test script over loosely typed JSON content files */
/** Content layer: counts, units, exclusions, boards and decks. Run: npx tsx scripts/test-faith-challenge-content.ts */
import assert from 'node:assert/strict'
import { readFileSync } from 'node:fs'
process.env.VITE_SUPABASE_URL ||= 'https://content-test.invalid'
process.env.VITE_SUPABASE_PUBLISHABLE_KEY ||= 'synthetic-public-key'
const { CONTENT_COUNTS, countsFor, describeContent, progressSummary, registryId, totalsByUnit } = await import('../src/lib/play/contentRegistry.ts')
const { APPROVED_QUESTIONS, MATCH_PAIRS, WHO_AM_I_CARDS, HISTORY_TIMELINE } = await import('../src/lib/play/approvedContent.ts')
const { TIMELINE_CHAINS } = await import('../src/lib/play/bibleTimeline.ts')
const { bibleAdventureStories } = await import('../src/lib/play/bibleAdventureStories.ts')
const { PLAY_IMAGES, feastImages, holyPersonImages } = await import('../src/lib/play/imageCatalog.ts')
const { HUB_GAMES } = await import('../src/lib/play/gameCatalog.ts')
const { pickBoard, pairLabels } = await import('../src/lib/play/matchBoard.ts')
const { buildRoundOrder, categoriesOf } = await import('../src/lib/play/whoAmIDeck.ts')
const { seededRandom } = await import('../src/lib/play/sessionRandom.ts')

const read = (name: string) => JSON.parse(readFileSync(`src/lib/play/generated/${name}.json`, 'utf8')) as any[]
let passed = 0
const test = (name: string, fn: () => void) => { fn(); passed += 1; console.log(`PASS ${name}`) }
const none = { has: () => false }

test('every hub game is registered, and registry counts equal the live content (built-in + generated, merged by id)', () => {
  assert.equal(HUB_GAMES.length, 12)
  // Finish the Mezmur has no fixed bank, so it deliberately has no count; every other game does.
  for (const game of HUB_GAMES) assert.equal(Boolean(countsFor(game.id)), registryId(game.id) !== 'finish-the-mezmur', `counts for ${game.id}`)
  const merged = (builtIn: any[], generated: any[]) => new Set([...builtIn.map((item) => item.id), ...generated.map((item) => item.id)]).size
  for (const game of ['trivia', 'finish-the-verse', 'emoji'] as const) assert.equal(CONTENT_COUNTS[game].total, merged(APPROVED_QUESTIONS.filter((q: any) => q.game === game), read(game)), game)
  assert.equal(CONTENT_COUNTS.history.total, APPROVED_QUESTIONS.filter((q: any) => q.game === 'history').length)
  assert.equal(CONTENT_COUNTS.history.timelineEvents, HISTORY_TIMELINE.length)
  assert.equal(CONTENT_COUNTS['who-am-i'].total, merged(WHO_AM_I_CARDS, read('who-am-i')))
  assert.equal(CONTENT_COUNTS.match.total, merged(MATCH_PAIRS, read('match')))
  assert.equal(CONTENT_COUNTS['bible-timeline'].total, merged(TIMELINE_CHAINS, read('timeline')))
  assert.equal(CONTENT_COUNTS.adventures.total, bibleAdventureStories.length)
  assert.equal(CONTENT_COUNTS.feasts.total, feastImages().length)
  assert.equal(CONTENT_COUNTS.saints.total, holyPersonImages().length)
  assert.equal(CONTENT_COUNTS['icon-memory'].total, PLAY_IMAGES.length)
})

test('units are never mixed: timelines and their events, stories and scenes, pictures and questions are separate numbers', () => {
  const timeline = CONTENT_COUNTS['bible-timeline']
  assert.equal(timeline.unit, 'chains')
  const allChains = [...TIMELINE_CHAINS, ...read('timeline').filter((c) => !TIMELINE_CHAINS.some((b: any) => b.id === c.id))]
  assert.equal(timeline.events, allChains.reduce((n: number, c: any) => n + c.events.length, 0))
  assert.ok(timeline.events! > timeline.total)
  assert.match(describeContent('bible-timeline', 'en')!.primary, /timelines · .* events/)
  assert.match(describeContent('adventures', 'en')!.primary, /stories/)
  assert.match(describeContent('feasts', 'en')!.primary, /pictures/)
  assert.match(describeContent('history', 'en')!.primary, /questions · .* timeline events/)
  assert.doesNotMatch(describeContent('icon-memory', 'en')!.primary, /question/)
  assert.deepEqual(describeContent('mezmur', 'en'), { primary: 'Built from published hymn lyrics' }, 'no fixed Mezmur count is claimed')
  assert.ok(!('total' in (describeContent('mezmur', 'en') ?? {})))
  const totals = totalsByUnit()
  assert.equal((totals.questions ?? 0) + (totals.clues ?? 0) + (totals.excerpts ?? 0) + (totals.cards ?? 0) + (totals.pairs ?? 0), CONTENT_COUNTS.trivia.total + CONTENT_COUNTS['finish-the-verse'].total + CONTENT_COUNTS.emoji.total + CONTENT_COUNTS.history.total + CONTENT_COUNTS['who-am-i'].total + CONTENT_COUNTS.match.total)
})

test('level counts add up to the total and categories are reachable', () => {
  for (const game of ['trivia', 'finish-the-verse', 'emoji', 'history']) {
    const counts = CONTENT_COUNTS[game]
    assert.equal(Object.values(counts.levels!).reduce((a, b) => a + b, 0), counts.total, game)
  }
  assert.equal(Object.values(CONTENT_COUNTS['who-am-i'].categories!).reduce((a, b) => a + b, 0), CONTENT_COUNTS['who-am-i'].total)
})

test('held-back drafts and excluded duplicates never reach the player', () => {
  const ledger = JSON.parse(readFileSync('docs/ai/faith-challenges-publication-ledger.json', 'utf8'))
  const excluded = new Set<string>(ledger.items.filter((i: any) => i.status !== 'published').map((i: any) => `${i.game}:${i.id}`))
  assert.ok(excluded.size >= 200)
  const shipped = new Set<string>([
    ...read('trivia').map((q) => `trivia:${q.id}`), ...read('finish-the-verse').map((q) => `finish-the-verse:${q.id}`), ...read('emoji').map((q) => `emoji:${q.id}`),
    ...read('who-am-i').map((c) => `who-am-i:${c.id}`), ...read('match').map((c) => `match:${c.id}`), ...read('timeline').map((c) => `bible-timeline:${c.id}`),
  ])
  for (const key of excluded) assert.ok(!shipped.has(key), `${key} is excluded but shipped`)
  // The 206 eligible generated trivia questions and the 206 held-back drafts are different records.
  const heldBack = ledger.items.filter((i: any) => i.status === 'unresolved')
  assert.ok(heldBack.every((i: any) => i.game !== 'trivia'), 'no held-back trivia: the matching counts are a coincidence')
})

test('generated items are labelled English-only and awaiting review; built-in review metadata is untouched', () => {
  for (const q of read('trivia')) assert.deepEqual(q.verifiedLocales, ['en'], q.id)
  for (const c of read('who-am-i')) assert.deepEqual(c.verifiedLocales, ['en'], c.id)
  assert.ok(APPROVED_QUESTIONS.some((q: any) => q.verifiedLocales?.includes('am')), 'built-in items keep their Amharic verification')
  assert.ok(CONTENT_COUNTS.trivia.generated > 0 && CONTENT_COUNTS.adventures.generated === 0)
})

test('History Quest content is playable: six questions and three timeline events', () => {
  assert.equal(CONTENT_COUNTS.history.total, 6)
  assert.equal(CONTENT_COUNTS.history.timelineEvents, 3)
})

test('every adventure has exactly three scenes', () => {
  for (const story of bibleAdventureStories) assert.equal(story.scenes.length, 3, story.id)
})

test('picture games: every record has an image, a label and unique names; feast/saint rounds can always offer four distinct options', () => {
  assert.equal(new Set(PLAY_IMAGES.map((image: any) => image.id)).size, PLAY_IMAGES.length)
  assert.equal(new Set(PLAY_IMAGES.map((image: any) => image.answer.en)).size, PLAY_IMAGES.length, 'duplicate label would make a board ambiguous')
  for (const image of PLAY_IMAGES as any[]) assert.ok(image.src && image.answer.en && image.alt, image.id)
  assert.ok(feastImages().length >= 4 && holyPersonImages().length >= 4)
})

test('match boards come from the whole pool, repeat no pair, and never contain two identical labels', () => {
  const pool = [...MATCH_PAIRS, ...read('match')]
  const reached = new Set<string>()
  for (let round = 0; round < 60; round += 1) {
    for (const size of [4, 6, 8]) {
      const board = pickBoard(pool, size, 'en', none, seededRandom(round * 31 + size))
      assert.equal(board.length, size)
      assert.equal(new Set(board.map((pair) => pair.id)).size, board.length)
      const labels = board.flatMap((pair) => pairLabels(pair, 'en'))
      assert.equal(new Set(labels).size, labels.length, `ambiguous labels in round ${round}`)
      for (const pair of board) reached.add(pair.id)
    }
  }
  assert.ok(reached.size > 100, `only ${reached.size} of ${pool.length} pairs ever reached a board`)
  // Unseen pairs come first: with 20 unseen pairs available, every board pair is one of them.
  const unseen = new Set(pool.slice(20, 40).map((pair) => pair.id))
  const fresh = pickBoard(pool, 4, 'en', { has: (id: string) => !unseen.has(id) }, seededRandom(1))
  assert.ok(fresh.every((pair) => unseen.has(pair.id)))
  assert.equal(pickBoard([pool[0]], 4, 'en', none).length, 1, 'a small pool gives a smaller board, never duplicates')
})

test('Who Am I rounds: every card reachable, no repeats in a round, unseen first, categories complete', () => {
  const cards = [...WHO_AM_I_CARDS, ...read('who-am-i')]
  const categories = categoriesOf(cards)
  assert.equal(categories.reduce((n, c) => n + c.count, 0), cards.length)
  const order = buildRoundOrder(cards, 'all', none, seededRandom(7))
  assert.equal(order.length, cards.length)
  assert.equal(new Set(order.map((c) => c.id)).size, cards.length, 'no repeats')
  const other = buildRoundOrder(cards, 'all', none, seededRandom(8))
  assert.notDeepEqual(order.slice(0, 10).map((c) => c.id), other.slice(0, 10).map((c) => c.id), 'order differs between rounds')
  const seenIds = new Set(cards.slice(0, 100).map((c) => c.id))
  const unseenFirst = buildRoundOrder(cards, 'all', { has: (id: string) => seenIds.has(id) }, seededRandom(3))
  const firstUnseenCount = cards.length - seenIds.size
  assert.ok(unseenFirst.slice(0, firstUnseenCount).every((c) => !seenIds.has(c.id)), 'unseen cards come first')
  for (const category of categories) assert.equal(buildRoundOrder(cards, category.id, none).length, category.count)
})

test('progress summary uses route and hub ids interchangeably', () => {
  assert.equal(registryId('mezmur'), 'finish-the-mezmur')
  assert.equal(registryId('adventure'), 'adventures')
  const history = [{ game: 'adventure', score: 3, maxScore: 3 }, { game: 'adventures', score: 1, maxScore: 3 }]
  assert.deepEqual(progressSummary(history, 'adventures'), { plays: 2, bestPercent: 100 })
  assert.equal(progressSummary(history, 'trivia'), null)
})

console.log(`\n${passed} passed`)
