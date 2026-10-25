import assert from 'node:assert/strict'
import { readFileSync } from 'node:fs'

const read = (path: string) => readFileSync(new URL(`../${path}`, import.meta.url), 'utf8')
const migration = read('supabase/migrations/20261024220000_hymn_trash_final_repair.sql')
const verification = read('supabase/mezmur-import/VERIFY_HYMN_TRASH_FINAL_REPAIR_READ_ONLY.sql')
const viewRepair = read('supabase/mezmur-import/REPAIR_ZEMARIS_WITH_COUNTS_TRASH_VIEW.sql')
const service = read('src/lib/cms/contentTrashService.ts')
const trashUi = read('src/pages/admin/HymnTrashAdmin.tsx')
const mezmurUi = read('src/pages/admin/MezmurList.tsx')
const zemariUi = read('src/pages/admin/ZemarisAdmin.tsx')

assert.match(migration, /v_role not in \('admin', 'super_admin'\).*move content to Trash/s)
assert.match(migration, /v_role not in \('admin', 'super_admin'\).*restore content/s)
assert.match(migration, /v_role is distinct from 'super_admin'.*permanently delete/s)
assert.match(migration, /v_role is distinct from 'super_admin'.*reassign and permanently delete/s)
for (const table of ['mezmur_data_import', 'zemaris', 'mezmur_collections_import', 'mezmur_sections_import']) {
  assert.match(migration, new RegExp(`revoke delete on public\\.${table} from authenticated`))
}
assert.doesNotMatch(migration, /disable row level security/i)
assert.doesNotMatch(migration, /grant delete .* to authenticated/i)
for (const table of ['mezmur_data_import', 'zemaris', 'mezmur_collections_import', 'mezmur_sections_import']) {
  assert.match(migration, new RegExp(`alter table public\\.${table}[\\s\\S]*?deleted_at[\\s\\S]*?deleted_by[\\s\\S]*?deleted_from_status`))
}
assert.match(migration, /create index if not exists mezmur_collections_import_deleted_at_idx/)
assert.match(migration, /create index if not exists mezmur_sections_import_deleted_at_idx/)
assert.match(migration, /create trigger guard_mezmur_data_import_trash_metadata/)
assert.doesNotMatch(migration, /current_setting\('app\.hymn_trash_rpc'/)
assert.match(migration, /current_user <> v_rpc_owner/)
for (const table of ['mezmur_data_import', 'mezmur_collections_import', 'mezmur_sections_import']) {
  assert.match(migration, new RegExp(`alter table public\\.${table}[\\s\\S]*?add column if not exists import_id uuid default gen_random_uuid\\(\\)`))
  assert.match(migration, new RegExp(`update public\\.${table}[\\s\\S]*?set import_id = gen_random_uuid\\(\\)[\\s\\S]*?where import_id is null`))
  assert.match(migration, new RegExp(`alter table public\\.${table}[\\s\\S]*?alter column import_id set default gen_random_uuid\\(\\)[\\s\\S]*?alter column import_id set not null`))
}
assert.match(migration, /create or replace function public\.guard_mezmur_import_publication\(\)/)
assert.match(migration, /v_validate_publication := lower\(trim\(coalesce\(new\.status, ''\)\)\) = 'published'/)
assert.match(migration, /new\.title is distinct from old\.title/)
assert.match(migration, /new\.lyrics_amharic is distinct from old\.lyrics_amharic/)
assert.match(migration, /new\.rights_status is distinct from old\.rights_status/)
assert.match(migration, /lock table public\.mezmur_data_import in share row exclusive mode/)
assert.match(migration, /create unique index if not exists mezmur_data_import_import_id_uidx/)
assert.match(migration, /pg_advisory_xact_lock\(hashtextextended\('hymn-trash:' \|\| v_type \|\| ':' \|\| v_key, 0\)\)/)
assert.match(migration, /where import_id = v_import_id for update/)
assert.match(migration, /where import_id = v_import_id and deleted_at is not null/)
assert.match(migration, /requires its UUID stable identifier, not a slug/)
assert.doesNotMatch(migration, /order by[\s\S]*limit 1 for update/i)
assert.match(migration, /delete from public\.mezmur_section_links_import where mezmur_slug = v_slug/)
assert.match(migration, /delete from public\.mezmur_category_links_import where mezmur_slug = v_slug/)
assert.match(migration, /delete from public\.mezmur_occasion_links_import where mezmur_slug = v_slug/)
assert.doesNotMatch(migration, /delete from public\.zemaris where id.*p_content_type = 'mezmur'/s)
assert.match(migration, /This Zemari is associated with % Mezmurs\. Reassign them before permanent deletion/)
assert.match(migration, /update public\.mezmur_data_import set\s+zemari_id = v_target\.id/s)
assert.match(migration, /status = 'draft'.*'restored'.*'previous_status', v_previous/s)
assert.match(migration, /insert into public\.content_deletion_events/g)
assert.match(migration, /previous_status text/)
assert.match(migration, /relationship_changes jsonb/)
assert.match(migration, /and m\.deleted_at is null/)
assert.match(migration, /from public\.mezmur_data_import\s+where deleted_at is null/s)
assert.match(migration, /public\.is_public_mezmur_import_slug\(mezmur_slug\)/)
assert.match(migration, /deleted_at is null and status = 'published'/)
assert.doesNotMatch(migration, /select z\.\*/i, 'view replacement must preserve the existing column order')
assert.match(migration, /end as mezmur_count,\s+\(select count\(\*\).*as published_mezmur_count,\s+z\.deleted_at, z\.deleted_by, z\.deleted_from_status/s)
assert.match(migration, /v_names\[1:17\] is distinct from v_expected_prefix/)
assert.match(migration, /v_types\[16\] is distinct from 'bigint'/)
assert.doesNotMatch(migration, /count\(\*\)::integer.*(?:mezmur_count|published_mezmur_count)/s)
assert.doesNotMatch(migration, /select schemaname, tablename, policyname from pg_policies/)
assert.match(migration, /drop policy if exists mezmur_data_import_staff_read/)
for (const removed of ['structured_lyrics', 'lyrics_language', 'source_info', 'external_lyrics_url', 'last_verified_at', 'related_content']) {
  assert.doesNotMatch(migration, new RegExp(`\\b${removed}\\b`), `${removed} must never be recreated or referenced`)
  assert.match(verification, new RegExp(`'${removed}'`), `verification must prove ${removed} remains absent`)
}
assert.match(viewRepair, /create or replace view public\.zemaris_with_counts/)
assert.match(viewRepair, /z\.deleted_at,\s+z\.deleted_by,\s+z\.deleted_from_status/s)
assert.match(viewRepair, /notify pgrst, 'reload schema'/)
assert.doesNotMatch(viewRepair, /alter table|add column|drop column|disable row level security/i)

assert.match(service, /requireCmsStaffSession/)
assert.match(service, /trash_hymn_content/)
assert.match(service, /restore_hymn_content/)
assert.match(service, /permanently_delete_hymn_content/)
assert.match(service, /reassign_and_delete_zemari/)
assert.match(service, /Permission denied while trying to/)
assert.match(service, /PGRST202/)
assert.match(service, /wrong signature/)
assert.match(service, /stale schema metadata/)
assert.match(service, /configured Supabase project/)
assert.match(service, /missing the internal UUID identifiers/)
assert.match(service, /row\.import_id/)
assert.match(service, /isStaleZemariCountsView/)
assert.match(service, /from\('zemaris' as never\)/)
assert.match(service, /count Mezmurs for trashed Zemaris/)
assert.match(trashUi, /Restore as Draft/)
assert.match(trashUi, /Delete Permanently/)
assert.match(trashUi, /Reassign and Delete Permanently/)
assert.match(trashUi, /disabled=\{Boolean\(busyKey\)/)
assert.match(mezmurUi, /Move to Trash/)
assert.match(zemariUi, /associated Mezmur/)

type Role = 'super_admin' | 'admin' | 'editor' | 'user' | 'anon'
type State = {
  mezmur: { exists: boolean; status: 'draft' | 'published'; deleted: boolean; zemariId: string }
  zemari: { exists: boolean; deleted: boolean }
  categoryLinks: string[]
  occasionLinks: string[]
  audit: string[]
}

function initial(): State {
  return {
    mezmur: { exists: true, status: 'published', deleted: false, zemariId: 'z1' },
    zemari: { exists: true, deleted: false },
    categoryLinks: ['shared-category'],
    occasionLinks: ['shared-occasion'],
    audit: [],
  }
}

function trashMezmur(state: State, role: Role) {
  if (!['admin', 'super_admin'].includes(role)) throw Object.assign(new Error('forbidden'), { code: '42501' })
  if (state.mezmur.deleted) return
  state.mezmur.deleted = true
  state.mezmur.status = 'draft'
  state.audit.push('trashed:mezmur:actor:previous=published')
}

function restoreMezmur(state: State, role: Role) {
  if (!['admin', 'super_admin'].includes(role)) throw Object.assign(new Error('forbidden'), { code: '42501' })
  assert.equal(state.mezmur.deleted, true)
  state.mezmur.deleted = false
  state.mezmur.status = 'draft'
  state.audit.push('restored:mezmur:actor')
}

function permanentlyDeleteMezmur(state: State, role: Role) {
  if (role !== 'super_admin') throw Object.assign(new Error('forbidden'), { code: '42501' })
  assert.equal(state.mezmur.deleted, true, 'permanent deletion requires Trash first')
  state.categoryLinks = []
  state.occasionLinks = []
  state.mezmur.exists = false
  state.audit.push('permanently_deleted:mezmur:actor')
}

for (const role of ['editor', 'user', 'anon'] as Role[]) {
  assert.throws(() => trashMezmur(initial(), role), (error: unknown) => (error as { code?: string }).code === '42501')
}

const restored = initial()
trashMezmur(restored, 'super_admin')
assert.equal(restored.mezmur.status, 'draft')
assert.equal(restored.mezmur.deleted, true)
assert.equal(restored.zemari.exists, true, 'trashing a Mezmur must preserve its Zemari')
const auditCountAfterFirstTrash = restored.audit.length
trashMezmur(restored, 'super_admin')
assert.equal(restored.audit.length, auditCountAfterFirstTrash, 'double-click trash is idempotent')
restoreMezmur(restored, 'admin')
assert.equal(restored.mezmur.status, 'draft', 'restore must not silently republish')
assert.equal(restored.mezmur.deleted, false)

const deleted = initial()
assert.throws(() => permanentlyDeleteMezmur(deleted, 'super_admin'), /permanent deletion requires Trash first/)
trashMezmur(deleted, 'admin')
assert.throws(() => permanentlyDeleteMezmur(deleted, 'editor'), (error: unknown) => (error as { code?: string }).code === '42501')
permanentlyDeleteMezmur(deleted, 'super_admin')
assert.equal(deleted.mezmur.exists, false)
assert.equal(deleted.zemari.exists, true, 'permanent Mezmur deletion must preserve its Zemari')
assert.deepEqual(deleted.categoryLinks, [], 'only this Mezmur association is removed')
assert.deepEqual(deleted.occasionLinks, [], 'only this Mezmur association is removed')
assert.ok(deleted.audit.every((event) => event.includes('actor')), 'audit events retain actor context')

console.log('Hymn Trash security and relationship regression tests passed.')
