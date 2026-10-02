import { readFileSync, writeFileSync, mkdirSync, copyFileSync } from 'fs'
import { createClient } from '@supabase/supabase-js'

function loadEnv(path) {
  try {
    return Object.fromEntries(
      readFileSync(path, 'utf8')
        .split(/\r?\n/)
        .filter((l) => l && !l.startsWith('#') && l.includes('='))
        .map((l) => {
          const i = l.indexOf('=')
          return [l.slice(0, i).trim(), l.slice(i + 1).trim().replace(/^["']|["']$/g, '')]
        }),
    )
  } catch {
    return {}
  }
}

/** Minimal CSV parser for quoted RFC4180-ish rows. */
function parseCsv(text) {
  const rows = []
  let row = []
  let cell = ''
  let i = 0
  let inQuotes = false
  const src = text.replace(/^\uFEFF/, '')
  while (i < src.length) {
    const ch = src[i]
    if (inQuotes) {
      if (ch === '"') {
        if (src[i + 1] === '"') {
          cell += '"'
          i += 2
          continue
        }
        inQuotes = false
        i += 1
        continue
      }
      cell += ch
      i += 1
      continue
    }
    if (ch === '"') {
      inQuotes = true
      i += 1
      continue
    }
    if (ch === ',') {
      row.push(cell)
      cell = ''
      i += 1
      continue
    }
    if (ch === '\n' || (ch === '\r' && src[i + 1] === '\n')) {
      row.push(cell)
      rows.push(row)
      row = []
      cell = ''
      i += ch === '\r' ? 2 : 1
      continue
    }
    if (ch === '\r') {
      row.push(cell)
      rows.push(row)
      row = []
      cell = ''
      i += 1
      continue
    }
    cell += ch
    i += 1
  }
  if (cell.length || row.length) {
    row.push(cell)
    rows.push(row)
  }
  const header = rows[0]
  return rows.slice(1).filter((r) => r.some((v) => v.trim())).map((r) => Object.fromEntries(header.map((h, idx) => [h, r[idx] ?? ''])))
}

const env = { ...loadEnv('.env'), ...loadEnv('.env.import') }
const url = env.SUPABASE_URL || env.VITE_SUPABASE_URL
const key = env.SUPABASE_SERVICE_ROLE_KEY
if (!url || !key) {
  console.error('Missing SUPABASE_URL / SUPABASE_SERVICE_ROLE_KEY in .env.import')
  process.exit(1)
}

const srcDir = 'C:/Users/eskew/Documents/Codex/2026-10-01/cr/outputs'
const dataDir = new URL('../data/prayer-learning/', import.meta.url)
mkdirSync(dataDir, { recursive: true })
for (const name of [
  'prayer_learning_collections.csv',
  'prayer_learning_sections.csv',
  'prayer_learning_content.csv',
]) {
  copyFileSync(`${srcDir}/${name}`, new URL(name, dataDir))
}

const collections = parseCsv(readFileSync(new URL('prayer_learning_collections.csv', dataDir), 'utf8'))
const sections = parseCsv(readFileSync(new URL('prayer_learning_sections.csv', dataDir), 'utf8'))
const content = parseCsv(readFileSync(new URL('prayer_learning_content.csv', dataDir), 'utf8'))

console.log({
  collections: collections.length,
  sections: sections.length,
  content: content.length,
  styles: Object.fromEntries(
    [...new Set(sections.map((s) => s.display_style))].map((k) => [
      k,
      sections.filter((s) => s.display_style === k).length,
    ]),
  ),
  parents: sections.filter((s) => s.parent_section_slug).map((s) => `${s.section_slug}->${s.parent_section_slug}`),
  kinds: Object.fromEntries(
    [...new Set(content.map((c) => c.content_kind))].map((k) => [
      k,
      content.filter((c) => c.content_kind === k).length,
    ]),
  ),
})

const publish = process.argv.includes('--publish')
const status = publish ? 'published' : 'draft'

const sb = createClient(url, key, { auth: { persistSession: false } })

const collectionRows = collections.map((r) => ({
  collection_slug: r.collection_slug,
  title_english: r.title_english,
  title_amharic: r.title_amharic || null,
  description_english: r.description_english || null,
  description_amharic: r.description_amharic || null,
  sort_order: Number(r.sort_order) || 0,
  display_style: r.display_style || null,
  status,
}))

const sectionRows = sections.map((r) => ({
  section_slug: r.section_slug,
  collection_slug: r.collection_slug,
  parent_section_slug: r.parent_section_slug || null,
  sort_order: Number(r.sort_order) || 0,
  title_english: r.title_english,
  title_amharic: r.title_amharic || null,
  summary_english: r.summary_english || null,
  summary_amharic: r.summary_amharic || null,
  content_type: r.content_type || null,
  display_style: r.display_style || null,
  show_in_contents: String(r.show_in_contents).toLowerCase() !== 'false',
  step_number: r.step_number ? Number(r.step_number) : null,
  is_expandable: String(r.is_expandable).toLowerCase() === 'true',
  status,
  review_status: r.review_status || 'draft',
  review_note: r.review_note || null,
}))

const contentRows = content.map((r) => ({
  content_id: r.content_id,
  section_slug: r.section_slug,
  content_order: Number(r.content_order) || 0,
  content_kind: r.content_kind || 'body',
  language: r.language,
  heading: r.heading || null,
  body: r.body || null,
  source_reference: r.source_reference || null,
  review_status: r.review_status || 'draft',
  review_note: r.review_note || null,
  status,
}))

for (const [table, rows, onConflict] of [
  ['prayer_learning_collections', collectionRows, 'collection_slug'],
  ['prayer_learning_sections', sectionRows, 'section_slug'],
  ['prayer_learning_content', contentRows, 'content_id'],
]) {
  const { error } = await sb.from(table).upsert(rows, { onConflict })
  if (error) {
    console.error('upsert failed', table, error)
    process.exit(1)
  }
  console.log('upserted', table, rows.length, 'status=', status)
}

writeFileSync(
  new URL('import-summary.json', dataDir),
  JSON.stringify(
    {
      importedAt: new Date().toISOString(),
      status,
      collections: collections.length,
      sections: sections.length,
      content: content.length,
    },
    null,
    2,
  ),
)
console.log('done')
