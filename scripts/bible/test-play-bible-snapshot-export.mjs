import assert from 'node:assert/strict'
import { mkdtemp, readFile, rm } from 'node:fs/promises'
import { tmpdir } from 'node:os'
import { join } from 'node:path'
import { exportPlayBibleSnapshot } from './export-play-bible-snapshot.mjs'
const exporterSource = await readFile(new URL('./export-play-bible-snapshot.mjs', import.meta.url), 'utf8')
assert.match(exporterSource, /import \{ pathToFileURL \} from 'node:url'/)
assert.match(exporterSource, /process\.argv\[1\] && import\.meta\.url === pathToFileURL\(process\.argv\[1\]\)\.href/)

const dir = await mkdtemp(join(tmpdir(), 'td-bible-export-'))
const tables = {
  bible_editions: [{ id: 'web-id', code: 'web', is_public: true }, { id: 'am-id', code: 'am', is_public: true }],
  bible_canonical_books: [{ id: 'gen-id', slug: 'genesis' }],
  bible_source_books: [{ id: 'src-id', edition_id: 'web-id', canonical_book_id: 'gen-id' }, { id: 'am-src', edition_id: 'am-id', canonical_book_id: 'gen-id' }],
  bible_chapters: [{ id: 'ch-id', source_book_id: 'src-id', chapter_number: 1 }, { id: 'am-ch', source_book_id: 'am-src', chapter_number: 1 }],
  bible_verses: [{ chapter_id: 'ch-id', verse_number: 1, text: 'In the beginning.' }, { chapter_id: 'ch-id', verse_number: 2, text: 'The earth was formless.' }, { chapter_id: 'am-ch', verse_number: 1, text: 'በመጀመሪያ።' }],
}
const client = { from(table) {
  const state = { filters: [] }
  const chain = {
    select: () => chain,
    eq: (column, value) => { state.filters.push([column, value]); return chain },
    in: (column, values) => { state.filters.push([column, values]); return chain },
    order: () => chain,
    then: (resolve) => {
      let rows = tables[table]
      for (const [column, value] of state.filters) rows = rows.filter((row) => Array.isArray(value) ? value.includes(row[column]) : String(row[column]) === String(value))
      return Promise.resolve(resolve({ data: rows, error: null }))
    },
    range: async (start, end) => {
      let rows = tables[table]
      for (const [column, value] of state.filters) rows = rows.filter((row) => Array.isArray(value) ? value.includes(row[column]) : String(row[column]) === String(value))
      return { data: rows.slice(start, end + 1), error: null }
    },
  }
  return chain
} }
const outputPath = join(dir, 'snapshot.json')
const result = await exportPlayBibleSnapshot({ client, outputPath, bookSlugs: ['genesis'], includeAmharic: true })
assert.equal(result.verseCount, 3)
const snapshot = JSON.parse(await readFile(outputPath, 'utf8'))
assert.deepEqual(snapshot.candidates, [])
assert.equal(snapshot.verses.filter((row) => row.edition === 'web').length, 2)
assert.equal(snapshot.verses.filter((row) => row.edition === 'am').length, 1)
await assert.rejects(exportPlayBibleSnapshot({ client, outputPath, bookSlugs: ['genesis'] }), /Refusing to overwrite/)
await rm(dir, { recursive: true, force: true })
console.log('Bible snapshot exporter checks passed.')
