/**
 * Classify every Mezmur in an exported CSV from its lyrics, using the
 * multilingual alias dictionary. Never writes to Supabase.
 *
 * Usage:
 *   npx tsx scripts/classify-mezmur-lyrics-aliases.ts <input.csv> [outDir]
 *
 * Outputs (default outDir: reports/mezmur-alias-classification):
 *   mezmur_alias_classification.csv         every input row + proposed fields
 *   mezmur_alias_classification_review.csv  rows needing manual review
 *   taxonomy_alias_dictionary.csv           the alias dictionary
 *   classification_summary.json             counts for the quality report
 */
import fs from 'node:fs'
import path from 'node:path'
import { classifyMezmurLyrics, formatMatchedAliases } from '../src/lib/mezmur/lyricsTaxonomyClassifier'
import { TAXONOMY_ALIASES } from '../src/lib/mezmur/taxonomyAliases'

function parseCsv(input: string): Record<string, string>[] {
  const rows: string[][] = []
  let row: string[] = []
  let cell = ''
  let quoted = false
  const text = input.replace(/^\uFEFF/, '')
  for (let i = 0; i < text.length; i++) {
    const c = text[i]
    if (quoted) {
      if (c === '"' && text[i + 1] === '"') { cell += '"'; i++ }
      else if (c === '"') quoted = false
      else cell += c
      continue
    }
    if (c === '"') { quoted = true; continue }
    if (c === ',') { row.push(cell); cell = ''; continue }
    if (c === '\n' || c === '\r') {
      if (c === '\r' && text[i + 1] === '\n') i++
      row.push(cell); rows.push(row); row = []; cell = ''
      continue
    }
    cell += c
  }
  if (cell || row.length) { row.push(cell); rows.push(row) }
  const [header = [], ...body] = rows.filter((r) => r.some((v) => v !== ''))
  return body.map((cells) => Object.fromEntries(header.map((h, i) => [h, cells[i] ?? ''])))
}

const esc = (v: unknown) => {
  const s = String(v ?? '')
  return /[",\r\n]/.test(s) ? `"${s.replaceAll('"', '""')}"` : s
}
function writeCsv(file: string, columns: string[], rows: Record<string, unknown>[]) {
  fs.writeFileSync(file, `${columns.map(esc).join(',')}\n${rows.map((r) => columns.map((c) => esc(r[c])).join(',')).join('\n')}\n`, 'utf8')
}

const [input, outArg] = process.argv.slice(2)
if (!input) {
  console.error('Usage: npx tsx scripts/classify-mezmur-lyrics-aliases.ts <input.csv> [outDir]')
  process.exit(1)
}
const outDir = outArg || path.join(process.cwd(), 'reports', 'mezmur-alias-classification')
fs.mkdirSync(outDir, { recursive: true })

const source = parseCsv(fs.readFileSync(input, 'utf8'))
const originalColumns = Object.keys(source[0] || {})
const NEW = [
  'category', 'additional_categories', 'hymn_sections', 'primary_occasion', 'additional_occasions',
  'classification_confidence', 'review_required', 'review_reasons', 'matched_aliases',
  'supporting_lyric_excerpt', 'classification_reason',
]
const columns = [...originalColumns.filter((c) => !NEW.includes(c)), ...NEW]

const out: Record<string, unknown>[] = []
const BATCH = 50
const started = Date.now()
for (let b = 0; b < source.length; b += BATCH) {
  for (const row of source.slice(b, b + BATCH)) {
    const r = classifyMezmurLyrics({
      import_id: row.import_id,
      lyrics_amharic: row.lyrics_amharic,
      lyrics_geez: row.lyrics_geez,
      lyrics_english: row.lyrics_english,
      lyrics_oromo: row.lyrics_oromo,
      lyrics_transliteration: row.lyrics_transliteration,
    })
    out.push({
      ...row,
      category: r.primaryCategory || '',
      additional_categories: r.additionalCategories.join('; '),
      hymn_sections: r.hymnSections.join('; '),
      primary_occasion: r.primaryOccasion,
      additional_occasions: r.additionalOccasions.join('; '),
      classification_confidence: r.confidence,
      review_required: r.reviewRequired ? 'true' : 'false',
      review_reasons: r.reviewReasons.join('; '),
      matched_aliases: formatMatchedAliases(r.matchedAliases),
      supporting_lyric_excerpt: r.excerpts.join(' / '),
      classification_reason: r.explanation,
    })
  }
  process.stdout.write(`\rclassified ${Math.min(b + BATCH, source.length)} / ${source.length}`)
}
process.stdout.write('\n')

// validation: one output row per input row, identifiers unchanged, excerpts verbatim
if (out.length !== source.length) throw new Error('row count mismatch')
for (let i = 0; i < source.length; i++) {
  for (const c of originalColumns) if (out[i][c] !== source[i][c]) throw new Error(`row ${i} column ${c} changed`)
  const lyr = [source[i].lyrics_amharic, source[i].lyrics_geez, source[i].lyrics_english, source[i].lyrics_oromo, source[i].lyrics_transliteration].join('\n')
  for (const ex of String(out[i].supporting_lyric_excerpt).split(' / ').filter(Boolean)) {
    if (!lyr.includes(ex)) throw new Error(`row ${i}: excerpt not found in lyrics: ${ex}`)
  }
}

writeCsv(path.join(outDir, 'mezmur_alias_classification.csv'), columns, out)
writeCsv(path.join(outDir, 'mezmur_alias_classification_review.csv'), columns, out.filter((r) => r.review_required === 'true'))
writeCsv(
  path.join(outDir, 'taxonomy_alias_dictionary.csv'),
  ['kind', 'canonical_slug', 'canonical_label', 'alias', 'language', 'script', 'alias_type', 'evidence_strength', 'ambiguous', 'search_only', 'pattern', 'notes'],
  TAXONOMY_ALIASES.map((a) => ({
    kind: a.kind, canonical_slug: a.slug, canonical_label: a.canonical, alias: a.alias, language: a.language, script: a.script,
    alias_type: a.type, evidence_strength: a.strength, ambiguous: a.ambiguous, search_only: Boolean(a.searchOnly),
    pattern: a.pattern || '', notes: a.notes || '',
  })),
)

const count = (key: string, split = false) => {
  const m: Record<string, number> = {}
  for (const r of out) {
    const vals = split ? String(r[key]).split('; ').filter(Boolean) : [String(r[key]) || '(none)']
    for (const v of vals) m[v] = (m[v] || 0) + 1
  }
  return Object.fromEntries(Object.entries(m).sort((a, b) => b[1] - a[1]))
}
const allOcc: Record<string, number> = {}
for (const r of out) for (const o of [r.primary_occasion, ...String(r.additional_occasions).split('; ')].filter(Boolean)) allOcc[String(o)] = (allOcc[String(o)] || 0) + 1
const allCat: Record<string, number> = {}
for (const r of out) for (const c of [r.category, ...String(r.additional_categories).split('; ')].filter(Boolean)) allCat[String(c)] = (allCat[String(c)] || 0) + 1
const summary = {
  input: path.basename(input),
  rows: out.length,
  seconds: Math.round((Date.now() - started) / 100) / 10,
  aliases: TAXONOMY_ALIASES.length,
  confidence: count('classification_confidence'),
  reviewRequired: out.filter((r) => r.review_required === 'true').length,
  reviewReasons: count('review_reasons', true),
  primaryCategory: count('category'),
  anyCategory: Object.fromEntries(Object.entries(allCat).sort((a, b) => b[1] - a[1])),
  primaryOccasion: count('primary_occasion'),
  anyOccasion: Object.fromEntries(Object.entries(allOcc).sort((a, b) => b[1] - a[1])),
  multiCategory: out.filter((r) => r.additional_categories).length,
  multiOccasion: out.filter((r) => r.additional_occasions).length,
  hymnSections: count('hymn_sections', true),
}
fs.writeFileSync(path.join(outDir, 'classification_summary.json'), JSON.stringify(summary, null, 2))
console.log(JSON.stringify({ rows: summary.rows, seconds: summary.seconds, confidence: summary.confidence, reviewRequired: summary.reviewRequired }, null, 0))
