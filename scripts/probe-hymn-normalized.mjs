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
  'hymn_collections',
  'hymn_sections',
  'mezmur',
  'mezmur_section_links',
  'mezmur_occasion_links',
  'categories',
  'singers',
  'mezmur_occasions',
  'hymn_collections_with_counts',
  'hymn_sections_with_counts',
  'hymn_major_browse_groups',
  'hymn_browse_group_children',
]
for (const t of tables) {
  const { count, error } = await sb.from(t).select('*', { count: 'exact', head: true })
  if (error) console.log(t, 'ERR', JSON.stringify(error))
  else console.log(t, 'count=' + count)
}

const { data: cols, error: cErr } = await sb
  .from('hymn_collections')
  .select('id,slug,title,status,sort_order,is_featured')
  .eq('status', 'published')
  .order('sort_order')
  .limit(20)
if (cErr) console.log('collections query ERR', JSON.stringify(cErr))
else console.log('collections', JSON.stringify(cols, null, 2))

if (cols?.length) {
  const holidays = cols.find((c) => c.slug === 'holidays-feasts')
  if (holidays) {
    const { data: secs, error: sErr } = await sb
      .from('hymn_sections')
      .select('id,slug,title,status,sort_order')
      .eq('collection_id', holidays.id)
      .eq('status', 'published')
      .order('sort_order')
    if (sErr) console.log('sections ERR', JSON.stringify(sErr))
    else {
      console.log('holidays section count', secs?.length)
      console.log(
        'holidays sections sample',
        JSON.stringify((secs || []).slice(0, 5), null, 2),
      )
      const meskel = (secs || []).find(
        (s) => s.slug.includes('meskel') || /meskel/i.test(s.title),
      )
      if (meskel) {
        const { count, error: lErr } = await sb
          .from('mezmur_section_links')
          .select('mezmur_id', { count: 'exact', head: true })
          .eq('section_id', meskel.id)
        console.log('meskel', meskel.slug, lErr ? JSON.stringify(lErr) : 'links=' + count)
      }
    }
  }
}
