import assert from 'node:assert/strict'
import { readFileSync } from 'node:fs'
import {
  canPublishMezmur,
  mezmurStatuses,
  mezmurStatusLabel,
  normalizeMezmurStatus,
  publicationBlockReason,
} from '../src/lib/cms/mezmurPublicationRules.ts'
import { evaluateCmsStaffIdentity } from '../src/lib/cms/cmsStaffIdentity.ts'
import { staffWriteError } from '../src/lib/cms/cmsWriteError.ts'
import {
  assertOrdinaryMezmurPayloadSafe,
  protectedMezmurSaveFields,
} from '../src/lib/cms/mezmurSavePayloadSafety.ts'

// 1. Two-status workflow constants & normalization
assert.deepEqual(mezmurStatuses, ['draft', 'published'])
assert.equal(mezmurStatusLabel('draft'), 'Draft')
assert.equal(mezmurStatusLabel('published'), 'Published')
assert.equal(mezmurStatusLabel('pending_review'), 'Draft')
assert.equal(mezmurStatusLabel(null), 'Draft')

assert.equal(normalizeMezmurStatus('draft'), 'draft')
assert.equal(normalizeMezmurStatus('published'), 'published')
assert.equal(normalizeMezmurStatus('pending_review'), 'draft')
assert.equal(normalizeMezmurStatus(null), 'draft')

// 2. Simplified publication rules (no separate editorial approval step required)
const eligibleDraft = {
  rightsStatus: 'owned',
  rightsConfirmedAt: '2026-10-24T12:00:00.000Z',
  rightsConfirmedBy: '11111111-1111-1111-1111-111111111111',
  title: 'Test Mezmur',
  slug: 'test-mezmur',
  lyricsAmharic: 'መዝሙር',
}

assert.equal(canPublishMezmur('super_admin'), true)
assert.equal(canPublishMezmur('admin'), true)
assert.equal(canPublishMezmur('editor'), true)
assert.equal(canPublishMezmur('contributor'), false)
assert.equal(canPublishMezmur('user'), false)
assert.equal(canPublishMezmur(null), false)

assert.equal(publicationBlockReason({ ...eligibleDraft, role: 'editor' }), null)
assert.equal(publicationBlockReason({ ...eligibleDraft, role: 'admin' }), null)
assert.equal(publicationBlockReason({ ...eligibleDraft, role: 'super_admin' }), null)
assert.equal(publicationBlockReason({ ...eligibleDraft, role: 'editor', rightsStatus: 'unknown', rightsConfirmedAt: null }), null)

// 5. Unauthorized users cannot publish
assert.match(publicationBlockReason({ ...eligibleDraft, role: 'contributor' }) || '', /role is required/i)
assert.match(publicationBlockReason({ ...eligibleDraft, role: 'user' }) || '', /role is required/i)
assert.match(publicationBlockReason({ ...eligibleDraft, role: null }) || '', /role is required/i)

// 6. Publication requires a title, slug, and Amharic lyrics
assert.match(
  publicationBlockReason({ ...eligibleDraft, role: 'editor', title: '   ' }) || '',
  /Title, slug, and Amharic lyrics are required/i,
)
assert.match(
  publicationBlockReason({ ...eligibleDraft, role: 'editor', slug: '' }) || '',
  /Title, slug, and Amharic lyrics are required/i,
)
assert.match(
  publicationBlockReason({ ...eligibleDraft, role: 'editor', lyricsAmharic: '' }) || '',
  /Title, slug, and Amharic lyrics are required/i,
)

// Rights metadata is retained as audit data and does not gate ordinary Publish.
assert.equal(publicationBlockReason({ ...eligibleDraft, role: 'super_admin', rightsStatus: 'external_only' }), null)

// Staff identity verification
assert.deepEqual(
  evaluateCmsStaffIdentity({
    sessionUserId: 'user-1',
    verifiedUserId: 'user-1',
    profileId: 'user-1',
    profileRole: 'super_admin',
    isStaff: true,
  }),
  { userId: 'user-1', profileRole: 'super_admin', isStaff: true },
)
assert.throws(
  () =>
    evaluateCmsStaffIdentity({
      sessionUserId: 'cached-user',
      verifiedUserId: 'jwt-user',
      profileId: 'jwt-user',
      profileRole: 'super_admin',
      isStaff: true,
    }),
  /Stale session.*cached-user.*jwt-user/i,
)
assert.throws(
  () =>
    evaluateCmsStaffIdentity({
      sessionUserId: 'user-1',
      verifiedUserId: 'user-1',
      profileId: 'user-1',
      profileRole: 'super_admin',
      isStaff: false,
    }),
  /Authorization mismatch.*super_admin.*is_staff\(\).*false/i,
)
assert.throws(
  () =>
    evaluateCmsStaffIdentity({
      sessionUserId: 'user-1',
      verifiedUserId: 'user-1',
      profileId: 'user-1',
      profileRole: 'contributor',
      isStaff: false,
    }),
  /contributor.*editor, admin, or super_admin/i,
)

// Ordinary save payload safety: never fabricates rights or mutates protected audit columns
const ordinaryPayload = {
  mezmur_id: 'mezmur-1',
  slug: 'test-mezmur',
  title: 'Test',
  lyrics_amharic: 'መዝሙር',
  status: 'draft',
  zemari_id: null,
  updated_at: new Date(0).toISOString(),
}
assert.deepEqual(protectedMezmurSaveFields(ordinaryPayload), [])
assert.doesNotThrow(() => assertOrdinaryMezmurPayloadSafe(ordinaryPayload))
for (const field of [
  'review_status',
  'rights_status',
  'publication_approved_at',
  'publication_approved_by',
]) {
  assert.throws(
    () => assertOrdinaryMezmurPayloadSafe({ ...ordinaryPayload, [field]: 'changed' }),
    new RegExp(field),
  )
}

// 10. Permission errors display understandable explanations
assert.match(
  staffWriteError('RPC public.publish_mezmur_import', {
    code: '42501',
    message: 'An editor, admin, or super admin role is required',
  }).message,
  /You do not have permission.*editor, admin, or super admin role is required/i,
)
assert.match(
  staffWriteError('PATCH public.mezmur_data_import', {
    code: '42501',
    message: 'Use publish_mezmur_import for publication transitions',
  }).message,
  /trigger public\.mezmur_data_import_publication_guard.*RPC public\.publish_mezmur_import/i,
)
assert.match(
  staffWriteError('PATCH public.mezmur_data_import', {
    code: '42501',
    message: 'Lyrics rights metadata can only be changed through the protected rights-verification workflow',
  }).message,
  /protected lyrics-rights.*dedicated rights-verification workflow/i,
)
assert.match(
  staffWriteError('POST public.mezmur_data_import', {
    code: '42501',
    message: 'permission denied for sequence mezmur_data_import_id_seq',
    hint: 'Grant USAGE on the sequence to the intended role.',
  }).message,
  /Permission denied \(42501\).*POST public\.mezmur_data_import.*sequence mezmur_data_import_id_seq.*Grant USAGE/i,
)
assert.match(
  staffWriteError('PATCH public.mezmur_data_import', {
    code: '42501',
    message: 'new row violates row-level security policy for table "mezmur_data_import"',
    details: 'Failing row contains (...)',
  }).message,
  /Permission denied \(42501\).*PATCH public\.mezmur_data_import.*table mezmur_data_import.*Failing row/i,
)
assert.doesNotMatch(
  staffWriteError('PATCH public.mezmur_data_import', {
    code: '42501',
    message: 'permission denied for table mezmur_data_import',
  }).message,
  /FIX_ZEMARI_STAFF_WRITE/i,
)

// 9. Normal editor contains no editorial approval panel, raw JSON, or guarded approval text
const editorSource = readFileSync(
  new URL('../src/pages/admin/MezmurEditor.tsx', import.meta.url),
  'utf8',
)
assert.doesNotMatch(editorSource, /Editorial approval/i)
assert.doesNotMatch(editorSource, /Verified publication-rights status/i)
assert.doesNotMatch(editorSource, /Lyrics publication rights/i)
assert.doesNotMatch(editorSource, /Approve Mezmur/i)
assert.doesNotMatch(editorSource, /Approval notes/i)
assert.doesNotMatch(editorSource, /Approval recorded/i)
assert.doesNotMatch(editorSource, /Source information/i)
assert.doesNotMatch(editorSource, /Editorial review:/i)
assert.doesNotMatch(editorSource, /needs_review/i)
assert.doesNotMatch(editorSource, /JSON\.stringify\(version\.snapshot/)
assert.doesNotMatch(editorSource, /disabled=\{busy \|\| row\?\.rights_status === 'external_only'\}/)
assert.match(editorSource, /CMS role: \{profile\?\.role \|\| 'none'\} · Status: \{mezmurStatusLabel\(currentStatus\)\}/)

// 11. Forward-only migration safety: existing migration untouched, new migration preserves all records
const priorMigration = readFileSync(
  new URL('../supabase/migrations/20261024120000_mezmur_import_publication_workflow.sql', import.meta.url),
  'utf8',
)
assert.match(priorMigration, /create or replace function public\.publish_mezmur_import/i)

const simplifiedMigration = readFileSync(
  new URL('../supabase/migrations/20261027110000_mezmur_simple_owner_publication.sql', import.meta.url),
  'utf8',
)
assert.match(simplifiedMigration, /create or replace function public\.guard_mezmur_import_publication/i)
assert.match(simplifiedMigration, /create or replace function public\.publish_mezmur_import/i)
assert.match(simplifiedMigration, /create or replace view public\.mezmur_public/i)
assert.match(simplifiedMigration, /revoke all on function public\.publish_mezmur_import[\s\S]+from public, anon/i)
assert.match(simplifiedMigration, /grant execute on function public\.publish_mezmur_import[\s\S]+to authenticated/i)
assert.doesNotMatch(simplifiedMigration, /disable\s+row\s+level\s+security/i)
assert.doesNotMatch(simplifiedMigration, /grant\s+(all|update|insert)[^;]+\s+to\s+anon/i)
assert.doesNotMatch(
  simplifiedMigration.match(/create function public\.publish_mezmur_import[\s\S]*?\$\$;/i)?.[0] || '',
  /review_status\s*(?:<>|!=|=)\s*'approved'/i,
)
assert.doesNotMatch(simplifiedMigration, /p_rights_status/i)
assert.match(simplifiedMigration, /publication_approved_at is not null/i)
assert.match(simplifiedMigration, /case when[\s\S]+then null else lyrics_amharic end/i)
assert.match(simplifiedMigration, /youtube_url[\s\S]+source_url/i)
for (const removedField of [
  'structured_lyrics',
  'lyrics_language',
  'source_info',
  'external_lyrics_url',
  'last_verified_at',
  'related_content',
]) {
  assert.doesNotMatch(simplifiedMigration, new RegExp(`\\b${removedField}\\b`, 'i'))
}
assert.match(simplifiedMigration, /where deleted_at is null/i)
assert.match(simplifiedMigration, /where import_id = p_import_id[\s\S]+for update/i)
assert.match(simplifiedMigration, /set status = 'published'/i)
assert.match(simplifiedMigration, /grant select on public\.mezmur_public to anon, authenticated/i)
assert.doesNotMatch(
  simplifiedMigration.match(/create function public\.publish_mezmur_import[\s\S]*?\$\$;/i)?.[0] || '',
  /Editorial approval|required.*review_status|review_status.*approved/i,
)
// Confirm migration does not mass-update, delete, or overwrite existing rows outside the RPC function body
const migrationWithoutFunctions = simplifiedMigration.replace(/\$\$[\s\S]*?\$\$/g, '$$$$')
assert.doesNotMatch(migrationWithoutFunctions, /\b(update|delete\s+from|truncate)\s+public\.mezmur_data_import/i)

const twoStatusVerification = readFileSync(
  new URL('../supabase/mezmur-import/VERIFY_TWO_STATUS_WORKFLOW_READ_ONLY.sql', import.meta.url),
  'utf8',
)
assert.match(twoStatusVerification, /has_function_privilege\('anon'/i)
assert.match(twoStatusVerification, /from public\.mezmur_public/i)
assert.match(twoStatusVerification, /pg_get_viewdef/i)
assert.doesNotMatch(
  twoStatusVerification,
  /\b(insert\s+into|update\s+public\.|delete\s+from|grant\s|revoke\s|alter\s|create\s|drop\s|truncate\s)/i,
)

const diagnostic = readFileSync(
  new URL('../supabase/mezmur-import/DIAGNOSE_MEZMUR_42501_READ_ONLY.sql', import.meta.url),
  'utf8',
)
assert.match(diagnostic, /from pg_trigger/i)
assert.match(diagnostic, /from pg_policies/i)
assert.match(diagnostic, /has_sequence_privilege/i)
assert.match(diagnostic, /auth\.uid\(\).*profile/is)
assert.doesNotMatch(diagnostic, /\b(insert|update|delete|grant|revoke|alter|create|drop|truncate)\s+(?:table|on|into|public\.)/i)

console.log('Mezmur two-status publication, authorization, and migration safety tests passed.')
