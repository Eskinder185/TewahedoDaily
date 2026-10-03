/**
 * Pure Synaxarium Search Buddy catalog checks (no Supabase).
 * Run: npm run test:synaxarium-search
 */
import assert from 'node:assert/strict'
import {
  isTodaySynaxariumQuery,
  searchSynaxariumCatalog,
} from '../src/lib/search/synaxariumSearchCore.ts'
import { isPublicContentRoute } from '../src/lib/search/searchCore.ts'

const docs = [
  {
    id: 'day:1',
    kind: 'day',
    title: 'Meskerem 17 / September 27',
    titleAmharic: 'Meskerem 17 Amharic',
    daySlug: 'meskerem-17',
    ethiopianLabel: 'Meskerem 17',
    ethiopianLabelAm: 'Meskerem 17 Amharic',
    displayDateEnglish: 'Meskerem 17 / September 27',
    monthNumber: 1,
    dayNumber: 17,
    excerpt: 'Commemorations for Meskerem 17.',
    imagePath: null,
    blob: 'meskerem 17 september 27 synaxarium senkesar',
  },
  {
    id: 'comm:1',
    kind: 'commemoration',
    title: 'Saint Stephen',
    titleAmharic: 'Qidus Estifanos',
    daySlug: 'meskerem-17',
    ethiopianLabel: 'Meskerem 17',
    ethiopianLabelAm: 'Meskerem 17 Amharic',
    displayDateEnglish: 'Meskerem 17 / September 27',
    monthNumber: 1,
    dayNumber: 17,
    excerpt: 'The first martyr.',
    imagePath: null,
    blob: 'saint stephen qidus estifanos meskerem 17 september 27 synaxarium stephanus',
  },
]

const byName = searchSynaxariumCatalog(docs, 'Saint Stephen', 5)
assert.ok(byName.some((r) => r.sourceId === 'comm:1'))
assert.ok(byName.every((r) => r.route === '/pray/synaxarium/meskerem-17'))
assert.ok(byName[0].dateLabel?.includes('Meskerem'))
assert.ok(byName[0].excerpt?.includes('martyr'))
assert.equal(byName[0].sourceLabel, 'Synaxarium')

const byAmharic = searchSynaxariumCatalog(docs, 'Estifanos', 5)
assert.ok(byAmharic.some((r) => r.sourceId === 'comm:1'))

const byAlias = searchSynaxariumCatalog(docs, 'Stephanus', 5)
assert.ok(byAlias.some((r) => r.sourceId === 'comm:1'))

const byEthDate = searchSynaxariumCatalog(docs, 'Meskerem 17', 5)
assert.ok(byEthDate.some((r) => r.route === '/pray/synaxarium/meskerem-17'))

const byGregorian = searchSynaxariumCatalog(docs, 'September 27', 5)
assert.ok(byGregorian.some((r) => r.route === '/pray/synaxarium/meskerem-17'))

const todayHits = searchSynaxariumCatalog(docs, "today's Synaxarium", 5, {
  month: 1,
  day: 17,
})
assert.ok(todayHits.some((r) => r.route === '/pray/synaxarium/meskerem-17'))
assert.ok(isTodaySynaxariumQuery("today's Synaxarium"))

const boundaryOther = searchSynaxariumCatalog(docs, "today's Synaxarium", 5, {
  month: 1,
  day: 18,
})
assert.ok(!boundaryOther.some((r) => r.sourceId === 'comm:1' && r.matchKind === 'alias'))

const zero = searchSynaxariumCatalog(docs, 'zzzz-no-such-saint-999', 5)
assert.equal(zero.length, 0)

for (const hit of [...byName, ...byEthDate, ...todayHits]) {
  assert.ok(isPublicContentRoute(hit.route))
  assert.ok(!hit.route.includes(':'))
  assert.ok(hit.route.startsWith('/pray/synaxarium/'))
}

console.log('synaxarium-search pure checks: ok')
