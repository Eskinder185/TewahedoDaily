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

console.log('url', url)
console.log('keyPrefix', key.slice(0, 20))

const sb = createClient(url, key)

for (const t of [
  'mezmur_collections_import',
  'mezmur_sections_import',
  'mezmur_data_import',
  'mezmur_section_links_import',
]) {
  const head = await sb.from(t).select('*', { count: 'exact', head: true })
  const lim = await sb.from(t).select('*').limit(1)
  console.log(t, {
    headCount: head.count,
    headErr: head.error?.message || null,
    headCode: head.error?.code || null,
    limRows: lim.data?.length ?? 0,
    limErr: lim.error?.message || null,
  })
}

const rest = await fetch(`${url}/rest/v1/mezmur_collections_import?select=collection_slug,title,status&limit=5`, {
  headers: {
    apikey: key,
    Authorization: `Bearer ${key}`,
    Prefer: 'count=exact',
  },
})
console.log('REST status', rest.status)
console.log('REST content-range', rest.headers.get('content-range'))
console.log('REST body', (await rest.text()).slice(0, 500))
