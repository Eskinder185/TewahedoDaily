/**
 * Global language preference pure checks.
 * Run: npm run test:locale-unify
 */
import assert from 'node:assert/strict'
import {
  isAppLocale,
  prefersAmharicContent,
  toContentLocale,
  toUiLocale,
} from '../src/lib/i18n/localeHelpers.ts'
import { bilingualLines, pickContentString } from '../src/lib/i18n/bilingualContent.ts'

assert.equal(isAppLocale('both'), true)
assert.equal(isAppLocale('fr'), false)
assert.equal(toUiLocale('both'), 'en')
assert.equal(toUiLocale('am'), 'am')
assert.equal(toContentLocale('both'), 'both')
assert.equal(prefersAmharicContent('am'), true)
assert.equal(prefersAmharicContent('both'), false)

const block = { english: 'Cross', amharic: 'መስቀል' }
assert.equal(pickContentString(block, 'en').text, 'Cross')
assert.equal(pickContentString(block, 'am').text, 'መስቀል')
assert.equal(pickContentString(block, 'both').text, 'መስቀል')

const both = bilingualLines(block, 'both')
assert.equal(both.length, 2)
assert.equal(both[0].lang, 'am')
assert.equal(both[1].lang, 'en')

const fallback = bilingualLines({ english: 'Only EN', amharic: '' }, 'am')
assert.equal(fallback.length, 1)
assert.equal(fallback[0].isFallback, true)
assert.equal(fallback[0].lang, 'en')

console.log('locale-unify pure checks: ok')
