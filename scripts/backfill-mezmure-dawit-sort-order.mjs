/**
 * Backfill public.prayers.sort_order for Mezmure Dawit to match Psalm number from slug.
 * Only updates rows in collection_slug = 'mezmure-dawit' (or the mezmure-dawit collection_id).
 *
 * Usage:
 *   node --env-file-if-exists=.env scripts/backfill-mezmure-dawit-sort-order.mjs --dry-run
 *   node --env-file-if-exists=.env scripts/backfill-mezmure-dawit-sort-order.mjs --apply
 *
 * Requires a service role key in SUPABASE_SERVICE_ROLE_KEY (or falls back to publishable key
 * if RLS allows updates — usually it does not).
 */
import { createClient } from '@supabase/supabase-js'

const url = process.env.VITE_SUPABASE_URL || process.env.SUPABASE_URL
const key =
  process.env.SUPABASE_SERVICE_ROLE_KEY ||
  process.env.VITE_SUPABASE_PUBLISHABLE_KEY ||
  process.env.SUPABASE_ANON_KEY

const apply = process.argv.includes('--apply')

if (!url || !key) {
  console.error('Missing Supabase URL/key')
  process.exit(1)
}

const supabase = createClient(url, key)

function getPsalmNumber(slug) {
  const m = String(slug || '').toLowerCase().match(/psalm[-_]?0*(\d{1,3})$/)
  if (!m) return null
  const n = Number.parseInt(m[1], 10)
  return Number.isFinite(n) && n > 0 ? n : null
}

const { data, error } = await supabase
  .from('prayers')
  .select('id, slug, sort_order, collection_slug, status')
  .eq('collection_slug', 'mezmure-dawit')

if (error) {
  console.error(error)
  process.exit(1)
}

const updates = []
for (const row of data || []) {
  const n = getPsalmNumber(row.slug)
  if (n == null) {
    console.warn('skip (no number):', row.slug)
    continue
  }
  if (row.sort_order === n) continue
  updates.push({ id: row.id, slug: row.slug, from: row.sort_order, to: n })
}

console.log(`Would update ${updates.length} rows (of ${(data || []).length})`)
updates.slice(0, 20).forEach((u) => console.log(`  ${u.slug}: ${u.from} → ${u.to}`))
if (updates.length > 20) console.log(`  … +${updates.length - 20} more`)

if (!apply) {
  console.log('Dry run only. Pass --apply to write.')
  process.exit(0)
}

let ok = 0
let fail = 0
for (const u of updates) {
  const { error: upErr } = await supabase.from('prayers').update({ sort_order: u.to }).eq('id', u.id)
  if (upErr) {
    console.error('fail', u.slug, upErr.message)
    fail += 1
  } else {
    ok += 1
  }
}
console.log(`Updated ${ok}; failed ${fail}`)
