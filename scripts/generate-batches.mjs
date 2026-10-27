import { readFileSync, writeFileSync, mkdirSync } from 'node:fs'
import { join } from 'node:path'
import { cleanMezmurLyrics } from '../src/lib/mezmur/mezmurChorusCleaner.ts'

const backupPath = 'backup/production_lyrics_fresh_backup_20261026.json'
const liveRecords = JSON.parse(readFileSync(backupPath, 'utf8'))

console.log(`Processing ${liveRecords.length} records into safe batches...`)

function escapeSql(str) {
  if (str === null || str === undefined) return 'NULL'
  return `'${String(str).replace(/'/g, "''")}'`
}

function processField(val) {
  if (val === null || val === undefined) {
    return { cleanedText: null, isChanged: false, removedChorusCount: 0, preservedVerseCount: 0 }
  }
  return cleanMezmurLyrics(val)
}

const forwardItems = []
const rollbackItems = []

for (const m of liveRecords) {
  const amResult = processField(m.lyrics_amharic)
  const trResult = processField(m.lyrics_transliteration)
  const enResult = processField(m.lyrics_english)
  const gzResult = processField(m.lyrics_geez)
  const orResult = processField(m.lyrics_oromo)

  const isChanged = amResult.isChanged || trResult.isChanged || enResult.isChanged || gzResult.isChanged || orResult.isChanged

  if (isChanged) {
    forwardItems.push({
      slug: m.slug,
      title: m.title,
      sql:
        `  -- Hymn: ${m.title.replace(/'/g, "''")} (${m.slug})\n` +
        `  UPDATE public.mezmur_data_import\n` +
        `  SET lyrics_amharic = ${escapeSql(amResult.cleanedText)},\n` +
        `      lyrics_transliteration = ${escapeSql(trResult.cleanedText)},\n` +
        `      lyrics_english = ${escapeSql(enResult.cleanedText)},\n` +
        `      lyrics_geez = ${escapeSql(gzResult.cleanedText)},\n` +
        `      lyrics_oromo = ${escapeSql(orResult.cleanedText)},\n` +
        `      updated_at = NOW()::text\n` +
        `  WHERE slug = ${escapeSql(m.slug)}\n` +
        `    AND lyrics_amharic IS NOT DISTINCT FROM ${escapeSql(m.lyrics_amharic)}\n` +
        `    AND lyrics_transliteration IS NOT DISTINCT FROM ${escapeSql(m.lyrics_transliteration)}\n` +
        `    AND lyrics_english IS NOT DISTINCT FROM ${escapeSql(m.lyrics_english)}\n` +
        `    AND lyrics_geez IS NOT DISTINCT FROM ${escapeSql(m.lyrics_geez)}\n` +
        `    AND lyrics_oromo IS NOT DISTINCT FROM ${escapeSql(m.lyrics_oromo)};\n` +
        `  GET DIAGNOSTICS v_updated = ROW_COUNT;\n` +
        `  IF v_updated <> 1 THEN\n` +
        `    RAISE EXCEPTION 'Concurrency check failed for hymn: % (expected 1 row, got %)', ${escapeSql(m.slug)}, v_updated;\n` +
        `  END IF;\n` +
        `  v_total := v_total + v_updated;`
    })

    rollbackItems.push({
      slug: m.slug,
      title: m.title,
      sql:
        `  -- Hymn rollback: ${m.title.replace(/'/g, "''")} (${m.slug})\n` +
        `  UPDATE public.mezmur_data_import\n` +
        `  SET lyrics_amharic = ${escapeSql(m.lyrics_amharic)},\n` +
        `      lyrics_transliteration = ${escapeSql(m.lyrics_transliteration)},\n` +
        `      lyrics_english = ${escapeSql(m.lyrics_english)},\n` +
        `      lyrics_geez = ${escapeSql(m.lyrics_geez)},\n` +
        `      lyrics_oromo = ${escapeSql(m.lyrics_oromo)},\n` +
        `      updated_at = NOW()::text\n` +
        `  WHERE slug = ${escapeSql(m.slug)}\n` +
        `    AND lyrics_amharic IS NOT DISTINCT FROM ${escapeSql(amResult.cleanedText)}\n` +
        `    AND lyrics_transliteration IS NOT DISTINCT FROM ${escapeSql(trResult.cleanedText)}\n` +
        `    AND lyrics_english IS NOT DISTINCT FROM ${escapeSql(enResult.cleanedText)}\n` +
        `    AND lyrics_geez IS NOT DISTINCT FROM ${escapeSql(gzResult.cleanedText)}\n` +
        `    AND lyrics_oromo IS NOT DISTINCT FROM ${escapeSql(orResult.cleanedText)};\n` +
        `  GET DIAGNOSTICS v_updated = ROW_COUNT;\n` +
        `  IF v_updated <> 1 THEN\n` +
        `    RAISE EXCEPTION 'Rollback concurrency check failed for hymn: % (expected 1 row, got %)', ${escapeSql(m.slug)}, v_updated;\n` +
        `  END IF;\n` +
        `  v_total := v_total + v_updated;`
    })
  }
}

console.log(`Total hymns to update: ${forwardItems.length}`)

const BATCH_SIZE = 100
const totalBatches = Math.ceil(forwardItems.length / BATCH_SIZE)
const batchDir = 'supabase/mezmur-cleanup/batches'
mkdirSync(batchDir, { recursive: true })

for (let b = 0; b < totalBatches; b++) {
  const batchNum = String(b + 1).padStart(2, '0')
  const totalNum = String(totalBatches).padStart(2, '0')
  const startIdx = b * BATCH_SIZE
  const endIdx = Math.min((b + 1) * BATCH_SIZE, forwardItems.length)
  const batchForward = forwardItems.slice(startIdx, endIdx)
  const batchRollback = rollbackItems.slice(startIdx, endIdx)
  const batchCount = batchForward.length

  // Forward SQL
  const forwardSql =
`-- =========================================================================
-- BATCH ${batchNum} of ${totalNum}: ${batchCount} Hymns (${startIdx + 1} to ${endIdx})
-- Target: public.mezmur_data_import
-- Strict 5-Column Concurrency Check + Atomic Transaction
-- =========================================================================

DO $batch_${batchNum}$
DECLARE
  v_updated integer := 0;
  v_total integer := 0;
BEGIN

${batchForward.map(i => i.sql).join('\n\n')}

  IF v_total <> ${batchCount} THEN
    RAISE EXCEPTION 'Batch ${batchNum} count mismatch: expected ${batchCount}, got %', v_total;
  END IF;

  RAISE NOTICE 'SUCCESS: Batch ${batchNum} completed: % hymns updated.', v_total;
END $batch_${batchNum}$;
`
  writeFileSync(join(batchDir, `BATCH_${batchNum}_OF_${totalNum}.sql`), forwardSql, 'utf8')

  // Dry-Run SQL
  const dryRunSql = forwardSql.replace(
    `RAISE NOTICE 'SUCCESS: Batch ${batchNum} completed: % hymns updated.', v_total;`,
    `RAISE EXCEPTION 'DRY RUN BATCH ${batchNum} SUCCESS: Verified % hymns. Rolling back cleanly.', v_total;`
  )
  writeFileSync(join(batchDir, `DRY_RUN_BATCH_${batchNum}_OF_${totalNum}.sql`), dryRunSql, 'utf8')

  // Rollback SQL
  const rollbackSql =
`-- =========================================================================
-- ROLLBACK BATCH ${batchNum} of ${totalNum}: ${batchCount} Hymns (${startIdx + 1} to ${endIdx})
-- Target: public.mezmur_data_import
-- =========================================================================

DO $rollback_batch_${batchNum}$
DECLARE
  v_updated integer := 0;
  v_total integer := 0;
BEGIN

${batchRollback.map(i => i.sql).join('\n\n')}

  IF v_total <> ${batchCount} THEN
    RAISE EXCEPTION 'Rollback batch ${batchNum} count mismatch: expected ${batchCount}, got %', v_total;
  END IF;

  RAISE NOTICE 'SUCCESS: Rollback batch ${batchNum} completed: % hymns restored.', v_total;
END $rollback_batch_${batchNum}$;
`
  writeFileSync(join(batchDir, `ROLLBACK_BATCH_${batchNum}_OF_${totalNum}.sql`), rollbackSql, 'utf8')
}

console.log(`✓ Created ${totalBatches} batch files in ${batchDir}`)
