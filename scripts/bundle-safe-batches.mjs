import { readFileSync, writeFileSync, readdirSync } from 'node:fs'
import { join } from 'node:path'

const BATCH_DIR = 'supabase/mezmur-import/SAFE_MEZMUR_UPDATES/SAFE_UPDATE_BATCHES'
const OUT_FILE = 'supabase/mezmur-import/SAFE_MEZMUR_UPDATES/APPLY_ALL_SAFE_BATCHES.sql'

const files = readdirSync(BATCH_DIR).filter(f => f.endsWith('.sql')).sort()
console.log(`Concatenating ${files.length} batches into master SQL file...`)

const header = [
  '--',
  '-- ============================================================================',
  '-- TEWAHEDODAILY MASTER SAFE MEZMUR UPDATE SCRIPT',
  '-- Total Batches: 32 (1,086 unique approved records)',
  '-- Target Table: public.mezmur_data_import',
  '-- Protection: WHERE import_id = <UUID>::uuid + IS NOT DISTINCT FROM concurrency guards',
  '-- Atomicity: Each batch executes in an atomic DO $$ block with GET DIAGNOSTICS check',
  '-- Generated at: ' + new Date().toISOString(),
  '-- ============================================================================',
  '',
]

const parts = [header.join('\n')]
for (const file of files) {
  const content = readFileSync(join(BATCH_DIR, file), 'utf8')
  parts.push(content)
}

writeFileSync(OUT_FILE, parts.join('\n\n'), 'utf8')
console.log(`Master SQL file created at ${OUT_FILE} (${parts.length - 1} batches).`)
