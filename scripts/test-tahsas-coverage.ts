import { getSynaxariumDay, getSynaxariumDayWithCommemorations, countSynaxariumDays } from '../src/lib/prayers/synaxariumSupabase'

async function run() {
  console.log('Testing full Synaxarium coverage...')
  const count = await countSynaxariumDays()
  console.log('Total Synaxarium days count:', count)

  const day = await getSynaxariumDay(4, 29)
  console.log('Tahsas 29 day:', day?.displayDateEnglish, '|', day?.displayDateAmharic)

  const bundle = await getSynaxariumDayWithCommemorations(4, 29)
  console.log('Tahsas 29 commemorations count:', bundle?.commemorations.length)
  console.log('First commemoration:', bundle?.commemorations[0]?.title)

  const day1 = await getSynaxariumDayWithCommemorations(4, 1)
  console.log('Tahsas 1 commemorations count:', day1?.commemorations.length)
  console.log('First commemoration:', day1?.commemorations[0]?.title)
}

run().catch(err => {
  console.error(err)
  process.exit(1)
})
