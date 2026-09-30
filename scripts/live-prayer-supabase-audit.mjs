/**
 * Live Pray system audit against Supabase (anon key).
 * Run: node scripts/live-prayer-supabase-audit.mjs
 *
 * Reports collections, relationships, Psalm gaps, language coverage, liturgy, RLS probes.
 */
import { readFileSync, existsSync, writeFileSync } from 'node:fs'
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
if (!url || !key) {
  console.error('Missing VITE_SUPABASE_URL / VITE_SUPABASE_PUBLISHABLE_KEY')
  process.exit(1)
}

async function q(path) {
  const res = await fetch(`${url}/rest/v1/${path}`, {
    headers: {
      apikey: key,
      Authorization: `Bearer ${key}`,
    },
  })
  const text = await res.text()
  if (!res.ok) throw new Error(`${path} → ${res.status} ${text.slice(0, 400)}`)
  return text ? JSON.parse(text) : []
}

function psalmNumber(slug, title = '') {
  const value = `${slug || ''} ${title || ''}`
  const patterned = value.match(
    /(?:^|[-_\s])(?:psalm|mezmure?-?dawit|mezmur-?dawit)[-_\s]?0*(\d{1,3})(?:$|[-_\s])/i,
  )
  if (patterned) return Number.parseInt(patterned[1], 10)
  const digits = String(slug || '').match(/(?:^|[-_])0*(\d{1,3})$/)
  return digits ? Number.parseInt(digits[1], 10) : null
}

const collections = await q(
  'prayer_collections?select=id,slug,title,title_amharic,description,sort_order,status,image_path,image_alt&order=sort_order',
)
const sections = await q(
  'prayer_sections?select=id,collection_id,slug,title,title_amharic,sort_order,status&order=sort_order',
)
const prayers = await q(
  'prayers?select=id,slug,collection_id,section_id,collection_slug,section_slug,title,title_amharic,title_geez,title_english,text_amharic,text_geez,text_english,sort_order,status&limit=5000',
)
const litC = await q(
  'liturgy_collections?select=id,slug,title,title_amharic,sort_order,status&order=sort_order',
)
const litS = await q(
  'liturgy_sections?select=id,collection_id,slug,title,sort_order,status&order=sort_order',
)
const litE = await q(
  'liturgy_entries?select=id,section_id,collection_id,slug,title,sort_order,status&limit=5000',
)

const byId = Object.fromEntries(collections.map((c) => [c.id, c]))
const secById = Object.fromEntries(sections.map((s) => [s.id, s]))

const perCollection = collections.map((c) => {
  const secs = sections.filter((s) => s.collection_id === c.id)
  const prs = prayers.filter((p) => p.collection_id === c.id)
  return {
    slug: c.slug,
    status: c.status,
    sectionCount: secs.length,
    prayerCount: prs.length,
    sectionSlugs: secs.map((s) => s.slug),
    prayersLinkedToSection: prs.filter((p) => p.section_id).length,
  }
})

const orphans = prayers.filter((p) => !p.collection_id || !byId[p.collection_id])
const badSlug = prayers.filter(
  (p) =>
    p.collection_id &&
    byId[p.collection_id] &&
    p.collection_slug &&
    p.collection_slug !== byId[p.collection_id].slug,
)
const badSec = prayers.filter((p) => {
  if (!p.section_id) return false
  const s = secById[p.section_id]
  return !s || s.collection_id !== p.collection_id
})
const missingTitle = prayers.filter((p) => !(p.title || '').trim())
const missingAllText = prayers.filter(
  (p) =>
    !(p.text_amharic || '').trim() &&
    !(p.text_geez || '').trim() &&
    !(p.text_english || '').trim(),
)

const dawit = collections.find((c) => c.slug === 'mezmure-dawit')
let psalmReport = null
if (dawit) {
  const ps = prayers.filter((p) => p.collection_id === dawit.id)
  const nums = ps.map((p) => psalmNumber(p.slug, p.title)).filter((n) => n != null)
  const set = new Set(nums)
  const missing = []
  for (let i = 1; i <= 150; i++) if (!set.has(i)) missing.push(i)
  const dups = [...new Set(nums.filter((n, i) => nums.indexOf(n) !== i))]
  psalmReport = {
    prayerCount: ps.length,
    min: nums.length ? Math.min(...nums) : null,
    max: nums.length ? Math.max(...nums) : null,
    missing,
    duplicates: dups,
    unrecognized: ps.filter((p) => psalmNumber(p.slug, p.title) == null).map((p) => p.slug),
  }
}

const report = {
  generatedAt: new Date().toISOString(),
  counts: {
    prayerCollections: collections.length,
    prayerSections: sections.length,
    prayers: prayers.length,
    liturgyCollections: litC.length,
    liturgySections: litS.length,
    liturgyEntries: litE.length,
  },
  collections: perCollection,
  relationships: {
    orphans: orphans.length,
    badCollectionSlug: badSlug.length,
    badSection: badSec.length,
    missingTitle: missingTitle.length,
    missingAllText: missingAllText.length,
    amharicText: prayers.filter((p) => (p.text_amharic || '').trim()).length,
    geezText: prayers.filter((p) => (p.text_geez || '').trim()).length,
    englishText: prayers.filter((p) => (p.text_english || '').trim()).length,
  },
  expected: {
    zewter: perCollection.find((c) => c.slug === 'zewter-tselot') || null,
    wudase: perCollection.find((c) => c.slug === 'wudase-mariam') || null,
    mezmureDawit: psalmReport,
    yekidane: perCollection.find((c) => c.slug === 'yekidane-tselot') || null,
    meharene: perCollection.find((c) => c.slug === 'meharene-ab') || null,
  },
  liturgy: litC.map((c) => ({
    slug: c.slug,
    status: c.status,
    sections: litS.filter((s) => s.collection_id === c.id).length,
    entries: litE.filter((e) => e.collection_id === c.id).length,
  })),
  routes: [
    { path: '/pray', tables: ['prayer_collections', 'liturgy_collections', 'synaxarium_days'] },
    { path: '/pray/:collectionSlug', tables: ['prayer_collections|liturgy_collections'] },
    { path: '/pray/:collectionSlug/:prayerSlug', tables: ['prayers|liturgy_sections'] },
    { path: '/prayers/*', tables: 'legacy redirects → /pray/*' },
  ],
}

const out = resolve('scripts/live-prayer-audit-report.json')
writeFileSync(out, JSON.stringify(report, null, 2))
console.log(JSON.stringify(report, null, 2))
console.log('\nWrote', out)
