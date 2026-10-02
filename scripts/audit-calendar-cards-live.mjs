/**
 * Live Calendar Card data health probe (read-only, anon key).
 * Usage: node scripts/audit-calendar-cards-live.mjs
 */
import fs from 'node:fs'
import path from 'node:path'
import { fileURLToPath } from 'node:url'

const root = path.resolve(path.dirname(fileURLToPath(import.meta.url)), '..')
function loadEnv() {
  const envPath = path.join(root, '.env')
  if (!fs.existsSync(envPath)) return
  for (const line of fs.readFileSync(envPath, 'utf8').split(/\r?\n/)) {
    const m = line.match(/^([A-Z0-9_]+)=(.*)$/)
    if (!m) continue
    if (!process.env[m[1]]) process.env[m[1]] = m[2].replace(/^"|"$/g, '')
  }
}
loadEnv()

const url = (process.env.VITE_SUPABASE_URL || '').replace(/\/$/, '')
const key = process.env.VITE_SUPABASE_PUBLISHABLE_KEY || process.env.VITE_SUPABASE_ANON_KEY || ''
if (!url || !key) {
  console.error('Missing VITE_SUPABASE_URL / publishable key')
  process.exit(1)
}

async function fetchAll(table, select, extra = '') {
  const rows = []
  const page = 1000
  for (let from = 0; ; from += page) {
    const to = from + page - 1
    const endpoint = `${url}/rest/v1/${table}?select=${encodeURIComponent(select)}${extra}&order=updated_at.desc`
    const res = await fetch(endpoint, {
      headers: {
        apikey: key,
        Authorization: `Bearer ${key}`,
        Range: `${from}-${to}`,
        Prefer: 'count=exact',
      },
    })
    if (!res.ok) {
      const text = await res.text()
      throw new Error(`${table} ${res.status}: ${text.slice(0, 400)}`)
    }
    const batch = await res.json()
    rows.push(...batch)
    if (batch.length < page) break
  }
  return rows
}

const SELECT =
  'id,slug,title,title_amharic,source_type,source_id,source_slug,image_path,image_alt,image_position,status,featured,show_on_home,home_featured,home_sort_order,updated_at,card_type,ethiopian_month_number,ethiopian_day,is_monthly'

const cards = await fetchAll('calendar_cards', SELECT)
const isManual = (c) => (c.source_type || 'manual') === 'manual'
const hasImage = (c) => Boolean((c.image_path || '').trim())
const published = cards.filter((c) => c.status === 'published')
const draft = cards.filter((c) => c.status === 'draft')
const archived = cards.filter((c) => c.status === 'archived')

const byIdKey = new Map()
const bySlugKey = new Map()
for (const c of cards) {
  if (c.status === 'archived') continue
  if (c.source_id && !isManual(c)) {
    const k = `${c.source_type}::id::${c.source_id}`
    if (!byIdKey.has(k)) byIdKey.set(k, [])
    byIdKey.get(k).push(c)
  }
  if (c.source_slug && !isManual(c)) {
    const k = `${c.source_type}::slug::${c.source_slug}`
    if (!bySlugKey.has(k)) bySlugKey.set(k, [])
    bySlugKey.get(k).push(c)
  }
}

const dupId = [...byIdKey.entries()].filter(([, g]) => g.length > 1)
const dupSlug = [...bySlugKey.entries()].filter(([, g]) => g.length > 1)

const missingSource = cards.filter(
  (c) => !isManual(c) && !c.source_id && !c.source_slug,
)
const idNoSlug = cards.filter((c) => !isManual(c) && c.source_id && !c.source_slug)
const slugNoId = cards.filter((c) => !isManual(c) && c.source_slug && !c.source_id)

// Attempt source existence checks (best-effort)
const occIds = new Set(
  (
    await fetchAll('orthodox_observances', 'id,slug').catch(() => [])
  ).map((r) => r.id),
)
const monthlyIds = new Set(
  (await fetchAll('monthly_commemorations', 'id,slug').catch(() => [])).map((r) => r.id),
)
const fastIds = new Set((await fetchAll('liturgical_fasts', 'id,slug').catch(() => [])).map((r) => r.id))
const seasonIds = new Set(
  (await fetchAll('liturgical_seasons', 'id,slug').catch(() => [])).map((r) => r.id),
)

function sourceExists(c) {
  if (isManual(c)) return true
  if (!c.source_id) return false
  if (c.source_type === 'observance') return occIds.has(c.source_id)
  if (c.source_type === 'monthly_commemoration') return monthlyIds.has(c.source_id)
  if (c.source_type === 'fast') return fastIds.has(c.source_id)
  if (c.source_type === 'season') return seasonIds.has(c.source_id)
  return false
}

const validSource = cards.filter((c) => isManual(c) || sourceExists(c))
const missingLinked = cards.filter((c) => !isManual(c) && c.source_id && !sourceExists(c))
const orphans = cards.filter((c) => !isManual(c) && !sourceExists(c) && (c.source_id || c.source_slug))

function findByTitle(re) {
  return cards.filter((c) => re.test(`${c.title || ''} ${c.title_amharic || ''} ${c.source_slug || ''} ${c.slug || ''}`))
}

const bisrate = findByTitle(/bisrate|gabriel|ብስራተ/i)
const demera = findByTitle(/demera|ደመራ/i)

const report = {
  total: cards.length,
  withImage: cards.filter(hasImage).length,
  withoutImage: cards.filter((c) => !hasImage(c)).length,
  published: published.length,
  draft: draft.length,
  archived: archived.length,
  manual: cards.filter(isManual).length,
  withImagePublished: published.filter(hasImage).length,
  withoutImagePublished: published.filter((c) => !hasImage(c)).length,
  validSource: validSource.length,
  missingSourceLink: missingSource.length,
  idNoSlug: idNoSlug.length,
  slugNoId: slugNoId.length,
  missingLinkedSourceRow: missingLinked.length,
  orphanish: orphans.length,
  duplicateSourceIdGroups: dupId.length,
  duplicateSourceSlugGroups: dupSlug.length,
  duplicatesById: dupId.map(([k, g]) => ({
    key: k,
    cards: g.map((c) => ({
      id: c.id,
      title: c.title,
      source_type: c.source_type,
      source_id: c.source_id,
      source_slug: c.source_slug,
      image_path: c.image_path,
      status: c.status,
      show_on_home: c.show_on_home,
      home_featured: c.home_featured,
      updated_at: c.updated_at,
    })),
  })),
  bisrate,
  demera,
}

const out = path.join(root, 'scripts', '.calendar-card-audit-live.json')
fs.writeFileSync(out, JSON.stringify(report, null, 2))
console.log(JSON.stringify({
  total: report.total,
  withImage: report.withImage,
  withoutImage: report.withoutImage,
  published: report.published,
  draft: report.draft,
  archived: report.archived,
  manual: report.manual,
  missingSourceLink: report.missingSourceLink,
  idNoSlug: report.idNoSlug,
  slugNoId: report.slugNoId,
  missingLinkedSourceRow: report.missingLinkedSourceRow,
  orphanish: report.ornish ?? report.ornish,
  orphanishCount: report.ornanish,
  duplicateSourceIdGroups: report.duplicateSourceIdGroups,
  duplicateSourceSlugGroups: report.duplicateSourceSlugGroups,
  bisrateCount: bisrate.length,
  demeraCount: demera.length,
}, null, 2))
console.log('Wrote', out)
