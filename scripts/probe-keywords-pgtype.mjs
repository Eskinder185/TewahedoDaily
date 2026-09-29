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

const url = process.env.VITE_SUPABASE_URL
const key = process.env.VITE_SUPABASE_PUBLISHABLE_KEY
const sb = createClient(url, key)

// Detect column type via filter behavior
const asArray = await sb
  .from('synaxarium_commemorations')
  .select('id')
  .contains('keywords', ['test'])
  .limit(1)
console.log('contains array filter', asArray.error?.message || 'ok', asArray.error?.code)

const asText = await sb
  .from('synaxarium_commemorations')
  .select('id')
  .ilike('keywords', '%gabriel%')
  .limit(1)
console.log('ilike text filter', asText.error?.message || 'ok', asText.error?.code)

const asCs = await sb
  .from('synaxarium_commemorations')
  .select('id')
  .filter('keywords', 'cs', '{gabriel}')
  .limit(1)
console.log('cs filter', asCs.error?.message || 'ok', asCs.error?.code)

// Fetch more rows looking for any non-null
let page = 0
let found = []
while (page < 20 && found.length < 5) {
  const { data } = await sb
    .from('synaxarium_commemorations')
    .select('id,keywords')
    .range(page * 500, page * 500 + 499)
  if (!data?.length) break
  for (const row of data) {
    if (row.keywords != null) found.push(row)
  }
  page++
}
console.log('scanned pages', page, 'non-null found', found.length)
for (const r of found.slice(0, 5)) {
  console.log(typeof r.keywords, Array.isArray(r.keywords), JSON.stringify(r.keywords)?.slice(0, 200))
}
