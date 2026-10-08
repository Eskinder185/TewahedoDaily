/**
 * Guest recently-viewed helpers (jsdom-free localStorage shim).
 * Run: node --experimental-strip-types --no-warnings scripts/test-recent-viewed.mjs
 */
import assert from 'node:assert/strict'

const store = new Map()
globalThis.window = {
  localStorage: {
    getItem: (k) => (store.has(k) ? store.get(k) : null),
    setItem: (k, v) => store.set(k, String(v)),
    removeItem: (k) => store.delete(k),
  },
  dispatchEvent: () => true,
}

const {
  recordGuestRecentViewed,
  getGuestRecentViewed,
  recordGuestRecentMezmur,
  getGuestRecentMezmur,
} = await import('../src/lib/userContent/guestStorage.ts')

recordGuestRecentViewed({
  contentType: 'bible',
  contentSlug: 'john:3',
  title: 'John Chapter 3',
  route: '/bible/john/3',
})
recordGuestRecentViewed({
  contentType: 'saint',
  contentSlug: 'st-george',
  title: 'St. George',
  route: '/content/saints/st-george',
})
recordGuestRecentMezmur('meskel-hymn', 'Meskel Hymn')

const all = getGuestRecentViewed()
assert.equal(all[0].contentType, 'mezmur')
assert.equal(all[1].contentType, 'saint')
assert.equal(all[2].contentType, 'bible')
assert.ok(all.every((row) => row.route.startsWith('/')))

const mezmurOnly = getGuestRecentMezmur()
assert.equal(mezmurOnly.length, 1)
assert.equal(mezmurOnly[0].slug, 'meskel-hymn')

console.log('test-recent-viewed: ok')
