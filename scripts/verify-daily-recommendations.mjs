/**
 * TEWAHEDODAILY — DAILY RECOMMENDATION ENGINE TEST SUITE
 *
 * Verifies:
 * 1. DailyFaithContext building with Church calendar date & liturgical season
 * 2. 4-tier Scripture recommendations:
 *    Tier 1 (appointed_reading), Tier 2 (feast_saint_scripture), Tier 3 (seasonal_scripture), Tier 4 (thematic_scripture)
 * 3. Mezmur recommendation scoring with explainable match reasons
 */

import {
  buildDailyFaithContext,
  recommendDailyScripture,
  recommendDailyMezmurs,
} from '../src/lib/recommendations/dailyFaithRecommendationEngine.ts'

console.log('--- RUNNING DAILY RECOMMENDATIONS ENGINE VERIFICATION ---')

let passed = 0
let failed = 0

function assert(condition, description) {
  if (condition) {
    passed++
    console.log(`  ✓ ${description}`)
  } else {
    failed++
    console.error(`  ✗ FAIL: ${description}`)
  }
}

async function runTests() {
  const testDate = new Date(2025, 9, 25) // Oct 25, 2025 -> Tikimt 15, 2018 E.C.
  const ctx = await buildDailyFaithContext(testDate)

  // 1. Context validation
  assert(ctx.ethiopianDate.year === 2018, `Context Ethiopian year is 2018 (got ${ctx.ethiopianDate.year})`)
  assert(ctx.ethiopianDate.month === 2, `Context Ethiopian month is Tikimt / 2 (got ${ctx.ethiopianDate.month})`)
  assert(ctx.ethiopianDate.day === 15, `Context Ethiopian day is 15 (got ${ctx.ethiopianDate.day})`)
  assert(ctx.weekdayNameEn === 'Saturday', `Context weekday is Saturday (got ${ctx.weekdayNameEn})`)

  // 2. Scripture recommendations validation
  const scriptures = await recommendDailyScripture(ctx)
  assert(scriptures.length >= 1, `Generated at least 1 scripture recommendation (got ${scriptures.length})`)

  const tiers = new Set(scriptures.map((s) => s.priority))
  assert(
    tiers.has('appointed_reading') ||
    tiers.has('feast_saint_scripture') ||
    tiers.has('seasonal_scripture') ||
    tiers.has('thematic_scripture'),
    `Scripture has valid priority tier: ${Array.from(tiers).join(', ')}`
  )

  for (const s of scriptures) {
    assert(Boolean(s.reference), `Scripture has reference: "${s.reference}"`)
    assert(Boolean(s.bookSlug), `Scripture has bookSlug: "${s.bookSlug}"`)
    assert(s.chapter >= 1, `Scripture has valid chapter number: ${s.chapter}`)
    assert(s.readHref.startsWith('/bible/'), `Scripture deep link is valid: "${s.readHref}"`)
    assert(Boolean(s.reasonEn) && Boolean(s.reasonAm), `Scripture has bilingual reasons`)
  }

  // 3. Mezmur recommendations validation
  const mockCatalog = [
    {
      id: 'hymn-1',
      slug: 'meskel-hymn',
      title: 'Zeweredem Meskel',
      title_amharic: 'ዘወረደ መስቀል',
      singer_name: 'Zemari Deacon Abel',
      occasion: 'meskel',
      category: 'feasts',
      audio_url: 'https://example.com/audio1.mp3',
    },
    {
      id: 'hymn-2',
      slug: 'tewahdo-hymn',
      title: 'Tewahedo Haymanote',
      title_amharic: 'ተዋሕዶ ሃይማኖቴ',
      singer_name: 'Zemarit Martha',
      occasion: 'general_praise',
      category: 'spiritual',
      audio_url: 'https://example.com/audio2.mp3',
    },
    {
      id: 'hymn-3',
      slug: 'gebriel-hymn',
      title: 'Kidus Gebriel',
      title_amharic: 'ቅዱስ ገብርኤል',
      singer_name: 'Zemari Tewodros',
      occasion: 'saint_gabriel',
      category: 'angels',
      audio_url: 'https://example.com/audio3.mp3',
    },
  ]

  const mezmurRecs = await recommendDailyMezmurs(ctx, 4, mockCatalog)
  assert(mezmurRecs.length > 0, `Mezmur recommendations returned ${mezmurRecs.length} hymns`)
  assert(mezmurRecs[0].score >= 0, `Top mezmur score is non-negative (${mezmurRecs[0].score})`)
  assert(Boolean(mezmurRecs[0].matchReasonEn), `Top mezmur has English match reason: "${mezmurRecs[0].matchReasonEn}"`)
  assert(Boolean(mezmurRecs[0].matchReasonAm), `Top mezmur has Amharic match reason: "${mezmurRecs[0].matchReasonAm}"`)
  assert(mezmurRecs[0].lyricsHref.startsWith('/practice/mezmur/'), `Mezmur lyrics link is valid: "${mezmurRecs[0].lyricsHref}"`)

  console.log(`\nDaily Recommendations Results: ${passed} passed, ${failed} failed.`)
  if (failed > 0) process.exit(1)
}

void runTests()
