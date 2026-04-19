/**
 * Normalize `src/data/chants/werb.json` to the shared chant row shape (no extra fields).
 * (Historical Mezmure-Dawit chunk paths were removed; psalm bundles use a different schema.)
 *
 * Run: node scripts/normalize-chant-json.mjs
 */
import fs from 'fs'
import path from 'path'
import { fileURLToPath } from 'url'

const __dirname = path.dirname(fileURLToPath(import.meta.url))
const root = path.join(__dirname, '..')

const ALLOWED_PRIMARY = new Set([
  'general',
  'saint',
  'mary',
  'major-holiday',
  'liturgical',
])

const ALLOWED_CONFIDENCE = new Set(['high', 'medium', 'low'])

function slugify(s) {
  if (!s || typeof s !== 'string') return ''
  return s
    .toLowerCase()
    .normalize('NFKD')
    .replace(/[\u0300-\u036f]/g, '')
    .replace(/[^a-z0-9]+/g, '-')
    .replace(/^-|-$/g, '')
}

function normalizeCategory(raw) {
  const out = {
    primary: 'general',
    majorHoliday: [],
    saints: [],
    themes: [],
    usage: [],
    season: [],
    confidence: 'medium',
  }
  if (!raw || typeof raw !== 'object') return out

  const p = raw.primary
  if (typeof p === 'string' && ALLOWED_PRIMARY.has(p)) {
    out.primary = p
  }

  for (const key of [
    'majorHoliday',
    'saints',
    'themes',
    'usage',
    'season',
  ]) {
    if (Array.isArray(raw[key])) {
      out[key] = raw[key].filter((x) => typeof x === 'string' && x.length > 0)
    }
  }

  const c = raw.confidence
  if (typeof c === 'string' && ALLOWED_CONFIDENCE.has(c)) {
    out.confidence = c
  }

  return out
}

function normalizeEntry(raw, form) {
  const id =
    typeof raw.id === 'string' && raw.id.trim()
      ? raw.id.trim()
      : slugify(raw.transliterationTitle || raw.title) || 'untitled'

  return {
    type: 'chant',
    form,
    id,
    title: typeof raw.title === 'string' ? raw.title : '',
    transliterationTitle:
      typeof raw.transliterationTitle === 'string' ? raw.transliterationTitle : '',
    lyrics: typeof raw.lyrics === 'string' ? raw.lyrics : '',
    transliterationLyrics:
      typeof raw.transliterationLyrics === 'string' ? raw.transliterationLyrics : '',
    youtubeUrl: typeof raw.youtubeUrl === 'string' ? raw.youtubeUrl : '',
    category: normalizeCategory(raw.category),
  }
}

function processFile(relPath, form) {
  const full = path.join(root, relPath)
  const text = fs.readFileSync(full, 'utf8')
  const data = JSON.parse(text)
  if (!Array.isArray(data)) {
    throw new Error(`${relPath}: expected top-level array`)
  }
  const out = data.map((row) => normalizeEntry(row, form))
  fs.writeFileSync(full, JSON.stringify(out, null, 2) + '\n', 'utf8')
  console.log(`${relPath}: normalized ${out.length} entries`)
}

processFile('src/data/chants/werb.json', 'werb')
console.log('Done.')
