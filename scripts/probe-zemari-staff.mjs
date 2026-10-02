/**
 * Probe Zemari CMS auth + table access with the publishable key (anon JWT).
 * Browser staff session cannot be recovered from Node; this documents the
 * pre-login / anonymous baseline and whether schema objects exist.
 */
import { createClient } from '@supabase/supabase-js'
import { readFileSync, existsSync } from 'node:fs'

let url = ''
let key = ''
for (const f of ['.env.local', '.env']) {
  if (!existsSync(f)) continue
  for (const line of readFileSync(f, 'utf8').split(/\r?\n/)) {
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
    if (name === 'VITE_SUPABASE_URL') url = val
    if (
      name === 'VITE_SUPABASE_PUBLISHABLE_KEY' ||
      name === 'VITE_SUPABASE_ANON_KEY' ||
      name === 'SUPABASE_ANON_KEY'
    ) {
      key = val
    }
  }
}

if (!url || !key) {
  console.log(JSON.stringify({ ok: false, reason: 'NO_ENV' }))
  process.exit(0)
}

const sb = createClient(url, key)

const session = await sb.auth.getSession()
const { data: isStaff, error: staffErr } = await sb.rpc('is_staff')

const probes = {}
for (const table of [
  'zemaris',
  'mezmur_data_import',
  'mezmur_occasion_links_import',
]) {
  const head = await sb.from(table).select('*', { count: 'exact', head: true })
  probes[table] = head.error
    ? { ok: false, code: head.error.code, message: head.error.message, status: head.error.status }
    : { ok: true, count: head.count }
}

// Anonymous UPDATE should fail (baseline "failing request before")
const patch = await sb
  .from('mezmur_data_import')
  .update({ updated_at: new Date().toISOString() })
  .eq('slug', '__probe_nonexistent__')
  .select('slug')
  .limit(1)

console.log(
  JSON.stringify(
    {
      host: new URL(url).host,
      sessionUserId: session.data.session?.user?.id ?? null,
      sessionError: session.error?.message ?? null,
      is_staff: isStaff,
      is_staff_error: staffErr ? { code: staffErr.code, message: staffErr.message } : null,
      tables: probes,
      anon_update_mezmur_data_import: patch.error
        ? {
            ok: false,
            code: patch.error.code,
            message: patch.error.message,
            status: patch.error.status,
          }
        : { ok: true, rows: (patch.data || []).length },
    },
    null,
    2,
  ),
)
