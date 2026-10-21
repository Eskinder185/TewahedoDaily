/**
 * Pure Search Buddy checks: aliases, ranking, titles, follow-ups, routes.
 * Run: npm run test:search-site
 */
import assert from 'node:assert/strict'
import { readFileSync } from 'node:fs'
import {
  dedupeResults,
  displayTitle,
  expandSearchAliases,
  extractTopics,
  isPublicContentRoute,
  looksLikeSlug,
  normalizeSearchText,
  rankSearchResults,
  resolveFollowUpQuery,
  searchTokens,
} from '../src/lib/search/searchCore.ts'
import {
  editorialSearchResults,
  isNavigationResult,
  reportSiteSources,
  siteSearchFlags,
} from '../src/lib/search/siteSearchStatus.ts'
import { matchNavigationIntent } from '../src/lib/search/routeSearch.ts'

// Minimal catalog mirror of curated feast routes (keeps this script extension-safe).
const CURATED = [
  {
    title: 'Meskel / Holy Cross',
    route: '/practice/browse/holidays-feasts/holidays-meskel',
    aliases: ['meskel', 'meskal', 'meskle', 'meskel hymns', 'find meskel hymns'],
    sourceType: 'hymn_section',
  },
  {
    title: 'Timkat / Epiphany',
    route: '/practice/browse/holidays-feasts/holidays-timket',
    aliases: ['timkat', 'timket', 'epiphany', 'timkat hymns'],
    sourceType: 'hymn_section',
  },
  {
    title: 'Calendar',
    route: '/calendar',
    aliases: ['calendar', 'take me to the calendar', 'open calendar'],
    sourceType: 'calendar',
  },
  {
    title: 'Hymns Practice',
    route: '/practice',
    aliases: ['hymns practice'],
    sourceType: 'page',
  },
]

function catalogHit(query) {
  const q = query.toLowerCase()
  const expanded = expandSearchAliases(query).toLowerCase()
  return CURATED.filter(
    (e) =>
      e.aliases.some((a) => q.includes(a) || expanded.includes(a)) ||
      expanded.split(/\s+/).some((t) => e.route.includes(t) && t.length >= 4),
  )
}

// --- aliases ---
const timkatExpanded = expandSearchAliases('Timkat').toLowerCase()
assert.ok(timkatExpanded.includes('timket'))
assert.ok(timkatExpanded.includes('epiphany'))
assert.ok(timkatExpanded.includes('holidays-timket'))

const meskle = expandSearchAliases('Meskle').toLowerCase()
assert.ok(meskle.includes('meskel'))

const michael = expandSearchAliases('Find St Michael hymns').toLowerCase()
assert.ok(michael.includes('mikael'))
const micheal = expandSearchAliases('Micheal').toLowerCase()
assert.ok(micheal.includes('michael'))
assert.ok(micheal.includes('ሚካኤል'))
const gebriel = expandSearchAliases('Gebriel').toLowerCase()
assert.ok(gebriel.includes('gabriel'))
assert.ok(normalizeSearchText("When's Saint Michael's feast?").includes('michael'))
assert.ok(normalizeSearchText("What's the next fast?").includes('next'))

// --- tokens keep feast words ---
const tokens = searchTokens('Find Meskel hymns')
assert.ok(tokens.includes('meskel'))
assert.ok(!tokens.includes('find'))

// --- titles never show raw slugs ---
assert.equal(displayTitle('prayer-of-the-covenant-430'), 'Prayer Of The Covenant')
assert.equal(looksLikeSlug('prayer-of-the-covenant-430'), true)
assert.equal(looksLikeSlug('Meskel / Holy Cross'), false)

// --- curated Timkat / Meskel ---
assert.ok(
  catalogHit('Timkat').some((h) => h.route === '/practice/browse/holidays-feasts/holidays-timket'),
  'Timkat should resolve to Timkat section',
)
assert.ok(
  catalogHit('Epiphany').some((h) => h.route === '/practice/browse/holidays-feasts/holidays-timket'),
  'Epiphany alias should resolve to Timkat section',
)
assert.ok(
  catalogHit('Find Meskel hymns').some(
    (h) => h.route === '/practice/browse/holidays-feasts/holidays-meskel',
  ),
  'Meskel hymns should resolve to Meskel section',
)

// --- ranking: section before broad practice page ---
const ranked = rankSearchResults(
  [
    {
      sourceType: 'page',
      sourceId: 'page:hymns',
      title: 'Hymns Practice',
      titleAmharic: '',
      description: 'Browse',
      route: '/practice',
      imagePath: null,
      score: 0.05,
      matchKind: 'alias',
      typeLabel: 'Page',
    },
    {
      sourceType: 'hymn_section',
      sourceId: 'section:meskel',
      title: 'Meskel / Holy Cross',
      titleAmharic: '',
      description: 'Section',
      route: '/practice/browse/holidays-feasts/holidays-meskel',
      imagePath: null,
      score: 0.05,
      matchKind: 'alias',
      typeLabel: 'Section',
    },
    {
      sourceType: 'mezmur',
      sourceId: 'm1',
      title: 'Meskel Abeba',
      titleAmharic: '',
      description: 'Mezmur',
      route: '/practice/mezmur/meskel-abeba',
      imagePath: null,
      score: 0.06,
      matchKind: 'fuzzy',
      typeLabel: 'Mezmur',
    },
  ],
  'Find Meskel hymns',
  10,
)
assert.equal(ranked[0].sourceType, 'hymn_section')
assert.ok(!ranked.some((r) => r.route === '/practice'), 'generic practice hub demoted')

// --- navigation intent (deterministic calendar target) ---
assert.ok(catalogHit('Take me to the calendar').some((h) => h.route === '/calendar'))
assert.ok(catalogHit('Open Calendar').some((h) => h.route === '/calendar'))

const openCalendar = matchNavigationIntent('Open Calendar')
assert.equal(openCalendar?.route, '/calendar')
assert.equal(openCalendar?.title, 'Calendar')

// --- follow-ups ---
const session = {
  lastQuery: 'Find Meskel hymns',
  lastTopics: extractTopics('Find Meskel hymns'),
  lastRoutes: ['/practice/browse/holidays-feasts/holidays-meskel'],
}
const englishFollow = resolveFollowUpQuery('show English ones', session)
assert.equal(englishFollow.isFollowUp, true)
assert.ok(englishFollow.query.toLowerCase().includes('english'))
assert.ok(englishFollow.query.toLowerCase().includes('meskel'))

const amFollow = resolveFollowUpQuery('show Amharic ones', session)
assert.equal(amFollow.isFollowUp, true)

// Independent topics must NOT become follow-ups
const independent = resolveFollowUpQuery('repentance', session)
assert.equal(independent.isFollowUp, false)
assert.equal(independent.query, 'repentance')

// --- route validity for curated catalog ---
for (const entry of CURATED) {
  assert.ok(isPublicContentRoute(entry.route), `invalid route ${entry.route}`)
  assert.ok(!entry.route.includes(':'), `template route ${entry.route}`)
}

// --- no invented admin routes ---
assert.equal(isPublicContentRoute('/admin/content'), false)
assert.equal(isPublicContentRoute('/practice/mezmur/:slug'), false)

// --- expanded catalog hubs (Bible / saints / feasts) ---
const routeCatalogSrc = readFileSync(
  new URL('../src/lib/search/routeCatalog.ts', import.meta.url),
  'utf8',
)
assert.match(routeCatalogSrc, /route: '\/bible'/)
assert.match(routeCatalogSrc, /route: '\/saints'/)
assert.match(routeCatalogSrc, /route: '\/feasts'/)
assert.match(routeCatalogSrc, /bible hub/)

const zeroSrc = readFileSync(new URL('../src/lib/search/searchSite.ts', import.meta.url), 'utf8')
assert.match(zeroSrc, /bible hub/)
assert.match(zeroSrc, /searchRouteCatalog\('saints'/)
assert.match(zeroSrc, /searchRouteCatalog\('feasts'/)
assert.match(zeroSrc, /listContent\(kind, query, 'published'/)
assert.equal(zeroSrc.includes('/api/chat'), false)
assert.equal(zeroSrc.includes('resolveBibleQuery'), false)
assert.equal(zeroSrc.includes('anyFailed && ranked.length'), false)
assert.match(zeroSrc, /searchBible\(/)

const verses = dedupeResults([
  {
    sourceType: 'bible-verse',
    sourceId: 'bible-verse:jn-3-16-en',
    title: 'John 3:16',
    titleAmharic: '',
    description: 'English',
    route: '/bible/john/3',
    imagePath: null,
    score: 0.01,
    matchKind: 'exact',
    typeLabel: 'Bible verse',
  },
  {
    sourceType: 'bible-verse',
    sourceId: 'bible-verse:jn-3-16-am',
    title: 'John 3:16',
    titleAmharic: 'ዮሐንስ 3:16',
    description: 'Amharic',
    route: '/bible/john/3',
    imagePath: null,
    score: 0.01,
    matchKind: 'exact',
    typeLabel: 'Bible verse',
  },
])
assert.equal(verses.length, 2)

const repeated = dedupeResults([
  {
    sourceType: 'mezmur',
    sourceId: 'm1',
    title: 'Meskel Abeba',
    titleAmharic: '',
    description: 'Mezmur',
    route: '/practice/mezmur/meskel-abeba',
    imagePath: null,
    score: 0.05,
    matchKind: 'fuzzy',
    typeLabel: 'Mezmur',
  },
  {
    sourceType: 'mezmur',
    sourceId: 'm1-copy',
    title: 'Meskel Abeba',
    titleAmharic: '',
    description: 'Mezmur',
    route: '/practice/mezmur/meskel-abeba',
    imagePath: null,
    score: 0.05,
    matchKind: 'fuzzy',
    typeLabel: 'Mezmur',
  },
])
assert.equal(repeated.length, 1)

const hiddenFailure = siteSearchFlags(
  reportSiteSources([
    { name: 'hymns', failed: true, count: 3 },
    { name: 'prayers', failed: false, count: 0 },
  ]),
  0,
)
assert.equal(hiddenFailure.partial, true)
assert.equal(hiddenFailure.failed, false)
assert.equal(hiddenFailure.zeroResults, true)

const totalFailure = siteSearchFlags(
  reportSiteSources([
    { name: 'hymns', failed: true, count: 4 },
    { name: 'bible', failed: true, count: 2 },
  ]),
  0,
)
assert.equal(totalFailure.partial, true)
assert.equal(totalFailure.failed, true)
assert.equal(totalFailure.zeroResults, false)
assert.equal(reportSiteSources([{ name: 'hymns', failed: true, count: 4 }])[0].count, 0)

const editorial = editorialSearchResults('saints', [
  {
    id: 'draft-1',
    slug: 'secret-draft',
    title: 'Draft saint',
    status: 'draft',
  },
  {
    id: 'pub-1',
    slug: 'st-michael',
    title: 'Saint Michael',
    title_amharic: 'ቅዱስ ሚካኤል',
    description: 'Published commemoration',
    status: 'published',
  },
  {
    id: 'bad',
    slug: '../admin',
    title: 'Bad slug',
    status: 'published',
  },
])
assert.equal(editorial.length, 1)
assert.equal(editorial[0].route, '/content/saints/st-michael')
assert.equal(editorial[0].sourceType, 'saint')
assert.equal(isNavigationResult(editorial[0]), false)
assert.equal(isNavigationResult({ sourceType: 'page', matchKind: 'alias' }), true)

console.log('search-site pure checks: ok')
