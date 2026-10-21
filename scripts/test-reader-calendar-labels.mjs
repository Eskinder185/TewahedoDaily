/**
 * Reader-language choice and localized calendar/hymn labels.
 * Run: npx tsx scripts/test-reader-calendar-labels.mjs
 */
import assert from 'node:assert/strict'
import { selectReaderLanguage } from '../src/lib/prayers/readerLanguagePreference.ts'
import { formatEthiopianDay, formatGregorianLong } from '../src/lib/calendar/calendarDateLabels.ts'
import { hymnMezmurCountLabel, hymnSourceHeading } from '../src/lib/publicContent/hymnBrowseLabels.ts'

const withGeez = { amharic: 'አማ', geez: 'ግዕዝ ጽሑፍ', english: '' }
assert.equal(selectReaderLanguage({ locale: 'en', saved: 'english', text: withGeez }), 'english')
assert.equal(selectReaderLanguage({ locale: 'am', saved: null, text: withGeez }), 'amharic')
assert.equal(
  selectReaderLanguage({
    locale: 'en',
    saved: null,
    text: { amharic: '', geez: 'ግዕዝ ጽሑፍ', english: '' },
  }),
  'geez',
)
assert.equal(selectReaderLanguage({ locale: 'am', saved: 'geez', text: withGeez }), 'geez')
assert.equal(withGeez.geez, 'ግዕዝ ጽሑፍ')

const day = new Date(2026, 8, 11)
const amEth = formatEthiopianDay(day, 'am', true)
const enEth = formatEthiopianDay(day, 'en', true)
assert.notEqual(amEth, enEth)
assert.match(amEth, /[\u1200-\u137F]/)
assert.match(enEth, /[A-Za-z]/)
assert.match(formatGregorianLong(day, 'am'), /[\u1200-\u137F]/)
assert.match(formatGregorianLong(day, 'en'), /September|2026/)

assert.equal(hymnMezmurCountLabel(1, 'am'), '1 መዝሙር')
assert.equal(hymnMezmurCountLabel(3, 'en'), '3 Mezmurs')
const heading = hymnSourceHeading('Gena', 'ገና', 'am')
assert.equal(heading.primary, 'ገና')
assert.equal(heading.primaryLang, 'am')
assert.equal(heading.secondary, 'Gena')
const sourceOnly = hymnSourceHeading('Timkat', '', 'am')
assert.equal(sourceOnly.primary, 'Timkat')
assert.equal(sourceOnly.primaryLang, 'en')

console.log('reader, calendar date, and hymn label checks: ok')
