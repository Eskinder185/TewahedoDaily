/**
 * Church Library structured import: parser, cleaning rules, duplicate
 * detection and the Seven Sacraments collection round trip.
 * Run: npm run test:church-library-structured
 */
import assert from 'node:assert/strict'
import fs from 'node:fs'
import path from 'node:path'
import { buildImportPreview, contentHash, hasBlockingIssues, parseFrontmatter } from '../src/lib/churchLibrary/structuredImport'
import { foldAmharic, highlightFolded } from '../src/lib/churchLibrary/amharicFold'

let passed = 0
const failures: string[] = []
function test(name: string, fn: () => void) {
  try {
    fn()
    passed++
    console.log(`✓ ${name}`)
  } catch (e) {
    failures.push(name)
    console.log(`✗ ${name}\n    ${(e as Error).message.split('\n').slice(0, 4).join('\n    ')}`)
  }
}

const ROOT = 'content/church-library/seven-sacraments'
const read = (p: string) => fs.readFileSync(path.join(ROOT, p), 'utf8')
const manifest = JSON.parse(read('manifest.json'))
const files = ['am', 'en', 'review'].flatMap((dir) =>
  fs.readdirSync(path.join(ROOT, dir)).map((f) => ({ name: `${dir}/${f}`, text: read(`${dir}/${f}`) })),
)
files.push({ name: 'manifest.json', text: read('manifest.json') })
const preview = buildImportPreview(files)
const am = preview.payloads.find((p) => p.book.language === 'am')!
const en = preview.payloads.find((p) => p.book.language === 'en')!

test('Seven Sacraments: two editions (Amharic, English) in one collection, no blocking issues', () => {
  assert.equal(preview.payloads.length, 2)
  assert.ok(am && en)
  assert.equal(am.book.slug, 'seven-sacraments-am')
  assert.equal(en.book.slug, 'seven-sacraments-en')
  assert.equal(am.book.collection_key, 'seven-sacraments')
  assert.equal(am.book.title, 'ምሥጢራተ ቤተ ክርስቲያን')
  assert.equal(en.book.title, 'The Seven Sacraments')
  assert.equal(hasBlockingIssues(preview), false, preview.issues.filter((i) => i.level === 'error').map((i) => i.message).join('; '))
})

test('review material (unreadable annex, source contents) is never imported', () => {
  assert.ok(preview.issues.some((i) => i.file === 'review/am-unreadable-source-annex.md' && /not publishable/.test(i.message)))
  assert.ok(!am.passages.some((p) => p.content.includes('ቤ-ግ0')))
})

test('paragraph and section counts match the manifest exactly', () => {
  assert.equal(am.passages.length, manifest.counts.am.paragraphs)
  assert.equal(en.passages.length, manifest.counts.en.paragraphs)
  const manifestAmIds = manifest.chapters.flatMap((c: { sections: { am: { paragraph_ids: string[] }[] } }) => c.sections.am.flatMap((s) => s.paragraph_ids))
  assert.deepEqual(am.passages.map((p) => p.key), manifestAmIds)
  assert.equal(am.sections.filter((s) => s.level === 1).length, 9)
  assert.equal(en.sections.filter((s) => s.level === 1).length, 8)
})

test('every Amharic source content line survives verbatim (multiset), markers excepted', () => {
  const src = fs.readFileSync(path.join(ROOT, 'sources/am-original.txt'), 'utf8').split('\n')
  const tocStart = src.findIndex((l) => l.trim() === 'ማውጫ')
  let annex = src.length
  src.forEach((l, i) => { if (l.trim() === 'አባሪ የማይነበቡ የምንጭ ክፍሎች') annex = i })
  const headings = new Set(am.sections.map((s) => s.source_heading).filter(Boolean))
  const tocEnd = src.findIndex((l, i) => i > tocStart && l.trim() === 'አባሪ የማይነበቡ የምንጭ ክፍሎች')
  const expected = [...src.slice(0, tocStart), ...src.slice(tocEnd + 1, annex)]
    .map((l) => l.trim().replace(/\s*〔[^〕]*〕\s*/gu, ' ').replace(/[ \t]{2,}/g, ' ').trim())
    .filter((l) => l && !headings.has(l))
  const got = am.passages.map((p) => p.content)
  const count = (xs: string[]) => xs.reduce((m, x) => m.set(x, (m.get(x) || 0) + 1), new Map<string, number>())
  assert.deepEqual(count(got), count(expected))
})

test('review markers are removed from text but kept on the paragraph', () => {
  const p = am.passages.find((x) => x.key === 'SS-001-S001-P001')!
  assert.ok(!p.content.includes('〔'))
  assert.deepEqual(p.review_notes, ['〔ለግምገማ፦ ቤ-07〕'])
})

test('English: entity artifact absent; Ordination keeps its verified heading and sub-ranks', () => {
  assert.ok(!en.passages.some((p) => /&#x/i.test(p.content)))
  const orders = en.sections.find((s) => s.key === 'SS-005')!
  assert.equal(orders.title, 'Ordination (ሚስጥረ ክህነት)')
  const ranks = en.sections.filter((s) => s.parent_key === 'SS-005' && s.title).map((s) => s.title)
  assert.deepEqual(ranks, ['1. Deacon (ዲያቆን)', '2. Priest (ካህን - Kahini)', '3. Bishop (ጳጳስ - Papasi)'])
})

test('quotations and lists are typed without changing their words', () => {
  const q = am.passages.find((p) => p.block_type === 'quotation')!
  assert.ok(q.content.startsWith('«'))
  assert.ok(am.passages.some((p) => p.block_type === 'list_item' && /^\d+\. /.test(p.content)))
})

test('IDs: unique per edition; no paragraph ID shared across languages', () => {
  for (const p of [am, en]) assert.equal(new Set(p.passages.map((x) => x.key)).size, p.passages.length)
  const shared = am.passages.filter((p) => en.passages.some((q) => q.key === p.key))
  assert.equal(shared.length, 0)
})

// ----------------------------------------------------------- unit cases ----
test('frontmatter: quoted strings and nulls', () => {
  const { meta, body } = parseFrontmatter('---\nid: "SS-9"\ntitle: "ሀ: ለ"\nx: null\n---\n# T\n')
  assert.equal(meta.id, 'SS-9')
  assert.equal(meta.title, 'ሀ: ለ')
  assert.equal(meta.x, '')
  assert.equal(body, '# T\n')
})

test('auto IDs, page markers, entities and review notes', () => {
  const pv = buildImportPreview([{ name: 'x.md', text: '---\nsubject: demo\nlanguage: en\nid: D-1\n---\n# Chapter {#D-1}\n<!-- page: 12 -->\n## Part\nA&#x20;B 〔note〕\n\n> «Quote» Jn 3:5\n' }])
  const p = pv.payloads[0]
  assert.equal(p.sections[1].key, 'D-1-S001')
  assert.equal(p.passages[0].key, 'D-1-S001-P001')
  assert.equal(p.passages[0].content, 'A B')
  assert.equal(p.passages[0].page_start, 12)
  assert.deepEqual(p.passages[0].review_notes, ['〔note〕'])
  assert.equal(p.passages[1].block_type, 'quotation')
  assert.equal(p.passages[1].content, '«Quote» Jn 3:5')
  assert.equal(pv.stats.entitiesDecoded, 1)
})

test('duplicates: repeated text kept and reported; existing hashes and slugs flagged', () => {
  const text = '---\nsubject: dup\nlanguage: am\n---\n# ም {#C-1}\nሰላም ለኪ።\n\nሰላም ለኪ።\n'
  const pv = buildImportPreview([{ name: 'a.md', text }], { existingHashes: new Set([contentHash('ሰላም ለኪ።')]), existingSlugs: new Set(['dup-am']) })
  assert.equal(pv.payloads[0].passages.length, 2)
  assert.equal(pv.stats.duplicateParagraphsWithinImport, 1)
  assert.equal(pv.stats.duplicateParagraphsExisting, 2)
  assert.ok(hasBlockingIssues(pv), 'existing slug must block')
})

test('JSON payloads import directly; invalid JSON is an error', () => {
  const payload = { book: { slug: 'j-am', title: 'J', language: 'am' }, sections: [], passages: [{ key: 'P1', section_key: null, block_type: 'paragraph', content: 'ሀ', content_hash: 'x', page_start: null, page_end: null, review_notes: [] }] }
  const pv = buildImportPreview([{ name: 'p.json', text: JSON.stringify(payload) }, { name: 'bad.json', text: '{' }])
  assert.equal(pv.payloads.length, 1)
  assert.ok(pv.issues.some((i) => i.level === 'error' && /Invalid JSON/.test(i.message)))
})

test('Amharic folding: interchangeable letters and punctuation', () => {
  assert.equal(foldAmharic('ሐዋርያት'), foldAmharic('ሀዋርያት'))
  assert.equal(foldAmharic('ኀጢአት'), foldAmharic('ሀጢአት'))
  assert.equal(foldAmharic('ሠላም'), foldAmharic('ሰላም'))
  assert.equal(foldAmharic('ዐቢይ'), foldAmharic('አቢይ'))
  assert.equal(foldAmharic('ፀሎት'), foldAmharic('ጸሎት'))
  assert.equal(foldAmharic('ዮሐ 3፥16።'), 'ዮሀ 3:16')
  assert.equal(foldAmharic('Holy  SPIRIT'), 'holy spirit')
})

test('highlighting maps folded matches back to the original letters', () => {
  const parts = highlightFolded('ኃጢአት ይሰረያል', 'ሀጢአት')
  assert.deepEqual(parts.filter((p) => p.match).map((p) => p.text), ['ኃጢአት'])
  assert.equal(parts.map((p) => p.text).join(''), 'ኃጢአት ይሰረያል')
})

console.log(`\n${passed} passed, ${failures.length} failed`)
if (failures.length) process.exit(1)
