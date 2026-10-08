/**
 * Bible page typed/voice refs must use POST /api/chat (same as Search Buddy).
 * Run: npm run test:bible-page-chat-refs
 */
import assert from 'node:assert/strict'
import { looksLikeAmharicBibleReference } from '../src/lib/searchBuddy/amharicStructuredSearch.ts'
import { searchBuddyApiReady } from '../src/lib/searchBuddy/sendSearchBuddyMessage.ts'
import { resolveBibleDetailPath } from '../src/lib/search/bibleRoute.ts'

const CASES = [
  {
    raw: '\u12A6\u122A\u1275 \u12D8\u134D\u1325\u1228\u1275 \u121D\u12D5\u122B\u134D \u1201\u1208\u1275 \u1241\u1325\u122D \u12A0\u1295\u12F5',
    reference: 'Genesis 2:1',
    routePrefix: '/bible/genesis/2',
  },
  {
    raw: '\u12E8\u12EE\u1200\u1295\u1235 \u12CB\u1295\u130C\u120D \u121D\u12D5\u122B\u134D \u1201\u1208\u1275 \u1241\u1325\u122D \u1236\u1235\u1275',
    reference: 'John 2:3',
    routePrefix: '/bible/john/2',
  },
  {
    raw: '\u12EE\u1210\u1295\u1235 3\u136516',
    reference: 'John 3:16',
    routePrefix: '/bible/john/3',
  },
]

for (const c of CASES) {
  assert.equal(
    looksLikeAmharicBibleReference(c.raw),
    true,
    `bible-like signal for ${c.reference}`,
  )
}
console.log('looksLikeAmharicBibleReference: ok')

if (!searchBuddyApiReady()) {
  console.log('test-bible-page-chat-refs: skipped live API')
  process.exit(0)
}

const { searchBibleShared, resolveSharedBibleDestination } = await import(
  '../src/lib/search/sharedBibleSearch.ts'
)
const { sendSearchBuddyMessage } = await import(
  '../src/lib/searchBuddy/sendSearchBuddyMessage.ts'
)

for (const c of CASES) {
  const buddy = await sendSearchBuddyMessage(c.raw)
  assert.equal(buddy.response.type, 'bible_reference', `buddy type for ${c.reference}`)
  assert.equal(
    buddy.response.type === 'bible_reference' ? buddy.response.reference : null,
    c.reference,
  )

  const page = await searchBibleShared(c.raw, { language: 'am', textLimit: 8 })
  assert.equal(page.source, 'buddy-api', `page source for ${c.reference}`)
  assert.equal(page.structured?.type, 'bible_reference', `page structured for ${c.reference}`)
  assert.equal(page.empty, false)
  assert.equal(page.directReference, true)
  assert.notEqual(page.structured?.type, 'hymn_search')
  if (page.structured?.type === 'bible_reference') {
    assert.equal(page.structured.reference, c.reference)
    const route = resolveSharedBibleDestination(page)
    assert.ok(route?.startsWith(c.routePrefix), `route ${route} vs ${c.routePrefix}`)
    assert.equal(resolveBibleDetailPath(page.structured)?.split('#')[0], c.routePrefix)
  }

  // Typed and "voice" (same raw string) must match.
  const again = await searchBibleShared(c.raw, { language: 'am', textLimit: 8 })
  assert.equal(again.structured?.type, page.structured?.type)
  if (again.structured?.type === 'bible_reference' && page.structured?.type === 'bible_reference') {
    assert.equal(again.structured.reference, page.structured.reference)
  }

  console.log(
    JSON.stringify({
      raw: c.raw,
      reference: c.reference,
      route: resolveSharedBibleDestination(page),
      source: page.source,
    }),
  )
}

console.log('test-bible-page-chat-refs: ok')
