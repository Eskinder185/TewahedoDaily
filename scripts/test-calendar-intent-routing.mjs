/**
 * Search Buddy structured calendar routing.
 * Run: npm run test:calendar-intent-routing
 */
import assert from 'node:assert/strict'
import {
  detectCalendarRoute,
  detectCalendarTodayIntent,
  gregorianYmdInTimezone,
  normalizeCalendarIntentText,
  userTimezone,
} from '../src/lib/searchBuddy/calendarStructuredSearch.ts'
import {
  searchBuddyApiReady,
  sendSearchBuddyMessage,
} from '../src/lib/searchBuddy/sendSearchBuddyMessage.ts'
import { assistantLeadForResponse } from '../src/lib/search/assistantLead.ts'

const FEAST_ASR = '\u12DB\u122C \u1260\u12A0\u1209 \u121D\u1295\u12F5\u12F3\u12CD'
const FEAST_CANON = '\u12DB\u122C \u1260\u12D3\u1209 \u121D\u1295\u12F5\u1290\u12CD'
const FAST_Q = '\u12DB\u122C \u133E\u121D \u1290\u12CD'
const TOMORROW_Q = '\u1290\u1308 \u121D\u1295 \u1260\u12D3\u120D \u1290\u12CD'
const SYNAX_Q = '\u12E8\u12DB\u122C \u1235\u1295\u12AD\u1233\u122D'
const HYMN_TITLE = '\u12E8\u1235\u1219 \u1275\u122D\u1313\u121C'
const MESKEL_DAY = 'Meskerem 17 feast'

assert.ok(normalizeCalendarIntentText(FEAST_ASR).includes('\u1260\u12D3\u1209'))
assert.equal(detectCalendarTodayIntent(FEAST_ASR), 'calendar_today')
assert.equal(detectCalendarTodayIntent(FEAST_CANON), 'calendar_today')
assert.equal(detectCalendarTodayIntent(FAST_Q), 'fasting_today')
assert.equal(detectCalendarTodayIntent(SYNAX_Q), 'synaxarium_today')
assert.equal(detectCalendarTodayIntent(HYMN_TITLE), null)
assert.equal(detectCalendarTodayIntent("today's feast"), 'calendar_today')
assert.equal(detectCalendarTodayIntent('fast today'), 'fasting_today')

const feastRoute = detectCalendarRoute(FEAST_ASR)
assert.equal(feastRoute?.kind, 'calendar_today')

const tomorrowRoute = detectCalendarRoute(TOMORROW_Q)
assert.equal(tomorrowRoute?.kind, 'calendar_date')
assert.equal(
  tomorrowRoute?.kind === 'calendar_date' ? tomorrowRoute.dateValue : null,
  gregorianYmdInTimezone(userTimezone(), 1),
)

const synaxRoute = detectCalendarRoute(SYNAX_Q)
assert.equal(synaxRoute?.kind, 'synaxarium_today')

const dayRoute = detectCalendarRoute(MESKEL_DAY)
assert.equal(dayRoute?.kind, 'calendar_day')
assert.equal(dayRoute?.kind === 'calendar_day' ? dayRoute.month : null, 1)
assert.equal(dayRoute?.kind === 'calendar_day' ? dayRoute.day : null, 17)

const searchRoute = detectCalendarRoute('Meskel feast')
assert.equal(searchRoute?.kind, 'calendar_search')
assert.equal(searchRoute?.kind === 'calendar_search' ? searchRoute.query : null, 'Meskel')

assert.equal(detectCalendarRoute(HYMN_TITLE), null)
console.log('calendar intent heuristics: ok')

if (!searchBuddyApiReady()) {
  console.log('test-calendar-intent-routing: skipped live API')
  process.exit(0)
}

async function route(q) {
  let last
  for (let i = 0; i < 3; i += 1) {
    try {
      return await sendSearchBuddyMessage(q)
    } catch (error) {
      last = error
      if (error?.code === 'unavailable' || error?.code === 'timeout') {
        await new Promise((r) => setTimeout(r, 400 * (i + 1)))
        continue
      }
      throw error
    }
  }
  throw last
}

function assertNotHymns(result, label) {
  assert.notEqual(result.response.type, 'hymn_search', `${label}: not hymns`)
  assert.notEqual(
    assistantLeadForResponse(result.response, result.empty),
    'Here are the hymns I found.',
    `${label}: not hymn lead`,
  )
}

const a = await route(FEAST_CANON)
assert.equal(a.response.type, 'calendar_today', 'canonical feast → calendar_today')
assert.ok(a.response.ethiopian_label || a.response.gregorian_date || a.response.fasting_status)
assertNotHymns(a, 'feast-canon')
console.log(JSON.stringify({ case: 'feast-canon', type: a.response.type }))

const b = await route(FEAST_ASR)
assert.equal(b.response.type, 'calendar_today', 'ASR feast → calendar_today')
assertNotHymns(b, 'feast-asr')
console.log(JSON.stringify({ case: 'feast-asr', type: b.response.type }))

const c = await route(FAST_Q)
assert.ok(
  c.response.type === 'fasting_today' || c.response.type === 'calendar_today',
  `fast query got ${c.response.type}`,
)
assertNotHymns(c, 'fast')
console.log(JSON.stringify({ case: 'fast', type: c.response.type }))

const t = await route(TOMORROW_Q)
assert.ok(
  t.response.type === 'calendar_today' || t.response.type === 'fasting_today',
  `tomorrow feast got ${t.response.type}`,
)
assertNotHymns(t, 'tomorrow')
console.log(
  JSON.stringify({
    case: 'tomorrow',
    type: t.response.type,
    date: t.response.gregorian_date || null,
  }),
)

const d = await route(SYNAX_Q)
assert.equal(d.response.type, 'synaxarium_today', 'synaxarium today')
assertNotHymns(d, 'synax')
console.log(JSON.stringify({ case: 'synax', type: d.response.type }))

const e = await route(MESKEL_DAY)
assert.equal(e.response.type, 'calendar_day', 'ethiopian day → calendar_day')
assertNotHymns(e, 'meskel-day')
console.log(JSON.stringify({ case: 'meskel-day', type: e.response.type }))

const f = await route('Meskel feast')
assert.equal(f.response.type, 'calendar_search', 'general feast search')
assert.ok(Array.isArray(f.response.results) && f.response.results.length > 0)
assertNotHymns(f, 'meskel-search')
console.log(
  JSON.stringify({
    case: 'meskel-search',
    type: f.response.type,
    count: f.response.results.length,
  }),
)

console.log('test-calendar-intent-routing: ok')
