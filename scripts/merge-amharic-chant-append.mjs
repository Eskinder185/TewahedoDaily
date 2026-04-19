/**
 * Merges `scripts/amharic-chant-append.json` into `src/data/chants/amharic-chants.json`,
 * replacing any existing row with the same `id` or appending new ids. Writes UTF-8 JSON.
 *
 * Run: node scripts/merge-amharic-chant-append.mjs
 */
import fs from 'fs'
import path from 'path'
import { fileURLToPath } from 'url'

const __dirname = path.dirname(fileURLToPath(import.meta.url))
const root = path.join(__dirname, '..')
const target = path.join(root, 'src/data/chants/amharic-chants.json')
const appendPath = path.join(root, 'scripts/amharic-chant-append.json')

const main = JSON.parse(fs.readFileSync(target, 'utf8'))
const extra = JSON.parse(fs.readFileSync(appendPath, 'utf8'))
if (!Array.isArray(main) || !Array.isArray(extra)) {
  console.error('Expected arrays')
  process.exit(1)
}

const merged = [...main]
let added = 0
let replaced = 0
for (const row of extra) {
  const id = row?.id
  if (typeof id !== 'string' || !id.trim()) continue
  const i = merged.findIndex((r) => r?.id === id)
  if (i >= 0) {
    merged[i] = row
    replaced++
  } else {
    merged.push(row)
    added++
  }
}

fs.writeFileSync(target, `${JSON.stringify(merged, null, 2)}\n`, 'utf8')
console.log(
  `Merged into ${target}: ${merged.length} rows (added ${added}, replaced ${replaced} by id)`,
)
