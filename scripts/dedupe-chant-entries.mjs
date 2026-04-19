/**
 * Collapse duplicate `id` across mezmure-dawit chunks — keep richest row (longest lyrics, then extras).
 * Preserves first-seen order of unique ids and rewrites chunks in order (25+25+… last remainder).
 */
import fs from 'fs'
import path from 'path'
import { fileURLToPath } from 'url'

const __dirname = path.dirname(fileURLToPath(import.meta.url))
const root = path.join(__dirname, '..')
const dir = path.join(root, 'src/data/tselot/mezmure-dawit')

const CHUNK_NAMES = [
  'mezmure-dawit-001-025.json',
  'mezmure-dawit-026-050.json',
  'mezmure-dawit-051-075.json',
  'mezmure-dawit-076-100.json',
  'mezmure-dawit-101-125.json',
  'mezmure-dawit-126-150.json',
]

function score(e) {
  const L = (e.lyrics || '').length
  const T = (e.transliterationLyrics || '').length
  const y = e.youtubeUrl ? 1 : 0
  return L * 10000 + T * 10 + y
}

function better(a, b) {
  return score(a) >= score(b) ? a : b
}

/** @type {unknown[]} */
const list = []
for (const name of CHUNK_NAMES) {
  const file = path.join(dir, name)
  if (!fs.existsSync(file)) {
    console.warn(`skip missing ${name}`)
    continue
  }
  const part = JSON.parse(fs.readFileSync(file, 'utf8'))
  if (!Array.isArray(part)) throw new Error(`${name}: expected array`)
  list.push(...part)
}

const order = []
const best = new Map()

for (const e of list) {
  const id = e.id
  if (!best.has(id)) {
    order.push(id)
    best.set(id, e)
  } else {
    best.set(id, better(best.get(id), e))
  }
}

const out = order.map((id) => best.get(id))

let offset = 0
for (let i = 0; i < CHUNK_NAMES.length; i++) {
  const take = i < 5 ? 25 : Math.max(0, out.length - offset)
  const chunk = out.slice(offset, offset + take)
  offset += chunk.length
  const file = path.join(dir, CHUNK_NAMES[i])
  fs.writeFileSync(file, JSON.stringify(chunk, null, 2) + '\n', 'utf8')
  console.log(`${CHUNK_NAMES[i]}: ${chunk.length} entries`)
}

console.log(`mezmure-dawit: ${list.length} -> ${out.length} unique entries`)
