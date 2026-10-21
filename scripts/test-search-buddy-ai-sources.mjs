/**
 * Verified AI Scripture sources: normalize, partition, parse, copy.
 * Run: npx tsx scripts/test-search-buddy-ai-sources.mjs
 */
import assert from 'node:assert/strict'
import {
  coversRangeLabel,
  isAiGenericSource,
  isAiScriptureSource,
  normalizeAiSources,
  partitionAiSources,
  scriptureLanguageKey,
  scriptureVerseText,
} from '../src/lib/searchBuddy/aiSources.ts'
import { plainTextFromSearchBuddyResponse } from '../src/lib/searchBuddy/copySearchBuddyText.ts'
import { parseSearchBuddyResponse } from '../src/lib/searchBuddy/parseSearchBuddyResponse.ts'

const EN_MATT =
  'Go, and make disciples of all nations, baptizing them in the name of the Father and of the Son and of the Holy Spirit,'
const AM_MATT =
  '\u12A5\u1295\u130D\u12F2\u1205 \u1202\u12F1\u1293 \u12A0\u1215\u12DB\u1265\u1295 \u1201\u1201 \u1260\u12A0\u1265 \u1260\u12C8\u120D\u12F5\u1293 \u1260\u1218\u1295\u1348\u1235 \u1245\u12F1\u1235 \u1235\u121D \u12A5\u12EB\u1320\u1218\u1243\u127D\u120B\u1278\u12CD\u1365 \u12EB\u12D8\u12DD\u120E\u127D\u120B\u1278\u12CD\u121D \u1201\u1201 \u12A5\u1295\u12F2\u1320\u1265\u1241 \u12A5\u12EB\u1235\u1270\u121B\u122B\u127D\u120B\u1278\u12CD \u12F0\u1240 \u1218\u12DB\u1219\u122D\u1275 \u12A0\u12F5\u122D\u130E\u12CB\u1278\u12CD\u1362 \u12A5\u1294\u1206\u121D\u1365 \u12A5\u1294 \u12A5\u1235\u12A8 \u12D3\u1208\u121D \u134D\u133B\u121C \u12F5\u1228\u1235 \u1201\u120D\u130A\u12DC \u12A8\u12A5\u1293\u1295\u1270 \u130B\u122D \u1290\u129D\u1362\u201D'

const enSource = {
  reference: 'Matthew 28:19',
  edition: 'web',
  language: 'en',
  mystery: 'Trinity',
  verses: [{ verse_number: 19, text: EN_MATT, covers_verse_range: null }],
}

const amSource = {
  reference: 'Matthew 28:19-20',
  edition: 'am',
  language: 'am',
  mystery: 'Trinity',
  verses: [{ verse_number: 19, text: AM_MATT, covers_verse_range: [19, 20] }],
}

const genericSource = {
  title: 'Ethiopian Orthodox Tewahedo Church',
  url: 'https://example.org/trinity',
  excerpt: 'Teaching on the Holy Trinity.',
}

// --- normalize / guards ---
assert.equal(isAiScriptureSource(enSource), true)
assert.equal(isAiScriptureSource(amSource), true)
assert.equal(isAiGenericSource(genericSource), true)
assert.equal(isAiScriptureSource(genericSource), false)
assert.equal(isAiGenericSource(enSource), false)

const normalized = normalizeAiSources([enSource, amSource, genericSource, null, {}, { verses: [] }])
assert.equal(normalized?.length, 3)
assert.equal(normalized?.[0].reference, 'Matthew 28:19')
assert.equal(normalized?.[1].reference, 'Matthew 28:19-20')
assert.equal(normalized?.[2].title, 'Ethiopian Orthodox Tewahedo Church')

assert.equal(normalizeAiSources(undefined), undefined)
assert.equal(normalizeAiSources([]), undefined)
assert.equal(normalizeAiSources([{ reference: 'x' }]), undefined)

// Malformed verse rows dropped; keep source if any valid verse remains
const partial = normalizeAiSources([
  {
    reference: 'John 1:1',
    language: 'en',
    edition: 'web',
    verses: [{ verse_number: 1, text: '   ' }, { verse_number: 1, text: 'In the beginning was the Word.' }],
  },
])
assert.equal(partial?.[0].verses?.length, 1)
assert.equal(partial?.[0].verses?.[0].text, 'In the beginning was the Word.')

// --- covers range ---
assert.equal(coversRangeLabel([19, 20]), '19\u201320')
assert.equal(coversRangeLabel([19, 19]), '19')
assert.equal(coversRangeLabel(null), null)
assert.equal(coversRangeLabel([19]), null)

assert.equal(scriptureLanguageKey('en'), 'en')
assert.equal(scriptureLanguageKey('am'), 'am')
assert.equal(scriptureLanguageKey('web'), 'other')
assert.equal(scriptureVerseText(amSource), AM_MATT)

// --- partition bilingual ---
const { scripture, generic } = partitionAiSources(normalized)
assert.equal(scripture.length, 2)
assert.equal(generic.length, 1)
assert.ok(scripture.every((s) => Array.isArray(s.verses) && s.verses[0]?.text))

// --- Five Mysteries style: 5 EN + 5 AM ---
const mysteries = ['Trinity', 'Incarnation', 'Baptism', 'Eucharist', 'Resurrection']
const tenSources = mysteries.flatMap((mystery, i) => [
  {
    reference: `Ref EN ${i + 1}`,
    edition: 'web',
    language: 'en',
    mystery,
    verses: [{ verse_number: 1, text: `English verse for ${mystery}`, covers_verse_range: null }],
  },
  {
    reference: `Ref AM ${i + 1}`,
    edition: 'am',
    language: 'am',
    mystery,
    verses: [{ verse_number: 1, text: `Amharic verse for ${mystery}`, covers_verse_range: null }],
  },
])
const tenNorm = normalizeAiSources(tenSources)
assert.equal(tenNorm?.length, 10)
const tenParts = partitionAiSources(tenNorm)
assert.equal(tenParts.scripture.length, 10)
assert.equal(tenParts.generic.length, 0)

// --- parse preserves Scripture fields ---
const parsed = parseSearchBuddyResponse({
  type: 'ai',
  answer: 'An explanation of the Holy Trinity...',
  sources: [enSource, amSource, genericSource],
})
assert.equal(parsed.type, 'ai')
assert.equal(parsed.answer, 'An explanation of the Holy Trinity...')
assert.equal(parsed.sources?.length, 3)
assert.equal(parsed.sources?.[0].reference, 'Matthew 28:19')
assert.equal(parsed.sources?.[0].edition, 'web')
assert.equal(parsed.sources?.[0].language, 'en')
assert.equal(parsed.sources?.[0].mystery, 'Trinity')
assert.equal(parsed.sources?.[0].verses?.[0].text, EN_MATT)
assert.deepEqual(parsed.sources?.[1].verses?.[0].covers_verse_range, [19, 20])
assert.equal(parsed.sources?.[1].verses?.[0].text, AM_MATT)
assert.equal(parsed.sources?.[2].url, 'https://example.org/trinity')

// Matthew 28:19–20 must stay one combined Amharic record
assert.equal(parsed.sources?.[1].reference, 'Matthew 28:19-20')
assert.equal(parsed.sources?.[1].verses?.length, 1)
assert.deepEqual(parsed.sources?.[1].verses?.[0].covers_verse_range, [19, 20])

// Missing sources → undefined (UI shows noSources)
const noSources = parseSearchBuddyResponse({ type: 'ai', answer: 'Hello' })
assert.equal(noSources.sources, undefined)

const grounded = parseSearchBuddyResponse({
  type: 'ai',
  answer: 'A general explanation.',
  answer_language: 'bilingual',
  grounding: 'unavailable_document',
  sources: [],
})
assert.equal(grounded.type, 'ai')
assert.equal(grounded.answer_language, 'bilingual')
assert.equal(grounded.grounding, 'unavailable_document')
assert.equal(grounded.sources, undefined)

const scriptureGrounded = parseSearchBuddyResponse({
  type: 'ai',
  answer: 'From the supplied verse.',
  grounding: 'scripture',
  sources: [enSource],
})
assert.equal(scriptureGrounded.grounding, 'scripture')
assert.equal(scriptureGrounded.sources?.[0].verses?.[0].text, EN_MATT)

const ignoredGrounding = parseSearchBuddyResponse({
  type: 'ai',
  answer: 'Kept.',
  grounding: 'made_up',
  answer_language: 'fr',
})
assert.equal(ignoredGrounding.grounding, undefined)
assert.equal(ignoredGrounding.answer_language, undefined)

// --- copy: explanation + exact Scripture + generic ---
const copied = plainTextFromSearchBuddyResponse(parsed)
assert.match(copied, /An explanation of the Holy Trinity/)
assert.match(copied, /Supplied Scripture/)
assert.match(copied, /Matthew 28:19/)
assert.match(copied, /English/)
assert.ok(copied.includes(EN_MATT))
assert.match(copied, /Matthew 28:19-20/)
assert.match(copied, /Amharic/)
assert.ok(copied.includes(AM_MATT))
assert.match(copied, /Sources/)
assert.match(copied, /Ethiopian Orthodox Tewahedo Church/)
assert.match(copied, /https:\/\/example\.org\/trinity/)

// AI answer alone still copies without inventing Scripture
assert.equal(
  plainTextFromSearchBuddyResponse({ type: 'ai', answer: 'Only explanation.' }),
  'Only explanation.',
)

console.log('test-search-buddy-ai-sources: ok')
