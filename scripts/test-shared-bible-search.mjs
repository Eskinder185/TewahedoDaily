/**
 * Shared Bible search adapter — normalization + destination parity.
 * Run: npx tsx --env-file-if-exists=.env.local scripts/test-shared-bible-search.mjs
 */
import assert from 'node:assert/strict'
import {
  formatCanonicalBibleReference,
  normalizeSharedSearchQuery,
  prepareSearchBuddyMessage,
} from '../src/lib/search/normalizeSearchQuery.ts'
import { resolveBibleDetailPath } from '../src/lib/search/bibleRoute.ts'
import { searchBuddyApiReady } from '../src/lib/searchBuddy/sendSearchBuddyMessage.ts'

const cases = [
  ['John 3:16', 'John 3:16'],
  ['Open John 3:16', 'John 3:16'],
  ['  Open   John  3:16 !!! ', 'John 3:16'],
  ['Show me John chapter 3', 'John 3'],
  ['Genesis 1', 'Genesis 1'],
]

console.log('--- normalization parity ---')
for (const [raw, expected] of cases) {
  const prepared = prepareSearchBuddyMessage(raw)
  assert.equal(prepared, expected, `prepare(${JSON.stringify(raw)})`)
  assert.equal(
    prepareSearchBuddyMessage(prepared),
    expected,
    'prepare is idempotent',
  )
}

assert.equal(normalizeSharedSearchQuery('  love   '), 'love')
assert.equal(formatCanonicalBibleReference('Open John 3:16'), 'John 3:16')

console.log('normalization: ok')

if (!searchBuddyApiReady()) {
  console.log('test-shared-bible-search: skipped live API (no VITE_TEWAHEDO_AI_API_URL)')
  console.log('test-shared-bible-search: ok (pure)')
  process.exit(0)
}

const { searchBibleShared, resolveSharedBibleDestination } = await import(
  '../src/lib/search/sharedBibleSearch.ts'
)
const { sendSearchBuddyMessage } = await import(
  '../src/lib/searchBuddy/sendSearchBuddyMessage.ts'
)

async function buddyDestination(raw) {
  const { response, empty, normalizedMessage } = await sendSearchBuddyMessage(raw)
  assert.equal(normalizedMessage, prepareSearchBuddyMessage(raw))
  if (empty || !['bible_reference', 'bible_chapter', 'bible_search'].includes(response.type)) {
    return { normalizedMessage, route: null, type: response.type }
  }
  if (response.type === 'bible_search') {
    const first = Array.isArray(response.results) ? response.results[0] : null
    return {
      normalizedMessage,
      route: first ? resolveBibleDetailPath(first) : null,
      type: response.type,
    }
  }
  return {
    normalizedMessage,
    route: resolveBibleDetailPath(response),
    type: response.type,
  }
}

async function pageDestination(raw) {
  const result = await searchBibleShared(raw, { language: 'en', textLimit: 8 })
  return {
    normalizedQuery: result.normalizedQuery,
    route: resolveSharedBibleDestination(result),
    source: result.source,
    type: result.structured?.type ?? 'local',
  }
}

console.log('--- Search Buddy vs Bible page destinations ---')
const liveCases = [
  'John 3:16',
  'Open John 3:16',
  'Show me John chapter 3',
  'Genesis 1',
  'love',
]

for (const raw of liveCases) {
  const buddy = await buddyDestination(raw)
  const page = await pageDestination(raw)
  assert.equal(
    page.normalizedQuery,
    buddy.normalizedMessage,
    `normalized mismatch for ${raw}`,
  )
  // Equivalent inputs must share destination when both resolve a bible route.
  if (buddy.route && page.route) {
    // Compare path without relying on hash presence differences from local fallback.
    const strip = (r) => r.split('#')[0]
    assert.equal(
      strip(page.route),
      strip(buddy.route),
      `destination mismatch for ${raw}: page=${page.route} buddy=${buddy.route}`,
    )
  }
  console.log(
    JSON.stringify({
      raw,
      normalized: page.normalizedQuery,
      buddyType: buddy.type,
      pageSource: page.source,
      route: page.route || buddy.route,
    }),
  )
}

// Consecutive voice-like queries (punctuation / whitespace)
const a = await pageDestination('John 3:16...')
const b = await pageDestination('  John 3:16  ')
assert.equal(a.normalizedQuery, b.normalizedQuery)
assert.equal(a.route?.split('#')[0], b.route?.split('#')[0])

// Invalid / empty after normalize
const empty = await searchBibleShared('   ', { language: 'en' })
assert.equal(empty.empty, true)

console.log('test-shared-bible-search: ok')
