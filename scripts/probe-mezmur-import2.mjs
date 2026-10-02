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

const tables = [
  'mezmur_collections_import',
  'mezmur_sections_import',
  'mezmur_section_links_import',
  'mezmur_data_import',
  'mezmur_occasion_links_import',
  'mezmur_category_links_import',
]

for (const t of tables) {
  console.log('\n===', t, '===')
  const head = await sb.from(t).select('*', { count: 'exact', head: true })
  console.log('head', JSON.stringify({ count: head.count, error: head.error }))

  const sample = await sb.from(t).select('*').limit(2)
  console.log(
    'sample',
    JSON.stringify({
      error: sample.error,
      keys: sample.data?.[0] ? Object.keys(sample.data[0]).sort() : null,
      rows: sample.data?.length ?? 0,
      first: sample.data?.[0] || null,
    }).slice(0, 4000),
  )
}

// Try openapi / rest schema? skip.
// Distinct collections from sections
{
  const r = await sb.from('mezmur_sections_import').select('*').limit(500)
  if (r.error) console.log('\nsections * ERR', JSON.stringify(r.error))
  else {
    const keys = r.data?.[0] ? Object.keys(r.data[0]) : []
    console.log('\nsections keys', keys)
    console.log('sections rows fetched', r.data?.length)
    const map = new Map()
    for (const row of r.data || []) {
      const slug = String(row.collection_slug || '').trim()
      if (!slug) continue
      if (!map.has(slug)) map.set(slug, row)
    }
    console.log(
      'derived collections',
      [...map.entries()].map(([slug, row]) => ({
        slug,
        title: row.title,
        collection_title: row.collection_title,
        status: row.status,
      })),
    )
  }
}

{
  const r = await sb.from('mezmur_data_import').select('*').limit(2)
  console.log('\ndata sample keys', r.data?.[0] ? Object.keys(r.data[0]).sort() : r.error)
}

{
  const r = await sb.from('mezmur_section_links_import').select('*').limit(3)
  console.log('\nlinks sample', JSON.stringify({ err: r.error, row: r.data?.[0], keys: r.data?.[0] && Object.keys(r.data[0]) }))
}

{
  const r = await sb.from('mezmur_occasion_links_import').select('*').limit(3)
  console.log('\noccasion links', JSON.stringify({ err: r.error, row: r.data?.[0], keys: r.data?.[0] && Object.keys(r.data[0]) }))
}
