/**
 * Apply Calendar Cards seed (featured monthly commemorations) via service role.
 * Usage: node scripts/seed-calendar-cards.mjs
 * Requires .env.import with SUPABASE_URL + SUPABASE_SERVICE_ROLE_KEY
 */
import { createClient } from '@supabase/supabase-js'
import { readFileSync, existsSync } from 'node:fs'
import { resolve } from 'node:path'

function loadEnvFile(filePath) {
  if (!existsSync(filePath)) return
  for (const line of readFileSync(filePath, 'utf8').split(/\r?\n/)) {
    const trimmed = line.trim()
    if (!trimmed || trimmed.startsWith('#')) continue
    const eq = trimmed.indexOf('=')
    if (eq <= 0) continue
    const key = trimmed.slice(0, eq).trim()
    let value = trimmed.slice(eq + 1).trim()
    if (
      (value.startsWith('"') && value.endsWith('"')) ||
      (value.startsWith("'") && value.endsWith("'"))
    ) {
      value = value.slice(1, -1)
    }
    if (!process.env[key]) process.env[key] = value
  }
}

loadEnvFile(resolve(process.cwd(), '.env.import'))
loadEnvFile(resolve(process.cwd(), '.env.local'))
loadEnvFile(resolve(process.cwd(), '.env'))

const url = process.env.SUPABASE_URL || process.env.VITE_SUPABASE_URL
const key =
  process.env.SUPABASE_SERVICE_ROLE_KEY ||
  process.env.SUPABASE_SECRET_KEY ||
  ''

if (!url || !key) {
  console.error('Need SUPABASE_URL and SUPABASE_SERVICE_ROLE_KEY in .env.import')
  process.exit(1)
}

const supabase = createClient(url, key, { auth: { persistSession: false } })

const CARDS = [
  {
    slug: 'saint-gabriel-monthly-19',
    title: 'Saint Gabriel Monthly Commemoration',
    title_amharic: 'ቅዱስ ገብርኤል',
    type: 'angel',
    day: 19,
    sort: 10,
    summary: 'Monthly commemoration of Archangel Gabriel, messenger of divine glad tidings.',
    keywords: ['Saint Gabriel', 'Gabriel', 'Gebriel', 'monthly', 'angel'],
  },
  {
    slug: 'saint-mary-monthly-21',
    title: 'Saint Mary Monthly Commemoration',
    title_amharic: 'ቅድስት ማርያም',
    type: 'mary',
    day: 21,
    sort: 20,
    summary:
      'Monthly remembrance of Saint Mary, the Mother of God, on the 21st of each Ethiopian month.',
    keywords: ['Saint Mary', 'Mary', 'Mariyam', 'monthly', 'marian'],
  },
  {
    slug: 'saint-uriel-monthly-22',
    title: 'Kidus Uriel Monthly Commemoration',
    title_amharic: 'ቅዱስ ኡራኤል',
    type: 'angel',
    day: 22,
    sort: 30,
    summary: 'Monthly commemoration of Archangel Uriel on the 22nd of each Ethiopian month.',
    keywords: ['Uriel', 'Kidus Uriel', 'monthly', 'angel'],
  },
  {
    slug: 'saint-georgios-monthly-23',
    title: 'Saint Georgios Monthly Commemoration',
    title_amharic: 'ቅዱስ ጊዮርጊስ',
    type: 'martyr',
    day: 23,
    sort: 40,
    summary: 'Monthly commemoration of Saint Georgios (George) on the 23rd of each Ethiopian month.',
    keywords: ['Georgios', 'George', 'Giyorgis', 'monthly', 'martyr'],
  },
]

async function ensureDay(ethDay) {
  const month = 'Meskerem'
  const monthNumber = 1
  const { data: existing, error: findError } = await supabase
    .from('synaxarium_days')
    .select('id,slug')
    .eq('ethiopian_month_number', monthNumber)
    .eq('ethiopian_day', ethDay)
    .maybeSingle()
  if (findError) throw findError
  if (existing) return existing

  const slug = `meskerem-${ethDay}`
  const { data, error } = await supabase
    .from('synaxarium_days')
    .insert({
      slug,
      ethiopian_month: month,
      ethiopian_month_number: monthNumber,
      ethiopian_day: ethDay,
      display_date_english: `${month} ${ethDay}`,
      status: 'published',
      updated_at: new Date().toISOString(),
    })
    .select('id,slug')
    .single()
  if (error) throw error
  return data
}

async function ensureColumns() {
  // Best-effort: try selecting new columns; if missing, continue without them.
  const { error } = await supabase
    .from('synaxarium_commemorations')
    .select('id,featured,is_monthly,image_position')
    .limit(1)
  if (error) {
    console.warn('Column check:', error.message)
    console.warn('Apply supabase/migrations/20260930010000_calendar_cards_fields.sql if needed.')
  }
}

async function upsertCard(card) {
  const day = await ensureDay(card.day)
  const { data: existing } = await supabase
    .from('synaxarium_commemorations')
    .select('id')
    .eq('slug', card.slug)
    .maybeSingle()

  const payload = {
    day_id: day.id,
    day_slug: day.slug,
    slug: card.slug,
    title: card.title,
    title_amharic: card.title_amharic,
    commemoration_type: card.type,
    summary: card.summary,
    keywords: card.keywords,
    sort_order: card.sort,
    status: 'published',
    featured: true,
    is_monthly: true,
    image_position: 'top',
    updated_at: new Date().toISOString(),
  }

  if (existing?.id) {
    const { error } = await supabase
      .from('synaxarium_commemorations')
      .update(payload)
      .eq('id', existing.id)
    if (error) throw error
    console.log('updated', card.slug)
    return existing.id
  }

  const { data, error } = await supabase
    .from('synaxarium_commemorations')
    .insert(payload)
    .select('id')
    .single()
  if (error) throw error
  console.log('inserted', card.slug)
  return data.id
}

async function main() {
  await ensureColumns()
  for (const card of CARDS) {
    await upsertCard(card)
  }

  const { data, error } = await supabase
    .from('synaxarium_commemorations')
    .select('slug,title,featured,is_monthly,status,commemoration_type')
    .in(
      'slug',
      CARDS.map((c) => c.slug),
    )
  if (error) throw error
  console.log(JSON.stringify(data, null, 2))
}

main().catch((err) => {
  console.error(err)
  process.exit(1)
})
