/**
 * Sync public.search_documents from live import / zemari / prayer tables + route catalog.
 * Uses publishable key for reads; writes require SUPABASE_SERVICE_ROLE_KEY in .env.import.
 *
 * Usage: node scripts/sync-search-index.mjs
 *        node scripts/sync-search-index.mjs --dry-run
 */
import { createClient } from '@supabase/supabase-js'
import { readFileSync, existsSync, writeFileSync, mkdirSync } from 'node:fs'
import { dirname, join } from 'node:path'
import { fileURLToPath } from 'node:url'

const __dirname = dirname(fileURLToPath(import.meta.url))
const root = join(__dirname, '..')
const dryRun = process.argv.includes('--dry-run')

function loadEnv(path) {
  const out = {}
  if (!existsSync(path)) return out
  for (const line of readFileSync(path, 'utf8').split(/\r?\n/)) {
    if (line.startsWith('#') || !line.includes('=')) continue
    const eq = line.indexOf('=')
    const name = line.slice(0, eq).trim()
    let val = line.slice(eq + 1).trim()
    if (
      (val.startsWith('"') && val.endsWith('"')) ||
      (val.startsWith("'") && val.endsWith("'"))
    ) {
      val = val.slice(1, -1)
    }
    out[name] = val
  }
  return out
}

const env = { ...loadEnv(join(root, '.env.local')), ...loadEnv(join(root, '.env.import')) }
const url = env.SUPABASE_URL || env.VITE_SUPABASE_URL
const anon = env.VITE_SUPABASE_PUBLISHABLE_KEY || env.VITE_SUPABASE_ANON_KEY
const service = env.SUPABASE_SERVICE_ROLE_KEY || env.SUPABASE_SECRET_KEY

if (!url || !anon) {
  console.error('Missing VITE_SUPABASE_URL / publishable key')
  process.exit(1)
}

const reader = createClient(url, anon)
const writer = service ? createClient(url, service, { auth: { persistSession: false } }) : null

const pages = [
  { source_type: 'page', source_id: 'home', title: 'Home', route: '/', search_priority: 10, summary: 'Tewahedo Daily home' },
  { source_type: 'page', source_id: 'hymns', title: 'Hymns Practice', route: '/practice', search_priority: 100, summary: 'Browse and practice Mezmurs', search_keywords: 'hymns mezmur songs practice መዝሙር' },
  { source_type: 'page', source_id: 'zemaris', title: 'Zemari Library', route: '/practice/zemaris', search_priority: 90, summary: 'Singers and choirs', search_keywords: 'zemari singer choir ዘማሪ' },
  { source_type: 'page', source_id: 'pray', title: 'Pray', route: '/pray', search_priority: 100, summary: 'Prayer collections', search_keywords: 'pray prayer tselot ጸሎት' },
  { source_type: 'guide', source_id: 'learn-how-to-pray', title: 'Learn How to Pray', route: '/pray/learn-how-to-pray', search_priority: 95, summary: 'Guided prayer learning', search_keywords: 'learn how to pray prayer guide' },
  { source_type: 'calendar', source_id: 'calendar', title: 'Calendar', route: '/calendar', search_priority: 100, summary: 'Feasts, fasts, observances', search_keywords: 'calendar fasting feast orthodox' },
  { source_type: 'page', source_id: 'today', title: 'Today in the Church', route: '/today', search_priority: 70, summary: 'Daily Church remembrance' },
  { source_type: 'page', source_id: 'about', title: 'About', route: '/about', search_priority: 40, summary: 'About Tewahedo Daily' },
  { source_type: 'account', source_id: 'saved', title: 'Saved / Favorites', route: '/saved', search_priority: 60, summary: 'Saved hymns and prayers' },
]

/** @type {Array<Record<string, unknown>>} */
const docs = [...pages]

async function pull(table, select, mapRow) {
  const { data, error } = await reader.from(table).select(select).limit(2000)
  if (error) {
    console.warn('skip', table, error.message)
    return
  }
  for (const row of data || []) {
    const mapped = mapRow(row)
    if (mapped?.route && mapped?.title) docs.push(mapped)
  }
}

await pull(
  'mezmur_data_import',
  'mezmur_id, slug, title, title_amharic, description, image_path, status, search_keywords',
  (row) => {
    const status = String(row.status || '').toLowerCase()
    if (status && ['draft', 'archived', 'hidden', 'rejected', 'deleted'].includes(status)) return null
    return {
      source_type: 'mezmur',
      source_id: row.mezmur_id || row.slug,
      slug: row.slug,
      title: row.title || row.slug,
      title_amharic: row.title_amharic || null,
      summary: row.description || null,
      search_keywords: Array.isArray(row.search_keywords)
        ? row.search_keywords.join(' ')
        : row.search_keywords || null,
      route: `/practice/mezmur/${row.slug}`,
      image_path: row.image_path || null,
      search_priority: 40,
      is_public: true,
    }
  },
)

await pull('zemaris', 'id, slug, name, name_amharic, bio, image_path, status', (row) => {
  if (String(row.status || '') !== 'published') return null
  return {
    source_type: 'zemari',
    source_id: row.id,
    slug: row.slug,
    title: row.name,
    title_amharic: row.name_amharic || null,
    summary: row.bio || null,
    route: `/practice/zemari/${row.slug}`,
    image_path: row.image_path || null,
    search_priority: 55,
    is_public: true,
  }
})

await pull(
  'mezmur_collections_import',
  'collection_id, collection_slug, title, title_amharic, description, image_path, status',
  (row) => {
    if (String(row.status || '') === 'draft' || String(row.status || '') === 'archived') return null
    const slug = row.collection_slug
    if (!slug) return null
    return {
      source_type: 'hymn_collection',
      source_id: row.collection_id || slug,
      slug,
      title: row.title || slug,
      title_amharic: row.title_amharic || null,
      summary: row.description || null,
      route: `/practice/browse/${slug}`,
      image_path: row.image_path || null,
      search_priority: 50,
      is_public: true,
    }
  },
)

await pull('prayer_collections', 'id, slug, title, title_amharic, description, status', (row) => {
  if (row.status && row.status !== 'published') return null
  return {
    source_type: 'prayer_collection',
    source_id: row.id,
    slug: row.slug,
    title: row.title,
    title_amharic: row.title_amharic || null,
    summary: row.description || null,
    route: `/pray/${row.slug}`,
    search_priority: 50,
    is_public: true,
  }
})

const outDir = join(root, 'src/content/search')
mkdirSync(outDir, { recursive: true })
const snapshotPath = join(outDir, 'search-index-snapshot.json')
writeFileSync(snapshotPath, JSON.stringify({ generatedAt: new Date().toISOString(), count: docs.length, docs }, null, 2))
console.log('snapshot', snapshotPath, 'count', docs.length)

if (dryRun) {
  console.log('dry-run: not writing to Supabase')
  process.exit(0)
}

if (!writer) {
  console.warn('No SUPABASE_SERVICE_ROLE_KEY — snapshot only. Apply FIX_SEARCH_DOCUMENTS.sql then re-run with service role to upsert.')
  process.exit(0)
}

let upserted = 0
for (let i = 0; i < docs.length; i += 100) {
  const chunk = docs.slice(i, i + 100).map((d) => ({
    ...d,
    updated_at: new Date().toISOString(),
  }))
  const { error } = await writer.from('search_documents').upsert(chunk, {
    onConflict: 'source_type,source_id,slug,route',
  })
  if (error) {
    // unique index uses coalesce expressions — fall back to insert-ignore style via delete+insert per source_type batch
    console.warn('upsert chunk failed, trying plain insert', error.message)
    const ins = await writer.from('search_documents').insert(chunk)
    if (ins.error) console.error(ins.error.message)
    else upserted += chunk.length
  } else {
    upserted += chunk.length
  }
}
console.log('upserted', upserted)
