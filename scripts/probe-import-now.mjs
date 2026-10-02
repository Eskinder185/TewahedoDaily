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

const sb = createClient(url, key)
for (const t of [
  'mezmur_collections_import',
  'mezmur_sections_import',
  'mezmur_section_links_import',
  'mezmur_data_import',
  'mezmur_occasion_links_import',
  'mezmur_category_links_import',
]) {
  const r = await sb.from(t).select('*', { count: 'exact' }).limit(1)
  console.log(
    t,
    'count=' + r.count,
    r.error ? 'ERR ' + r.error.message : 'ok',
    r.data?.[0] ? Object.keys(r.data[0]).sort().join(',') : '(empty)',
  )
}
