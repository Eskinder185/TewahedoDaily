#!/usr/bin/env node
/**
 * Administrator-only Church Library passage import.
 *
 * Loads reviewed, pre-chunked passages (JSONL produced by the Faith and Order
 * conversion) into the EXISTING Church Library tables for one book's active
 * file version. It mirrors what the backend reprocess endpoint does, so the
 * existing permission model is unchanged:
 *
 *   - the book must already exist and have an uploaded active file version
 *     (upload the original through Admin → Church Library first);
 *   - public retrieval is switched OFF before passages are replaced, and this
 *     script NEVER switches it back on — a staff reviewer does that in the
 *     admin UI after reviewing the passages;
 *   - passages land with review_status 'pending' (or 'needs_attention' when
 *     the conversion flagged a likely source typo);
 *   - nothing is uploaded to the church-library-originals Storage bucket.
 *
 * Usage (dry run is the default and makes no network calls):
 *   node scripts/import-church-library-passages.mjs \
 *     --jsonl data/church-library/faith-and-order/church_faith_and_order_search.jsonl \
 *     --sections data/church-library/faith-and-order/church_faith_and_order_sections.json \
 *     --manifest data/church-library/faith-and-order/church_faith_and_order_manifest.json
 *
 *   # live import (requires SUPABASE_URL + SUPABASE_SERVICE_ROLE_KEY, e.g. in .env.import)
 *   node --env-file=.env.import scripts/import-church-library-passages.mjs ... --book-id <uuid> --apply
 *
 * Options:
 *   --book-id <uuid>            target church_library_books.id (required with --apply)
 *   --apply                     perform the import (otherwise dry run)
 *   --allow-sha-mismatch        continue when the active version's sha256 differs from the manifest
 *   --emit-resolved-csv <path>  write the passage CSV with book_id/version_id filled in (after resolution)
 */
import { readFileSync, writeFileSync } from 'node:fs'
import { createClient } from '@supabase/supabase-js'

const UUID_RE = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i
const LANGS = new Set(['en', 'am', 'gez', 'mixed', 'other'])
const BATCH = 50
const DEFAULT_MAX_CHARS = 2400

function parseArgs(argv) {
  const args = { apply: false, allowShaMismatch: false }
  for (let i = 0; i < argv.length; i += 1) {
    const a = argv[i]
    if (a === '--apply') args.apply = true
    else if (a === '--allow-sha-mismatch') args.allowShaMismatch = true
    else if (a.startsWith('--')) {
      const key = a.slice(2).replace(/-([a-z])/g, (_, c) => c.toUpperCase())
      const value = argv[i + 1]
      if (value === undefined || value.startsWith('--')) throw new Error(`Missing value for ${a}`)
      args[key] = value
      i += 1
    }
  }
  return args
}

function splitAtNaturalBoundaries(record, maxChars = DEFAULT_MAX_CHARS) {
  if (record.content.length <= maxChars) return [{ ...record, source_passage_id: record.passage_id }]
  const blocks = record.content.split(/\n\s*\n/u)
  const chunks = []
  let current = ''
  for (const block of blocks) {
    const candidate = current ? `${current}\n\n${block}` : block
    if (current && candidate.length > maxChars) {
      chunks.push(current)
      current = block
    } else {
      current = candidate
    }
  }
  if (current) chunks.push(current)
  return chunks.map((content, index) => ({
    ...record,
    passage_id: `${record.passage_id}#${String(index + 1).padStart(2, '0')}`,
    source_passage_id: `${record.passage_id}#${String(index + 1).padStart(2, '0')}`,
    parent_passage_id: record.passage_id,
    content,
  }))
}

export function loadPassages(jsonlPath, { maxChars = DEFAULT_MAX_CHARS } = {}) {
  const lines = readFileSync(jsonlPath, 'utf8').split('\n').filter((l) => l.trim())
  const records = lines.map((line, index) => {
    try {
      return JSON.parse(line)
    } catch {
      throw new Error(`JSONL line ${index + 1} is not valid JSON`)
    }
  })
  const refined = records.flatMap((record) => splitAtNaturalBoundaries(record, maxChars))
  const ids = new Set()
  const orders = new Set()
  for (const [index, r] of refined.entries()) {
    r.passage_order = index
    if (!r.passage_id || ids.has(r.passage_id)) throw new Error(`Duplicate or missing passage_id: ${r.passage_id}`)
    if (!Number.isInteger(r.passage_order) || r.passage_order < 0 || orders.has(r.passage_order)) {
      throw new Error(`Invalid or duplicate passage_order for ${r.passage_id}`)
    }
    if (typeof r.content !== 'string' || !r.content.trim()) throw new Error(`Empty content: ${r.passage_id}`)
    if (!LANGS.has(r.language)) throw new Error(`Unsupported language '${r.language}' in ${r.passage_id}`)
    for (const k of ['page_start', 'page_end']) {
      if (r[k] !== null && (!Number.isInteger(r[k]) || r[k] < 1)) throw new Error(`Invalid ${k} in ${r.passage_id}`)
    }
    if (r.page_start !== null && r.page_end !== null && r.page_end < r.page_start) {
      throw new Error(`page_end < page_start in ${r.passage_id}`)
    }
    ids.add(r.passage_id)
    orders.add(r.passage_order)
  }
  return refined.sort((a, b) => a.passage_order - b.passage_order)
}

export function attachEmbeddings(records, embeddingsPath) {
  if (!embeddingsPath) return records
  const rows = readFileSync(embeddingsPath, 'utf8').split(/\r?\n/u).filter(Boolean).map((line) => JSON.parse(line))
  const byId = new Map(rows.map((row) => [row.passage_id, row]))
  return records.map((record) => {
    const embedded = byId.get(record.source_passage_id)
    if (!embedded) throw new Error(`Missing embedding for ${record.source_passage_id}`)
    if (!Array.isArray(embedded.embedding) || embedded.embedding.length !== 384 ||
        embedded.embedding.some((value) => !Number.isFinite(value))) {
      throw new Error(`Embedding for ${record.source_passage_id} must contain 384 finite numbers`)
    }
    if (!embedded.embedding_model || typeof embedded.embedding_model !== 'string') {
      throw new Error(`Embedding model is missing for ${record.source_passage_id}`)
    }
    return { ...record, embedding: embedded.embedding, embedding_model: embedded.embedding_model }
  })
}

/** Build rows for church_library_sections and church_library_passages. */
export function buildRows(records, sections, { bookId, versionId }) {
  const sectionRows = sections.map((s) => ({
    book_id: bookId,
    version_id: versionId,
    section_order: s.section_order,
    title: s.title,
    chapter_reference: s.chapter_reference,
    page_start: s.page_start ?? null,
    page_end: s.page_end ?? null,
  }))
  const sectionKey = (chapter, section) => `${chapter}\u0000${section ?? chapter}`
  const orderByKey = new Map(sections.map((s) => [sectionKey(s.chapter_reference, s.title), s.section_order]))
  const passageRows = records.map((r) => {
    const firstSection = Array.isArray(r.sections) && r.sections.length ? r.sections[0] : null
    const sectionOrder = orderByKey.get(sectionKey(r.chapter, firstSection))
    if (sectionOrder === undefined) throw new Error(`No section row for ${r.passage_id}`)
    const flagged = Array.isArray(r.quality_flags) && r.quality_flags.length > 0
    return {
      section_order: sectionOrder,
      row: {
        book_id: bookId,
        version_id: versionId,
        passage_order: r.passage_order,
        language: r.language,
        content: r.content,
        page_start: r.page_start,
        page_end: r.page_end,
        chapter_reference: r.chapter,
        locator_label: r.section,
        source_passage_id: r.source_passage_id || r.passage_id,
        extraction_confidence: flagged ? 0.9 : 1.0,
        review_status: flagged ? 'needs_attention' : 'pending',
        reviewer_notes: flagged
          ? `Conversion flagged likely source typos (not corrected): ${r.quality_flags.map((f) => f.note).join(' | ')}`.slice(0, 2000)
          : null,
        ...(r.embedding ? { embedding: r.embedding, embedding_model: r.embedding_model } : {}),
      },
    }
  })
  return { sectionRows, passageRows }
}

function csvCell(value) {
  if (value === null || value === undefined) return ''
  const s = String(value)
  return /[",\n\r]/.test(s) ? `"${s.replace(/"/g, '""')}"` : s
}

function writeResolvedCsv(path, passageRows) {
  const cols = ['book_id', 'version_id', 'section_order', 'passage_order', 'language', 'content', 'page_start',
    'page_end', 'chapter_reference', 'locator_label', 'extraction_confidence', 'review_status']
  const lines = [cols.join(',')]
  for (const { section_order, row } of passageRows) {
    lines.push(cols.map((c) => csvCell(c === 'section_order' ? section_order : row[c])).join(','))
  }
  writeFileSync(path, lines.join('\n') + '\n', 'utf8')
}

async function must(promise, label) {
  const { data, error } = await promise
  if (error) throw new Error(`${label}: ${error.code || ''} ${error.message}`)
  return data
}

export async function runImport(client, { bookId, records, sections, manifest, allowShaMismatch, log = console.log }) {
  const book = await must(
    client.from('church_library_books')
      .select('id,title,current_version_id,public_retrieval_enabled,processing_status')
      .eq('id', bookId).maybeSingle(),
    'Read book',
  )
  if (!book) throw new Error(`Book ${bookId} not found. Create it in Admin → Church Library first.`)
  if (!book.current_version_id) {
    throw new Error('The book has no active file version. Upload the original DOCX in Admin → Church Library first.')
  }
  const versionId = book.current_version_id
  const version = await must(
    client.from('church_library_book_versions')
      .select('id,book_id,original_file_name,mime_type,sha256,processing_status')
      .eq('id', versionId).maybeSingle(),
    'Read active version',
  )
  if (!version || version.book_id !== bookId) throw new Error('Active version does not belong to this book.')
  if (version.processing_status === 'processing') throw new Error('The active version is being processed; try again later.')
  const expectedSha = manifest?.source?.sha256
  if (expectedSha && version.sha256 && version.sha256 !== expectedSha && !allowShaMismatch) {
    throw new Error(`Active version sha256 ${version.sha256} does not match the converted source ${expectedSha}. ` +
      'Upload the same DOCX, or pass --allow-sha-mismatch after confirming the file.')
  }
  const activeJobs = await must(
    client.from('church_library_ingestion_jobs').select('id').eq('version_id', versionId)
      .in('status', ['pending', 'processing']),
    'Check ingestion jobs',
  ).catch((e) => {
    if (/church_library_ingestion_jobs/.test(e.message)) return []
    throw e
  })
  if (activeJobs.length) throw new Error('An ingestion job is active for this version; wait for it to finish.')

  const { sectionRows, passageRows } = buildRows(records, sections, { bookId, versionId })

  // 1. Hide the book from public retrieval before replacing passages.
  await must(client.from('church_library_books').update({ public_retrieval_enabled: false }).eq('id', bookId), 'Disable retrieval')
  // 2. Replace this version's passages and sections.
  await must(client.from('church_library_passages').delete().eq('version_id', versionId), 'Delete old passages')
  await must(client.from('church_library_sections').delete().eq('version_id', versionId), 'Delete old sections')
  const inserted = await must(
    client.from('church_library_sections').insert(sectionRows).select('id,section_order'),
    'Insert sections',
  )
  const sectionIdByOrder = new Map(inserted.map((s) => [s.section_order, s.id]))
  const rows = passageRows.map(({ section_order, row }) => ({ ...row, section_id: sectionIdByOrder.get(section_order) ?? null }))
  for (let i = 0; i < rows.length; i += BATCH) {
    await must(client.from('church_library_passages').insert(rows.slice(i, i + BATCH)), `Insert passages ${i + 1}-${i + BATCH}`)
  }
  // 3. Record the result exactly like the backend processor does. Public
  //    retrieval stays OFF until staff review.
  const notes = manifest?.processing_summary?.extraction_notes ?? 'Imported from reviewed JSONL conversion.'
  await must(client.from('church_library_book_versions').update({
    processing_status: 'ready',
    extraction_quality: manifest?.processing_summary?.extraction_quality ?? 'good',
    extraction_notes: notes,
    page_count: manifest?.source?.page_count ?? null,
    section_count: sectionRows.length,
    passage_count: rows.length,
    processed_at: new Date().toISOString(),
    error_code: null,
    error_message: null,
  }).eq('id', versionId), 'Update version')
  await must(client.from('church_library_books').update({
    processing_status: 'ready',
    extraction_quality: manifest?.processing_summary?.extraction_quality ?? 'good',
    extraction_notes: notes,
  }).eq('id', bookId), 'Update book status')

  log(`Imported ${rows.length} passages in ${sectionRows.length} sections into "${book.title}" (version ${versionId}).`)
  log('Public retrieval is OFF. Review passages in Admin → Church Library, then enable public retrieval there.')
  return { versionId, passageRows, sectionRows }
}

async function main() {
  const args = parseArgs(process.argv.slice(2))
  const base = 'data/church-library/faith-and-order/'
  const jsonlPath = args.jsonl || `${base}church_faith_and_order_search.jsonl`
  let records = loadPassages(jsonlPath, { maxChars: Number(args.maxChars) || DEFAULT_MAX_CHARS })
  records = attachEmbeddings(records, args.embeddings)
  const sections = JSON.parse(readFileSync(args.sections || `${base}church_faith_and_order_sections.json`, 'utf8'))
  const manifest = JSON.parse(readFileSync(args.manifest || `${base}church_faith_and_order_manifest.json`, 'utf8'))

  if (!args.apply) {
    const { sectionRows, passageRows } = buildRows(records, sections, {
      bookId: args.bookId || '<book_id>', versionId: '<active_version_id>',
    })
    const words = records.reduce((n, r) => n + r.content.split(/\s+/).filter(Boolean).length, 0)
    const flagged = passageRows.filter((p) => p.row.review_status === 'needs_attention').length
    console.log(`DRY RUN — no database changes.`)
    console.log(`Passages: ${passageRows.length} (${words} words), sections: ${sectionRows.length}, flagged for review: ${flagged}`)
    console.log(`Embeddings: ${records.every((row) => row.embedding) ? `ready (${records[0]?.embedding_model})` : 'not supplied; lexical search remains available'}`)
    console.log('Run again with --book-id <uuid> --apply (service-role credentials) to import.')
    return
  }
  if (!args.bookId || !UUID_RE.test(args.bookId)) throw new Error('--book-id <uuid> is required with --apply')
  const url = process.env.SUPABASE_URL
  const key = process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.SUPABASE_SECRET_KEY
  if (!url || !key) throw new Error('SUPABASE_URL and SUPABASE_SERVICE_ROLE_KEY are required (server-only; see .env.import.example).')
  const client = createClient(url, key, { auth: { persistSession: false, autoRefreshToken: false } })
  const result = await runImport(client, {
    bookId: args.bookId, records, sections, manifest, allowShaMismatch: args.allowShaMismatch,
  })
  if (args.emitResolvedCsv) {
    writeResolvedCsv(args.emitResolvedCsv, result.passageRows.map(({ section_order, row }) => ({
      section_order, row: { ...row, version_id: result.versionId },
    })))
    console.log(`Wrote ${args.emitResolvedCsv}`)
  }
}

if (import.meta.url === `file://${process.argv[1]}` || process.argv[1]?.endsWith('import-church-library-passages.mjs')) {
  main().catch((error) => {
    console.error(`Import failed: ${error.message}`)
    process.exit(1)
  })
}
