import assert from 'node:assert/strict'
import { selectDailyScriptureCandidates, calendarScriptureReaderHref } from '../src/lib/recommendations/dailyScriptureSelection'
import { buildDailyFaithContext, recommendDailyScripture, type DailyFaithContext } from '../src/lib/recommendations/dailyFaithRecommendationEngine'
import type { BiblePassageResult } from '../src/lib/bible/passageService'

const ordinary: DailyFaithContext = {
  gregorianDate: '2026-10-27', ethiopianDate: { year: 2019, month: 2, day: 17 },
  timezone: 'Africa/Addis_Ababa', weekdayIndex: 2, weekdayNameEn: 'Tuesday', weekdayNameAm: '',
  fasts: [], seasons: [], feasts: [], saints: [], themes: [], scriptureReferences: [], sourceIds: [],
}
const cases: [string, Partial<DailyFaithContext>, string, string][] = [
  ['ordinary', {}, 'Matthew 6:5–13', 'Philippians 4:4–9'],
  ['Gena', { feasts: ['Gena — Nativity'] }, 'Luke 2:1–14', 'John 1:1–14'],
  ['Timket', { feasts: ['Timket'] }, 'Matthew 3:13–17', 'Mark 1:9–11'],
  ['Meskel', { feasts: ['Meskel'] }, '1 Corinthians 1:18–25', 'John 3:14–17'],
  ['Tinsae', { feasts: ['Tinsae'] }, 'John 20:1–18', '1 Corinthians 15:20–28'],
  ['Lent', { fasts: ['Abiy Tsom'] }, 'Matthew 6:16–18', 'Isaiah 58:6–11'],
  ['Mary', { saints: ['Kidane Mihret'] }, 'Luke 1:46–55', 'Luke 1:26–38'],
  ['Michael', { saints: ['Kidus Michael'] }, 'Hebrews 1:7–14', 'Psalms 103:19–22'],
  ['saint', { saints: ['Saint Stephen'] }, 'Hebrews 12:1–3', 'Matthew 6:5–13'],
  ['Tsige', { seasons: ['Zemene Tsige'] }, 'Matthew 2:13–15', 'Matthew 6:5–13'],
]
const loader: Parameters<typeof recommendDailyScripture>[1] = async (candidate) => {
  const result = (language: string): BiblePassageResult => ({ bookSlug: candidate.bookSlug, bookTitleEn: '', bookTitleAm: '', chapterNumber: candidate.chapterNumber, chapterOrdinal: candidate.chapterNumber, editionCode: language === 'am' ? 'am' : 'web', editionName: 'Test fixture', languageCode: language, requestedRange: { start: candidate.verseStart, end: candidate.verseEnd || candidate.verseStart }, verses: [{ id: language, verseNumber: candidate.verseStart, text: 'FIXTURE from existing loader contract' }], isComplete: true, missingVerses: [], readerHref: `/bible/${candidate.bookSlug}/${candidate.chapterNumber}#verse-${candidate.verseStart}` })
  return { amharic: result('am'), english: result('en') }
}
for (const [name, override, first, second] of cases) {
  const context = { ...ordinary, ...override }
  const candidates = selectDailyScriptureCandidates(context)
  assert.deepEqual(candidates.slice(0, 2).map((c) => c.reference), [first, second], name)
  assert.equal(new Set(candidates.map((c) => c.reference)).size, candidates.length)
  const readings = await recommendDailyScripture(context, loader)
  assert.equal(readings.length, 2, name)
  assert.ok(readings.every((r) => r.priorityLabelEn === 'Suggested Scripture'))
  assert.ok(readings.every((r) => r.passageAmharic?.verses.length && r.passageEnglish?.verses.length))
}
assert.deepEqual(await recommendDailyScripture(ordinary, async () => ({ amharic: null, english: null })), [], 'No fabricated text when Bible data is absent')
let attempted = 0
assert.equal((await recommendDailyScripture(ordinary, async (candidate) => {
  attempted++
  if (attempted === 1) throw new Error('Unavailable')
  return loader!(candidate)
})).length, 2, 'Unavailable candidate is replaced with another actual passage')
for (const [mode, edition] of [['parallel', 'both'], ['am', 'am'], ['en', 'web']] as const) {
  const url = new URL(calendarScriptureReaderHref('/bible/luke/2?edition=web#verse-1', mode, ordinary.gregorianDate), 'https://example.test')
  assert.equal(url.searchParams.get('edition'), edition)
  assert.equal(url.searchParams.get('returnTo'), '/calendar?date=2026-10-27')
  assert.equal(url.hash, '#verse-1')
}
console.log('Two calendar readings: 10 date/theme cases, distinct references, bilingual text, availability fallback, no fabricated text, and reader return/mode: passed')
if (process.argv.includes('--live')) {
  for (const [name, override] of cases) {
    const readings = await recommendDailyScripture({ ...ordinary, ...override })
    assert.equal(readings.length, 2, name + ' actual Bible passages')
    assert.ok(readings.every((r) => r.passageAmharic?.verses.length && r.passageEnglish?.verses.length), name + ' both translations')
    console.log(name + ': ' + readings.map((r) => r.reference).join('; '))
  }
  for (const date of ['2026-01-07', '2026-01-19', '2026-03-16', '2026-04-12', '2026-09-27', '2026-10-26', '2026-10-27']) {
    const context = await buildDailyFaithContext(new Date(date + 'T12:00:00+03:00'))
    const readings = await recommendDailyScripture(context)
    assert.equal(readings.length, 2, date)
    console.log(date + ' [' + context.feasts.concat(context.seasons).join(', ') + ']: ' + readings.map((r) => r.reference).join('; '))
  }
}
