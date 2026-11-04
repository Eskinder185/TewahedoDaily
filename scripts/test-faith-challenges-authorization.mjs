/**
 * Six-state Faith Challenges authorization checks (run with tsx so the TypeScript workflow can be imported).
 * Structural only: reads the review-only SQL proposal and the TypeScript workflow.
 * It cannot prove live RLS; use the staging checklist with real anon/editor/admin JWTs.
 * The retired four-state proposal is asserted to be unusable, not tested for behaviour.
 */
import assert from 'node:assert/strict'
import { readFileSync } from 'node:fs'
import { questionTransitionAllowed } from '../src/lib/play/questionLibrary.ts'

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
assert.doesNotMatch(sql.replace(/^\s*--.*$/gm, ''), /security definer/i, 'no new SECURITY DEFINER surface')
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
assert.doesNotMatch(sql, /\bdelete\s+from\b|\btruncate\b|\bdrop\s+(table|column)\b/i)
assert.match(sql, /begin;\s*select pg_advisory_xact_lock/)
assert.match(sql, /not valid;\s*alter table public\.play_content_items validate constraint play_content_status_v2/)

console.log(`Six-state authorization checks passed (${cases} role/transition cases); obsolete four-state proposal is self-aborting. Runtime RLS is UNVERIFIED until staging.`)
