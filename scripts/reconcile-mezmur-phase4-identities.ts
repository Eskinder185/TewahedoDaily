import fs from 'node:fs'
import path from 'node:path'

const dir = path.join(process.cwd(), 'reports', 'mezmur-quality-audit')
const file = path.join(dir, 'PHASE_4_SOURCE_IDENTITY_EXPORT.csv')
if (!fs.existsSync(file)) throw new Error('Run PHASE_4_EXPORT.ps1 first; the source identity export is missing.')
function parse(input: string): Record<string, string>[] {
  const rows: string[][] = []; let row: string[] = []; let value = ''; let quoted = false
  for (let i = 0; i < input.length; i++) { const c = input[i]; if (quoted && c === '"' && input[i + 1] === '"') { value += '"'; i++; continue } if (c === '"') { quoted = !quoted; continue } if (!quoted && c === ',') { row.push(value); value = ''; continue } if (!quoted && (c === '\n' || c === '\r')) { if (c === '\r' && input[i + 1] === '\n') i++; row.push(value); if (row.some(Boolean)) rows.push(row); row = []; value = ''; continue } value += c }
  if (value || row.length) { row.push(value); rows.push(row) }
  const [header = [], ...body] = rows
  return body.map((cells) => Object.fromEntries(header.map((h, i) => [h.replace(/^\uFEFF/, ''), cells[i] || ''])) as Record<string, string>)
}
const norm = (v: string) => v.normalize('NFKC').trim().toLocaleLowerCase('und')
const video = (v: string) => { const raw = norm(v); if (/^[a-z0-9_-]{6,}$/i.test(raw)) return raw; const match = v.match(/(?:youtu\.be\/|[?&]v=|youtube\.com\/shorts\/)([A-Za-z0-9_-]{6,})/); return match?.[1]?.toLowerCase() || raw }
const source = parse(fs.readFileSync(file, 'utf8'))
const snapshot = JSON.parse(fs.readFileSync(path.join(dir, 'PUBLIC_MEZMUR_SNAPSHOT.json'), 'utf8')) as Record<string, string>[]
const candidateFile = fs.existsSync(path.join(dir, 'PHASE_4_IDENTITY_CANDIDATES_ENRICHED.csv'))
  ? 'PHASE_4_IDENTITY_CANDIDATES_ENRICHED.csv'
  : 'PHASE_4_CONFIRMED_CANDIDATES.csv'
const candidates = parse(fs.readFileSync(path.join(dir, candidateFile), 'utf8'))
const result: Record<string, string>[] = []
for (const candidate of candidates) {
  const publicRows = snapshot.filter((r) => (candidate.mezmur_id && norm(r.mezmur_id || '') === norm(candidate.mezmur_id)) || (!candidate.mezmur_id && norm(r.slug || '') === norm(candidate.slug || '') && norm(r.title || r.title_amharic || '') === norm(candidate.title || '')))
  // An exposed public mezmur_id is the strongest available join. Resolve it
  // first; do not let duplicate slugs or recordings turn a unique ID into an
  // ambiguous match.
  const exactId = publicRows.flatMap((p) => p.mezmur_id ? source.filter((s) => norm(s.mezmur_id || '') === norm(p.mezmur_id || '')) : [])
  const matches = exactId.length ? exactId : source.filter((s) => {
    const sameSlug = norm(candidate.slug || '') && norm(candidate.slug || '') === norm(s.slug || '')
    const sameTitle = norm(candidate.title || '') && norm(candidate.title || '') === norm(s.title || s.title_amharic || '')
    const sameVideo = video(candidate.youtube_video_id || '') && video(candidate.youtube_video_id || '') === video(s.youtube_url || '')
    const sameLyrics = Boolean(candidate.lyrics_fingerprint && s.lyrics_fingerprint && candidate.lyrics_fingerprint === s.lyrics_fingerprint)
    // A fallback requires the slug plus one independent content/recording
    // signal. Title alone or slug alone is never sufficient.
    return sameSlug && (sameLyrics || (sameVideo && (!candidate.lyrics_fingerprint || !s.lyrics_fingerprint)) || (!candidate.youtube_video_id && sameTitle))
  })
  const unique = [...new Map(matches.map((m) => [m.import_id, m])).values()]
  const state = unique.length === 1 && unique[0].status === 'published' && !unique[0].deleted_at ? 'verified_published' : unique.length === 0 ? 'missing' : unique.length > 1 ? 'ambiguous' : 'stale_or_not_published'
  const row = unique[0]
  result.push({ record_key: candidate.record_key, import_id: state === 'verified_published' ? row.import_id : '', source_slug: row?.slug || '', source_title: row?.title || '', source_youtube_url: row?.youtube_url || '', source_status: row?.status || '', source_updated_at: row?.updated_at || '', match_state: state, reason: candidate.reason })
}
const columns = ['record_key', 'import_id', 'source_slug', 'source_title', 'source_youtube_url', 'source_status', 'source_updated_at', 'match_state', 'reason']
const quote = (v: unknown) => { const s = String(v ?? ''); return /[",\r\n]/.test(s) ? `"${s.replaceAll('"', '""')}"` : s }
fs.writeFileSync(path.join(dir, 'PHASE_4_IDENTITY_RECONCILIATION.csv'), `${columns.join(',')}\n${result.map((r) => columns.map((c) => quote(r[c])).join(',')).join('\n')}\n`)
const counts = Object.groupBy(result, (r) => r.match_state)
console.log(JSON.stringify(Object.fromEntries(Object.entries(counts).map(([k, v]) => [k, v.length])), null, 2))
