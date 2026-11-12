/** Run: npx tsx scripts/test-search-skeleton-request.ts */
import assert from 'node:assert/strict'
import { skeletonWord, skeletonCoverage, fuzzyTitleMatches, fuzzyEligible } from '../src/lib/search/translitSkeleton.ts'
import { extractSearchRequest } from '../src/lib/search/queryRequest.ts'

assert.equal(skeletonWord('Egziabher'), skeletonWord('Igziaber'))
assert.equal(skeletonWord('Kidus'), skeletonWord('Qidus'))
assert.equal(skeletonWord('Tsion'), skeletonWord('Cion'))
assert.equal(skeletonWord('selam'), skeletonWord('sselam'))
assert.equal(skeletonWord('Hamelmale'), skeletonWord('Amelmale'))
assert.notEqual(skeletonWord('selam'), skeletonWord('semen'))
assert.equal(skeletonCoverage('igziaber siraw', 'Egziabher Siraw Dink New'), 1)
assert.equal(fuzzyEligible('a'), false)
const titles = ['Egziabher Siraw Dink New', 'Selam Lek Maryam', 'Kidus Mikael']
assert.equal(fuzzyTitleMatches(titles, 'igziaber siraw dink', (t) => t)[0]?.item, titles[0])
assert.deepEqual(fuzzyTitleMatches(titles, 'zzzz qqqq', (t) => t), [])

const cases: Array<[string, string, string | null]> = [
  ['find the hymn with the words Ortodokis tewahdo hager nat', 'Ortodokis tewahdo hager nat', 'lyric'],
  ['mezmur that says selam lek maryam', 'selam lek maryam', 'lyric'],
  ['show me a song called Kidus Mikael', 'Kidus Mikael', 'title'],
  ['search for Kidus Mikael', 'Kidus Mikael', null],
  ['Kidus Mikael', 'Kidus Mikael', null],
  ['find the hymn with the words "selam lek"', 'selam lek', 'lyric'],
  ['hymn starting with selam lek', 'selam lek', 'lyric'],
]
for (const [input, text, wants] of cases) {
  const out = extractSearchRequest(input)
  assert.equal(out.text, text, input); assert.equal(out.wants, wants, input)
}
assert.equal(extractSearchRequest('find').text, 'find')
assert.equal(extractSearchRequest('the song').text, 'the song')
console.log('test-search-skeleton-request: ok')

// Search Buddy: one hymn is one result, whichever route or source produced it.
import { dedupeResults, canonicalMezmurSlug } from '../src/lib/search/searchCore.ts'
import type { SiteSearchResult } from '../src/lib/search/types.ts'
const base = { titleAmharic: '', description: '', imagePath: null, typeLabel: 'Mezmur' } as const
const hymn = (route: string, extra: Partial<SiteSearchResult> = {}): SiteSearchResult => ({
  ...base, sourceType: 'mezmur', sourceId: route, title: 'Aba Abune', route, score: 0.05, matchKind: 'fuzzy', ...extra,
})
assert.equal(canonicalMezmurSlug('/practice/mezmur/aba-abune'), 'aba-abune')
assert.equal(canonicalMezmurSlug('/practice/browse/x'), null)
const merged = dedupeResults([
  hymn('/practice/mezmur/aba-abune'),
  hymn('/practice/mezmur/aba-abune', { sourceId: 'other', excerpt: 'Aba abune', highlights: [[0, 3]], matchLabel: 'Lyric match', matchKind: 'keyword', score: 0.02 }),
  hymn('/practice/mezmur/other-hymn'),
])
assert.equal(merged.length, 2)
assert.equal(merged[0].excerpt, 'Aba abune')
assert.equal(merged[0].matchLabel, 'Lyric match')
console.log('test-search-dedupe: ok')
