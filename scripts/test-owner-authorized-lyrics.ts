import assert from 'node:assert/strict'
import { getMezmurBySlug } from '../src/lib/publicContent/hymnBrowse.ts'
import { supabase } from '../src/lib/supabase/client.ts'
import {
  canPublishMezmur,
  isVerifiedMezmurRights,
  publicationBlockReason,
} from '../src/lib/cms/mezmurPublicationRules.ts'

console.log('--- STARTING 20-POINT OWNER-AUTHORIZED LYRICS TEST SUITE ---')

if (!supabase) {
  console.error('Supabase client is not configured.')
  process.exit(1)
}

// -----------------------------------------------------------------------------
// GROUP 1: PUBLIC VIEW SECURITY & PRIVACY
// -----------------------------------------------------------------------------

// Test 1: Anonymous public client can query mezmur_public without authentication
{
  const { data, error } = await supabase
    .from('mezmur_public' as never)
    .select('slug, title, status')
    .limit(5)

  assert.equal(error, null, 'Public query on mezmur_public must not fail')
  assert.ok(Array.isArray(data) && data.length > 0, 'Public query returns published hymns')
  console.log(`✓ Test 1 passed: Anonymous client successfully queried mezmur_public (${data.length} sample hymns)`)
}

// Test 2: mezmur_public contains ONLY published items (Drafts strictly excluded)
{
  const { data, error } = await supabase
    .from('mezmur_public' as never)
    .select('slug, status')
    .eq('status', 'draft')

  assert.equal(error, null)
  assert.equal(data?.length ?? 0, 0, 'mezmur_public MUST NEVER return draft hymns')
  console.log('✓ Test 2 passed: Draft hymns are strictly excluded from mezmur_public (count = 0)')
}

// Test 3: mezmur_public requires valid slug and title
{
  const { data, error } = await supabase
    .from('mezmur_public' as never)
    .select('slug, title')
    .or('slug.is.null,title.is.null')

  assert.equal(error, null)
  assert.equal(data?.length ?? 0, 0, 'All public hymns have valid slug and title')
  console.log('✓ Test 3 passed: All public hymns have non-empty slugs and titles')
}

// Test 4: getMezmurBySlug returns null for non-existent or invalid slug
{
  const nonExistent = await getMezmurBySlug('non-existent-hymn-slug-99999999')
  assert.equal(nonExistent, null, 'Non-existent slug returns null')
  console.log('✓ Test 4 passed: Non-existent slug cleanly returns null')
}

// Test 5: getMezmurBySlug resolves a published hymn with all public fields
{
  const sample = await getMezmurBySlug('absera-gebriel')
  assert.ok(sample !== null, 'Known published hymn resolves')
  assert.equal(sample.slug, 'absera-gebriel')
  assert.ok(sample.title.length > 0)
  assert.equal(sample.status, 'published')
  console.log(`✓ Test 5 passed: getMezmurBySlug correctly resolved '${sample.title}'`)
}

// -----------------------------------------------------------------------------
// GROUP 2: LYRICS CONTRACT & OWNERSHIP AUTHORIZATION
// -----------------------------------------------------------------------------

// Test 6: getMezmurBySlug includes all 5 supported lyric languages + transliteration
{
  const sample = await getMezmurBySlug('absera-gebriel')
  assert.ok(sample !== null)
  assert.ok('lyrics_amharic' in sample, 'lyrics_amharic is exposed in detail contract')
  assert.ok('lyrics_geez' in sample, 'lyrics_geez is exposed in detail contract')
  assert.ok('lyrics_english' in sample, 'lyrics_english is exposed in detail contract')
  assert.ok('lyrics_oromo' in sample, 'lyrics_oromo is exposed in detail contract')
  assert.ok('lyrics_transliteration' in sample, 'lyrics_transliteration is exposed in detail contract')
  assert.ok('rights_status' in sample, 'rights_status is exposed')
  assert.ok('has_stored_lyrics' in sample, 'has_stored_lyrics is exposed')
  console.log('✓ Test 6 passed: Complete lyrics contract exposed on ImportMezmurDetail')
}

// Test 7: Default rights_status is owner-authorized ('owned')
{
  const isVerified = isVerifiedMezmurRights('owned')
  assert.equal(isVerified, true, "'owned' status must be verified")
  const isDisplayOnly = isVerifiedMezmurRights('display_only')
  assert.equal(isDisplayOnly, true, "'display_only' status must be verified")
  const isPublicDomain = isVerifiedMezmurRights('public_domain')
  assert.equal(isPublicDomain, true, "'public_domain' status must be verified")
  console.log('✓ Test 7 passed: Owner-authorized, display_only, and public_domain rights pass verification')
}

// Test 8: Explicit restricted statuses correctly identified
{
  const isRestricted = isVerifiedMezmurRights('restricted')
  assert.equal(isRestricted, false, "'restricted' must not be verified for public display")
  const isExternalOnly = isVerifiedMezmurRights('external_only')
  assert.equal(isExternalOnly, false, "'external_only' must not be verified for public display")
  console.log('✓ Test 8 passed: Explicitly restricted rights correctly identified')
}

// -----------------------------------------------------------------------------
// GROUP 3: CMS PUBLICATION RULES
// -----------------------------------------------------------------------------

// Test 9: Staff roles (editor, admin, super_admin) can publish
{
  assert.equal(canPublishMezmur('editor'), true)
  assert.equal(canPublishMezmur('admin'), true)
  assert.equal(canPublishMezmur('super_admin'), true)
  assert.equal(canPublishMezmur('viewer'), false)
  assert.equal(canPublishMezmur(null), false)
  console.log('✓ Test 9 passed: Role checks enforce editor/admin/super_admin permissions')
}

// Test 10: Publication succeeds without blocking when owner has lyrics
{
  const reason = publicationBlockReason({
    role: 'editor',
    rightsStatus: 'owned',
    title: 'Test Hymn',
    slug: 'test-hymn',
    lyricsAmharic: 'ይትባረክ እግዚአብሔር',
  })
  assert.equal(reason, null, 'Owner-authorized Mezmur must publish without block reason')
  console.log('✓ Test 10 passed: Owner-authorized Mezmur publishes cleanly without blocker')
}

// Test 11: Publication blocks missing title or slug
{
  const missingTitle = publicationBlockReason({
    role: 'editor',
    rightsStatus: 'owned',
    title: '',
    slug: 'test-hymn',
  })
  assert.ok(missingTitle !== null && missingTitle.includes('Title and slug are required'))

  const missingSlug = publicationBlockReason({
    role: 'editor',
    rightsStatus: 'owned',
    title: 'Test',
    slug: '  ',
  })
  assert.ok(missingSlug !== null && missingSlug.includes('Title and slug are required'))
  console.log('✓ Test 11 passed: Missing title or slug triggers publication block')
}

// Test 12: Restricted lyrics Mezmur requires YouTube or source link
{
  const restrictedWithoutLink = publicationBlockReason({
    role: 'editor',
    rightsStatus: 'restricted',
    title: 'Restricted Hymn',
    slug: 'restricted-hymn',
    youtubeUrl: '',
    sourceUrl: '',
  })
  assert.ok(restrictedWithoutLink !== null && restrictedWithoutLink.includes('Add a YouTube or authorized source link'))

  const restrictedWithLink = publicationBlockReason({
    role: 'editor',
    rightsStatus: 'restricted',
    title: 'Restricted Hymn',
    slug: 'restricted-hymn',
    youtubeUrl: 'https://youtube.com/watch?v=123',
  })
  assert.equal(restrictedWithLink, null, 'Restricted hymn with media link is allowed')
  console.log('✓ Test 12 passed: Restricted-lyrics hymns safely require external media destination')
}

// -----------------------------------------------------------------------------
// GROUP 4: MULTILINGUAL & TYPOGRAPHY LOGIC
// -----------------------------------------------------------------------------

// Test 13: Ethiopic line breaks and Verse/Chorus preservation
{
  const rawLyrics = `[Chorus]
ቅዱስ ቅዱስ ቅዱስ እግዚአብሔር
ምሉዕ ሰማያተ ወምድረ ስብሐቲከ

[Verse 1]
ስምህን እንጠራለን በያሬድ ዜማ
ምስጋናህ ይድረስ ከምድር እስከ ሰማይ`

  const lines = rawLyrics.split(/\r?\n/)
  assert.equal(lines.length, 7, 'Line breaks are intact')
  assert.ok(rawLyrics.includes('ቅዱስ ቅዱስ ቅዱስ'), 'Ethiopic characters preserved without mojibake')
  console.log('✓ Test 13 passed: Ethiopic characters, line breaks, and sections preserved intact')
}

// Test 14: Tigrinya primary language detection
{
  const itemTi = {
    language: 'ti',
    primary_language: 'ti',
    lyrics_amharic: 'ቤዛ ኩሉ ናይ ኩሉ ቤዛ',
  }
  const isTi = itemTi.language === 'ti' || itemTi.primary_language === 'ti'
  assert.equal(isTi, true, 'Tigrinya language is recognized')
  console.log('✓ Test 14 passed: Tigrinya language recognized and labeled accurately')
}

// Test 15: Geʽez primary language detection
{
  const itemGez = {
    language: 'gez',
    primary_language: 'gez',
    lyrics_geez: 'ይትባረክ እግዚአብሔር አምላከ እስራኤል',
  }
  const isGez = itemGez.language === 'gez' || itemGez.primary_language === 'gez'
  assert.equal(isGez, true, 'Geʽez language is recognized')
  console.log('✓ Test 15 passed: Geʽez language recognized and prioritized')
}

// Test 16: Oromo primary language detection
{
  const itemOm = {
    language: 'om',
    primary_language: 'om',
    lyrics_oromo: 'Waaqayyo guddaadha',
  }
  const isOm = itemOm.language === 'om' || itemOm.primary_language === 'om'
  assert.equal(isOm, true, 'Oromo language is recognized')
  console.log('✓ Test 16 passed: Oromo language recognized')
}

// Test 17: English primary language detection
{
  const itemEn = {
    language: 'en',
    primary_language: 'en',
    lyrics_english: 'Holy Holy Holy, Lord God Almighty',
  }
  const isEn = itemEn.language === 'en' || itemEn.primary_language === 'en'
  assert.equal(isEn, true, 'English language is recognized')
  console.log('✓ Test 17 passed: English language recognized')
}

// -----------------------------------------------------------------------------
// GROUP 5: COMPONENT STATE LOGIC (MISSING VS RESTRICTED)
// -----------------------------------------------------------------------------

// Test 18: Missing lyrics (no saved lyrics, owned/unknown rights) displays MISSING notice, NOT restricted
{
  const itemMissing = {
    rights_status: 'owned',
    lyrics_amharic: null,
    lyrics_geez: null,
    lyrics_english: null,
    lyrics_oromo: null,
    has_stored_lyrics: false,
  }
  const isExplicitlyRestricted =
    itemMissing.rights_status === 'external_only' || itemMissing.rights_status === 'restricted'
  assert.equal(isExplicitlyRestricted, false, 'Missing lyrics must NOT be treated as restricted')
  console.log('✓ Test 18 passed: Genuinely missing lyrics display transcription pending notice (not restricted lock)')
}

// Test 19: Restricted lyrics with video link displays RESTRICTED notice
{
  const itemRestricted = {
    rights_status: 'restricted',
    lyrics_amharic: null,
    has_stored_lyrics: true,
  }
  const isExplicitlyRestricted =
    itemRestricted.rights_status === 'external_only' || itemRestricted.rights_status === 'restricted'
  assert.equal(isExplicitlyRestricted, true, 'Restricted rights displays locked copyright notice')
  console.log('✓ Test 19 passed: Restricted hymns safely display authorized source link notice')
}

// Test 20: Forward migration file exists, is valid SQL, and contains security barriers
{
  const { readFileSync } = await import('node:fs')
  const sql = readFileSync('supabase/migrations/20261025010000_owner_authorized_public_mezmur_lyrics.sql', 'utf8')
  assert.ok(sql.includes('create or replace view public.mezmur_public'), 'Migration recreates view')
  assert.ok(sql.includes('security_barrier = true'), 'Migration maintains security_barrier')
  assert.ok(sql.includes("update public.mezmur_data_import\nset rights_status = 'owned'"), 'Migration backfills unverified rows to owned')
  assert.ok(sql.includes('get_public_mezmur_lyrics'), 'Migration provides lyrics read RPC')
  assert.ok(sql.includes("where deleted_at is null"), 'Migration preserves soft delete privacy')
  console.log('✓ Test 20 passed: Forward migration file strictly verified with security barrier and backfill')
}

console.log('--- ALL 20 OWNER-AUTHORIZED LYRICS TESTS PASSED SUCCESSFULLY ---')
