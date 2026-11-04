import assert from 'node:assert/strict'
import { GAME_MODES, gameInMode, MIXED_CHALLENGE_GUIDE, recentGames } from '../src/lib/play/gameModes'
import { selectChallengeSession, type ChallengeCandidate } from '../src/lib/play/challengeSession'

let passed = 0
function test(name: string, run: () => void) { run(); passed++; console.log(`PASS ${name}`) }
const candidate = (id: string, changes: Partial<ChallengeCandidate> = {}): ChallengeCandidate => ({
  questionId: id, contentId: `content:${id}`, subjectId: `subject:${id}`, mechanic: 'choices',
  topic: 'scripture', difficulty: 'beginner', status: 'published', reviewed: true, ...changes,
})
const pick = (items: ChallengeCandidate[], count = 5, changes: Partial<Parameters<typeof selectChallengeSession>[1]> = {}) =>
  selectChallengeSession(items, { count, difficulty: 'beginner', random: () => .4, ...changes })
test('Five modes cover all twelve canonical games without duplicate membership', () => {
  assert.equal(GAME_MODES.length, 5)
  assert.equal(new Set(GAME_MODES.flatMap(mode => [...mode.games])).size, 12)
  for (const mode of GAME_MODES) { assert.equal(new Set(mode.games).size, mode.games.length); assert.ok(mode.en && mode.am && mode.description.am) }
})
test('History and feast cross-membership preserves distinct mechanics', () => {
  assert.ok(gameInMode('history', 'knowledge') && gameInMode('history', 'timeline'))
  assert.ok(gameInMode('feasts', 'visual') && gameInMode('feasts', 'knowledge'))
  assert.ok(gameInMode('mezmur', 'word') && gameInMode('adventure', 'story'))
  assert.equal(gameInMode('trivia', 'unknown'), false)
})
test('Mixed guide links five existing routes with distinct modes', () => {
  assert.equal(new Set(MIXED_CHALLENGE_GUIDE.map(round => round.mode)).size, 5)
  for (const round of MIXED_CHALLENGE_GUIDE) assert.match(round.route, /^\/play\/[a-z-]+$/)
})
test('Recent replay links whitelist history and deduplicate canonical story IDs', () => {
  assert.deepEqual(recentGames([{ game: 'adventure' }, { game: 'adventures' }, { game: '//evil' }, { game: 'trivia' }, { game: 'match' }, { game: 'feasts' }]), ['adventures', 'trivia', 'match'])
})
test('Exact question identity cannot repeat in a session or subsequent batch', () => {
  const a = candidate('a'), b = candidate('b')
  assert.equal(pick([a, a, b]).picked.length, 2)
  assert.deepEqual(pick([a, b], 1, { used: [a] }).picked, [b])
})
test('Shared content and explicit equivalents deduplicate across mechanics', () => {
  const a = candidate('a'), alias = candidate('alias', { contentId: a.contentId, mechanic: 'memory' })
  assert.equal(pick([a, alias]).picked.length, 1)
  assert.equal(pick([candidate('b', { equivalentIds: ['a'] })], 1, { used: [a] }).picked.length, 0)
})
test('Draft, unreviewed, archived and unknown states never fill a session', () => {
  assert.deepEqual(pick([candidate('draft', { status: 'draft' }), candidate('unchecked', { reviewed: false }), candidate('archive', { status: 'archived' }), candidate('unknown', { status: 'ready' })]).picked, [])
})
test('Difficulty and selected topics are strict filters', () => {
  const result = pick([candidate('a', { difficulty: 'challenge' }), candidate('b', { topic: 'saints' }), candidate('c')], 1, { topics: ['scripture'] })
  assert.deepEqual(result.picked.map(item => item.questionId), ['c'])
})
test('Adjacent related subjects are avoided when alternatives exist', () => {
  const a = candidate('a', { subjectId: 'saint:michael' })
  const same = candidate('b', { subjectId: a.subjectId, mechanic: 'clues' })
  assert.equal(pick([same, candidate('c')], 1, { used: [a] }).picked[0].questionId, 'c')
})
test('Exact source identity also avoids repeated passage variants', () => {
  const a = candidate('a', { sourceId: 'am:verse:123' })
  const same = candidate('b', { sourceId: a.sourceId, mechanic: 'words' })
  assert.equal(pick([same, candidate('c')], 1, { used: [a] }).picked[0].questionId, 'c')
})
test('Mechanic variety wins over a fresh repeated mechanic', () => {
  const result = pick([candidate('quiz'), candidate('memory', { mechanic: 'memory' })], 1, { used: [candidate('before')], seen: { has: id => id === 'memory' } })
  assert.equal(result.picked[0].mechanic, 'memory')
})
test('Topic counts are balanced without fabricating missing topics', () => {
  assert.equal(pick([candidate('scripture'), candidate('history', { topic: 'history' })], 1, { used: [candidate('before')] }).picked[0].topic, 'history')
})
test('Seen-history prefers fresh content when other factors tie', () => {
  assert.equal(pick([candidate('old'), candidate('fresh')], 1, { seen: { has: id => id === 'old' } }).picked[0].questionId, 'fresh')
})
test('Insufficient approved content reports shortage instead of repetition', () => {
  const result = pick([candidate('a')], 5)
  assert.equal(result.shortage, 4)
  assert.match(result.warnings.join(' '), /Insufficient reviewed published content/)
})
test('Unavailable subject and mechanic variety is reported honestly', () => {
  const result = pick([candidate('b', { subjectId: 'same' })], 1, { used: [candidate('a', { subjectId: 'same' })] })
  assert.equal(result.warnings.length, 2)
})
test('Invalid counts fail closed', () => {
  for (const count of [-1, 0, 21, NaN, 1.5]) assert.throws(() => pick([], count), /between 1 and 20/)
})
test('Deterministic selection preserves input objects', () => {
  const input = [candidate('a'), candidate('b'), candidate('c')], snapshot = structuredClone(input)
  assert.deepEqual(pick(input), pick(input)); assert.deepEqual(input, snapshot)
})
console.log(`${passed} passed, 0 failed`)
