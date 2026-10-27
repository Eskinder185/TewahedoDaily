import fs from 'node:fs'
import path from 'node:path'

const dir = path.join(process.cwd(), 'reports', 'mezmur-quality-audit')
const input = path.join(dir, 'PHASE_4_IDENTITY_RECONCILIATION.csv')
if (!fs.existsSync(input)) throw new Error('Run reconcile-mezmur-phase4-identities.ts first.')
function parseCsv(value: string) {
  const out: string[][] = []; let row: string[] = []; let cell = ''; let quoted = false
  for (let i = 0; i < value.length; i++) { const c = value[i]; if (quoted && c === '"' && value[i + 1] === '"') { cell += '"'; i++; continue } if (c === '"') { quoted = !quoted; continue } if (!quoted && c === ',') { row.push(cell); cell = ''; continue } if (!quoted && (c === '\n' || c === '\r')) { if (c === '\r' && value[i + 1] === '\n') i++; row.push(cell); if (row.some(Boolean)) out.push(row); row = []; cell = ''; continue } cell += c }
  if (cell || row.length) { row.push(cell); out.push(row) }
  return out
}
const parsed = parseCsv(fs.readFileSync(input, 'utf8'))
const fields = parsed.shift() || []
const rows = parsed.map((cells) => Object.fromEntries(fields.map((field, i) => [field.replace(/^\uFEFF/, ''), cells[i] || ''])) as Record<string, string>)
const verified = rows.filter((r) => r.match_state === 'verified_published' && /^[0-9a-f-]{36}$/i.test(r.import_id))
const quote = (v: unknown) => { const s = String(v ?? ''); return /[",\r\n]/.test(s) ? `"${s.replaceAll('"', '""')}"` : s }
const planColumns = ['import_id', 'expected_status', 'reason', 'expected_updated_at']
fs.writeFileSync(path.join(dir, 'PHASE_4_VERIFIED_DRAFT_PLAN.csv'), `${planColumns.join(',')}\n${verified.map((r) => [r.import_id, 'published', r.reason, r.source_updated_at].map(quote).join(',')).join('\n')}\n`)
fs.writeFileSync(path.join(dir, 'PHASE_4_APPLY_DRAFT_REVERSION.sql'), `-- Execute only after reviewing PHASE_4_VERIFIED_DRAFT_PLAN.csv.\n-- Run from an authorized PostgreSQL administrator session.\nbegin;\ncreate temporary table phase4_plan (import_id uuid primary key, expected_status text not null check (expected_status='published'), reason text not null, expected_updated_at text not null);\n\\copy phase4_plan from 'reports/mezmur-quality-audit/PHASE_4_VERIFIED_DRAFT_PLAN.csv' with (format csv, header true);\ncreate temporary table phase4_backup on commit drop as select m.* from public.mezmur_data_import m join phase4_plan p on p.import_id=m.import_id;\n\ndo $$ begin\n  if exists (select 1 from phase4_plan p left join public.mezmur_data_import m on m.import_id=p.import_id where m.import_id is null or m.status is distinct from p.expected_status or m.updated_at::text is distinct from p.expected_updated_at or m.deleted_at is not null) then raise exception 'Phase 4 precondition failed; transaction aborted.'; end if;\nend $$;\n\n-- The guarded trigger remains enabled. This changes status only; all content and relationships remain untouched.\nupdate public.mezmur_data_import m set status='draft' where m.import_id in (select import_id from phase4_plan);\n\nselect m.import_id, m.status, b.status as previous_status, p.reason from public.mezmur_data_import m join phase4_plan p on p.import_id=m.import_id join phase4_backup b on b.import_id=m.import_id;\n-- Verify public projection exclusion before committing.\nselect p.import_id from phase4_plan p join public.mezmur_public v on false;\n\n-- Replace with COMMIT only after reviewing both result sets and public visibility.\nrollback;\n`)
console.log(JSON.stringify({ verified_published: verified.length, plan: 'PHASE_4_VERIFIED_DRAFT_PLAN.csv' }, null, 2))
