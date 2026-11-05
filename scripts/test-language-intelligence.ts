import assert from 'node:assert/strict'
import { performance } from 'node:perf_hooks'
import { entitySearchVariants, identifyEntity, matchContent, normalizeForSearch, recognizeEntities } from '../src/lib/language/index.ts'
import { matchText, wordSpans, wordMatches } from '../src/lib/search/textMatch.ts'
import { rankPublicRows, searchPublicMezmurLyrics, type PublicClient, type PublicMezmurRow, type PublicQuery } from '../src/lib/search/mezmurLyricSearch.ts'

// These passages and names are already present in the repository's Bible search fixtures,
// calendar aliases and Ethiopic Mezmur transliterator.
assert.equal(normalizeForSearch('ሠላም፡ ለእናንተ'), normalizeForSearch('ሰላም ለእናንተ'))
assert.equal(normalizeForSearch('ሠላም', { foldEthiopicVariants: false }), 'ሠላም')
assert.notEqual(normalizeForSearch('ሠላም', { foldEthiopicVariants: false }), normalizeForSearch('ሰላም', { foldEthiopicVariants: false }))
assert.equal(normalizeForSearch('Geʼez መንፈስ፡ቅዱስ'), 'gez መንፈስ ቅዱስ')
assert.equal(normalizeForSearch(''), '')
const decomposed = 'Cafe\u0301 ሰላም'
assert.deepEqual(matchContent(decomposed, 'café')?.ranges.map(([a, b]) => decomposed.slice(a, b)), ['Cafe\u0301'])

assert.equal(identifyEntity('Mikael')[0]?.entity.id, 'archangel:michael')
assert.equal(identifyEntity('ሚካኤል')[0]?.entity.id, 'archangel:michael')
assert.equal(identifyEntity('Saint Michael')[0]?.entity.id, 'archangel:michael')
assert.equal(identifyEntity('mikaelx', { fuzzy: true })[0]?.method, 'fuzzy')
assert.deepEqual(identifyEntity('mikaelx'), [], 'fuzzy matching is opt in')
assert.equal(identifyEntity('የዮሐንስ ወንጌል')[0]?.entity.id, 'biblical-book:john')
assert.equal(identifyEntity('ወንጌል ዘዮሐንስ')[0]?.entity.id, 'biblical-book:john')
assert.equal(identifyEntity('ወንጌል ዘዮሐንስ', { orthography: { foldEthiopicVariants: false } })[0]?.entity.id, 'biblical-book:john')
assert.ok(recognizeEntities('ወንጌል ዘዮሐንስ', { foldEthiopicVariants: false }).some((hit) => hit.entity.id === 'biblical-book:john'))
assert.equal(identifyEntity('መንፈስ ቅዱስ')[0]?.entity.id, 'term:holy-spirit')
assert.equal(identifyEntity('Theotokos')[0]?.entity.id, 'term:theotokos')
assert.equal(identifyEntity('Golgotha')[0]?.entity.id, 'place:golgotha')
assert.equal(identifyEntity('ፍልሰታ')[0]?.entity.id, 'feast:filseta')
assert.ok(!identifyEntity('ፍልሰታ').some((hit) => hit.entity.id === 'saint:mary'))

const ambiguous = identifyEntity('መስቀል')
assert.deepEqual(new Set(ambiguous.map((hit) => hit.entity.id)), new Set(['feast:meskel', 'term:cross']))
assert.ok(ambiguous.every((hit) => hit.ambiguous))
assert.deepEqual(entitySearchVariants('መስቀል'), ['መስቀል'], 'ambiguous terms cannot expand silently')
assert.deepEqual(identifyEntity('Michaelmas'), [], 'no substring entity matching')
assert.deepEqual(recognizeEntities('ሚካኤልን ዘመርን'), [], 'a bare embedded substring is not a mention')

const content = 'ሠላም፡ ለእናንተ። Saint Michael እና ገብርኤል'
const mention = recognizeEntities(content)
assert.ok(mention.some((hit) => hit.entity.id === 'archangel:michael' && content.slice(...hit.range!) === 'Saint Michael'))
assert.ok(mention.some((hit) => hit.entity.id === 'archangel:gabriel' && content.slice(...hit.range!) === 'ገብርኤል'))
assert.ok(!mention.some((hit) => hit.entity.id === 'feast:meskel'))
const mixed = matchContent('Peace ሠላም ለእናንተ', 'peace ሰላም')
assert.equal(mixed?.kind, 'phrase')
assert.deepEqual(mixed?.ranges.map(([start, end]) => 'Peace ሠላም ለእናንተ'.slice(start, end)), ['Peace', 'ሠላም'])
const geez = 'ስብሐት፡ ለእግዚአብሔር'
assert.equal(matchContent(geez, 'ስብሐት ለእግዚአብሔር')?.kind, 'phrase')
assert.deepEqual(matchContent(geez, 'ስብሐት ለእግዚአብሔር')?.ranges.map(([a, b]) => geez.slice(a, b)), ['ስብሐት', 'ለእግዚአብሔር'])
const bibleEn = 'In the beginning, God created the heavens and the earth.'
const bibleAm = 'በመጀመሪያ እግዚአብሔር ሰማይንና ምድርን ፈጠረ።'
assert.equal(matchContent(bibleEn, 'God created')?.kind, 'phrase')
assert.equal(matchContent(bibleAm, 'እግዚአብሔር ሰማይ')?.kind, 'phrase')
assert.equal(matchContent(bibleAm, '') , null)

const row = (slug: string, extra: Partial<PublicMezmurRow> = {}): PublicMezmurRow => ({
  slug, status: 'published', title: slug, lyrics_amharic: null, lyrics_english: null,
  lyrics_geez: null, lyrics_transliteration: null, lyrics_oromo: null, ...extra,
})
const hymns = [
  row('michael-hymn', { title_amharic: 'ሚካኤል ሊቀ መላእክት', lyrics_amharic: 'ሚካኤል ሊቀ መላእክት ነው' }),
  row('mention-only', { title: 'Other hymn', lyrics_amharic: 'ሚካኤል ተጠራ' }),
  row('unrelated', { title: 'Peace', lyrics_amharic: 'ሰላም ለእናንተ' }),
  row('draft', { title_amharic: 'ሚካኤል', status: 'draft' }),
]
const ranked = rankPublicRows(hymns, 'Saint Michael')
assert.deepEqual(ranked.map((hit) => hit.row.slug), ['michael-hymn', 'mention-only'])
assert.equal(ranked[1].tier, 'lyric-phrase', 'a name mention is a lyric hit, never classification')
assert.equal(ranked[0].excerpt?.text.includes('ሚካኤል'), true)
assert.deepEqual(rankPublicRows([row('mixed', { title: 'Peace', title_amharic: 'ሰላም' })], 'peace ሰላም').map((hit) => hit.row.slug), ['mixed'])

const calls: { limit: number; filters: string[] }[] = []
const fakeClient: PublicClient = { from(table: string): PublicQuery {
  assert.equal(table, 'mezmur_public')
  const call = { limit: 0, filters: [] as string[] }
  const query = {
    select(_columns: string) { return query },
    or(filter: string) { call.filters.push(filter); return query },
    in(_column: string, _values: string[]) { return query },
    limit(limit: number) { call.limit = limit; return query },
    then(resolve: (value: { data: PublicMezmurRow[]; error: null }) => unknown) {
      calls.push(call)
      // Mimic only the relevant DB feature: a filtered alias request finds the Ethiopic title.
      const data = call.filters.some((filter) => filter.includes('ሚካ_ል')) ? hymns : []
      return Promise.resolve(resolve({ data: data.slice(0, call.limit), error: null }))
    },
  }
  return query as unknown as PublicQuery
} }
const found = await searchPublicMezmurLyrics('Saint Michael', { client: fakeClient })
assert.deepEqual(found.items.map((item) => item.slug), ['michael-hymn', 'mention-only'])
assert.ok(calls.length <= 3 && calls.every((call) => call.filters.length > 0 && call.limit <= 60))

// Comparison with the previous 16-word window strategy on a long lyric-shaped input.
const long = `${'ሚካኤል '.repeat(1600)}ሰላም ገብርኤል`
function previousWindow(text: string, query: string): number {
  const spans = wordSpans(text)
  const terms = wordSpans(query).map((span) => span.folded)
  const hits = spans.flatMap((span) => terms.filter((term) => wordMatches(span.folded, term)).map((term) => ({ span, term })))
  let best = 0
  for (const hit of hits) {
    const start = spans.indexOf(hit.span)
    const window = hits.filter((candidate) => {
      const index = spans.indexOf(candidate.span)
      return index >= start && index < start + 16
    })
    best = Math.max(best, new Set(window.map((candidate) => candidate.term)).size)
  }
  return best
}
const before = performance.now()
assert.equal(previousWindow(long, 'ሚካኤል ገብርኤል'), 2)
const oldMs = performance.now() - before
const after = performance.now()
assert.equal(matchText(long, 'ሚካኤል ገብርኤል')?.kind, 'words')
const newMs = performance.now() - after
assert.ok(newMs < 1500, `long lyric match took ${newMs.toFixed(1)} ms`)
console.log(`Language intelligence tests passed. Long lyric window: previous ${oldMs.toFixed(1)} ms, current ${newMs.toFixed(1)} ms (1602 words).`)
