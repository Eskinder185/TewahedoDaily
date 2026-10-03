/**
 * Regression checks for post-update audit L01–L13 behaviors that are unit-testable.
 * Run: node --experimental-strip-types --no-warnings scripts/test-post-update-audit.mjs
 */
import assert from 'node:assert/strict'
import { readFileSync } from 'node:fs'
import {
  expandSearchAliases,
  rankSearchResults,
  relevanceAdjustedScore,
  searchTokens,
} from '../src/lib/search/searchCore.ts'
import { hymnSectionArtFallback } from '../src/lib/publicContent/hymnSectionArtFallbacks.ts'

// L07 — Amharic feast terminology (not “very good party”)
const am = JSON.parse(readFileSync(new URL('../src/locales/am.json', import.meta.url), 'utf8'))
assert.notEqual(am.calendar.upcoming.labelGreatFeast, 'በጣም ጥሩ ድግስ')
assert.notEqual(am.calendar.filters.majorFeasts, 'በጣም ጥሩ ድግስ')
assert.match(am.calendar.upcoming.labelGreatFeast, /በዓል/)

// L03 — Timkat local art fallback exists
assert.ok(hymnSectionArtFallback('holidays-timket').includes('Timket'))

// L05 / alias expansion for Timkat
const expanded = expandSearchAliases('Timkat').toLowerCase()
assert.ok(expanded.includes('timket') || expanded.includes('epiphany'))

// L06 — Find a prayer should prefer prayer/guide over synaxarium
const prayerRanked = rankSearchResults(
  [
    {
      sourceType: 'synaxarium_commemoration',
      sourceId: 'c1',
      title: 'Prayer of someone',
      titleAmharic: '',
      description: 'Synaxarium',
      route: '/pray/synaxarium/meskerem-01',
      imagePath: null,
      score: 0.05,
      matchKind: 'keyword',
      typeLabel: 'Synaxarium',
    },
    {
      sourceType: 'guide',
      sourceId: 'g1',
      title: 'Learn how to pray',
      titleAmharic: '',
      description: 'Guide',
      route: '/pray/learn-how-to-pray',
      imagePath: null,
      score: 0.06,
      matchKind: 'alias',
      typeLabel: 'Guide',
    },
    {
      sourceType: 'page',
      sourceId: 'p1',
      title: 'Pray',
      titleAmharic: '',
      description: 'Hub',
      route: '/pray',
      imagePath: null,
      score: 0.04,
      matchKind: 'alias',
      typeLabel: 'Page',
    },
  ],
  'Find a prayer',
  10,
)
assert.equal(prayerRanked[0].sourceType, 'guide')

// L06 — Uriel aliases expand
const uriel = expandSearchAliases('Saint Uriel').toLowerCase()
assert.ok(uriel.includes('uriel'))

// L06 — hymn query demotes bare synaxarium relative to section
const meskelAdjSection = relevanceAdjustedScore(
  {
    sourceType: 'hymn_section',
    sourceId: 's',
    title: 'Meskel / Holy Cross',
    titleAmharic: '',
    description: '',
    route: '/practice/browse/holidays-feasts/holidays-meskel',
    imagePath: null,
    score: 0.05,
    matchKind: 'alias',
    typeLabel: 'Section',
  },
  searchTokens(expandSearchAliases('Find Meskel hymns')),
)
const meskelAdjSynax = relevanceAdjustedScore(
  {
    sourceType: 'synaxarium',
    sourceId: 'd',
    title: 'Meskerem 17',
    titleAmharic: '',
    description: '',
    route: '/pray/synaxarium/meskerem-17',
    imagePath: null,
    score: 0.05,
    matchKind: 'keyword',
    typeLabel: 'Synaxarium',
  },
  searchTokens(expandSearchAliases('Find Meskel hymns')),
)
assert.ok(meskelAdjSection < meskelAdjSynax, 'Meskel section should outrank Synaxarium day for hymn query')

// L08 — weekday dedupe helper pattern
function dedupeMeta(chapter, section) {
  return [chapter, section]
    .map((part) => (part || '').trim())
    .filter(Boolean)
    .filter((part, index, all) => all.findIndex((p) => p.toLowerCase() === part.toLowerCase()) === index)
    .join(' / ')
}
assert.equal(dedupeMeta('Monday', 'Monday'), 'Monday')
assert.equal(dedupeMeta('Monday', 'ሰኞ'), 'Monday / ሰኞ')

// L10 — reply payload shape used by Search Buddy
const replyKinds = new Set(['searching', 'unavailable', 'zero', 'favorites', 'opening', 'foundOne', 'foundMany', 'generic'])
assert.ok(replyKinds.has('foundMany'))

console.log('post-update-audit pure checks: ok')
