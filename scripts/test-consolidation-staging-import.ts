import assert from 'node:assert/strict'
import { createHash } from 'node:crypto'
import { spawnSync } from 'node:child_process'
import { buildConsolidation } from './play/consolidate-content'

const host = process.env.PGHOST || '127.0.0.1'
const port = process.env.PGPORT || '55432'
const database = process.env.PGDATABASE || 'td_pr15_staging_1'
const user = process.env.PGUSER || 'postgres'
const psql = process.env.PSQL || 'C:\\Program Files\\PostgreSQL\\17\\bin\\psql.exe'

assert.ok(['127.0.0.1', 'localhost'].includes(host), 'This test refuses non-loopback databases')
assert.match(database, /^td_pr15_staging_[a-z0-9_]*$/, 'This test requires a disposable td_pr15_staging_* database')

const run = (sql: string) => {
  const result = spawnSync(psql, ['-X', '-qAt', '-v', 'ON_ERROR_STOP=1', '-h', host, '-p', port, '-U', user, '-d', database], {
    input: sql,
    encoding: 'utf8',
    maxBuffer: 64 * 1024 * 1024,
  })
  if (result.status !== 0) throw new Error(result.stderr || result.stdout || `psql exited ${result.status}`)
  return result.stdout.trim()
}

assert.equal(run('select count(*) from public.play_content_items;'), '0', 'staging must begin empty')
const { valid } = await buildConsolidation()
assert.equal(valid.length, 834)
const manifest = valid.map(item => ({ origin: item.origin, hash: item.hash, ...item.draft }))
const manifestJson = JSON.stringify(manifest)
assert.ok(!manifestJson.includes('$pr15$'))
const manifestHash = createHash('sha256').update(JSON.stringify(manifest)).digest('hex')
const batchId = run(`set role service_role;
select (public.import_play_content_drafts($pr15$${manifestJson}$pr15$::jsonb,'7906828','${manifestHash}')->>'id');`)
assert.match(batchId, /^[0-9a-f-]{36}$/)

const summary = JSON.parse(run(`select json_build_object(
  'rows',(select count(*) from public.play_content_items),
  'drafts',(select count(*) from public.play_content_items where status='draft'),
  'games',(select count(distinct game_type) from public.play_content_items),
  'inserted',inserted_count,'duplicates',duplicate_count,'conflicts',conflict_count,'failures',failed_count,'status',status)
from public.play_content_import_batches where id='${batchId}';`))
assert.deepEqual(summary, { rows: 834, drafts: 834, games: 11, inserted: 834, duplicates: 0, conflicts: 0, failures: 0, status: 'completed' })
console.log(`Isolated staging draft import: ${JSON.stringify({ batchId, ...summary })}`)
