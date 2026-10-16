/**
 * Search Buddy clipboard plain-text extraction.
 * Run: npx tsx scripts/test-search-buddy-copy-text.mjs
 */
import assert from 'node:assert/strict'
import {
  plainTextFromSearchBuddyMessage,
  plainTextFromSearchBuddyResponse,
} from '../src/lib/searchBuddy/copySearchBuddyText.ts'

const ai = plainTextFromSearchBuddyResponse({
  type: 'ai',
  answer: 'The Incarnation is the mystery of the Word made flesh.',
})
assert.equal(ai, 'The Incarnation is the mystery of the Word made flesh.')

const bible = plainTextFromSearchBuddyResponse({
  type: 'bible_reference',
  reference: 'John 3:16',
  verses: [{ verse: 16, text: 'For God so loved the world…' }],
})
assert.match(bible, /John 3:16/)
assert.match(bible, /For God so loved/)

const msg = plainTextFromSearchBuddyMessage({
  id: 'a1',
  role: 'assistant',
  createdAt: 1,
  status: 'complete',
  text: 'Here is John 3:16.',
  response: {
    type: 'bible_reference',
    reference: 'John 3:16',
    text: 'For God so loved the world…',
  },
})
assert.match(msg, /Here is John 3:16/)
assert.match(msg, /For God so loved/)

console.log('test-search-buddy-copy-text: ok')
