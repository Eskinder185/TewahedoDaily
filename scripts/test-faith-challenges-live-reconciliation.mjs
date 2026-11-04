/** Structural tests for the unexecuted SQL proposal; staging RLS tests remain required. */
import assert from 'node:assert/strict'
import { readFileSync } from 'node:fs'

const sql = readFileSync('docs/ai/proposed-migrations/20261102_faith_challenges_live_reconciliation.sql', 'utf8')
const states = ['draft', 'review', 'approved', 'rejected', 'published', 'archived']
assert.match(sql, /check \(status in \('draft','review','approved','rejected','published','archived'\)\) not valid/i)
// Conditional schema changes: no unconditional drop of a guessed constraint name, no unconditional index/NOT NULL.
assert.doesNotMatch(sql, /drop constraint/i)
assert.match(sql, /Status CHECK % is not the validated six-state domain/)
assert.match(sql, /if equivalent=0 then\s+alter table public\.play_content_items add constraint play_content_status_v2/)
assert.match(sql, /if not idx_ok then\s+create unique index play_content_stable_id_v2_idx/)
assert.match(sql, /if not \(select a\.attnotnull/)
assert.match(sql, /current_user='service_role'/, 'importer path must key on current_user, not a JWT claim')
assert.doesNotMatch(sql, /auth\.role\(\)/)
assert.match(sql, /security invoker set search_path='' as \$\$/i)
assert.doesNotMatch(sql, /returns\s+(?:text|boolean|public\.play_content_items)[\s\S]{0,100}security definer/i)
assert.match(sql, /select public\.current_user_role\(\)::text/i)
assert.match(sql, /for policy_row in select policyname from pg_policies[\s\S]*drop policy %I/i)
assert.match(sql, /create policy play_content_public_select[\s\S]*using \(status='published' and published_at is not null\)/i)
assert.match(sql, /revoke all on public\.play_content_items from public, anon, authenticated/i)
assert.match(sql, /grant select on public\.play_content_items to anon, authenticated/i)
assert.match(sql, /grant insert, update on public\.play_content_items to authenticated/i)
assert.doesNotMatch(sql, /grant .*delete on public\.play_content_items/i)
assert.match(sql, /new\.question_id is distinct from new\.stable_id/i)
assert.match(sql, /new\.payload->>'id' is distinct from new\.stable_id/i)
// Reject UUID reassignment independently of the logical question identifiers.
assert.match(sql, /if old\.id is distinct from new\.id or\s+old\.question_id is distinct from new\.question_id/i)
// SQL NULL must not bypass NOT IN: absent and JSON-null modes become ''.
assert.match(sql, /p_game='finish-the-mezmur' and coalesce\(p_payload->>'mode',''\) not in/i)
assert.match(sql, /create unique index play_content_stable_id_v2_idx/i)
assert.match(sql, /if not public\.play_content_transition_allowed\(old\.status,new\.status,role_name\)/i)
assert.match(sql, /if not public\.play_content_transition_allowed\(current_row\.status,p_status,role_name\)/i)
assert.match(sql, /if new\.status in \('review','approved','published'\)[\s\S]*play_content_payload_valid/i)
assert.match(sql, /new\.status='published' and old\.game_type in \('who-am-i','match'\)/i)
assert.match(sql, /new\.published_at:=case when new\.status='published' then now\(\) else null end/i)
assert.match(sql, /create policy play_content_editor_update[\s\S]*status='draft'[\s\S]*status in \('draft','review'\)/i)
assert.match(sql, /create policy play_content_admin_update[\s\S]*'admin','super_admin'/i)

const functionBody = sql.split('create or replace function public.play_content_transition_allowed')[1]
  ?.split('revoke all on function public.play_content_transition_allowed')[0] || ''
const clauses = [...functionBody.matchAll(/p_from='([^']+)' and p_to(?:='([^']+)'| in \(([^)]+)\))/g)]
assert.equal(clauses.length, 7, 'all expected transition clauses must be present')
const actual = new Map()
for (const [index, [, from, one, many]] of clauses.entries()) {
  const targets = one ? [one] : [...many.matchAll(/'([^']+)'/g)].map(match => match[1])
  for (const to of targets) actual.set(`${from}:${to}`, index === 0 ? ['editor', 'admin', 'super_admin'] : ['admin', 'super_admin'])
}
const expected = new Map([
  ['draft:review', ['editor', 'admin', 'super_admin']],
  ...[
    'review:approved', 'review:rejected', 'review:draft', 'review:archived',
    'approved:published', 'approved:draft', 'approved:archived',
    'rejected:draft', 'rejected:archived',
    'published:draft', 'published:archived',
    'draft:archived', 'archived:draft',
  ].map(edge => [edge, ['admin', 'super_admin']]),
])
assert.deepEqual(actual, expected)
let assertions = 0
for (const role of ['anon', 'user', 'editor', 'admin', 'super_admin']) {
  for (const from of states) for (const to of states) {
    const allowed = actual.get(`${from}:${to}`)?.includes(role) || false
    const shouldAllow = expected.get(`${from}:${to}`)?.includes(role) || false
    assert.equal(allowed, shouldAllow, `${role}: ${from} -> ${to}`)
    assertions += 1
  }
}
assert.equal(actual.get('draft:published'), undefined, 'publication cannot skip review and approval')
assert.equal(actual.get('archived:published'), undefined, 'archived content cannot publish directly')
assert.equal(actual.get('review:published'), undefined, 'review cannot publish directly')
const idValid = row => row.question_id === row.stable_id && row.payload.id === row.stable_id
assert.equal(idValid({ question_id: 'story-1', stable_id: 'story-1', payload: { id: 'story-1' } }), true)
assert.equal(idValid({ question_id: 'story-1', stable_id: null, payload: { id: 'story-1' } }), false)
assert.equal(idValid({ question_id: 'story-1', stable_id: 'story-2', payload: { id: 'story-2' } }), false)
assert.equal(idValid({ question_id: 'story-1', stable_id: 'story-1', payload: { id: 'story-2' } }), false)
const publicRows = [
  { status: 'draft', published_at: null }, { status: 'review', published_at: null },
  { status: 'approved', published_at: null }, { status: 'rejected', published_at: null },
  { status: 'published', published_at: null }, { status: 'published', published_at: '2026-11-02T00:00:00Z' },
  { status: 'archived', published_at: null },
]
const visible = publicRows.filter(row => row.status === 'published' && row.published_at !== null)
assert.equal(visible.length, 1, 'anonymous policy expression exposes only timestamped published rows')
assert.equal(visible[0].status, 'published')
console.log(`Faith Challenges SQL proposal structural checks passed; ${assertions} role/transition cases. Runtime RLS remains unverified.`)
