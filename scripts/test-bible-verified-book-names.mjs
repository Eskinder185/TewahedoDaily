/**
 * Verified Ethiopian Bible book names (source: amahricethiobible.ocr.txt table of contents).
 * Run: node --experimental-strip-types --no-warnings scripts/test-bible-verified-book-names.mjs
 */
import assert from 'node:assert/strict'
import { readFileSync } from 'node:fs'
import {
  displayBookName,
  displaySourceName,
  hasCorruptText,
  matchCatalogBooks,
} from '../src/lib/bible/bibleCatalogPresentation.ts'
import {
  VERIFIED_BOOK_NAMES,
  verifiedAmharicForCanonicalSlug,
  verifiedAmharicForSourceName,
  verifiedSearchNamesForSlug,
} from '../src/lib/bible/verifiedBookNames.ts'

function parseCsv(path) {
  const text = readFileSync(path, 'utf8').replace(/\r/g, '')
  const rows = []
  let row = [], field = '', quoted = false
  for (let i = 0; i < text.length; i++) {
    const c = text[i]
    if (quoted) {
      if (c === '"' && text[i + 1] === '"') { field += '"'; i++ } else if (c === '"') quoted = false; else field += c
    } else if (c === '"') quoted = true
    else if (c === ',') { row.push(field); field = '' }
    else if (c === '\n') { row.push(field); rows.push(row); row = []; field = '' }
    else field += c
  }
  const [header, ...body] = rows.filter((r) => r.length > 1)
  return body.map((r) => Object.fromEntries(header.map((h, i) => [h, r[i]])))
}
const editions = Object.fromEntries(parseCsv('artifacts/bible-csv/00-bible_editions.csv').map((r) => [r.id, r.code]))
const books = Object.fromEntries(parseCsv('artifacts/bible-csv/01-bible_canonical_books.csv').map((r) => [r.id, r]))
const sources = parseCsv('artifacts/bible-csv/02-bible_source_books.csv')
const webVolumes = sources.filter((r) => editions[r.edition_id] === 'web').sort((a, b) => a.source_order - b.source_order)

// 66 names, one-to-one with the English edition's 66 volumes in canonical order, no corruption.
assert.equal(VERIFIED_BOOK_NAMES.length, 66)
assert.equal(new Set(VERIFIED_BOOK_NAMES.map((e) => e.en)).size, 66)
assert.equal(webVolumes.length, 66)
for (const [i, entry] of VERIFIED_BOOK_NAMES.entries()) {
  const volume = webVolumes[i]
  assert.equal(entry.en, volume.source_name_en, `order ${i + 1}`)
  assert.equal(entry.slug, books[volume.canonical_book_id].slug, `${entry.en} canonical slug`)
  assert.ok(entry.am.length > 1 && !hasCorruptText(entry.am) && !/[.።(),]/.test(entry.am), `${entry.en} clean Amharic`)
  assert.equal(entry.am, entry.am.normalize('NFC').trim())
}
assert.deepEqual(
  Object.fromEntries(['verbatim', 'ocr-cleaned', 'db-corroborated'].map((s) => [s, VERIFIED_BOOK_NAMES.filter((e) => e.status === s).length])),
  { verbatim: 55, 'ocr-cleaned': 9, 'db-corroborated': 2 },
)
// The two corrupt/ambiguous OCR entries are flagged with their raw OCR text, never silently normalized.
assert.deepEqual(
  VERIFIED_BOOK_NAMES.filter((e) => e.status === 'db-corroborated').map((e) => [e.en, e.ocr]),
  [['2 Samuel', 'መጽሐፈ ሳሙኤል ካል'], ['1 Corinthians', '1ኛ ቆሮንጦስ']],
)

// Exact list wording for names that differ from the database spelling.
const exact = {
  Genesis: 'ኦሪት ዘፍጥረት', Joshua: 'መጽሐፈ ኢያሱ ወልደ ነዌ', Judges: 'መጽሐፈ መሣፍንት', '1 Samuel': 'መጽሐፈ ሳሙኤል ቀዳማዊ',
  '2 Kings': 'መጽሐፈ ነገሥት ካልዕ', Psalms: 'መዝሙረ ዳዊት', 'Song of Solomon': 'መኃልየ መኃልይ ዘሰሎሞን',
  Lamentations: 'ሰቆቃው ኤርምያስ', Amos: 'ትንቢተ አሞጽ', Malachi: 'ትንቢተ ሚልክያ', James: 'የያዕቆብ መልእክት',
  Revelation: 'የዮሐንስ ራእይ', '2 Corinthians': '2ኛ ወደ ቆሮንቶስ ሰዎች',
}
for (const [en, am] of Object.entries(exact)) assert.equal(verifiedAmharicForSourceName(en), am, en)

// Every verified pair, both languages. Source volumes of the English edition have no database Amharic name.
for (const entry of VERIFIED_BOOK_NAMES) {
  const source = { source_name_en: entry.en, source_name_am: null }
  assert.equal(displaySourceName(source, 'am', 1), entry.am, `${entry.en} am`)
  assert.equal(displaySourceName(source, 'en', 1), entry.en, `${entry.en} en`)
  // The list is authoritative over a conflicting database label; OCR-flagged entries never override one.
  const expectedWithDb = entry.status === 'db-corroborated' ? 'DB-አማርኛ' : entry.am
  assert.equal(displaySourceName({ ...source, source_name_am: 'DB-አማርኛ' }, 'am', 1), expectedWithDb, `${entry.en} vs database label`)
}
assert.equal(displaySourceName({ source_name_en: 'Unlisted Book', source_name_am: null }, 'am', 7), 'Unlisted Book')
assert.equal(displaySourceName({ source_name_en: null, source_name_am: null }, 'am', 7), 'Volume 7')

// Canonical books: single-volume books fall back to the list; DB wins; combined books keep their overrides.
const canon = (slug, name_en, name_am = null) => ({ id: slug, canonical_number: 1, collection: 'old', slug, name_en, name_am, sort_order: 1 })
for (const entry of VERIFIED_BOOK_NAMES.filter((e) => !e.volume)) {
  const book = canon(entry.slug, entry.en)
  assert.equal(displayBookName(book, 'am'), entry.am, `${entry.slug} am`)
  assert.equal(displayBookName(book, 'en'), entry.en, `${entry.slug} en`)
  const expectedWithDb = entry.status === 'db-corroborated' ? 'DB-አማርኛ' : entry.am
  assert.equal(displayBookName({ ...book, name_am: 'DB-አማርኛ' }, 'am'), expectedWithDb, `${entry.slug} vs database label`)
}
for (const slug of ['samuel', 'kings', 'ezra-nehemiah', 'jeremiah-collection']) {
  assert.equal(verifiedAmharicForCanonicalSlug(slug), null, `${slug} is combined: no single list name`)
  assert.notEqual(displayBookName(canon(slug, slug), 'am'), slug)
}
// Exact conflicts between the list and the repo's database snapshot (artifacts/bible-csv). Verified list wins.
const dbCanonicalAm = Object.fromEntries(Object.values(books).map((b) => [b.slug, b.name_am]))
const dbSourceAm = Object.fromEntries(sources.filter((r) => editions[r.edition_id] === 'am').map((r) => [r.source_name_en, r.source_name_am]))
const conflicts = VERIFIED_BOOK_NAMES.filter((e) => {
  const db = e.volume ? dbSourceAm[e.en] : dbCanonicalAm[e.slug]
  return db && db !== e.am
}).map((e) => [e.en, e.volume ? dbSourceAm[e.en] : dbCanonicalAm[e.slug], e.am, e.status])
assert.deepEqual(conflicts, [
  ['Joshua', 'መጽሐፈ ኢያሱ', 'መጽሐፈ ኢያሱ ወልደ ነዌ', 'verbatim'],
  ['Judges', 'መጽሐፈ መሳፍንት', 'መጽሐፈ መሣፍንት', 'verbatim'],
  ['Lamentations', 'ሰቆቃወ ኤርምያስ', 'ሰቆቃው ኤርምያስ', 'verbatim'],
  ['Amos', 'ትንቢተ ዓሞጽ', 'ትንቢተ አሞጽ', 'verbatim'],
  ['Malachi', 'ትንቢተ ሚልክያስ', 'ትንቢተ ሚልክያ', 'verbatim'],
  ['James', 'የያዕቆን መልእክት', 'የያዕቆብ መልእክት', 'verbatim'],
  ['Revelation', 'የዮሐንስ ራዕይ', 'የዮሐንስ ራእይ', 'ocr-cleaned'],
])
// 1 Corinthians: the flagged wording equals the database wording, so it is not a conflict; it stays review-flagged.
assert.equal(dbSourceAm['1 Corinthians'], VERIFIED_BOOK_NAMES.find((e) => e.en === '1 Corinthians').am)
for (const [en, db, list] of conflicts) {
  const entry = VERIFIED_BOOK_NAMES.find((e) => e.en === en)
  const book = canon(entry.slug, en, db)
  assert.equal(displaySourceName({ source_name_en: en, source_name_am: db }, 'am', 1), list, `${en} source volume`)
  if (!entry.volume) assert.equal(displayBookName(book, 'am'), list, `${en} canonical`)
}
// James specifically: list spelling displays; database spelling is still searchable.
assert.equal(displayBookName(canon('james', 'James', 'የያዕቆን መልእክት'), 'am'), 'የያዕቆብ መልእክት')
assert.equal(displayBookName(canon('james', 'James', 'የያዕቆን መልእክት'), 'en'), 'James')
// Flagged (OCR-corrupt) entries never override the database, and only fill a gap when it is empty.
assert.equal(displayBookName(canon('first-corinthians', 'First Corinthians', 'DB-አማርኛ'), 'am'), 'DB-አማርኛ')
assert.equal(displayBookName(canon('first-corinthians', 'First Corinthians'), 'am'), '1ኛ ወደ ቆሮንቶስ ሰዎች')
assert.equal(displaySourceName({ source_name_en: '2 Samuel', source_name_am: 'DB-አማርኛ' }, 'am', 1), 'DB-አማርኛ')
assert.equal(displaySourceName({ source_name_en: '2 Samuel', source_name_am: null }, 'am', 1), 'መጽሐፈ ሳሙኤል ካልዕ')
assert.equal(verifiedAmharicForSourceName('2 Samuel'), null, 'flagged entry is not source-verified')
assert.equal(verifiedAmharicForSourceName('1 Corinthians'), null)
assert.equal(verifiedAmharicForCanonicalSlug('first-corinthians'), null)
// Books absent from the list are not invented.
for (const slug of ['sirate-tsion', 'tizaz', 'gitsew', 'abtilis', 'first-dominos', 'second-dominos', 'josephas-son-of-bengorion']) {
  assert.equal(displayBookName(canon(slug, 'English Name'), 'am'), 'English Name')
}

// Search recognizes both languages, including list spellings that differ from the database.
const pool = [
  canon('james', 'James', 'የያዕቆን መልእክት'), canon('malachi', 'Malachi', 'ትንቢተ ሚልክያስ'), canon('amos', 'Amos', 'ትንቢተ ዓሞጽ'),
  canon('samuel', 'Samuel'), canon('first-corinthians', 'First Corinthians', '1ኛ ወደ ቆሮንቶስ ሰዎች'), canon('genesis', 'Genesis'),
]
const first = (q) => matchCatalogBooks(q, pool)[0]?.slug
assert.equal(first('የያዕቆብ መልእክት'), 'james')
assert.equal(first('የያዕቆን መልእክት'), 'james')
assert.equal(first('ትንቢተ ሚልክያ'), 'malachi')
assert.equal(first('ትንቢተ አሞጽ'), 'amos')
assert.equal(first('ትንቢተ ዓሞጽ'), 'amos')
assert.equal(first('መጽሐፈ ሳሙኤል ቀዳማዊ'), 'samuel')
assert.equal(first('1 samuel'), 'samuel')
assert.equal(first('1ኛ ቆሮንጦስ'), 'first-corinthians')
assert.equal(first('ኦሪት ዘፍጥረት'), 'genesis')
assert.equal(first('genesis'), 'genesis')
assert.deepEqual(matchCatalogBooks('zzzz-not-a-book', pool), [])
assert.ok(verifiedSearchNamesForSlug('james').am.includes('የያዕቆብ መልእክት'))
console.log('Verified Ethiopian Bible book-name tests passed: 66 pairs, language switching and bilingual search.')
