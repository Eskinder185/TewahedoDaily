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
const cols =
  'collection_id, collection_slug, title, title_amharic, description, description_amharic, image_path, image_alt, collection_type, sort_order, is_featured, status'

const ordered = await sb
  .from('mezmur_collections_import')
  .select(cols)
  .order('is_featured', { ascending: false })
  .order('sort_order', { ascending: true })
  .order('title', { ascending: true })

console.log('ORDERED error', ordered.error)
console.log('ORDERED rows', ordered.data?.length)

const plain = await sb.from('mezmur_collections_import').select(cols)
console.log('PLAIN error', plain.error)
console.log('PLAIN rows', plain.data?.length)
console.log(
  'status values',
  [...new Set((plain.data || []).map((r) => JSON.stringify(r.status)))],
)
console.log(
  'is_featured values',
  [...new Set((plain.data || []).map((r) => JSON.stringify(r.is_featured)))],
)
console.log(
  'sort_order values',
  [...new Set((plain.data || []).map((r) => JSON.stringify(r.sort_order)))].slice(0, 20),
)
console.log('titles', (plain.data || []).map((r) => r.title))

const sections = await sb
  .from('mezmur_sections_import')
  .select('section_slug, collection_slug, status', { count: 'exact' })
console.log('sections count', sections.count, 'err', sections.error?.message)
console.log(
  'section statuses',
  [...new Set((sections.data || []).map((r) => JSON.stringify(r.status)))],
)
