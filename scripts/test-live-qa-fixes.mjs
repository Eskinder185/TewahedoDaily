/**
 * Focused checks for the 2026-10-02 live QA fixes (pure helpers).
 * Run: node --experimental-strip-types scripts/test-live-qa-fixes.mjs
 */
import assert from 'node:assert/strict'
import {
  buildDefaultQuickLoops,
  quickLoopsAreEmpty,
  slotIsConfigured,
  emptyQuickLoops,
} from '../src/lib/practice/practiceQuickLoops.ts'
import {
  sanitizePublicLiturgyCopy,
  isInternalPlaceholderCopy,
} from '../src/lib/calendarDayDetails/publicLiturgyCopy.ts'
import { hymnSectionArtFallback } from '../src/lib/publicContent/hymnSectionArtFallbacks.ts'

let passed = 0
function ok(label) {
  passed += 1
  console.log(`✓ ${label}`)
}

{
  const loops = buildDefaultQuickLoops(180)
  assert.equal(quickLoopsAreEmpty(loops), false)
  assert.equal(slotIsConfigured(loops.loop1), true)
  assert.equal(slotIsConfigured(loops.loop2), true)
  assert.equal(slotIsConfigured(loops.loop3), true)
  assert.ok(loops.loop1.endTime != null && loops.loop1.endTime > 50)
  assert.ok(loops.loop3.endTime != null && loops.loop3.endTime <= 180)
  assert.ok((loops.loop3.endTime ?? 0) < 180)
  ok('default quick loops seed three parts for a 3-minute track')
}

{
  assert.equal(quickLoopsAreEmpty(emptyQuickLoops()), true)
  assert.equal(quickLoopsAreEmpty(buildDefaultQuickLoops(30)), false)
  const short = buildDefaultQuickLoops(1)
  assert.equal(quickLoopsAreEmpty(short), true)
  ok('short/unknown duration stays empty until usable span exists')
}

{
  const cleaned = sanitizePublicLiturgyCopy(
    'Anaphora of St. Athanasius according to the PDF note. Confidence: High',
  )
  assert.equal(cleaned.includes('PDF'), false)
  assert.equal(cleaned.includes('Confidence'), false)
  assert.ok(cleaned.toLowerCase().includes('athanasius'))
  assert.equal(isInternalPlaceholderCopy('TODO: draft note'), true)
  assert.equal(isInternalPlaceholderCopy('No specific mezmur linked yet.'), true)
  ok('public liturgy copy strips PDF / confidence / placeholder scaffolding')
}

{
  assert.equal(
    hymnSectionArtFallback('holidays-meskel'),
    '/images/calendar-web/Meskel.webp',
  )
  assert.equal(
    hymnSectionArtFallback('holidays-hosanna'),
    '/images/calendar-web/Hosanna.webp',
  )
  assert.equal(
    hymnSectionArtFallback('holidays-new-year'),
    '/images/calendar-web/Enkutatash.webp',
  )
  assert.equal(hymnSectionArtFallback('unknown-section'), '')
  ok('holiday section art falls back to local calendar-web assets')
}

console.log(`\n${passed} checks passed`)
