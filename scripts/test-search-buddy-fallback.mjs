/**
 * Search Buddy fallback / empty / error / concurrency regressions.
 * Run: npm run test:search-buddy-fallback
 */
import assert from 'node:assert/strict'
import { AI_TIMEOUTS_MS } from '../src/lib/ai/aiConfig.ts'
import { mapHttpStatusToAiError } from '../src/lib/ai/aiErrors.ts'
import { AiClientError } from '../src/lib/ai/aiTypes.ts'
import { assistantLeadForResponse } from '../src/lib/search/assistantLead.ts'
import { detectCalendarRoute } from '../src/lib/searchBuddy/calendarStructuredSearch.ts'
import {
  isSearchBuddyRequestCurrent,
  searchBuddyErrorMessage,
} from '../src/lib/searchBuddy/errorMessages.ts'
import {
  isEmptySearchBuddyResponse,
  parseSearchBuddyResponse,
} from '../src/lib/searchBuddy/parseSearchBuddyResponse.ts'

const INCARNATION =
  'Explain the Mystery of the Incarnation, the Trinity, Theotokos, and salvation.'
const LONG =
  'In Ethiopian Orthodoxy, explain the Mystery of the Incarnation, the Holy Trinity, the Theotokos, and how salvation is understood through the life of the Church.'

assert.ok(AI_TIMEOUTS_MS.chat >= 90_000, 'chat timeout must allow cold-start')
assert.ok(AI_TIMEOUTS_MS.chat <= 180_000, 'chat timeout must not be indefinite')

assert.equal(detectCalendarRoute(INCARNATION), null)
assert.equal(detectCalendarRoute(LONG), null)
assert.equal(detectCalendarRoute('Hello'), null)
assert.equal(detectCalendarRoute('John 3:16'), null)
assert.equal(detectCalendarRoute("What is today's fasting information?")?.kind, 'calendar_today')
assert.equal(detectCalendarRoute('Find the feast of Meskel')?.kind, 'calendar_search')
assert.equal(
  detectCalendarRoute('Tell me about the feast of Timkat and its theological meaning'),
  null,
)

const ai = parseSearchBuddyResponse({
  type: 'ai',
  answer: 'The Incarnation unites divinity and humanity without confusion.',
})
assert.equal(ai.type, 'ai')
assert.equal(isEmptySearchBuddyResponse(ai), false)
assert.equal(assistantLeadForResponse(ai, false), '')
assert.equal(
  assistantLeadForResponse(ai, true),
  '',
  'nonempty AI must not show no-match lead even if empty flag is wrong',
)

const upper = parseSearchBuddyResponse({
  type: 'AI',
  answer: 'Cased type still works.',
})
assert.equal(upper.type, 'ai')
assert.equal(isEmptySearchBuddyResponse(upper), false)

const viaContent = parseSearchBuddyResponse({
  type: 'ai',
  content: 'Answer carried in content field for theology.',
})
assert.equal(viaContent.type, 'ai')
assert.equal(isEmptySearchBuddyResponse(viaContent), false)

const nested = parseSearchBuddyResponse({
  data: { type: 'ai', answer: 'Nested AI payload answer body.' },
})
assert.equal(nested.type, 'ai')
assert.equal(isEmptySearchBuddyResponse(nested), false)

const malformed = parseSearchBuddyResponse(null)
assert.equal(malformed.type, 'unknown')

const emptyAi = parseSearchBuddyResponse({ type: 'ai', answer: '   ' })
assert.equal(isEmptySearchBuddyResponse(emptyAi), true)
assert.equal(
  assistantLeadForResponse(emptyAi, true),
  "I couldn't find a matching result yet.",
)

const unknownEmpty = parseSearchBuddyResponse({
  type: 'unknown',
  message: "I couldn't find a matching result yet.",
})
assert.equal(unknownEmpty.type, 'unknown')
assert.match(
  assistantLeadForResponse(unknownEmpty, true),
  /couldn't find/i,
)

const rate = mapHttpStatusToAiError(429)
assert.equal(rate.code, 'rate_limited')
assert.match(searchBuddyErrorMessage(rate), /try again/i)
assert.ok(
  !/couldn't find a matching result/i.test(searchBuddyErrorMessage(rate)),
  '429 must not look like empty search',
)

const unavailable = mapHttpStatusToAiError(503)
assert.equal(unavailable.code, 'unavailable')
assert.match(searchBuddyErrorMessage(unavailable), /unavailable|try again/i)
assert.ok(
  !/couldn't find a matching result/i.test(searchBuddyErrorMessage(unavailable)),
  '503 must not look like empty search',
)

const timeout = mapHttpStatusToAiError(408)
assert.equal(timeout.code, 'timeout')
assert.match(searchBuddyErrorMessage(timeout), /too long|try again/i)

const network = new AiClientError('network', 'Network unavailable.')
assert.match(searchBuddyErrorMessage(network), /reach|network|offline/i)

assert.equal(isSearchBuddyRequestCurrent(1, 1), true)
assert.equal(isSearchBuddyRequestCurrent(1, 2), false)
assert.equal(isSearchBuddyRequestCurrent(3, 3), true)

console.log('test-search-buddy-fallback: ok')
