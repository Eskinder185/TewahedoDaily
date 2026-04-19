/**
 * Deduplicates `src/data/chants/amharic-chants.json` by `id`, keeping the **last**
 * occurrence in the file (same rule as `mezmurData.ts`). Writes stable JSON.
 *
 * Run: node scripts/dedupe-amharic-chants.mjs
 */
import fs from 'fs'
import path from 'path'
import { fileURLToPath } from 'url'

const __dirname = path.dirname(fileURLToPath(import.meta.url))
const root = path.join(__dirname, '..')
const target = path.join(root, 'src/data/chants/amharic-chants.json')

const raw = fs.readFileSync(target, 'utf8')
const data = JSON.parse(raw)
if (!Array.isArray(data)) {
  console.error('Expected top-level array')
  process.exit(1)
}

const byId = new Map()
for (const row of data) {
  if (!row || typeof row !== 'object') continue
  const id = typeof row.id === 'string' ? row.id.trim() : ''
  if (!id) {
    console.warn('Skipping row without id')
    continue
  }
  byId.set(id, row)
}

const out = [...byId.values()]
const removed = data.length - out.length
fs.writeFileSync(target, `${JSON.stringify(out, null, 2)}\n`, 'utf8')
console.log(
  `Wrote ${target}: ${out.length} unique ids (removed ${removed} duplicate row(s) from ${data.length})`,
)
