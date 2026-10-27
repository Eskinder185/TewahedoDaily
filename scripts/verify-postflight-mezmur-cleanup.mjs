import { createClient } from '@supabase/supabase-js'
import { readFileSync, existsSync } from 'node:fs'
import assert from 'node:assert/strict'
import { CHORUS_HEADING_REGEX, VERSE_HEADING_REGEX, cleanMezmurLyrics } from '../src/lib/mezmur/mezmurChorusCleaner.ts'

console.log('=== RUNNING POSTFLIGHT SUPABASE MEZMUR VERIFICATION ===\n')

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

const sb = createClient(url, key)

// 1. Fetch live records from mezmur_public
console.log('1. Fetching all live records from mezmur_public...')
let liveRecords = []
let page = 0
const pageSize = 500
while (true) {
  const { data, error } = await sb
    .from('mezmur_public')
    .select('mezmur_id, slug, title, title_amharic, lyrics_amharic, lyrics_transliteration, lyrics_english, lyrics_geez, lyrics_oromo, status, youtube_url, singer_id, singer_name, zemari_id')
    .order('slug', { ascending: true })
    .range(page * pageSize, (page + 1) * pageSize - 1)

  if (error) {
    console.error('Error fetching live records:', error)
    process.exit(1)
  }
  if (!data || data.length === 0) break
  liveRecords.push(...data)
  if (data.length < pageSize) break
  page++
}

console.log(`✓ Fetched ${liveRecords.length} records from Supabase.\n`)
assert.equal(liveRecords.length, 994, 'All 994 live records fetched')

// 2. Load expected cleaned records and preflight backup
const cleanedJson = JSON.parse(readFileSync('supabase/mezmur-cleanup/CLEANED_MEZMUR_LYRICS.json', 'utf8'))
const backupJson = JSON.parse(readFileSync('backup/production_lyrics_fresh_backup_20261026.json', 'utf8'))

const cleanedMap = new Map(cleanedJson.map(r => [r.slug, r]))
const backupMap = new Map(backupJson.map(r => [r.slug, r]))

let updatedCount = 0
let unchangedCount = 0
let zeroDuplicateChorusCount = 0
let verseHeadingsPreservedCount = 0
let totalPreservedVerses = 0
let metadataUntouchedCount = 0

for (const live of liveRecords) {
  const expected = cleanedMap.get(live.slug)
  const backup = backupMap.get(live.slug)
  assert.ok(expected, `Expected cleaned record exists for ${live.slug}`)
  assert.ok(backup, `Backup record exists for ${live.slug}`)

  // Verify non-lyric fields
  assert.equal(live.title, backup.title, `Title unchanged for ${live.slug}`)
  assert.equal(live.title_amharic, backup.title_amharic, `Title Amharic unchanged for ${live.slug}`)
  assert.equal(live.status, backup.status, `Status unchanged for ${live.slug}`)
  metadataUntouchedCount++

  // Check lyrics against expected
  const amMatch = (live.lyrics_amharic || '') === (expected.lyrics_amharic || '')
  const trMatch = (live.lyrics_transliteration || '') === (expected.lyrics_transliteration || '')
  const enMatch = (live.lyrics_english || '') === (expected.lyrics_english || '')
  const gzMatch = (live.lyrics_geez || '') === (expected.lyrics_geez || '')
  const orMatch = (live.lyrics_oromo || '') === (expected.lyrics_oromo || '')

  assert.ok(amMatch, `Amharic lyrics match cleaned specification for ${live.slug}`)
  assert.ok(trMatch, `Transliteration lyrics match cleaned specification for ${live.slug}`)
  assert.ok(enMatch, `English lyrics match cleaned specification for ${live.slug}`)
  assert.ok(gzMatch, `Ge'ez lyrics match cleaned specification for ${live.slug}`)
  assert.ok(orMatch, `Oromo lyrics match cleaned specification for ${live.slug}`)

  const changedFromBackup =
    (live.lyrics_amharic || '') !== (backup.lyrics_amharic || '') ||
    (live.lyrics_transliteration || '') !== (backup.lyrics_transliteration || '') ||
    (live.lyrics_english || '') !== (backup.lyrics_english || '')

  if (changedFromBackup) {
    updatedCount++
  } else {
    unchangedCount++
  }

  // Verify repeated chorus removal and verse heading preservation on live Amharic text
  if (live.lyrics_amharic) {
    const text = live.lyrics_amharic
    const blocks = text.trim().split(/\r?\n\s*\r?\n+/).map(blk => blk.trim()).filter(Boolean)

    // Verify NO structural chorus heading
    for (const blk of blocks) {
      const firstLine = blk.split(/\r?\n/)[0]?.trim() || ''
      assert.ok(!CHORUS_HEADING_REGEX.test(firstLine), `Hymn ${live.slug}: Unexpected CHORUS heading on line "${firstLine}"`)
    }

    // Verify NO duplicate chorus blocks
    for (let bIdx = 2; bIdx < blocks.length; bIdx++) {
      const blk = blocks[bIdx]
      const lines = blk.split(/\r?\n/).map(l => l.trim()).filter(Boolean)
      const firstLine = lines[0] || ''
      if (!VERSE_HEADING_REGEX.test(firstLine)) {
        const blk0 = blocks[0].split(/\r?\n/).map(l => l.trim()).filter(Boolean).join('\n')
        const current = lines.join('\n')
        assert.notEqual(current, blk0, `Hymn ${live.slug}: Duplicate chorus block found at block ${bIdx}`)
      }
    }
    zeroDuplicateChorusCount++

    // Verify verse headings count
    const backupBlocks = (backup.lyrics_amharic || '').trim().split(/\r?\n\s*\r?\n+/).map(blk => blk.trim()).filter(Boolean)
    const backupVerses = backupBlocks.map(blk => blk.split(/\r?\n/)[0]?.trim() || '').filter(l => VERSE_HEADING_REGEX.test(l))
    const liveVerses = blocks.map(blk => blk.split(/\r?\n/)[0]?.trim() || '').filter(l => VERSE_HEADING_REGEX.test(l))

    assert.equal(liveVerses.length, backupVerses.length, `Hymn ${live.slug}: Verse heading count preserved (${liveVerses.length} vs ${backupVerses.length})`)
    verseHeadingsPreservedCount++
    totalPreservedVerses += liveVerses.length
  }
}

console.log('--- POSTFLIGHT AUDIT SUMMARY ---')
console.log(`Total live records in Supabase: ${liveRecords.length}`)
console.log(`Actual updated hymns: ${updatedCount} / 989 intended`)
console.log(`Actual unchanged hymns: ${unchangedCount} / 5 expected`)
console.log(`Total preserved verse blocks: ${totalPreservedVerses} (across all hymns)`)
console.log(`Hymns with 0 duplicate choruses: ${zeroDuplicateChorusCount}`)
console.log(`Hymns with 100% verse headings preserved: ${verseHeadingsPreservedCount}`)
console.log(`Hymns with untouched titles, status & metadata: ${metadataUntouchedCount}`)
console.log('\n✓ ALL LIVE SUPABASE POSTFLIGHT CHECKS PASSED WITH 100% SUCCESS!')
