/**
 * Build bundled JSON seed from CSV for CMS staff import.
 */
import fs from 'node:fs'
import path from 'node:path'
import { fileURLToPath } from 'node:url'

const __dirname = path.dirname(fileURLToPath(import.meta.url))
const root = path.resolve(__dirname, '..')
const csvPath = path.join(root, 'data', 'tewahedo_prayer_resources.csv')
const outPath = path.join(root, 'src', 'lib', 'prayers', 'prayerGuidesSeed.json')

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

function clean(value) {
  return String(value ?? '')
    .replace(/\r\n/g, '\n')
    .replace(/\r/g, '\n')
    .replace(/[ \t]+\n/g, '\n')
    .replace(/\n{3,}/g, '\n\n')
    .replace(/[ \t]{2,}/g, ' ')
    .trim()
}

function review(raw) {
  const v = clean(raw).toLowerCase().replace(/\s+/g, '_')
  if (v === 'reviewed') return 'reviewed'
  if (v === 'draft') return 'draft'
  return 'needs_review'
}

const rows = parseCsv(fs.readFileSync(csvPath, 'utf8'))
const byResource = new Map()
for (const row of rows) {
  const slug = clean(row.resource_slug)
  if (!byResource.has(slug)) byResource.set(slug, [])
  byResource.get(slug).push(row)
}

let sort = 10
const guides = []
for (const [slug, resourceRows] of byResource) {
  const first = resourceRows[0]
  const isLearn = slug === 'learn-how-to-pray'
  let bodyClean = (body) => clean(body)
  guides.push({
    slug,
    title: clean(first.resource_title_english),
    title_amharic:
      clean(first.resource_title_amharic) ||
      (slug === 'the-order-of-prayer' ? 'የጸሎት ሥርዓት' : ''),
    summary: clean(first.resource_summary_english),
    summary_amharic: clean(first.resource_summary_amharic),
    status: isLearn ? 'published' : 'draft',
    sort_order: sort,
    source_title: clean(first.source_title),
    source_reference: '',
    review_status: 'needs_review',
    sections: resourceRows
      .map((row, index) => {
        let body_english = clean(row.body_english)
        if (slug === 'the-order-of-prayer') {
          body_english = body_english.replace(/^should i add this to pray page\s*/i, '').trim()
        }
        const order = Number.parseInt(String(row.section_order || ''), 10)
        return {
          slug: clean(row.section_key),
          title: clean(row.section_title_english),
          title_amharic: clean(row.section_title_amharic),
          body_english,
          body_amharic: clean(row.body_amharic),
          sort_order: Number.isFinite(order) ? order : index + 1,
          source_reference: clean(row.source_title),
          review_status: review(row.review_status),
          review_notes: clean(row.review_notes),
        }
      })
      .sort((a, b) => a.sort_order - b.sort_order),
  })
  sort += 10
}

fs.writeFileSync(outPath, JSON.stringify({ guides }, null, 2), 'utf8')
console.log('Wrote', outPath, 'guides', guides.length)
