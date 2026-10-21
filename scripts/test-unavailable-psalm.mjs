/**
 * Missing Mezmure Dawit numbers must not be answered with another psalm.
 * Run: node --experimental-strip-types --no-warnings scripts/test-unavailable-psalm.mjs
 */
import assert from 'node:assert/strict'
import { readFileSync } from 'node:fs'
import {
  parseRequestedPsalmNumber,
  resolvePsalmReading,
  retainedPsalmReading,
} from '../src/lib/prayers/psalmReading.ts'

const psalms = [{ number: 1 }, { number: 2 }, { number: 23 }]

const missing = resolvePsalmReading(psalms, '15', null)
assert.equal(missing.status, 'missing')
assert.equal(missing.requestedNumber, 15)
assert.equal(missing.missingNumber, 15)
assert.equal(missing.match, null)
assert.equal(missing.display, null)
assert.equal(missing.displayRole, 'none')
assert.notEqual(missing.display?.number, 1)

const padded = resolvePsalmReading(psalms, '015', null)
assert.equal(padded.status, 'missing')
assert.equal(padded.missingNumber, 15)
assert.equal(padded.display, null)

const kept = resolvePsalmReading(psalms, '15', psalms[1])
assert.equal(kept.status, 'missing')
assert.equal(kept.missingNumber, 15)
assert.equal(kept.match, null)
assert.equal(kept.display, psalms[1])
assert.equal(kept.displayRole, 'previous')
assert.notEqual(kept.displayRole, 'match')

const found = resolvePsalmReading(psalms, '23', psalms[0])
assert.equal(found.status, 'match')
assert.equal(found.display, psalms[2])
assert.equal(found.displayRole, 'match')
assert.equal(found.missingNumber, null)

assert.equal(parseRequestedPsalmNumber('psalm 15'), null)
assert.equal(parseRequestedPsalmNumber('151'), null)
assert.equal(parseRequestedPsalmNumber('0'), null)
const browse = resolvePsalmReading(psalms, 'psalm 15', null)
assert.equal(browse.status, 'browse')
assert.equal(browse.missingNumber, null)
assert.equal(browse.displayRole, 'browse')
assert.equal(retainedPsalmReading(browse), null)
assert.equal(retainedPsalmReading(missing), null)
assert.equal(retainedPsalmReading(kept)?.number, 2)
assert.equal(retainedPsalmReading(found)?.number, 23)

const page = readFileSync(new URL('../src/pages/MezmureDawitPage.tsx', import.meta.url), 'utf8')
assert.match(page, /retainedPsalmReading/)
assert.match(page, /prayerMezmurUnavailable/)
assert.match(page, /prayerMezmurPreviousReading/)
assert.doesNotMatch(page, /sorted\[index\] \?\? sorted\[0\]/)
assert.doesNotMatch(page, /return i >= 0 \? i : 0/)

console.log('unavailable-psalm checks: ok')
