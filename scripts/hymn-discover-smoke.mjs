/**
 * Live smoke: catalog load + fuzzy discover without text @> filters.
 * Run: node scripts/hymn-discover-smoke.mjs
 */
import { createClient } from '@supabase/supabase-js'
import { readFileSync, existsSync } from 'node:fs'
import Fuse from 'fuse.js'

function load(file) {
  if (!existsSync(file)) return
  for (const line of readFileSync(file, 'utf8').split(/\r?\n/)) {
    const t = line.trim()
    if (!t || t.startsWith('#')) continue
    const i = t.indexOf('=')
    if (i <= 0) continue
    const k = t.slice(0, i).trim()
    let v = t.slice(i + 1).trim()
    if ((v.startsWith('"') && v.endsWith('"')) || (v.startsWith("'") && v.endsWith("'"))) v = v.slice(1, -1)
    if (!process.env[k]) process.env[k] = v
  }
}
load('.env.local')
load('.env')

function normalizeStringList(value) {
  if (value == null) return []
  if (Array.isArray(value)) return value.map(String).map((s) => s.trim()).filter(Boolean)
  if (typeof value === 'string') {
    const t = value.trim()
    if (!t) return []
    return t.split(/[|,;]+/).map((s) => s.trim()).filter(Boolean)
  }
  return []
}

function normalizeLatin(value) {
  return String(value || '')
    .normalize('NFKD')
    .replace(/[\u0300-\u036f]/g, '')
    .toLowerCase()
    .replace(/[''`´]/g, '')
    .replace(/[-_/\\]+/g, ' ')
    .replace(/[^\p{L}\p{N}\s]/gu, ' ')
    .replace(/\s+/g, ' ')
    .trim()
}

const url = process.env.VITE_SUPABASE_URL
const key = process.env.VITE_SUPABASE_ANON_KEY || process.env.VITE_SUPABASE_PUBLISHABLE_KEY
if (!url || !key) {
  console.log('NO_SUPABASE_ENV')
  process.exit(0)
}

const sb = createClient(url, key)

// Prove the broken operator still exists against live TEXT column.
const broken = await sb.from('mezmur').select('id').contains('search_keywords', ['x']).limit(1)
if (!broken.error?.message?.includes('text @>')) {
  console.warn('unexpected: contains did not fail as text @>', broken.error)
} else {
  console.log('confirmed live search_keywords is TEXT (contains/@> fails)')
}

const rows = []
for (let offset = 0; ; offset += 500) {
  const { data, error } = await sb
    .from('mezmur')
    .select(
      'id,slug,title,title_amharic,language,form,category,occasion,search_keywords,thumbnail_path,thumbnail_url,youtube_url,created_at,status',
    )
    .eq('status', 'published')
    .range(offset, offset + 499)
  if (error) throw error
  rows.push(...(data || []))
  if (!data || data.length < 500) break
}

const docs = rows.map((row) => ({
  ...row,
  titleNorm: normalizeLatin(row.title),
  keywordsText: normalizeStringList(row.search_keywords).join(' '),
}))

console.log('published mezmur loaded', docs.length)
console.log('sample keywords type', typeof rows[0]?.search_keywords, Array.isArray(rows[0]?.search_keywords))

const fuse = new Fuse(docs, {
  keys: [
    { name: 'title', weight: 0.42 },
    { name: 'titleNorm', weight: 0.22 },
    { name: 'title_amharic', weight: 0.28 },
    { name: 'keywordsText', weight: 0.12 },
  ],
  threshold: 0.42,
  ignoreLocation: true,
  includeScore: true,
})

for (const q of ['', 'baki yitfeshu', 'gabreal', 'mikael']) {
  if (!q) {
    console.log('empty search =>', docs.length, 'rows')
    continue
  }
  const hits = fuse.search(normalizeLatin(q) || q).slice(0, 3).map((h) => h.item.title)
  console.log(q, '=>', hits)
}

console.log('hymn-discover-smoke: ok')
