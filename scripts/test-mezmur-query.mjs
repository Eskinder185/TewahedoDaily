import { supabase } from '../src/lib/supabase/client.ts'

async function run() {
  if (!supabase) {
    console.log('No supabase client configured!')
    return
  }

  console.log('Querying mezmur_data_import...')
  const res1 = await supabase.from('mezmur_data_import').select('id, slug, title').limit(5)
  console.log('mezmur_data_import result:', res1.error ? res1.error.message : `${res1.data?.length} rows`)

  console.log('Querying mezmur_public...')
  const res2 = await supabase.from('mezmur_public').select('id, slug, title, title_amharic, singer, occasion, category, youtube_url, audio_url').limit(5)
  console.log('mezmur_public result:', res2.error ? res2.error.message : `${res2.data?.length} rows`)
  if (res2.data && res2.data.length > 0) {
    console.log('Sample mezmur_public row:', res2.data[0])
  }
}

run().catch(console.error)
