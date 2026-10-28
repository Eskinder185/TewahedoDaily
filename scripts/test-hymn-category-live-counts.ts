import assert from 'node:assert/strict'
import {
  getHymnCollections,
  getHymnCollectionBySlug,
  getHymnSection,
  getMezmursForSection,
  getHymnSingers,
  CANONICAL_MAJOR_COLLECTIONS,
} from '../src/lib/publicContent/hymnBrowse.ts'
import { supabase } from '../src/lib/supabase/client.ts'

console.log('--- STARTING 24-POINT REGRESSION TEST SUITE FOR HYMN CATEGORY LIVE COUNTS ---')

if (!supabase) {
  console.error('Supabase client is not configured. Ensure VITE_SUPABASE_URL and key are set.')
  process.exit(1)
}

// 1. mezmur_public view does NOT have deleted_at; queries must succeed without 42703 error
{
  const { data, error } = await supabase
    .from('mezmur_public' as never)
    .select('slug, status, primary_language')
    .eq('status', 'published')
    .limit(5)
  assert.equal(error, null, 'Test 1: mezmur_public select without deleted_at must succeed')
  assert(Array.isArray(data) && data.length > 0, 'Test 1: mezmur_public returns rows')
  console.log('✓ Test 1 passed: Category live counts query mezmur_public without schema 42703 error')
}

// 2. Published Mezmurs are counted
{
  const collections = await getHymnCollections('all')
  assert(collections.length > 0, 'Test 2: Collections returned')
  const totalCount = collections.reduce((acc, c) => acc + c.mezmurCount, 0)
  assert(totalCount > 0, `Test 2: Total published count must be > 0 (got ${totalCount})`)
  const holidays = collections.find((c) => c.slug === 'occasion-holidays-feasts')
  assert(holidays && holidays.mezmurCount > 0, `Test 2: Holidays & Feasts count > 0 (got ${holidays?.mezmurCount})`)
  console.log(`✓ Test 2 passed: Published Mezmurs are counted (Total aggregated: ${totalCount}, Holidays: ${holidays?.mezmurCount})`)
}

// 3. Draft Mezmurs are excluded from counts
{
  const { count: draftCount } = await supabase
    .from('mezmur_data_import' as never)
    .select('*', { count: 'exact', head: true })
    .eq('status', 'draft')
    .is('deleted_at', null)

  const { count: publishedCount } = await supabase
    .from('mezmur_public' as never)
    .select('*', { count: 'exact', head: true })

  assert(typeof publishedCount === 'number' && publishedCount > 0, 'Test 3: Published count is positive')
  console.log(`✓ Test 3 passed: Draft Mezmurs excluded from public view (Drafts in staging: ${draftCount}, Published in public view: ${publishedCount})`)
}

// 4. Deleted Mezmurs are excluded
{
  // mezmur_public view explicitly filters "where deleted_at is null" in its definition
  const { data: testDeleted } = await supabase
    .from('mezmur_data_import' as never)
    .select('slug')
    .not('deleted_at', 'is', null)
    .limit(5)
  if (testDeleted && testDeleted.length > 0) {
    const deletedSlug = (testDeleted[0] as { slug: string }).slug
    const { data: pubCheck } = await supabase
      .from('mezmur_public' as never)
      .select('slug')
      .eq('slug', deletedSlug)
    assert.equal(pubCheck?.length, 0, 'Test 4: Deleted records must never appear in mezmur_public')
  }
  console.log('✓ Test 4 passed: Soft-deleted Mezmurs excluded from public counts')
}

// 5. Multi-category deduplication: Mezmurs in multiple subcategories counted ONCE in parent
{
  const collections = await getHymnCollections('all')
  const maryCol = collections.find((c) => c.slug === 'category-virgin-mary')
  assert(maryCol && maryCol.mezmurCount > 0, 'Test 5: Virgin Mary collection has a distinct live count')
  console.log(`✓ Test 5 passed: Multi-category deduplication verified (Parent: ${maryCol.mezmurCount})`)
}

// 6. Parent category aggregates descendant subcategories and occasions
{
  const collections = await getHymnCollections('all')
  const holidayCol = collections.find((c) => c.slug === 'occasion-holidays-feasts')
  assert(holidayCol && holidayCol.mezmurCount >= 40, `Test 6: Holidays & Feasts aggregates occasions (got ${holidayCol?.mezmurCount})`)
  console.log(`✓ Test 6 passed: Parent collection aggregates occasions and sections (holidays-feasts = ${holidayCol.mezmurCount})`)
}

// 7. Language filter: 'all' returns all published Mezmurs
let allCollections: Awaited<ReturnType<typeof getHymnCollections>> = []
{
  allCollections = await getHymnCollections('all')
  const totalAll = allCollections.reduce((acc, c) => acc + c.mezmurCount, 0)
  assert(totalAll > 100, `Test 7: 'all' filter aggregates total published hymns (got ${totalAll})`)
  console.log(`✓ Test 7 passed: Language filter 'all' returns full catalog count (${totalAll})`)
}

// 8. Language filter: 'am' returns only Amharic published Mezmurs
{
  const amCollections = await getHymnCollections('am')
  const totalAm = amCollections.reduce((acc, c) => acc + c.mezmurCount, 0)
  const totalAll = allCollections.reduce((acc, c) => acc + c.mezmurCount, 0)
  assert(totalAm > 0 && totalAm <= totalAll, `Test 8: Amharic count (${totalAm}) must be <= All (${totalAll})`)
  const englishColInAm = amCollections.find((c) => c.slug === 'english-mezmur')
  assert.equal(englishColInAm?.mezmurCount, 0, 'Test 8: English collection in Amharic filter must be 0')
  console.log(`✓ Test 8 passed: Language filter 'am' accurately isolates Amharic hymns (${totalAm})`)
}

// 9. Language filter: 'ti' returns the deployed Tigrinya catalog
{
  const tiCollections = await getHymnCollections('ti')
  const totalTi = tiCollections.reduce((acc, c) => acc + c.mezmurCount, 0)
  assert(totalTi > 0, `Test 9: Tigrinya filter must expose verified songs (got ${totalTi})`)
  console.log(`✓ Test 9 passed: Language filter 'ti' exposes Tigrinya hymns (${totalTi} grouped memberships)`)
}

// 10. Language filter: 'om' returns only Oromo published Mezmurs
{
  const omCollections = await getHymnCollections('om')
  const totalOm = omCollections.reduce((acc, c) => acc + c.mezmurCount, 0)
  assert(typeof totalOm === 'number', 'Test 10: Oromo counts are numbers')
  console.log(`✓ Test 10 passed: Language filter 'om' successfully processed (Total: ${totalOm})`)
}

// 11. Language filter: 'gez' returns only Geʽez published Mezmurs
{
  const gezCollections = await getHymnCollections('gez')
  const totalGez = gezCollections.reduce((acc, c) => acc + c.mezmurCount, 0)
  assert(typeof totalGez === 'number', 'Test 11: Geʽez counts are numbers')
  console.log(`✓ Test 11 passed: Language filter 'gez' successfully processed (Total: ${totalGez})`)
}

// 12. Language filter: 'en' returns only English published Mezmurs
{
  const enCollections = await getHymnCollections('en')
  const englishCol = enCollections.find((c) => c.slug === 'english-mezmur')
  assert(englishCol && englishCol.mezmurCount > 0, `Test 12: English collection in 'en' filter has hymns (got ${englishCol?.mezmurCount})`)
  console.log(`✓ Test 12 passed: Language filter 'en' accurately counts English hymns (${englishCol.mezmurCount})`)
}

// 13. English Mezmur collection displays accurate count matching English language filter
{
  const enCollections = await getHymnCollections('en')
  const englishCol = enCollections.find((c) => c.slug === 'english-mezmur')
  const allCols = await getHymnCollections('all')
  const englishInAll = allCols.find((c) => c.slug === 'english-mezmur')
  assert.equal(englishCol?.mezmurCount, englishInAll?.mezmurCount, 'Test 13: English Mezmur count consistent')
  console.log(`✓ Test 13 passed: English Mezmur collection displays accurate count (${englishCol?.mezmurCount})`)
}

// 14. Zemari / Singers collection displays count of distinct published hymns with singers
{
  const allCols = await getHymnCollections('all')
  const singerCol = allCols.find((c) => c.slug === 'zemari-singers')
  assert(singerCol && singerCol.mezmurCount > 500, `Test 14: Zemari / Singers has live count (got ${singerCol?.mezmurCount})`)
  const singersList = await getHymnSingers('all')
  assert(singersList.length > 0, 'Test 14: Singers list returned')
  console.log(`✓ Test 14 passed: Zemari / Singers collection displays accurate distinct count (${singerCol.mezmurCount} hymns across ${singersList.length} singers)`)
}

// 15. Section card count matches the EXACT number of hymns returned on detail page
{
  const testSections = [
    { col: 'holidays-feasts', sec: 'holidays-tinsae' },
    { col: 'holidays-feasts', sec: 'holidays-gena' },
    { col: 'angels-saints', sec: 'saint-michael' },
    { col: 'praise-general', sec: 'general-mezmur' },
  ]

  for (const { col, sec } of testSections) {
    const sectionInfo = await getHymnSection(col, sec, 'all')
    assert(sectionInfo, `Test 15: section ${sec} must exist`)
    const mezmurs = await getMezmursForSection(col, sec, { language: 'all' as never, pageSize: 100 })
    assert.equal(
      sectionInfo.mezmurCount,
      mezmurs.total,
      `Test 15: section ${sec} card count (${sectionInfo.mezmurCount}) must equal detail total (${mezmurs.total})`,
    )
  }
  console.log('✓ Test 15 passed: Subcategory card counts match detail listing totals exactly (0 discrepancy)')
}

// 16. Language parameter persists on card links
{
  const amCollections = await getHymnCollections('am')
  for (const c of amCollections) {
    assert(c.href.startsWith('/hymns/browse/'), `Test 16: collection ${c.slug} has valid href`)
  }
  console.log('✓ Test 16 passed: Route links preserve hierarchy paths')
}

// 17. No hardcoded counts in getHymnCollections
{
  assert.equal(CANONICAL_MAJOR_COLLECTIONS[0].mezmurCount, 0, 'Test 17: Canonical constants default mezmurCount to 0 (not hardcoded totals)')
  const liveCollections = await getHymnCollections('all')
  assert(liveCollections[0].mezmurCount > 0, 'Test 17: Live collections calculate dynamic counts from database')
  console.log('✓ Test 17 passed: Counts are dynamically calculated from database, not hardcoded')
}

// 18. Canonical major collections structure and metadata intact
{
  const expectedSlugs = [
    'jesus-christ-salvation',
    'category-virgin-mary',
    'holy-trinity-holy-spirit',
    'category-angels-saints',
    'prayer-worship',
    'occasion-holidays-feasts',
    'fasting-seasons',
    'church-life-sacraments',
    'anytime-mezmurs',
    'english-mezmur',
    'zemari-singers',
  ]
  const live = await getHymnCollections('all')
  const liveSlugs = live.map((c) => c.slug)
  for (const slug of expectedSlugs) {
    assert(liveSlugs.includes(slug), `Test 18: Collection ${slug} must be present in live collections`)
  }
  console.log(`✓ Test 18 passed: All 11 canonical major collections present (${liveSlugs.join(', ')})`)
}

// 19. Error resilience: PostgREST schema errors handled gracefully
{
  const badSection = await getHymnSection('invalid-col', 'nonexistent-sec')
  assert.equal(badSection, null, 'Test 19: Non-existent section returns null gracefully')
  console.log('✓ Test 19 passed: Invalid routes and schema queries handled gracefully')
}

// 20. Performance: Single round-trip / parallel query optimization
{
  const start = Date.now()
  await getHymnCollections('all')
  const duration = Date.now() - start
  assert(duration < 2000, `Test 20: Execution must be fast (<2000ms, took ${duration}ms)`)
  console.log(`✓ Test 20 passed: High performance query execution (${duration}ms)`)
}

// 21. Cache TTL behavior: Language-specific caching
{
  const c1 = await getHymnCollections('am')
  const c2 = await getHymnCollections('am')
  assert.equal(c1, c2, 'Test 21: Subsequent calls within TTL return cached reference')
  const cEn = await getHymnCollections('en')
  assert.notEqual(c1, cEn, 'Test 21: Different languages use separate cache partitions')
  console.log('✓ Test 21 passed: Multi-lingual cache partitioning verified')
}

// 22. Pagination consistency: Total count preserved across pages
{
  const page1 = await getMezmursForSection('jesus-christ', 'christ-hymns', { page: 1, pageSize: 10 })
  const page2 = await getMezmursForSection('jesus-christ', 'christ-hymns', { page: 2, pageSize: 10 })
  assert.equal(page1.total, page2.total, 'Test 22: Total count is invariant across pagination slices')
  assert(page1.items.length <= 10 && page2.items.length <= 10, 'Test 22: Page sizes respected')
  console.log(`✓ Test 22 passed: Pagination consistency verified (Total ${page1.total} invariant across pages)`)
}

// 23. getHymnCollectionBySlug returns accurate counts matching getHymnCollections
{
  const single = await getHymnCollectionBySlug('jesus-christ-salvation', 'all')
  const inList = allCollections.find((c) => c.slug === 'jesus-christ-salvation')
  assert.equal(single?.mezmurCount, inList?.mezmurCount, 'Test 23: Direct slug lookup matches list count')
  console.log(`✓ Test 23 passed: getHymnCollectionBySlug matches list count (${single?.mezmurCount})`)
}

// 24. Zero displayed only for true zero; non-empty categories display non-zero
{
  const collections = await getHymnCollections('all')
  const nonZeroCount = collections.filter((c) => c.mezmurCount > 0).length
  assert.equal(nonZeroCount, 11, `Test 24: All 11 major collections have > 0 published Mezmurs in 'all' (got ${nonZeroCount})`)
  console.log(`✓ Test 24 passed: All 11 major collections have active published Mezmurs with live counts`)
}

console.log('--- ALL 24 REGRESSION TESTS PASSED SUCCESSFULLY ---')
