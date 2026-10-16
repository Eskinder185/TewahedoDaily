/**
 * Search Buddy routing: theology must reach /api/chat; structured intents stay structured.
 * Run: npm run test:search-buddy-theology-routing
 */
import assert from 'node:assert/strict'
import {
  detectCalendarRoute,
  isExplanatoryTheologyQuery,
} from '../src/lib/searchBuddy/calendarStructuredSearch.ts'
import { shouldUseAmharicStructuredPath } from '../src/lib/searchBuddy/amharicStructuredSearch.ts'
import {
  isEmptySearchBuddyResponse,
  parseSearchBuddyResponse,
} from '../src/lib/searchBuddy/parseSearchBuddyResponse.ts'
import { assistantLeadForResponse } from '../src/lib/search/assistantLead.ts'
import {
  searchBuddyApiReady,
  sendSearchBuddyMessage,
} from '../src/lib/searchBuddy/sendSearchBuddyMessage.ts'

const INCARNATION =
  'Explain the Mystery of the Incarnation, the Trinity, Theotokos, and salvation.'
const THEOTOKOS = 'Why is Mary called Theotokos?'
const TIMKAT_THEOLOGY = 'Explain the theological significance of Timkat'
const TIMKAT_FEAST_THEOLOGY =
  'Tell me about the feast of Timkat and its theological meaning'
const HUDADI_WHY = 'Why do we fast during Hudadi?'
const AM_MYSTERY = '\u12E8\u1235\u130B \u121D\u1235\u1322\u122D \u121D\u1295\u12F5\u1290\u12CD?'
// Equivalent Amharic: Why is Mary called Theotokos? / Timkat theological significance
const AM_THEOTOKOS =
  '\u121B\u122D\u12EB\u121D \u12A5\u121D\u120D\u12D5\u1275 \u12A0\u121B\u120D\u12A0\u12AD \u12E8\u1270\u1260\u1208\u127D \u1290\u12CD?'
const AM_TIMKAT =
  '\u12E8\u1325\u121D\u1240\u1275 \u12E8\u1235\u130B \u121D\u1235\u1322\u122D \u121D\u1295\u12F5\u1290\u12CD?'
const MESKEL = 'Find the feast of Meskel'
const UNKNOWN_FEAST = 'Find the feast of Zarqublax Observance'
const JOHN = 'John 3:16'
const ETH_DATE = "What is today's Ethiopian date?"
const FAST_TODAY = "What is today's fasting information?"
const HELLO = 'Hello'
const HI_AM = '\u1230\u120B\u121D' // ሰላም

// --- Heuristics (no network) ---
assert.equal(detectCalendarRoute(HELLO), null, 'greeting must not hit calendar')
assert.equal(detectCalendarRoute(HI_AM), null, 'Amharic greeting must not hit calendar')
assert.equal(detectCalendarRoute(INCARNATION), null, 'Incarnation must not hit calendar')
assert.equal(detectCalendarRoute(THEOTOKOS), null, 'Theotokos must not hit calendar')
assert.equal(detectCalendarRoute(TIMKAT_THEOLOGY), null, 'Timkat theology must not hit calendar')
assert.equal(
  detectCalendarRoute(TIMKAT_FEAST_THEOLOGY),
  null,
  'feast+theology must not use calendar_search',
)
assert.equal(detectCalendarRoute(HUDADI_WHY), null, 'why+fast theology must not use calendar_search')
assert.equal(detectCalendarRoute(AM_MYSTERY), null, 'Amharic mystery must not hit calendar')
assert.equal(detectCalendarRoute(AM_THEOTOKOS), null, 'Amharic Theotokos must not hit calendar')
assert.equal(detectCalendarRoute(AM_TIMKAT), null, 'Amharic Timkat theology must not hit calendar')
assert.equal(detectCalendarRoute(JOHN), null, 'John 3:16 is not calendar')
// Mystery/Timkat theology skips Amharic keyword path; other Ethiopic Q&A may enter
// it but must fall through to /api/chat before Synaxarium keyword hits.
assert.equal(isExplanatoryTheologyQuery(AM_TIMKAT), true)
assert.equal(shouldUseAmharicStructuredPath(AM_TIMKAT), false)
assert.equal(
  shouldUseAmharicStructuredPath(
    'What are the Five Mysteries (\u12A0\u121D\u1235\u1271 \u121D\u1225\u1322\u122B\u1275)?',
  ),
  false,
)
assert.equal(isExplanatoryTheologyQuery('What are the Five Mysteries?'), true)
assert.equal(isExplanatoryTheologyQuery('mysteries'), true)

const meskelRoute = detectCalendarRoute(MESKEL)
assert.equal(meskelRoute?.kind, 'calendar_search', 'Meskel feast lookup stays calendar_search')
assert.equal(
  meskelRoute?.kind === 'calendar_search' ? meskelRoute.query : null,
  'Meskel',
  'Meskel query strips find/feast filler',
)

const dateRoute = detectCalendarRoute(ETH_DATE)
assert.equal(dateRoute?.kind, 'calendar_today', 'Ethiopian date today → calendar_today')

const fastRoute = detectCalendarRoute(FAST_TODAY)
assert.equal(fastRoute?.kind, 'calendar_today', 'fasting today → calendar_today')
assert.equal(fastRoute?.focus, 'fasting')

assert.equal(isExplanatoryTheologyQuery(AM_MYSTERY), true)
assert.equal(shouldUseAmharicStructuredPath(AM_MYSTERY), false)
// Non-theology Ethiopic still uses Amharic structured path.
assert.equal(shouldUseAmharicStructuredPath('\u12E8\u12DB\u122C \u1235\u1295\u12AD\u1233\u122D'), true)

// type:ai with answer must never be empty
const aiParsed = parseSearchBuddyResponse({
  type: 'ai',
  answer: 'The Incarnation unites divinity and humanity without confusion.',
})
assert.equal(aiParsed.type, 'ai')
assert.equal(isEmptySearchBuddyResponse(aiParsed), false)
assert.equal(assistantLeadForResponse(aiParsed, false), '')

const aiEmptyAnswer = parseSearchBuddyResponse({ type: 'ai', answer: '   ' })
assert.equal(isEmptySearchBuddyResponse(aiEmptyAnswer), true)

// Nonempty AI must never surface the no-match lead, even with a bad empty flag.
assert.equal(assistantLeadForResponse(aiParsed, true), '')
const upperAi = parseSearchBuddyResponse({
  type: 'AI',
  answer: 'Case-normalized AI answer for theology.',
})
assert.equal(upperAi.type, 'ai')
assert.equal(isEmptySearchBuddyResponse(upperAi), false)

console.log('theology routing heuristics: ok')

if (!searchBuddyApiReady()) {
  console.log('test-search-buddy-theology-routing: skipped live API')
  process.exit(0)
}

async function route(q) {
  let last
  for (let i = 0; i < 6; i += 1) {
    try {
      return await sendSearchBuddyMessage(q)
    } catch (error) {
      last = error
      if (
        error?.code === 'unavailable' ||
        error?.code === 'timeout' ||
        error?.code === 'rate_limited'
      ) {
        await new Promise((r) => setTimeout(r, 1200 * (i + 1)))
        continue
      }
      throw error
    }
  }
  throw last
}

function assertAi(result, label) {
  assert.equal(result.response.type, 'ai', `${label}: expected type ai, got ${result.response.type}`)
  assert.equal(result.empty, false, `${label}: must not be empty`)
  const answer = String(result.response.answer || '').trim()
  assert.ok(answer.length > 20, `${label}: nonempty answer`)
  const lead = assistantLeadForResponse(result.response, result.empty)
  assert.notEqual(lead, "I couldn't find a matching result yet.", `${label}: not unknown lead`)
}

/** Theology must not die as empty unknown; /api/chat may still return verified structured rows. */
function assertTheologyReachable(result, label) {
  assert.notEqual(result.response.type, 'unknown', `${label}: must not be unknown`)
  assert.equal(result.empty, false, `${label}: must not be empty`)
  const lead = assistantLeadForResponse(result.response, result.empty)
  assert.notEqual(lead, "I couldn't find a matching result yet.", `${label}: not unknown lead`)
  if (result.response.type === 'ai') {
    assert.ok(String(result.response.answer || '').trim().length > 20, `${label}: ai answer`)
    return
  }
  const results = Array.isArray(result.response.results) ? result.response.results : []
  assert.ok(results.length > 0, `${label}: structured hit has results`)
}

const hello = await route(HELLO)
assert.equal(hello.response.type, 'ai', `greeting: expected ai, got ${hello.response.type}`)
assert.equal(hello.empty, false, 'greeting must not be empty')
assert.ok(String(hello.response.answer || '').trim().length > 0, 'greeting has answer')
console.log(JSON.stringify({ case: 'greeting', type: hello.response.type }))

const hiAm = await route(HI_AM)
assert.equal(hiAm.response.type, 'ai', `amharic-greeting: expected ai, got ${hiAm.response.type}`)
assert.equal(hiAm.empty, false, 'amharic-greeting must not be empty')
assert.ok(String(hiAm.response.answer || '').trim().length > 0, 'amharic-greeting has answer')
console.log(JSON.stringify({ case: 'amharic-greeting', type: hiAm.response.type }))

const incarnation = await route(INCARNATION)
assertAi(incarnation, 'incarnation')
console.log(JSON.stringify({ case: 'incarnation', type: incarnation.response.type }))

const theotokos = await route(THEOTOKOS)
assertAi(theotokos, 'theotokos')
console.log(JSON.stringify({ case: 'theotokos', type: theotokos.response.type }))

const timkat = await route(TIMKAT_THEOLOGY)
assertAi(timkat, 'timkat-theology')
console.log(JSON.stringify({ case: 'timkat-theology', type: timkat.response.type }))

const timkatFeast = await route(TIMKAT_FEAST_THEOLOGY)
assertTheologyReachable(timkatFeast, 'timkat-feast-theology')
console.log(JSON.stringify({ case: 'timkat-feast-theology', type: timkatFeast.response.type }))

const hudadi = await route(HUDADI_WHY)
assertTheologyReachable(hudadi, 'hudadi-why-fast')
console.log(JSON.stringify({ case: 'hudadi-why-fast', type: hudadi.response.type }))

const amMystery = await route(AM_MYSTERY)
assertTheologyReachable(amMystery, 'amharic-mystery')
console.log(JSON.stringify({ case: 'amharic-mystery', type: amMystery.response.type }))

const amTheotokos = await route(AM_THEOTOKOS)
assertTheologyReachable(amTheotokos, 'amharic-theotokos')
console.log(JSON.stringify({ case: 'amharic-theotokos', type: amTheotokos.response.type }))

const amTimkat = await route(AM_TIMKAT)
assertTheologyReachable(amTimkat, 'amharic-timkat')
console.log(JSON.stringify({ case: 'amharic-timkat', type: amTimkat.response.type }))

const john = await route(JOHN)
assert.ok(
  john.response.type === 'bible_reference' || john.response.type === 'bible_chapter',
  `John 3:16 got ${john.response.type}`,
)
assert.equal(john.empty, false)
console.log(JSON.stringify({ case: 'john', type: john.response.type }))

const ethDate = await route(ETH_DATE)
assert.ok(
  ['calendar_today', 'calendar_day', 'ethiopian_date_today'].includes(ethDate.response.type),
  `eth date got ${ethDate.response.type}`,
)
console.log(JSON.stringify({ case: 'eth-date', type: ethDate.response.type }))

const fastToday = await route(FAST_TODAY)
assert.ok(
  ['fasting_today', 'calendar_today', 'fast_today', 'calendar_fast'].includes(
    fastToday.response.type,
  ),
  `fast today got ${fastToday.response.type}`,
)
console.log(JSON.stringify({ case: 'fast-today', type: fastToday.response.type }))

const meskel = await route(MESKEL)
assert.ok(
  meskel.response.type === 'calendar_search' || meskel.response.type === 'calendar_day',
  `Meskel got ${meskel.response.type}`,
)
console.log(JSON.stringify({ case: 'meskel', type: meskel.response.type }))

const unknownFeast = await route(UNKNOWN_FEAST)
assert.equal(unknownFeast.response.type, 'unknown', 'unknown feast stays unknown (no AI fabrication)')
assert.ok(
  String(unknownFeast.response.message || assistantLeadForResponse(unknownFeast.response, unknownFeast.empty))
    .toLowerCase()
    .includes("couldn't find") ||
    unknownFeast.empty,
  'unknown feast communicates no-match',
)
console.log(JSON.stringify({ case: 'unknown-feast', type: unknownFeast.response.type }))

console.log('test-search-buddy-theology-routing: ok')
