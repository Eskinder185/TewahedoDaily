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
load('.env.import')

const url = process.env.VITE_SUPABASE_URL || process.env.SUPABASE_URL
const key =
  process.env.SUPABASE_SERVICE_ROLE_KEY ||
  process.env.VITE_SUPABASE_PUBLISHABLE_KEY
const usingService = Boolean(process.env.SUPABASE_SERVICE_ROLE_KEY?.trim())
console.log('usingServiceRole', usingService)

const supabase = createClient(url, key)

const featured = await supabase
  .from('synaxarium_commemorations')
  .select('id,slug,title,featured,status,image_path', { count: 'exact' })
  .eq('featured', true)
console.log('featured count', featured.count, featured.error?.message || featured.data)

const days = await supabase
  .from('synaxarium_days')
  .select('id,slug,ethiopian_month_number,ethiopian_day,status')
  .eq('ethiopian_month_number', 1)
  .in('ethiopian_day', [19, 21, 22, 23])
console.log('meskerem days', days.error?.message || days.data)

// Try insert with whatever key we have
const day19 = (days.data || []).find((d) => d.ethiopian_day === 19)
if (day19) {
  const payload = {
    day_id: day19.id,
    day_slug: day19.slug,
    slug: 'saint-gabriel-monthly-19',
    title: 'Saint Gabriel Monthly Commemoration',
    title_amharic: 'ቅዱስ ገብርኤል',
    commemoration_type: 'angel',
    summary: 'Monthly commemoration of Archangel Gabriel.',
    keywords: ['Gabriel', 'monthly', 'angel'],
    sort_order: 10,
    status: 'published',
    featured: true,
    updated_at: new Date().toISOString(),
  }
  const existing = await supabase
    .from('synaxarium_commemorations')
    .select('id')
    .eq('slug', payload.slug)
    .maybeSingle()
  if (existing.data?.id) {
    const upd = await supabase
      .from('synaxarium_commemorations')
      .update({ featured: true, status: 'published', title: payload.title })
      .eq('id', existing.data.id)
      .select('id,slug,featured')
    console.log('update gabriel', upd.error?.message || upd.data)
  } else {
    const ins = await supabase
      .from('synaxarium_commemorations')
      .insert(payload)
      .select('id,slug,featured')
    console.log('insert gabriel', ins.error?.message || ins.data)
  }
} else {
  console.log('no meskerem-19 day; creating')
  const created = await supabase
    .from('synaxarium_days')
    .insert({
      slug: 'meskerem-19',
      ethiopian_month: 'Meskerem',
      ethiopian_month_number: 1,
      ethiopian_day: 19,
      display_date_english: 'Meskerem 19',
      status: 'published',
      updated_at: new Date().toISOString(),
    })
    .select('id,slug')
  console.log('create day', created.error?.message || created.data)
}
