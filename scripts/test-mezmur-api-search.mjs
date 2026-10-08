/**
 * Mezmur page search must use GET /api/hymns/search (backend ranking).
 * Run: npm run test:mezmur-api-search
 */
import assert from 'node:assert/strict'
import { fetchHymnsSearchApi } from '../src/lib/search/structuredSearchApi.ts'
import { searchBuddyApiReady } from '../src/lib/searchBuddy/sendSearchBuddyMessage.ts'
import { searchMezmursUnified } from '../src/lib/search/unifiedHymnSearch.ts'

const TITLE = '\u12E8\u1235\u1219 \u1275\u122D\u130B\u121C' // የስሙ ትርጓሜ
const LYRIC = '\u12E8\u1218\u120B\u12D5\u12AD\u1275 \u12A0\u1208\u1243 \u1245\u12F1\u1235 \u121A\u12AB\u12A4\u120D'

if (!searchBuddyApiReady()) {
  console.log('test-mezmur-api-search: skipped (no API URL)')
  process.exit(0)
}

async function assertApiParity(q, label) {
  const api = await fetchHymnsSearchApi(q, { limit: 20 })
  const page = await searchMezmursUnified(q, { limit: 20 })
  assert.equal(page.source, 'api', `${label}: source api`)
  assert.equal(page.items.length, api.results.length, `${label}: same length`)
  for (let i = 0; i < api.results.length; i += 1) {
    const apiSlug = api.results[i].slug
    const pageSlug = page.items[i].slug
    assert.equal(pageSlug, apiSlug, `${label}: rank ${i} slug`)
  }
  // Typed twice = same ranking (voice uses same raw text).
  const again = await searchMezmursUnified(q, { limit: 20 })
  assert.deepEqual(
    again.items.map((i) => i.slug),
    page.items.map((i) => i.slug),
    `${label}: stable ranking`,
  )
  return { api, page }
}

const title = await assertApiParity(TITLE, 'title')
assert.ok(title.page.items.length >= 1, 'title: has hits')
assert.ok(
  title.page.items.some(
    (i) => (i.title_amharic || '').includes('\u1275\u122D\u130B\u121C') || i.slug.includes('tirguame'),
  ),
  'title: matches የስሙ ትርጓሜ',
)
const t0 = title.page.items[0]
assert.ok(t0.slug)
assert.ok(t0.title || t0.title_amharic)
console.log(JSON.stringify({ case: 'title', count: title.page.items.length, first: t0.slug }))

const lyric = await assertApiParity(LYRIC, 'lyric')
assert.ok(lyric.page.items.length >= 1, 'lyric: has hits')
console.log(
  JSON.stringify({ case: 'lyric', count: lyric.page.items.length, first: lyric.page.items[0].slug }),
)

// Zemari: real name from published `zemaris` catalog (backend may match name even when
// result rows still omit zemari attribution).
const ZEMARI = 'Yosph'
const zemari = await assertApiParity(ZEMARI, 'zemari')
assert.ok(zemari.page.items.length >= 1, 'zemari: has hits')
console.log(
  JSON.stringify({
    case: 'zemari',
    query: ZEMARI,
    count: zemari.page.items.length,
    first: zemari.page.items[0].slug,
  }),
)

console.log('test-mezmur-api-search: ok')
