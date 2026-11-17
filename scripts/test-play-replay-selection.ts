/**
 * Deterministic replay/anti-repetition checks for the shared question selector (no browser, seeded randomness).
 * Run: npx tsx scripts/test-play-replay-selection.ts
 */
import assert from 'node:assert/strict'
import { loadSeen, markSeen, resetSeen, selectUnseen } from '../src/lib/play/questionHistory'

let storageAvailable = true
const storage = new Map<string, string>()
Object.assign(globalThis, { window: { localStorage: {
  getItem: (key: string) => { if (!storageAvailable) throw new Error('blocked'); return storage.get(key) ?? null },
  setItem: (key: string, value: string) => { if (!storageAvailable) throw new Error('blocked'); storage.set(key, value) },
  removeItem: (key: string) => { storage.delete(key) },
} } })

/** mulberry32: a small seeded PRNG so every run draws the same sequences. */
function seeded(seed: number) {
  let a = seed >>> 0
  return () => {
    a = (a + 0x6d2b79f5) >>> 0
    let t = a
    t = Math.imul(t ^ (t >>> 15), t | 1)
    t ^= t + Math.imul(t ^ (t >>> 7), t | 61)
    return ((t ^ (t >>> 14)) >>> 0) / 4294967296
  }
}
type Q = { id: string; category: string; difficulty: 'beginner' | 'growing' | 'challenge' }
const bank = (n: number, prefix = 'q'): Q[] => Array.from({ length: n }, (_, i) => ({ id: `${prefix}-${i}`, category: i % 2 ? 'Saints' : 'Bible', difficulty: i % 3 === 0 ? 'beginner' : i % 3 === 1 ? 'growing' : 'challenge' }))
const ids = (items: Q[]) => items.map((q) => q.id)
const draw = (game: string, pool: Q[], count: number, rng: () => number) => {
  const result = selectUnseen(pool, (q) => q.id, loadSeen(game), Math.min(count, pool.length), rng)
  markSeen(game, ids(result.picked))
  return result
}
let checks = 0
const ok = (condition: unknown, message: string) => { checks += 1; assert.ok(condition, message) }

// 1. Large bank: many seeds, consecutive rounds are fully disjoint until the bank is exhausted; no duplicate inside a round.
for (let seed = 1; seed <= 50; seed += 1) {
  const game = `large-${seed}`; const rng = seeded(seed); const pool = bank(120)
  const rounds: string[][] = []
  for (let round = 0; round < 24; round += 1) {
    const { picked, reusedSeen } = draw(game, pool, 5, rng)
    ok(picked.length === 5 && new Set(ids(picked)).size === 5, `seed ${seed} round ${round}: five distinct questions`)
    ok(!reusedSeen, `seed ${seed} round ${round}: 120 questions allow 24 fresh rounds`)
    rounds.push(ids(picked))
  }
  const flat = rounds.flat()
  ok(new Set(flat).size === flat.length, `seed ${seed}: no question repeats across 24 consecutive rounds`)
}

// 2. Exactly five eligible: always five distinct; the second round is an unavoidable but harmless repeat and reports it.
{
  const rng = seeded(7); const pool = bank(5)
  const a = draw('five', pool, 5, rng); const b = draw('five', pool, 5, rng)
  ok(new Set(ids(a.picked)).size === 5 && new Set(ids(b.picked)).size === 5, 'exactly five: distinct questions')
  ok(!a.reusedSeen && b.reusedSeen && b.exhausted, 'exactly five: second round flags the unavoidable repeat')
}

// 3. Fewer than five eligible: a short round, never padded and never crashing.
{
  const rng = seeded(8)
  for (const n of [0, 1, 3, 4]) {
    const { picked } = draw(`few-${n}`, bank(n), 5, rng)
    ok(picked.length === n && new Set(ids(picked)).size === n, `${n} eligible: round has exactly ${n} questions`)
  }
}

// 4. Bank just over a round (7): the unseen two always come first, then reuse fills the round.
{
  const rng = seeded(9); const pool = bank(7)
  const first = draw('seven', pool, 5, rng)
  const second = draw('seven', pool, 5, rng)
  const unseenAfterFirst = ids(pool).filter((id) => !ids(first.picked).includes(id))
  ok(unseenAfterFirst.every((id) => ids(second.picked).includes(id)), 'bank of 7: both unseen questions are in the next round')
  ok(second.picked.length === 5 && new Set(ids(second.picked)).size === 5 && second.reusedSeen, 'bank of 7: round filled without duplicates')
}

// 5. Filters: a selected subset is never widened, seen history from another subset does not hide questions, and the same filter rotates.
{
  const rng = seeded(11); const pool = bank(60)
  const bible = pool.filter((q) => q.category === 'Bible'); const saints = pool.filter((q) => q.category === 'Saints')
  const aRound = draw('filters', bible, 5, rng); const bRound = draw('filters', saints, 5, rng)
  ok(aRound.picked.every((q) => q.category === 'Bible') && bRound.picked.every((q) => q.category === 'Saints'), 'filters: nothing outside the selected category')
  const aAgain = draw('filters', bible, 5, rng)
  ok(aAgain.picked.every((q) => q.category === 'Bible') && !aAgain.reusedSeen, 'filters: same filter still draws fresh questions')
  ok(!ids(aAgain.picked).some((id) => ids(aRound.picked).includes(id)), 'filters: same filter, consecutive rounds are disjoint')
  const growing = pool.filter((q) => q.difficulty === 'growing')
  ok(draw('filters', growing, 5, rng).picked.every((q) => q.difficulty === 'growing'), 'filters: difficulty subset is respected')
}

// 6. Reload: history survives a fresh read; unavailable storage degrades to independent rounds without throwing or looping.
{
  const rng = seeded(13); const pool = bank(40)
  const before = draw('reload', pool, 5, rng)
  const afterReload = selectUnseen(pool, (q) => q.id, loadSeen('reload'), 5, rng)
  ok(!ids(afterReload.picked).some((id) => ids(before.picked).includes(id)), 'reload: a new page load still avoids the previous round')
  storageAvailable = false
  const blocked = selectUnseen(pool, (q) => q.id, loadSeen('blocked'), 5, rng)
  markSeen('blocked', ids(blocked.picked))
  ok(blocked.picked.length === 5 && new Set(ids(blocked.picked)).size === 5, 'blocked storage: still a valid five-question round')
  storageAvailable = true
  resetSeen('reload')
  ok(!selectUnseen(pool, (q) => q.id, loadSeen('reload'), 5, rng).reusedSeen, 'reset: history cleared')
}

// 7. Duplicate ids collapse, games do not share history, and an exhausted 3-question game keeps rotating without hanging.
{
  const rng = seeded(17)
  const dup = [...bank(6), ...bank(6)]
  ok(new Set(ids(draw('dup', dup, 5, rng).picked)).size === 5, 'duplicate ids: collapsed before selection')
  markSeen('game-a', ['q-0', 'q-1'])
  ok(!loadSeen('game-b').has('q-0') && loadSeen('game-a').has('q-0'), 'history is per game')
  const tiny = bank(3)
  for (let i = 0; i < 100; i += 1) ok(draw('tiny', tiny, 5, rng).picked.length === 3, 'exhausted tiny bank keeps returning a valid short round')
}

console.log(`Play replay selection: ${checks} checks passed.`)
