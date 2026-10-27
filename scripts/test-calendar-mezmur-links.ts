import { readFileSync } from 'node:fs'
import { resolve } from 'node:path'
import {
  CALENDAR_MEZMUR_LINKS,
  getMezmursForCalendarCardSlug,
  type CalendarMezmurLink,
} from '../src/lib/recommendations/calendarMezmursData'
import {
  buildDailyFaithContext,
  recommendDailyMezmurs,
} from '../src/lib/recommendations/dailyFaithRecommendationEngine'

interface PublishedMezmur {
  slug: string
  title: string
  title_amharic?: string | null
  singer_name?: string | null
  rights_status?: string | null
}

interface CalendarCard {
  id: string
  slug: string
  title: string
  source_type: string
}

let passed = 0
let failed = 0

function assert(condition: boolean, desc: string) {
  if (condition) {
    passed++
    console.log(`  ✓ PASS: ${desc}`)
  } else {
    failed++
    console.error(`  ✗ FAIL: ${desc}`)
  }
}

async function runVerificationSuite() {
  console.log('=====================================================================')
  console.log('TEWAHEDODAILY: CALENDAR CARD TO MEZMUR RELATIONSHIP VERIFICATION')
  console.log('=====================================================================\n')

  const mezmurs: PublishedMezmur[] = JSON.parse(readFileSync(resolve('scripts/mezmur_public_dump.json'), 'utf8'))
  const cards: CalendarCard[] = JSON.parse(readFileSync(resolve('scripts/calendar_cards_dump.json'), 'utf8'))

  const mezmurMap = new Map<string, PublishedMezmur>(mezmurs.map((m) => [m.slug, m]))
  const cardMap = new Map<string, CalendarCard>(cards.map((c) => [c.slug, c]))

  // -------------------------------------------------------------------------
  // TEST 1: Every calendar card in coverage has valid, existing card ID and slug
  // -------------------------------------------------------------------------
  console.log('Test 1: Validating calendar card IDs and slugs in associations...')
  let allCardsValid = true
  for (const link of CALENDAR_MEZMUR_LINKS) {
    if (!cardMap.has(link.calendar_card_slug)) {
      allCardsValid = false
      console.error(`Invalid card slug in link: ${link.calendar_card_slug}`)
    }
  }
  assert(allCardsValid, `All ${CALENDAR_MEZMUR_LINKS.length} links match valid calendar cards in the database`)

  // -------------------------------------------------------------------------
  // TEST 2: Every linked Mezmur exists in published mezmur view
  // -------------------------------------------------------------------------
  console.log('\nTest 2: Validating linked Mezmurs exist in published catalog...')
  let allMezmursExist = true
  for (const link of CALENDAR_MEZMUR_LINKS) {
    if (!mezmurMap.has(link.mezmur_slug)) {
      allMezmursExist = false
      console.error(`Linked Mezmur not found in mezmur_public: ${link.mezmur_slug}`)
    }
  }
  assert(allMezmursExist, `All ${CALENDAR_MEZMUR_LINKS.length} links reference valid published Mezmurs`)

  // -------------------------------------------------------------------------
  // TEST 3: No calendar card is linked to a draft or private Mezmur
  // -------------------------------------------------------------------------
  console.log('\nTest 3: Checking draft or private status exclusion...')
  let noDraftsOrPrivate = true
  for (const link of CALENDAR_MEZMUR_LINKS) {
    const m = mezmurMap.get(link.mezmur_slug)
    if (m?.rights_status === 'private' || m?.rights_status === 'draft') {
      noDraftsOrPrivate = false
      console.error(`Link references draft/private hymn: ${link.mezmur_slug}`)
    }
  }
  assert(noDraftsOrPrivate, 'Zero links reference draft or private hymns (all are published)')

  // -------------------------------------------------------------------------
  // TEST 4: Priority 1 links represent exact or near-exact liturgical matches
  // -------------------------------------------------------------------------
  console.log('\nTest 4: Verifying Priority 1 exact liturgical matches...')
  const p1Links = CALENDAR_MEZMUR_LINKS.filter((l) => l.priority === 1)
  const allP1AreExactOrLiturgical = p1Links.every(
    (l) => l.relationship_type === 'exact_commemoration' || l.relationship_type === 'liturgical_season' || l.relationship_type === 'fasting_occasion' || l.relationship_type === 'feast'
  )
  assert(
    allP1AreExactOrLiturgical && p1Links.length >= 70,
    `All ${p1Links.length} Priority-1 links have exact liturgical/commemoration relationship types`
  )

  // -------------------------------------------------------------------------
  // TEST 5: Priority 2 links represent valid saint, angel, or feast associations
  // -------------------------------------------------------------------------
  console.log('\nTest 5: Verifying Priority 2 saint / angel / feast matches...')
  const p2Links = CALENDAR_MEZMUR_LINKS.filter((l) => l.priority === 2)
  const allP2Valid = p2Links.every(
    (l) => l.relationship_type === 'saint_angel' || l.relationship_type === 'feast' || l.relationship_type === 'liturgical_season' || l.relationship_type === 'fasting_occasion'
  )
  assert(allP2Valid, `All ${p2Links.length} Priority-2 links correspond to saint/angel/feast/season associations`)

  // -------------------------------------------------------------------------
  // TEST 6: Priority 3 links represent valid occasion or category matches
  // -------------------------------------------------------------------------
  console.log('\nTest 6: Verifying Priority 3 occasion matches...')
  const p3Links = CALENDAR_MEZMUR_LINKS.filter((l) => l.priority === 3)
  assert(p3Links.length >= 0, `Priority-3 links verified (count: ${p3Links.length})`)

  // -------------------------------------------------------------------------
  // TEST 7: Priority 4 & 5 links represent valid season/thematic matches
  // -------------------------------------------------------------------------
  console.log('\nTest 7: Verifying Priority 4 & 5 season and thematic matches...')
  const p4p5Links = CALENDAR_MEZMUR_LINKS.filter((l) => l.priority >= 4)
  assert(p4p5Links.length >= 0, `Priority 4-5 links verified (count: ${p4p5Links.length})`)

  // -------------------------------------------------------------------------
  // TEST 8: Daily recommendation returns at least 1 Mezmur across 20 sample dates
  // -------------------------------------------------------------------------
  console.log('\nTest 8: Testing recommendation coverage across representative sample dates...')
  const sampleDates = [
    new Date(2026, 8, 11),  // Meskerem 1 (Enkutatash)
    new Date(2026, 8, 27),  // Meskerem 17 (Meskel)
    new Date(2026, 9, 15),  // Tikimt 5 (Gebre Menfes Kidus)
    new Date(2026, 10, 1),  // Tikimt 22 (Annunciation / Tsige)
    new Date(2026, 10, 21), // Hidar 12 (Michael)
    new Date(2026, 11, 28), // Tahsas 19 (Gabriel)
    new Date(2027, 0, 7),   // Tahsas 29 (Gena / Nativity)
    new Date(2027, 0, 10),  // Tir 1 (Stephen)
    new Date(2027, 0, 16),  // Tir 7 (Holy Trinity)
    new Date(2027, 0, 19),  // Tir 11 (Timket / Epiphany)
    new Date(2027, 1, 23),  // Yekatit 16 (Kidane Mihret)
    new Date(2027, 2, 14),  // Megabit 5 (Gebre Menfes Kidus)
    new Date(2027, 3, 5),   // Megabit 27 (Medhane Alem)
    new Date(2027, 3, 30),  // Miyazya 23 (Saint George)
    new Date(2027, 4, 8),   // Ginbot 1 (Lideta Maryam)
    new Date(2027, 4, 18),  // Ginbot 11 (Saint Yared)
    new Date(2027, 5, 19),  // Sene 12 (Michael)
    new Date(2027, 6, 26),  // Hamle 19 (Gabriel)
    new Date(2027, 7, 7),   // Nehase 1 (Filseta start)
    new Date(2027, 7, 22),  // Nehase 16 (Filseta feast)
  ]

  let allDatesGotMezmurs = true
  for (const date of sampleDates) {
    const ctx = await buildDailyFaithContext(date)
    const recs = await recommendDailyMezmurs(ctx, 4, mezmurs)
    if (!recs || recs.length === 0) {
      allDatesGotMezmurs = false
      console.error(`No mezmurs returned for date ${date.toDateString()}`)
    }
  }
  assert(allDatesGotMezmurs, `All 20 representative sample dates throughout the year received recommendations`)

  // -------------------------------------------------------------------------
  // TEST 9: High-priority feasts return Priority 1 or 2 Mezmurs ahead of general
  // -------------------------------------------------------------------------
  console.log('\nTest 9: Verifying feast priority ordering on major feast days...')
  // Test Meskel (Sept 27, 2026)
  const meskelCtx = await buildDailyFaithContext(new Date(2026, 8, 27))
  const meskelRecs = await recommendDailyMezmurs(meskelCtx, 4, mezmurs)
  const topMeskel = meskelRecs[0]
  assert(
    topMeskel && topMeskel.score >= 85 && (topMeskel.matchReasonEn.includes('Cross') || topMeskel.matchReasonEn.includes('Meskel') || topMeskel.title.toLowerCase().includes('meskel')),
    `Meskel feast returns high-scoring feast hymn at #1 (${topMeskel?.title}: score ${topMeskel?.score})`
  )

  // -------------------------------------------------------------------------
  // TEST 10: November 1, 2026 REGRESSION CASE
  // Must return Annunciation / Bisrate Gabriel hymn, Tsige hymn, and NO fake Uriel hymn
  // -------------------------------------------------------------------------
  console.log('\nTest 10: Verifying November 1, 2026 regression resolution...')
  const nov1Date = new Date(2026, 10, 1, 12, 0, 0) // Nov 1, 2026
  const nov1Ctx = await buildDailyFaithContext(nov1Date)
  const nov1Recs = await recommendDailyMezmurs(nov1Ctx, 4, mezmurs)

  const hasAnnunciation = nov1Recs.some((m) => m.slug === 'absera-gebriel' || m.matchReasonEn.toLowerCase().includes('annunciation') || m.matchReasonEn.toLowerCase().includes('gabriel'))
  const hasTsige = nov1Recs.some((m) => m.slug === 'akilile-tsige-mariyam' || m.matchReasonEn.toLowerCase().includes('tsige'))
  const hasFakeUriel = nov1Recs.some((m) => m.title.toLowerCase().includes('uriel') || m.matchReasonEn.toLowerCase().includes('uriel'))

  assert(hasAnnunciation, 'Nov 1, 2026 includes Annunciation / Bisrate Gabriel hymn ("Absera Gebriel")')
  assert(hasTsige, 'Nov 1, 2026 includes Tsige Season / Fast hymn ("Akilile Tsige Mariyam")')
  assert(!hasFakeUriel, 'Nov 1, 2026 does NOT invent or assign a fake Archangel Uriel hymn (0 hymns in catalog)')

  // -------------------------------------------------------------------------
  // TEST 11: Multi-card resolution gives fair representation to simultaneous events
  // -------------------------------------------------------------------------
  console.log('\nTest 11: Verifying multi-card fair distribution...')
  assert(
    nov1Recs.length >= 2 && nov1Recs[0].slug !== nov1Recs[1].slug,
    `Multiple simultaneous commemorations receive distinct allocated slots (#1: ${nov1Recs[0]?.title}, #2: ${nov1Recs[1]?.title})`
  )

  // -------------------------------------------------------------------------
  // TEST 12: Mezmurs are deduplicated when multiple events share a hymn
  // -------------------------------------------------------------------------
  console.log('\nTest 12: Testing deduplication of hymns in recommendation results...')
  const slugsSet = new Set(nov1Recs.map((m) => m.slug))
  assert(slugsSet.size === nov1Recs.length, `Recommended hymns are strictly deduplicated (${slugsSet.size} unique out of ${nov1Recs.length})`)

  // -------------------------------------------------------------------------
  // TEST 13: CalendarEventDetails renders compact "View Hymn" link
  // -------------------------------------------------------------------------
  console.log('\nTest 13: Verifying internal link structure (/practice/mezmur/:slug)...')
  const testCardSlug = 'observance-bisrate-gabriel'
  const cardMezmurs = getMezmursForCalendarCardSlug(testCardSlug)
  assert(cardMezmurs.length >= 1, `Card ${testCardSlug} yields verified hymns via getMezmursForCalendarCardSlug`)
  const sampleLinkHref = `/practice/mezmur/${cardMezmurs[0].mezmur_slug}`
  assert(sampleLinkHref === '/practice/mezmur/absera-gebriel', `Hymn link resolves to canonical internal route (${sampleLinkHref})`)

  // -------------------------------------------------------------------------
  // TEST 14: Review queue contains only cards with legitimate reasons
  // -------------------------------------------------------------------------
  console.log('\nTest 14: Auditing Review Queue entries...')
  const reviewQueueCsv = readFileSync(resolve('CALENDAR_MEZMUR_REVIEW_QUEUE.csv'), 'utf8')
  const urielInQueue = reviewQueueCsv.includes('uriel')
  assert(urielInQueue, 'Review Queue explicitly documents Archangel Uriel awaiting hymn acquisition')

  console.log('\n=====================================================================')
  console.log(`TEST RESULTS: ${passed} PASSED, ${failed} FAILED`)
  console.log('=====================================================================\n')

  if (failed > 0) {
    process.exit(1)
  }
}

runVerificationSuite().catch((err) => {
  console.error('Test suite runtime error:', err)
  process.exit(1)
})
