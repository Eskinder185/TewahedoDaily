/**
 * Every Play picture needs a usable source: a remote URL (resolved media) or a local file that ships; a removed local file
 * must never be a source or fallback. Remote approval is not checked here.
 * Run: npx tsx --env-file-if-exists=.env.local scripts/test-play-image-catalog.ts
 */
import assert from 'node:assert/strict'
import fs from 'node:fs'
import path from 'node:path'
import { GAME_ART, MIN_PICTURE_CHOICES, PLAY_IMAGES, feastImages, holyPersonImages } from '../src/lib/play/imageCatalog'
import { LOCAL_CALENDAR_WEB_STEMS, isLocalAssetAvailable } from '../src/lib/media/localAssetAvailability'
import { calendarImageAssets } from '../src/content/calendarImageManifest'
import { NEXT_OBSERVANCES_POOL } from '../src/content/nextObservancesArtPool'

const publicDir = path.resolve('public')
const isRemote = (src: string) => /^https?:\/\//i.test(src)
const exists = (src: string) => fs.existsSync(path.join(publicDir, decodeURI(src)))
/** A usable source is a remote URL, or a local file that exists on disk. */
const usable = (src: string) => Boolean(src) && (isRemote(src) || exists(src))
let passed = 0
const t = (name: string, fn: () => void) => { fn(); passed++; console.log(`✓ ${name}`) }

t('ids are unique', () => assert.equal(new Set(PLAY_IMAGES.map((i) => i.id)).size, PLAY_IMAGES.length))
t('every gameplay image has a usable source (remote URL or existing local file)', () => PLAY_IMAGES.forEach((i) => assert.ok(usable(i.src), `${i.id}: ${i.src}`)))
t('a gameplay fallback is empty or an existing local file', () => PLAY_IMAGES.forEach((i) => assert.ok(!i.fallbackSrc || exists(i.fallbackSrc), `${i.id}: ${i.fallbackSrc}`)))
t('game artwork is empty (neutral panel), remote, or an existing local file', () => Object.entries(GAME_ART).forEach(([k, a]) => {
  assert.ok(!a.src || usable(a.src), `${k}: ${a.src}`)
  assert.ok(!a.fallbackSrc || exists(a.fallbackSrc), `${k} fallback: ${a.fallbackSrc}`)
}))
t('artwork whose local file is gone has no alt text describing it', () => Object.entries(GAME_ART).forEach(([k, a]) => {
  if (!a.fallbackSrc) assert.deepEqual(a.alt, { en: '', am: '' }, k)
}))
t('pictures whose local file is gone use a neutral description', () => PLAY_IMAGES.forEach((i) => {
  if (!i.fallbackSrc) assert.match(i.description, /^(Artwork for a Church feast|Icon or picture of (a saint|an angel)).$/, i.id)
}))
t('the local allow-list matches public/images/calendar-web exactly', () => {
  const onDisk = fs.readdirSync(path.join(publicDir, 'images', 'calendar-web')).filter((f) => f.endsWith('.webp')).map((f) => f.replace(/.webp$/, '')).sort()
  assert.deepEqual([...LOCAL_CALENDAR_WEB_STEMS].sort(), onDisk)
})
t('the availability check rejects missing local paths and ignores remote URLs', () => {
  assert.equal(isLocalAssetAvailable('/images/calendar-web/DefinitelyMissing.webp'), false)
  assert.equal(isLocalAssetAvailable('/images/calendar/anything.png'), false)
  assert.equal(isLocalAssetAvailable('/images/calendar-web/SaintYared.webp'), true)
  assert.equal(isLocalAssetAvailable('/images/calendar-web/Saint%20George.webp'), true)
  assert.equal(isLocalAssetAvailable('https://example.com/images/calendar-web/Missing.webp'), true)
})
t('calendar manifest never returns a local path that is missing', () => Object.entries(calendarImageAssets).forEach(([k, v]) => assert.ok(!v || exists(v), `${k}: ${v}`)))
t('next-observances pool only holds pictures that exist', () => {
  assert.ok(NEXT_OBSERVANCES_POOL.length >= 3)
  NEXT_OBSERVANCES_POOL.forEach((p) => assert.ok(exists(p.src), p.src))
})
t('every image has an answer, explanation, description and source route', () => PLAY_IMAGES.forEach((i) => {
  assert.ok(i.answer.en && i.answer.am, i.id)
  assert.ok(i.explanation.en.length > 20, i.id)
  assert.ok(i.description.length > 20, i.id)
  assert.match(i.source.route, /^\/(bible\/[a-z0-9-]+\/\d+|calendar)$/, i.id)
}))
t('enough items for four distinct choices per question', () => {
  assert.ok(feastImages().length >= MIN_PICTURE_CHOICES)
  assert.ok(holyPersonImages().length >= MIN_PICTURE_CHOICES)
})
t('no duplicate answers within a game pool', () => {
  for (const pool of [feastImages(), holyPersonImages()]) assert.equal(new Set(pool.map((i) => i.answer.en)).size, pool.length)
})
console.log(`\n${passed} passed`)
