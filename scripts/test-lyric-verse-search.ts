/**
 * Unit tests: shared text matcher, highlight ranges, ILIKE helpers, Mezmur lyric ranking, bounded fallback
 * search and API-result decoration. Fixtures only; no network, SQL or Supabase project.
 * Run: npx tsx scripts/test-lyric-verse-search.ts
 */
import assert from 'node:assert/strict'
import { buildExcerpt, foldWord, ilikePart, matchText, orIlike, queryWords, retrievalWords } from '../src/lib/search/textMatch.ts'
import {
  attachLyricExcerpts, excerptForRow, rankPublicRows, searchPublicMezmurLyrics, tierForRow,
  type PublicClient, type PublicMezmurRow, type PublicQuery,
} from '../src/lib/search/mezmurLyricSearch.ts'

const covered = (text: string, ranges: Array<[number, number]>) => ranges.map(([from, to]) => text.slice(from, to))

// ------------------------------------------------------------------ folding and word matching
assert.equal(foldWord('ሠላም'), foldWord('ሰላም'), 'Ethiopic variant family ሠ/ሰ')
assert.equal(foldWord('ሐይል'), foldWord('ኀይል'))
assert.equal(foldWord('ዓለም'), foldWord('ኣለም'), 'ዓ and ኣ are one family')
assert.equal(foldWord('Sselam'), foldWord('selam'), 'doubled Latin letters')
assert.equal(foldWord("Ge'ez"), foldWord('Geez'), 'apostrophes')
assert.equal(foldWord('Ｌove'), 'love', 'fullwidth letters via NFKC')
assert.equal(foldWord('Café'), 'cafe')
assert.notEqual(foldWord('qal'), foldWord('kal'), 'q and k are NOT conflated (no speculative phonetics)')
assert.deepEqual(queryWords('  In  the\u00A0beginning, God   created።'), ['in', 'the', 'begining', 'god', 'created'], 'folded form: doubled Latin letters collapse')

const en = 'In the beginning, God created the heavens and the earth.'
let m = matchText(en, 'in the  BEGINNING god created')
assert.equal(m?.kind, 'phrase')
assert.deepEqual(covered(en, m!.ranges), ['In', 'the', 'beginning', 'God', 'created'])
m = matchText(en, 'God earth heavens')
assert.equal(m?.kind, 'words')
assert.deepEqual(covered(en, m!.ranges).sort(), ['God', 'earth', 'heavens'])
assert.equal(matchText(en, 'purple elephants'), null)
assert.equal(matchText(en, 'the of and'), null, 'function words alone never match')
assert.equal(matchText(en, 'beg')?.kind, 'phrase', 'typed prefix of a word')
assert.equal(matchText(en, 'x'), null)
assert.equal(matchText('', 'god'), null)

const am = 'በመጀመሪያ እግዚአብሔር ሰማይንና ምድርን ፈጠረ።'
m = matchText(am, 'እግዚአብሔር፣  ሰማይ')
assert.equal(m?.kind, 'phrase')
assert.deepEqual(covered(am, m!.ranges), ['እግዚአብሔር', 'ሰማይንና'], 'Ethiopic comma/spacing ignored; stem matches inflected word')
assert.equal(matchText('ሠላም ለናንተ', 'ሰላም ለናንተ')?.kind, 'phrase', 'orthographic variant')
assert.equal(matchText(am, 'ፈጠረ።')?.kind, 'phrase')
assert.equal(matchText(am, 'ሰማዩ ምድር'), null, 'only one of two meaningful words present → no match')

// ------------------------------------------------------------------ excerpts never alter or invent text
const long = `${'alpha beta gamma delta '.repeat(30)}Peace be with you all ${'epsilon zeta eta theta '.repeat(30)}`
const excerpt = buildExcerpt(long, 'peace be with you', 120)!
assert.ok(excerpt.text.length <= 130)
assert.ok(excerpt.text.startsWith('…') && excerpt.text.endsWith('…'), 'truncation is marked')
assert.deepEqual(covered(excerpt.text, excerpt.ranges), ['Peace', 'be', 'with', 'you'])
assert.ok(long.replace(/\s+/g, ' ').includes(excerpt.text.replace(/…/g, '').trim()), 'excerpt is a verbatim slice of the stored text')
assert.equal(buildExcerpt('line one\n\nPeace  here', 'peace')?.text, 'line one Peace here', 'whitespace flattened only')
assert.equal(buildExcerpt(en, 'zzz'), null)

// ------------------------------------------------------------------ ILIKE helpers
assert.equal(ilikePart('ሰላም'), '_ላም', 'variant letters become single-character wildcards')
assert.equal(ilikePart('100%_"x\\*'), '100x', 'filter-breaking characters are removed')
assert.equal(orIlike(['title', 'lyrics_english'], 'a b'), 'title.ilike."*a b*",lyrics_english.ilike."*a b*"')
assert.equal(orIlike(['title'], '%%'), '', 'nothing searchable → no filter')
assert.deepEqual(retrievalWords('the Lord is my shepherd and the way', 3), ['shepherd', 'lord', 'way'], 'longest distinctive words, no function words')
assert.ok(retrievalWords('the of and').length <= 3)

// ------------------------------------------------------------------ Mezmur ranking
const row = (slug: string, extra: Partial<PublicMezmurRow> = {}): PublicMezmurRow => ({
  slug, title: slug, status: 'published', primary_language: 'am', lyrics_amharic: null, lyrics_english: null,
  lyrics_transliteration: null, lyrics_geez: null, lyrics_oromo: null, search_keywords: null, ...extra })
const rows = [
  row('lyric', { title: 'Another song', lyrics_english: 'Peace be with you all' }),
  row('partial', { title: 'Another', lyrics_english: 'with great peace and joy be upon the earth' }),
  row('exact', { title: 'Peace be with you' }),
  row('titlephrase', { title: 'Hymn: peace be with you, friends' }),
  row('draft', { title: 'Peace be with you', status: 'draft' }),
  row('nomatch', { title: 'Unrelated', lyrics_english: 'Different words entirely' }),
]
assert.deepEqual(rankPublicRows(rows, 'peace be with you').map((hit) => hit.row.slug), ['exact', 'titlephrase', 'lyric', 'partial'])
assert.equal(tierForRow(rows[2], 'Peace  be with   YOU').tier, 'title-exact')
assert.equal(tierForRow(rows[0], 'peace be with you').tier, 'lyric-phrase')
assert.equal(tierForRow(rows[1], 'peace be with you').tier, 'partial')
assert.equal(tierForRow(rows[5], 'peace be with you').tier, null)

const hymn = row('selam', { lyrics_amharic: 'ሠላም ለናንተ ይሁን\nእግዚአብሔር ከእናንተ ጋር', lyrics_transliteration: 'Selam lenante yihun Egziabher kenante gar', lyrics_english: 'Peace be with you.' })
assert.equal(excerptForRow(hymn, 'ሰላም ለናንተ')?.field, 'lyrics_amharic', 'Ethiopic query prefers the Amharic lyric')
assert.equal(excerptForRow(hymn, 'egziabher kenante')?.field, 'lyrics_transliteration', 'Latin query prefers the stored transliteration')
assert.equal(excerptForRow(hymn, 'peace be')?.field, 'lyrics_english')
assert.equal(excerptForRow(row('restricted', { title: 'x' }), 'peace'), null, 'no lyrics stored → no excerpt (nothing invented)')

// ------------------------------------------------------------------ bounded fallback search against a fake PostgREST
type Call = { select: string; or: string[]; inSlugs: string[] | null; limit: number }
function likeRegex(pattern: string): RegExp {
  return new RegExp(`^${pattern.replace(/[.+^${}()|[\]\\]/g, '\\$&').replace(/[%*]/g, '.*').replace(/_/g, '.')}$`, 'isu')
}
function fakeClient(data: PublicMezmurRow[], calls: Call[], failWith?: string): PublicClient {
  return {
    from(table: string): PublicQuery {
      assert.equal(table, 'mezmur_public', 'only the public projection is read')
      const call: Call = { select: '', or: [], inSlugs: null, limit: 1000 }
      const query = {
        select(columns: string) { call.select = columns; return query },
        or(filter: string) { call.or.push(filter); return query },
        in(_column: string, values: string[]) { call.inSlugs = values; return query },
        limit(count: number) { call.limit = count; return query },
        then(resolve: (value: { data: unknown; error: { message: string } | null }) => unknown) {
          calls.push(call)
          if (failWith) return Promise.resolve(resolve({ data: null, error: { message: failWith } }))
          let out = data
          for (const group of call.or) {
            const parts = [...group.matchAll(/(\w+)\.ilike\."([^"]*)"/g)]
            out = out.filter((r) => parts.some((part) => likeRegex(part[2]).test(String((r as Record<string, unknown>)[part[1]] ?? ''))))
          }
          if (call.inSlugs) out = out.filter((r) => call.inSlugs!.includes(String(r.slug)))
          return Promise.resolve(resolve({ data: out.slice(0, call.limit), error: null }))
        },
      }
      return query as unknown as PublicQuery
    },
  }
}
const catalog = [...rows, hymn,
  row('latin', { title: 'Latin Song', primary_language: 'en', lyrics_transliteration: 'Amlak yemesgen new betam' })]

let calls: Call[] = []
let found = await searchPublicMezmurLyrics('Peace be with you', { client: fakeClient(catalog, calls) })
assert.deepEqual(found.items.map((i) => i.slug), ['exact', 'titlephrase', 'lyric', 'selam', 'partial'], 'exact title, title phrase, lyric phrases (ties by title), then partial')
assert.equal(found.items[0].slug, 'exact')
assert.ok(!found.items.some((i) => i.slug === 'draft'), 'unpublished rows are never returned even if the view leaks them')
assert.ok(calls.length <= 2 && calls.every((c) => c.limit <= 60 && c.or.length >= 1), `bounded, filtered requests: ${JSON.stringify(calls.map((c) => [c.or.length, c.limit]))}`)
assert.ok(calls.every((c) => !c.select.includes('*')), 'explicit columns only')
assert.equal(found.items.find((i) => i.slug === 'selam')?.excerpt?.field, 'lyrics_english')

calls = []
found = await searchPublicMezmurLyrics('ሰላም ለናንተ ይሁን', { client: fakeClient(catalog, calls) })
assert.deepEqual(found.items.map((i) => i.slug), ['selam'], 'user typed ሰ; stored text has ሠ')
assert.match(found.items[0].excerpt!.text, /ሠላም ለናንተ ይሁን/)
assert.deepEqual(covered(found.items[0].excerpt!.text, found.items[0].excerpt!.ranges), ['ሠላም', 'ለናንተ', 'ይሁን'])

found = await searchPublicMezmurLyrics('Egziabher  kenante', { client: fakeClient(catalog, []) })
assert.deepEqual(found.items.map((i) => i.slug), ['selam'], 'Latin transliterated lyric phrase with extra spaces')
found = await searchPublicMezmurLyrics('betam', { client: fakeClient(catalog, []), language: 'en' })
assert.deepEqual(found.items.map((i) => i.slug), ['latin'], 'language filter applies to the fallback')
found = await searchPublicMezmurLyrics('betam', { client: fakeClient(catalog, []), language: 'am' })
assert.deepEqual(found.items, [])
for (const q of ['', ' ', 'a', 'zzzz nothing']) {
  assert.deepEqual((await searchPublicMezmurLyrics(q, { client: fakeClient(catalog, []) })).items, [], `"${q}" → no results, no error`)
}
assert.deepEqual((await searchPublicMezmurLyrics('peace', { client: null })).items, [], 'no client → empty, not a crash')
await assert.rejects(searchPublicMezmurLyrics('peace', { client: fakeClient(catalog, [], 'boom') }), /boom/, 'database errors propagate so the caller can degrade')

// ------------------------------------------------------------------ API results decorated, never reordered
const api = [{ slug: 'selam', title: 'S' }, { slug: 'draft', title: 'D' }, { slug: 'exact', title: 'E' }, { slug: 'ghost', title: 'G' }]
let decorated = await attachLyricExcerpts(api, 'peace be with you', fakeClient(catalog, []))
assert.deepEqual(decorated.map((i) => i.slug), ['selam', 'exact'], 'API order kept; items absent from the public projection are dropped')
assert.ok(decorated[0].excerpt && decorated[1].excerpt === null, 'excerpt only where public lyrics contain the words')
decorated = await attachLyricExcerpts(api, 'peace', fakeClient(catalog, [], 'view unavailable'))
assert.deepEqual(decorated.map((i) => i.slug), api.map((i) => i.slug), 'projection failure leaves the API list intact')
assert.ok(decorated.every((i) => i.excerpt === null))
decorated = await attachLyricExcerpts([], 'peace', fakeClient(catalog, []))
assert.deepEqual(decorated, [])

console.log('Lyric/verse search unit tests passed: matcher, excerpts, ILIKE helpers, ranking tiers, bounded fallback, API decoration.')
