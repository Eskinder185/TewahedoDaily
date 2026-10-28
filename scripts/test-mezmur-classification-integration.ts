import assert from 'node:assert/strict'
import fs from 'node:fs'
import path from 'node:path'

type Row = Record<string, string>

function parseCsv(input: string): Row[] {
  const rows: string[][] = []
  let row: string[] = []
  let cell = ''
  let quoted = false
  const text = input.replace(/^\uFEFF/, '')
  for (let i = 0; i < text.length; i += 1) {
    const char = text[i]
    if (quoted) {
      if (char === '"' && text[i + 1] === '"') { cell += '"'; i += 1 }
      else if (char === '"') quoted = false
      else cell += char
    } else if (char === '"') quoted = true
    else if (char === ',') { row.push(cell); cell = '' }
    else if (char === '\n' || char === '\r') {
      if (char === '\r' && text[i + 1] === '\n') i += 1
      row.push(cell); rows.push(row); row = []; cell = ''
    } else cell += char
  }
  if (cell || row.length) { row.push(cell); rows.push(row) }
  const [header = [], ...body] = rows.filter((cells) => cells.some(Boolean))
  return body.map((cells) => Object.fromEntries(header.map((name, index) => [name, cells[index] ?? ''])))
}

const root = process.cwd()
const reportDir = path.join(root, 'reports', 'mezmur-alias-classification')
const readCsv = (name: string) => parseCsv(fs.readFileSync(path.join(reportDir, name), 'utf8'))

const source = readCsv('mezmur_alias_classification.csv')
const reconciliation = readCsv('classification_database_reconciliation.csv')
const categories = readCsv('category_relationship_changes.csv')
const occasions = readCsv('occasion_relationship_changes.csv')
const manual = readCsv('classification_manual_review.csv')
const sql = fs.readFileSync(path.join(reportDir, 'safe_classification_import.sql'), 'utf8')

assert.equal(source.length, 2092)
assert.equal(reconciliation.length, source.length)
assert.equal(new Set(reconciliation.map((row) => row.import_id)).size, source.length)
assert.equal(
  reconciliation.filter((row) => row.integration_status === 'ready_for_add_only_reconciliation').length + manual.length,
  source.length,
)

const lowIds = new Set(source.filter((row) => row.classification_confidence === 'LOW').map((row) => row.import_id))
const unclassifiedIds = new Set(source.filter((row) => !row.category.trim()).map((row) => row.import_id))
const stagedIds = new Set([...categories, ...occasions].map((row) => row.import_id))
assert.equal(lowIds.size, 754)
assert.equal(unclassifiedIds.size, 428)
assert.equal([...lowIds].some((id) => stagedIds.has(id)), false)
assert.equal([...unclassifiedIds].some((id) => stagedIds.has(id)), false)
assert.equal(categories.some((row) => row.removal_proposed !== 'false'), false)
assert.equal(occasions.some((row) => row.removal_proposed !== 'false'), false)
assert.equal(new Set(categories.map((row) => `${row.import_id}:${row.category_slug}`)).size, categories.length)
assert.equal(new Set(occasions.map((row) => `${row.import_id}:${row.occasion_slug}`)).size, occasions.length)

assert.match(sql, /begin;/i)
assert.match(sql, /rollback;/i)
assert.doesNotMatch(sql, /\bcommit\s*;/i)
assert.doesNotMatch(sql, /\bdelete\s+from\b/i)
assert.doesNotMatch(sql, /\bupdate\s+public\.mezmur_data_import\b/i)
assert.doesNotMatch(sql, /proposed_primary_category|supporting_lyric_excerpt|classification_reason/i)
assert.match(sql, /on conflict \(mezmur_import_id,category_slug\) do nothing/i)
assert.match(sql, /on conflict \(mezmur_import_id,occasion_slug\) do nothing/i)
assert.match(sql, /for update of m/i)
assert.match(sql, /create or replace view public\.mezmur_category_links_public/i)
assert.match(sql, /create or replace view public\.mezmur_occasion_links_public/i)
assert.match(sql, /count\(\*\).*public\.mezmur_public px/is)
assert.match(sql, /join public\.mezmur_data_import m on m\.import_id=l\.mezmur_import_id/i)

console.log(`Classification integration checks passed: ${reconciliation.length} reconciled, ${stagedIds.size} safely staged, ${manual.length} held.`)
