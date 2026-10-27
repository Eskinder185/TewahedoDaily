import fs from 'node:fs'
import path from 'node:path'
import crypto from 'node:crypto'

const dir = path.join(process.cwd(), 'reports', 'mezmur-quality-audit')
function parse(input: string): Record<string, string>[] { const rows: string[][] = []; let row: string[] = []; let cell = ''; let quoted = false; for (let i = 0; i < input.length; i++) { const c = input[i]; if (quoted && c === '"' && input[i + 1] === '"') { cell += '"'; i++; continue } if (c === '"') { quoted = !quoted; continue } if (!quoted && c === ',') { row.push(cell); cell = ''; continue } if (!quoted && (c === '\n' || c === '\r')) { if (c === '\r' && input[i + 1] === '\n') i++; row.push(cell); if (row.some(Boolean)) rows.push(row); row = []; cell = ''; continue } cell += c } if (cell || row.length) { row.push(cell); rows.push(row) } const [head = [], ...body] = rows; return body.map((cells) => Object.fromEntries(head.map((h, i) => [h.replace(/^\uFEFF/, ''), cells[i] || ''])) as Record<string, string>) }
const collisions = parse(fs.readFileSync(path.join(dir, 'VERIFIED_PUBLIC_SLUG_COLLISIONS.csv'), 'utf8'))
const exact = parse(fs.readFileSync(path.join(dir, 'VERIFIED_EXACT_DUPLICATES.csv'), 'utf8'))
const snapshot = JSON.parse(fs.readFileSync(path.join(dir, 'PUBLIC_MEZMUR_SNAPSHOT.json'), 'utf8')) as Record<string, string>[]
const video = (v: string) => v.match(/(?:youtu\.be\/|[?&]v=|youtube\.com\/shorts\/)([A-Za-z0-9_-]{6,})/)?.[1]?.toLowerCase() || v.toLowerCase()
const fingerprint = (r: Record<string, string>) => crypto.createHash('md5').update([r.lyrics_amharic, r.lyrics_transliteration, r.lyrics_english, r.lyrics_geez, r.lyrics_oromo].map((v) => v || '').join('\n')).digest('hex')
function publicEvidence(slug: string, title: string, videoId: string) {
  const found = snapshot.filter((r) => r.slug === slug && (r.mezmur_id || r.title === title) && (!videoId || video(r.youtube_url || '') === videoId))
  return found.length === 1 ? fingerprint(found[0]) : ''
}
const rows: Record<string, string>[] = []
for (const r of collisions) rows.push({ record_key: r.mezmur_id || `public_slug:${r.current_slug}|youtube:${r.youtube_video_id}|title:${r.title}`, mezmur_id: r.mezmur_id, slug: r.current_slug, title: r.title, youtube_video_id: r.youtube_video_id, lyrics_fingerprint: publicEvidence(r.current_slug, r.title, r.youtube_video_id), reason: 'confirmed public slug collision' })
for (const r of exact) for (const side of ['a', 'b']) { const id = (r[`youtube_${side}`] || '').match(/(?:v=|youtu\.be\/)([A-Za-z0-9_-]{6,})/)?.[1] || ''; rows.push({ record_key: `public_slug:${r[`slug_${side}`]}|youtube:${id}|title:${r[`title_${side}`]}`, mezmur_id: '', slug: r[`slug_${side}`], title: r[`title_${side}`], youtube_video_id: id, lyrics_fingerprint: publicEvidence(r[`slug_${side}`], r[`title_${side}`], id), reason: 'verified exact duplicate candidate' }) }
const columns = ['record_key', 'mezmur_id', 'slug', 'title', 'youtube_video_id', 'lyrics_fingerprint', 'reason']
const csv = (v: unknown) => { const s = String(v ?? ''); return /[",\r\n]/.test(s) ? `"${s.replaceAll('"', '""')}"` : s }
fs.writeFileSync(path.join(dir, 'PHASE_4_IDENTITY_CANDIDATES_ENRICHED.csv'), `${columns.join(',')}\n${rows.map((r) => columns.map((c) => csv(r[c])).join(',')).join('\n')}\n`)
console.log(JSON.stringify({ candidates: rows.length, collision_rows: collisions.length, exact_rows: exact.length * 2 }, null, 2))
