/**
 * Calendar detectors, plus Search Buddy's explicit teaching-topic map.
 * Document search runs only for mapped church-teaching questions.
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
  SEVEN_SACRAMENTS_PARAGRAPH_ID,
  SEVEN_SACRAMENTS_TEXT,
  matchTeachingTopic,
  selectFaithAndOrderPassage,
  shouldSearchFaithAndOrder,
} from '../src/lib/searchBuddy/teachingTopics.ts'
import { parseQuestion } from '../src/lib/searchBuddy/questionParse.ts'
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
assert.equal(searchBuddySource.includes('resolveBibleQuery'), false)
assert.equal(searchBuddySource.includes('searchSite('), true)
assert.equal(searchBuddySource.includes('answerLanguage'), false)
assert.equal(searchBuddySource.includes('searchFaithAndOrder('), true)
assert.equal(searchBuddySource.includes('shouldSearchFaithAndOrder'), true)
assert.equal(searchBuddySource.includes('FaithAndOrderToc'), false)
assert.equal(searchBuddySource.includes('FaithAndOrderSectionReader'), false)
assert.equal(searchBuddySource.includes('FaithAndOrderSearchPane'), false)
assert.equal(searchBuddySource.includes('sourceFilters'), false)
assert.equal(searchBuddySource.includes('ChatStarterPrompts'), true)

assert.equal(shouldSearchFaithAndOrder('How many sacraments are there?')?.id, 'seven-sacraments')
assert.equal(shouldSearchFaithAndOrder('seven sacraments')?.id, 'seven-sacraments')
assert.equal(shouldSearchFaithAndOrder('ሰባቱ ምሥጢራት ስንት ናቸው?')?.id, 'seven-sacraments')
assert.equal(matchTeachingTopic('infant baptism')?.id, 'infant-baptism')
const mysteryTopicCases = [
  ['sacrament.baptism', 'sacrament of baptism', 'ምሥጢረ ጥምቀት'],
  ['sacrament.myron', 'Holy Myron', 'ምሥጢረ ሜሮን'],
  ['sacrament.communion', 'Eucharist', 'ምሥጢረ ቁርባን'],
  ['sacrament.penance', 'Confession', 'ምሥጢረ ንስሓ'],
  ['sacrament.anointing', 'Holy Unction', 'ምሥጢረ ቀንዲል'],
  ['sacrament.matrimony', 'Marriage', 'ምሥጢረ ተክሊል'],
  ['sacrament.orders', 'Priesthood', 'ምሥጢረ ክህነት'],
  ['pillar.trinity', 'Mystery of the Trinity', 'ምሥጢረ ሥላሴ'],
  ['pillar.incarnation', 'Mystery of the Incarnation', 'ምሥጢረ ሥጋዌ'],
  ['pillar.baptism', 'five pillars mystery of baptism', 'አምስቱ አዕማደ ምሥጢር ምሥጢረ ጥምቀት'],
  ['pillar.communion', 'five pillars mystery of the Holy Communion', 'አምስቱ አዕማደ ምሥጢር ምሥጢረ ቁርባን'],
  ['pillar.resurrection', 'Mystery of the Resurrection of the Dead', 'ምሥጢረ ትንሣኤ ሙታን'],
]
for (const [id, english, amharic] of mysteryTopicCases) {
  assert.equal(matchTeachingTopic(english)?.id, id, english)
  assert.equal(matchTeachingTopic(amharic)?.id, id, amharic)
}
assert.equal(matchTeachingTopic('five mysteries')?.id, 'five-pillars')
assert.equal(matchTeachingTopic('አምስቱ አእማደ ምስጢር')?.id, 'five-pillars')
assert.equal(matchTeachingTopic('seven sacraments baptism')?.id, 'sacrament.baptism')
assert.equal(matchTeachingTopic('five pillars baptism')?.id, 'pillar.baptism')
assert.equal(matchTeachingTopic('ጥምቃት')?.id, 'baptism')
assert.equal(matchTeachingTopic('ምስጢረ ቃንዴል')?.id, 'sacrament.anointing')
assert.equal(matchTeachingTopic('ሚስትራ ቁርባን')?.id, 'sacrament.communion')
assert.equal(matchTeachingTopic('ምሥጢረ ንስሐ')?.id, 'sacrament.penance')
assert.equal(shouldSearchFaithAndOrder('Open Calendar'), null)
assert.equal(parseQuestion("When is Saint Michael's feast?").domain, 'calendar')
assert.equal(parseQuestion('Find hymns about Saint Michael').domain, 'hymn')
assert.equal(parseQuestion('Who is Saint Michael?').domain, 'website')
assert.equal(parseQuestion('Open Calendar').domain, 'navigation')
assert.equal(parseQuestion('What are the Five Mysteries?').domain, 'teaching')
assert.equal(shouldSearchFaithAndOrder("When is Saint Michael's feast?"), null)
assert.equal(shouldSearchFaithAndOrder('Show me a Gena hymn'), null)
assert.equal(shouldSearchFaithAndOrder('Find a Zemari'), null)
assert.equal(shouldSearchFaithAndOrder('John 3:16'), null)
assert.equal(shouldSearchFaithAndOrder('quantum blockchain pizza'), null)
assert.equal(shouldSearchFaithAndOrder('zzzz-unrelated-topic'), null)

const sacramentHit = {
  id: SEVEN_SACRAMENTS_PARAGRAPH_ID,
  paragraph_number: 165,
  section_id: 's000152',
  section_title: 'Introduction to Church Sacraments',
  is_heading: false,
  text: SEVEN_SACRAMENTS_TEXT,
  source_id: 'faith-and-order',
  version: 'a'.repeat(64),
  language: 'en',
  citation: 'paragraph 165',
  paragraph_path: '/p',
  section_path: '/s',
  context_before: [],
  context_after: [],
}
const otherHit = { ...sacramentHit, id: 'p000001', paragraph_number: 1, text: 'An unrelated heading.' }
const topic = shouldSearchFaithAndOrder('seven sacraments')
const validated = selectFaithAndOrderPassage(topic, {
  type: 'document_search',
  mode: 'exact_document_search',
  generated: false,
  query: 'seven sacraments',
  source: { title: 'The Faith And Order Of The Church' },
  status: 'matches',
  count: 2,
  results: [otherHit, sacramentHit],
})
assert.equal(validated.kind, 'validated')
assert.equal(validated.kind === 'validated' ? validated.hit.text : '', SEVEN_SACRAMENTS_TEXT)
assert.equal(validated.kind === 'validated' ? validated.hit.text.includes('Burial') : true, false)

const rejectedTopHit = selectFaithAndOrderPassage(topic, {
  type: 'document_search',
  mode: 'exact_document_search',
  generated: false,
  query: 'seven sacraments',
  source: { title: 'The Faith And Order Of The Church' },
  status: 'matches',
  count: 1,
  results: [otherHit],
})
assert.equal(rejectedTopHit.kind, 'none')

console.log('theology routing heuristics: ok')
console.log('test-search-buddy-theology-routing: document search coverage continues in test-faith-and-order-search')
