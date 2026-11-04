import assert from 'node:assert/strict'
import { createStaffQuestionInventory, STAFF_QUESTION_INVENTORY_KIND } from '../src/lib/play/staffQuestionInventory'

const rows = Array.from({ length: 537 }, (_, index) => ({ id: `row-${String(index).padStart(4, '0')}`, stable_id: `question-${index}`, question_id: `question-${index}`, status: index % 2 ? 'published' : 'draft' }))
const requests: Array<[number, number]> = []
let shortPage = false
let changingCount = false
let reversedPage = false
const client = { from(table: string) {
  assert.equal(table, 'play_content_items')
  return { select(columns: string, options: { count: string }) {
    assert.match(columns, /question_id,stable_id/)
    assert.equal(options.count, 'exact')
    return this
  }, order(column: string, options: { ascending: boolean }) {
    assert.equal(column, 'id'); assert.equal(options.ascending, true)
    return this
  }, async range(from: number, to: number) {
    requests.push([from, to])
    const page = rows.slice(from, to + 1)
    return { data: shortPage && from === 250 ? page.slice(0, -1) : reversedPage && from === 250 ? page.reverse() : page,
      count: changingCount && from === 250 ? rows.length + 1 : rows.length, error: null }
  } }
} }
const authorize = async () => ({ profileRole: 'admin' })
const load = createStaffQuestionInventory(client, authorize)
const inventory = await load()
assert.equal(inventory.kind, STAFF_QUESTION_INVENTORY_KIND)
assert.equal(inventory.complete, true)
assert.equal(inventory.visibleCount, 537)
assert.equal(inventory.rows.length, 537)
assert.equal(inventory.pages, 3)
assert.deepEqual(requests, [[0, 249], [250, 499], [500, 749]])

shortPage = true
await assert.rejects(load(), /page 2 was incomplete/)
shortPage = false
changingCount = true
await assert.rejects(load(), /count changed during export/)
changingCount = false
reversedPage = true
await assert.rejects(load(), /row order changed/)
reversedPage = false
await assert.rejects(createStaffQuestionInventory(client, async () => ({ profileRole: 'user' }))(), /Editorial staff access/)
await assert.rejects(createStaffQuestionInventory(null, authorize)(), /not configured/)
console.log('Counted staff inventory: pagination, completeness, count drift and access denial passed.')
