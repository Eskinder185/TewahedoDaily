/**
 * Resolve Mezmur detail paths from Search Buddy hymn rows.
 * Run: node --experimental-strip-types --no-warnings scripts/test-mezmur-route.mjs
 */
import assert from 'node:assert/strict'
import {
  isSafeMezmurSlug,
  resolveMezmurDetailPath,
} from '../src/lib/searchBuddy/mezmurRoute.ts'

assert.equal(isSafeMezmurSlug('absera-gebriel'), true)
assert.equal(isSafeMezmurSlug('Absera-Gebriel'), true)
assert.equal(
  resolveMezmurDetailPath({ slug: 'Absera-Gebriel' }),
  '/practice/mezmur/absera-gebriel',
)
assert.equal(isSafeMezmurSlug('አብሰራ ገብሬል'), false)
assert.equal(isSafeMezmurSlug('../evil'), false)
assert.equal(isSafeMezmurSlug('a/b'), false)
assert.equal(isSafeMezmurSlug(''), false)

assert.equal(
  resolveMezmurDetailPath({ slug: 'absera-gebriel', title: 'Absera Gebriel' }),
  '/practice/mezmur/absera-gebriel',
)
assert.equal(
  resolveMezmurDetailPath({
    mezmur_slug: 'gena-hymn',
    title_amharic: 'ገና',
  }),
  '/practice/mezmur/gena-hymn',
)
assert.equal(
  resolveMezmurDetailPath({
    route: '/practice/mezmur/absera-gebriel',
    title: 'ignored',
  }),
  '/practice/mezmur/absera-gebriel',
)

// Never invent from title alone.
assert.equal(
  resolveMezmurDetailPath({
    title: 'Absera Gebriel',
    title_amharic: 'አብሠራ ገብርኤል',
  }),
  null,
)
assert.equal(resolveMezmurDetailPath({ slug: 'Not A Slug' }), null)
assert.equal(resolveMezmurDetailPath(null), null)

console.log('test-mezmur-route: ok')
