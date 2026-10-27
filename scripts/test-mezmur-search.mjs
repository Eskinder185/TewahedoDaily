import { supabase } from '../src/lib/supabase/client.ts'

async function run() {
  if (!supabase) return
  const { data, count, error } = await supabase
    .from('mezmur_public')
    .select('mezmur_id, slug, title, title_amharic, singer_name, youtube_url, audio_url, search_keywords', { count: 'exact' })
    .limit(20)

  console.log('Total in mezmur_public:', count, error ? error.message : '')
  console.log('Sample rows:', data?.slice(0, 3))

  // Test searching for Mary / Kidane Mihret / Tsige / general praise
  const { data: maryHymns } = await supabase
    .from('mezmur_public')
    .select('mezmur_id, slug, title, title_amharic, singer_name, youtube_url, audio_url, search_keywords')
    .or('title.ilike.%Kidane%,title.ilike.%Maryam%,title_amharic.ilike.%ኪዳነ%,title_amharic.ilike.%ማርያም%')
    .limit(10)

  console.log('Found Mary/Kidane Mihret hymns:', maryHymns?.length)
  if (maryHymns && maryHymns.length) {
    console.log('Mary hymn sample:', maryHymns.map(h => ({ title: h.title, titleAm: h.title_amharic, slug: h.slug })))
  }
}

run().catch(console.error)
