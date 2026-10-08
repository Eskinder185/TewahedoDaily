/**
 * Bible Search Buddy checks: parser + live Supabase lookups.
 * Run: node --env-file-if-exists=.env.local --experimental-strip-types --no-warnings scripts/test-bible-search.mjs
 */
import assert from 'node:assert/strict'
import {
  convertReferenceNumberWords,
  parseBibleReference,
} from '../src/lib/bible/parseBibleReference.ts'
import {
  clearBibleSearchCache,
  resolveBibleBook,
  searchBible,
} from '../src/lib/bible/bibleSearch.ts'

function assertParse(query, expected) {
  const parsed = parseBibleReference(query)
  assert.equal(parsed.bookQuery, expected.bookQuery, `${query} bookQuery`)
  assert.equal(parsed.chapter, expected.chapter, `${query} chapter`)
  assert.equal(parsed.verseStart, expected.verseStart, `${query} verseStart`)
  assert.equal(parsed.verseEnd, expected.verseEnd, `${query} verseEnd`)
  if (expected.isReference != null) {
    assert.equal(parsed.isReference, expected.isReference, `${query} isReference`)
  }
}

// --- parser ---
assertParse('John 3:16', {
  bookQuery: 'John',
  chapter: 3,
  verseStart: 16,
  verseEnd: 16,
  isReference: true,
})
assertParse('Open John 3:16', {
  bookQuery: 'John',
  chapter: 3,
  verseStart: 16,
  verseEnd: 16,
  isReference: true,
})
assertParse('Show me John 3:16', {
  bookQuery: 'John',
  chapter: 3,
  verseStart: 16,
  verseEnd: 16,
  isReference: true,
})
assertParse('john 3:16', {
  bookQuery: 'john',
  chapter: 3,
  verseStart: 16,
  verseEnd: 16,
  isReference: true,
})
assertParse('Jn 3:16', {
  bookQuery: 'Jn',
  chapter: 3,
  verseStart: 16,
  verseEnd: 16,
  isReference: true,
})
assertParse('John 3', {
  bookQuery: 'John',
  chapter: 3,
  verseStart: null,
  verseEnd: null,
  isReference: true,
})
assertParse('John', {
  bookQuery: 'John',
  chapter: null,
  verseStart: null,
  verseEnd: null,
  isReference: false,
})
assertParse('John 3:16-18', {
  bookQuery: 'John',
  chapter: 3,
  verseStart: 16,
  verseEnd: 18,
  isReference: true,
})
assertParse('John chapter 3', {
  bookQuery: 'John',
  chapter: 3,
  verseStart: null,
  verseEnd: null,
  isReference: true,
})
assertParse('John chapter 3 verse 16', {
  bookQuery: 'John',
  chapter: 3,
  verseStart: 16,
  verseEnd: 16,
  isReference: true,
})
assertParse('1 Samuel 3:10', {
  bookQuery: '1 Samuel',
  chapter: 3,
  verseStart: 10,
  verseEnd: 10,
  isReference: true,
})
assertParse('2 Corinthians 5:17', {
  bookQuery: '2 Corinthians',
  chapter: 5,
  verseStart: 17,
  verseEnd: 17,
  isReference: true,
})
assertParse('Psalm 23', {
  bookQuery: 'Psalm',
  chapter: 23,
  verseStart: null,
  verseEnd: null,
  isReference: true,
})

assert.equal(convertReferenceNumberWords('John three sixteen'), 'John 3:16')
assert.equal(
  convertReferenceNumberWords('John chapter three verse sixteen'),
  'John chapter 3 verse 16',
)
assertParse('John three sixteen', {
  bookQuery: 'John',
  chapter: 3,
  verseStart: 16,
  verseEnd: 16,
  isReference: true,
})
assertParse('John chapter three verse sixteen', {
  bookQuery: 'John',
  chapter: 3,
  verseStart: 16,
  verseEnd: 16,
  isReference: true,
})
assertParse('Matthew five three', {
  bookQuery: 'Matthew',
  chapter: 5,
  verseStart: 3,
  verseEnd: 3,
  isReference: true,
})

// Amharic digit references
assertParse('\u12ee\u1210\u1295\u1235 3:16', {
  bookQuery: '\u12ee\u1210\u1295\u1235',
  chapter: 3,
  verseStart: 16,
  verseEnd: 16,
  isReference: true,
})
assertParse('\u1218\u12dd\u1219\u122d 23', {
  bookQuery: '\u1218\u12dd\u1219\u122d',
  chapter: 23,
  verseStart: null,
  verseEnd: null,
  isReference: true,
})

// Free text must not be forced into a reference
assertParse('love', {
  bookQuery: 'love',
  chapter: null,
  verseStart: null,
  verseEnd: null,
  isReference: false,
})

clearBibleSearchCache()

async function expectType(query, type, opts = {}) {
  const { results, directReference } = await searchBible(query, opts)
  assert.ok(results.length, `${query} should return results`)
  assert.equal(results[0].sourceType, type, `${query} → ${type}, got ${results[0].sourceType}`)
  if (opts.expectDirect != null) {
    assert.equal(directReference, opts.expectDirect, `${query} directReference`)
  }
  return results
}

// --- live lookups ---
{
  const book = await resolveBibleBook('John')
  assert.ok(book)
  assert.equal(book.book.slug, 'john')
}

{
  const book = await resolveBibleBook('Jn')
  assert.ok(book)
  assert.equal(book.book.slug, 'john')
}

{
  const book = await resolveBibleBook('\u12ee\u1210\u1295\u1235')
  assert.ok(book, 'Amharic John should resolve')
  assert.equal(book.book.slug, 'john')
}

{
  const book = await resolveBibleBook('\u121b\u1274\u12ce\u1235')
  assert.ok(book, 'Amharic Matthew should resolve')
  assert.equal(book.book.slug, 'matthew')
}

{
  const book = await resolveBibleBook('\u12d8\u134d\u1325\u1228\u1275')
  assert.ok(book, 'Amharic Genesis token should resolve')
  assert.equal(book.book.slug, 'genesis')
}

{
  const book = await resolveBibleBook('1 Samuel')
  assert.ok(book)
  assert.equal(book.book.slug, 'samuel')
  assert.ok(book.preferredSource, '1 Samuel should target a source volume')
}

await expectType('John', 'bible-book', { expectDirect: true })
await expectType('John 3', 'bible-chapter', { expectDirect: true })
{
  const rows = await expectType('John 3:16', 'bible-verse', { expectDirect: true })
  assert.match(rows[0].excerpt || '', /God so loved/i)
  assert.match(rows[0].route, /^\/bible\/john\/\d+$/)
}
await expectType('Jn 3:16', 'bible-verse')
await expectType('John chapter 3 verse 16', 'bible-verse')
await expectType('John 3:16-18', 'bible-range')
await expectType('Matthew 5', 'bible-chapter')
await expectType('Psalm 23', 'bible-chapter')
await expectType('Genesis 1:1', 'bible-verse')
await expectType('1 Samuel 3:10', 'bible-verse')
await expectType('2 Corinthians 5:17', 'bible-verse')

await expectType('\u12ee\u1210\u1295\u1235', 'bible-book', { language: 'am' })
await expectType('\u12ee\u1210\u1295\u1235 3', 'bible-chapter', { language: 'am' })
await expectType('\u12ee\u1210\u1295\u1235 3:16', 'bible-verse', { language: 'am' })
await expectType('\u121b\u1274\u12ce\u1235 5', 'bible-chapter', { language: 'am' })
await expectType('\u1218\u12dd\u1219\u122d 23', 'bible-chapter', { language: 'am' })
await expectType('\u12d8\u134d\u1325\u1228\u1275 1:1', 'bible-verse', { language: 'am' })

{
  const { results, directReference } = await searchBible('love')
  assert.equal(directReference, false)
  assert.ok(results.some((r) => r.sourceType === 'bible-text'))
  assert.ok(results.length <= 12)
}

{
  const { results } = await searchBible('\u134d\u1245\u122d', { language: 'am' })
  assert.ok(results.some((r) => r.sourceType === 'bible-text'), 'Amharic text search')
}

{
  const { results, directReference } = await searchBible('John 999')
  assert.equal(directReference, true)
  assert.ok(results[0].title.toLowerCase().includes('not found') || results[0].title.includes('999'))
}

{
  const { results } = await searchBible('John 3:999')
  assert.match(results[0].title, /not present|not found|999/i)
}

{
  const { results } = await searchBible('NotARealBook 3:16')
  assert.ok(results[0].title.toLowerCase().includes('no bible book') || results[0].title.includes('NotARealBook'))
}

{
  // Amharic-only book: Enoch — book result, no invented English scripture
  const { results } = await searchBible('Enoch')
  assert.equal(results[0].sourceType, 'bible-book')
  assert.match(results[0].route, /\/bible\/enoch/)
}

{
  // Missing canonical content
  const { results } = await searchBible('Tizaz')
  assert.ok(results.length)
  assert.match(results[0].title + results[0].description, /no published|not yet|catalog/i)
}

console.log('test-bible-search: ok')
