import assert from 'node:assert/strict'
import { readFileSync } from 'node:fs'
import { resolve } from 'node:path'
import { buildRows, loadPassages } from './import-church-library-passages.mjs'

const root = resolve('.')
const sourcePath = resolve(root, 'data/church-library/faith-and-order/church_faith_and_order_search.jsonl')
const sectionPath = resolve(root, 'data/church-library/faith-and-order/church_faith_and_order_sections.json')
const goldPath = resolve(root, 'data/church-library/faith-and-order/church_faith_and_order_retrieval_benchmark.json')
const migrationPath = resolve(root, 'supabase/migrations/20261028130000_church_library_jsonl_hybrid_search.sql')

const originals = readFileSync(sourcePath, 'utf8').split(/\r?\n/u).filter(Boolean).map((line) => JSON.parse(line))
const refined = loadPassages(sourcePath)
const sections = JSON.parse(readFileSync(sectionPath, 'utf8'))
const { passageRows } = buildRows(refined, sections, { bookId: 'book', versionId: 'version' })
const normalize = (value: string) => value.replace(/\s+/gu, ' ').trim()

for (const original of originals) {
  const chunks = refined.filter((row) => row.parent_passage_id === original.passage_id || row.passage_id === original.passage_id)
  assert.ok(chunks.length > 0, `chunks retained for ${original.passage_id}`)
  assert.equal(normalize(chunks.map((row) => row.content).join('\n\n')), normalize(original.content), `text preserved for ${original.passage_id}`)
}
assert.equal(new Set(refined.map((row) => row.source_passage_id)).size, refined.length, 'stable source locators are unique')
assert.ok(passageRows.every(({ row }) => row.source_passage_id), 'database rows preserve source locator')

const gold = JSON.parse(readFileSync(goldPath, 'utf8'))
assert.ok(gold.length >= 30, 'benchmark has at least 30 reviewed questions')

const sql = readFileSync(migrationPath, 'utf8')
for (const required of [
  'source_passage_id', 'search_church_library', 'exact_ranked', 'lexical_ranked',
  'semantic_ranked', 'fused', 'church_library_passage_context',
  'church_library_public_search_status', 'public_retrieval_enabled=true',
  "rights_status in ('owned','licensed','public_domain','permission_granted')",
]) assert.ok(sql.toLowerCase().includes(required.toLowerCase()), `migration contains ${required}`)
assert.doesNotMatch(sql, /grant\s+(?:insert|update|delete|all).*\s+to\s+anon/iu, 'no anonymous write grant')

console.log(`Church Library JSONL retrieval checks passed: ${originals.length} source passages → ${refined.length} natural chunks; ${gold.length} benchmark questions.`)
