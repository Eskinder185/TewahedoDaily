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
import { CALENDAR_ENTITIES, matchCalendarEntities } from '../src/lib/search/entityAliases.ts'
import { getEntryById } from '../src/lib/eotcCalendar/eotcCalendarDataset.ts'
import { findNextCivilDayForEntry } from '../src/lib/eotcCalendar/eotcFindEntryOccurrence.ts'
import { parseQuestion } from '../src/lib/searchBuddy/questionParse.ts'
import {
  pendingFromResult,
  resolveCalendarQuestion,
} from '../src/lib/searchBuddy/calendarQuestion.ts'
import { normalizeSearchText } from '../src/lib/search/searchCore.ts'
import { shouldSearchFaithAndOrder } from '../src/lib/searchBuddy/teachingTopics.ts'

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

// --- Search Buddy question matrix (fixed clock, Africa/Addis_Ababa) ---
const TZ = 'Africa/Addis_Ababa'
const clock = { now: ref, timeZone: TZ }

function ask(query, pending) {
  const parsed = parseQuestion(query, { pending })
  const result =
    parsed.domain === 'calendar' ? resolveCalendarQuestion(parsed, clock) : null
  return { parsed, result }
}

function askAt(query, now, pending) {
  const parsed = parseQuestion(query, { pending })
  const result =
    parsed.domain === 'calendar'
      ? resolveCalendarQuestion(parsed, { now, timeZone: TZ })
      : null
  return { parsed, result }
}

assert.equal(normalizeSearchText("When's Saint Michael's feast?"), 'when is saint michael feast')
assert.equal(normalizeSearchText("What's the NEXT fast?"), 'what is the next fast')
assert.ok(normalizeSearchText("What's the NEXT fast?").includes('next'))
assert.ok(normalizeSearchText('Are we not fasting today?').includes('not'))

const michaelHits = matchCalendarEntities(normalizeSearchText("When's Saint Micheal feast?"))
assert.equal(michaelHits[0]?.entity.key, 'michael')
assert.equal(matchCalendarEntities(normalizeSearchText('Mikail'))[0]?.entity.key, 'michael')
assert.equal(matchCalendarEntities(normalizeSearchText('ሚካኤል'))[0]?.entity.key, 'michael')
assert.equal(matchCalendarEntities(normalizeSearchText('Gebriel'))[0]?.entity.key, 'gabriel')
assert.equal(matchCalendarEntities(normalizeSearchText('ገብርኤል'))[0]?.entity.key, 'gabriel')

for (const entity of CALENDAR_ENTITIES) {
  for (const id of [
    ...entity.monthlyIds,
    ...entity.annualIds,
    ...entity.feastIds,
    ...entity.fastIds,
    ...entity.seasonIds,
  ]) {
    assert.ok(getEntryById(id), `catalog id missing: ${id} (${entity.key})`)
  }
}

assert.equal(parseQuestion('Find hymns about Saint Michael').domain, 'hymn')
assert.equal(parseQuestion('Who is Saint Michael?').domain, 'website')
assert.equal(parseQuestion('Open Calendar').domain, 'navigation')
assert.equal(parseQuestion('What are the Five Mysteries?').domain, 'teaching')
assert.equal(parseQuestion('Explain the theological significance of Timkat').domain, 'teaching')
assert.equal(shouldSearchFaithAndOrder("When is Saint Michael's feast?"), null)
assert.equal(shouldSearchFaithAndOrder('Find hymns about Saint Michael'), null)
assert.equal(shouldSearchFaithAndOrder('What are the Five Mysteries?')?.id ?? null, null)

const feastQ = ask("When is Saint Michael's feast?")
assert.equal(feastQ.parsed.domain, 'calendar')
assert.equal(feastQ.result?.kind, 'clarify')
assert.equal(feastQ.result?.kind === 'clarify' ? feastQ.result.pending.ambiguity : '', 'monthly_vs_annual')

const annualFollow = ask('annual', pendingFromResult(feastQ.result))
assert.equal(annualFollow.parsed.isFollowUp, true)
assert.equal(annualFollow.result?.kind, 'answer')
const annualIds =
  annualFollow.result?.kind === 'answer'
    ? annualFollow.result.occurrences.map((row) => row.entryId)
    : []
assert.ok(annualIds.includes('saint-michael-major'))
assert.ok(annualIds.includes('saint-michael-sene-12'))
assert.equal(
  annualFollow.result?.kind === 'answer' ? annualFollow.result.occurrences[0].gregorianIso : '',
  '2026-11-21',
)
assert.match(
  annualFollow.result?.kind === 'answer' ? annualFollow.result.occurrences[0].href : '',
  /\/calendar\?date=2026-11-21/,
)

const monthlyFollow = ask('monthly', pendingFromResult(feastQ.result))
assert.equal(monthlyFollow.result?.kind, 'answer')
assert.equal(
  monthlyFollow.result?.kind === 'answer' ? monthlyFollow.result.occurrences[0].gregorianIso : '',
  '2026-10-22',
)
assert.equal(
  monthlyFollow.result?.kind === 'answer' ? monthlyFollow.result.occurrences[0].relative : '',
  'in_days',
)

const todayMichael = askAt('Is Saint Michael commemorated today?', d(2026, 10, 22))
assert.equal(todayMichael.result?.kind, 'answer')
assert.equal(
  todayMichael.result?.kind === 'answer' ? todayMichael.result.occurrences[0].relative : '',
  'today',
)
assert.equal(
  todayMichael.result?.kind === 'answer' ? todayMichael.result.occurrences[0].gregorianIso : '',
  '2026-10-22',
)

const amFeast = ask('የቅዱስ ሚካኤል በዓል መቼ ነው?')
assert.equal(amFeast.parsed.language, 'am')
assert.equal(amFeast.result?.kind, 'clarify')
const amMonthly = ask('ወርሃዊ', pendingFromResult(amFeast.result))
assert.equal(amMonthly.parsed.isFollowUp, true)
assert.equal(
  amMonthly.result?.kind === 'answer' ? amMonthly.result.occurrences[0].gregorianIso : '',
  '2026-10-22',
)

const nextFast = ask('What is the next fast?')
assert.equal(nextFast.result?.kind, 'clarify')
assert.equal(
  nextFast.result?.kind === 'clarify' ? nextFast.result.pending.ambiguity : '',
  'weekly_vs_named_fast',
)
const weeklyFollow = ask('weekly', pendingFromResult(nextFast.result))
assert.equal(weeklyFollow.result?.kind, 'answer')
assert.equal(
  weeklyFollow.result?.kind === 'answer' ? weeklyFollow.result.occurrences[0].category : '',
  'weekly_fast',
)
assert.equal(
  weeklyFollow.result?.kind === 'answer' ? weeklyFollow.result.occurrences[0].gregorianIso : '',
  '2026-10-21',
)
const namedFollow = ask('named', pendingFromResult(nextFast.result))
assert.equal(namedFollow.result?.kind, 'answer')
assert.equal(
  namedFollow.result?.kind === 'answer' ? namedFollow.result.occurrences[0].entryId : '',
  'tsome-nebiyat',
)

const fastingToday = ask('Are we fasting today?')
assert.equal(fastingToday.result?.kind, 'answer')
assert.match(
  fastingToday.result?.kind === 'answer' ? fastingToday.result.headlineEn : '',
  /not a fasting day/i,
)

const prophetsStart = nextFixedEthDateOnOrAfter(ref, 3, 15)
assert.ok(prophetsStart)
const activeFast = askAt('Are we fasting today?', prophetsStart.gregorian)
assert.equal(activeFast.result?.kind, 'answer')
assert.ok(
  activeFast.result?.kind === 'answer' &&
    activeFast.result.occurrences.some((row) => row.entryId === 'tsome-nebiyat'),
)
const currentEnd = askAt('When does the current fast end?', prophetsStart.gregorian)
assert.equal(currentEnd.result?.kind, 'answer')
assert.ok(
  currentEnd.result?.kind === 'answer' &&
    currentEnd.result.occurrences.some((row) => row.endGregorianIso || row.endUnsupported),
)

const abiy = ask('When does Great Lent start?')
assert.equal(abiy.parsed.domain, 'calendar')
if (abiy.result?.kind === 'answer') {
  const computed = findNextCivilDayForEntry('abiy-tsom', ref, { maxDays: 420 })
  assert.ok(computed)
  assert.equal(abiy.result.occurrences[0].gregorianIso, toIsoLocalDate(computed))
  assert.equal(abiy.result.occurrences[0].href, `/calendar?date=${toIsoLocalDate(computed)}`)
} else {
  assert.equal(abiy.result?.kind, 'unsupported')
}

const meskel = ask('When is Meskel?')
assert.equal(meskel.result?.kind, 'answer')
const meskelIds =
  meskel.result?.kind === 'answer' ? meskel.result.occurrences.map((row) => row.entryId) : []
assert.ok(meskelIds.includes('meskel-finding-of-the-true-cross'))
assert.ok(meskelIds.includes('megabit-meskel'))

const timket = ask('When is Timket this year?')
assert.equal(timket.result?.kind, 'answer')
const timketDate = nextFixedEthDateOnOrAfter(ref, 5, 11)
assert.ok(timketDate)
assert.equal(
  timket.result?.kind === 'answer' ? timket.result.occurrences[0].gregorianIso : '',
  toIsoLocalDate(timketDate.gregorian),
)

const ethToday = ask('What is today in the Ethiopian calendar?')
assert.equal(ethToday.result?.kind, 'answer')
assert.equal(
  ethToday.result?.kind === 'answer' ? ethToday.result.occurrences[0].gregorianIso : '',
  '2026-10-19',
)

const nextAnnual = ask('What is the next annual feast?')
assert.equal(nextAnnual.result?.kind, 'answer')
assert.ok(nextAnnual.result?.kind === 'answer' && nextAnnual.result.occurrences[0].gregorianIso >= '2026-10-19')

const afterHedar = askAt("When is Saint Michael's annual feast?", d(2026, 12, 1))
assert.equal(afterHedar.result?.kind, 'answer')
assert.ok(
  afterHedar.result?.kind === 'answer' &&
    afterHedar.result.occurrences.some((row) => row.entryId === 'saint-michael-sene-12'),
)

const pagumenStart = d(2027, 9, 6)
assert.equal(gregorianToEthiopian(pagumenStart).month, 13)
const pagumenMonthly = askAt("When is Saint Michael's monthly commemoration?", pagumenStart)
assert.equal(pagumenMonthly.result?.kind, 'answer')
assert.equal(
  pagumenMonthly.result?.kind === 'answer' ? pagumenMonthly.result.occurrences[0].gregorianIso : '',
  toIsoLocalDate(next12.gregorian),
)
assert.notEqual(
  pagumenMonthly.result?.kind === 'answer' ? pagumenMonthly.result.occurrences[0].ethiopianLabel : '',
  '',
)

const unknownSaint = ask('When is Saint XYZZY feast?')
assert.equal(unknownSaint.parsed.domain, 'calendar')
assert.equal(unknownSaint.result?.kind, 'unsupported')

const stale = ask('Find hymns about Saint Michael', pendingFromResult(feastQ.result))
assert.equal(stale.parsed.domain, 'hymn')
assert.equal(stale.parsed.isFollowUp, false)

const gehad = ask('When is Tsome Gehad?')
assert.equal(gehad.parsed.domain, 'calendar')
assert.equal(gehad.result?.kind, 'unsupported')

console.log('search-buddy calendar question matrix: ok')
