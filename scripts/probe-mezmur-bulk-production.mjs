import { createClient } from '@supabase/supabase-js'

const apiBase = process.env.VITE_TEWAHEDO_AI_API_URL?.replace(/\/$/, '')
const supabaseUrl = process.env.VITE_SUPABASE_URL?.replace(/\/$/, '')
const key = process.env.VITE_SUPABASE_PUBLISHABLE_KEY || process.env.VITE_SUPABASE_ANON_KEY
if (!apiBase || !supabaseUrl || !key) throw new Error('Configured API and Supabase public environment values are required.')

const expectedApi = [
  '/api/mezmur-bulk/dashboard', '/api/mezmur-bulk/jobs',
  '/api/mezmur-bulk/jobs/{job_id}', '/api/mezmur-bulk/jobs/{job_id}/suggestions',
  '/api/mezmur-bulk/jobs/{job_id}/resume', '/api/mezmur-bulk/jobs/{job_id}/cancel',
  '/api/mezmur-bulk/jobs/{job_id}/suggestions/apply', '/api/mezmur-bulk/publish',
  '/api/church-library/status', '/api/church-library/search',
]
const openapiResponse = await fetch(`${apiBase}/openapi.json`, { headers: { Accept: 'application/json' }, cache: 'no-store' })
const openapi = openapiResponse.ok ? await openapiResponse.json() : { paths: {} }
for (const path of expectedApi) console.log(`${openapi.paths?.[path] ? 'PASS' : 'FAIL'} API ${path}`)

const client = createClient(supabaseUrl, key, { auth: { persistSession: false, autoRefreshToken: false } })
for (const table of ['mezmur_enrichment_jobs', 'mezmur_enrichment_suggestions', 'mezmur_enrichment_events']) {
  const { error } = await client.from(table).select('*').limit(0)
  if (!error || error.code === '42501') console.log(`PASS DB ${table} exists and is private`)
  else console.log(`FAIL DB ${table}: ${error.code || 'unknown'} ${error.message}`)
}

const restOpenapi = await fetch(`${supabaseUrl}/rest/v1/`, {
  headers: { apikey: key, Authorization: `Bearer ${key}`, Accept: 'application/openapi+json' },
  cache: 'no-store',
}).then((response) => response.json())
for (const name of ['create_mezmur_enrichment_job', 'apply_mezmur_enrichment_suggestion', 'bulk_publish_mezmur_imports']) {
  console.log(restOpenapi.paths?.[`/rpc/${name}`]
    ? `PASS RPC ${name} is visible to anon (review grants; write RPCs should normally be hidden)`
    : `CHECK RPC ${name} is correctly not advertised to anon; verify existence with the read-only SQL script`)
}
