// READ-ONLY probe of the live schema used by bulk classification persistence.
// Uses the public publishable key; performs SELECTs only.
import { supabase } from '../src/lib/supabase/client.ts'

if (!supabase) { console.error('Supabase not configured'); process.exit(1) }
const db = supabase

async function probe(table: string, columns: string) {
  const { data, error } = await db.from(table as never).select(columns).limit(1)
  console.log(`${table} [${columns}] ->`, error ? `ERROR ${error.code}: ${error.message}` : `ok (${(data || []).length} sample row)`)
}

await probe('categories', 'id,slug,name,type')
await probe('categories', 'status')
await probe('mezmur_occasions', 'id,slug,name,status')
await probe('mezmur_category_links_import', 'mezmur_slug,category_slug,source_category,confidence')
await probe('mezmur_category_links_import', 'import_id,imported_at')
await probe('mezmur_occasion_links_import', 'mezmur_slug,occasion_slug')
await probe('mezmur_occasion_links_import', 'import_id,imported_at')
await probe('mezmur_data_import', 'import_id,slug,status,deleted_at')

const cats = await db.from('categories' as never).select('slug').limit(1000)
console.log('category slugs:', cats.error ? cats.error.message : (cats.data as { slug: string }[]).map((r) => r.slug).sort().join(', '))
const occs = await db.from('mezmur_occasions' as never).select('slug').limit(1000)
console.log('occasion slugs:', occs.error ? occs.error.message : (occs.data as { slug: string }[]).map((r) => r.slug).sort().join(', '))
const rpc = await (db.rpc as unknown as (n: string, a: object) => Promise<{ error: { code?: string; message: string } | null }>)('bulk_assign_mezmur_classifications', { p_classifications: [], p_overwrite: false })
console.log('rpc bulk_assign_mezmur_classifications ->', rpc.error ? `ERROR ${rpc.error.code}: ${rpc.error.message}` : 'exists')
