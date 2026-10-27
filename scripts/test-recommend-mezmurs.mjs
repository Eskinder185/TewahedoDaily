import { supabase } from '../src/lib/supabase/client.ts'
import { buildDailyFaithContext, recommendDailyMezmurs } from '../src/lib/recommendations/dailyFaithRecommendationEngine.ts'

async function run() {
  const date = new Date(2026, 9, 26) // Oct 26, 2026
  const ctx = await buildDailyFaithContext(date)
  console.log('Context for Oct 26, 2026:', {
    eth: ctx.ethiopianDate,
    feasts: ctx.feasts,
    saints: ctx.saints,
    fasts: ctx.fasts,
    seasons: ctx.seasons,
  })

  // Test recommendDailyMezmurs with mezmur_public
  const recs = await recommendDailyMezmurs(ctx, 4)
  console.log('Recommended Mezmurs:', recs.length)
  for (const r of recs) {
    console.log(`- ${r.title} (${r.titleAmharic}) | Score: ${r.score} | Reason: ${r.matchReasonEn} | Singer: ${r.singerName} | Audio: ${Boolean(r.audioUrl || r.youtubeUrl)}`)
  }
}

run().catch(console.error)
