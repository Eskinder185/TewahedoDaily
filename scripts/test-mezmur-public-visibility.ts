import assert from 'node:assert/strict'
import {
  collectPagedRows,
  isEligiblePublicMezmurRow,
  isPublicMezmurStatus,
} from '../src/lib/publicContent/mezmurVisibility.ts'

assert.equal(isPublicMezmurStatus('published'), true)
assert.equal(isPublicMezmurStatus(' PUBLISHED '), true)
for (const status of ['', null, 'draft', 'ready', 'active', 'true', 'archived', 'unknown']) {
  assert.equal(isPublicMezmurStatus(status), false, `${String(status)} must not be public`)
}

assert.equal(isEligiblePublicMezmurRow({ status: 'published', rights_status: 'unknown' }), true)
assert.equal(isEligiblePublicMezmurRow({ status: 'published', rights_status: 'licensed' }), true)
assert.equal(isEligiblePublicMezmurRow({ status: 'published', rights_status: 'external_only' }), true)
assert.equal(isEligiblePublicMezmurRow({ status: 'draft', rights_status: 'licensed' }), false)

const source = Array.from({ length: 1_153 }, (_, index) => ({ index }))
const calls: Array<[number, number]> = []
const all = await collectPagedRows(async (from, to) => {
  calls.push([from, to])
  return source.slice(from, to + 1)
}, { pageSize: 500 })

assert.equal(all.length, 1_153)
assert.deepEqual(calls, [[0, 499], [500, 999], [1000, 1499]])
assert.equal(new Set(all.map((row) => row.index)).size, 1_153)

const capped = await collectPagedRows(
  async (from, to) => source.slice(from, to + 1),
  { pageSize: 24, maxRows: 50 },
)
assert.equal(capped.length, 50)
assert.equal(capped.at(-1)?.index, 49)

console.log('Mezmur public visibility and pagination checks: ok')
