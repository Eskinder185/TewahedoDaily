import { writeFile, mkdir } from 'node:fs/promises'
import { resolve } from 'node:path'
import { createClient } from '@supabase/supabase-js'
import { buildPlan } from './lib/mezmur-import-plan.mjs'
const apply = process.argv.includes('--apply')
const publish = process.argv.includes('--publish-existing')
if (process.argv.includes('--dry-run') && apply)
  throw Error('Choose dry-run or apply, not both.')
const plan = await buildPlan(new URL('../src/data/chants/', import.meta.url))
const results = []
let client
if (apply) {
  const url = process.env.SUPABASE_URL
  const key =
    process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.SUPABASE_SECRET_KEY
  if (!url || !key)
    throw Error(
      'Server-only SUPABASE_URL and SUPABASE_SERVICE_ROLE_KEY (or SUPABASE_SECRET_KEY) required.',
    )
  client = createClient(url, key, {
    auth: { persistSession: false, autoRefreshToken: false },
  })
}
for (const item of plan.items) {
  if (!client) {
    results.push({ key: item.legacy_key, slug: item.slug, status: 'planned' })
    continue
  }
  const { data, error } = await client.rpc('import_legacy_mezmur', {
    payload: item,
    publish_existing: publish,
  })
  results.push({
    key: item.legacy_key,
    ...(error
      ? { status: 'failed', code: error.code, message: error.message }
      : data),
  })
}
const summary = {
  mode: apply ? 'apply' : 'dry-run',
  publication: publish ? 'published' : 'draft',
  sourceRows: plan.sourceRows,
  uniqueSourceRows: plan.uniqueSourceRows,
  eligible: plan.items.length,
  statuses: Object.fromEntries(
    [...new Set(results.map((r) => r.status))].map((status) => [
      status,
      results.filter((r) => r.status === status).length,
    ]),
  ),
  issues: Object.fromEntries(
    [...new Set(plan.issues.map((i) => i.code))].map((code) => [
      code,
      plan.issues.filter((i) => i.code === code).length,
    ]),
  ),
}
const directory = resolve('migration-reports')
await mkdir(directory, { recursive: true })
const path = resolve(
  directory,
  `mezmur-${new Date().toISOString().replace(/[:.]/g, '-')}.json`,
)
await writeFile(
  path,
  JSON.stringify(
    {
      created_at: new Date().toISOString(),
      summary,
      results,
      issues: plan.issues,
    },
    null,
    2,
  ) + '\n',
)
console.log(JSON.stringify(summary, null, 2))
console.log('Review log:', path)
if (results.some((row) => row.status === 'failed')) process.exitCode = 1
