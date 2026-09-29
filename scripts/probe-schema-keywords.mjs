import { createClient } from '@supabase/supabase-js'
import { readFileSync, existsSync } from 'node:fs'

function load(file) {
  if (!existsSync(file)) return
  for (const line of readFileSync(file, 'utf8').split(/\r?\n/)) {
    const t = line.trim()
    if (!t || t.startsWith('#')) continue
    const i = t.indexOf('=')
    if (i <= 0) continue
    const k = t.slice(0, i).trim()
    let v = t.slice(i + 1).trim()
    if ((v.startsWith('"') && v.endsWith('"')) || (v.startsWith("'") && v.endsWith("'"))) {
      v = v.slice(1, -1)
    }
    if (!process.env[k]) process.env[k] = v
  }
}

load('.env.local')
load('.env')
load('.env.import')

const url = process.env.VITE_SUPABASE_URL || process.env.SUPABASE_URL
const key =
  process.env.SUPABASE_SERVICE_ROLE_KEY?.trim() ||
  process.env.VITE_SUPABASE_PUBLISHABLE_KEY?.trim()
const supabase = createClient(url, key)

// Probe columns by selecting *
const { data: sample, error: sampleErr } = await supabase
  .from('synaxarium_commemorations')
  .select('*')
  .limit(3)
console.log('sample error', sampleErr?.message)
if (sample?.[0]) {
  const row = sample[0]
  console.log('keys', Object.keys(row).sort())
  console.log('keywords typeof', typeof row.keywords, Array.isArray(row.keywords), JSON.stringify(row.keywords)?.slice(0, 200))
  console.log('featured', row.featured)
  console.log('image_path', row.image_path)
  console.log('is_monthly' in row, 'image_position' in row)
}

const { data: daySample, error: dayErr } = await supabase
  .from('synaxarium_days')
  .select('*')
  .limit(1)
console.log('day error', dayErr?.message)
if (daySample?.[0]) console.log('day keys', Object.keys(daySample[0]).sort())

// Try information_schema via RPC if available
const { data: cols, error: colsErr } = await supabase.rpc('cms_version_authors').maybeSingle?.() 
console.log('cms_version_authors probe skipped if missing')

// Probe bad selects used by app
for (const sel of [
  'id,keywords,featured,image_path,image_alt,is_monthly,image_position',
  'id,keywords,featured,image_path,image_alt',
  'id,slug,title,day:synaxarium_days(id,slug)',
  'id,slug,title,day:synaxarium_days!synaxarium_commemorations_day_id_fkey(id,slug)',
]) {
  const r = await supabase.from('synaxarium_commemorations').select(sel).limit(1)
  console.log('SELECT', sel.slice(0, 80), '->', r.error?.message || 'ok', r.error?.code || '', r.error?.details || '', r.error?.hint || '')
}

const { data: withDay, error: withDayErr } = await supabase
  .from('synaxarium_commemorations')
  .select('id,title,day_id,day_slug,keywords,featured,image_path,image_alt,status,sort_order,commemoration_type,title_amharic,summary')
  .eq('status', 'published')
  .eq('featured', true)
  .limit(5)
console.log('featured query', withDayErr?.message || withDay)
