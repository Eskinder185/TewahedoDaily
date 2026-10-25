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
    if ((val.startsWith('"') && val.endsWith('"')) || (val.startsWith("'") && val.endsWith("'"))) {
      val = val.slice(1, -1)
    }
    if (name === 'VITE_SUPABASE_URL') url = val
    if (name === 'VITE_SUPABASE_PUBLISHABLE_KEY' || name === 'VITE_SUPABASE_ANON_KEY') {
      key = val
    }
  }
}

const sb = createClient(url, key)

// 1. Probe mezmur_public view
const publicProbe = await sb.from('mezmur_public').select('*').limit(5)
console.log('--- mezmur_public probe ---')
if (publicProbe.error) {
  console.log('mezmur_public error:', publicProbe.error)
} else {
  console.log('mezmur_public sample count:', publicProbe.data?.length)
  if (publicProbe.data && publicProbe.data[0]) {
    console.log('mezmur_public columns:', Object.keys(publicProbe.data[0]))
    console.log('mezmur_public sample row:', {
      slug: publicProbe.data[0].slug,
      title: publicProbe.data[0].title,
      status: publicProbe.data[0].status,
      lyrics_amharic: publicProbe.data[0].lyrics_amharic ? publicProbe.data[0].lyrics_amharic.slice(0, 50) : null,
      lyrics_geez: publicProbe.data[0].lyrics_geez,
      lyrics_english: publicProbe.data[0].lyrics_english,
      rights_status: publicProbe.data[0].rights_status,
    })
  }
}

// 2. Probe mezmur_data_import
const importProbe = await sb.from('mezmur_data_import').select('slug,title,status,rights_status,lyrics_amharic,lyrics_geez,lyrics_english,lyrics_oromo,lyrics_transliteration,youtube_url').limit(5)
console.log('--- mezmur_data_import probe ---')
if (importProbe.error) {
  console.log('mezmur_data_import error:', importProbe.error)
} else {
  console.log('mezmur_data_import sample count:', importProbe.data?.length)
  for (const row of (importProbe.data || [])) {
    console.log('import row:', {
      slug: row.slug,
      title: row.title,
      status: row.status,
      rights_status: row.rights_status,
      has_amharic_lyrics: Boolean(row.lyrics_amharic?.trim()),
      has_geez_lyrics: Boolean(row.lyrics_geez?.trim()),
      has_english_lyrics: Boolean(row.lyrics_english?.trim()),
      has_oromo_lyrics: Boolean(row.lyrics_oromo?.trim()),
      has_youtube: Boolean(row.youtube_url?.trim()),
    })
  }
}

// 3. Count published mezmurs with lyrics vs total in mezmur_data_import and mezmur_public
const counts = await sb.from('mezmur_data_import').select('status,rights_status')
console.log('--- status breakdown in mezmur_data_import ---')
if (counts.data) {
  const statusMap = {}
  const rightsMap = {}
  for (const r of counts.data) {
    statusMap[r.status] = (statusMap[r.status] || 0) + 1
    rightsMap[r.rights_status] = (rightsMap[r.rights_status] || 0) + 1
  }
  console.log('statuses:', statusMap)
  console.log('rights_statuses:', rightsMap)
}
