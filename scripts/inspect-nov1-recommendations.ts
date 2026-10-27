import { gregorianToEthiopian } from '../src/lib/calendar/ethiopianCalendarEngine.ts'
import { loadOrthodoxCalendarCatalog, resolveOrthodoxDay } from '../src/lib/calendar/orthodoxCalendarData.ts'
import { buildDailyFaithContext, recommendDailyMezmurs } from '../src/lib/recommendations/dailyFaithRecommendationEngine.ts'
import { getCalendarEventsForDate } from '../src/lib/calendar/getCalendarEventsForDate.ts'

async function run() {
  const d = new Date(2026, 10, 1, 12, 0, 0) // Nov 1, 2026
  console.log('Gregorian:', d.toDateString())
  const eth = gregorianToEthiopian(d)
  console.log('Ethiopian:', eth)

  const catalog = await loadOrthodoxCalendarCatalog()
  const resolved = resolveOrthodoxDay(d, catalog)
  console.log('\nResolved Day:')
  console.log('  Observances:', resolved.observances.map(o => `${o.slug}: ${o.title}`))
  console.log('  Monthly Commemorations:', resolved.monthlyCommemorations.map(m => `${m.slug}: ${m.title}`))
  console.log('  Active Fast:', resolved.activeFast?.name)
  console.log('  Season:', resolved.season?.title)

  const { events } = await getCalendarEventsForDate(d)
  console.log('\nCalendar Events For Date (Count: ' + events.length + '):')
  events.forEach(e => {
    console.log(`  - [${e.kind}] ${e.title} (${e.titleAmharic}) | slug: ${e.slug}`)
  })

  const ctx = await buildDailyFaithContext(d)
  console.log('\nDailyFaithContext:')
  console.log('  Fasts:', ctx.fasts)
  console.log('  Seasons:', ctx.seasons)
  console.log('  Feasts:', ctx.feasts)
  console.log('  Saints:', ctx.saints)

  const mezmurs = await recommendDailyMezmurs(ctx, 8)
  console.log('\nCurrent Mezmur Recommendations:')
  mezmurs.forEach(m => {
    console.log(`  - "${m.title}" | Score: ${m.score} | Reason: ${m.matchReasonEn}`)
  })
}

run().catch(console.error)
