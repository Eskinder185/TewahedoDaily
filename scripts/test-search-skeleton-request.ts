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

// Teaching questions: explanatory sources outrank records that only share a generic word.
import { isTeachingQuestion, rankSearchResults } from '../src/lib/search/searchCore.ts'
assert.equal(isTeachingQuestion('why do Orthodox Christians fast on Wednesday and Friday'), true)
assert.equal(isTeachingQuestion('who is Saint Michael'), false)
assert.equal(isTeachingQuestion('Kidus Mikael'), false)
const rec = (sourceType: SiteSearchResult['sourceType'], title: string, route: string, matchKind: SiteSearchResult['matchKind'] = 'alias'): SiteSearchResult => ({
  ...base, sourceType, sourceId: route, title, route, score: 0.05, matchKind, typeLabel: sourceType,
})
const ranked = rankSearchResults([
  rec('synaxarium_commemoration', 'Christians shall celebrate the festival of Peter', '/pray/synaxarium/1'),
  rec('hymn_section', 'General Fasting / Lent', '/hymns/browse/fasting/general'),
  rec('church_library', 'Fasting in the Tewahedo Church', '/library/b1?passage=p1', 'keyword'),
], 'why do Orthodox Christians fast on Wednesday and Friday', 10)
assert.equal(ranked[0].sourceType, 'church_library')
assert.equal(ranked.at(-1)?.sourceType, 'synaxarium_commemoration')
console.log('test-search-question-ranking: ok')

// Amharic approximate matching: vowel forms and doubled letters are ignored, consonants are not.
import { ethiopicSkeletonWord, ethiopicLooseRegex } from '../src/lib/search/translitSkeleton.ts'
import { approximateAmharicMatch } from '../src/lib/search/mezmurLyricSearch.ts'
assert.equal(ethiopicSkeletonWord('ይብብራል'), ethiopicSkeletonWord('ይበራል'))
assert.equal(ethiopicSkeletonWord('ያበራል'), ethiopicSkeletonWord('ይበራል'))
assert.equal(ethiopicSkeletonWord('ሠላም'), ethiopicSkeletonWord('ሰላም'), 'orthographic variant families fold')
assert.notEqual(ethiopicSkeletonWord('ሰላም'), ethiopicSkeletonWord('ሰማይ'), 'different consonants never match')
assert.ok(new RegExp(ethiopicLooseRegex('ይብብራል'), 'u').test('ጌታ ያበራል'))
assert.ok(!new RegExp(ethiopicLooseRegex('ይብብራል'), 'u').test('ይበለን'))
{
  const stored = 'እንዳንተ ያለ ማን ነው\nጌታ ያበራል ብርሃኑ ለዘላለም\nአሜን'
  const m = approximateAmharicMatch(stored, 'ይብብራል')!
  assert.deepEqual(m.excerpt.ranges.map(([a, b]) => m.excerpt.text.slice(a, b)), ['ያበራል'], 'highlight points at the stored word')
  assert.ok(stored.replace(/\s/g, ' ').includes(m.excerpt.text), 'excerpt is a slice of the stored text')
  assert.equal(approximateAmharicMatch(stored, 'ይብብራል ዘላለም ኢየሱስ'), null, 'every typed word must be accounted for')
  assert.equal(approximateAmharicMatch(stored, 'ቅዱስ'), null)
}
console.log('test-amharic-approximate: ok')

// Latin approximate matching (Bible verses): one edit per word, short words exact, every word accounted for.
import { approximateLatinMatch, latinLooseRegex, withinOneEdit } from '../src/lib/search/approximateText.ts'
assert.ok(withinOneEdit('erath', 'earth') && withinOneEdit('priase', 'praise') && withinOneEdit('huose', 'house'), 'transpositions')
assert.ok(withinOneEdit('beleive', 'believe') && withinOneEdit('lovd', 'loved') && withinOneEdit('shpeherd', 'shepherd'))
assert.ok(!withinOneEdit('light', 'night') === false, 'one substitution is one edit')
assert.ok(!withinOneEdit('mercy', 'money'), 'two edits are not close enough')
{
  const verse = 'The LORD is my shepherd; I shall not want.\nHe makes me lie down in green pastures.'
  const m = approximateLatinMatch(verse, 'shpeherd shall not')!
  assert.deepEqual(m.excerpt.ranges.map(([a, b]) => m.excerpt.text.slice(a, b)), ['shepherd', 'shall', 'not'])
  assert.equal(m.distance, 1)
  assert.ok(verse.replace(/\s/g, ' ').includes(m.excerpt.text), 'excerpt is a slice of the stored verse')
  assert.equal(approximateLatinMatch(verse, 'shpeherd mountain'), null, 'every significant word must match')
  assert.equal(approximateLatinMatch(verse, 'the of'), null, 'stopwords alone never match')
  assert.equal(approximateLatinMatch(verse, 'shall nat'), null, 'short words must be exact')
}
{
  const re = new RegExp(latinLooseRegex('shepherd'), 'i')
  for (const typed of ['shepherd', 'shpeherd', 'sheperd', 'shepherrd', 'shepxerd']) assert.ok(re.test(typed), typed)
  assert.ok(!re.test('mountain'))
}
console.log('test-latin-approximate: ok')
