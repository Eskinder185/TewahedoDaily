/**
 * Smoke test for Today's Prayer Rhythm weekday schedule + routes.
 * Run: node scripts/daily-prayer-rhythm-test.mjs
 */
import assert from 'node:assert/strict'

/** Mirrors src/lib/prayers/dailyPrayerRhythmSchedule.ts (keep in sync). */
const WEEKDAY_LABELS = {
  0: { key: 'sunday', english: 'Sunday', amharic: 'እሁድ' },
  1: { key: 'monday', english: 'Monday', amharic: 'ሰኞ' },
  2: { key: 'tuesday', english: 'Tuesday', amharic: 'ማክሰኞ' },
  3: { key: 'wednesday', english: 'Wednesday', amharic: 'ረቡዕ' },
  4: { key: 'thursday', english: 'Thursday', amharic: 'ሐሙስ' },
  5: { key: 'friday', english: 'Friday', amharic: 'ዓርብ' },
  6: { key: 'saturday', english: 'Saturday', amharic: 'ቅዳሜ' },
}

const WUDASE_WEEKDAY_SLUG = {
  0: 'sunday',
  1: 'monday',
  2: 'tuesday',
  3: 'wednesday',
  4: 'thursday',
  5: 'friday',
  6: 'saturday',
}

const PSALM_RANGE_BY_WEEKDAY = {
  0: null,
  1: { from: 1, to: 30 },
  2: { from: 31, to: 60 },
  3: { from: 61, to: 80 },
  4: { from: 81, to: 110 },
  5: { from: 111, to: 130 },
  6: { from: 131, to: 150 },
}

function scheduleFor(date) {
  const day = date.getDay()
  const labels = WEEKDAY_LABELS[day]
  const range = PSALM_RANGE_BY_WEEKDAY[day]
  const wudaseSlug = WUDASE_WEEKDAY_SLUG[day]
  return {
    weekday: labels.english,
    weekdayAmharic: labels.amharic,
    zewterPath: '/pray/zewter-tselot',
    wudasePath: `/pray/wudase-mariam/${wudaseSlug}`,
    psalmsPath: range ? `/pray/mezmure-dawit?from=${range.from}&to=${range.to}` : '/pray/mezmure-dawit',
    psalmRange: range,
  }
}

/** Fixed local dates (year/month/day) for each weekday in March 2026. */
const FIXTURES = [
  { y: 2026, m: 2, d: 1, expect: 'Sunday' }, // Mar 1 2026
  { y: 2026, m: 2, d: 2, expect: 'Monday' },
  { y: 2026, m: 2, d: 3, expect: 'Tuesday' },
  { y: 2026, m: 2, d: 4, expect: 'Wednesday' },
  { y: 2026, m: 2, d: 5, expect: 'Thursday' },
  { y: 2026, m: 2, d: 6, expect: 'Friday' },
  { y: 2026, m: 2, d: 7, expect: 'Saturday' },
]

for (const fixture of FIXTURES) {
  const date = new Date(fixture.y, fixture.m, fixture.d)
  const result = scheduleFor(date)
  assert.equal(result.weekday, fixture.expect, `weekday for ${fixture.expect}`)
  assert.ok(result.weekdayAmharic, 'amharic weekday present')
  assert.equal(result.zewterPath, '/pray/zewter-tselot')
  assert.match(result.wudasePath, /^\/pray\/wudase-mariam\/(sunday|monday|tuesday|wednesday|thursday|friday|saturday)$/)
  if (fixture.expect === 'Sunday') {
    assert.equal(result.psalmsPath, '/pray/mezmure-dawit')
    assert.equal(result.psalmRange, null)
  } else {
    assert.match(result.psalmsPath, /^\/pray\/mezmure-dawit\?from=\d+&to=\d+$/)
    assert.ok(result.psalmRange.from <= result.psalmRange.to)
  }
}

// Numeric psalm ordering must not use lexicographic slug sort.
function getPsalmNumber(slug) {
  const m = String(slug).match(/(?:^|[-_])(?:psalm|mezmure?-?dawit)[-_]?0*(\d{1,3})(?:$|[-_])/i)
  return m ? Number.parseInt(m[1], 10) : null
}
const slugs = ['psalm-10', 'psalm-2', 'psalm-100', 'psalm-1']
const sorted = [...slugs].sort((a, b) => (getPsalmNumber(a) ?? 999) - (getPsalmNumber(b) ?? 999))
assert.deepEqual(sorted, ['psalm-1', 'psalm-2', 'psalm-10', 'psalm-100'])

// Avoid UTC date-shift pitfalls: construct local calendar dates only.
const localWed = new Date(2026, 2, 4) // March 4 2026 local
assert.equal(localWed.getDay(), 3)
assert.equal(scheduleFor(localWed).weekday, 'Wednesday')
assert.equal(scheduleFor(localWed).wudasePath, '/pray/wudase-mariam/wednesday')
assert.equal(scheduleFor(localWed).psalmsPath, '/pray/mezmure-dawit?from=61&to=80')

console.log('daily-prayer-rhythm-test: ok')
