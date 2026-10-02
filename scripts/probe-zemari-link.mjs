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
const id = 'ba662561-1173-44fe-9027-78209bd79855'

const byUuid = await sb
  .from('mezmur_data_import')
  .select('slug,zemari_id,status')
  .eq('zemari_id', id)
const byText = await sb
  .from('mezmur_data_import')
  .select('slug,zemari_id,status')
  .eq('zemari_id', String(id))
const sample = await sb
  .from('mezmur_data_import')
  .select('slug,zemari_id,singer_id,singer_slug,singer_name,status')
  .or(`zemari_id.eq.${id},singer_slug.eq.yosph,singer_name.ilike.Yosph`)
  .limit(20)

console.log(
  JSON.stringify(
    {
      byUuid: byUuid.error || { count: (byUuid.data || []).length, rows: byUuid.data },
      byText: byText.error || { count: (byText.data || []).length, rows: byText.data },
      sample: sample.error || sample.data,
    },
    null,
    2,
  ),
)
