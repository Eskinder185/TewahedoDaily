#!/usr/bin/env node

/**
 * Read-only visibility audit for the public Mezmur catalog.
 *
 * Uses the same public Supabase credentials as the browser. Every operation is
 * a SELECT; this script does not call RPCs, mutate rows, or use a service key.
 */
import { createClient } from '@supabase/supabase-js'

const url = process.env.VITE_SUPABASE_URL?.trim()
const key = process.env.VITE_SUPABASE_PUBLISHABLE_KEY?.trim()

if (!url || !key) {
  throw new Error('VITE_SUPABASE_URL and VITE_SUPABASE_PUBLISHABLE_KEY are required.')
}

const supabase = createClient(url, key, {
  auth: { persistSession: false, autoRefreshToken: false, detectSessionInUrl: false },
})

const PAGE_SIZE = 500

async function readAll(table, columns) {
  const rows = []
  for (let from = 0; ; from += PAGE_SIZE) {
    const { data, error } = await supabase
      .from(table)
      .select(columns)
      .range(from, from + PAGE_SIZE - 1)
    if (error) return { rows, error: { code: error.code, message: error.message } }
    rows.push(...(data || []))
    if (!data || data.length < PAGE_SIZE) return { rows, error: null }
  }
}

function text(value) {
  return String(value ?? '').trim()
}

function distribution(rows, field) {
  const values = new Map()
  for (const row of rows) {
    const value = text(row[field]) || '(blank)'
    values.set(value, (values.get(value) || 0) + 1)
  }
  return Object.fromEntries([...values.entries()].sort((a, b) => a[0].localeCompare(b[0])))
}

function duplicates(rows, field) {
  const counts = new Map()
  for (const row of rows) {
    const value = text(row[field])
    if (value) counts.set(value, (counts.get(value) || 0) + 1)
  }
  return [...counts.entries()]
    .filter(([, count]) => count > 1)
    .map(([value, count]) => ({ value, count }))
}

function visibleByCurrentFrontend(row) {
  const status = text(row.status).toLowerCase()
  if (!status) return true
  return !['draft', 'archived', 'hidden', 'rejected', 'deleted'].includes(status)
}

function editoriallyApproved(row) {
  return text(row.status).toLowerCase() === 'published' &&
    text(row.review_status).toLowerCase() === 'approved'
}

function hasLocalLyrics(row) {
  return ['lyrics_amharic', 'lyrics_transliteration', 'lyrics_english', 'lyrics_geez', 'lyrics_oromo']
    .some((field) => text(row[field]))
}

function rightsAllowLocalLyrics(row) {
  return ['owned', 'licensed', 'authorized_contributor', 'public_domain', 'display_only']
    .includes(text(row.rights_status).toLowerCase())
}

const baseImportColumns = [
  'mezmur_id', 'slug', 'title', 'title_amharic', 'title_english',
  'lyrics_amharic', 'lyrics_transliteration', 'lyrics_english', 'lyrics_geez', 'lyrics_oromo',
  'primary_language', 'form', 'singer_id', 'singer_slug', 'singer_name', 'zemari_id',
  'status', 'review_status', 'source_url', 'source_notes',
].join(',')

const [imports, rightsProbe, canonical, sectionLinks, occasionLinks, categoryLinks, sections, collections] =
  await Promise.all([
    readAll('mezmur_data_import', baseImportColumns),
    readAll('mezmur_data_import', 'slug,rights_status'),
    readAll('mezmur', 'id,slug,status,singer_id,category_id,published_at'),
    readAll('mezmur_section_links_import', 'mezmur_slug,section_slug'),
    readAll('mezmur_occasion_links_import', 'mezmur_slug,occasion_slug'),
    readAll('mezmur_category_links_import', 'mezmur_slug,category_slug'),
    readAll('mezmur_sections_import', 'section_slug,collection_slug,status'),
    readAll('mezmur_collections_import', 'collection_slug,status'),
  ])

const importRows = imports.rows
const rightsBySlug = new Map(rightsProbe.rows.map((row) => [text(row.slug), text(row.rights_status)]))
for (const row of importRows) row.rights_status = rightsBySlug.get(text(row.slug)) || ''
const canonicalRows = canonical.rows
const importSlugs = new Set(importRows.map((row) => text(row.slug)).filter(Boolean))
const canonicalSlugs = new Set(canonicalRows.map((row) => text(row.slug)).filter(Boolean))
const linked = (result) => new Set(result.rows.map((row) => text(row.mezmur_slug)).filter(Boolean))
const sectionLinked = linked(sectionLinks)
const occasionLinked = linked(occasionLinks)
const categoryLinked = linked(categoryLinks)
const frontendVisible = importRows.filter(visibleByCurrentFrontend)
const approved = importRows.filter(editoriallyApproved)
const locallyDisplayable = approved.filter((row) => !hasLocalLyrics(row) || rightsAllowLocalLyrics(row))
const publishedRows = importRows.filter((row) => text(row.status).toLowerCase() === 'published')
const draftRows = importRows.filter((row) => text(row.status).toLowerCase() === 'draft')

async function probeSearchApi(row) {
  const base = process.env.VITE_TEWAHEDO_AI_API_URL?.trim().replace(/\/+$/, '')
  const query = text(row.title_amharic) || text(row.title) || text(row.slug)
  if (!base || !query) return { slug: text(row.slug), status: text(row.status), skipped: true }
  try {
    const response = await fetch(`${base}/api/hymns/search?q=${encodeURIComponent(query)}&limit=20`)
    const body = await response.json()
    const results = Array.isArray(body?.results) ? body.results : []
    return {
      slug: text(row.slug),
      status: text(row.status),
      http_status: response.status,
      api_count: typeof body?.count === 'number' ? body.count : null,
      exact_slug_returned: results.some((item) => text(item?.slug) === text(row.slug)),
      returned_slugs: results.map((item) => text(item?.slug)).filter(Boolean),
    }
  } catch (error) {
    return { slug: text(row.slug), status: text(row.status), error: String(error) }
  }
}

const apiProbeRows = [
  ...importRows.filter((row) => text(row.status).toLowerCase() === 'published').slice(0, 3),
  ...importRows.filter((row) => text(row.status).toLowerCase() === 'draft').slice(0, 3),
]
const apiSearchProbes = await Promise.all(apiProbeRows.map(probeSearchApi))

const report = {
  generated_at: new Date().toISOString(),
  credential_scope: 'public browser credentials; SELECT-only',
  table_access: {
    mezmur_data_import: imports.error || 'readable',
    mezmur_data_import_rights_status: rightsProbe.error || 'readable',
    mezmur: canonical.error || 'readable',
    mezmur_section_links_import: sectionLinks.error || 'readable',
    mezmur_occasion_links_import: occasionLinks.error || 'readable',
    mezmur_category_links_import: categoryLinks.error || 'readable',
    mezmur_sections_import: sections.error || 'readable',
    mezmur_collections_import: collections.error || 'readable',
  },
  counts: {
    import_rows_anon_visible: importRows.length,
    distinct_import_slugs: importSlugs.size,
    current_frontend_visible: frontendVisible.length,
    status_published: publishedRows.length,
    distinct_published_slugs: new Set(publishedRows.map((row) => text(row.slug))).size,
    review_approved_and_published: approved.length,
    approved_with_acceptable_local_lyrics_rights: locallyDisplayable.length,
    canonical_rows_anon_visible: canonicalRows.length,
    canonical_published_anon_visible: canonicalRows.filter((row) => text(row.status).toLowerCase() === 'published').length,
    import_slugs_present_in_canonical: [...importSlugs].filter((slug) => canonicalSlugs.has(slug)).length,
    import_slugs_absent_from_canonical: [...importSlugs].filter((slug) => !canonicalSlugs.has(slug)).length,
    section_link_rows: sectionLinks.rows.length,
    import_mezmurs_with_section_link: [...importSlugs].filter((slug) => sectionLinked.has(slug)).length,
    import_mezmurs_without_section_link: [...importSlugs].filter((slug) => !sectionLinked.has(slug)).length,
    published_rows_with_section_link: publishedRows.filter((row) => sectionLinked.has(text(row.slug))).length,
    published_rows_without_section_link: publishedRows.filter((row) => !sectionLinked.has(text(row.slug))).length,
    draft_rows_with_section_link: draftRows.filter((row) => sectionLinked.has(text(row.slug))).length,
    occasion_link_rows: occasionLinks.rows.length,
    import_mezmurs_with_occasion_link: [...importSlugs].filter((slug) => occasionLinked.has(slug)).length,
    category_link_rows: categoryLinks.rows.length,
    import_mezmurs_with_category_link: [...importSlugs].filter((slug) => categoryLinked.has(slug)).length,
    sections_anon_visible: sections.rows.length,
    collections_anon_visible: collections.rows.length,
  },
  distributions: {
    status: distribution(importRows, 'status'),
    review_status: distribution(importRows, 'review_status'),
    rights_status: distribution(importRows, 'rights_status'),
    primary_language: distribution(importRows, 'primary_language'),
    form: distribution(importRows, 'form'),
  },
  missing_required_or_relational_fields: {
    slug: importRows.filter((row) => !text(row.slug)).length,
    mezmur_id: importRows.filter((row) => !text(row.mezmur_id)).length,
    title_all_variants: importRows.filter((row) => !text(row.title) && !text(row.title_amharic) && !text(row.title_english)).length,
    all_lyrics: importRows.filter((row) => !hasLocalLyrics(row)).length,
    zemari_reference: importRows.filter((row) => !text(row.zemari_id) && !text(row.singer_id) && !text(row.singer_slug) && !text(row.singer_name)).length,
    source_attribution: importRows.filter((row) => !text(row.source_url) && !text(row.source_notes)).length,
    editorial_approval: importRows.filter((row) => text(row.review_status).toLowerCase() !== 'approved').length,
    verified_local_lyrics_rights: importRows.filter((row) => hasLocalLyrics(row) && !rightsAllowLocalLyrics(row)).length,
  },
  duplicates: {
    slug: duplicates(importRows, 'slug'),
    mezmur_id: duplicates(importRows, 'mezmur_id'),
  },
  api_search_probes: apiSearchProbes,
}

console.log(JSON.stringify(report, null, 2))
