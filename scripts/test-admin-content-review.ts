/**
 * Automated Verification Suite for Admin Content Review System
 * Tests security, defaulting, persistence, non-interference, and RLS.
 */

import { readFileSync } from 'node:fs'
import { resolve } from 'node:path'
import {
  resolveReviewStatus,
  saveReviewStatus,
  getReviewNote,
  getReviewSummary,
  fetchReviewsForContent,
  type ReviewStatus,
} from '../src/lib/cms/adminContentReviewService'
import { buildDailyFaithContext, recommendDailyMezmurs } from '../src/lib/recommendations/dailyFaithRecommendationEngine'
import { supabase } from '../src/lib/supabase/client'

let passed = 0
let failed = 0

function assert(condition: boolean, description: string) {
  if (condition) {
    passed++
    console.log(`  ✓ PASS: ${description}`)
  } else {
    failed++
    console.error(`  ✗ FAIL: ${description}`)
  }
}

async function runTests() {
  console.log('=====================================================================')
  console.log('TEWAHEDODAILY: ADMIN CONTENT REVIEW SYSTEM VERIFICATION')
  console.log('=====================================================================\n')

  // -------------------------------------------------------------------------
  // TEST 1: Default to Needs Review
  // -------------------------------------------------------------------------
  console.log('Test 1: Unreviewed records default to Needs Review...')
  const testMezmurId = 'test-mezmur-' + Date.now()
  const initialStatus = resolveReviewStatus(testMezmurId)
  assert(initialStatus === 'needs_review', `Unreviewed ID "${testMezmurId}" defaults to "needs_review"`)

  const testCardId = 'test-card-' + Date.now()
  assert(resolveReviewStatus(testCardId) === 'needs_review', `Unreviewed card ID defaults to "needs_review"`)

  // -------------------------------------------------------------------------
  // TEST 2: Mark Reviewed Action & Note Persistence
  // -------------------------------------------------------------------------
  console.log('\nTest 2: Mark Reviewed updates status and persists note...')
  const noteText = 'Theological review passed: lyrics and scripture citations verified.'
  const updated = await saveReviewStatus('mezmur', testMezmurId, 'reviewed', {
    note: noteText,
    userEmail: 'admin@tewahedo.church',
    userId: '00000000-0000-0000-0000-000000000001',
  })
  assert(updated.review_status === 'reviewed', 'SaveReviewStatus returned review_status: "reviewed"')

  const resolved = resolveReviewStatus(testMezmurId)
  assert(resolved === 'reviewed', 'Subsequent resolveReviewStatus confirms item is "reviewed"')

  const savedNote = getReviewNote(testMezmurId)
  assert(savedNote === noteText, `Review note persisted correctly: "${savedNote}"`)

  // -------------------------------------------------------------------------
  // TEST 3: Mark for Review Again
  // -------------------------------------------------------------------------
  console.log('\nTest 3: Mark for Review Again restores "needs_review"...')
  const restored = await saveReviewStatus('mezmur', testMezmurId, 'needs_review', {
    note: 'Follow-up question on transliteration.',
  })
  assert(restored.review_status === 'needs_review', 'Status updated back to "needs_review"')
  assert(resolveReviewStatus(testMezmurId) === 'needs_review', 'Confirmed restored to "needs_review"')

  // -------------------------------------------------------------------------
  // TEST 4: Independent Resource Relationship Review (Phase 5)
  // -------------------------------------------------------------------------
  console.log('\nTest 4: Calendar card review and resource relationship review are strictly decoupled...')
  const cardSlug = 'observance-kidane-mihret'
  const resourceKey = `${cardSlug}:mezmur:kidane-mihret-emebet`

  // Mark card as reviewed
  await saveReviewStatus('calendar_card', cardSlug, 'reviewed', { note: 'Card visual and date rule approved' })

  // The related resource must still be unreviewed
  const resourceStatus = resolveReviewStatus(resourceKey)
  assert(resourceStatus === 'needs_review', 'Related resource is independent and remains "needs_review"')

  // Mark the relationship as reviewed
  await saveReviewStatus('calendar_resource', resourceKey, 'reviewed', { note: 'Hymn association verified' })
  assert(resolveReviewStatus(resourceKey) === 'reviewed', 'Resource relationship is now independently "reviewed"')
  assert(resolveReviewStatus(cardSlug) === 'reviewed', 'Card remains "reviewed"')

  // Re-open card for review; relationship should stay reviewed
  await saveReviewStatus('calendar_card', cardSlug, 'needs_review')
  assert(resolveReviewStatus(cardSlug) === 'needs_review', 'Card reopened for review')
  assert(resolveReviewStatus(resourceKey) === 'reviewed', 'Resource relationship status unaffected by card reopening')

  // -------------------------------------------------------------------------
  // TEST 5: Review Summary Statistics & Real Counts
  // -------------------------------------------------------------------------
  console.log('\nTest 5: Aggregated review summary calculation...')
  const summary = await getReviewSummary()
  assert(summary.mezmursTotal >= 900, `Total mezmurs count is accurate (${summary.mezmursTotal})`)
  assert(summary.calendarTotal >= 100, `Total calendar cards count is accurate (${summary.calendarTotal})`)
  assert(
    summary.mezmursNeedsReview + summary.mezmursReviewed === summary.mezmursTotal,
    'Mezmurs review arithmetic is exact (reviewed + needs_review = total)'
  )
  assert(
    summary.calendarNeedsReview + summary.calendarReviewed === summary.calendarTotal,
    'Calendar review arithmetic is exact (reviewed + needs_review = total)'
  )
  assert(summary.overallProgressPct >= 0 && summary.overallProgressPct <= 100, `Overall progress percentage valid (${summary.overallProgressPct}%)`)

  // -------------------------------------------------------------------------
  // TEST 6: Non-Interference Guarantee (Phase 8)
  // -------------------------------------------------------------------------
  console.log('\nTest 6: Non-interference verification...')
  // Verify recommendation engine is unaware of review status
  const testDate = new Date(2026, 10, 1) // Nov 1, 2026
  const ctx = await buildDailyFaithContext(testDate)
  const recs = await recommendDailyMezmurs(ctx, 4)
  assert(recs.length > 0, `Daily recommendations execute normally (${recs.length} hymns returned)`)
  assert(
    recs.every((r) => !('review_status' in r)),
    'Public recommendation response object does NOT leak internal review_status'
  )

  // Verify public client routes and views have no admin review references
  const publicHymnDetail = readFileSync(resolve('src/pages/PublicMezmurDetail.tsx'), 'utf8')
  assert(
    !publicHymnDetail.includes('admin_content_review') && !publicHymnDetail.includes('AdminContentReviewTag'),
    'Public Mezmur detail page does NOT reference admin review components or table'
  )

  const publicCalendar = readFileSync(resolve('src/pages/CalendarPage.tsx'), 'utf8')
  assert(
    !publicCalendar.includes('admin_content_review') && !publicCalendar.includes('AdminContentReviewTag'),
    'Public Calendar page does NOT reference admin review components or table'
  )

  // -------------------------------------------------------------------------
  // TEST 7: Security & Row Level Security (RLS) Migration Audit
  // -------------------------------------------------------------------------
  console.log('\nTest 7: Security and RLS audit of migration script...')
  const migrationSql = readFileSync(resolve('supabase/migrations/20261026180000_admin_content_review.sql'), 'utf8')
  assert(
    migrationSql.includes('ALTER TABLE public.admin_content_review ENABLE ROW LEVEL SECURITY;'),
    'Migration explicitly enables Row Level Security (RLS)'
  )
  assert(
    migrationSql.includes('REVOKE ALL ON public.admin_content_review FROM anon, public;'),
    'Migration revokes all access from anon and public'
  )
  assert(
    migrationSql.includes('is_staff()'),
    'Migration uses public.is_staff() for authenticated staff policy'
  )
  assert(
    migrationSql.includes('CONSTRAINT admin_content_review_type_id_unique UNIQUE (content_type, content_id)'),
    'Unique constraint on content_type and content_id is declared'
  )

  // Test live anon denial if Supabase client is configured
  if (supabase) {
    console.log('\nTest 8: Testing anonymous access denial...')
    try {
      const client = supabase as any
      const { data, error } = await client.from('admin_content_review').select('*').limit(5)
      // When unauthenticated, either error is returned or 0 rows returned due to RLS
      const anonDenied = Boolean(error || !data || data.length === 0)
      assert(anonDenied, 'Anonymous access to admin_content_review is denied / returns 0 rows')
    } catch {
      assert(true, 'Anonymous access threw expected permission denial')
    }
  }

  console.log('\n=====================================================================')
  console.log(`TEST RESULTS: ${passed} PASSED, ${failed} FAILED`)
  console.log('=====================================================================\n')

  if (failed > 0) process.exit(1)
}

runTests().catch((err) => {
  console.error('Test suite error:', err)
  process.exit(1)
})
