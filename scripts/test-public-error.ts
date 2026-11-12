/** Run: npx tsx scripts/test-public-error.ts */
import assert from 'node:assert/strict'
import { publicErrorMessage, isTechnicalMessage } from '../src/lib/errors/publicError.ts'
const fb = 'Please try again.'
for (const bad of [
  'invalid input syntax for type uuid: "aba-abune"',
  'Could not find the table public.mezmur in the schema cache (PGRST205)',
  'column mezmur_public.has_stored_lyrics does not exist',
  'TypeError: Failed to fetch',
  'Mezmur 6f1c2a4e-9b1d-4a52-8c77-0d2b1c3a4e5f not found in public.mezmur',
  'permission denied for table mezmur',
  '',
]) assert.equal(publicErrorMessage(new Error(bad), fb), fb, bad)
assert.equal(publicErrorMessage('This hymn is not available yet.', fb), 'This hymn is not available yet.')
assert.equal(publicErrorMessage(undefined, fb), fb)
assert.equal(isTechnicalMessage('x'.repeat(300)), true)
console.log('test-public-error: ok')
