/** Validate the generated Church History Markdown with the production importer parser. */
import assert from 'node:assert/strict'
import fs from 'node:fs'
import path from 'node:path'
import { buildImportPreview, hasBlockingIssues } from '../src/lib/churchLibrary/structuredImport'

const root = path.resolve('content/church-library/church-history')
const collections = ['world-history', 'ethiopia-history']

for (const collection of collections) {
  const base = path.join(root, collection)
  const files = ['am', 'en'].flatMap((language) =>
    fs.readdirSync(path.join(base, language))
      .filter((name) => name.endsWith('.md'))
      .map((name) => ({
        name: `${language}/${name}`,
        text: fs.readFileSync(path.join(base, language, name), 'utf8'),
      })),
  )
  files.push({ name: 'manifest.json', text: fs.readFileSync(path.join(base, 'manifest.json'), 'utf8') })
  const preview = buildImportPreview(files)
  const errors = preview.issues.filter((issue) => issue.level === 'error')
  assert.equal(hasBlockingIssues(preview), false, JSON.stringify(errors, null, 2))
  assert.equal(preview.payloads.length, 2)
  const am = preview.payloads.find((payload) => payload.book.language === 'am')!
  const en = preview.payloads.find((payload) => payload.book.language === 'en')!
  assert.ok(am && en)
  assert.deepEqual(am.sections.map((section) => section.key), en.sections.map((section) => section.key))
  assert.deepEqual(am.passages.map((passage) => passage.key), en.passages.map((passage) => passage.key))
  assert.ok(am.passages.every((passage) => passage.content.trim()))
  assert.ok(en.passages.every((passage) => passage.content.trim()))
  const chapterCount = am.sections.filter((section) => section.level === 1).length
  const sectionCount = am.sections.filter((section) => section.level > 1).length
  console.log(`✓ ${collection}: ${chapterCount} chapters, ${sectionCount} sections, ${am.passages.length} aligned paragraphs per language`)
}

console.log('✓ Church History collections pass production importer parsing and bilingual ID alignment')
