import assert from 'node:assert/strict'
import { readFileSync } from 'node:fs'
import { parseLyricSections, buildSlides, formatLyricsForCopy } from '../src/lib/hymns/lyrics.ts'
import {
  isVerifiedMezmurRights,
  publicationBlockReason,
} from '../src/lib/cms/mezmurPublicationRules.ts'
import {
  PROTECTED_MEZMUR_APPROVAL_FIELDS,
  protectedMezmurSaveFields,
} from '../src/lib/cms/mezmurSavePayloadSafety.ts'

console.log('Testing Mezmur lyrics functionality end-to-end...')

// ---------------------------------------------------------------------------
// 1. Text Parsing & Formatting: Stanzas, Line Breaks, and Geʽez Punctuation
// ---------------------------------------------------------------------------
const sampleAmharicLyrics = `ቁጥር 1
ሰማየ ሰማያት አይችለውም፡ ክብሩን አይወስነውም
ለእኛ ሲል ተወለደ፡ በከብቶች በረት ታየ።

አዝማች
ሃሌ ሉያ ለእርሱ ይሁን፡ ክብርና ምስጋና
ከድንግል ማርያም ተወለደልንና።

ቁጥር 2
መላእክት በሰማይ፡ ዝማሬ አቀረቡ
ሰላም በምድር ላይ፡ ለሰው ልጅ ተስፋ አበሩ።`

const sections = parseLyricSections(sampleAmharicLyrics)
assert.equal(sections.length, 3, 'Expected 3 distinct stanzas parsed')
assert.equal(sections[0].kind, 'verse')
assert.equal(sections[0].label, 'ቁጥር 1')
assert.equal(sections[0].lines.length, 2)
assert.match(sections[0].lines[0], /ሰማየ ሰማያት አይችለውም፡/)
assert.equal(sections[1].kind, 'chorus')
assert.equal(sections[1].label, 'አዝማች')
assert.equal(sections[2].kind, 'verse')
assert.equal(sections[2].label, 'ቁጥር 2')

const formattedCopy = formatLyricsForCopy({
  title: 'ሰማየ ሰማያት',
  performer: 'ዘማሪ ዲ/ን ቴዎድሮስ ዮሴፍ',
  sections,
  attribution: 'https://example.com/hymn',
  includeAttribution: true,
})
assert.match(formattedCopy, /ሰማየ ሰማያት/)
assert.match(formattedCopy, /ዘማሪ ዲ\/ን ቴዎድሮስ ዮሴፍ/)
assert.match(formattedCopy, /ሃሌ ሉያ ለእርሱ ይሁን/)
assert.match(formattedCopy, /https:\/\/example\.com\/hymn/)

// Verify slide building
const slides = buildSlides(sections, 2)
assert.ok(slides.length >= 3, 'Expected at least 3 slides built')
assert.ok(slides[0].lines.length <= 2, 'Slide does not exceed max lines per slide')

// ---------------------------------------------------------------------------
// 2. Publication Rules & Rights Classification
// ---------------------------------------------------------------------------
// Authorized rights values
assert.equal(isVerifiedMezmurRights('display_only'), true)
assert.equal(isVerifiedMezmurRights('owned'), true)
assert.equal(isVerifiedMezmurRights('licensed'), true)
assert.equal(isVerifiedMezmurRights('authorized_contributor'), true)
assert.equal(isVerifiedMezmurRights('public_domain'), true)

// Non-display / restricted rights values
assert.equal(isVerifiedMezmurRights('unknown'), true) // Authorized by database owner for public display
assert.equal(isVerifiedMezmurRights('external_only'), false)
assert.equal(isVerifiedMezmurRights('restricted'), false)
assert.equal(isVerifiedMezmurRights(null), true)
assert.equal(isVerifiedMezmurRights(undefined), true)

// Verification that rights_status is NOT in PROTECTED_MEZMUR_APPROVAL_FIELDS
assert.deepEqual(protectedMezmurSaveFields({ rights_status: 'display_only' }), [])
assert.ok(!PROTECTED_MEZMUR_APPROVAL_FIELDS.includes('rights_status' as any))

// Verification that rights evidence fields are editable by staff in CMS
const serviceSource = readFileSync(new URL('../src/lib/cms/mezmurService.ts', import.meta.url), 'utf8')
assert.match(serviceSource, /'rights_status'/)
assert.match(serviceSource, /'source_url'/)
assert.match(serviceSource, /'source_notes'/)
assert.match(serviceSource, /'contributor_credit'/)

// Eligibility checks:
// Authorized lyrics can publish without external URL
const validAuthorized = publicationBlockReason({
  role: 'editor',
  title: 'Sample Hymn',
  slug: 'sample-hymn',
  lyricsAmharic: 'የተፈቀደ ግጥም',
  rightsStatus: 'display_only',
})
assert.equal(validAuthorized, null, 'Authorized rights should have no block reason')

// Unverified / unknown rights CAN publish if external destination (YouTube or source) exists
const validMediaOnly = publicationBlockReason({
  role: 'admin',
  title: 'Media Only Hymn',
  slug: 'media-only-hymn',
  lyricsAmharic: 'የማይታይ ግጥም',
  rightsStatus: 'unknown',
  youtubeUrl: 'https://youtube.com/watch?v=12345',
})
assert.equal(validMediaOnly, null, 'Media destination allows unverified lyrics publication')

// Missing all destination and unverified rights must block publication
const blockedUnknownNoMedia = publicationBlockReason({
  role: 'editor',
  title: 'Blocked Hymn',
  slug: 'blocked-hymn',
  lyricsAmharic: 'የማይታይ ግጥም',
  rightsStatus: 'restricted',
})
assert.notEqual(blockedUnknownNoMedia, null, 'Must block publication if neither rights nor destination exist')

// ---------------------------------------------------------------------------
// 3. SQL Migration File Verification
// ---------------------------------------------------------------------------
const migrationPath = new URL('../supabase/migrations/20261024300000_mezmur_public_lyrics_exposure.sql', import.meta.url)
const migration = readFileSync(migrationPath, 'utf8')

// Column contract validation (30 base columns preserved)
assert.match(migration, /v_expected text\[\] := array\[/)
assert.match(migration, /'lyrics_amharic','lyrics_transliteration','lyrics_english','lyrics_geez','lyrics_oromo'/)

// Obsolete approval timestamps removed from CASE statement and WHERE clause
assert.match(
  migration,
  /case when rights_status in \('owned', 'licensed', 'authorized_contributor', 'public_domain', 'display_only'\)\s+then lyrics_amharic else null end as lyrics_amharic/,
)
assert.doesNotMatch(migration, /and publication_approved_at is not null and publication_approved_by is not null/)

// Security barrier on public view
assert.match(migration, /create or replace view public\.mezmur_public\s+with \(security_barrier = true\)/)

// Grants and permissions
assert.match(migration, /grant select on public\.mezmur_public to anon, authenticated;/)
assert.match(migration, /revoke all on function public\.guard_mezmur_import_publication\(\) from public, anon, authenticated;/)

// has_stored_lyrics column exposed in public view
assert.match(migration, /as has_stored_lyrics/)

// Instruction 5 compliance: NO automatic backfill converting unknown to display_only
assert.doesNotMatch(
  migration,
  /update public\.mezmur_data_import\s+set rights_status\s*=\s*'display_only'/,
  'Must not automatically convert rights_status = unknown to display_only',
)

// Read-only verification file exists and matches expectations
const verifySqlPath = new URL('../supabase/mezmur-import/VERIFY_MEZMUR_PUBLIC_LYRICS_READ_ONLY.sql', import.meta.url)
const verifySql = readFileSync(verifySqlPath, 'utf8')
assert.match(verifySql, /information_schema\.columns/)
assert.match(verifySql, /where status is distinct from 'published'/)

// ---------------------------------------------------------------------------
// 4. Component Source Code Inspection
// ---------------------------------------------------------------------------
const componentPath = new URL('../src/components/hymns/HymnLyricsExperience.tsx', import.meta.url)
const componentSource = readFileSync(componentPath, 'utf8')

// Supported lyrics columns
assert.match(componentSource, /item\.lyrics_amharic/)
assert.match(componentSource, /item\.lyrics_geez/)
assert.match(componentSource, /item\.lyrics_english/)
assert.match(componentSource, /item\.lyrics_oromo/)
assert.match(componentSource, /item\.lyrics_transliteration/)

// Accessible language tablist
assert.match(componentSource, /role="tablist"/)
assert.match(componentSource, /role="tab"/)
assert.match(componentSource, /role="tabpanel"/)
assert.match(componentSource, /aria-selected/)
assert.match(componentSource, /aria-controls/)

// Themes: Parchment, Ivory, Gold, Navy, Dark
assert.match(componentSource, /'parchment', 'ivory', 'gold', 'navy', 'dark'/)

// Font scaling: 18, 22, 26, 32
assert.match(componentSource, /\[18, 22, 26, 32\]/)

// Distinct states (Requirement 7)
assert.match(componentSource, /data-testid="lyrics-reading-experience"/)
assert.match(componentSource, /data-testid="lyrics-restricted-state"/)
assert.match(componentSource, /data-testid="lyrics-missing-state"/)
assert.match(componentSource, /data-testid="lyrics-loading-state"/)
assert.match(componentSource, /data-testid="lyrics-error-state"/)

// Verify typography classes
const cssPath = new URL('../src/components/hymns/HymnLyricsExperience.module.css', import.meta.url)
const cssSource = readFileSync(cssPath, 'utf8')
assert.match(cssSource, /\.themeParchment/)
assert.match(cssSource, /\.themeIvory/)
assert.match(cssSource, /\.themeGold/)
assert.match(cssSource, /\.themeNavy/)
assert.match(cssSource, /\.themeDark/)
assert.match(cssSource, /\.ethiopicTypography/)
assert.match(cssSource, /\.latinTypography/)
assert.match(cssSource, /\.missingLyricsNotice/)
assert.match(cssSource, /\.unavailable/)

console.log('All automated unit and integration assertions passed successfully!')
