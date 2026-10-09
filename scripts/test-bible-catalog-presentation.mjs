/**
 * Regression: catalog presentation helpers (canonical-only, volumes, corrupt names).
 * Run: node --experimental-strip-types scripts/test-bible-catalog-presentation.mjs
 */
import assert from 'node:assert/strict'
import {
  buildCatalogMeta,
  canonicalAmharicDisplayName,
  displayBookName,
  hasBilingualBookNames,
  hasCorruptText,
  matchCatalogBooks,
  uniqueCanonicalBooks,
  volumeCountForBook,
} from '../src/lib/bible/bibleCatalogPresentation.ts'

const editions = [
  { id: 'e-am', code: 'am' },
  { id: 'e-web', code: 'web' },
]

const books = [
  {
    id: 'b1',
    canonical_number: 9,
    collection: 'old',
    slug: 'samuel',
    name_en: 'Samuel',
    name_am: null,
    sort_order: 9,
  },
  {
    id: 'b1-dup',
    canonical_number: 9,
    collection: 'old',
    slug: 'samuel',
    name_en: 'Samuel DUP',
    name_am: null,
    sort_order: 9,
  },
  {
    id: 'b2',
    canonical_number: 1,
    collection: 'old',
    slug: 'genesis',
    name_en: 'Genesis',
    name_am: 'ኦሪት ዘፍጥረት',
    sort_order: 1,
  },
]

const sources = [
  { id: 's1', canonical_book_id: 'b1', edition_id: 'e-am', source_book_number: 1 },
  { id: 's2', canonical_book_id: 'b1', edition_id: 'e-am', source_book_number: 2 },
  { id: 's3', canonical_book_id: 'b1', edition_id: 'e-web', source_book_number: 1 },
  { id: 's4', canonical_book_id: 'b2', edition_id: 'e-am', source_book_number: 1 },
]

assert.equal(uniqueCanonicalBooks(books).length, 2)
assert.equal(volumeCountForBook('b1', sources, editions), 2)
assert.equal(volumeCountForBook('b2', sources, editions), 1)

const meta = buildCatalogMeta(books, sources, editions)
assert.equal(meta.length, 2)
const samuel = meta.find((row) => row.book.slug === 'samuel')
assert.ok(samuel)
assert.equal(samuel.volumeCount, 2)
assert.equal(samuel.availability.am, true)
assert.equal(samuel.availability.en, true)

assert.equal(hasCorruptText('መጽሐፍ'), false)
assert.equal(hasCorruptText('መጽሐ\uFFFD'), true)
assert.equal(displayBookName({ ...books[2], name_am: 'መጽሐ\uFFFD' }, 'am'), 'Genesis')

const samuelBook = books[0]
assert.equal(canonicalAmharicDisplayName(samuelBook), 'መጽሐፈ ሳሙኤል')
assert.equal(displayBookName(samuelBook, 'am'), 'መጽሐፈ ሳሙኤል')
assert.equal(displayBookName(samuelBook, 'en'), 'Samuel')
assert.equal(hasBilingualBookNames(samuelBook), true)
assert.notEqual(displayBookName(samuelBook, 'am'), '')

const hits = matchCatalogBooks('sam', books)
assert.equal(hits[0]?.slug, 'samuel')
const amHits = matchCatalogBooks('ኦሪት', books)
assert.equal(amHits[0]?.slug, 'genesis')
const samuelAmHits = matchCatalogBooks('ሳሙኤል', books)
assert.equal(samuelAmHits[0]?.slug, 'samuel')

console.log('bible-catalog-presentation: ok')
