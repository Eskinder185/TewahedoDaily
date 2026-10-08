/**
 * Search Buddy Amharic routing regression.
 * Run: npm run test:search-buddy-routing
 */
import assert from 'node:assert/strict'
import {
  looksLikeAmharicBibleReference,
  explicitlyAsksForHymns,
  isConfidentHymnTitleMatch,
} from '../src/lib/searchBuddy/amharicStructuredSearch.ts'
import {
  isMezmurHymnContextPath,
  searchBuddyApiReady,
  sendSearchBuddyMessage,
} from '../src/lib/searchBuddy/sendSearchBuddyMessage.ts'

const JOHN_ASR =
  '\u12E8\u12EE\u1200\u1295\u1235 \u12CB\u1295\u130C\u120D \u121D\u12D5\u122B\u134D \u1201\u1208\u1275 \u1241\u1325\u122D \u1236\u1235\u1275'
const GENESIS =
  '\u12A6\u122A\u1275 \u12D8\u134D\u1325\u1228\u1275 \u121D\u12D5\u122B\u134D \u1201\u1208\u1275 \u1241\u1325\u122D \u12A0\u1295\u12F5'
const HYMN_TITLE = '\u12E8\u1235\u1219 \u1275\u122D\u1313\u121C'
const HYMN_LYRIC =
  '\u12E8\u1218\u120B\u12D5\u12AD\u1275 \u12A0\u1208\u1243 \u1245\u12F1\u1235 \u121A\u12AB\u12A4\u120D'

assert.equal(looksLikeAmharicBibleReference(JOHN_ASR), true)
assert.equal(looksLikeAmharicBibleReference(GENESIS), true)
assert.equal(looksLikeAmharicBibleReference(HYMN_TITLE), false)
assert.equal(looksLikeAmharicBibleReference(HYMN_LYRIC), false)
assert.equal(explicitlyAsksForHymns(HYMN_TITLE), false)
assert.equal(isMezmurHymnContextPath('/practice'), true)
assert.equal(isMezmurHymnContextPath('/practice/mezmur/x'), true)
assert.equal(isMezmurHymnContextPath('/bible/john/3'), false)
assert.equal(
  isConfidentHymnTitleMatch(HYMN_TITLE, {
    title_amharic: HYMN_TITLE,
    slug: 'yesimu-tirguame',
  }),
  true,
)
console.log('routing heuristics: ok')

if (!searchBuddyApiReady()) {
  console.log('test-search-buddy-routing: skipped live API')
  process.exit(0)
}

async function route(q, opts = {}) {
  let last
  for (let i = 0; i < 3; i += 1) {
    try {
      const { response, empty } = await sendSearchBuddyMessage(q, opts)
      return { type: response.type, empty, response }
    } catch (error) {
      last = error
      if (error?.code === 'unavailable' || error?.code === 'timeout') {
        await new Promise((r) => setTimeout(r, 400 * (i + 1)))
        continue
      }
      throw error
    }
  }
  throw last
}

// a) noisy John ASR → Bible only
const a = await route(JOHN_ASR)
assert.equal(a.type, 'bible_reference')
assert.equal(a.response.reference, 'John 2:3')
assert.notEqual(a.type, 'hymn_search')
console.log(JSON.stringify({ case: 'a-john', type: a.type, ref: a.response.reference }))

// b) spoken Genesis → Bible only
const b = await route(GENESIS)
assert.equal(b.type, 'bible_reference')
assert.equal(b.response.reference, 'Genesis 2:1')
assert.notEqual(b.type, 'hymn_search')
console.log(JSON.stringify({ case: 'b-genesis', type: b.type, ref: b.response.reference }))

// c) exact hymn title → hymn (Search Buddy, confident title)
const c = await route(HYMN_TITLE)
assert.equal(c.type, 'hymn_search')
assert.ok(Array.isArray(c.response.results) && c.response.results.length >= 1)
assert.ok(
  (c.response.results[0].title_amharic || '').includes('\u1313') ||
    (c.response.results[0].slug || '').includes('tirguame'),
)
console.log(
  JSON.stringify({
    case: 'c-title',
    type: c.type,
    slug: c.response.results[0].slug,
  }),
)

// d) lyric → hymn only in Mezmur context; not as generic Search Buddy fallback
const dBuddy = await route(HYMN_LYRIC)
assert.notEqual(dBuddy.type, 'hymn_search', 'lyric must not win hymn_search outside Mezmur')
assert.notEqual(dBuddy.type, 'bible_search', 'lyric must not win bible_search outside Mezmur')
assert.notEqual(dBuddy.type, 'bible_reference')
const dMezmur = await route(HYMN_LYRIC, { hymnContext: true })
assert.equal(dMezmur.type, 'hymn_search')
assert.ok(dMezmur.response.results.length >= 1)
console.log(
  JSON.stringify({
    case: 'd-lyric',
    buddyType: dBuddy.type,
    mezmurType: dMezmur.type,
    mezmurCount: dMezmur.response.results.length,
    first: dMezmur.response.results[0].slug,
  }),
)

// Voice/typed parity for Bible
const typed = await route(JOHN_ASR)
const voice = await route(JOHN_ASR)
assert.equal(typed.type, voice.type)
assert.equal(typed.response.reference, voice.response.reference)

console.log('test-search-buddy-routing: ok')
