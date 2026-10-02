/**
 * Import tewahedo_prayer_resources.csv into prayer_guides / prayer_guide_sections.
 *
 * Usage:
 *   node --env-file-if-exists=.env.local scripts/import-prayer-guides.mjs --dry-run
 *   node --env-file-if-exists=.env.local scripts/import-prayer-guides.mjs --apply
 *
 * Requires SUPABASE_URL + SUPABASE_SERVICE_ROLE_KEY (or VITE_SUPABASE_URL + service role).
 */
import fs from 'node:fs/promises'
import path from 'node:path'
import process from 'node:process'
import { createClient } from '@supabase/supabase-js'
import { fileURLToPath } from 'node:url'

const args = new Set(process.argv.slice(2))
const apply = args.has('--apply')
const dryRun = args.has('--dry-run') || !apply

if (args.has('--apply') && args.has('--dry-run')) {
  throw new Error('Choose either --dry-run or --apply, not both.')
}

const __dirname = path.dirname(fileURLToPath(import.meta.url))
const projectRoot = path.resolve(__dirname, '..')
const defaultCsv = path.join(projectRoot, 'data', 'tewahedo_prayer_resources.csv')

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
      throw new Error(
        `CSV row ${rowIndex + 2} has ${values.length} fields; expected ${headers.length}.`,
      )
    }
    return Object.fromEntries(headers.map((header, columnIndex) => [header, values[columnIndex]]))
  })
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

function normalizeReviewStatus(raw) {
  const value = cleanText(raw).toLowerCase().replace(/\s+/g, '_')
  if (value === 'needs_review' || value === 'need_review' || value === 'needsreview') {
    return 'needs_review'
  }
  if (value === 'reviewed' || value === 'review_complete' || value === 'ok') return 'reviewed'
  if (value === 'draft' || value === '') return 'draft'
  // Preserve uncertain flags as needs_review rather than inventing a new state.
  if (value.includes('review')) return 'needs_review'
  return 'needs_review'
}

function cleanEnglishBody(slug, body) {
  let text = cleanText(body)
  // Strip accidental editorial preamble from the Order of Prayer attachment.
  if (slug === 'the-order-of-prayer') {
    text = text.replace(/^should i add this to pray page\s*/i, '').trim()
  }
  return text
}

function guideAmharicTitle(slug, fromCsv) {
  const cleaned = cleanText(fromCsv)
  if (cleaned) return cleaned
  // User-specified Amharic title for the separate Order of Prayer guide.
  if (slug === 'the-order-of-prayer') return 'የጸሎት ሥርዓት'
  return null
}

function publishDecision(resourceSlug) {
  // Six-section instructional guide is ready for public reading; English remains needs_review.
  // Order of Prayer is English-only source material kept draft until reviewed.
  if (resourceSlug === 'learn-how-to-pray') {
    return { status: 'published', published_at: new Date().toISOString(), sort_order: 10 }
  }
  return { status: 'draft', published_at: null, sort_order: 20 }
}

async function main() {
  await loadEnvFile(path.join(projectRoot, '.env.local'))
  await loadEnvFile(path.join(projectRoot, '.env'))

  const csvPath = process.env.PRAYER_GUIDES_CSV || defaultCsv
  const url = process.env.SUPABASE_URL || process.env.VITE_SUPABASE_URL
  const key =
    process.env.SUPABASE_SERVICE_ROLE_KEY ||
    process.env.SUPABASE_SERVICE_KEY ||
    process.env.SERVICE_ROLE_KEY

  const rows = parseCsv(await fs.readFile(csvPath, 'utf8'))
  if (rows.length === 0) throw new Error(`No data rows in ${csvPath}`)

  const byResource = new Map()
  for (const row of rows) {
    const slug = cleanText(row.resource_slug)
    if (!slug) throw new Error('Row missing resource_slug')
    if (!byResource.has(slug)) byResource.set(slug, [])
    byResource.get(slug).push(row)
  }

  const plan = []
  for (const [resourceSlug, resourceRows] of byResource) {
    const first = resourceRows[0]
    const publish = publishDecision(resourceSlug)
    const sections = resourceRows
      .map((row, index) => {
        const sectionSlug = cleanText(row.section_key)
        if (!sectionSlug) throw new Error(`${resourceSlug}: missing section_key`)
        const order = Number.parseInt(String(row.section_order || ''), 10)
        return {
          slug: sectionSlug,
          title: cleanText(row.section_title_english) || sectionSlug,
          title_amharic: cleanText(row.section_title_amharic) || null,
          body_english: cleanEnglishBody(resourceSlug, row.body_english) || null,
          body_amharic: cleanText(row.body_amharic) || null,
          sort_order: Number.isFinite(order) ? order : index + 1,
          source_reference: cleanText(row.source_title) || null,
          review_status: normalizeReviewStatus(row.review_status),
          review_notes: cleanText(row.review_notes) || null,
        }
      })
      .sort((a, b) => a.sort_order - b.sort_order || a.slug.localeCompare(b.slug))

    plan.push({
      guide: {
        slug: resourceSlug,
        title: cleanText(first.resource_title_english) || resourceSlug,
        title_amharic: guideAmharicTitle(resourceSlug, first.resource_title_amharic),
        summary: cleanText(first.resource_summary_english) || null,
        summary_amharic: cleanText(first.resource_summary_amharic) || null,
        status: publish.status,
        sort_order: publish.sort_order,
        source_title: cleanText(first.source_title) || null,
        source_reference: null,
        review_status: 'needs_review',
        published_at: publish.published_at,
      },
      sections,
    })
  }

  console.log(`CSV: ${csvPath}`)
  console.log(`Rows: ${rows.length}`)
  console.log(`Guides: ${plan.length}`)
  for (const item of plan) {
    console.log(
      `  - ${item.guide.slug} (${item.guide.status}) · ${item.sections.length} sections · review=${item.guide.review_status}`,
    )
    for (const section of item.sections) {
      console.log(
        `      ${section.sort_order}. ${section.slug} · ${section.review_status}` +
          (section.review_notes ? ` · notes` : ''),
      )
    }
  }

  if (dryRun) {
    console.log('\nDry run only. Pass --apply to write to Supabase.')
    return
  }

  if (!url || !key) {
    throw new Error('Missing SUPABASE_URL / SUPABASE_SERVICE_ROLE_KEY for --apply.')
  }

  const supabase = createClient(url, key, {
    auth: { persistSession: false, autoRefreshToken: false },
  })

  for (const item of plan) {
    const { data: existing, error: findError } = await supabase
      .from('prayer_guides')
      .select('id')
      .eq('slug', item.guide.slug)
      .maybeSingle()
    if (findError) throw findError

    let guideId = existing?.id
    if (guideId) {
      const { error } = await supabase
        .from('prayer_guides')
        .update({ ...item.guide, updated_at: new Date().toISOString() })
        .eq('id', guideId)
      if (error) throw error
      console.log(`Updated guide ${item.guide.slug}`)
    } else {
      const { data, error } = await supabase
        .from('prayer_guides')
        .insert(item.guide)
        .select('id')
        .single()
      if (error) throw error
      guideId = data.id
      console.log(`Inserted guide ${item.guide.slug}`)
    }

    // Replace sections for this guide (idempotent re-import by slug).
    const { data: existingSections, error: secListError } = await supabase
      .from('prayer_guide_sections')
      .select('id, slug')
      .eq('guide_id', guideId)
    if (secListError) throw secListError

    const keepSlugs = new Set(item.sections.map((s) => s.slug))
    const toDelete = (existingSections || []).filter((s) => !keepSlugs.has(s.slug))
    if (toDelete.length) {
      const { error } = await supabase
        .from('prayer_guide_sections')
        .delete()
        .in(
          'id',
          toDelete.map((s) => s.id),
        )
      if (error) throw error
    }

    for (const section of item.sections) {
      const prior = (existingSections || []).find((s) => s.slug === section.slug)
      const payload = { ...section, guide_id: guideId }
      if (prior) {
        const { error } = await supabase
          .from('prayer_guide_sections')
          .update({ ...payload, updated_at: new Date().toISOString() })
          .eq('id', prior.id)
        if (error) throw error
      } else {
        const { error } = await supabase.from('prayer_guide_sections').insert(payload)
        if (error) throw error
      }
    }
    console.log(`  Upserted ${item.sections.length} sections for ${item.guide.slug}`)
  }

  console.log('\nImport complete.')
}

main().catch((error) => {
  console.error(error)
  process.exitCode = 1
})
