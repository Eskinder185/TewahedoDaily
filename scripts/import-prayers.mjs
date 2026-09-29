import fs from 'node:fs/promises'
import path from 'node:path'
import process from 'node:process'
import { createClient } from '@supabase/supabase-js'

const args = new Set(process.argv.slice(2))
const apply = args.has('--apply')
const dryRun = args.has('--dry-run') || !apply

if (args.has('--apply') && args.has('--dry-run')) {
  throw new Error('Choose either --dry-run or --apply, not both.')
}

const projectRoot = process.cwd()

async function loadEnvFile(file) {
  let contents
  try {
    contents = await fs.readFile(file, 'utf8')
  } catch (error) {
    if (error?.code === 'ENOENT') return
    throw error
  }

  for (const rawLine of contents.split(/\r?\n/)) {
    const line = rawLine.trim()
    if (!line || line.startsWith('#')) continue
    const equals = line.indexOf('=')
    if (equals < 1) continue
    const key = line.slice(0, equals).trim()
    let value = line.slice(equals + 1).trim()
    if (
      (value.startsWith('"') && value.endsWith('"')) ||
      (value.startsWith("'") && value.endsWith("'"))
    ) {
      value = value.slice(1, -1)
    }
    if (process.env[key] === undefined) process.env[key] = value
  }
}

function parseCsv(text) {
  const input = text.replace(/^\uFEFF/, '')
  const rows = []
  let row = []
  let field = ''
  let quoted = false

  for (let index = 0; index < input.length; index += 1) {
    const char = input[index]
    if (quoted) {
      if (char === '"' && input[index + 1] === '"') {
        field += '"'
        index += 1
      } else if (char === '"') {
        quoted = false
      } else {
        field += char
      }
    } else if (char === '"') {
      quoted = true
    } else if (char === ',') {
      row.push(field)
      field = ''
    } else if (char === '\n') {
      row.push(field.replace(/\r$/, ''))
      if (row.some((value) => value !== '')) rows.push(row)
      row = []
      field = ''
    } else {
      field += char
    }
  }

  if (quoted) throw new Error('CSV ended inside a quoted field.')
  if (field || row.length) {
    row.push(field.replace(/\r$/, ''))
    if (row.some((value) => value !== '')) rows.push(row)
  }
  if (rows.length === 0) return []

  const headers = rows[0]
  return rows.slice(1).map((values, rowIndex) => {
    if (values.length !== headers.length) {
      throw new Error(`CSV row ${rowIndex + 2} has ${values.length} fields; expected ${headers.length}.`)
    }
    return Object.fromEntries(headers.map((header, columnIndex) => [header, values[columnIndex]]))
  })
}

async function readCsv(fileName) {
  return parseCsv(await fs.readFile(path.join(projectRoot, fileName), 'utf8'))
}

function integer(value, field, rowLabel) {
  const parsed = Number.parseInt(value, 10)
  if (!Number.isInteger(parsed)) throw new Error(`${rowLabel}: ${field} must be an integer.`)
  return parsed
}

function validateUnique(rows, key, label) {
  const seen = new Set()
  for (const row of rows) {
    const value = row[key]
    if (!value) throw new Error(`${label}: missing ${key}.`)
    if (seen.has(value)) throw new Error(`${label}: duplicate ${key} "${value}".`)
    seen.add(value)
  }
}

async function upsertBatches(table, rows, onConflict) {
  const saved = []
  for (let offset = 0; offset < rows.length; offset += 100) {
    const batch = rows.slice(offset, offset + 100)
    const { data, error } = await table.upsert(batch, { onConflict }).select()
    if (error) throw error
    saved.push(...(data ?? []))
  }
  return saved
}

await loadEnvFile(path.join(projectRoot, '.env.import'))
await loadEnvFile(path.join(projectRoot, '.env.local'))
await loadEnvFile(path.join(projectRoot, '.env'))

const [collectionRows, sectionRows, prayerRows] = await Promise.all([
  readCsv('prayer-collections-supabase.csv'),
  readCsv('prayer-sections-supabase.csv'),
  readCsv('prayers-supabase.csv'),
])

validateUnique(collectionRows, 'slug', 'prayer collections')
validateUnique(
  sectionRows.map((row) => ({ ...row, key: `${row.collection_slug}/${row.slug}` })),
  'key',
  'prayer sections',
)
validateUnique(prayerRows, 'slug', 'prayers')

const collectionSlugs = new Set(collectionRows.map((row) => row.slug))
const sectionKeys = new Set(sectionRows.map((row) => `${row.collection_slug}/${row.slug}`))
for (const row of sectionRows) {
  if (!collectionSlugs.has(row.collection_slug)) {
    throw new Error(`Section ${row.slug} references unknown collection ${row.collection_slug}.`)
  }
}
for (const row of prayerRows) {
  if (!collectionSlugs.has(row.collection_slug)) {
    throw new Error(`Prayer ${row.slug} references unknown collection ${row.collection_slug}.`)
  }
  if (row.section_slug && !sectionKeys.has(`${row.collection_slug}/${row.section_slug}`)) {
    throw new Error(`Prayer ${row.slug} references unknown section ${row.section_slug}.`)
  }
}

const plan = {
  mode: dryRun ? 'dry-run' : 'apply',
  collections: collectionRows.length,
  sections: sectionRows.length,
  prayers: prayerRows.length,
}

if (dryRun) {
  console.log(JSON.stringify(plan, null, 2))
  process.exit(0)
}

const supabaseUrl =
  process.env.SUPABASE_URL?.trim() || process.env.VITE_SUPABASE_URL?.trim()
const supabaseSecretKey =
  process.env.SUPABASE_SECRET_KEY?.trim() ||
  process.env.SUPABASE_SERVICE_ROLE_KEY?.trim()
if (!supabaseUrl || !supabaseSecretKey) {
  throw new Error(
    'SUPABASE_URL and SUPABASE_SECRET_KEY (or SUPABASE_SERVICE_ROLE_KEY) are required in .env.import for --apply.',
  )
}

const supabase = createClient(supabaseUrl, supabaseSecretKey, {
  auth: { persistSession: false, autoRefreshToken: false },
})
const publishedAt = new Date().toISOString()

const savedCollections = await upsertBatches(
  supabase.from('prayer_collections'),
  collectionRows.map((row) => ({
    slug: row.slug,
    title: row.title,
    title_amharic: row.title_amharic || null,
    description: row.description || null,
    sort_order: integer(row.sort_order, 'sort_order', row.slug),
    status: row.status,
    published_at: row.status === 'published' ? publishedAt : null,
  })),
  'slug',
)
const collectionIds = new Map(savedCollections.map((row) => [row.slug, row.id]))

const savedSections = await upsertBatches(
  supabase.from('prayer_sections'),
  sectionRows.map((row) => ({
    collection_id: collectionIds.get(row.collection_slug),
    slug: row.slug,
    title: row.title,
    title_amharic: row.title_amharic || null,
    description: row.description || null,
    sort_order: integer(row.sort_order, 'sort_order', `${row.collection_slug}/${row.slug}`),
    status: row.status,
    published_at: row.status === 'published' ? publishedAt : null,
  })),
  'collection_id,slug',
)
const sectionIds = new Map(
  savedSections.map((row) => [`${row.collection_id}/${row.slug}`, row.id]),
)

const mappedPrayers = prayerRows.map((row) => {
  const collectionId = collectionIds.get(row.collection_slug)
  const sectionId = row.section_slug
    ? sectionIds.get(`${collectionId}/${row.section_slug}`)
    : null
  if (!collectionId) throw new Error(`Collection ID not resolved for ${row.slug}.`)
  if (row.section_slug && !sectionId) throw new Error(`Section ID not resolved for ${row.slug}.`)
  return {
    slug: row.slug,
    title: row.title,
    title_amharic: row.title_amharic || null,
    text_amharic: row.text_amharic || null,
    text_english: row.text_english || null,
    text_oromo: row.text_oromo || null,
    collection_id: collectionId,
    section_id: sectionId,
    sort_order: integer(row.sort_order, 'sort_order', row.slug),
    status: row.status,
    published_at: row.status === 'published' ? publishedAt : null,
  }
})

await upsertBatches(supabase.from('prayers'), mappedPrayers, 'slug')
console.log(JSON.stringify({ ...plan, mode: 'applied' }, null, 2))
