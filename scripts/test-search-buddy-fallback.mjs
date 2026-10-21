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
  buildChatRequestBody,
  isChatQuestionTooLong,
  selectChatHistory,
  CHAT_HISTORY_ITEM_MAX,
  CHAT_HISTORY_TOTAL_MAX,
  CHAT_MESSAGE_MAX,
} from '../src/lib/searchBuddy/chatContract.ts'
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

function turn(id, role, content, extra = {}) {
  return {
    id,
    role,
    text: content,
    ...(role === 'assistant' && extra.responseType === 'ai'
      ? { response: { type: 'ai', answer: content } }
      : {}),
    ...extra,
  }
}

const prior = [
  turn('u1', 'user', 'What is fasting?'),
  turn('a1', 'assistant', 'Fasting is a church practice.', { responseType: 'ai' }),
  turn('u2', 'user', 'x'.repeat(CHAT_HISTORY_ITEM_MAX + 1)),
  turn('a2', 'assistant', 'This turn is dropped with the overlong question.', { responseType: 'ai' }),
  turn('u3', 'user', 'Open the calendar'),
  turn('a3', 'assistant', 'Calendar', { responseType: 'navigation', response: { type: 'navigation' } }),
  turn('u4', 'user', 'Failed question', { status: 'error' }),
  turn('a4', 'assistant', 'Could not answer.', { status: 'error', failedQuery: 'Failed question' }),
]
const history = selectChatHistory(prior, { omitQuestion: 'What is the Trinity?' })
assert.deepEqual(history, [
  { role: 'user', content: 'What is fasting?' },
  { role: 'assistant', content: 'Fasting is a church practice.' },
  { role: 'user', content: 'Open the calendar' },
])
assert.ok(isChatQuestionTooLong('x'.repeat(CHAT_MESSAGE_MAX + 1)))
assert.equal(isChatQuestionTooLong('x'.repeat(CHAT_MESSAGE_MAX)), false)

const recent = []
for (let i = 0; i < 8; i += 1) {
  recent.push(turn(`user-${i}`, 'user', `${i}${'q'.repeat(1999)}`))
  recent.push(turn(`assistant-${i}`, 'assistant', `${i}${'a'.repeat(1999)}`, { responseType: 'ai' }))
}
const capped = selectChatHistory(recent)
assert.equal(capped.length, 8)
assert.ok(capped.reduce((sum, item) => sum + item.content.length, 0) <= CHAT_HISTORY_TOTAL_MAX)
assert.equal(capped[0].content.startsWith('4'), true)
assert.equal(capped.at(-1)?.content.startsWith('7'), true)

const many = []
for (let i = 0; i < 20; i += 1) {
  many.push(turn(`u${i}`, 'user', `q${i}`))
  many.push(turn(`a${i}`, 'assistant', `a${i}`, { responseType: 'ai' }))
}
const newest = selectChatHistory(many)
assert.equal(newest.length, 12)
assert.equal(newest[0].content, 'q14')
assert.equal(newest.at(-1)?.content, 'a19')

const pending = [
  turn('u', 'user', 'kept'),
  turn('a', 'assistant', 'kept answer', { responseType: 'ai' }),
  turn('u2', 'user', 'pending question', { status: 'sending' }),
  turn('a2', 'assistant', 'Looking up', { status: 'sending' }),
]
assert.deepEqual(selectChatHistory(pending), [
  { role: 'user', content: 'kept' },
  { role: 'assistant', content: 'kept answer' },
])

const autoBody = buildChatRequestBody({
  message: '  Hello  ',
  timezone: 'America/New_York',
  uiLanguage: 'en',
  answerLanguage: 'auto',
  history,
})
assert.equal(autoBody.message, 'Hello')
assert.equal(autoBody.ui_language, 'en')
assert.equal('answer_language' in autoBody, false)
assert.equal('context' in autoBody, false)
assert.deepEqual(autoBody.history, history)

for (const answerLanguage of ['en', 'am', 'bilingual']) {
  const body = buildChatRequestBody({
    message: 'Question',
    uiLanguage: 'am',
    answerLanguage,
  })
  assert.equal(body.ui_language, 'am')
  assert.equal(body.answer_language, answerLanguage)
  assert.equal('history' in body, false)
}

console.log('test-search-buddy-fallback: ok')
