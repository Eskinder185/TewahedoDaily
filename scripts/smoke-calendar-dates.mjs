import { createClient } from '@supabase/supabase-js'
import { readFileSync, existsSync } from 'node:fs'
import { pathToFileURL } from 'node:url'
import { resolve } from 'node:path'

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

// Smoke-test Ethiopian date mapping for today-ish Sep 29 2026
const { gregorianToEthiopian } = await import(
  pathToFileURL(resolve('src/lib/ethiopianDate.ts')).href
).catch(async () => {
  // ts may not load; use compiled logic inline via dynamic import of bridge after vite
  return { gregorianToEthiopian: null }
})

if (gregorianToEthiopian) {
  const eth = gregorianToEthiopian(new Date(2026, 8, 29))
  console.log('Sep 29 2026 →', eth)
}

const url = process.env.VITE_SUPABASE_URL
const key = process.env.VITE_SUPABASE_PUBLISHABLE_KEY
const supabase = createClient(url, key)
const { count } = await supabase
  .from('synaxarium_commemorations')
  .select('id', { count: 'exact', head: true })
  .eq('featured', true)
  .eq('status', 'published')
console.log('featured published count', count)
