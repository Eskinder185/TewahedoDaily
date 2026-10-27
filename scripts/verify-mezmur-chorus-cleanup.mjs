import { readFileSync } from 'node:fs'
import { resolve, join } from 'node:path'
import assert from 'node:assert/strict'
import { cleanMezmurLyrics, CHORUS_HEADING_REGEX, VERSE_HEADING_REGEX } from '../src/lib/mezmur/mezmurChorusCleaner.ts'
import { parseLyricSections } from '../src/lib/hymns/lyrics.ts'
import { parseStructuredLyrics } from '../src/lib/mezmur/structuredLyricsParser.ts'

console.log('=== VERIFYING MEZMUR CHORUS CLEANUP DATASET ===\n')

const CLEANED_JSON = resolve('supabase/mezmur-cleanup/CLEANED_MEZMUR_LYRICS.json')
const BACKUP_JSON = resolve('backup/mezmur_lyrics_pre_chorus_cleanup_backup.json')

const cleanedRecords = JSON.parse(readFileSync(CLEANED_JSON, 'utf8'))
const backupRecords = JSON.parse(readFileSync(BACKUP_JSON, 'utf8'))
const backupMap = new Map(backupRecords.map(r => [r.slug, r]))

console.log(`Loaded ${cleanedRecords.length} cleaned records and ${backupRecords.length} backup records.`)
assert.equal(cleanedRecords.length, backupRecords.length, 'Record count matches backup')

let verifiedZeroDuplicateChoruses = 0
let verifiedVerseHeadingsPreserved = 0
let verifiedIdempotence = 0
let verifiedOpeningChorusNoHeading = 0

for (let i = 0; i < cleanedRecords.length; i++) {
  const c = cleanedRecords[i]
  const b = backupMap.get(c.slug)
  assert.ok(b, `Backup record exists for ${c.slug}`)

  // Check Amharic
  if (c.lyrics_amharic) {
    const text = c.lyrics_amharic
    const blocks = text.trim().split(/\r?\n\s*\r?\n+/).map(blk => blk.trim()).filter(Boolean)

    // Check 1: NO block has standalone CHORUS heading
    for (const blk of blocks) {
      const firstLine = blk.split(/\r?\n/)[0]?.trim() || ''
      assert.ok(!CHORUS_HEADING_REGEX.test(firstLine), `Hymn ${c.slug}: Found unwanted CHORUS heading "${firstLine}"`)
    }

    // Check 2: NO block has standalone CHORUS heading and NO duplicate chorus blocks exist
    let chorusCount = 0
    for (let bIdx = 0; bIdx < blocks.length; bIdx++) {
      const blk = blocks[bIdx]
      const lines = blk.split(/\r?\n/).map(l => l.trim()).filter(Boolean)
      const firstLine = lines[0] || ''
      assert.ok(!CHORUS_HEADING_REGEX.test(firstLine), `Hymn ${c.slug}: Found unwanted CHORUS heading "${firstLine}"`)

      // If it's not a verse or other heading, check if it's an unheaded duplicate chorus appearing after verse 1
      if (!VERSE_HEADING_REGEX.test(firstLine) && bIdx > 1) {
        const blk0Content = blocks[0].split(/\r?\n/).map(l => l.trim()).filter(Boolean).join('\n')
        const currentContent = lines.join('\n')
        assert.notEqual(currentContent, blk0Content, `Hymn ${c.slug}: Found duplicate chorus block at position ${bIdx}`)
      }
    }
    verifiedZeroDuplicateChoruses++

    // Check 3: VERSE headings preserved
    const backupBlocks = (b.lyrics_amharic || '').trim().split(/\r?\n\s*\r?\n+/).map(blk => blk.trim()).filter(Boolean)
    const backupVerseHeadings = backupBlocks
      .map(blk => blk.split(/\r?\n/)[0]?.trim() || '')
      .filter(line => VERSE_HEADING_REGEX.test(line))

    const cleanedVerseHeadings = blocks
      .map(blk => blk.split(/\r?\n/)[0]?.trim() || '')
      .filter(line => VERSE_HEADING_REGEX.test(line))

    assert.equal(
      cleanedVerseHeadings.length,
      backupVerseHeadings.length,
      `Hymn ${c.slug}: Verse heading count preserved (${cleanedVerseHeadings.length} vs ${backupVerseHeadings.length})`
    )
    verifiedVerseHeadingsPreserved++

    // Check 4: Idempotence
    const rerun = cleanMezmurLyrics(text)
    assert.equal(rerun.isChanged, false, `Hymn ${c.slug}: Idempotence check failed`)
    assert.equal(rerun.cleanedText, text, `Hymn ${c.slug}: Idempotent output matches cleaned text`)
    verifiedIdempotence++

    // Check 5: Frontend parser behavior
    if (cleanedVerseHeadings.length > 0 && blocks.length > cleanedVerseHeadings.length) {
      // First block is opening chorus without heading
      const parsedSections = parseLyricSections(text)
      assert.equal(parsedSections[0].label, '', `Hymn ${c.slug}: First section label is empty (no CHORUS heading)`)
      assert.equal(parsedSections[0].kind, 'chorus', `Hymn ${c.slug}: First section kind is chorus`)
      assert.ok(parsedSections[1].label.toLowerCase().includes('verse') || parsedSections[1].label.includes('ቁጥር'), `Hymn ${c.slug}: Second section is Verse 1`)
      verifiedOpeningChorusNoHeading++
    }
  }

  // Check Transliteration
  if (c.lyrics_transliteration) {
    const textTr = c.lyrics_transliteration
    const rerunTr = cleanMezmurLyrics(textTr)
    assert.equal(rerunTr.isChanged, false, `Hymn ${c.slug} (Translit): Idempotence check failed`)
  }
}

console.log('✓ PASS: All', verifiedZeroDuplicateChoruses, 'hymns verified with 0 duplicate choruses.')
console.log('✓ PASS: All', verifiedVerseHeadingsPreserved, 'hymns have 100% of their VERSE headings preserved.')
console.log('✓ PASS: All', verifiedIdempotence, 'hymns verified 100% idempotent.')
console.log('✓ PASS: All', verifiedOpeningChorusNoHeading, 'multi-stanza hymns verified with clean opening chorus (no CHORUS heading) followed by VERSE 1.')

// Print detailed inspection of 3 sample hymns
console.log('\n--- SAMPLE INSPECTIONS ---')
const sampleSlugs = [
  'mesach-mezimur-bezimita-zemari-kesis-ashenafi-gebiremariyam',
  'min-bitiwedegn-new',
  'altewengem-geta',
]

for (const slug of sampleSlugs) {
  const rec = cleanedRecords.find(r => r.slug === slug)
  if (!rec) continue
  console.log(`\n======================================================`)
  console.log(`HYMN: [${rec.slug}] ${rec.title}`)
  console.log(`Title Amharic: ${rec.title_amharic}`)
  console.log(`Choruses Removed: ${rec.removed_chorus_count} | Verses Preserved: ${rec.preserved_verse_count}`)
  console.log(`======================================================`)
  console.log(rec.lyrics_amharic)
}

console.log('\n=== ALL VERIFICATION CHECKS PASSED WITH 100% SUCCESS ===\n')
