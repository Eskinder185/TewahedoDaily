import { createClient } from '@supabase/supabase-js'
import { readFileSync, writeFileSync, mkdirSync, existsSync } from 'node:fs'
import { resolve, join } from 'node:path'
import { cleanMezmurLyrics } from '../src/lib/mezmur/mezmurChorusCleaner.ts'

const BACKUP_DIR = resolve('backup')
const OUTPUT_DIR = resolve('supabase/mezmur-cleanup')
mkdirSync(BACKUP_DIR, { recursive: true })
mkdirSync(OUTPUT_DIR, { recursive: true })

// 1. Read Supabase config
let url = '', key = ''
for (const f of ['.env.local', '.env']) {
  if (!existsSync(f)) continue
  for (const line of readFileSync(f, 'utf8').split(/\r?\n/)) {
    const eq = line.indexOf('=')
    if (eq === -1 || line.trim().startsWith('#')) continue
    const name = line.slice(0, eq).trim()
    let val = line.slice(eq + 1).trim()
    if ((val.startsWith('"') && val.endsWith('"')) || (val.startsWith("'") && val.endsWith("'"))) val = val.slice(1, -1)
    if (name === 'VITE_SUPABASE_URL') url = val
    if (name === 'VITE_SUPABASE_PUBLISHABLE_KEY' || name === 'VITE_SUPABASE_ANON_KEY') key = val
  }
}

if (!url || !key) {
  console.error('Supabase credentials missing')
  process.exit(1)
}

const sb = createClient(url, key)

console.log('Fetching all Mezmurs from mezmur_public...')
let allMezmurs = []
let page = 0
const pageSize = 500

while (true) {
  const { data, error } = await sb
    .from('mezmur_public')
    .select('mezmur_id, slug, title, title_amharic, status, lyrics_amharic, lyrics_transliteration, lyrics_english, lyrics_geez, lyrics_oromo')
    .range(page * pageSize, (page + 1) * pageSize - 1)
  
  if (error) {
    console.error('Error fetching mezmur_public:', error)
    process.exit(1)
  }
  if (!data || data.length === 0) break
  allMezmurs.push(...data)
  if (data.length < pageSize) break
  page++
}

console.log(`Fetched ${allMezmurs.length} Mezmurs.`)

// 2. Save Recoverable Backup
const backupPath = join(BACKUP_DIR, 'mezmur_lyrics_pre_chorus_cleanup_backup.json')
writeFileSync(backupPath, JSON.stringify(allMezmurs, null, 2), 'utf8')
console.log(`✓ Saved pre-cleanup backup to ${backupPath} (${(readFileSync(backupPath).length / 1024 / 1024).toFixed(2)} MB)`)

// 3. Process every hymn deterministically
let totalProcessed = 0
let totalAmharicCleaned = 0
let totalTranslitCleaned = 0
let totalEnglishCleaned = 0
let totalChorusesRemoved = 0
let totalVersesPreserved = 0

const cleanedRecords = []
const updateSqlStatements = []
const rollbackSqlStatements = []

function escapeSql(str) {
  if (str === null || str === undefined) return 'NULL'
  return `'${String(str).replace(/'/g, "''")}'`
}

for (const m of allMezmurs) {
  totalProcessed++

  // Clean Amharic
  const amResult = cleanMezmurLyrics(m.lyrics_amharic)
  if (amResult.isChanged) {
    totalAmharicCleaned++
    totalChorusesRemoved += amResult.removedChorusCount
    totalVersesPreserved += amResult.preservedVerseCount
  }

  // Clean Transliteration
  const trResult = cleanMezmurLyrics(m.lyrics_transliteration)
  if (trResult.isChanged) {
    totalTranslitCleaned++
  }

  // Clean English
  const enResult = cleanMezmurLyrics(m.lyrics_english)
  if (enResult.isChanged) {
    totalEnglishCleaned++
  }

  // Clean Ge'ez
  const gezResult = cleanMezmurLyrics(m.lyrics_geez)

  // Clean Oromo
  const omResult = cleanMezmurLyrics(m.lyrics_oromo)

  const isChanged = amResult.isChanged || trResult.isChanged || enResult.isChanged || gezResult.isChanged || omResult.isChanged

  const cleanedRecord = {
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
    lyrics_geez: gezResult.cleanedText,
    lyrics_oromo: omResult.cleanedText,
  }

  cleanedRecords.push(cleanedRecord)

  if (isChanged) {
    // Generate Forward Update SQL (Safe and atomic per mezmur_id)
    updateSqlStatements.push(
      `UPDATE public.mezmurs\n` +
      `SET lyrics_amharic = ${escapeSql(amResult.cleanedText)},\n` +
      `    lyrics_transliteration = ${escapeSql(trResult.cleanedText)},\n` +
      `    lyrics_english = ${escapeSql(enResult.cleanedText)},\n` +
      `    lyrics_geez = ${escapeSql(gezResult.cleanedText)},\n` +
      `    lyrics_oromo = ${escapeSql(omResult.cleanedText)},\n` +
      `    updated_at = NOW()\n` +
      `WHERE id = ${escapeSql(m.mezmur_id)};`
    )

    // Generate Rollback SQL
    rollbackSqlStatements.push(
      `UPDATE public.mezmurs\n` +
      `SET lyrics_amharic = ${escapeSql(m.lyrics_amharic)},\n` +
      `    lyrics_transliteration = ${escapeSql(m.lyrics_transliteration)},\n` +
      `    lyrics_english = ${escapeSql(m.lyrics_english)},\n` +
      `    lyrics_geez = ${escapeSql(m.lyrics_geez)},\n` +
      `    lyrics_oromo = ${escapeSql(m.lyrics_oromo)},\n` +
      `    updated_at = NOW()\n` +
      `WHERE id = ${escapeSql(m.mezmur_id)};`
    )
  }
}

// 4. Write deliverables
const cleanedJsonPath = join(OUTPUT_DIR, 'CLEANED_MEZMUR_LYRICS.json')
writeFileSync(cleanedJsonPath, JSON.stringify(cleanedRecords, null, 2), 'utf8')

const forwardSqlPath = join(OUTPUT_DIR, 'REMOVE_REPEATED_CHORUSES.sql')
const forwardSql =
  `-- =========================================================================\n` +
  `-- TEWAHEDODAILY: REMOVE REPEATED CHORUSES FROM MEZMURS (FORWARD MIGRATION)\n` +
  `--\n` +
  `-- Summary:\n` +
  `-- Total records cleaned: ${updateSqlStatements.length}\n` +
  `-- Total duplicate chorus blocks removed: ${totalChorusesRemoved}\n` +
  `-- Total verse blocks preserved: ${totalVersesPreserved}\n` +
  `-- Generated: ${new Date().toISOString()}\n` +
  `-- =========================================================================\n\n` +
  `BEGIN;\n\n` +
  updateSqlStatements.join('\n\n') +
  `\n\nCOMMIT;\n`
writeFileSync(forwardSqlPath, forwardSql, 'utf8')

const rollbackSqlPath = join(OUTPUT_DIR, 'ROLLBACK_REPEATED_CHORUSES.sql')
const rollbackSql =
  `-- =========================================================================\n` +
  `-- TEWAHEDODAILY: ROLLBACK REPEATED CHORUS CLEANUP (REVERT TO ORIGINAL)\n` +
  `--\n` +
  `-- Total records to restore: ${rollbackSqlStatements.length}\n` +
  `-- Generated: ${new Date().toISOString()}\n` +
  `-- =========================================================================\n\n` +
  `BEGIN;\n\n` +
  rollbackSqlStatements.join('\n\n') +
  `\n\nCOMMIT;\n`
writeFileSync(rollbackSqlPath, rollbackSql, 'utf8')

console.log('\n--- CLEANUP EXECUTION SUMMARY ---')
console.log({
  totalProcessed,
  totalAmharicCleaned,
  totalTranslitCleaned,
  totalEnglishCleaned,
  totalChorusesRemoved,
  totalVersesPreserved,
  forwardSqlStatements: updateSqlStatements.length,
})
console.log(`✓ Forward SQL written to: ${forwardSqlPath} (${(forwardSql.length / 1024 / 1024).toFixed(2)} MB)`)
console.log(`✓ Rollback SQL written to: ${rollbackSqlPath} (${(rollbackSql.length / 1024 / 1024).toFixed(2)} MB)`)
console.log(`✓ Cleaned dataset written to: ${cleanedJsonPath}`)
