import assert from 'node:assert/strict'
import { createClient } from '@supabase/supabase-js'
import {
  getHymnCollectionBySlug,
  getHymnSection,
  getMezmursForSection,
  getMezmurBySlug,
  fetchAllCategoryLinks,
  fetchAllOccasionLinks,
} from '../src/lib/publicContent/hymnBrowse'

const url = process.env.VITE_SUPABASE_URL || process.env.SUPABASE_URL
const key = process.env.VITE_SUPABASE_PUBLISHABLE_KEY || process.env.VITE_SUPABASE_ANON_KEY || process.env.SUPABASE_ANON_KEY

if (!url || !key) {
  console.error('Missing Supabase credentials in environment.')
  process.exit(1)
}

const supabase = createClient(url, key)

async function testAll() {
  console.log('--- STARTING COMPREHENSIVE RETRIEVAL TESTS ---')

  // Verify published hymns baseline
  const { data: pubData, error: pubErr } = await supabase
    .from('mezmur_public')
    .select('slug, mezmur_id, title, status')
  assert.ok(!pubErr, `mezmur_public query failed: ${pubErr?.message}`)
  const publishedMezmurs = (pubData || []).filter(m => m.status === 'published')
  console.log(`Total Published Mezmurs in mezmur_public: ${publishedMezmurs.length}`)
  const nullMezmurIdCount = publishedMezmurs.filter(m => !m.mezmur_id).length
  console.log(`Published Mezmurs with null canonical mezmur_id: ${nullMezmurIdCount}`)

  // 1. Angels & Saints -> St. Michael
  console.log('\n[Case 1: Angels & Saints -> St. Michael]')
  const secMichael = await getHymnSection('angels-saints', 'saint-michael')
  assert.ok(secMichael, 'Section saint-michael should be found')
  console.log(`Section St. Michael mezmurCount on card: ${secMichael.mezmurCount}`)

  // Page 1
  const page1Michael = await getMezmursForSection('angels-saints', 'saint-michael', { page: 1, pageSize: 12 })
  console.log(`St. Michael Page 1: retrieved ${page1Michael.items.length} items, total reported: ${page1Michael.total}`)
  assert.ok(page1Michael.total > 0, 'Total St. Michael items must be > 0')
  assert.equal(page1Michael.items.length, Math.min(12, page1Michael.total))

  // Retrieve all pages for St. Michael
  const allMichaelItems = []
  const totalPagesMichael = Math.ceil(page1Michael.total / 12)
  for (let p = 1; p <= totalPagesMichael; p++) {
    const res = await getMezmursForSection('angels-saints', 'saint-michael', { page: p, pageSize: 12 })
    allMichaelItems.push(...res.items)
  }
  console.log(`St. Michael All Pages: retrieved ${allMichaelItems.length} across ${totalPagesMichael} pages`)
  assert.equal(allMichaelItems.length, page1Michael.total, 'All items retrieved across pages must match total')
  // Check no duplicates
  const uniqueMichaelSlugs = new Set(allMichaelItems.map(i => i.slug))
  assert.equal(uniqueMichaelSlugs.size, allMichaelItems.length, 'No duplicate slugs across pages')

  // Detail link check for first 3 St. Michael items
  for (const item of allMichaelItems.slice(0, 3)) {
    const detail = await getMezmurBySlug(item.slug)
    assert.ok(detail, `Detail must resolve for slug ${item.slug}`)
    assert.equal(detail.slug, item.slug)
  }

  // 2. Angels & Saints -> St. Gabriel
  console.log('\n[Case 2: Angels & Saints -> St. Gabriel]')
  const secGabriel = await getHymnSection('angels-saints', 'saint-gabriel')
  assert.ok(secGabriel, 'Section saint-gabriel should be found')
  console.log(`Section St. Gabriel mezmurCount on card: ${secGabriel.mezmurCount}`)

  const page1Gabriel = await getMezmursForSection('angels-saints', 'saint-gabriel', { page: 1, pageSize: 12 })
  console.log(`St. Gabriel Page 1: retrieved ${page1Gabriel.items.length} items, total reported: ${page1Gabriel.total}`)
  assert.ok(page1Gabriel.total > 0, 'Total St. Gabriel items must be > 0')

  // 3. Angels & Saints -> Holy Angels
  console.log('\n[Case 3: Angels & Saints -> Holy Angels]')
  const secHolyAngels = await getHymnSection('angels-saints', 'holy-angels')
  assert.ok(secHolyAngels, 'Section holy-angels should be found')
  console.log(`Section Holy Angels mezmurCount on card: ${secHolyAngels.mezmurCount}`)

  const page1HolyAngels = await getMezmursForSection('angels-saints', 'holy-angels', { page: 1, pageSize: 12 })
  console.log(`Holy Angels: retrieved ${page1HolyAngels.items.length} items, total: ${page1HolyAngels.total}`)
  assert.equal(page1HolyAngels.total, 2, 'Holy Angels must have 2 Mezmurs')
  assert.equal(page1HolyAngels.items.length, 2)

  // 4. Jesus Christ -> Christ Hymns
  console.log('\n[Case 4: Jesus Christ -> Christ Hymns]')
  const resChrist = await getMezmursForSection('jesus-christ', 'christ-hymns', { page: 1, pageSize: 12 })
  console.log(`Christ Hymns: retrieved ${resChrist.items.length} items on page 1, total: ${resChrist.total}`)
  assert.ok(resChrist.total > 200, 'Christ Hymns total must be > 200')

  // 5. Virgin Mary -> Virgin Mary Hymns
  console.log('\n[Case 5: Virgin Mary -> Virgin Mary Hymns]')
  const resMary = await getMezmursForSection('virgin-mary', 'virgin-mary-hymns', { page: 1, pageSize: 12 })
  console.log(`Virgin Mary Hymns: retrieved ${resMary.items.length} items on page 1, total: ${resMary.total}`)
  assert.ok(resMary.total > 150, 'Virgin Mary Hymns total must be > 150')

  // 6. Holidays & Feasts -> Gena
  console.log('\n[Case 6: Holidays & Feasts -> Gena]')
  const resGena = await getMezmursForSection('holidays-feasts', 'holidays-gena', { page: 1, pageSize: 12 })
  console.log(`Gena: retrieved ${resGena.items.length} items on page 1, total: ${resGena.total}`)
  assert.ok(resGena.total >= 60, 'Gena total must be >= 60')

  // 7. Holidays & Feasts -> Meskel
  console.log('\n[Case 7: Holidays & Feasts -> Meskel]')
  const resMeskel = await getMezmursForSection('holidays-feasts', 'holidays-meskel', { page: 1, pageSize: 12 })
  console.log(`Meskel: retrieved ${resMeskel.items.length} items on page 1, total: ${resMeskel.total}`)
  assert.ok(resMeskel.total >= 50, 'Meskel total must be >= 50')

  // 8. Holidays & Feasts -> Timket
  console.log('\n[Case 8: Holidays & Feasts -> Timket]')
  const resTimket = await getMezmursForSection('holidays-feasts', 'holidays-timket', { page: 1, pageSize: 12 })
  console.log(`Timket: retrieved ${resTimket.items.length} items on page 1, total: ${resTimket.total}`)
  assert.ok(resTimket.total >= 1, 'Timket total must be >= 1')

  // 9. English Mezmur -> English Language
  console.log('\n[Case 9: English Mezmur -> English Language]')
  const resEnglish = await getMezmursForSection('english-mezmur', 'english-language', { page: 1, pageSize: 12 })
  console.log(`English Mezmur: retrieved ${resEnglish.items.length} items on page 1, total: ${resEnglish.total}`)
  assert.ok(resEnglish.total >= 70, 'English Mezmur total must be >= 70')

  // 10. Language filter check: Amharic vs English
  console.log('\n[Case 10: Language Filter Verification]')
  const resAmharicOnly = await getMezmursForSection('angels-saints', 'saint-michael', { page: 1, pageSize: 12, language: 'am' })
  console.log(`St. Michael Amharic-only total: ${resAmharicOnly.total}`)
  for (const item of resAmharicOnly.items) {
    assert.equal(item.language, 'amharic', 'Item language must be amharic')
  }

  // 11. Search within section
  console.log('\n[Case 11: Search Within Section]')
  const resSearch = await getMezmursForSection('angels-saints', 'saint-michael', { q: 'mikael', page: 1, pageSize: 12 })
  console.log(`St. Michael search 'mikael': retrieved ${resSearch.items.length}, total: ${resSearch.total}`)
  assert.ok(resSearch.total > 0, 'Search within section must return results')

  // 12. UUID lookup verification for getMezmurBySlug
  console.log('\n[Case 12: Stable UUID lookup in getMezmurBySlug]')
  const sampleCatLink = (await fetchAllCategoryLinks()).find(l => Boolean(l.mezmur_import_id))
  assert.ok(sampleCatLink, 'Must have category link with mezmur_import_id')
  const detailByUuid = await getMezmurBySlug(sampleCatLink.mezmur_import_id)
  assert.ok(detailByUuid, `getMezmurBySlug must resolve when given mezmur_import_id ${sampleCatLink.mezmur_import_id}`)
  assert.equal(detailByUuid.slug, sampleCatLink.mezmur_slug)
  console.log(`Successfully resolved UUID ${sampleCatLink.mezmur_import_id} -> slug '${detailByUuid.slug}' (${detailByUuid.title})`)

  console.log('\n--- ALL COMPREHENSIVE RETRIEVAL TESTS PASSED SUCCESSFULLY! ---')
}

testAll().catch(err => {
  console.error('TEST FAILED:', err)
  process.exit(1)
})
