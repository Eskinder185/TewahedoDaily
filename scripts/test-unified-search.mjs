/**
 * Pure + optional live checks for unified Bible / Hymn search adapters.
 * Run: node --experimental-strip-types --no-warnings scripts/test-unified-search.mjs
 * Live API: npx tsx --env-file-if-exists=.env.local scripts/test-unified-search.mjs
 */
import assert from 'node:assert/strict'
import { parseBibleReference } from '../src/lib/bible/parseBibleReference.ts'
import {
  extractBibleBookSlug,
  isSafeBibleBookSlug,
  resolveBibleDetailPath,
  flattenBibleBookFields,
} from '../src/lib/search/bibleRoute.ts'
import { normalizeBibleSearchHit } from '../src/lib/search/structuredSearchApi.ts'
import { isSafeMezmurSlug, resolveMezmurDetailPath } from '../src/lib/searchBuddy/mezmurRoute.ts'
import { canAttemptAmharicTranscription } from '../src/lib/ai/transcribeAudio.ts'
import { isAiApiConfigured } from '../src/lib/ai/aiConfig.ts'

// --- Bible reference normalization (shared with page + Search Buddy local) ---
{
  const john = parseBibleReference('John 3:16')
  assert.equal(john.isReference, true)
  assert.equal(john.chapter, 3)
  assert.equal(john.verseStart, 16)

  const open = parseBibleReference('Open John 3:16')
  assert.equal(open.isReference, true)
  assert.match(open.bookQuery || '', /john/i)

  const psalms = parseBibleReference('Psalms 23')
  assert.equal(psalms.isReference, true)
  assert.equal(psalms.chapter, 23)
}

// --- Bible route resolution from nested API shapes ---
{
  assert.equal(isSafeBibleBookSlug('john'), true)
  assert.equal(isSafeBibleBookSlug('John 3'), false)
  assert.equal(
    resolveBibleDetailPath({
      book: { slug: 'john', name_en: 'John', name_am: 'የዮሐንስ ወንጌል' },
      chapter: 3,
    }),
    '/bible/john/3',
  )
  assert.equal(
    resolveBibleDetailPath({
      book: { slug: 'john', name_en: 'John', name_am: 'የዮሐንስ ወንጌል' },
      chapter: 3,
      verse: 16,
    }),
    '/bible/john/3#verse-16',
  )
  assert.equal(extractBibleBookSlug({ book_slug: 'psalms' }), 'psalms')
  const flat = flattenBibleBookFields({
    book: { slug: 'psalms', name_en: 'Psalms', name_am: 'መዝሙረ ዳዊት' },
  })
  assert.equal(flat.book_slug, 'psalms')
  assert.equal(flat.book_name, 'Psalms')
  assert.equal(flat.book_name_amharic, 'መዝሙረ ዳዊት')
}

// --- bible_reference parse stays structured (not AI) ---
{
  const { parseSearchBuddyResponse, isEmptySearchBuddyResponse } = await import(
    '../src/lib/searchBuddy/parseSearchBuddyResponse.ts'
  )
  const parsed = parseSearchBuddyResponse({
    type: 'bible_reference',
    reference: 'John 3:16',
    book: { slug: 'john', name_en: 'John', name_am: 'የዮሐንስ ወንጌል' },
    chapter: 3,
    verse: 16,
    end_verse: 16,
    verses: [{ verse_number: 16, text: 'For God so loved the world…' }],
    answer: 'should not force AI type',
  })
  assert.equal(parsed.type, 'bible_reference')
  assert.equal(isEmptySearchBuddyResponse(parsed), false)
  if (parsed.type === 'bible_reference') {
    assert.ok(parsed.book && typeof parsed.book === 'object')
    assert.equal(parsed.book.slug, 'john')
    assert.equal(parsed.book.name_am, 'የዮሐንስ ወንጌል')
    assert.equal(parsed.verses?.length, 1)
    assert.equal(resolveBibleDetailPath(parsed), '/bible/john/3#verse-16')
  }
}

// --- Normalize GET /api/bible/search hit ---
{
  const hit = normalizeBibleSearchHit({
    reference: 'Psalms 18:1',
    book: { id: 'x', slug: 'psalms', name_en: 'Psalms', name_am: 'መዝሙረ ዳዊት' },
    chapter: 18,
    verse: 1,
    text: 'I love you, Yahweh, my strength.',
  })
  assert.ok(hit)
  assert.equal(hit.book_slug, 'psalms')
  assert.equal(hit.book_name, 'Psalms')
  assert.equal(resolveBibleDetailPath(hit), '/bible/psalms/18#verse-1')
}

// --- Duplicate hymn titles keep distinct slugs ---
{
  const a = resolveMezmurDetailPath({
    slug: 'absera-gebriel',
    title: 'Absera Gebriel',
    title_amharic: 'አብሠራ ገብርኤል',
  })
  const b = resolveMezmurDetailPath({
    slug: 'absera-gebriel-alt',
    title: 'Absera Gebriel',
    title_amharic: 'አብሠራ ገብርኤል',
  })
  assert.equal(a, '/practice/mezmur/absera-gebriel')
  assert.equal(b, '/practice/mezmur/absera-gebriel-alt')
  assert.notEqual(a, b)
  assert.equal(isSafeMezmurSlug('not a slug'), false)
  assert.equal(resolveMezmurDetailPath({ title: 'Only Title' }), null)
}

// --- Invalid / empty API payloads ---
{
  assert.equal(normalizeBibleSearchHit(null), null)
  assert.equal(normalizeBibleSearchHit('x'), null)
  assert.equal(resolveBibleDetailPath({ book: 'Not A Slug' }), null)
}

// --- Transcription language gate (no heavy models) ---
{
  // Without URL, Amharic server path is off; English native remains browser-side.
  if (!isAiApiConfigured()) {
    assert.equal(canAttemptAmharicTranscription(), false)
  }
}

console.log('test-unified-search: pure checks ok')

// Optional live probes when URL is present
if (isAiApiConfigured()) {
  const { fetchHymnsSearchApi, fetchBibleSearchApi } = await import(
    '../src/lib/search/structuredSearchApi.ts'
  )
  const hymns = await fetchHymnsSearchApi('absera', { limit: 3 })
  assert.ok(Array.isArray(hymns.results))
  for (const row of hymns.results) {
    const path = resolveMezmurDetailPath(row)
    if (path) assert.match(path, /^\/practice\/mezmur\/[a-z0-9-]+$/i)
  }

  const bibleKw = await fetchBibleSearchApi('love', { language: 'en', limit: 2 })
  assert.ok(Array.isArray(bibleKw.results))
  for (const hit of bibleKw.results) {
    const path = resolveBibleDetailPath(hit)
    if (path) assert.match(path, /^\/bible\/[a-z0-9-]+(?:\/\d+)?(?:#verse-\d+)?$/i)
  }

  // Reference shape is empty on GET bible/search — callers must use local/chat.
  const bibleRef = await fetchBibleSearchApi('John 3:16', { language: 'en', limit: 2 })
  assert.equal(bibleRef.results.length, 0)

  console.log('test-unified-search: live API checks ok')
} else {
  console.log('test-unified-search: skipped live API (VITE_TEWAHEDO_AI_API_URL unset)')
}
