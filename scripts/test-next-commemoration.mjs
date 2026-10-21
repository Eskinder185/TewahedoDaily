/**
 * Deterministic next-occurrence calendar regressions (FE ↔ math).
 * Run: npm run test:next-commemoration
 */
import assert from 'node:assert/strict'
import {
  detectCommemorationSubject,
  ethiopianMonthLength,
  isNextOccurrenceQuery,
  nextFixedEthDateOnOrAfter,
  nextMonthlyDayOnOrAfter,
  resolveNextCommemoration,
} from '../src/lib/eotcCalendar/nextCommemoration.ts'
import { gregorianToEthiopian } from '../src/lib/ethiopianDate.ts'
import {
  detectCalendarRoute,
  gregorianYmdInTimezone,
} from '../src/lib/searchBuddy/calendarStructuredSearch.ts'
import { assistantLeadForResponse } from '../src/lib/search/assistantLead.ts'
import { toIsoLocalDate } from '../src/lib/churchCalendar/pascha.ts'

function d(y, m, day) {
  return new Date(y, m - 1, day)
}

// --- Intent ---
assert.equal(isNextOccurrenceQuery('When is the next Saint Michael commemoration?'), true)
assert.equal(isNextOccurrenceQuery('upcoming Fast of the Prophets'), true)
assert.equal(detectCommemorationSubject('When is the next Saint Michael commemoration?'), 'michael')
assert.equal(detectCalendarRoute('When is the next Saint Michael commemoration?')?.kind, 'calendar_next_occurrence')
assert.equal(detectCalendarRoute('What are the Five Mysteries?')?.kind ?? null, null)
// Next query without known subject still routes (abstention, not Gemma invention)
assert.equal(detectCalendarRoute('When is the next Unknown Saint feast?')?.kind, 'calendar_next_occurrence')

// --- Saint Michael from Oct 19, 2026 ---
const ref = d(2026, 10, 19)
const ethRef = gregorianToEthiopian(ref)
assert.deepEqual(ethRef, { year: 2019, month: 2, day: 9 })

const michael = resolveNextCommemoration(
  'When is the next Saint Michael commemoration?',
  ref,
)
assert.ok(michael)
assert.equal(michael.verified, true)
assert.equal(michael.found, true)
assert.equal(michael.monthly?.gregorianIso, '2026-10-22')
assert.match(michael.monthly?.ethiopianLabel || '', /Tikimt 12, 2019/)
assert.equal(michael.nextAnnual?.gregorianIso, '2026-11-21')
assert.match(michael.nextAnnual?.ethiopianLabel || '', /Hidar 12, 2019/)
assert.ok(michael.otherAnnual.some((x) => /Sene 12/.test(x.ethiopianLabel)))
assert.match(michael.answerEnglish, /October 22, 2026/)
assert.match(michael.answerEnglish, /November 21, 2026/)
assert.doesNotMatch(michael.answerEnglish, /September 29/)
assert.doesNotMatch(michael.answerEnglish, /Five Mysteries|Mystery of the Trinity/i)
// Never treat a past date as next
assert.ok(new Date(michael.monthly.gregorianIso + 'T12:00:00') >= ref)

const lead = assistantLeadForResponse({
  type: 'ai',
  answer: michael.answerEnglish,
  calendar_verified: true,
})
assert.equal(lead, '', 'verified calendar answers must not get a greeting lead')

// Amharic next-Michael
const am = resolveNextCommemoration('ቅዱስ ሚካኤል ቀጣይ መታሰቢያ መቼ ነው?', ref)
assert.ok(am)
assert.equal(am.found, true)
assert.match(am.answerAmharic, /Tikimt 12/)

// --- Gabriel monthly (day 19) ---
const gabriel = resolveNextCommemoration('When is the next Saint Gabriel commemoration?', ref)
assert.ok(gabriel?.found)
assert.equal(gabriel.monthly?.ethiopian.day, 19)

// --- Fast of the Prophets (Hedar 15 start) ---
const prophets = resolveNextCommemoration('When is the next Fast of the Prophets?', ref)
assert.ok(prophets?.found)
assert.match(prophets.answerEnglish, /fasting period begins|Hidar 15/i)

// --- Abstention (no invent) ---
const unknown = resolveNextCommemoration('When is the next Saint XYZZY feast?', ref)
assert.ok(unknown)
assert.equal(unknown.found, false)
assert.match(unknown.answerEnglish, /will not guess|do not have a verified/i)

// --- Ethiopian New Year boundary ---
const nyEve = d(2026, 9, 10)
const nyDay = d(2026, 9, 11)
assert.deepEqual(gregorianToEthiopian(nyEve), { year: 2018, month: 13, day: 5 })
assert.deepEqual(gregorianToEthiopian(nyDay), { year: 2019, month: 1, day: 1 })

// --- Pagume length ---
assert.equal(ethiopianMonthLength(2018, 13), 5)
assert.equal(ethiopianMonthLength(2019, 13), 6)
assert.equal(ethiopianMonthLength(2020, 13), 5)

const pagume6 = nextFixedEthDateOnOrAfter(d(2027, 8, 1), 13, 6)
assert.ok(pagume6)
assert.equal(pagume6.eth.day, 6)
assert.equal(pagume6.eth.month, 13)
assert.equal(pagume6.eth.year, 2019)
assert.equal(toIsoLocalDate(pagume6.gregorian), '2027-09-11')

// --- Monthly day 12 across Pagume ---
const afterPagumeStart = d(2027, 9, 6)
const next12 = nextMonthlyDayOnOrAfter(afterPagumeStart, 12)
assert.ok(next12)
assert.equal(next12.ethiopian.day, 12)
assert.equal(next12.ethiopian.month, 1)

// --- FE calendar day for Tikimt 12 agrees with next-occurrence ---
const tikimt12 = nextFixedEthDateOnOrAfter(ref, 2, 12)
assert.equal(toIsoLocalDate(tikimt12.gregorian), '2026-10-22')
assert.equal(michael.monthly.gregorianIso, toIsoLocalDate(tikimt12.gregorian))

// --- On-or-after: from Tikimt 12 itself, next monthly is same day ---
const onDay = resolveNextCommemoration(
  'When is the next Saint Michael commemoration?',
  d(2026, 10, 22),
)
assert.equal(onDay.monthly?.gregorianIso, '2026-10-22')

// --- Timezone helper produces YYYY-MM-DD ---
assert.match(gregorianYmdInTimezone('Africa/Addis_Ababa', 0), /^\d{4}-\d{2}-\d{2}$/)

console.log('test-next-commemoration: ok')
console.log('  Michael monthly:', michael.monthly.ethiopianLabel, '→', michael.monthly.gregorianIso)
console.log('  Michael annual:', michael.nextAnnual.ethiopianLabel, '→', michael.nextAnnual.gregorianIso)
console.log(
  '  Michael Sene:',
  michael.otherAnnual.find((x) => /Sene/.test(x.ethiopianLabel))?.ethiopianLabel,
)
