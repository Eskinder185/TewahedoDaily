/**
 * Deep probe: Wudase section links + YeKidane/Meharene section payloads.
 * Run: node scripts/live-prayer-relation-probe.mjs
 */
import { readFileSync, existsSync } from 'node:fs'
import { resolve } from 'node:path'

function loadEnv(path) {
  if (!existsSync(path)) return
  for (const line of readFileSync(path, 'utf8').split(/\r?\n/)) {
    const m = line.match(/^([^#=]+)=(.*)$/)
    if (!m) continue
    const key = m[1].trim()
    let val = m[2].trim()
    if (
      (val.startsWith('"') && val.endsWith('"')) ||
      (val.startsWith("'") && val.endsWith("'"))
    ) {
      val = val.slice(1, -1)
    }
    if (!process.env[key]) process.env[key] = val
  }
}

loadEnv(resolve(process.cwd(), '.env'))
loadEnv(resolve(process.cwd(), '.env.local'))
const url = process.env.VITE_SUPABASE_URL
const key = process.env.VITE_SUPABASE_PUBLISHABLE_KEY

async function q(path) {
  const res = await fetch(`${url}/rest/v1/${path}`, {
    headers: { apikey: key, Authorization: `Bearer ${key}` },
  })
  const text = await res.text()
  if (!res.ok) throw new Error(`${path} → ${res.status} ${text.slice(0, 400)}`)
  return text ? JSON.parse(text) : []
}

const collections = await q('prayer_collections?select=id,slug')
const bySlug = Object.fromEntries(collections.map((c) => [c.slug, c.id]))

const wudaseId = bySlug['wudase-mariam']
const yekId = bySlug['yekidane-tselot']
const mehId = bySlug['meharene-ab']

const wudasePrayers = await q(
  `prayers?select=id,slug,section_id,section_slug,collection_slug,title,title_amharic&collection_id=eq.${wudaseId}`,
)
const wudaseSections = await q(
  `prayer_sections?select=id,slug,title,title_amharic,description&collection_id=eq.${wudaseId}&order=sort_order`,
)

console.log('WUDASE PRAYERS', wudasePrayers)
console.log('WUDASE SECTIONS', wudaseSections)

const yekSections = await q(
  `prayer_sections?select=*&collection_id=eq.${yekId}&order=sort_order`,
)
const mehSections = await q(
  `prayer_sections?select=*&collection_id=eq.${mehId}&order=sort_order`,
)
console.log(
  'YEKIDANE SECTIONS',
  yekSections.map((s) => ({
    slug: s.slug,
    title: s.title,
    keys: Object.keys(s),
    descriptionLen: (s.description || '').length,
  })),
)
console.log(
  'MEHARENE SECTIONS',
  mehSections.map((s) => ({
    slug: s.slug,
    title: s.title,
    keys: Object.keys(s),
    descriptionLen: (s.description || '').length,
  })),
)

// Check if prayers exist under wrong collection_slug text
const looseYek = await q(
  `prayers?select=id,slug,collection_id,collection_slug,status&or=(collection_slug.eq.yekidane-tselot,slug.ilike.*yekidane*)&limit=20`,
)
const looseMeh = await q(
  `prayers?select=id,slug,collection_id,collection_slug,status&or=(collection_slug.eq.meharene-ab,slug.ilike.*meharene*)&limit=20`,
)
console.log('LOOSE YEKIDANE PRAYERS', looseYek)
console.log('LOOSE MEHARENE PRAYERS', looseMeh)

// Sample one prayer columns
const sample = await q('prayers?select=*&limit=1')
console.log('PRAYER COLUMNS', sample[0] ? Object.keys(sample[0]) : [])
const secSample = await q('prayer_sections?select=*&limit=1')
console.log('SECTION COLUMNS', secSample[0] ? Object.keys(secSample[0]) : [])
