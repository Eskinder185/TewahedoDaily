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
