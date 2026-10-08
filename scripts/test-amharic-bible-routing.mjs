/**
 * Amharic Bible routing must beat hymn search.
 * Run: npx tsx --env-file-if-exists=.env.local scripts/test-amharic-bible-routing.mjs
 */
import assert from 'node:assert/strict'
import { looksLikeAmharicBibleReference } from '../src/lib/searchBuddy/amharicStructuredSearch.ts'
import { searchBuddyApiReady } from '../src/lib/searchBuddy/sendSearchBuddyMessage.ts'

const bibleTranscript =
  '\u12E8\u12EE\u1200\u1295\u1235 \u12CB\u1295\u130C\u120D \u121D\u12D5\u122B\u134D \u1201\u1208\u1275 \u1241\u1325\u122D \u1236\u1235\u1275'

assert.equal(looksLikeAmharicBibleReference(bibleTranscript), true)
assert.equal(looksLikeAmharicBibleReference('\u121D\u12D5\u122B\u134D \u12A0\u1295\u12F5'), true)
assert.equal(looksLikeAmharicBibleReference('\u12C8\u1295\u130C\u120D'), true)
assert.equal(looksLikeAmharicBibleReference('\u1218\u12DD\u1219\u122D \u12A0\u1265\u1230\u122B'), false)

console.log('looksLikeAmharicBibleReference: ok')

if (!searchBuddyApiReady()) {
  console.log('test-amharic-bible-routing: skipped live API')
  process.exit(0)
}

const { sendSearchBuddyMessage } = await import(
  '../src/lib/searchBuddy/sendSearchBuddyMessage.ts'
)
const { resolveBibleDetailPath } = await import('../src/lib/search/bibleRoute.ts')

const { response, empty } = await sendSearchBuddyMessage(bibleTranscript)
assert.notEqual(response.type, 'hymn_search', 'must not return hymn_search for Bible ASR')
assert.equal(response.type, 'bible_reference')
assert.equal(empty, false)
if (response.type === 'bible_reference') {
  assert.equal(response.reference, 'John 2:3')
  assert.equal(response.chapter, 2)
  assert.equal(response.verse, 3)
  const route = resolveBibleDetailPath(response)
  assert.equal(route?.split('#')[0], '/bible/john/2')
  assert.ok(Array.isArray(response.verses) && response.verses.length >= 1)
}

console.log(
  JSON.stringify({
    type: response.type,
    reference: response.type === 'bible_reference' ? response.reference : null,
    route:
      response.type === 'bible_reference' || response.type === 'bible_chapter'
        ? resolveBibleDetailPath(response)
        : null,
  }),
)
console.log('test-amharic-bible-routing: ok')
