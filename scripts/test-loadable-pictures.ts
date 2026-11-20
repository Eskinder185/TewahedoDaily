/** Picture availability rule used by Church Feast, Guess the Saint and Icon Memory. Run: npx tsx scripts/test-loadable-pictures.ts */
import assert from 'node:assert/strict'
import { selectLoadable } from '../src/lib/play/useLoadablePictures'
import type { PlayImage } from '../src/lib/play/imageCatalog'

const pic = (id: string) => ({ id }) as PlayImage
const pictures = ['a', 'b', 'c', 'd'].map(pic)
let passed = 0
const t = (name: string, fn: () => void) => { fn(); passed += 1; console.log(`✓ ${name}`) }

t('pictures that cannot load are skipped and reported', () => {
  const { available, skipped } = selectLoadable(pictures, [true, false, true, false])
  assert.deepEqual(available.map((p) => p.id), ['a', 'c'])
  assert.deepEqual(skipped.map((p) => p.id), ['b', 'd'])
})
t('everything loads: nothing is skipped', () => {
  const { available, skipped } = selectLoadable(pictures, [true, true, true, true])
  assert.equal(available.length, 4); assert.equal(skipped.length, 0)
})
t('nothing loads (offline): all pictures are kept, never emptied by an outage', () => {
  const { available, skipped } = selectLoadable(pictures, [false, false, false, false])
  assert.equal(available.length, 4); assert.equal(skipped.length, 0)
})
t('empty input stays empty', () => {
  const { available, skipped } = selectLoadable([], [])
  assert.equal(available.length, 0); assert.equal(skipped.length, 0)
})
console.log(`\n${passed} passed`)
