import { supabase } from '../src/lib/supabase/client.ts'

async function run() {
  if (!supabase) return
  const { data, error } = await supabase.from('liturgical_fasts').select('*')
  console.log('Fasts count:', data?.length, error ? error.message : '')
  for (const f of data || []) {
    console.log(`- ${f.slug} | name: ${f.name} | type: ${f.fast_type} | months: ${f.ethiopian_month_number_start}/${f.ethiopian_day_start} -> ${f.ethiopian_month_number_end}/${f.ethiopian_day_end}`)
  }
}

run().catch(console.error)
