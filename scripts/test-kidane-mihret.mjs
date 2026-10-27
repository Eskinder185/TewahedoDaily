import { supabase } from '../src/lib/supabase/client.ts'

async function run() {
  if (!supabase) return
  // Simulate searching for Kidane Mihret / Mary for Tikimt 16
  const { data, error } = await supabase
    .from('mezmur_public')
    .select('mezmur_id, slug, title, title_amharic, singer_name, youtube_url, audio_url, search_keywords')
    .or('title.ilike.%Kidane Mihret%,title.ilike.%Kidane Mihiret%,title_amharic.ilike.%ኪዳነ ምሕረት%,title_amharic.ilike.%ኪዳነ ምህረት%')
    .limit(5)

  console.log('Kidane Mihret exact matches:', error ? error.message : data?.length)
  for (const h of data || []) {
    console.log(`- ${h.title} (${h.title_amharic}) | Singer: ${h.singer_name || 'N/A'} | Playable: ${Boolean(h.youtube_url || h.audio_url)} | Slug: ${h.slug}`)
  }
}

run().catch(console.error)
