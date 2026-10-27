/**
 * TEWAHEDODAILY — ETHIOPIAN CALENDAR ENGINE TEST SUITE
 *
 * Verifies pure integer JDN bidirectional conversion, leap year rules,
 * edge cases (Pagume 5/6, Meskerem 1, Gregorian Dec 31 / Jan 1), and 100-year roundtrip.
 */

import {
  gregorianToEthiopian,
  ethiopianToGregorian,
  isEthiopianLeapYear,
  daysInEthiopianMonth,
  formatEthiopianDate,
} from '../src/lib/calendar/ethiopianCalendarEngine.ts'

console.log('--- RUNNING ETHIOPIAN CALENDAR ENGINE VERIFICATION ---')

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

// 1. Mandatory Date Conversion Fixtures
const fixtures = [
  { g: new Date(2025, 8, 11), expected: { year: 2018, month: 1, day: 1 }, desc: 'Sep 11 2025 -> Meskerem 1 2018' },
  { g: new Date(2026, 8, 11), expected: { year: 2019, month: 1, day: 1 }, desc: 'Sep 11 2026 -> Meskerem 1 2019' },
  { g: new Date(2027, 8, 12), expected: { year: 2020, month: 1, day: 1 }, desc: 'Sep 12 2027 -> Meskerem 1 2020 (following leap year Pagume 6)' },
  { g: new Date(2026, 0, 1),  expected: { year: 2018, month: 4, day: 23 }, desc: 'Jan 1 2026 -> Tahsas 23 2018' },
  { g: new Date(2026, 6, 2),  expected: { year: 2018, month: 10, day: 25 }, desc: 'Jul 2 2026 -> Sene 25 2018' },
]

for (const f of fixtures) {
  const eth = gregorianToEthiopian(f.g)
  assert(
    eth.year === f.expected.year && eth.month === f.expected.month && eth.day === f.expected.day,
    `Fixture: ${f.desc} (got ${eth.year}/${eth.month}/${eth.day})`
  )
}

// 2. Leap Year Rules & Pagume Lengths
const leapYears = [2007, 2011, 2015, 2019, 2023, 2027]
for (const y of leapYears) {
  assert(isEthiopianLeapYear(y), `Year ${y} E.C. is an Ethiopian leap year`)
  assert(daysInEthiopianMonth(y, 13) === 6, `Year ${y} Pagume has 6 days`)
}

const nonLeapYears = [2016, 2017, 2018, 2020, 2021, 2022, 2024, 2025, 2026]
for (const y of nonLeapYears) {
  assert(!isEthiopianLeapYear(y), `Year ${y} E.C. is not an Ethiopian leap year`)
  assert(daysInEthiopianMonth(y, 13) === 5, `Year ${y} Pagume has 5 days`)
}

// 3. Month Lengths (12 months of 30 days)
for (let m = 1; m <= 12; m++) {
  assert(daysInEthiopianMonth(2018, m) === 30, `Month ${m} has exactly 30 days`)
}

// 4. Bidirectional Roundtrip across 100 Years (1950 to 2050 Gregorian)
console.log('  Testing 100-year continuous daily roundtrip (1950-2050)...')
let roundtripErrors = 0
const start = new Date(1950, 0, 1)
const end = new Date(2050, 11, 31)
const cur = new Date(start)

while (cur <= end) {
  const eth = gregorianToEthiopian(cur)
  const gBack = ethiopianToGregorian(eth)
  if (
    cur.getFullYear() !== gBack.year ||
    (cur.getMonth() + 1) !== gBack.month ||
    cur.getDate() !== gBack.day
  ) {
    roundtripErrors++
    if (roundtripErrors <= 3) {
      console.error(`Roundtrip mismatch: ${cur.toISOString().slice(0, 10)} -> ${eth.year}/${eth.month}/${eth.day} -> ${gBack.year}-${gBack.month}-${gBack.day}`)
    }
  }
  cur.setDate(cur.getDate() + 1)
}

assert(roundtripErrors === 0, `100-year roundtrip completed across 36,890 days with 0 errors`)

// 5. Formatting Verification
const sampleEth = { year: 2018, month: 2, day: 15 }
const formattedEn = formatEthiopianDate(sampleEth, 'en')
const formattedAm = formatEthiopianDate(sampleEth, 'am')
assert(formattedEn === 'Tikimt 15, 2018 E.C.', `English format: ${formattedEn}`)
assert(formattedAm === 'ጥቅምት 15 ቀን 2018 ዓ.ም.', `Amharic format: ${formattedAm}`)

console.log(`\nCalendar Engine Results: ${passed} passed, ${failed} failed.`)
if (failed > 0) process.exit(1)
