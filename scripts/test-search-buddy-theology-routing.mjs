/**
 * Calendar and theology detectors used by independent pages.
 * Search Buddy itself is exact Faith and Order search (see test-faith-and-order-search.mjs).
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
import fs from 'node:fs'

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
const JOHN = 'John 3:16'
const ETH_DATE = "What is today's Ethiopian date?"
const FAST_TODAY = "What is today's fasting information?"
const HELLO = 'Hello'
const HI_AM = '\u1230\u120B\u121D' // áˆ°áˆ‹áˆ

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
// Mystery/Timkat theology skips the Amharic keyword path. Search Buddy does not
// send those questions to a model; document search covers that surface.
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
assert.equal(dateRoute?.kind, 'calendar_today', 'Ethiopian date today â†’ calendar_today')

const fastRoute = detectCalendarRoute(FAST_TODAY)
assert.equal(fastRoute?.kind, 'calendar_today', 'fasting today â†’ calendar_today')
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

const searchBuddySource = fs.readFileSync(
  new URL('../src/components/search/SearchBuddy.tsx', import.meta.url),
  'utf8',
)
assert.equal(searchBuddySource.includes('/api/chat'), false)
assert.equal(searchBuddySource.includes('postAiChat'), false)
assert.equal(searchBuddySource.includes('sendSearchBuddyMessage'), false)
assert.equal(searchBuddySource.includes('searchSite('), false)
assert.equal(searchBuddySource.includes('answerLanguage'), false)

console.log('theology routing heuristics: ok')
console.log('test-search-buddy-theology-routing: document search coverage continues in test-faith-and-order-search')
