/**
 * Pure checks for Hymns Practice browse cards sorting / empty filter.
 * Run: node scripts/test-hymn-browse.mjs
 */
import assert from 'node:assert/strict'

function sortBrowse(cards) {
  return [...cards].sort((a, b) => {
    if (a.featured !== b.featured) return a.featured ? -1 : 1
    if (a.sortOrder !== b.sortOrder) return a.sortOrder - b.sortOrder
    return a.name.localeCompare(b.name, undefined, { sensitivity: 'base' })
  })
}

const cards = [
  { name: 'Wedding', featured: false, sortOrder: 190, mezmurCount: 6 },
  { name: 'Timkat', featured: true, sortOrder: 20, mezmurCount: 1 },
  { name: 'Gena', featured: true, sortOrder: 10, mezmurCount: 11 },
  { name: 'Empty', featured: true, sortOrder: 1, mezmurCount: 0 },
]

const publicCards = sortBrowse(cards.filter((c) => c.mezmurCount > 0))
assert.equal(publicCards[0].name, 'Gena')
assert.equal(publicCards[1].name, 'Timkat')
assert.equal(publicCards[2].name, 'Wedding')
assert.ok(!publicCards.some((c) => c.name === 'Empty'))

console.log('hymn-browse pure checks: ok')
