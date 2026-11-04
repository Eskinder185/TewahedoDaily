/**
 * Regression for "column "value" does not exist (42703)" when saving Mezmur categories/occasions.
 * Static SQL checks plus the error text shown to editors. No SQL is executed and no database is contacted.
 * Run: npx tsx scripts/test-mezmur-classification-rpc.mjs
 */
import assert from 'node:assert/strict'
import { readdirSync, readFileSync } from 'node:fs'
import { classificationRpcErrorMessage } from '../src/lib/cms/classificationErrors.ts'

// Every `select ... value ... from unnest(<expr>)` must alias the column: an unaliased unnest exposes a
// column named "unnest", so a reference to `value` raises 42703.
const UNNEST_VALUE = /trim\(value\)\)?[^;]*?from\s+unnest\(((?:[^()]|\((?:[^()]|\([^()]*\))*\))*)\)(\s+as\s+\w+\s*\(\s*value\s*\)|\s+as\s+value|\s+value\b)?/gi
function unaliasedValueUnnests(sql) {
  return [...sql.matchAll(UNNEST_VALUE)].filter((match) => !match[2]).map((match) => match[0].replace(/\s+/g, ' ').slice(0, 120))
}

const migrations = 'supabase/migrations/'
const defective = []
for (const file of readdirSync(migrations).filter((name) => name.endsWith('.sql'))) {
  const found = unaliasedValueUnnests(readFileSync(migrations + file, 'utf8'))
  if (found.length) defective.push([file, found.length])
}
// The only known defect is the checked-in UUID overload. Applied migrations are history and are not edited;
// the reviewed patch below supersedes it.
assert.deepEqual(defective, [['20261025020000_mezmur_bulk_classification.sql', 2]], 'only the known two statements are defective')

const patch = readFileSync('docs/ai/proposed-migrations/20261104_mezmur_classification_rpc_unnest_alias.sql', 'utf8')
const patchCode = patch.replace(/^\s*--.*$/gm, '')
assert.deepEqual(unaliasedValueUnnests(patchCode), [], 'the proposal has no unaliased unnest feeding `value`')
assert.equal((patchCode.match(/as t\(value\)/g) || []).length, 2, 'exactly the two statements are aliased')
assert.match(patchCode, /create or replace function public\.set_mezmur_classification_import\(\s*p_mezmur_import_id uuid,p_category_slugs text\[\] default '\{\}',p_occasion_slugs text\[\] default '\{\}'\s*\) returns void language plpgsql security definer set search_path=''/)
assert.match(patchCode, /revoke all on function public\.set_mezmur_classification_import\(uuid,text\[\],text\[\]\) from public,anon;/)
assert.match(patchCode, /grant execute on function public\.set_mezmur_classification_import\(uuid,text\[\],text\[\]\) to authenticated;/)
// Idempotent replace inside one transaction; no data statements against Mezmur content tables.
assert.match(patchCode, /delete from public\.mezmur_category_links_import where mezmur_import_id=p_mezmur_import_id;/)
assert.doesNotMatch(patchCode, /\bupdate\s+public\.|\btruncate\b|\bdrop\s+(table|column|function)\b|delete from public\.mezmur_data_import|insert into public\.mezmur_data_import/i)
assert.match(patchCode, /begin;[\s\S]*commit;/)
// The patch only differs from the checked-in function by the two aliases.
const body = (sql) => sql.slice(sql.indexOf('create or replace function public.set_mezmur_classification_import'), sql.indexOf('revoke all on function public.set_mezmur_classification_import(uuid')).replace(/\s+/g, ' ').trim()
const original = body(readFileSync(migrations + '20261025020000_mezmur_bulk_classification.sql', 'utf8'))
assert.equal(body(patchCode), original.replace("p_category_slugs,'{}'::text[]))", "p_category_slugs,'{}'::text[])) as t(value)")
  .replace("p_occasion_slugs,'{}'::text[]))", "p_occasion_slugs,'{}'::text[])) as t(value)"), 'only the two unnest() calls changed')

// What the editor tells the person when the RPC fails with 42703.
const shown = classificationRpcErrorMessage({ code: '42703', message: 'column "value" does not exist' })
assert.match(shown, /42703/)
assert.match(shown, /column "value" does not exist/)
assert.match(shown, /database defect, not a problem with your selections/)
assert.match(shown, /20261104_mezmur_classification_rpc_unnest_alias\.sql/)
assert.doesNotMatch(shown, /in use|not installed/)
// Other failures keep their dedicated messages.
assert.match(classificationRpcErrorMessage({ code: '23503', message: 'Invalid category slug(s): cross' }), /20261101130000_mezmur_canonical_taxonomy_slugs\.sql/)
assert.match(classificationRpcErrorMessage({ code: 'PGRST202', message: 'Could not find the function public.set_mezmur_classification_import in the schema cache' }), /20261025020000_mezmur_bulk_classification\.sql/)
assert.doesNotMatch(classificationRpcErrorMessage({ code: '42501', message: 'Authenticated staff access is required' }), /unnest_alias/)

console.log('Mezmur classification RPC regression passed: the single known defect, its alias-only patch, and the 42703 editor message. No SQL executed.')
