import assert from 'node:assert/strict'
import { readFileSync } from 'node:fs'
import { supabase } from '../src/lib/supabase/client.ts'
import { getMezmurBySlug } from '../src/lib/publicContent/hymnBrowse.ts'
import {
  canPublishMezmur,
  isVerifiedMezmurRights,
  publicationBlockReason,
} from '../src/lib/cms/mezmurPublicationRules.ts'
import { emptyMezmur } from '../src/lib/cms/mezmurService.ts'

console.log('--- STARTING FINAL LYRICS VISIBILITY & PUBLICATION REPAIR TEST SUITE ---')

// -----------------------------------------------------------------------------
// 1. MIGRATION FILE VERIFICATION
// -----------------------------------------------------------------------------
{
  const sql = readFileSync('supabase/migrations/20261025010000_owner_authorized_public_mezmur_lyrics.sql', 'utf8')

  assert.ok(sql.includes('create or replace function public.guard_mezmur_import_publication()'), '1.1: Guard trigger function defined')
  assert.ok(sql.includes("coalesce(current_setting('tewahedo.rights_via_rpc', true), '') = 'on'"), '1.2: Trigger checks tewahedo.rights_via_rpc')
  assert.ok(sql.includes('create or replace function public.authorize_mezmur_lyrics'), '1.3: Administrative RPC authorize_mezmur_lyrics defined')
  assert.ok(sql.includes('create or replace function public.set_mezmur_rights_authorization'), '1.4: Administrative RPC set_mezmur_rights_authorization defined')
  assert.ok(sql.includes("set_config('tewahedo.rights_via_rpc', 'on', true)"), '1.5: Backfill uses rights_via_rpc session config')
  assert.ok(sql.includes("update public.mezmur_data_import\n  set rights_status = 'owned'"), '1.6: Backfill sets unverified rows to owned')
  assert.ok(sql.includes('create or replace view public.mezmur_public'), '1.7: mezmur_public view replaced')
  assert.ok(sql.includes('security_barrier = true'), '1.8: mezmur_public security barrier preserved')
  assert.ok(sql.includes('has_stored_lyrics'), '1.9: has_stored_lyrics column appended')
  assert.ok(!sql.includes('publication_approved_at is not null'), '1.10: Obsolete publication_approved_at check removed')
  assert.ok(!sql.includes('publication_approved_by is not null'), '1.11: Obsolete publication_approved_by check removed')
  assert.ok(sql.includes('create or replace function public.get_public_mezmur_lyrics'), '1.12: get_public_mezmur_lyrics public read RPC defined')

  console.log('✓ Group 1 passed: Migration file passes all 12 contract and security checks')
}

// -----------------------------------------------------------------------------
// 2. CMS & SERVICE VERIFICATION
// -----------------------------------------------------------------------------
{
  // Check emptyMezmur defaults to 'owned'
  const draft = emptyMezmur()
  assert.equal(draft.rights_status, 'owned', '2.1: emptyMezmur() must default rights_status to owned')

  // Check MezmurEditor.tsx cleaned of complex rights forms, evidence areas, and banners
  const editorCode = readFileSync('src/pages/admin/MezmurEditor.tsx', 'utf8')
  assert.ok(!editorCode.includes('id="mezmur-rights-status"'), '2.2: mezmur-rights-status select removed from CMS editor')
  assert.ok(!editorCode.includes('id="mezmur-source-notes"'), '2.3: mezmur-source-notes evidence textarea removed from CMS editor')
  assert.ok(!editorCode.includes('id="mezmur-contributor-credit"'), '2.4: mezmur-contributor-credit input removed from CMS editor')
  assert.ok(!editorCode.includes('✓ Owner-Authorized: Saved lyrics'), '2.5: Owner-Authorized green banner removed from CMS editor')
  assert.ok(!editorCode.includes('unverified lyrics cannot be displayed'), '2.6: Unverified lyrics warning removed from CMS editor')
  assert.ok(editorCode.includes("textField('source_url', 'Source / external link')"), '2.7: source_url preserved cleanly under Media section')

  console.log('✓ Group 2 passed: CMS editor cleaned and services default to owned rights')
}

// -----------------------------------------------------------------------------
// 3. PUBLICATION RULES & PERMISSION CHECKS
// -----------------------------------------------------------------------------
{
  assert.equal(canPublishMezmur('editor'), true, '3.1: editor can publish')
  assert.equal(canPublishMezmur('admin'), true, '3.2: admin can publish')
  assert.equal(canPublishMezmur('super_admin'), true, '3.3: super_admin can publish')
  assert.equal(canPublishMezmur('viewer'), false, '3.4: viewer cannot publish')
  assert.equal(canPublishMezmur(null), false, '3.5: unauthenticated cannot publish')

  // Owner-authorized Mezmur does not require external destination to publish
  const ownedBlock = publicationBlockReason({
    role: 'editor',
    rightsStatus: 'owned',
    title: 'አብስራ ገብርኤል',
    slug: 'absera-gebriel',
    lyricsAmharic: 'አብስራ ገብርኤል ለማርያም',
  })
  assert.equal(ownedBlock, null, '3.6: Owner-authorized Mezmur publishes without blocking')

  // Restricted Mezmur requires external destination
  const restrictedWithoutLink = publicationBlockReason({
    role: 'editor',
    rightsStatus: 'restricted',
    title: 'Restricted Mezmur',
    slug: 'restricted-mezmur',
  })
  assert.ok(restrictedWithoutLink?.includes('YouTube or authorized source link'), '3.7: Restricted Mezmur requires external link')

  const restrictedWithLink = publicationBlockReason({
    role: 'editor',
    rightsStatus: 'restricted',
    title: 'Restricted Mezmur',
    slug: 'restricted-mezmur',
    youtubeUrl: 'https://youtube.com/watch?v=123',
  })
  assert.equal(restrictedWithLink, null, '3.8: Restricted Mezmur with media link is allowed')

  console.log('✓ Group 3 passed: Publication rules correctly enforce ownership and media-only rules')
}

// -----------------------------------------------------------------------------
// 4. LIVE CLIENT / DATABASE ACCESS
// -----------------------------------------------------------------------------
if (supabase) {
  // Query mezmur_public for absera-gebriel
  const { data: record, error } = await supabase
    .from('mezmur_public' as never)
    .select('slug, title, status, rights_status')
    .eq('slug', 'absera-gebriel')
    .maybeSingle()

  assert.equal(error, null, '4.1: Live query on mezmur_public succeeds')
  assert.ok(record, '4.2: absera-gebriel is present in published catalog')
  assert.equal((record as Record<string, unknown>).slug, 'absera-gebriel')
  assert.equal((record as Record<string, unknown>).status, 'published')

  // Verify draft hymns are NOT in mezmur_public
  const { data: drafts, error: draftErr } = await supabase
    .from('mezmur_public' as never)
    .select('slug')
    .eq('status', 'draft')

  assert.equal(draftErr, null)
  assert.equal(drafts?.length ?? 0, 0, '4.3: mezmur_public contains 0 drafts')

  console.log(`✓ Group 4 passed: Live mezmur_public verified (absera-gebriel resolved, 0 drafts exposed)`)
} else {
  console.log('⚠ Skipping live query: Supabase client not configured')
}

console.log('--- ALL FINAL LYRICS REPAIR TESTS PASSED SUCCESSFULLY ---')
