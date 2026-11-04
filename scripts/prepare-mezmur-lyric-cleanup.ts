/** Offline, reviewable Mezmur lyric/classification proposal. Never writes to Supabase. */
import fs from 'node:fs'
import path from 'node:path'
import { classifyMezmurLyrics } from '../src/lib/mezmur/lyricsTaxonomyClassifier'
import { CATEGORY_ENTRIES, OCCASION_ENTRIES, TAXONOMY_ALIASES } from '../src/lib/mezmur/taxonomyAliases'

type Row = Record<string, string>
const originalFields = ['lyrics_amharic', 'lyrics_geez', 'lyrics_english', 'lyrics_oromo'] as const
const lyricFields = [...originalFields, 'lyrics_transliteration'] as const
const sourcePath = process.argv[2]
const outDir = process.argv[3] || path.join('reports', 'mezmur-lyric-cleanup')
if (!sourcePath) throw new Error('Usage: tsx scripts/prepare-mezmur-lyric-cleanup.ts <source.csv> [outDir]')

function parseCsv(input: string): { columns: string[]; rows: Row[] } {
  const data: string[][] = []
  let row: string[] = [], cell = '', quoted = false
  const inputText = input.replace(/^\uFEFF/, '')
  for (let i = 0; i < inputText.length; i++) {
    const c = inputText[i]
    if (quoted) {
      if (c === '"' && inputText[i + 1] === '"') { cell += '"'; i++ }
      else if (c === '"') quoted = false
      else cell += c
    } else if (c === '"') quoted = true
    else if (c === ',') { row.push(cell); cell = '' }
    else if (c === '\r' || c === '\n') {
      if (c === '\r' && inputText[i + 1] === '\n') i++
      row.push(cell); data.push(row); row = []; cell = ''
    } else cell += c
  }
  if (cell || row.length) { row.push(cell); data.push(row) }
  const [columns, ...body] = data.filter((r) => r.some(Boolean))
  if (!columns?.includes('import_id')) throw new Error('Missing import_id column')
  if (body.some((r) => r.length !== columns.length)) throw new Error('Malformed CSV row width')
  return { columns, rows: body.map((r) => Object.fromEntries(columns.map((c, i) => [c, r[i]]))) }
}

function csvCell(value: unknown): string {
  const s = String(value ?? '')
  return /[",\r\n]/.test(s) ? `"${s.replaceAll('"', '""')}"` : s
}
function writeCsv(name: string, columns: string[], rows: Row[]) {
  fs.writeFileSync(path.join(outDir, name), `${columns.map(csvCell).join(',')}\n${rows.map((r) => columns.map((c) => csvCell(r[c])).join(',')).join('\n')}\n`, 'utf8')
}
function cleanSpacing(value: string): string {
  if (!value) return value
  const lines = value.replace(/\r\n?/g, '\n').split('\n')
  const result: string[] = []
  for (const line of lines) {
    const trimmed = line.trim()
    // Separator-only lines have no sung words. Preserve all refrain/repetition markers.
    const next = /^[-_=]{5,}$/.test(trimmed) ? '' : trimmed
    if (next || (result.length && result[result.length - 1] !== '')) result.push(next)
  }
  while (result[result.length - 1] === '') result.pop()
  return result.join('\n')
}
const list = (s: string) => s.split(/\s*[;|]\s*/).map((v) => v.trim()).filter(Boolean)
const source = parseCsv(fs.readFileSync(sourcePath, 'utf8'))
const catSet = new Set(CATEGORY_ENTRIES.map((e) => e.canonical))
const occSet = new Set(OCCASION_ENTRIES.map((e) => e.canonical))
const kept: Row[] = [], excluded: Row[] = [], audit: Row[] = [], changes: Row[] = [], review: Row[] = []
const ids = new Set<string>()
let changedClassification = 0, filledBlank = 0, transliterationMismatch = 0
const changedLyrics = new Set<string>()
for (let i = 0; i < source.rows.length; i++) {
  const original = source.rows[i]
  const id = original.import_id
  if (!id || ids.has(id)) throw new Error(`Missing or duplicate import_id at source row ${i + 2}: ${id}`)
  ids.add(id)
  if (!originalFields.some((field) => original[field]?.trim())) {
    excluded.push({ ...original })
    review.push({ import_id: id, title: original.title, review_type: 'missing_original_lyrics', reason: original.lyrics_transliteration?.trim() ? 'Transliteration only; original lyrics require recovery.' : 'No original lyric text.', status: original.status, review_status: original.review_status })
    continue
  }
  const row = { ...original }
  const reasons: string[] = []
  for (const field of lyricFields) {
    const before = row[field] || ''
    const after = cleanSpacing(before)
    if (before !== after) {
      row[field] = after
      changedLyrics.add(id)
      changes.push({ import_id: id, title: row.title, field, change_type: 'spacing_and_separator_only', before, after, note: 'Line order and sung text retained; no spelling correction inferred.' })
    }
  }
  const originalLineCounts = originalFields.map((f) => row[f].split('\n').filter((x) => x.trim()).length)
  const sourceLines = Math.max(...originalLineCounts)
  const translitLines = row.lyrics_transliteration.split('\n').filter((x) => x.trim()).length
  if (row.lyrics_transliteration.trim() && sourceLines && translitLines !== sourceLines) {
    transliterationMismatch++
    reasons.push(`Transliteration line count ${translitLines} differs from primary lyric line count ${sourceLines}; alignment needs review.`)
  }
  const proposal = classifyMezmurLyrics(row)
  if (originalFields.map((field) => row[field]).join('').replace(/\s/g, '').length < 20) reasons.push('Original lyric is a short fragment; verify completeness.')
  const suggestedCategory = proposal.primaryCategory || ''
  const suggestedOccasion = proposal.primaryOccasion
  const existingCategory = row.category.trim()
  const existingOccasion = row.primary_occasion.trim()
  const approved = row.review_status === 'approved' || Boolean(row.publication_approved_at.trim())
  const proposedDiffers = Boolean((suggestedCategory && suggestedCategory !== existingCategory) || (suggestedOccasion !== 'General / Anytime' && suggestedOccasion !== existingOccasion))
  if (approved && proposedDiffers) reasons.push('Existing approved classification differs from lyric-based proposal; preserved.')
  if (proposal.reviewRequired) reasons.push(...proposal.reviewReasons)
  if (proposal.confidence === 'LOW') reasons.push('Low-confidence lyric classification; existing values preserved.')
  // Only fill vacant classifications backed by at least medium evidence on unapproved rows.
  if (!approved && proposal.confidence !== 'LOW') {
    if (!existingCategory && suggestedCategory) { row.category = suggestedCategory; filledBlank++; changedClassification++ }
    if (!existingOccasion && suggestedOccasion) { row.primary_occasion = suggestedOccasion; changedClassification++ }
    if (!row.additional_categories.trim() && row.category === suggestedCategory && proposal.additionalCategories.length) row.additional_categories = proposal.additionalCategories.join('; ')
    if (!row.additional_occasions.trim() && row.primary_occasion === suggestedOccasion && proposal.additionalOccasions.length) row.additional_occasions = proposal.additionalOccasions.join('; ')
  }
  if (proposedDiffers || row.category !== original.category || row.primary_occasion !== original.primary_occasion) reasons.push('Classification proposal needs editorial review before database use.')
  if (row.status === 'published' && lyricFields.some((field) => row[field] !== original[field])) reasons.push('Published lyric formatting proposal requires editorial review before import.')
  if (!catSet.has(row.category) || !occSet.has(row.primary_occasion)) reasons.push('Category or occasion remains blank/unsupported; resolve before import.')
  if (list(row.additional_categories).some((v) => !catSet.has(v)) || list(row.additional_occasions).some((v) => !occSet.has(v))) reasons.push('Additional taxonomy value needs review.')
  if (reasons.length) row.review_required = 'true'
  kept.push(row)
  audit.push({ import_id: id, title: row.title, original_category: original.category, proposed_category: suggestedCategory, output_category: row.category, original_additional_categories: original.additional_categories, proposed_additional_categories: proposal.additionalCategories.join('; '), output_additional_categories: row.additional_categories, original_occasion: original.primary_occasion, proposed_occasion: suggestedOccasion, output_occasion: row.primary_occasion, original_additional_occasions: original.additional_occasions, proposed_additional_occasions: proposal.additionalOccasions.join('; '), output_additional_occasions: row.additional_occasions, lyric_evidence: proposal.excerpts.join(' / '), matched_aliases: proposal.matchedAliases.map((a) => `${a.canonical}:${a.alias}×${a.count}`).join('; '), confidence: proposal.confidence, reason: proposal.explanation, review_reason: reasons.join('; '), approved_classification_preserved: String(approved), status: row.status, review_status: row.review_status })
  if (reasons.length) review.push({ import_id: id, title: row.title, review_type: 'lyric_taxonomy_editorial', reason: reasons.join('; '), status: row.status, review_status: row.review_status })
  if ((i + 1) % 250 === 0) process.stdout.write(`Processed ${i + 1}/${source.rows.length}\n`)
}
fs.mkdirSync(outDir, { recursive: true })
writeCsv('mezmur_cleaned_classified.csv', source.columns, kept)
writeCsv('mezmur_excluded_no_lyrics.csv', source.columns, excluded)
writeCsv('mezmur_classification_audit.csv', ['import_id','title','original_category','proposed_category','output_category','original_additional_categories','proposed_additional_categories','output_additional_categories','original_occasion','proposed_occasion','output_occasion','original_additional_occasions','proposed_additional_occasions','output_additional_occasions','lyric_evidence','matched_aliases','confidence','reason','review_reason','approved_classification_preserved','status','review_status'], audit)
writeCsv('mezmur_lyric_changes.csv', ['import_id','title','field','change_type','before','after','note'], changes)
writeCsv('mezmur_manual_review.csv', ['import_id','title','review_type','reason','status','review_status'], review)
const aliases = TAXONOMY_ALIASES.map((a) => ({ kind: a.kind, canonical: a.canonical, slug: a.slug, alias: a.alias, language: a.language, script: a.script, strength: a.strength, ambiguous: a.ambiguous, search_only: Boolean(a.searchOnly), notes: a.notes || '' }))
fs.writeFileSync(path.join(outDir, 'mezmur_category_aliases.json'), JSON.stringify({ source: 'src/lib/mezmur/taxonomyAliases.ts', aliases }, null, 2), 'utf8')
const parentByCategory: Record<string, string> = {
  'Kidus Michael': 'Angels', 'Kidus Gabriel': 'Angels', 'Kidus Raphael': 'Angels', 'Kidus Uriel': 'Angels',
  'Kidus Giorgis': 'Saints', 'Abune Tekle Haymanot': 'Saints', 'Abune Gebre Menfes Kidus': 'Saints',
  'Kidus Yared': 'Saints', 'Yohannes Metmek / John the Baptist': 'Saints', 'Kidus Estifanos / Saint Stephen': 'Martyrs',
}
const hierarchy = { source: 'src/lib/mezmur/taxonomyAliases.ts', note: 'Conceptual browse relationships only; no database parent columns are asserted.', categories: CATEGORY_ENTRIES.map((e) => ({ canonical: e.canonical, slug: e.slug, existing: true, conceptual_parent: parentByCategory[e.canonical] || null, group: e.group || null, browse_sections: e.browseSections })), occasions: OCCASION_ENTRIES.map((e) => ({ canonical: e.canonical, slug: e.slug, existing: true, browse_sections: e.browseSections })), proposed_additions: [] as string[] }
fs.writeFileSync(path.join(outDir, 'mezmur_category_hierarchy.json'), JSON.stringify(hierarchy, null, 2), 'utf8')
const stats = { total: source.rows.length, eligible: kept.length, excluded: excluded.length, lyric_rows_changed: changedLyrics.size, lyric_edits: changes.length, classification_fields_filled: changedClassification, blank_categories_filled: filledBlank, classified_output_rows: kept.filter((r) => catSet.has(r.category) && occSet.has(r.primary_occasion)).length, unresolved_category_rows: kept.filter((r) => !catSet.has(r.category)).length, unresolved_occasion_rows: kept.filter((r) => !occSet.has(r.primary_occasion)).length, suggested_category_differences: audit.filter((r) => r.original_category !== r.proposed_category).length, suggested_occasion_differences: audit.filter((r) => r.original_occasion !== r.proposed_occasion).length, low_confidence_rows: audit.filter((r) => r.confidence === 'LOW').length, manual_review_rows: review.length, transliteration_mismatch_rows: transliterationMismatch, unchanged_lyric_rows: kept.length - changedLyrics.size, remaining: 0 }
fs.writeFileSync(path.join(outDir, 'mezmur_processing_report.md'), `# Mezmur lyric cleanup proposal\n\nSource: ${sourcePath} (read-only). This is an offline proposal; no database or publication action occurred.\n\n| Measure | Count |\n| --- | ---: |\n${Object.entries(stats).map(([k,v]) => `| ${k.replaceAll('_',' ')} | ${v} |`).join('\n')}\n\nThe existing published and editorial statuses, identifiers, rights, media, descriptions, and approval metadata are preserved. Classification is based on the existing multilingual lyric alias classifier. Vacant category/occasion fields are filled only on unapproved records with medium or high evidence. Existing classifications remain in the import proposal; different lyric-based suggestions are in the audit for human review. Whitespace and separator edits are logged with before and after text. No uncertain spelling was automatically changed. Transliteration alignment differences are flagged, not guessed. The classifier provides evidence-based proposals, not human theological or linguistic verification. Some category and occasion fields remain blank because the lyrics do not support an automatic assignment. Stanza boundaries were preserved where present; new semantic stanza breaks were not inferred automatically. Editorial review is required before any import, especially for published records and low-confidence classifications.\n`, 'utf8')
console.log(JSON.stringify(stats))
