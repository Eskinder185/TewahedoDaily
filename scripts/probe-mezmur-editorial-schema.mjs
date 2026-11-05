// Read-only PostgREST compatibility probe. It sends GET requests only and prints no credentials or rows.
const url = process.env.VITE_SUPABASE_URL?.replace(/\/$/, '')
const key = process.env.VITE_SUPABASE_PUBLISHABLE_KEY || process.env.VITE_SUPABASE_ANON_KEY
if (!url || !key) { console.log('INCONCLUSIVE: Supabase public URL/key are not configured.'); process.exit(0) }
const headers = { apikey: key, Authorization: `Bearer ${key}`, Accept: 'application/json' }
for (const [table, columns] of [
  ['mezmur_data_import', 'import_id,mezmur_id,slug,category,primary_occasion'],
  ['admin_content_review', 'content_type,content_id,review_status,reviewed_by,reviewed_at,review_note'],
  ['mezmur_category_links_import', 'mezmur_import_id,category_slug'],
  ['mezmur_occasion_links_import', 'mezmur_import_id,occasion_slug'],
]) {
  try {
    const response = await fetch(`${url}/rest/v1/${table}?select=${columns}&limit=0`, { headers, cache: 'no-store' })
    const body = response.ok ? null : await response.json().catch(() => null)
    console.log(`${response.ok ? 'VISIBLE' : 'INCONCLUSIVE'} ${table}: HTTP ${response.status}${body?.code ? ` ${body.code}` : ''}`)
  } catch (error) { console.log(`INCONCLUSIVE ${table}: ${error.message}`) }
}
try {
  const response = await fetch(`${url}/rest/v1/`, { headers: { ...headers, Accept: 'application/openapi+json' }, cache: 'no-store' })
  const schema = response.ok ? await response.json() : null
  console.log(`Classification RPC advertised to anon: ${Boolean(schema?.paths?.['/rpc/set_mezmur_classification_import'])} (absence is expected for staff-only grants)`)
} catch (error) { console.log(`INCONCLUSIVE RPC advertisement: ${error.message}`) }
