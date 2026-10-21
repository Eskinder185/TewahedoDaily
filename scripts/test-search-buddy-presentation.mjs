/**
 * Search Buddy presentation and error-state checks.
 * Uses constructed errors only — does not call the live assistant API.
 * Run: npx tsx scripts/test-search-buddy-presentation.mjs
 */
import assert from 'node:assert/strict'
import { mapHttpStatusToAiError, parseRetryAfterHeader } from '../src/lib/ai/aiErrors.ts'
import { AiClientError } from '../src/lib/ai/aiTypes.ts'
import { translate } from '../src/i18n/index.ts'
import { safeCitationUrl } from '../src/lib/searchBuddy/aiSources.ts'
import {
  isSearchBuddyAbort,
  searchBuddyErrorMessage,
  searchBuddyRetryAfterSeconds,
  searchBuddyUserNotice,
} from '../src/lib/searchBuddy/errorMessages.ts'
import { plainTextFromSearchBuddyResponse } from '../src/lib/searchBuddy/copySearchBuddyText.ts'

const NO_MATCH = "I couldn't find a matching result yet."
const NO_RESULTS_EN = translate('en', 'searchBuddy.noResults')
const NO_RESULTS_AM = translate('am', 'searchBuddy.noResults')

assert.notEqual(NO_RESULTS_EN, NO_MATCH)
assert.ok(/[\u1200-\u137F]/.test(NO_RESULTS_AM))
assert.notEqual(NO_RESULTS_EN, NO_RESULTS_AM)

const cases = [
  ['rate_limited', mapHttpStatusToAiError(429)],
  ['unavailable', mapHttpStatusToAiError(503)],
  ['timeout', mapHttpStatusToAiError(408)],
  ['network', new AiClientError('network', 'Network unavailable.')],
]

for (const [code, error] of cases) {
  const en = searchBuddyErrorMessage(error, 'en')
  const am = searchBuddyErrorMessage(error, 'am')
  assert.ok(en.length > 0, code)
  assert.ok(/[\u1200-\u137F]/.test(am), `${code} Amharic`)
  assert.notEqual(en, am, code)
  assert.notEqual(en, NO_RESULTS_EN, code)
  assert.notEqual(am, NO_RESULTS_AM, code)
  assert.ok(!/couldn't find a matching result/i.test(en), code)
  assert.ok(!/verified/i.test(en), code)
}

assert.match(searchBuddyErrorMessage(cases[0][1], 'en'), /try again/i)
assert.match(searchBuddyErrorMessage(cases[2][1], 'en'), /too long|try again/i)
assert.match(searchBuddyErrorMessage(cases[3][1], 'en'), /reach|network|offline/i)

const abort = new AiClientError('aborted', 'The request was cancelled.')
assert.equal(isSearchBuddyAbort(abort), true)
assert.equal(searchBuddyUserNotice(abort, 'en'), null)
assert.equal(searchBuddyUserNotice(abort, 'am'), null)
assert.equal(searchBuddyErrorMessage(abort, 'en'), '')

const retry = mapHttpStatusToAiError(429, undefined, 15)
assert.equal(retry.retryAfterSeconds, 15)
assert.equal(searchBuddyRetryAfterSeconds(retry), 15)
assert.equal(parseRetryAfterHeader('15'), 15)
const future = new Date(Date.now() + 20_000).toUTCString()
assert.ok((parseRetryAfterHeader(future) ?? 0) >= 15)
assert.equal(parseRetryAfterHeader('javascript:alert(1)'), undefined)

assert.equal(safeCitationUrl('https://example.org/john'), 'https://example.org/john')
assert.equal(safeCitationUrl('/pray/bible'), '/pray/bible')
assert.equal(safeCitationUrl('javascript:alert(1)'), null)
assert.equal(safeCitationUrl('data:text/html,hi'), null)
assert.equal(safeCitationUrl('//evil.example'), null)

const copied = plainTextFromSearchBuddyResponse({
  type: 'ai',
  answer: 'An explanation without invented citations.',
  sources: [
    { title: 'Unsafe', url: 'javascript:alert(1)', excerpt: 'do not link' },
    { title: 'Calendar', url: 'https://example.org/calendar', excerpt: 'supplied' },
  ],
})
assert.match(copied, /Supplied Scripture|Calendar/)
assert.ok(!copied.includes('javascript:'))
assert.ok(!/verified/i.test(copied))

const noSources = plainTextFromSearchBuddyResponse({
  type: 'ai',
  answer: 'Explanation only.',
})
assert.ok(!/https?:\/\//.test(noSources))
assert.ok(!/verified/i.test(noSources))

const NO_PASSAGE = translate('en', 'searchBuddy.faith.noPassage')
assert.equal(NO_PASSAGE, 'No matching passage found in Faith and Order')
const NO_PASSAGE_AM = translate('am', 'searchBuddy.faith.noPassage')
assert.ok(/[\u1200-\u137F]/.test(NO_PASSAGE_AM))
assert.notEqual(NO_PASSAGE, NO_PASSAGE_AM)
for (const [code, error] of cases) {
  assert.notEqual(searchBuddyErrorMessage(error, 'en'), NO_PASSAGE, code)
  assert.notEqual(searchBuddyErrorMessage(error, 'am'), NO_PASSAGE_AM, code)
}

console.log('test-search-buddy-presentation: ok')
