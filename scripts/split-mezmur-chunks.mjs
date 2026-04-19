/**
 * Split src/data/mezmur.json into src/data/tselot/mezmure-dawit/mezmure-dawit-*.json chunks.
 * Run once after consolidating, or after editing a single merged export.
 */
import fs from 'fs'
import path from 'path'
import { fileURLToPath } from 'url'

const __dirname = path.dirname(fileURLToPath(import.meta.url))
const root = path.join(__dirname, '..')
const src = path.join(root, 'src/data/mezmur.json')
const outDir = path.join(root, 'src/data/tselot/mezmure-dawit')

const CHUNK_NAMES = [
  'mezmure-dawit-001-025.json',
  'mezmure-dawit-026-050.json',
  'mezmure-dawit-051-075.json',
  'mezmure-dawit-076-100.json',
  'mezmure-dawit-101-125.json',
  'mezmure-dawit-126-150.json',
]

const list = JSON.parse(fs.readFileSync(src, 'utf8'))
if (!Array.isArray(list)) throw new Error('mezmur.json: expected array')

fs.mkdirSync(outDir, { recursive: true })
let offset = 0
for (let i = 0; i < CHUNK_NAMES.length; i++) {
  const take = i < 5 ? 25 : Math.max(0, list.length - offset)
  const chunk = list.slice(offset, offset + take)
  offset += chunk.length
  const file = path.join(outDir, CHUNK_NAMES[i])
  fs.writeFileSync(file, JSON.stringify(chunk, null, 2) + '\n', 'utf8')
  console.log(`${CHUNK_NAMES[i]}: ${chunk.length} entries`)
}
console.log(`Total: ${list.length} (offset end ${offset})`)
