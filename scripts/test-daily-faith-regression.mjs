import assert from 'node:assert/strict'
import { supabase } from '../src/lib/supabase/client.js'
import { loadOrthodoxCalendarCatalog, resolveOrthodoxDay } from '../src/lib/calendar/orthodoxCalendarData.js'
import { buildDayChurchContext } from '../src/services/dayChurchContext.js'
import { fetchPassageRange } from '../src/lib/bible/passageService.js'

async function runRegressionSuite() {
  console.log('=== RUNNING DAILY FAITH DASHBOARD REGRESSION SUITE ===\n')

  // 1. Database Safety: Check 1,152 Mezmurs
  console.log('1. Checking Database Catalog Preservation...')
  const { count: mezCount, error: countErr } = await supabase
    .from('mezmur_public')
    .select('*', { count: 'exact', head: true })

  assert.equal(countErr, null, 'Error querying mezmur_public: ' + countErr?.message)
  assert.ok(mezCount >= 1152, `Expected at least 1152 Mezmurs, found ${mezCount}`)
  console.log(`   [PASS] mezmur_public contains ${mezCount} active records (>= 1,152).`)

  // 2. Calendar Resolution for Oct 26, 2026 (Tikimt 16, 2019 E.C. - Monday)
  console.log('\n2. Testing Calendar Resolution for Oct 26, 2026...')
  const catalog = await loadOrthodoxCalendarCatalog()
  const testDate = new Date(2026, 9, 26) // Month is 0-indexed: 9 = October
  const resolved = resolveOrthodoxDay(testDate, catalog)

  // Verify Voluntary / Customary Devotion
  assert.equal(resolved.fastingStatus.isFastDay, false, 'Oct 26, 2026 (Monday Tsige) should not be an unqualified mandatory fast')
  assert.equal(resolved.fastingStatus.isOptionalFast, true, 'Oct 26, 2026 (Monday Tsige) must be flagged as isOptionalFast = true')
  assert.ok(
    resolved.fastingStatus.label.toLowerCase().includes('customary') ||
    resolved.fastingStatus.label.toLowerCase().includes('voluntary'),
    `Fasting label must mention customary or voluntary devotion: got "${resolved.fastingStatus.label}"`
  )
  console.log(`   [PASS] Fasting accurately classified: optional=${resolved.fastingStatus.isOptionalFast}, isFastDay=${resolved.fastingStatus.isFastDay}`)

  // Verify Kidane Mihret commemoration
  const hasKidaneMihret = resolved.monthlyCommemorations.some(m => m.name.includes('Kidane Mihret'))
  assert.ok(hasKidaneMihret, 'Expected monthly commemoration Kidane Mihret on Tikimt 16')
  console.log('   [PASS] Kidane Mihret commemoration confirmed on Tikimt 16.')

  // 3. DayChurchContext Output
  console.log('\n3. Testing DayChurchContext Construction & Date Formatting...')
  const dayContext = await buildDayChurchContext(testDate)

  // Check no duplicated E.C.
  assert.ok(!dayContext.ethiopianLabel.includes('E.C. E.C.'), `Duplicate E.C. found in ethiopianLabel: "${dayContext.ethiopianLabel}"`)
  assert.ok(dayContext.ethiopianLabel.endsWith('E.C.'), `ethiopianLabel should end with single E.C.: "${dayContext.ethiopianLabel}"`)
  assert.ok(!dayContext.ethiopianLabelAmharic.includes('ዓ.ም. ዓ.ም.'), `Duplicate ዓ.ም. found: "${dayContext.ethiopianLabelAmharic}"`)
  console.log(`   [PASS] English label: "${dayContext.ethiopianLabel}"`)
  console.log(`   [PASS] Amharic label: "${dayContext.ethiopianLabelAmharic}"`)

  // Check Liturgy Focus
  assert.ok(dayContext.liturgySummary !== null, 'Liturgy summary should be provided')
  console.log(`   [PASS] Liturgy focus: ${dayContext.liturgySummary.anaphoraTitle || 'Ordinary Commemoration (Liturgy of the Faithful)'}`)

  // 4. Mezmur Recommendations
  console.log('\n4. Testing Mezmur Recommendations...')
  assert.ok(dayContext.mezmurRecommendations.length > 0, 'Mezmur recommendations should not be empty')
  console.log(`   [PASS] Returned ${dayContext.mezmurRecommendations.length} hymns:`)
  for (const m of dayContext.mezmurRecommendations) {
    assert.ok(m.title, 'Mezmur recommendation must have a title')
    assert.ok(m.matchReason, 'Mezmur recommendation must have a matchReason')
    assert.ok(m.practiceHref.includes('/practice/mezmur/'), `Practice link should point to /practice/mezmur/: got "${m.practiceHref}"`)
    console.log(`     - "${m.title}" [${m.matchReason}] hasPlayableMedia=${m.hasPlayableMedia}`)
  }

  // 5. Scripture Passages Fetching
  console.log('\n5. Testing Scripture Passage Fetching (Matthew 6:16-18)...')
  const passageEn = await fetchPassageRange({
    bookSlug: 'matthew',
    chapterNumber: 6,
    verseStart: 16,
    verseEnd: 18,
    preferredEdition: 'web'
  })

  assert.ok(passageEn, 'Passage WEB must not be null')
  assert.equal(passageEn.verses.length, 3, 'Matthew 6:16-18 in WEB should have 3 verses')
  assert.equal(passageEn.verses[0].verseNumber, 16)
  assert.equal(passageEn.verses[1].verseNumber, 17)
  assert.equal(passageEn.verses[2].verseNumber, 18)
  console.log(`   [PASS] English passage returned all 3 verses (${passageEn.editionName}).`)

  const passageAm = await fetchPassageRange({
    bookSlug: 'matthew',
    chapterNumber: 6,
    verseStart: 16,
    verseEnd: 18,
    preferredEdition: 'am'
  })

  assert.ok(passageAm, 'Passage Amharic must not be null')
  assert.ok(passageAm.verses.length >= 2, 'Amharic text should have verses 16 and 17')
  assert.deepEqual(passageAm.missingVerses, [18], 'Verse 18 combined into 17 should be recorded in missingVerses')
  console.log(`   [PASS] Amharic passage accurately identifies combined verse 18 with note (${passageAm.editionName}).`)

  console.log('\n=== ALL REGRESSION CHECKS PASSED PERFECTLY ===')
}

runRegressionSuite().catch(err => {
  console.error('\n[REGRESSION FAILURE]', err)
  process.exit(1)
})
