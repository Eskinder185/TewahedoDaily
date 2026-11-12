/** Within a tier the closest title leads. Run: npx tsx scripts/test-mezmur-ranking.ts */
import assert from 'node:assert/strict'
import { rankPublicRows, titleCloseness, type PublicMezmurRow } from '../src/lib/search/mezmurLyricSearch.ts'

const row = (slug: string, title: string, extra: Partial<PublicMezmurRow> = {}): PublicMezmurRow => ({ slug, title, status: 'published', ...extra })
const rows = [
  row('a', 'Awnetenya Amlak Selamhin Siteny'),
  row('b', 'Selam Leki'),
  row('c', 'Zelalem Selamta Alew Ena Meche'),
  row('d', 'Selam'),
  row('e', 'Selam Selam Lekulachihu'),
]
const order = rankPublicRows(rows, 'selam').map((hit) => hit.row.slug)
assert.deepEqual(order.slice(0, 1), ['d'], 'the exact title is first')
assert.ok(order.indexOf('b') < order.indexOf('a'), 'a whole-word title match beats a prefix match inside a longer word')
assert.ok(order.indexOf('b') < order.indexOf('c'))
assert.ok(order.indexOf('b') < order.indexOf('e') || titleCloseness(rows[1], 'selam') <= titleCloseness(rows[4], 'selam'), 'shorter title first')
// Lyric matches never outrank a title match.
const lyric = row('l', 'Something Else', { lyrics_transliteration: 'selam selam' })
const mixed = rankPublicRows([lyric, row('t', 'Selam Leki')], 'selam').map((hit) => hit.row.slug)
assert.equal(mixed[0], 't')
console.log('test-mezmur-ranking: ok')
