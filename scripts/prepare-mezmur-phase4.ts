import fs from 'node:fs'
import path from 'node:path'

const dir = path.join(process.cwd(), 'reports', 'mezmur-quality-audit')
const snapshot = JSON.parse(fs.readFileSync(path.join(dir, 'PUBLIC_MEZMUR_SNAPSHOT.json'), 'utf8')) as Record<string, unknown>[]

function rows(file: string): Record<string, string>[] {
  const input = fs.readFileSync(path.join(dir, file), 'utf8')
  const out: string[][] = []; let current: string[] = []; let value = ''; let quoted = false
  for (let i = 0; i < input.length; i++) {
    const c = input[i]
    if (quoted && c === '"' && input[i + 1] === '"') { value += '"'; i++; continue }
    if (c === '"') { quoted = !quoted; continue }
    if (!quoted && c === ',') { current.push(value); value = ''; continue }
    if (!quoted && (c === '\n' || c === '\r')) { if (c === '\r' && input[i + 1] === '\n') i++; current.push(value); if (current.some(Boolean)) out.push(current); current = []; value = ''; continue }
    value += c
  }
  if (value || current.length) { current.push(value); out.push(current) }
  const [header = [], ...body] = out
  return body.map((cells) => Object.fromEntries(header.map((key, i) => [key, cells[i] || ''])) as Record<string, string>)
}
const key = (r: Record<string, string>) => String(r.import_id || r.mezmur_id || r.public_record_id || r.record_id_a || r.record_id_b || '')
const collisions = rows('VERIFIED_PUBLIC_SLUG_COLLISIONS.csv')
const exact = rows('VERIFIED_EXACT_DUPLICATES.csv')
const possible = rows('POSSIBLE_DUPLICATES.csv')
const encoding = rows('ENCODING_ERRORS.csv')
const formatting = rows('LYRICS_FORMATTING_ISSUES.csv')
const zemari = rows('ZEMARI_ATTRIBUTION_REVIEW.csv')
const theological = rows('THEOLOGICAL_REVIEW.csv')
const confirmed = new Map<string, string>()
for (const r of collisions) confirmed.set(key(r), `confirmed public slug collision: ${r.title}`)
for (const r of exact) for (const candidate of [r.record_id_a, r.record_id_b]) if (candidate) confirmed.set(candidate.replace(/^public_slug:/, ''), `verified exact duplicate: ${r.title_a || r.title_b}`)

const quote = (v: unknown) => { const s = String(v ?? ''); return /[",\r\n]/.test(s) ? `"${s.replaceAll('"', '""')}"` : s }
const candidateLines = ['record_key,import_id,reason,current_status,action', ...[...confirmed].map(([recordKey, reason]) => `${quote(recordKey)},,${quote(reason)},unknown,blocked_pending_authorized_identity`)]
fs.writeFileSync(path.join(dir, 'PHASE_4_CONFIRMED_CANDIDATES.csv'), `${candidateLines.join('\n')}\n`)

fs.writeFileSync(path.join(dir, 'PHASE_4_DRAFT_REVERSION_DRY_RUN.sql'), `-- Phase 4: identity-gated dry run only. No production write is included.\nbegin;\ncreate temporary table phase4_draft_plan (import_id uuid primary key, expected_status text not null check (expected_status = 'published'), reason text not null, expected_updated_at text not null) on commit drop;\n-- Populate only from an authorized read-only identity query. Never guess an import_id.\n-- insert into phase4_draft_plan values ('00000000-0000-0000-0000-000000000000','published','confirmed collision','exact-updated-at');\ndo $$ begin\n  if exists (select 1 from phase4_draft_plan p left join public.mezmur_data_import m on m.import_id=p.import_id where m.import_id is null or m.status is distinct from p.expected_status or m.updated_at::text is distinct from p.expected_updated_at) then raise exception 'Phase 4 identity/status precondition failed; no records changed.'; end if;\nend $$;\nselect p.import_id, m.title, m.slug, m.status, m.updated_at, p.reason from phase4_draft_plan p join public.mezmur_data_import m on m.import_id=p.import_id;\n-- After review, use the existing authorized unpublish/status-transition workflow.\nrollback;\n`)
fs.writeFileSync(path.join(dir, 'PHASE_4_AUTHORIZED_EXECUTION_GUIDE.ps1'), `$connection = Read-Host 'Enter the existing Supabase PostgreSQL connection string'\nif ([string]::IsNullOrWhiteSpace($connection)) { throw 'No connection supplied; no action was taken.' }\nWrite-Host 'Run PHASE_4_DRAFT_REVERSION_DRY_RUN.sql in the authorized SQL Editor first.'\nWrite-Host 'Do not replace ROLLBACK until every import_id, status, timestamp, and reason is verified.'\n`)

const published = snapshot.filter((r) => String(r.status || '').toLowerCase() === 'published').length
fs.writeFileSync(path.join(dir, 'PHASE_4_UNPUBLISH_RESULTS.md'), `# Phase 4 draft-reversion results\n\n- Published records examined in the existing public snapshot: **${published}** of ${snapshot.length}.\n- Confirmed candidate records from public evidence: **${confirmed.size}** (${collisions.length} collision rows plus exact-duplicate candidates, de-duplicated where public identity was available).\n- Eligible for production change now: **0**. Immutable import_id values are unresolved because the configured administrator credential is empty and the public view omits import_id.\n- Skipped/blocked identity matches: **${confirmed.size}**. No title, slug, mezmur_id, historical ID, or LIMIT 1 update was used.\n- Already Draft: **unknown** until authorized private-table inspection.\n- Human-review-only findings: **${possible.length}** possible duplicates, ${encoding.length} encoding, ${formatting.length} formatting, ${zemari.length} Zemari, and ${theological.length} theological rows.\n\nNo records were deleted, merged, rewritten, unpublished, or otherwise changed. Lyrics, titles, slugs, YouTube URLs, classifications, Zemari relationships, statuses, and historical metadata are preserved.\n\n## Required sequence\n\n1. Run the existing private read-only schema/coverage query.\n2. Reconcile each candidate to immutable import_id, current status, and updated_at.\n3. Review exact reasons and remove stale candidates.\n4. Run the dry-run SQL and require zero precondition errors.\n5. Use the existing authorized unpublish/status-transition workflow and verify status=draft plus absence from mezmur_public.\n6. Verify unchanged content hashes and unaffected public records.\n\nRollback is a reviewed inverse status transition by the same import_id guarded by the recorded post-change updated_at.\n`)
console.log(JSON.stringify({ published_examined: published, confirmed_candidates: confirmed.size, eligible_now: 0, blocked_identity: confirmed.size }, null, 2))
