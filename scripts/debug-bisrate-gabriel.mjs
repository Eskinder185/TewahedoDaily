/**
 * Debug Bisrate Gabriel / Annunciation source ↔ calendar_cards linkage.
 * Run: node --env-file-if-exists=.env.local scripts/debug-bisrate-gabriel.mjs
 */
const url = process.env.VITE_SUPABASE_URL
const key = process.env.VITE_SUPABASE_PUBLISHABLE_KEY
if (!url || !key) {
  console.error('Missing VITE_SUPABASE_URL / VITE_SUPABASE_PUBLISHABLE_KEY')
  process.exit(1)
}

async function q(path) {
  const res = await fetch(`${url}/rest/v1/${path}`, {
    headers: {
      apikey: key,
      Authorization: `Bearer ${key}`,
      Prefer: 'count=exact',
    },
  })
  const text = await res.text()
  let data
  try {
    data = JSON.parse(text)
  } catch {
    data = text
  }
  return { status: res.status, range: res.headers.get('content-range'), data }
}

function print(label, value) {
  console.log(`\n=== ${label} ===`)
  console.log(typeof value === 'string' ? value : JSON.stringify(value, null, 2))
}

const monthly = await q(
  'monthly_commemorations?select=*&or=(title.ilike.*gabriel*,title.ilike.*bisrate*,title.ilike.*annunciation*,slug.ilike.*gabriel*,slug.ilike.*bisrate*,slug.ilike.*annunciation*)',
)
print('monthly_commemorations matches', monthly)

const sources = Array.isArray(monthly.data) ? monthly.data : []
for (const s of sources) {
  const byId = s.id
    ? await q(
        `calendar_cards?select=id,slug,title,title_amharic,source_type,source_id,source_slug,image_path,image_alt,image_position,status,featured,show_on_home,home_featured,home_sort_order,updated_at,ethiopian_day,is_monthly&source_type=eq.monthly_commemoration&source_id=eq.${s.id}`,
      )
    : { data: [] }
  const bySlug = s.slug
    ? await q(
        `calendar_cards?select=id,slug,title,title_amharic,source_type,source_id,source_slug,image_path,image_alt,image_position,status,featured,show_on_home,home_featured,home_sort_order,updated_at,ethiopian_day,is_monthly&source_type=eq.monthly_commemoration&source_slug=eq.${encodeURIComponent(s.slug)}`,
      )
    : { data: [] }
  print(`cards by source_id for ${s.slug}`, byId)
  print(`cards by source_slug for ${s.slug}`, bySlug)
}

const cardsText = await q(
  'calendar_cards?select=id,slug,title,title_amharic,source_type,source_id,source_slug,image_path,image_alt,image_position,status,featured,show_on_home,home_featured,home_sort_order,updated_at,ethiopian_day,is_monthly&or=(title.ilike.*gabriel*,title.ilike.*bisrate*,title.ilike.*annunciation*,source_slug.ilike.*gabriel*,source_slug.ilike.*bisrate*,slug.ilike.*gabriel*,slug.ilike.*bisrate*)',
)
print('calendar_cards text matches', cardsText)

const allCards = await q(
  'calendar_cards?select=id,slug,title,source_type,source_id,source_slug,image_path,status,show_on_home,updated_at&order=updated_at.desc&limit=50',
)
print('recent calendar_cards (50)', { range: allCards.range, count: Array.isArray(allCards.data) ? allCards.data.length : 0, data: allCards.data })

const cardTotal = await q('calendar_cards?select=id&limit=1')
print('calendar_cards total range', cardTotal.range)
