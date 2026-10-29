import assert from 'node:assert/strict'
import {
  fisherYates,
  moveQueueItem,
  playableQueue,
  shuffledAfterCurrent,
  shuffledCycle,
} from '../src/lib/mezmur/playerQueue'
import type { PlayableHymn } from '../src/lib/mezmur/playlistService'

const track = (id: string, audioUrl = `${id}.mp3`): PlayableHymn => ({
  id,
  slug: id,
  title: `Track ${id}`,
  audioUrl,
})
const items = [track('a'), track('b'), track('c'), track('d')]

assert.deepEqual(fisherYates(items, () => 0).map((item) => item.id), ['b', 'c', 'd', 'a'])
assert.deepEqual(items.map((item) => item.id), ['a', 'b', 'c', 'd'], 'shuffle must not mutate its source')

const shuffled = shuffledAfterCurrent(items, items[2], () => 0)
assert.equal(shuffled[0].id, 'c', 'the selected track must remain first')
assert.equal(new Set(shuffled.map((item) => item.id)).size, 4, 'shuffle must not repeat tracks')

const nextCycle = shuffledCycle(items, items[1], () => 0)
assert.notEqual(nextCycle[0].id, 'b', 'repeat-all shuffle must avoid an immediate repeat')

assert.deepEqual(
  playableQueue([items[0], items[0], track('missing', '')]).map((item) => item.id),
  ['a'],
  'unplayable and duplicate entries must be excluded',
)
assert.deepEqual(moveQueueItem(items, 3, 1).map((item) => item.id), ['a', 'd', 'b', 'c'])
assert.deepEqual(moveQueueItem(items, -1, 2), items, 'invalid reorders must be harmless')

console.log('Smart Mezmur player queue tests passed.')
