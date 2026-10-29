/** Previous / Next / Shuffle / Repeat order for the Mezmur page. Run: npx tsx scripts/test-mezmur-browse-queue.ts */
import assert from 'node:assert/strict'
import { neighbour, shuffledOrder, type BrowseQueue, type BrowseQueueItem } from '../src/lib/mezmur/browseQueue'

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
console.log(`\n${passed} passed`)
