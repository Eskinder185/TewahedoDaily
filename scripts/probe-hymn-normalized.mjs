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
      name === 'VITE_SUPABASE_ANON_KEY' ||
      name === 'SUPABASE_ANON_KEY'
    ) {
      key = val
    }
  }
}
console.log('hasUrl', Boolean(url), 'hasKey', Boolean(key), 'host', url ? new URL(url).host : '')
if (!url || !key) {
  console.log('NO_ENV')
  process.exit(0)
}
const sb = createClient(url, key)
const tables = [
  'mezmur_collections_import',
  'mezmur_sections_import',
  'mezmur_data_import',
  'mezmur_section_links_import',
  'mezmur_occasion_links_import',
  'mezmur_category_links_import',
  'zemaris',
  'zemaris_with_counts',
  'hymn_major_browse_groups',
  'hymn_browse_group_children',
]
for (const t of tables) {
  const { count, error } = await sb.from(t).select('*', { count: 'exact', head: true })
  if (error) console.log(t, 'ERR', JSON.stringify(error))
  else console.log(t, 'count=' + count)
}

const { data: cols, error: cErr } = await sb
  .from('mezmur_collections_import')
  .select('collection_slug,title,status,sort_order')
  .eq('status', 'published')
  .order('sort_order')
  .limit(20)
if (cErr) console.log('collections query ERR', JSON.stringify(cErr))
else console.log('collections', JSON.stringify(cols, null, 2))

const occ = await sb
  .from('mezmur_occasion_links_import')
  .select('occasion_slug')
  .limit(5)
console.log(
  'occasion_links_sample',
  occ.error ? JSON.stringify(occ.error) : JSON.stringify(occ.data),
)
