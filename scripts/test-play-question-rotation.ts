import assert from 'node:assert/strict'
import { loadSeen, markSeen, selectUnseen } from '../src/lib/play/questionHistory'
import { questionsFor } from '../src/lib/play/approvedContent'

const storage = new Map<string, string>()
Object.assign(globalThis, { window: { localStorage: {
  getItem: (key: string) => storage.get(key) ?? null,
  setItem: (key: string, value: string) => { storage.set(key, value) },
  removeItem: (key: string) => { storage.delete(key) },
} } })

const pool = questionsFor('trivia').slice(0, 6)
const choose = (seen = loadSeen('rotation-test')) => selectUnseen(pool, (q) => q.id, seen, 3, () => 0.1).picked

const first = choose()
assert.equal(new Set(first.map((q) => q.id)).size, first.length)
markSeen('rotation-test', first.map((q) => q.id))
const afterReload = choose(loadSeen('rotation-test'))
assert.equal(new Set(afterReload.map((q) => q.id)).size, afterReload.length)
assert.ok(afterReload.every((q) => !first.some((old) => old.id === q.id)))
markSeen('rotation-test', afterReload.map((q) => q.id))

const exhausted = selectUnseen(pool, (q) => q.id, loadSeen('rotation-test'), 3, () => 0.1)
assert.equal(exhausted.picked.length, 3)
assert.ok(exhausted.picked.every((q) => pool.some((candidate) => candidate.id === q.id)))

const dailyIndex = 2
const dailyQuestion = pool[dailyIndex % pool.length]
assert.equal(dailyQuestion.id, pool[2].id)
assert.equal(pool[dailyIndex % pool.length].id, dailyQuestion.id)
console.log('Play question rotation checks passed.')
