import { supabase } from '../src/lib/supabase/client.ts'

async function run() {
  if (!supabase) return
  const { data, error } = await supabase.from('mezmur_occasion_links_public').select('*').limit(3)
  console.log('Occasions links:', error ? error.message : data)
  const { data: d2, error: e2 } = await supabase.from('mezmur_category_links_public').select('*').limit(3)
  console.log('Category links:', e2 ? e2.message : d2)
}

run().catch(console.error)
