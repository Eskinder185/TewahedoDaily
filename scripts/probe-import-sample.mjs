import { createClient } from '@supabase/supabase-js'
import { readFileSync, existsSync } from 'node:fs'

let url = '', key = ''
for (const f of ['.env.local', '.env']) {
  if (!existsSync(f)) continue
  for (const line of readFileSync(f, 'utf8').split(/\r?\n/)) {
    if (line.startsWith('#') || !line.includes('=')) continue
    const eq = line.indexOf('=')
    const name = line.slice(0, eq).trim()
    let val = line.slice(eq + 1).trim().replace(/^['"]|['"]$/g, '')
    if (name === 'VITE_SUPABASE_URL') url = val
    if (name === 'VITE_SUPABASE_PUBLISHABLE_KEY' || name === 'VITE_SUPABASE_ANON_KEY') key = val
  }
}
const sb = createClient(url, key)
for (const t of [
  'mezmur_collections_import',
  'mezmur_sections_import',
  'mezmur_section_links_import',
  'mezmur_data_import',
  'mezmur_occasion_links_import',
  'mezmur_category_links_import',
]) {
  const all = await sb.from(t).select('*', { count: 'exact' }).limit(1)
  console.log(t, 'count', all.count, 'err', all.error?.message || null, 'keys', all.data?.[0] ? Object.keys(all.data[0]).sort() : [])
  if (all.data?.[0]) console.log(' sample', JSON.stringify(all.data[0]).slice(0, 400))
}
