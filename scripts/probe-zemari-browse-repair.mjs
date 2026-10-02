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

const view = await sb
  .from('zemaris_with_counts')
  .select(
    'id,slug,name,name_amharic,bio,image_path,is_featured,status,updated_at,published_mezmur_count,mezmur_count',
  )
  .eq('status', 'published')

const plain = await sb
  .from('zemaris')
  .select('id,slug,name,name_amharic,bio,image_path,is_featured,status,updated_at')
  .eq('status', 'published')

const linked = await sb
  .from('mezmur_data_import')
  .select('zemari_id,status')
  .not('zemari_id', 'is', null)

const counts = new Map()
for (const row of linked.data || []) {
  if (!row.zemari_id) continue
  const st = String(row.status || '').toLowerCase()
  if (st && ['draft', 'archived', 'hidden', 'rejected', 'deleted'].includes(st)) continue
  counts.set(row.zemari_id, (counts.get(row.zemari_id) || 0) + 1)
}

const cards = (plain.data || []).map((z) => ({
  slug: z.slug,
  name: z.name,
  viewCount: (view.data || []).find((v) => v.id === z.id)?.published_mezmur_count ?? null,
  repairedCount: counts.get(z.id) || 0,
  wouldShowOnBrowse: (counts.get(z.id) || 0) > 0,
}))

console.log(
  JSON.stringify(
    {
      viewError: view.error,
      plainError: plain.error,
      linkedError: linked.error,
      viewRows: view.data,
      plainRows: plain.data,
      cards,
    },
    null,
    2,
  ),
)
