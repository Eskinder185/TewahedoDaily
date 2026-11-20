/**
 * Six-state Faith Challenges authorization checks (run with tsx so the TypeScript workflow can be imported).
 * Structural only: reads the review-only SQL proposal and the TypeScript workflow.
 * It cannot prove live RLS; use the staging checklist with real anon/editor/admin JWTs.
 * The retired four-state proposal is asserted to be unusable, not tested for behaviour.
 */
import assert from 'node:assert/strict'
import { readFileSync } from 'node:fs'
import { questionTransitionAllowed } from '../src/lib/play/questionLibrary.ts'
import { auditDefinerSurface } from './migration-security-audit.mjs'

const dir = 'docs/ai/proposed-migrations/'
const sql = readFileSync(`${dir}20261102_faith_challenges_live_reconciliation.sql`, 'utf8').replace(/\r\n/g, '\n')

// Obsolete four-state proposal must be labelled and self-aborting, so it cannot yield a misleading PASS.
const obsolete = readFileSync(`${dir}20261102_faith_challenges_authorization_reconciliation.sql`, 'utf8').replace(/\r\n/g, '\n')
assert.match(obsolete.split('\n')[0], /^-- OBSOLETE - DO NOT APPLY/)
assert.match(obsolete, /^do \$\$ begin raise exception 'OBSOLETE[^\n]*end \$\$;/m)
assert.ok(obsolete.indexOf('raise exception') < obsolete.indexOf('begin;'), 'abort guard must precede the transaction')

const states = ['draft', 'review', 'approved', 'rejected', 'published', 'archived']
const roles = ['anon', 'user', 'editor', 'admin', 'super_admin']
assert.match(sql, /check \(status in \('draft','review','approved','rejected','published','archived'\)\)/)

// Transition matrix parsed from SQL.
const body = sql.split('create or replace function public.play_content_transition_allowed')[1]
  .split('revoke all on function public.play_content_transition_allowed')[0]
const sqlAllowed = new Set()
const edge = (from, to, rs) => { for (const r of rs) sqlAllowed.add(`${r}:${from}:${to}`) }
assert.match(body, /p_from='draft' and p_to='review' and p_role in \('editor','admin','super_admin'\)/)
edge('draft', 'review', ['editor', 'admin', 'super_admin'])
assert.match(body, /p_role in \('admin','super_admin'\) and \(/)
for (const m of body.matchAll(/p_from='([a-z]+)' and p_to(?:='([a-z]+)'| in \(([^)]+)\))/g)) {
  if (m[1] === 'draft' && m[2] === 'review') continue
  const targets = m[2] ? [m[2]] : [...m[3].matchAll(/'([a-z]+)'/g)].map(x => x[1])
  for (const to of targets) edge(m[1], to, ['admin', 'super_admin'])
}
assert.equal(sqlAllowed.size, 3 + 13 * 2, 'unexpected transition edge count')

// The TypeScript service/UI copy must agree with the database for every role and edge.
let cases = 0
for (const role of roles) for (const from of states) for (const to of states) {
  assert.equal(questionTransitionAllowed(from, to, role), sqlAllowed.has(`${role}:${from}:${to}`), `${role}: ${from} -> ${to}`)
  cases += 1
}
for (const r of roles) for (const skip of ['draft:published', 'review:published', 'archived:published']) {
  assert.ok(!sqlAllowed.has(`${r}:${skip}`), `${skip} must not be allowed`)
}
for (const r of ['anon', 'user']) assert.ok(![...sqlAllowed].some(k => k.startsWith(`${r}:`)), `${r} has no transitions`)
assert.deepEqual([...sqlAllowed].filter(k => k.startsWith('editor:')), ['editor:draft:review'], 'editor may only submit for review')

// Database-boundary enforcement, including direct table writes.
assert.match(sql, /create trigger play_content_editorial_guard before insert or update on public\.play_content_items/)
assert.match(sql, /if not public\.play_content_transition_allowed\(old\.status,new\.status,role_name\)/)
assert.match(sql, /if not public\.play_content_transition_allowed\(current_row\.status,p_status,role_name\)/)
assert.match(sql, /New questions must be drafts with matching IDs/)
assert.match(sql, /Return to draft before editing content/)
assert.match(sql, /Editorial fields require a status transition/)
assert.match(sql, /returns public\.play_content_items language plpgsql security invoker/)
// SECURITY DEFINER surface: exactly one allowlisted function (the bounded draft rollback). The previous blanket "no SECURITY
// DEFINER" rule is replaced by an exact-signature allowlist plus per-function privilege rules, and the negative mutations below prove
// that an extra, re-signed, unrevoked, over-granted or dynamic definer function still fails.
const DEFINER_ALLOWLIST = ['public.rollback_play_content_import(uuid)']
assert.deepEqual(auditDefinerSurface(sql, { allowlist: DEFINER_ALLOWLIST }), [], 'no new SECURITY DEFINER surface')
{
  const must = (label, mutated, expected) => {
    assert.notEqual(mutated, sql, `mutation did not apply: ${label}`)
    const found = auditDefinerSurface(mutated, { allowlist: DEFINER_ALLOWLIST })
    assert.ok(found.some((v) => expected.test(v)), `${label}: expected a violation matching ${expected}, got ${JSON.stringify(found)}`)
  }
  const rollbackGrant = /grant execute on function public\.rollback_play_content_import\(uuid\) to service_role;/
  must('extra SECURITY DEFINER function',
    `${sql}\ncreate or replace function public.evil() returns void language sql security definer set search_path='' as $$ select 1 $$;\n`,
    /unexpected SECURITY DEFINER function public\.evil\(\)/)
  must('review RPC silently turned definer', sql.replace(/(create or replace function public\.review_play_content[\s\S]*?)security invoker/, '$1security definer'),
    /unexpected SECURITY DEFINER function public\.review_play_content/)
  must('import RPC silently turned definer', sql.replace(/(create or replace function public\.import_play_content_drafts[\s\S]*?)security invoker/, '$1security definer'),
    /unexpected SECURITY DEFINER function public\.import_play_content_drafts/)
  must('wrong signature', sql.replace('rollback_play_content_import(p_batch_id uuid)', 'rollback_play_content_import(p_batch_id uuid, p_force boolean)'),
    /unexpected SECURITY DEFINER function public\.rollback_play_content_import\(uuid,boolean\)/)
  must('allowlisted function no longer definer', sql.replace(/(function public\.rollback_play_content_import[\s\S]*?)security definer/, '$1security invoker'),
    /missing or not SECURITY DEFINER/)
  must('missing revoke', sql.replace(/revoke all on function public\.rollback_play_content_import\(uuid\) from public,anon,authenticated;/, ''), /missing REVOKE ALL/)
  must('revoke omits authenticated', sql.replace('rollback_play_content_import(uuid) from public,anon,authenticated;', 'rollback_play_content_import(uuid) from public,anon;'),
    /not revoked from authenticated/)
  must('revoke omits public', sql.replace('rollback_play_content_import(uuid) from public,anon,authenticated;', 'rollback_play_content_import(uuid) from anon,authenticated;'),
    /not revoked from public/)
  must('granted to authenticated too', sql.replace(rollbackGrant, 'grant execute on function public.rollback_play_content_import(uuid) to service_role, authenticated;'),
    /must not be granted to authenticated/)
  must('granted to PUBLIC', sql.replace(rollbackGrant, 'grant execute on function public.rollback_play_content_import(uuid) to public;'), /must not be granted to public|granted to PUBLIC/)
  must('no grant at all', sql.replace(rollbackGrant, ''), /no explicit EXECUTE grant/)
  must('search_path removed', sql.replace(/(function public\.rollback_play_content_import[\s\S]*?security definer) set search_path=''/, '$1'), /search_path must be fixed/)
  must('dynamic SQL inside the definer function', sql.replace(/(function public\.rollback_play_content_import[\s\S]*?begin\n)/, "$1  execute 'select 1';\n"), /dynamic SQL/)
  must('unqualified table inside the definer function', sql.replace(/delete from public\.play_content_items p/, 'delete from play_content_items p'), /unqualified relation/)
}
// The rollback must stay one atomic, fully-conditioned DELETE (no read-then-delete race) and must fail closed on an unknown batch.
{
  const rollback = sql.split('create or replace function public.rollback_play_content_import')[1].split('end $$;')[0]
  assert.match(rollback, /delete from public\.play_content_items p\s+where p\.id=audit_row\.inserted_id and p\.stable_id=audit_row\.stable_id and p\.status='draft'/)
  for (const needle of ['p.published_at is null', 'p.reviewed_by is null', 'p.updated_at=audit_row.inserted_updated_at', 'play_content_payload_sha256(p.payload)=audit_row.payload_sha256', 'returning p.id into deleted_id'])
    assert.ok(rollback.includes(needle), `rollback predicate missing: ${needle}`)
  assert.match(rollback, /Unknown import batch/)
  assert.doesNotMatch(rollback, /\bexecute\b/i)
}
// Preflight must verify the Church Library catalog the publication gate depends on, before any change is made.
{
  const preflight = sql.split('-- Schema changes are conditional')[0]
  assert.match(preflight, /to_regclass\('public\.church_library_books'\) is null/)
  assert.match(preflight, /a\.attname in \('slug','publication_status'\)/)
  const firstAlter = sql.search(/\balter table\b|\bcreate table\b|\bcreate (?:or replace )?function\b|\bdrop (?:policy|constraint)\b/i)
  const catalogCheck = sql.indexOf("to_regclass('public.church_library_books')")
  assert.ok(catalogCheck >= 0 && catalogCheck < firstAlter, 'catalog check precedes every schema change')
}
assert.match(sql, /revoke all on public\.play_content_items from public, anon, authenticated/)
assert.match(sql, /grant select on public\.play_content_items to anon, authenticated/)
assert.match(sql, /grant insert, update on public\.play_content_items to authenticated/)
assert.doesNotMatch(sql, /grant [^;]*delete[^;]*play_content_items/i)
assert.doesNotMatch(sql, /create policy [^\n]*for delete/i)
assert.doesNotMatch(sql, /create policy [^\n]*for all\b/i)

// Policy set: exactly one anon-visible policy, requiring BOTH status and published_at.
const policies = [...sql.matchAll(/create policy (\w+) on public\.play_content_items for (\w+) to ([\w,]+)/g)]
assert.deepEqual(policies.map(p => [p[1], p[2], p[3]]), [
  ['play_content_public_select', 'select', 'anon,authenticated'],
  ['play_content_staff_select', 'select', 'authenticated'],
  ['play_content_staff_insert', 'insert', 'authenticated'],
  ['play_content_editor_update', 'update', 'authenticated'],
  ['play_content_admin_update', 'update', 'authenticated'],
])
const policyText = name => sql.split(`create policy ${name}`)[1].split(/create policy|notify pgrst/)[0]
assert.match(policyText('play_content_public_select'), /using \(status='published' and published_at is not null\)/)
assert.doesNotMatch(policyText('play_content_public_select'), /is_staff/)
assert.match(policyText('play_content_staff_insert'), /status='draft' and question_id=stable_id/)
assert.match(policyText('play_content_editor_update'), /='editor' and status='draft'[\s\S]*status in \('draft','review'\)/)
assert.match(policyText('play_content_admin_update'), /in \('admin','super_admin'\)[\s\S]*in \('admin','super_admin'\)/)
for (const name of ['play_content_staff_select', 'play_content_staff_insert', 'play_content_editor_update', 'play_content_admin_update']) {
  assert.match(policyText(name), /coalesce\(public\.is_staff\(\),false\)/, `${name} must require staff`)
}

// No data loss: nothing deleted; existing review/archived rows stay valid under the new CHECK.
// The ONLY permitted DELETE is the single conditioned statement inside the allowlisted draft-rollback function; every other
// occurrence anywhere in the migration still fails, as do TRUNCATE and DROP TABLE/COLUMN.
{
  const code = sql.replace(/^\s*--.*$/gm, '')
  const [beforeRollback, rest] = code.split('create or replace function public.rollback_play_content_import')
  const [rollbackBody, afterRollback] = rest.split('end $$;')
  assert.equal((rollbackBody.match(/\bdelete\s+from\b/gi) || []).length, 1, 'exactly one DELETE, inside the rollback function')
  assert.match(rollbackBody, /delete from public\.play_content_items p\s+where /)
  assert.doesNotMatch(beforeRollback + afterRollback, /\bdelete\s+from\b|\btruncate\b|\bdrop\s+(table|column)\b/i)
  assert.doesNotMatch(rollbackBody, /\btruncate\b|\bdrop\s+(table|column)\b/i)
}
assert.match(sql, /begin;\s*select pg_advisory_xact_lock/)
assert.match(sql, /not valid;\s*alter table public\.play_content_items validate constraint play_content_status_v2/)

console.log(`Six-state authorization checks passed (${cases} role/transition cases); obsolete four-state proposal is self-aborting. Runtime RLS is UNVERIFIED until staging.`)
