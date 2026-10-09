/**
 * Global language preference pure checks.
 * Run: npm run test:locale-unify
 */
import assert from 'node:assert/strict'
import {
  isAppLocale,
  normalizeAppLocale,
  prefersAmharicContent,
  toContentLocale,
  toUiLocale,
} from '../src/lib/i18n/localeHelpers.ts'
import { bilingualLines, pickContentString } from '../src/lib/i18n/bilingualContent.ts'

assert.equal(isAppLocale('en'), true)
assert.equal(isAppLocale('am'), true)
assert.equal(isAppLocale('both'), false)
assert.equal(isAppLocale('om'), false)
assert.equal(isAppLocale('fr'), false)

assert.equal(normalizeAppLocale('en'), 'en')
assert.equal(normalizeAppLocale('am'), 'am')
assert.equal(normalizeAppLocale('both'), 'en')
assert.equal(normalizeAppLocale('om'), 'en')
assert.equal(normalizeAppLocale('oromo'), 'en')
assert.equal(normalizeAppLocale('afaan-oromoo'), 'en')

assert.equal(toUiLocale('am'), 'am')
assert.equal(toUiLocale('en'), 'en')
assert.equal(toContentLocale('am'), 'am')
assert.equal(prefersAmharicContent('am'), true)
assert.equal(prefersAmharicContent('en'), false)

const block = { english: 'Cross', amharic: 'መስቀል' }
assert.equal(pickContentString(block, 'en').text, 'Cross')
assert.equal(pickContentString(block, 'am').text, 'መስቀል')

const amLines = bilingualLines(block, 'am')
assert.equal(amLines.length, 1)
assert.equal(amLines[0].lang, 'am')

const fallback = bilingualLines({ english: 'Only EN', amharic: '' }, 'am')
assert.equal(fallback.length, 1)
assert.equal(fallback[0].isFallback, true)
assert.equal(fallback[0].lang, 'en')

console.log('locale-unify pure checks: ok')
