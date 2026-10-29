/** Previous / Next / Shuffle / Repeat order for the Mezmur page. Run: npx tsx scripts/test-mezmur-browse-queue.ts */
import assert from 'node:assert/strict'
import { neighbour, reorder, shuffledOrder, withPlayed, type BrowseQueue, type BrowseQueueItem } from '../src/lib/mezmur/browseQueue'

const item = (slug: string, hasVideo = true, hasAudio = false): BrowseQueueItem => ({ slug, title: slug, hasVideo, hasAudio })
const items = [item('a'), item('b', false, false), item('c'), item('d', false, true), item('e')]
const q: BrowseQueue = { label: 'Virgin Mary', href: '/x', items, order: items.map((i) => i.slug) }

let passed = 0
const t = (name: string, fn: () => void) => { fn(); passed++; console.log(`✓ ${name}`) }

t('next skips a Mezmur with no recording', () => assert.equal(neighbour(q, 'a', 1, 'off'), 'c'))
t('audio-only Mezmurs are playable', () => assert.equal(neighbour(q, 'c', 1, 'off'), 'd'))
t('previous skips unplayable', () => assert.equal(neighbour(q, 'c', -1, 'off'), 'a'))
t('end of list: no next unless repeat all', () => {
  assert.equal(neighbour(q, 'e', 1, 'off'), null)
  assert.equal(neighbour(q, 'e', 1, 'one'), null)
  assert.equal(neighbour(q, 'e', 1, 'all'), 'a')
  assert.equal(neighbour(q, 'a', -1, 'all'), 'e')
})
t('a Mezmur outside the list has no neighbours', () => assert.equal(neighbour(q, 'zzz', 1, 'all'), null))
t('shuffle keeps the opened Mezmur first and every item once', () => {
  let seed = 7
  const rnd = () => ((seed = (seed * 16807) % 2147483647) / 2147483647)
  const order = shuffledOrder(items, 'c', rnd)
  assert.equal(order[0], 'c')
  assert.deepEqual([...order].sort(), ['a', 'b', 'c', 'd', 'e'])
})
t('shuffled order drives next', () => {
  const sq = { ...q, order: ['c', 'e', 'a', 'b', 'd'] }
  assert.equal(neighbour(sq, 'c', 1, 'off'), 'e')
  assert.equal(neighbour(sq, 'a', 1, 'off'), 'd')
})

const big = Array.from({ length: 12 }, (_, i) => item(`m${i + 1}`))
const nat: BrowseQueue = { label: 'Kidus Michael', href: '/hymns/category/kidus-michael', items: big, order: big.map((i) => i.slug), history: ['m1'] }
let seed2 = 11
const rnd2 = () => ((seed2 = (seed2 * 16807) % 2147483647) / 2147483647)

t('history records each Mezmur once, in listening order', () => {
  let q = withPlayed(withPlayed(withPlayed(nat, 'm2'), 'm3'), 'm2')
  assert.deepEqual(q.history, ['m1', 'm2', 'm3'])
  q = withPlayed(q, 'not-in-list')
  assert.deepEqual(q.history, ['m1', 'm2', 'm3'])
})
t('shuffle on keeps history first, current at its place, and randomises only the unplayed rest', () => {
  const played = withPlayed(withPlayed(nat, 'm2'), 'm3')
  const s = reorder(played, true, 'm3', rnd2)
  assert.deepEqual(s.order.slice(0, 3), ['m1', 'm2', 'm3'])
  assert.equal(s.order.indexOf('m3') + 1, 3, 'position does not jump back to 1')
  assert.deepEqual([...s.order].sort(), [...nat.order].sort(), 'every Mezmur exactly once')
  assert.notDeepEqual(s.order.slice(3), nat.order.slice(3), 'rest is shuffled')
  assert.equal(neighbour(s, 'm3', -1, 'off'), 'm2', 'Previous follows listening history')
  const next = neighbour(s, 'm3', 1, 'off')!
  assert.ok(!['m1', 'm2', 'm3'].includes(next), 'Next never repeats a played Mezmur')
})
t('Next through a shuffled list visits every unplayed Mezmur once', () => {
  let s = reorder(nat, true, 'm1', rnd2)
  const seen = ['m1']
  let cur = 'm1'
  for (;;) {
    const n = neighbour(s, cur, 1, 'off')
    if (!n) break
    seen.push(n)
    s = withPlayed(s, n)
    cur = n
  }
  assert.equal(seen.length, 12)
  assert.equal(new Set(seen).size, 12, 'no duplicates')
})
t('shuffle off restores collection order and keeps the current Mezmur', () => {
  const s = reorder(withPlayed(nat, 'm5'), true, 'm5', rnd2)
  const off = reorder(s, false, 'm5')
  assert.deepEqual(off.order, nat.order)
  assert.equal(neighbour(off, 'm5', 1, 'off'), 'm6')
  assert.equal(neighbour(off, 'm5', -1, 'off'), 'm4')
})
t('re-enabling shuffle does not reshuffle already-played Mezmurs back into the future', () => {
  let s = reorder(nat, true, 'm1', rnd2)
  const a = neighbour(s, 'm1', 1, 'off')!
  s = withPlayed(s, a)
  s = reorder(reorder(s, false, a), true, a, rnd2)
  assert.deepEqual(s.order.slice(0, 2), ['m1', a])
})
console.log(`\n${passed} passed`)
