// Run: npx --yes tsx scripts/test-mezmur-canonical-taxonomy-migration.ts
// Guards the proposed additive taxonomy migration and the classification error text. Reads files only.
import assert from 'node:assert/strict'
import { readFileSync } from 'node:fs'
import { CATEGORY_ENTRIES, OCCASION_ENTRIES } from '../src/lib/mezmur/taxonomyAliases'
import { classificationRpcErrorMessage, rejectedClassificationSlugs } from '../src/lib/cms/classificationErrors'

let passed = 0
const check = (name: string, fn: () => void) => { fn(); passed++; console.log(`✓ ${name}`) }

const sql = readFileSync(new URL('../supabase/migrations/20261101130000_mezmur_canonical_taxonomy_slugs.sql', import.meta.url), 'utf8')
const code = sql.replace(/--.*$/gm, '')
const insertBlock = (table: string) => {
  const start = code.indexOf(`insert into public.${table}`)
  assert.ok(start >= 0, `${table} insert exists`)
  return code.slice(start, code.indexOf('on conflict (slug) do nothing;', start))
}
const insertedSlugs = (table: string, slugColumn: number) =>
  [...insertBlock(table).matchAll(/^\s*\((.+)\),?\s*$/gm)]
    .map((match) => [...match[1].matchAll(/'((?:[^']|'')*)'/g)].map((part) => part[1]))
    .filter((cells) => cells.length > slugColumn)
    .map((cells) => cells[slugColumn])

check('every canonical category slug is inserted, and nothing else', () => {
  assert.deepEqual([...insertedSlugs('categories', 2)].sort(), CATEGORY_ENTRIES.map((entry) => entry.slug).sort())
})

check('every canonical occasion slug is inserted, and nothing else', () => {
  assert.deepEqual([...insertedSlugs('mezmur_occasions', 0)].sort(), OCCASION_ENTRIES.map((entry) => entry.slug).sort())
})

check('inserted slugs satisfy the table slug constraint', () => {
  for (const slug of [...CATEGORY_ENTRIES, ...OCCASION_ENTRIES].map((entry) => entry.slug)) {
    assert.match(slug, /^[a-z0-9]+(-[a-z0-9]+)*$/)
  }
})

check('migration is additive and idempotent: no update/delete/drop/truncate/alter, conflicts do nothing', () => {
  for (const verb of ['update', 'delete', 'drop', 'truncate', 'alter', 'rename', 'grant', 'revoke']) {
    assert.doesNotMatch(code, new RegExp(`\\b${verb}\\b`, 'i'), `no ${verb}`)
  }
  assert.equal((code.match(/on conflict \(slug\) do nothing;/g) || []).length, 2)
  assert.equal((code.match(/where not exists \(/g) || []).length >= 2, true, 'each insert is guarded by NOT EXISTS')
  assert.match(code, /^\s*begin;/m)
  assert.match(code, /^\s*commit;/m)
})

check('categories insert only writes columns present in every environment', () => {
  assert.match(code, /insert into public\.categories \(name, name_amharic, slug, type\)/)
  assert.doesNotMatch(insertBlock('categories'), /status|sort_order|is_featured|is_archived|image_path/)
})

check('migration fails (rolls back) if a canonical slug is still missing afterwards', () => {
  assert.match(code, /Canonical category slug\(s\) still missing/)
  assert.match(code, /Canonical occasion slug\(s\) still missing/)
})

check('rejected slugs are parsed from the RPC message', () => {
  assert.deepEqual(rejectedClassificationSlugs('Invalid category slug(s): cross, prayer'), { category: ['cross', 'prayer'], occasion: [] })
  assert.deepEqual(rejectedClassificationSlugs('(23503): Invalid occasion slug(s): baptism'), { category: [], occasion: ['baptism'] })
  assert.deepEqual(rejectedClassificationSlugs('something else'), { category: [], occasion: [] })
})

check('the real RPC error is shown, not the generic "item is in use" text', () => {
  const message = classificationRpcErrorMessage({ code: '23503', message: 'Invalid category slug(s): cross, prayer', details: null, hint: null })
  assert.match(message, /23503/)
  assert.match(message, /Invalid category slug\(s\): cross, prayer/)
  assert.match(message, /20261101130000_mezmur_canonical_taxonomy_slugs\.sql/)
  assert.doesNotMatch(message, /in use/)
})

check('other classification failures keep their own message; missing RPC keeps its install hint', () => {
  assert.match(classificationRpcErrorMessage({ code: '42501', message: 'Authenticated staff access is required to edit Mezmur classifications' }), /staff access is required/)
  assert.match(classificationRpcErrorMessage({ code: 'P0002', message: 'Active Mezmur import_id abc was not found' }), /was not found/)
  assert.match(classificationRpcErrorMessage({ code: 'PGRST202', message: 'Could not find the function public.set_mezmur_classification_import' }), /20261025020000_mezmur_bulk_classification\.sql/)
})

console.log(`Canonical taxonomy migration checks passed (${passed} checks)`)
