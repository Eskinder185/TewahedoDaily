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
    if (
      (v.startsWith('"') && v.endsWith('"')) ||
      (v.startsWith("'") && v.endsWith("'"))
    ) {
      v = v.slice(1, -1)
    }
    if (!process.env[k]) process.env[k] = v
  }
}

load('.env.local')
load('.env')

const url = process.env.VITE_SUPABASE_URL
const key = process.env.VITE_SUPABASE_PUBLISHABLE_KEY
const supabase = createClient(url, key)

const featured = await supabase
  .from('synaxarium_commemorations')
  .select('id,slug,title,featured,status,image_path,is_monthly,image_position')
  .eq('featured', true)
  .limit(20)
console.log('featured', featured.error?.message || featured.data)

const search = await supabase
  .from('synaxarium_commemorations')
  .select('id,slug,title,featured,status,commemoration_type')
  .or(
    'title.ilike.%Gabriel%,title.ilike.%Uriel%,title.ilike.%Georgios%,title.ilike.%Mary Monthly%,title.ilike.%Saint Mary%',
  )
  .limit(30)
console.log('search', search.error?.message || search.data)

const cols = await supabase
  .from('synaxarium_commemorations')
  .select('is_monthly,image_position,featured,image_path')
  .limit(1)
console.log('cols', cols.error?.message || cols.data)
