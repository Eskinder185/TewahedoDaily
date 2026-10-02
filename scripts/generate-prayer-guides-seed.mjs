/**
 * Emit SQL seed for prayer guides from the CSV (no Supabase credentials needed).
 * node scripts/generate-prayer-guides-seed.mjs
 */
import fs from 'node:fs'
import path from 'node:path'
import { fileURLToPath } from 'node:url'

const __dirname = path.dirname(fileURLToPath(import.meta.url))
const projectRoot = path.resolve(__dirname, '..')
const csvPath = path.join(projectRoot, 'data', 'tewahedo_prayer_resources.csv')
const outPath = path.join(
  projectRoot,
  'supabase',
  'migrations',
  '20261001201000_prayer_guides_seed.sql',
)

function parseCsv(text) {
  const input = text.replace(/^\uFEFF/, '')
  const rows = []
  let row = []
  let field = ''
  let quoted = false
  for (let i = 0; i < input.length; i++) {
    const c = input[i]
    if (quoted) {
      if (c === '"' && input[i + 1] === '"') {
        field += '"'
        i++
      } else if (c === '"') quoted = false
      else field += c
    } else if (c === '"') quoted = true
    else if (c === ',') {
      row.push(field)
      field = ''
    } else if (c === '\n') {
      row.push(field.replace(/\r$/, ''))
      if (row.some((v) => v !== '')) rows.push(row)
      row = []
      field = ''
    } else field += c
  }
  if (field || row.length) {
    row.push(field.replace(/\r$/, ''))
    if (row.some((v) => v !== '')) rows.push(row)
  }
  const headers = rows[0]
  return rows.slice(1).map((values) =>
    Object.fromEntries(headers.map((h, i) => [h, values[i] ?? ''])),
  )
}

function cleanText(value) {
  return String(value ?? '')
    .replace(/\r\n/g, '\n')
    .replace(/\r/g, '\n')
    .replace(/[ \t]+\n/g, '\n')
    .replace(/\n{3,}/g, '\n\n')
    .replace(/[ \t]{2,}/g, ' ')
    .trim()
}

function sqlLiteral(value) {
  if (value == null || value === '') return 'null'
  return `'${String(value).replace(/'/g, "''")}'`
}

function normalizeReview(raw) {
  const value = cleanText(raw).toLowerCase().replace(/\s+/g, '_')
  if (value === 'reviewed') return 'reviewed'
  if (value === 'draft') return 'draft'
  return 'needs_review'
}

const rows = parseCsv(fs.readFileSync(csvPath, 'utf8'))
const byResource = new Map()
for (const row of rows) {
  const slug = cleanText(row.resource_slug)
  if (!byResource.has(slug)) byResource.set(slug, [])
  byResource.get(slug).push(row)
}

const lines = []
lines.push('-- Seed prayer guides from data/tewahedo_prayer_resources.csv')
lines.push('-- Idempotent upserts by slug / (guide_id, section slug).')
lines.push('begin;')
lines.push('')

let sortGuide = 10
for (const [resourceSlug, resourceRows] of byResource) {
  const first = resourceRows[0]
  const isLearn = resourceSlug === 'learn-how-to-pray'
  const titleAm =
    cleanText(first.resource_title_amharic) ||
    (resourceSlug === 'the-order-of-prayer' ? 'የጸሎት ሥርዓት' : '')
  const status = isLearn ? 'published' : 'draft'
  const publishedAt = isLearn ? 'now()' : 'null'
  const sourceTitle = cleanText(first.source_title)

  lines.push(`-- Guide: ${resourceSlug}`)
  lines.push(`insert into public.prayer_guides (`)
  lines.push(
    `  slug, title, title_amharic, summary, summary_amharic, status, sort_order, source_title, source_reference, review_status, published_at`,
  )
  lines.push(`) values (`)
  lines.push(
    `  ${sqlLiteral(resourceSlug)},`,
    `  ${sqlLiteral(cleanText(first.resource_title_english))},`,
    `  ${sqlLiteral(titleAm || null)},`,
    `  ${sqlLiteral(cleanText(first.resource_summary_english) || null)},`,
    `  ${sqlLiteral(cleanText(first.resource_summary_amharic) || null)},`,
    `  '${status}'::public.content_status,`,
    `  ${sortGuide},`,
    `  ${sqlLiteral(sourceTitle || null)},`,
    `  null,`,
    `  'needs_review',`,
    `  ${publishedAt}`,
  )
  lines.push(`)`)
  lines.push(`on conflict (slug) do update set`)
  lines.push(`  title = excluded.title,`)
  lines.push(`  title_amharic = excluded.title_amharic,`)
  lines.push(`  summary = excluded.summary,`)
  lines.push(`  summary_amharic = excluded.summary_amharic,`)
  lines.push(`  status = excluded.status,`)
  lines.push(`  sort_order = excluded.sort_order,`)
  lines.push(`  source_title = excluded.source_title,`)
  lines.push(`  review_status = excluded.review_status,`)
  lines.push(`  published_at = coalesce(public.prayer_guides.published_at, excluded.published_at),`)
  lines.push(`  updated_at = now();`)
  lines.push('')

  const sections = resourceRows
    .map((row, index) => {
      let bodyEn = cleanText(row.body_english)
      if (resourceSlug === 'the-order-of-prayer') {
        bodyEn = bodyEn.replace(/^should i add this to pray page\s*/i, '').trim()
      }
      const order = Number.parseInt(String(row.section_order || ''), 10)
      return {
        slug: cleanText(row.section_key),
        title: cleanText(row.section_title_english),
        titleAm: cleanText(row.section_title_amharic),
        bodyEn,
        bodyAm: cleanText(row.body_amharic),
        sort: Number.isFinite(order) ? order : index + 1,
        source: cleanText(row.source_title),
        review: normalizeReview(row.review_status),
        notes: cleanText(row.review_notes),
      }
    })
    .sort((a, b) => a.sort - b.sort)

  for (const section of sections) {
    lines.push(`insert into public.prayer_guide_sections (`)
    lines.push(
      `  guide_id, slug, title, title_amharic, body_english, body_amharic, sort_order, source_reference, review_status, review_notes`,
    )
    lines.push(`)`)
    lines.push(`select g.id,`)
    lines.push(`  ${sqlLiteral(section.slug)},`)
    lines.push(`  ${sqlLiteral(section.title)},`)
    lines.push(`  ${sqlLiteral(section.titleAm || null)},`)
    lines.push(`  ${sqlLiteral(section.bodyEn || null)},`)
    lines.push(`  ${sqlLiteral(section.bodyAm || null)},`)
    lines.push(`  ${section.sort},`)
    lines.push(`  ${sqlLiteral(section.source || null)},`)
    lines.push(`  ${sqlLiteral(section.review)},`)
    lines.push(`  ${sqlLiteral(section.notes || null)}`)
    lines.push(`from public.prayer_guides g`)
    lines.push(`where g.slug = ${sqlLiteral(resourceSlug)}`)
    lines.push(`on conflict (guide_id, slug) do update set`)
    lines.push(`  title = excluded.title,`)
    lines.push(`  title_amharic = excluded.title_amharic,`)
    lines.push(`  body_english = excluded.body_english,`)
    lines.push(`  body_amharic = excluded.body_amharic,`)
    lines.push(`  sort_order = excluded.sort_order,`)
    lines.push(`  source_reference = excluded.source_reference,`)
    lines.push(`  review_status = excluded.review_status,`)
    lines.push(`  review_notes = excluded.review_notes,`)
    lines.push(`  updated_at = now();`)
    lines.push('')
  }

  sortGuide += 10
}

lines.push('commit;')
lines.push('')

fs.writeFileSync(outPath, lines.join('\n'), 'utf8')
console.log('Wrote', outPath)
console.log('Guides', byResource.size, 'rows', rows.length)
