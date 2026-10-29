/** Every Play picture must be an existing local asset with a source. Run: npx tsx scripts/test-play-image-catalog.ts */
import assert from 'node:assert/strict'
import fs from 'node:fs'
import path from 'node:path'
import { GAME_ART, PLAY_IMAGES, feastImages, holyPersonImages } from '../src/lib/play/imageCatalog'

const publicDir = path.resolve('public')
const exists = (src: string) => fs.existsSync(path.join(publicDir, decodeURI(src)))
let passed = 0
const t = (name: string, fn: () => void) => { fn(); passed++; console.log(`✓ ${name}`) }

t('ids are unique', () => assert.equal(new Set(PLAY_IMAGES.map((i) => i.id)).size, PLAY_IMAGES.length))
t('every gameplay image file exists in public/', () => PLAY_IMAGES.forEach((i) => assert.ok(exists(i.src), i.src)))
t('every game artwork file exists in public/', () => Object.values(GAME_ART).forEach((a) => assert.ok(exists(a.src), a.src)))
t('every image has an answer, explanation, description and source route', () => PLAY_IMAGES.forEach((i) => {
  assert.ok(i.answer.en && i.answer.am, i.id)
  assert.ok(i.explanation.en.length > 20, i.id)
  assert.ok(i.description.length > 20, i.id)
  assert.match(i.source.route, /^\/(bible\/[a-z0-9-]+\/\d+|calendar)$/, i.id)
}))
t('enough items for four distinct choices per question', () => {
  assert.ok(feastImages().length >= 4)
  assert.ok(holyPersonImages().length >= 4)
})
t('no duplicate answers within a game pool', () => {
  for (const pool of [feastImages(), holyPersonImages()]) assert.equal(new Set(pool.map((i) => i.answer.en)).size, pool.length)
})
console.log(`\n${passed} passed`)
