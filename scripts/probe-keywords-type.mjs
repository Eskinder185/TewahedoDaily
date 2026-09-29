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
const sb = createClient(url, key)

const { data, error } = await sb
  .from('synaxarium_commemorations')
  .select('id,title,keywords')
  .not('keywords', 'is', null)
  .limit(20)
console.log('non-null keywords error', error?.message)
console.log('count', data?.length)
for (const r of data || []) {
  console.log({
    title: (r.title || '').slice(0, 50),
    typeof: typeof r.keywords,
    isArray: Array.isArray(r.keywords),
    value: JSON.stringify(r.keywords)?.slice(0, 160),
  })
}

const res = await fetch(`${url}/rest/v1/`, {
  headers: { apikey: key, Authorization: `Bearer ${key}` },
})
const openapi = await res.json()
const props = openapi?.definitions?.synaxarium_commemorations?.properties
console.log('openapi keywords', JSON.stringify(props?.keywords, null, 2))
console.log(
  'has is_monthly',
  Boolean(props?.is_monthly),
  'has image_position',
  Boolean(props?.image_position),
  'has featured',
  Boolean(props?.featured),
)

// Also probe empty string keywords and array-looking values via raw filter
const { data: allKw } = await sb
  .from('synaxarium_commemorations')
  .select('keywords')
  .limit(200)
const types = new Map()
for (const row of allKw || []) {
  const k = row.keywords
  const label = k === null ? 'null' : Array.isArray(k) ? `array:${typeof k[0]}` : typeof k
  types.set(label, (types.get(label) || 0) + 1)
}
console.log('keyword type histogram (200)', Object.fromEntries(types))
