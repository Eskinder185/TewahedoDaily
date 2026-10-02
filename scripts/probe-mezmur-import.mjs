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
console.log('host', url ? new URL(url).host : '')
if (!url || !key) {
  console.log('NO_ENV')
  process.exit(0)
}
const sb = createClient(url, key)

const tables = [
  'mezmur_collections_import',
  'mezmur_sections_import',
  'mezmur_section_links_import',
  'mezmur_data_import',
  'mezmur_occasion_links_import',
  'mezmur_category_links_import',
]

for (const t of tables) {
  const { count, error } = await sb.from(t).select('*', { count: 'exact', head: true })
  if (error) {
    console.log('\n===', t, '===')
    console.log('EXISTS?', false)
    console.log('ERR', JSON.stringify(error))
    continue
  }
  console.log('\n===', t, '===')
  console.log('EXISTS?', true, 'count=' + count)
  const { data, error: sErr } = await sb.from(t).select('*').limit(1)
  if (sErr) {
    console.log('sample ERR', JSON.stringify(sErr))
    continue
  }
  const row = data?.[0] || null
  console.log('columns', row ? Object.keys(row).sort() : '(empty table — no sample row)')
  if (row) console.log('sample', JSON.stringify(row, null, 2).slice(0, 2500))
}

// Distinct collection_slugs from sections
{
  const { data, error } = await sb
    .from('mezmur_sections_import')
    .select('collection_slug, collection_title, collection_title_amharic')
    .limit(200)
  if (error) console.log('\ncollection_slug probe ERR', JSON.stringify(error))
  else {
    const map = new Map()
    for (const r of data || []) {
      const slug = (r.collection_slug || '').trim()
      if (!slug) continue
      if (!map.has(slug)) map.set(slug, r)
    }
    console.log('\nderived collections', [...map.values()])
  }
}
