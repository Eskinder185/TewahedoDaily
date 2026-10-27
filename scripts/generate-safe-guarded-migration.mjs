import { readFileSync, writeFileSync } from 'node:fs'
import { cleanMezmurLyrics } from '../src/lib/mezmur/mezmurChorusCleaner.ts'

const backupPath = 'backup/production_lyrics_fresh_backup_20261026.json'
const liveRecords = JSON.parse(readFileSync(backupPath, 'utf8'))

console.log(`Processing ${liveRecords.length} records for safe guarded migration...`)

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

let totalProcessed = 0
let totalAmharicCleaned = 0
let totalTranslitCleaned = 0
let totalEnglishCleaned = 0
let totalGeezCleaned = 0
let totalOromoCleaned = 0
let totalChorusesRemoved = 0
let totalVersesPreserved = 0

const forwardStatements = []
const rollbackStatements = []
const cleanedRecords = []

for (const m of liveRecords) {
  totalProcessed++

  const amResult = processField(m.lyrics_amharic)
  if (amResult.isChanged) {
    totalAmharicCleaned++
    totalChorusesRemoved += amResult.removedChorusCount
    totalVersesPreserved += amResult.preservedVerseCount
  }

  const trResult = processField(m.lyrics_transliteration)
  if (trResult.isChanged) {
    totalTranslitCleaned++
  }

  const enResult = processField(m.lyrics_english)
  if (enResult.isChanged) {
    totalEnglishCleaned++
  }

  const gzResult = processField(m.lyrics_geez)
  if (gzResult.isChanged) {
    totalGeezCleaned++
  }

  const orResult = processField(m.lyrics_oromo)
  if (orResult.isChanged) {
    totalOromoCleaned++
  }

  const isChanged = amResult.isChanged || trResult.isChanged || enResult.isChanged || gzResult.isChanged || orResult.isChanged

  cleanedRecords.push({
    mezmur_id: m.mezmur_id,
    slug: m.slug,
    title: m.title,
    title_amharic: m.title_amharic,
    status: m.status,
    is_changed: isChanged,
    removed_chorus_count: amResult.removedChorusCount,
    preserved_verse_count: amResult.preservedVerseCount,
    lyrics_amharic: amResult.cleanedText,
    lyrics_transliteration: trResult.cleanedText,
    lyrics_english: enResult.cleanedText,
    lyrics_geez: gzResult.cleanedText,
    lyrics_oromo: orResult.cleanedText,
  })

  if (isChanged) {
    // Forward Guarded Update:
    // Strictly checks ALL FIVE lyric columns: Amharic, Transliteration, English, Ge'ez, Oromo.
    // Preserves NULLs without converting them to empty strings.
    // Aborts immediately via GET DIAGNOSTICS if not exactly 1 row updated.
    forwardStatements.push(
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
    )

    // Rollback Guarded Update:
    rollbackStatements.push(
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
    )
  }
}

// Write CLEANED_MEZMUR_LYRICS.json
writeFileSync('supabase/mezmur-cleanup/CLEANED_MEZMUR_LYRICS.json', JSON.stringify(cleanedRecords, null, 2), 'utf8')

// Write Forward SQL (Transactional DO block with strict concurrency abort)
const forwardHeader =
`-- =========================================================================
-- TEWAHEDODAILY: SAFE GUARDED REMOVAL OF REPEATED CHORUSES FROM MEZMURS
--
-- Target Table: public.mezmur_data_import
-- Guards:
--   1. Matches on unique slug
--   2. Verifies ALL FIVE lyric columns:
--      lyrics_amharic IS NOT DISTINCT FROM <BASELINE>
--      AND lyrics_transliteration IS NOT DISTINCT FROM <BASELINE>
--      AND lyrics_english IS NOT DISTINCT FROM <BASELINE>
--      AND lyrics_geez IS NOT DISTINCT FROM <BASELINE>
--      AND lyrics_oromo IS NOT DISTINCT FROM <BASELINE>
--   3. Checks ROW_COUNT after every update (aborts if not exactly 1)
--   4. Validates final total count is exactly ${forwardStatements.length}
--
-- Preflight Statistics:
-- Total hymns in database: ${totalProcessed}
-- Total hymns cleaned: ${forwardStatements.length}
-- Total hymns unchanged: ${totalProcessed - forwardStatements.length}
-- Total duplicate choruses removed: ${totalChorusesRemoved}
-- Total verses preserved: ${totalVersesPreserved}
-- Generated: ${new Date().toISOString()}
-- =========================================================================

DO $cleanup$
DECLARE
  v_updated integer := 0;
  v_total integer := 0;
BEGIN

`

const forwardFooter =
`
  IF v_total <> ${forwardStatements.length} THEN
    RAISE EXCEPTION 'Expected ${forwardStatements.length} hymns updated, but got %', v_total;
  END IF;

  RAISE NOTICE 'SUCCESS: Correctly updated % hymns with repeated choruses removed. All concurrency checks passed.', v_total;
END $cleanup$;
`

writeFileSync('supabase/mezmur-cleanup/SAFE_GUARDED_REMOVE_REPEATED_CHORUSES.sql', forwardHeader + forwardStatements.join('\n\n') + forwardFooter, 'utf8')
writeFileSync('supabase/mezmur-cleanup/REMOVE_REPEATED_CHORUSES.sql', forwardHeader + forwardStatements.join('\n\n') + forwardFooter, 'utf8')

// Write Rollback SQL
const rollbackHeader =
`-- =========================================================================
-- TEWAHEDODAILY: SAFE GUARDED ROLLBACK FOR MEZMUR CHORUS CLEANUP
--
-- Target Table: public.mezmur_data_import
-- Restores original baseline lyrics from production backup
-- Generated: ${new Date().toISOString()}
-- =========================================================================

DO $rollback$
DECLARE
  v_updated integer := 0;
  v_total integer := 0;
BEGIN

`

const rollbackFooter =
`
  IF v_total <> ${rollbackStatements.length} THEN
    RAISE EXCEPTION 'Expected ${rollbackStatements.length} hymns rolled back, but got %', v_total;
  END IF;

  RAISE NOTICE 'SUCCESS: Correctly rolled back % hymns to baseline lyrics.', v_total;
END $rollback$;
`

writeFileSync('supabase/mezmur-cleanup/SAFE_GUARDED_ROLLBACK_REPEATED_CHORUSES.sql', rollbackHeader + rollbackStatements.join('\n\n') + rollbackFooter, 'utf8')
writeFileSync('supabase/mezmur-cleanup/ROLLBACK_REPEATED_CHORUSES.sql', rollbackHeader + rollbackStatements.join('\n\n') + rollbackFooter, 'utf8')

console.log('\n--- GENERATION SUMMARY ---')
console.log(`Total hymns evaluated: ${totalProcessed}`)
console.log(`Hymns requiring cleanup: ${forwardStatements.length}`)
console.log(`Hymns already clean / unchanged: ${totalProcessed - forwardStatements.length}`)
console.log(`Total duplicate chorus blocks to remove: ${totalChorusesRemoved}`)
console.log(`Total verse blocks preserved: ${totalVersesPreserved}`)
console.log(`Amharic lyrics cleaned: ${totalAmharicCleaned}`)
console.log(`Transliteration lyrics cleaned: ${totalTranslitCleaned}`)
console.log(`English lyrics cleaned: ${totalEnglishCleaned}`)
console.log(`Ge'ez lyrics cleaned: ${totalGeezCleaned}`)
console.log(`Oromo lyrics cleaned: ${totalOromoCleaned}`)
console.log('✓ Generated SAFE_GUARDED_REMOVE_REPEATED_CHORUSES.sql with 5-column concurrency checks and atomic transaction abort.')
