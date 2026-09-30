/**
 * Offline audit of prayer seed CSVs (mirrors expected Supabase content).
 * Run: node scripts/prayer-data-audit.mjs
 */
import { readFileSync } from 'node:fs'
import { resolve } from 'node:path'

function parseCsv(text) {
  const rows = []
  let row = []
  let cell = ''
  let inQuotes = false
  for (let i = 0; i < text.length; i++) {
    const ch = text[i]
    const next = text[i + 1]
    if (inQuotes) {
      if (ch === '"' && next === '"') {
        cell += '"'
        i++
      } else if (ch === '"') {
        inQuotes = false
      } else {
        cell += ch
      }
      continue
    }
    if (ch === '"') {
      inQuotes = true
      continue
    }
    if (ch === ',') {
      row.push(cell)
      cell = ''
      continue
    }
    if (ch === '\n' || ch === '\r') {
      if (ch === '\r' && next === '\n') i++
      row.push(cell)
      if (row.some((part) => part.length)) rows.push(row)
      row = []
      cell = ''
      continue
    }
    cell += ch
  }
  if (cell.length || row.length) {
    row.push(cell)
    rows.push(row)
  }
  if (!rows.length) return []
  const headers = rows[0].map((h) => h.replace(/^\uFEFF/, ''))
  return rows.slice(1).map((parts) => {
    const obj = {}
    headers.forEach((h, idx) => {
      obj[h] = parts[idx] ?? ''
    })
    return obj
  })
}

function psalmNumber(slug) {
  const value = String(slug || '')
  const patterned = value.match(
    /(?:^|[-_])(?:psalm|mezmure?-?dawit|mezmur-?dawit)[-_]?0*(\d{1,3})(?:$|[-_])/i,
  )
  if (patterned) return Number.parseInt(patterned[1], 10)
  const digits = value.match(/(?:^|[-_])0*(\d{1,3})$/)
  return digits ? Number.parseInt(digits[1], 10) : null
}

const root = resolve(process.cwd())
function loadCsv(name) {
  return parseCsv(readFileSync(resolve(root, name), 'utf8').replace(/^\uFEFF/, ''))
}

const collections = loadCsv('prayer-collections-supabase.csv')
const sections = loadCsv('prayer-sections-supabase.csv')
const prayers = loadCsv('prayers-supabase.csv')

const publishedCollections = collections.filter((r) => r.status === 'published')
const publishedSections = sections.filter((r) => r.status === 'published')
const publishedPrayers = prayers.filter((r) => r.status === 'published')
const collectionSlugs = new Set(publishedCollections.map((r) => r.slug))

const missingCollection = publishedPrayers.filter((r) => !r.collection_slug)
const invalidCollection = publishedPrayers.filter(
  (r) => r.collection_slug && !collectionSlugs.has(r.collection_slug),
)

const sectionByKey = new Map(
  publishedSections.map((s) => [`${s.collection_slug}::${s.slug}`, s]),
)

const sectionWrongCollection = publishedPrayers.filter((r) => {
  if (!r.section_slug || !r.collection_slug) return false
  return !sectionByKey.has(`${r.collection_slug}::${r.section_slug}`)
})

const slugDupes = new Map()
for (const row of publishedPrayers) {
  const key = `${row.collection_slug}::${row.slug}`
  slugDupes.set(key, (slugDupes.get(key) || 0) + 1)
}
const duplicateSlugs = [...slugDupes.entries()].filter(([, n]) => n > 1)

const mezmure = publishedPrayers.filter((r) => r.collection_slug === 'mezmure-dawit')
const psalmNumbers = mezmure.map((r) => psalmNumber(r.slug)).filter((n) => n != null)
const missingNumbers = []
for (let n = 1; n <= 150; n++) {
  if (!psalmNumbers.includes(n)) missingNumbers.push(n)
}

const wudaseSections = publishedSections
  .filter((s) => s.collection_slug === 'wudase-mariam')
  .map((s) => s.slug)

const withAm = publishedPrayers.filter((r) => (r.text_amharic || '').trim()).length
const withGe = publishedPrayers.filter((r) => (r.text_geez || '').trim()).length
const withEn = publishedPrayers.filter((r) => (r.text_english || '').trim()).length

const report = {
  source: 'seed CSVs (live Supabase may differ; no project env credentials in this audit)',
  prayer_collection_count: publishedCollections.length,
  prayer_section_count: publishedSections.length,
  prayer_row_count: publishedPrayers.length,
  collection_slugs: publishedCollections.map((c) => c.slug),
  rows_missing_collection: missingCollection.length,
  rows_invalid_collection_slug: invalidCollection.length,
  rows_section_slug_not_found_in_collection: sectionWrongCollection.length,
  duplicate_collection_slug_pairs: duplicateSlugs.map(([k]) => k),
  sample_mezmure_slugs: mezmure.slice(0, 5).map((r) => r.slug),
  mezmure_dawit_psalm_count: mezmure.length,
  resolved_psalm_numbers: psalmNumbers.length,
  missing_psalm_numbers: missingNumbers,
  wudase_weekday_sections: wudaseSections,
  prayers_with_amharic: withAm,
  prayers_with_geez: withGe,
  prayers_with_english: withEn,
  unmigrated_local_fallback: ['yekidane-tselot', 'meharene-ab'],
  canonical_note:
    'Canonical CMS slugs: zewter-tselot, wudase-mariam, mezmure-dawit. Legacy aliases: zeweter-tselot→zewter-tselot, wudasie-mariam→wudase-mariam.',
}

console.log(JSON.stringify(report, null, 2))

if (invalidCollection.length || missingCollection.length) {
  process.exitCode = 1
}
