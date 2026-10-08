/**
 * Mezmur page: typed + voice share searchHymns → GET /api/hymns/search?limit=20.
 * Run: npm run test:mezmur-api-search
 */
import assert from 'node:assert/strict'
import { searchHymns } from '../src/lib/search/searchHymns.ts'
import { searchMezmursUnified } from '../src/lib/search/unifiedHymnSearch.ts'
import { canAttemptStructuredSearchApi } from '../src/lib/search/structuredSearchApi.ts'

const TITLE = '\u12E8\u1235\u1219 \u1275\u122D\u1313\u121C'
const LYRIC =
  '\u12E8\u1218\u120B\u12D5\u12AD\u1275 \u12A0\u1208\u1243 \u1245\u12F1\u1235 \u121A\u12AB\u12A4\u120D'

if (!canAttemptStructuredSearchApi()) {
  console.log('test-mezmur-api-search: skipped (no API URL)')
  process.exit(0)
}

async function withRetry(fn, attempts = 3) {
  let last
  for (let i = 0; i < attempts; i += 1) {
    try {
      return await fn()
    } catch (error) {
      last = error
      if (error?.code === 'unavailable' || error?.code === 'timeout') {
        await new Promise((r) => setTimeout(r, 400 * (i + 1)))
        continue
      }
      throw error
    }
  }
  throw last
}

async function assertParity(q, label) {
  const api = await withRetry(() => searchHymns(q, { limit: 20 }))
  const page = await withRetry(() => searchMezmursUnified(q, { limit: 20 }))
  const voice = await withRetry(() => searchHymns(q, { limit: 20 }))

  assert.equal(page.source, 'api', `${label}: page source api`)
  assert.equal(page.items.length, api.results.length, `${label}: length`)
  assert.deepEqual(
    page.items.map((i) => i.slug),
    api.results.map((r) => r.slug),
    `${label}: page === searchHymns ranking`,
  )
  assert.deepEqual(
    voice.results.map((r) => r.slug),
    api.results.map((r) => r.slug),
    `${label}: typed === voice ranking`,
  )
  return { api, page }
}

const title = await assertParity(TITLE, 'title')
assert.ok(title.page.items.length >= 1)
assert.equal(title.page.items[0].slug, 'yesimu-tirguame')
console.log(
  JSON.stringify({
    case: 'title',
    first: title.page.items[0].slug,
    count: title.page.items.length,
  }),
)

const lyric = await assertParity(LYRIC, 'lyric')
assert.ok(lyric.page.items.length >= 1)
assert.equal(lyric.page.items[0].slug, 'yesimu-tirguame')
console.log(
  JSON.stringify({
    case: 'lyric',
    first: lyric.page.items[0].slug,
    ranking: lyric.page.items.map((i) => i.slug),
  }),
)

console.log('test-mezmur-api-search: ok')
