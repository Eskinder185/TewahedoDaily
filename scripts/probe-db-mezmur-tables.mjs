import { createClient } from '@supabase/supabase-js'
import { readFileSync, existsSync } from 'node:fs'

let url = '', key = ''
for (const f of ['.env.local', '.env']) {
  if (!existsSync(f)) continue
  for (const line of readFileSync(f, 'utf8').split(/\r?\n/)) {
    const eq = line.indexOf('=')
    if (eq === -1 || line.trim().startsWith('#')) continue
    const name = line.slice(0, eq).trim()
    let val = line.slice(eq + 1).trim()
    if ((val.startsWith('"') && val.endsWith('"')) || (val.startsWith("'") && val.endsWith("'"))) val = val.slice(1, -1)
    if (name === 'VITE_SUPABASE_URL') url = val
    if (name === 'VITE_SUPABASE_PUBLISHABLE_KEY' || name === 'VITE_SUPABASE_ANON_KEY') key = val
  }
}

const sb = createClient(url, key)

// Check mezmur_public columns and sample
const p = await sb.from('mezmur_public').select('mezmur_id, slug, lyrics_amharic, updated_at').limit(2)
console.log('mezmur_public sample:', p.data)

// Check if mezmur_data_import is accessible
const mdi = await sb.from('mezmur_data_import').select('import_id, mezmur_id, slug, lyrics_amharic').limit(2)
console.log('mezmur_data_import accessible?', mdi.error ? mdi.error.message : mdi.data?.length)

// Check if mezmurs is accessible
const m = await sb.from('mezmurs').select('id, slug').limit(2)
console.log('mezmurs accessible?', m.error ? m.error.message : m.data?.length)
