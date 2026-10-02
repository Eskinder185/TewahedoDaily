import { createClient } from '@supabase/supabase-js'
import { readFileSync, existsSync } from 'node:fs'

let url = ''
let key = ''
for (const f of ['.env.local', '.env']) {
  if (!existsSync(f)) continue
  for (const line of readFileSync(f, 'utf8').split(/\r?\n/)) {
    if (line.startsWith('#') || !line.includes('=')) continue
    const eq = line.indexOf('=')
    const name = line.slice(0, eq).trim()
    let val = line.slice(eq + 1).trim()
    if (
      (val.startsWith('"') && val.endsWith('"')) ||
      (val.startsWith("'") && val.endsWith("'"))
    ) {
      val = val.slice(1, -1)
    }
    if (name === 'VITE_SUPABASE_URL') url = val
    if (
      name === 'VITE_SUPABASE_PUBLISHABLE_KEY' ||
      name === 'VITE_SUPABASE_ANON_KEY'
    ) {
      key = val
    }
  }
}

const sb = createClient(url, key)
const z = await sb
  .from('zemaris')
  .select(
    'id,slug,name,name_amharic,bio,bio_amharic,image_path,image_alt,is_featured,sort_order,status,updated_at',
  )
  .limit(10)
const v = await sb
  .from('zemaris_with_counts')
  .select(
    'id,slug,name,name_amharic,bio,bio_amharic,image_path,image_alt,is_featured,sort_order,status,updated_at,published_mezmur_count,mezmur_count',
  )
  .limit(10)
const linked = await sb
  .from('mezmur_data_import')
  .select('mezmur_id,slug,title,zemari_id,singer_name,singer_slug,status')
  .not('zemari_id', 'is', null)
  .limit(10)

console.log(
  JSON.stringify(
    {
      zemaris: z.error || z.data,
      view: v.error || v.data,
      linked_mezmurs: linked.error || linked.data,
    },
    null,
    2,
  ),
)
