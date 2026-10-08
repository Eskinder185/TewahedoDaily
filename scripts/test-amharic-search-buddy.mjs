/**
 * Unit checks for Amharic Search Buddy helpers (no live API required).
 */
import assert from 'node:assert/strict'
import {
  containsEthiopic,
  normalizeAmharicSearchText,
} from '../src/lib/searchBuddy/amharicText.ts'

const hymnPunct = '\u12A0\u1265\u1230\u122B \u1308\u1265\u122C\u120D\u1362'
const hymnNorm = '\u12A0\u1265\u1230\u122B \u1308\u1265\u122C\u120D'
const fastingPunct = '\u12DB\u122C \u133E\u121D \u1290\u12CD\u1362'
const fastingNorm = '\u12DB\u122C \u133E\u121D \u1290\u12CD'

assert.equal(containsEthiopic(hymnPunct), true)
assert.equal(containsEthiopic('fasting today'), false)
assert.equal(normalizeAmharicSearchText(hymnPunct), hymnNorm)
assert.equal(normalizeAmharicSearchText(fastingPunct), fastingNorm)
assert.equal(normalizeAmharicSearchText(`  ${hymnNorm}  `), hymnNorm)

console.log('test-amharic-search-buddy: ok')
