/* eslint-disable @typescript-eslint/no-explicit-any -- operates on untyped JSON fixtures/drafts */
/**
 * Published bank integrity: every shipped generated item validates, keeps stable unique IDs that never collide with
 * built-in content, has a real reader route and an intact answer, and the build script is idempotent.
 * Run: npx tsx scripts/test-published-bank.ts
 */
import assert from 'node:assert/strict'
import { readFileSync } from 'node:fs'
import { spawnSync } from 'node:child_process'
process.env.VITE_SUPABASE_URL ||= 'https://bank-test.invalid'
process.env.VITE_SUPABASE_PUBLISHABLE_KEY ||= 'synthetic-public-key'
const { APPROVED_QUESTIONS, MATCH_PAIRS, WHO_AM_I_CARDS } = await import('../src/lib/play/approvedContent.ts')
const { validateQuestionDraft } = await import('../src/lib/play/questionLibrary.ts')
const { validateCardContent } = await import('../src/lib/play/cardContent.ts')
const { mergeById } = await import('../src/lib/play/generatedBank.ts')
const { TIMELINE_CHAINS } = await import('../src/lib/play/bibleTimeline.ts')
const { withShuffledOptions, withOptionOrder, shuffled, seededRandom } = await import('../src/lib/play/sessionRandom.ts')
const read = (name: string) => JSON.parse(readFileSync(`src/lib/play/generated/${name}.json`, 'utf8')) as any[]
const bank = { trivia: read('trivia'), 'finish-the-verse': read('finish-the-verse'), emoji: read('emoji'), 'who-am-i': read('who-am-i'), match: read('match'), 'bible-timeline': read('timeline') }
const ledger = JSON.parse(readFileSync('docs/ai/faith-challenges-publication-ledger.json', 'utf8'))
let passed = 0
const test = (name: string, fn: () => void) => { fn(); passed += 1; console.log(`PASS ${name}`) }

test('ledger accounting matches the shipped files and every record has a status', () => {
  for (const [game, items] of Object.entries(bank)) assert.equal(ledger.published[game === 'bible-timeline' ? 'timeline' : game], items.length, `${game} published count`)
  const statuses = ledger.items.map((i: any) => i.status)
  assert.ok(statuses.every((s: string) => ['published', 'duplicate', 'rejected', 'unresolved'].includes(s)))
  assert.equal(ledger.items.filter((i: any) => i.status === 'published').length, Object.values(bank).flat().length)
  assert.ok(ledger.items.filter((i: any) => i.status !== 'published').every((i: any) => i.reason), 'every held-back item states a specific reason')
  const ids = ledger.items.map((i: any) => `${i.game}:${i.id}`)
  assert.equal(new Set(ids).size, ids.length, 'each draft is recorded once')
})

test('generated timeline chains are well formed: unique ids, 3-12 events, readable Bible routes, no id clashes with built-in chains', () => {
  const chains = bank['bible-timeline']
  assert.ok(chains.length >= 30, `only ${chains.length} chains`)
  const chainIds = [...TIMELINE_CHAINS.map((c: any) => c.id), ...chains.map((c: any) => c.id)]
  assert.equal(new Set(chainIds).size, chainIds.length, 'chain ids are unique')
  const eventIds = [...TIMELINE_CHAINS.flatMap((c: any) => c.events), ...chains.flatMap((c: any) => c.events)].map((e: any) => e.id)
  assert.equal(new Set(eventIds).size, eventIds.length, 'event ids are unique')
  for (const chain of chains) {
    assert.ok(chain.events.length >= 3 && chain.events.length <= 12, chain.id)
    for (const event of chain.events) assert.match(event.route, /^\/bible\/[a-z0-9-]+\/\d+/,`${chain.id}/${event.id}`)
  }
})

test('shipped questions validate with the app validator, with intact answers and distinct options', () => {
  for (const game of ['trivia', 'finish-the-verse', 'emoji'] as const) {
    for (const q of bank[game]) {
      const errors = validateQuestionDraft({ stable_id: q.id, game_type: game, category: q.category, difficulty: q.difficulty, payload: q, source_references: [q.source] })
      assert.deepEqual(errors, [], `${game}/${q.id}`)
      assert.equal(q.game, game)
      assert.ok(q.options.some((o: any) => o.key === q.correctKey), `${q.id} correct key exists`)
      assert.equal(new Set(q.options.map((o: any) => o.text.en.toLowerCase())).size, q.options.length, `${q.id} distinct options`)
      assert.deepEqual(q.verifiedLocales, ['en'], `${q.id}: generated Amharic stays unverified`)
      assert.ok(!('status' in q) && !('provenance' in q), 'no draft or provenance fields in public content')
    }
  }
  for (const card of bank['who-am-i']) assert.deepEqual(validateCardContent('who-am-i', card), [], card.id)
  for (const pair of bank.match) assert.deepEqual(validateCardContent('match', pair), [], pair.id)
})

test('IDs are unique per game, never collide with built-in content, and built-in wins on merge', () => {
  const builtIn = { trivia: APPROVED_QUESTIONS.filter(q => q.game === 'trivia'), 'finish-the-verse': APPROVED_QUESTIONS.filter(q => q.game === 'finish-the-verse'), emoji: APPROVED_QUESTIONS.filter(q => q.game === 'emoji'), 'who-am-i': WHO_AM_I_CARDS, match: MATCH_PAIRS }
  for (const [game, items] of Object.entries(bank)) {
    assert.equal(new Set(items.map(i => i.id)).size, items.length, `${game} unique IDs`)
    const own = new Set((builtIn as any)[game].map((i: any) => i.id))
    assert.ok(items.every(i => !own.has(i.id)), `${game} has no ID collision with built-in items`)
  }
  const clash = { ...bank.trivia[0], id: APPROVED_QUESTIONS.find(q => q.game === 'trivia')!.id }
  const merged = mergeById(builtIn.trivia, [clash as any])
  assert.equal(merged.find(i => i.id === clash.id), builtIn.trivia.find(i => i.id === clash.id), 'existing IDs are preserved')
})

test('sources are real reader routes (no volume-style slugs) and cite Bible content', () => {
  for (const item of Object.values(bank).flat()) {
    assert.match(item.source.route, /^\/bible\/[a-z0-9-]+\/\d+/, `${item.id}: ${item.source.route}`)
    assert.doesNotMatch(item.source.route, /^\/bible\/[123]-/, `${item.id} uses a volume slug the reader does not serve`)
    assert.equal(item.source.kind, 'bible')
  }
})

test('answer positions are shuffled without changing answer identity; resume restores the same order', () => {
  const q = bank.trivia[0]
  const correctText = q.options.find((o: any) => o.key === q.correctKey).text.en
  const firstPositions = new Set<string>()
  for (let i = 0; i < 400; i++) {
    const s = withShuffledOptions(q)
    assert.equal(s.correctKey, q.correctKey)
    assert.equal(s.options.find((o: any) => o.key === s.correctKey).text.en, correctText)
    assert.deepEqual(s.options.map((o: any) => o.key).sort(), q.options.map((o: any) => o.key).sort())
    firstPositions.add(s.options[0].key)
  }
  assert.equal(firstPositions.size, 4, 'every option can appear first')
  const s = withShuffledOptions(q)
  assert.deepEqual(withOptionOrder(q, s.options.map((o: any) => o.key)).options.map((o: any) => o.key), s.options.map((o: any) => o.key))
  // Uniformity: over many shuffles the correct answer lands in each position about equally often.
  const counts = [0, 0, 0, 0]
  for (let i = 0; i < 4000; i++) counts[withShuffledOptions(q).options.findIndex((o: any) => o.key === q.correctKey)]++
  assert.ok(counts.every(c => c > 800 && c < 1200), `unbiased positions: ${counts}`)
  assert.deepEqual(shuffled([1, 2, 3, 4, 5], seededRandom(9)), shuffled([1, 2, 3, 4, 5], seededRandom(9)), 'seeded shuffle is reproducible')
})

test('the build script is idempotent: re-running it changes nothing', () => {
  const run = spawnSync(process.execPath, ['node_modules/tsx/dist/cli.mjs', 'scripts/play/build-published-bank.ts', '--check'], { encoding: 'utf8' })
  assert.equal(run.status, 0, run.stdout + run.stderr)
  assert.match(run.stdout, /up to date/)
})

console.log(`Published bank tests passed: ${passed}.`)
