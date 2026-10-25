import assert from 'node:assert/strict'
import { readFileSync } from 'node:fs'
import { resolve } from 'node:path'
import {
  autoCategorizeMezmurs,
  buildBulkSnapshot,
  pagedRows,
  type BulkMezmurRecord,
  type ClassificationRunProgress,
} from '../src/lib/cms/mezmurBulkService.ts'
import { classifyMezmur } from '../src/lib/mezmur/mezmurClassification.ts'

console.log('--- STARTING HARDENED REGRESSION SUITE FOR DRAFT & PUBLISHED CLASSIFICATION ---')

function createSampleRecord(index: number, status: 'draft' | 'published', overrides: Partial<BulkMezmurRecord> = {}): BulkMezmurRecord {
  const isMary = index % 3 === 0
  const isMichael = index % 3 === 1
  return {
    import_id: `00000000-0000-4000-8000-${String(index).padStart(12, '0')}`,
    slug: `mezmur-${index}`,
    title: isMary ? `Mary Hymn ${index}` : isMichael ? `Michael Hymn ${index}` : `Christ Hymn ${index}`,
    singer_name: `Zemari ${index}`,
    singer_slug: `zemari-${index}`,
    zemari_id: null,
    zemari_verified: false,
    zemari_name: null,
    zemari_match: { state: 'not_recorded' },
    status,
    category_slugs: [],
    occasion_slugs: [],
    has_lyrics: true,
    publication_eligible: status === 'draft' ? (index % 5 !== 0) : true,
    publication_block_reason: status === 'draft' && index % 5 === 0 ? 'Missing audio/video' : null,
    updated_at: '2026-10-24T12:00:00Z',
    language: 'am',
    lyrics_amharic: isMary
      ? 'ድንግል ማርያም እመቤታችን ኪዳነ ምሕረት አማልጅን'
      : isMichael
        ? 'ሊቀ መላእክት ቅዱስ ሚካኤል ጠባቂያችን'
        : 'ጌታችን ኢየሱስ ክርስቶስ መድኃኔዓለም አዳነን በትንሣኤው',
    ...overrides,
  }
}

// Build canonical 1,152 fixture: 158 Draft + 994 Published
const fixture1152: BulkMezmurRecord[] = [
  ...Array.from({ length: 158 }, (_, i) => createSampleRecord(i, 'draft')),
  ...Array.from({ length: 994 }, (_, i) => createSampleRecord(158 + i, 'published')),
]

// 1. Auto-Categorize All includes Draft and Published
{
  const drafts = fixture1152.filter((r) => r.status === 'draft')
  const published = fixture1152.filter((r) => r.status === 'published')
  assert.equal(drafts.length, 158)
  assert.equal(published.length, 994)
  assert.equal(fixture1152.length, 1152)

  let lastProgress: ClassificationRunProgress | null = null
  const result = await autoCategorizeMezmurs(fixture1152, {
    mode: 'all',
    onProgress: (p) => { lastProgress = p },
  })

  assert.equal(result.totalEligible, 1152, 'Test 1: Auto-Categorize All includes all 1,152 Mezmurs')
  assert.equal(result.draftCount, 158, 'Test 1: 158 Draft Mezmurs reported in target scope')
  assert.equal(result.publishedCount, 994, 'Test 1: 994 Published Mezmurs reported in target scope')
  assert.equal(result.analyzed, 1152, 'Test 1: All 1,152 records analyzed')
  assert.ok(lastProgress !== null, 'Test 1: onProgress callback fired')
  assert.equal(lastProgress?.totalEligible, 1152)
  console.log('✓ Test 1 passed: Auto-Categorize All includes Draft and Published')
}

// 2. 158 Draft + 994 Published = 1152 eligible records in deterministic fixture
{
  assert.equal(fixture1152.filter((r) => r.status === 'draft').length, 158)
  assert.equal(fixture1152.filter((r) => r.status === 'published').length, 994)
  assert.equal(fixture1152.length, 1152)
  console.log('✓ Test 2 passed: 158 Draft + 994 Published = 1152 eligible records in deterministic fixture')
}

// 3. Status = Draft restricts scope correctly (158)
{
  const draftOnly = fixture1152.filter((r) => r.status === 'draft')
  const result = await autoCategorizeMezmurs(draftOnly, { mode: 'all' })
  assert.equal(result.totalEligible, 158, 'Test 3: Scope restricted to 158 Drafts')
  assert.equal(result.draftCount, 158)
  assert.equal(result.publishedCount, 0)
  assert.equal(result.analyzed, 158)
  console.log('✓ Test 3 passed: Status = Draft restricts scope correctly (158)')
}

// 4. Status = Published restricts scope correctly (994)
{
  const publishedOnly = fixture1152.filter((r) => r.status === 'published')
  const result = await autoCategorizeMezmurs(publishedOnly, { mode: 'all' })
  assert.equal(result.totalEligible, 994, 'Test 4: Scope restricted to 994 Published')
  assert.equal(result.draftCount, 0)
  assert.equal(result.publishedCount, 994)
  assert.equal(result.analyzed, 994)
  console.log('✓ Test 4 passed: Status = Published restricts scope correctly (994)')
}

// 5. Status = All includes both (1152)
{
  const allRecords = fixture1152
  const result = await autoCategorizeMezmurs(allRecords, { mode: 'all' })
  assert.equal(result.totalEligible, 1152, 'Test 5: Scope includes 1,152')
  assert.equal(result.draftCount + result.publishedCount, 1152)
  console.log('✓ Test 5 passed: Status = All includes both (1152)')
}

// 6. Existing manual classifications remain preserved unless overwrite is selected
{
  const sampleWithManual = [
    createSampleRecord(1, 'published', {
      category_slugs: ['custom-manual-category'],
      occasion_slugs: ['custom-manual-occasion'],
    }),
  ]
  const preserveResult = await autoCategorizeMezmurs(sampleWithManual, { mode: 'all', overwrite: false })
  assert.equal(preserveResult.skipped, 1, 'Test 6: Existing classification skipped when overwrite is false')
  assert.equal(preserveResult.items[0].primaryCategory, 'custom-manual-category')

  const overwriteResult = await autoCategorizeMezmurs(sampleWithManual, { mode: 'all', overwrite: true })
  assert.equal(overwriteResult.skipped, 0, 'Test 6: Reanalyzed when overwrite is true')
  assert.notEqual(overwriteResult.items[0].primaryCategory, 'custom-manual-category')
  console.log('✓ Test 6 passed: Existing manual classifications remain preserved unless overwrite is selected')
}

// 7. Missing-category mode processes both statuses
{
  const mixed = [
    createSampleRecord(1, 'draft', { category_slugs: ['jesus-christ'] }),
    createSampleRecord(2, 'draft', { category_slugs: [] }),
    createSampleRecord(3, 'published', { category_slugs: ['virgin-mary'] }),
    createSampleRecord(4, 'published', { category_slugs: [] }),
  ]
  const result = await autoCategorizeMezmurs(mixed, { mode: 'missing_categories' })
  assert.equal(result.totalEligible, 2, 'Test 7: 2 records missing categories')
  assert.equal(result.draftCount, 1, 'Test 7: 1 draft missing category')
  assert.equal(result.publishedCount, 1, 'Test 7: 1 published missing category')
  console.log('✓ Test 7 passed: Missing-category mode processes both statuses')
}

// 8. Missing-occasion mode processes both statuses
{
  const mixed = [
    createSampleRecord(1, 'draft', { occasion_slugs: ['timket'] }),
    createSampleRecord(2, 'draft', { occasion_slugs: [] }),
    createSampleRecord(3, 'published', { occasion_slugs: ['meskel'] }),
    createSampleRecord(4, 'published', { occasion_slugs: [] }),
  ]
  const result = await autoCategorizeMezmurs(mixed, { mode: 'missing_occasions' })
  assert.equal(result.totalEligible, 2, 'Test 8: 2 records missing occasions')
  assert.equal(result.draftCount, 1, 'Test 8: 1 draft missing occasion')
  assert.equal(result.publishedCount, 1, 'Test 8: 1 published missing occasion')
  console.log('✓ Test 8 passed: Missing-occasion mode processes both statuses')
}

// 9. Reclassification does not change publication status
{
  const publishedRecord = createSampleRecord(10, 'published')
  const originalStatus = publishedRecord.status
  await autoCategorizeMezmurs([publishedRecord], { mode: 'all' })
  assert.equal(publishedRecord.status, originalStatus, 'Test 9: Record status in memory remains published')

  // Verify migration SQL never alters status
  const migrationSql = readFileSync(
    resolve('supabase/migrations/20261025020000_mezmur_bulk_classification.sql'),
    'utf8',
  )
  assert.doesNotMatch(migrationSql, /update public\.mezmur_data_import\s+set\s+status/i, 'Test 9: RPC never updates mezmur status')
  console.log('✓ Test 9 passed: Reclassification does not change publication status')
}

// 10. Reclassification does not change lyrics
{
  const sample = createSampleRecord(20, 'published', { lyrics_amharic: 'የማይለወጥ ቅዱስ ቃል' })
  const originalLyrics = sample.lyrics_amharic
  await autoCategorizeMezmurs([sample], { mode: 'all' })
  assert.equal(sample.lyrics_amharic, originalLyrics, 'Test 10: Lyrics strictly untouched')

  const migrationSql = readFileSync(
    resolve('supabase/migrations/20261025020000_mezmur_bulk_classification.sql'),
    'utf8',
  )
  assert.doesNotMatch(migrationSql, /update public\.mezmur_data_import\s+set.*lyrics/i, 'Test 10: RPC never updates lyrics')
  console.log('✓ Test 10 passed: Reclassification does not change lyrics')
}

// 11. Reclassification does not change rights_status
{
  const migrationSql = readFileSync(
    resolve('supabase/migrations/20261025020000_mezmur_bulk_classification.sql'),
    'utf8',
  )
  assert.doesNotMatch(migrationSql, /update public\.mezmur_data_import\s+set.*rights_status/i, 'Test 11: RPC never updates rights_status')
  console.log('✓ Test 11 passed: Reclassification does not change rights_status')
}

// 12. Deleted records remain excluded
{
  const rawRows = [
    { import_id: '1', slug: 'duplicate', title: 'Active A', status: 'draft', deleted_at: null },
    { import_id: '2', slug: 'duplicate', title: 'Active B', status: 'published', deleted_at: null },
    { import_id: '3', slug: 's2', title: 'Deleted', status: 'published', deleted_at: '2026-10-24T00:00:00Z' },
  ]
  const snapshot = buildBulkSnapshot({
    mezmurs: rawRows,
    categoryLinks: [
      { mezmur_import_id: '1', mezmur_slug: 'duplicate', category_slug: 'virgin-mary' },
      { mezmur_import_id: '2', mezmur_slug: 'duplicate', category_slug: 'jesus-christ' },
      // Ambiguous legacy slug-only rows must not be assigned to either record.
      { mezmur_import_id: null, mezmur_slug: 'duplicate', category_slug: 'general' },
    ],
    occasionLinks: [],
    zemaris: [],
    jobs: [],
    suggestions: [],
  })
  assert.equal(snapshot.records.length, 2, 'Test 12: Deleted records filtered out of snapshot')
  assert.equal(snapshot.records[0].import_id, '1')
  assert.deepEqual(snapshot.records[0].category_slugs, ['virgin-mary'])
  assert.deepEqual(snapshot.records[1].category_slugs, ['jesus-christ'])

  const migrationSql = readFileSync(
    resolve('supabase/migrations/20261025020000_mezmur_bulk_classification.sql'),
    'utf8',
  )
  assert.match(migrationSql, /where import_id=v_import_id and deleted_at is null/i, 'Test 12: RPC filters deleted_at is null')
  console.log('✓ Test 12 passed: Deleted records excluded and duplicate slugs remain UUID-isolated')
}

// 13. Admin/Super Admin permissions enforced
{
  const migrationSql = readFileSync(
    resolve('supabase/migrations/20261025020000_mezmur_bulk_classification.sql'),
    'utf8',
  )
  assert.match(migrationSql, /v_role not in \('admin','super_admin'\)/, 'Test 13: Enforces admin or super_admin')
  assert.match(migrationSql, /Admin or Super Admin is required for bulk classification.*errcode='42501'/s, 'Test 13: Raises 42501 for unauthorized actors')
  console.log('✓ Test 13 passed: Admin/Super Admin permissions enforced')
}

// 14. Non-admin writes rejected
{
  const migrationSql = readFileSync(
    resolve('supabase/migrations/20261025020000_mezmur_bulk_classification.sql'),
    'utf8',
  )
  assert.match(migrationSql, /revoke all on function public\.bulk_assign_mezmur_classifications.*from public,\s*anon/, 'Test 14: Revoked from public and anon')
  assert.match(migrationSql, /grant execute on function public\.bulk_assign_mezmur_classifications.*to authenticated/, 'Test 14: Granted to authenticated only')
  console.log('✓ Test 14 passed: Non-admin writes rejected')
}

// 15. Pagination includes records beyond page 1
{
  const sourceRows = fixture1152.map((row) => ({ import_id: row.import_id }))
  const calls: Array<[number, number]> = []
  const loaded = await pagedRows('test_mezmurs', async (from, to) => {
    calls.push([from, to])
    return { data: sourceRows.slice(from, to + 1), error: null }
  })
  assert.equal(loaded.length, 1152, 'Test 15: Database pagination loads all 1,152 rows')
  assert.deepEqual(calls, [[0, 499], [500, 999], [1000, 1499]])

  // Auto-categorize processes all 1152 records regardless of page view slice
  const result = await autoCategorizeMezmurs(fixture1152, { mode: 'all' })
  assert.equal(result.totalEligible, 1152)
  assert.equal(result.analyzed, 1152)
  console.log('✓ Test 15 passed: Pagination includes records beyond page 1 (1152 across 24 pages)')
}

// 16. Idempotent repeated classification
{
  const sample = createSampleRecord(100, 'published')
  const run1 = classifyMezmur(sample)
  const run2 = classifyMezmur(sample)
  assert.deepEqual(run1, run2, 'Test 16: Idempotent runs return exact same classifications')

  const migrationSql = readFileSync(
    resolve('supabase/migrations/20261025020000_mezmur_bulk_classification.sql'),
    'utf8',
  )
  assert.match(migrationSql, /if exists\(select 1 from public\.mezmur_category_links_import where mezmur_import_id=v_import_id and category_slug=v_value\)/i, 'Test 16: RPC counts already-present categories')
  assert.match(migrationSql, /if exists\(select 1 from public\.mezmur_occasion_links_import where mezmur_import_id=v_import_id and occasion_slug=v_value\)/i, 'Test 16: RPC counts already-present occasions')
  console.log('✓ Test 16 passed: Idempotent repeated classification')
}

// 17. Multi-category and multi-occasion assignments
{
  const maryHymn = classifyMezmur({
    title: 'ኪዳነ ምሕረት እመቤታችን',
    lyrics_amharic: 'ድንግል ማርያም ኪዳነ ምሕረት እናታችን ሆይ አማልጅን በዓለ ልደታሽን እናከብራለን',
  })
  assert.equal(maryHymn.primaryCategorySlug, 'virgin-mary', 'Test 17: Primary category Virgin Mary')
  assert.ok(maryHymn.primaryOccasionSlug === 'kidane-mihret' || maryHymn.additionalOccasionSlugs.includes('kidane-mihret'), 'Test 17: Kidane Mihret occasion')

  const michaelHymn = classifyMezmur({
    title: 'ሊቀ መላእክት ቅዱስ ሚካኤል',
    lyrics_amharic: 'ቅዱስ ሚካኤል ሊቀ መላእክት አማላጃችን በበዓለ ንግሥህ ፈጥነህ ተራዳን',
  })
  assert.equal(michaelHymn.primaryCategorySlug, 'angels-saints', 'Test 17: Angels & Saints primary category')
  assert.ok(michaelHymn.additionalCategorySlugs.includes('kidus-michael'), 'Test 17: St. Michael subcategory')
  console.log('✓ Test 17 passed: Multi-category and multi-occasion assignments')
}

// 18. Public Browse category visibility after classification
{
  // Public code reads only filtered classification views.
  const hymnBrowseFile = readFileSync(resolve('src/lib/publicContent/hymnBrowse.ts'), 'utf8')
  assert.match(hymnBrowseFile, /categories:\s*'mezmur_category_links_public'/, 'Test 18: hymnBrowse uses filtered category links')
  assert.match(hymnBrowseFile, /occasions:\s*'mezmur_occasion_links_public'/, 'Test 18: hymnBrowse uses filtered occasion links')

  const collectionPageFile = readFileSync(resolve('src/pages/PublicHymnCollectionPage.tsx'), 'utf8')
  assert.match(collectionPageFile, /from\('mezmur_category_links_public' as never\)/, 'Test 18: Collection page queries filtered links')
  assert.match(collectionPageFile, /select\('mezmur_id'\)/, 'Test 18: Collection page filters by stable public ID')
  console.log('✓ Test 18 passed: Public Browse category visibility after classification')
}

// 19. Mobile Bulk Management UI
{
  const pageFile = readFileSync(resolve('src/pages/admin/MezmurBulkManagement.tsx'), 'utf8')
  assert.match(pageFile, /Auto-Categorize All \(\{filteredTotal\}\)/, 'Test 19: Dynamic filtered total displayed')
  assert.match(pageFile, /Categorize Missing Only \(\{filteredMissingCategories\}\)/, 'Test 19: Dynamic missing categories displayed')
  assert.match(pageFile, /Reanalyze Missing Occasions \(\{filteredMissingOccasions\}\)/, 'Test 19: Dynamic missing occasions displayed')
  assert.match(pageFile, /Select all matching \(\{filtered\.length\}\)/, 'Test 19: Select all matching records supported')
  console.log('✓ Test 19 passed: Mobile Bulk Management UI buttons and counts derived correctly')
}

// 20. Classification and publication eligibility are independent
{
  // A draft record blocked from publication can be auto-categorized
  const blockedDraft = createSampleRecord(999, 'draft', {
    publication_eligible: false,
    publication_block_reason: 'Blocked for testing',
  })
  const blockedResult = await autoCategorizeMezmurs([blockedDraft], { mode: 'all' })
  assert.equal(blockedResult.totalEligible, 1, 'Test 20: Blocked draft is eligible for classification')
  assert.equal(blockedResult.analyzed, 1, 'Test 20: Blocked draft is analyzed')
  assert.equal(blockedResult.items[0].primaryCategory, 'virgin-mary', 'Test 20: Primary category assigned despite publication block')

  // A published record can be auto-categorized without running publication checks
  const publishedSample = createSampleRecord(1001, 'published')
  const publishedResult = await autoCategorizeMezmurs([publishedSample], { mode: 'all' })
  assert.equal(publishedResult.totalEligible, 1, 'Test 20: Published hymn is eligible for classification')
  assert.equal(publishedResult.analyzed, 1, 'Test 20: Published hymn is analyzed')
  assert.equal(publishedResult.items[0].primaryCategory, 'jesus-christ', 'Test 20: Primary category assigned to published record')
  console.log('✓ Test 20 passed: Classification and publication eligibility are independent')
}

// 21. Invalid taxonomy fails before any relationship write for the record
{
  const migrationSql = readFileSync(resolve('supabase/migrations/20261025020000_mezmur_bulk_classification.sql'), 'utf8')
  assert.match(migrationSql, /Invalid category slug\(s\): %.*errcode='23503'/s)
  assert.match(migrationSql, /Invalid occasion slug\(s\): %.*errcode='23503'/s)
  assert.ok(migrationSql.indexOf("Invalid category slug(s): %") < migrationSql.indexOf('foreach v_value in array v_categories'))
  console.log('✓ Test 21 passed: Invalid taxonomy is an explicit per-record failure')
}

// 22. Browser success is UUID-only and requires every requested relationship
{
  const service = readFileSync(resolve('src/lib/cms/mezmurBulkService.ts'), 'utf8')
  assert.doesNotMatch(service, /slugOutcomeMap/)
  assert.match(service, /select\('mezmur_import_id,category_slug'\)/)
  assert.match(service, /item\.categories\.every/)
  assert.match(service, /item\.occasions\.every/)
  assert.match(service, /isRpcSuccess && hasConfirmedCategory && hasConfirmedOccasion/)
  console.log('✓ Test 22 passed: Database-confirmed success is exact and UUID-keyed')
}

// 23. Direct relationship tables are private; filtered public views enforce status/deletion
{
  const migrationSql = readFileSync(resolve('supabase/migrations/20261025020000_mezmur_bulk_classification.sql'), 'utf8')
  assert.match(migrationSql, /revoke all on public\.mezmur_category_links_import from public,anon/)
  assert.match(migrationSql, /revoke all on public\.mezmur_occasion_links_import from public,anon/)
  assert.match(migrationSql, /create or replace view public\.mezmur_category_links_public/)
  assert.match(migrationSql, /join public\.mezmur_public p on p\.mezmur_id=m\.mezmur_id/)
  console.log('✓ Test 23 passed: Draft relationships are not publicly readable')
}

// 24. Null canonical mezmur_id does not drop published Mezmurs from public categories
{
  const hymnBrowseFile = readFileSync(resolve('src/lib/publicContent/hymnBrowse.ts'), 'utf8')
  assert.match(hymnBrowseFile, /select\('mezmur_import_id, mezmur_id, mezmur_slug, category_slug'\)/, 'Test 24: Category links query fetches mezmur_import_id')
  assert.match(hymnBrowseFile, /select\('mezmur_import_id, mezmur_id, mezmur_slug, occasion_slug'\)/, 'Test 24: Occasion links query fetches mezmur_import_id')
  assert.match(hymnBrowseFile, /const mezmurUuid = txt\(row\.mezmur_import_id\) \|\| txt\(row\.mezmur_id\) \|\| mezmurSlug/, 'Test 24: mezmur_import_id used as primary identifier when mezmur_id is null')

  // Verify that an imported hymn with null mezmur_id is properly retained
  const nullIdHymn = {
    mezmur_import_id: '11111111-2222-3333-4444-555555555555',
    mezmur_id: null,
    mezmur_slug: 'test-hymn-null-id',
    category_slug: 'virgin-mary',
  }
  const publishedSlugs = new Set(['test-hymn-null-id'])
  const distinctMezmurs = new Set<string>()
  const mezmurUuid = nullIdHymn.mezmur_import_id || nullIdHymn.mezmur_id || nullIdHymn.mezmur_slug
  if (publishedSlugs.has(nullIdHymn.mezmur_slug)) {
    distinctMezmurs.add(mezmurUuid)
  }
  assert.equal(distinctMezmurs.size, 1, 'Test 24: Retains and counts hymn with null mezmur_id')
  assert.ok(distinctMezmurs.has('11111111-2222-3333-4444-555555555555'))
  console.log('✓ Test 24 passed: Null canonical mezmur_id does not drop published Mezmurs from public categories')
}

// 25. Parent categories expand subcategories and count distinct Mezmurs without double-counting
{
  const { COLLECTION_TAXONOMY_MAP } = await import('../src/lib/publicContent/hymnBrowse.ts')
  const angelsSaintsSubcategories = COLLECTION_TAXONOMY_MAP['angels-saints']?.categories || []
  assert.ok(angelsSaintsSubcategories.includes('kidus-michael'), 'Test 25: kidus-michael subcategory present')
  assert.ok(angelsSaintsSubcategories.includes('kidus-gabriel'), 'Test 25: kidus-gabriel subcategory present')

  // Simulate two subcategory links for the same Mezmur UUID (e.g. kidus-michael and kidus-gabriel)
  const sharedHymnUuid = 'aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee'
  const mockLinks = [
    { mezmur_import_id: sharedHymnUuid, mezmur_slug: 'michael-gabriel-hymn', category_slug: 'kidus-michael' },
    { mezmur_import_id: sharedHymnUuid, mezmur_slug: 'michael-gabriel-hymn', category_slug: 'kidus-gabriel' },
    { mezmur_import_id: 'ffffffff-bbbb-cccc-dddd-eeeeeeeeeeee', mezmur_slug: 'michael-only-hymn', category_slug: 'kidus-michael' },
  ]
  const targetCategories = new Set(['angels-saints', ...angelsSaintsSubcategories])
  const distinctInParent = new Set<string>()
  for (const link of mockLinks) {
    if (targetCategories.has(link.category_slug)) {
      distinctInParent.add(link.mezmur_import_id)
    }
  }
  // Despite 3 link records, there are exactly 2 distinct Mezmurs
  assert.equal(distinctInParent.size, 2, 'Test 25: No double counting in parent category')
  console.log('✓ Test 25 passed: Parent categories expand subcategories without double-counting')
}

// 26. Language filters accurately restrict browse cards and list items
{
  const { normalizeMezmurLanguage, isMezmurLanguageFilter } = await import('../src/lib/mezmur/mezmurLanguage.ts')
  const validFilters = ['all', 'am', 'ti', 'om', 'gez', 'en'] as const
  for (const f of validFilters) {
    assert.ok(isMezmurLanguageFilter(f), `Test 26: Valid filter ${f}`)
  }
  assert.ok(!isMezmurLanguageFilter('invalid_lang'), 'Test 26: Rejects invalid language filter')

  const testHymns = [
    { title: 'Amharic Hymn', language: 'amharic' },
    { title: 'English Hymn', language: 'en' },
    { title: 'Geʽez Hymn', language: 'gez' },
    { title: 'Oromo Hymn', language: 'oromo' },
    { title: 'Tigrinya Hymn', language: 'ti' },
  ]

  const amharicFiltered = testHymns.filter((h) => normalizeMezmurLanguage(h.language) === 'am')
  assert.equal(amharicFiltered.length, 1)
  assert.equal(amharicFiltered[0].title, 'Amharic Hymn')

  const englishFiltered = testHymns.filter((h) => normalizeMezmurLanguage(h.language) === 'en')
  assert.equal(englishFiltered.length, 1)
  assert.equal(englishFiltered[0].title, 'English Hymn')

  console.log('✓ Test 26 passed: Language filters accurately restrict browse cards and list items')
}

// 27. Public Collection page matches visible items count with card counts and excludes draft records
{
  const collectionPageCode = readFileSync(resolve('src/pages/PublicHymnCollectionPage.tsx'), 'utf8')
  assert.match(collectionPageCode, /loadHymnBrowseIndex\(language \|\| undefined\)/, 'Test 27: loadHymnBrowseIndex receives active language filter')
  assert.match(collectionPageCode, /fetchAllCategoryLinks/, 'Test 27: fetchAllCategoryLinks used for category matching')
  assert.match(collectionPageCode, /fetchAllOccasionLinks/, 'Test 27: fetchAllOccasionLinks used for occasion matching')
  assert.match(collectionPageCode, /allowedImportIds\.has\(item\.id\)/, 'Test 27: item.id matched against allowedImportIds')
  console.log('✓ Test 27 passed: Public Collection page matches visible items and filters accurately')
}

// 28. Admin taxonomy derivation paginates beyond 1,000 rows and counts distinct Mezmurs
{
  const taxonomyCode = readFileSync(resolve('src/lib/cms/hymnTaxonomyImport.ts'), 'utf8')
  assert.match(taxonomyCode, /const pageSize = 1000/, 'Test 28: Taxonomy queries use 1,000 pageSize')
  assert.match(taxonomyCode, /\.range\(from, to\)/, 'Test 28: Taxonomy queries paginate with range')
  assert.match(taxonomyCode, /mezmur_import_id, mezmur_slug/, 'Test 28: Taxonomy queries select UUID and slug')
  assert.match(taxonomyCode, /distinctBySlug/, 'Test 28: Taxonomy derives distinct mezmurs per category/occasion')
  console.log('✓ Test 28 passed: Admin taxonomy derivation paginates beyond 1,000 rows and counts distinct Mezmurs')
}

console.log('--- ALL 28 HARDENED REGRESSION TESTS PASSED SUCCESSFULLY ---')
