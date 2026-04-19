/**
 * Normalizes `language` on workshop rows in `amharic-chants.json`:
 * - string[] → hyphenated string (e.g. ["amharic","geez"] → "amharic-geez")
 * - keeps valid strings as-is
 *
 * Run: node scripts/normalize-amharic-chants.mjs
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

let n = 0
for (const row of data) {
  if (!row || typeof row !== 'object') continue
  const lang = row.language
  if (Array.isArray(lang)) {
    const parts = lang.filter((x) => typeof x === 'string' && x.trim()).map((x) => x.trim())
    if (parts.length) {
      row.language = parts.join('-')
      n++
    } else {
      delete row.language
    }
  }
}

fs.writeFileSync(target, `${JSON.stringify(data, null, 2)}\n`, 'utf8')
console.log(`Wrote ${target} (${data.length} rows, normalized language on ${n} entries)`)
