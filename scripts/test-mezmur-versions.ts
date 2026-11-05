import assert from 'node:assert/strict'
import { buildCandidateIndex, compareVersions, prepareVersions, proposedFamilies, type VersionInput } from '../src/lib/mezmur/versionDetection.ts'
import { confirmedAlternatesFor, groupConfirmedSearchResults } from '../src/lib/mezmur/confirmedVersions.ts'
import type { ConfirmedMezmurFamily } from '../src/data/confirmedMezmurFamilies.ts'

const base = 'ሰላም ለእናንተ ይሁን\nእግዚአብሔር ከእናንተ ጋር\nዛሬ በደስታ እናመስግን\nበፍቅር ሁሉ እንዘምር'
const unrelated = 'ሰላም ለእናንተ ይሁን\nለመንገዱ በጣም ተዘጋጁ\nበጎራው ሰዎች አብረው ይሄዳሉ\nዛሬ ሌላ ታሪክ እንዘምራለን'
const row = (id: string, lyrics: string, title = 'ሰላም', extra: Partial<VersionInput> = {}): VersionInput => ({
  import_id: id, slug: id, title, lyrics_amharic: lyrics, ...extra,
})
const records = prepareVersions([
  row('original', base),
  row('exact', base, 'Different title'),
  row('spacing', base.replaceAll('\n', '  \n\n')),
  row('spelling', base.replace('ሰላም', 'ሠላም')),
  row('reordered', base.split('\n').reverse().join('\n')),
  row('repeated', `${base}\n${base.split('\n')[0]}`),
  row('extended', `${base}\nወደ ቤቱ በእምነት እንመለስ\nከዚያ በኋላ ምስጋና እናቅርብ`),
  row('shared-refrain', unrelated, 'Different hymn'),
  row('same-title-unrelated', 'በተራራ ላይ በረዶ ወረደ\nበወንዙ ዳር ዛፎች ተነቃቁ\nሰዎች በቤታቸው በደስታ ኖሩ', 'ሰላም'),
  row('translit', base, 'Selam'),
  row('rendition', base.replace('በፍቅር ሁሉ እንዘምር', 'በልባችን ሁሉ እንዘምር')),
  row('cross-language', '', 'ሰላም', { lyrics_english: 'Peace be with you today and tomorrow' }),
])
assert.equal(records[0].lyric, base, 'original lyric remains untouched')
assert.deepEqual(records.map((record) => record.row.import_id), ['original', 'exact', 'spacing', 'spelling', 'reordered', 'repeated', 'extended', 'shared-refrain', 'same-title-unrelated', 'translit', 'rendition', 'cross-language'])
const index = buildCandidateIndex(records)
const compare = (a: number, b: number) => compareVersions(records[a], records[b], index.documentFrequency)
assert.equal(compare(0, 1)?.relationship, 'exact-duplicate')
assert.equal(compare(0, 2)?.relationship, 'normalized-duplicate')
assert.equal(compare(0, 3)?.relationship, 'alternate-spelling')
assert.equal(compare(0, 4)?.relationship, 'alternate-stanza-structure')
assert.equal(compare(0, 5)?.relationship, 'alternate-stanza-structure')
assert.equal(compare(0, 6)?.relationship, 'extended-or-shortened')
assert.equal(compare(0, 7), null, 'one common line cannot establish a relationship when titles differ')
assert.equal(compare(0, 8)?.relationship, 'distinct-hymn')
assert.equal(compare(0, 9)?.relationship, 'exact-duplicate', 'different transliterated title does not obscure identical lyrics')
assert.equal(compare(0, 10)?.relationship, 'different-rendition')
assert.equal(compare(0, 11)?.relationship, 'possible-related-hymn', 'same title across languages is only a tentative link')
assert.ok(records[0].titleKeys.some((key) => records[9].titleKeys.includes(key)), 'existing Ethiopic transliterator connects Latin and Amharic title candidates')
assert.ok(index.pairs[0].has(1) && index.pairs[0].has(4), 'candidate index finds cross-position versions')

const short = prepareVersions([row('short-a', 'እግዚአብሔር ሆይ ምስጋና', 'A'), row('short-b', 'እግዚአብሔር ሆይ ምስጋና', 'B')])
const shortIndex = buildCandidateIndex(short)
const shortPair = compareVersions(short[0], short[1], shortIndex.documentFrequency)!
assert.equal(shortPair.relationship, 'exact-duplicate')
assert.equal(shortPair.evidence.bodySufficient, false)
assert.deepEqual(proposedFamilies(['short-a', 'short-b'], [shortPair]), [], 'common one-line text does not make a family')

const proposals = [compare(0, 1), compare(0, 4), compare(0, 7), compare(0, 8)].filter((value) => value !== null)
const families = proposedFamilies(records.map((record) => record.row.import_id), proposals)
assert.deepEqual(families, [['exact', 'original', 'reordered']])
const confirmed: ConfirmedMezmurFamily[] = [{
  id: 'family-1', approved: true, sourceSha256: 'a'.repeat(64), approvedAt: '2026-11-05',
  versions: [{ slug: 'original', title: 'Original', importId: 'original' }, { slug: 'rendition', title: 'Rendition', importId: 'rendition' }],
}]
const searchHits = [{ slug: 'rendition', rank: 1 }, { slug: 'unrelated', rank: 2 }, { slug: 'original', rank: 3 }]
assert.deepEqual(groupConfirmedSearchResults(searchHits, confirmed).map((hit) => hit.slug), ['rendition', 'unrelated'])
assert.equal(groupConfirmedSearchResults(searchHits, confirmed)[0].confirmedVersionCount, 2)
assert.deepEqual(confirmedAlternatesFor('rendition', confirmed).map((item) => item.slug), ['original'])
assert.deepEqual(groupConfirmedSearchResults(searchHits, []), searchHits, 'no approved manifest means unchanged results')
assert.deepEqual(confirmedAlternatesFor('rendition', []), [])
console.log('Mezmur version tests passed: exact, spacing, spelling, reordered/repeated stanzas, extension, common refrain, title collision, preservation.')
