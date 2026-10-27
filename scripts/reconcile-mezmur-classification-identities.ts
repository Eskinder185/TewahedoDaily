import fs from 'node:fs'
import path from 'node:path'
import crypto from 'node:crypto'

const root = process.cwd(); const dir = path.join(root, 'reports', 'mezmur-classification')
const parseCsv = (input: string) => { const rows: string[][] = []; let row: string[] = []; let cell = ''; let quoted = false; for (let i = 0; i < input.length; i++) { const c = input[i]; if (quoted && c === '"' && input[i + 1] === '"') { cell += '"'; i++; continue } if (c === '"') { quoted = !quoted; continue } if (!quoted && c === ',') { row.push(cell); cell = ''; continue } if (!quoted && (c === '\n' || c === '\r')) { if (c === '\r' && input[i + 1] === '\n') i++; row.push(cell); if (row.some(Boolean)) rows.push(row); row = []; cell = ''; continue } cell += c } if (cell || row.length) rows.push([...row, cell]); const [head = [], ...body] = rows; return body.map((cells) => Object.fromEntries(head.map((h, i) => [h.replace(/^\uFEFF/, ''), cells[i] || '']))) as Record<string, string>[] }
const proposals = parseCsv(fs.readFileSync(path.join(dir, 'MEZMUR_CLASSIFICATION_PROPOSALS.csv'), 'utf8'))
const sourcePath = path.join(dir, 'SOURCE_IDENTITY_EXPORT.csv')
const source = fs.existsSync(sourcePath) ? parseCsv(fs.readFileSync(sourcePath, 'utf8')) : []
const norm = (v: unknown) => String(v ?? '').normalize('NFKC').toLocaleLowerCase().replace(/\s+/g, ' ').trim()
const fingerprint = (v: unknown) => crypto.createHash('md5').update(norm(v)).digest('hex')
const by = (key: string) => { const map = new Map<string, Record<string, string>[]>(); for (const row of source) { const value = norm(row[key]); if (!value) continue; const list = map.get(value) || []; list.push(row); map.set(value, list) } return map }
const byMezmurId = by('mezmur_id'); const bySlug = by('slug'); const byTitle = by('title_fingerprint')
const rows = proposals.map((proposal) => {
  const key = proposal.public_record_key; const candidates = key && !key.startsWith('slug:') ? (byMezmurId.get(norm(key)) || []) : []
  const slugCandidates = candidates.length ? candidates : bySlug.get(norm(key.replace(/^slug:/, ''))) || []
  const finalCandidates = slugCandidates.length === 1 ? slugCandidates : slugCandidates.length === 0 ? byTitle.get(fingerprint(proposal.title)) || [] : slugCandidates
  const unique = finalCandidates.length === 1 ? finalCandidates[0] : undefined
  const state = unique ? 'unique_match' : finalCandidates.length === 0 ? (source.length ? 'missing' : 'source_export_not_available') : 'ambiguous'
  return { public_record_key: key, title: proposal.title, import_id: unique?.import_id || '', source_status: unique?.status || '', source_updated_at: unique?.updated_at || '', match_state: state, candidate_count: finalCandidates.length, classification_group: proposal.classification_group, proposed_primary_category: proposal.proposed_primary_category, proposed_occasions: proposal.proposed_occasions }
})
const columns = Object.keys(rows[0] || { public_record_key: '', title: '', import_id: '', source_status: '', source_updated_at: '', match_state: '', candidate_count: '', classification_group: '', proposed_primary_category: '', proposed_occasions: '' })
const csv = (v: unknown) => { const s = String(v ?? ''); return /[",\r\n]/.test(s) ? `"${s.replaceAll('"', '""')}"` : s }
fs.writeFileSync(path.join(dir, 'CLASSIFICATION_IDENTITY_RECONCILIATION.csv'), `${columns.join(',')}\n${rows.map((r) => columns.map((c) => csv(r[c as keyof typeof r])).join(',')).join('\n')}\n`)
const counts = rows.reduce<Record<string, number>>((acc, row) => { acc[row.match_state] = (acc[row.match_state] || 0) + 1; return acc }, {})
fs.writeFileSync(path.join(dir, 'CLASSIFICATION_IDENTITY_RECONCILIATION.md'), `# Classification identity reconciliation\n\nSource export rows loaded: **${source.length}**.\n\n${Object.entries(counts).map(([k, v]) => `- ${k}: **${v}**`).join('\n')}\n\nOnly a unique match may enter a production changeset. Matches are additionally subject to current status, updated_at, deleted_at, and taxonomy preconditions.\n`)
console.log(JSON.stringify({ source_rows: source.length, ...counts }, null, 2))
