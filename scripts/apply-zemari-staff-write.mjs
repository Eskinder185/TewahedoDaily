/**
 * Apply FIX_ZEMARI_STAFF_WRITE.sql using service role via Supabase SQL HTTP
 * (PostgREST cannot run DDL; uses the database REST "pg-meta" path when available,
 * otherwise reports that manual SQL Editor apply is required).
 *
 * Also probes grants/policies with the service role.
 */
import { createClient } from '@supabase/supabase-js'
import { readFileSync, existsSync } from 'node:fs'

function loadEnv(path) {
  const out = {}
  if (!existsSync(path)) return out
  for (const line of readFileSync(path, 'utf8').split(/\r?\n/)) {
    if (line.startsWith('#') || !line.includes('=')) continue
    const eq = line.indexOf('=')
    const name = line.slice(0, eq).trim()
    let val = line.slice(eq + 1).trim()
    if (
      (val.startsWith('"') && val.endsWith('"')) ||
      (val.startsWith("'") && val.endsWith("'"))
    ) {
      val = val.slice(1, -1)
    }
    out[name] = val
  }
  return out
}

const env = { ...loadEnv('.env.local'), ...loadEnv('.env.import') }
const url = env.SUPABASE_URL || env.VITE_SUPABASE_URL
const service = env.SUPABASE_SERVICE_ROLE_KEY || env.SUPABASE_SECRET_KEY
const anon = env.VITE_SUPABASE_PUBLISHABLE_KEY || env.VITE_SUPABASE_ANON_KEY

if (!url || !service) {
  console.log(JSON.stringify({ ok: false, reason: 'NO_SERVICE_ROLE' }))
  process.exit(1)
}

const admin = createClient(url, service, {
  auth: { persistSession: false, autoRefreshToken: false },
})

// Service-role baseline: can we update mezmur_data_import?
const sample = await admin
  .from('mezmur_data_import')
  .select('mezmur_id, slug, zemari_id, title')
  .not('slug', 'is', null)
  .limit(1)
  .maybeSingle()

console.log(
  'service_sample',
  sample.error
    ? { ok: false, code: sample.error.code, message: sample.error.message }
    : { ok: true, slug: sample.data?.slug, zemari_id: sample.data?.zemari_id },
)

const zemaris = await admin.from('zemaris').select('id, slug, name').limit(5)
console.log(
  'zemaris',
  zemaris.error
    ? { ok: false, message: zemaris.error.message }
    : (zemaris.data || []).map((z) => ({ id: z.id, slug: z.slug, name: z.name })),
)

// Privilege diagnostics via SQL if exec_sql / similar exists
for (const rpc of ['exec_sql', 'execute_sql', 'sql']) {
  const { error } = await admin.rpc(rpc, {
    query: "select has_table_privilege('authenticated', 'public.mezmur_data_import', 'update') as can_update",
  })
  if (!error) {
    console.log('rpc_available', rpc)
  } else if (!/Could not find|PGRST202|404/i.test(error.message || '')) {
    console.log('rpc_try', rpc, error.message)
  }
}

// Try pg-meta query endpoint (Studio-style) — may 404 on hosted projects
const sql = readFileSync('supabase/mezmur-import/FIX_ZEMARI_STAFF_WRITE.sql', 'utf8')
const endpoints = [
  `${url}/pg/query`,
  `${url.replace('https://', 'https://')}/rest/v1/rpc/exec_sql`,
]

let applied = false
for (const endpoint of endpoints) {
  try {
    const res = await fetch(endpoint, {
      method: 'POST',
      headers: {
        apikey: service,
        Authorization: `Bearer ${service}`,
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({ query: sql }),
    })
    const text = await res.text()
    console.log('endpoint', endpoint, res.status, text.slice(0, 200))
    if (res.ok) {
      applied = true
      break
    }
  } catch (e) {
    console.log('endpoint_err', endpoint, String(e.message || e))
  }
}

// Anon still must fail update (sanity)
if (anon) {
  const pub = createClient(url, anon, { auth: { persistSession: false } })
  const patch = await pub
    .from('mezmur_data_import')
    .update({ updated_at: new Date().toISOString() })
    .eq('slug', '__probe_nonexistent__')
    .select('slug')
  console.log(
    'anon_update_still_denied',
    patch.error
      ? { code: patch.error.code, message: patch.error.message }
      : { unexpected_ok: true },
  )
}

console.log(JSON.stringify({ applied, note: applied ? 'SQL applied' : 'Apply FIX_ZEMARI_STAFF_WRITE.sql in Supabase SQL Editor' }))
