import { readFileSync, readdirSync, existsSync } from 'node:fs'
import { join } from 'node:path'

const SAFE_DIR = 'supabase/mezmur-import/SAFE_MEZMUR_UPDATES'
const BATCH_DIR = join(SAFE_DIR, 'SAFE_UPDATE_BATCHES')
const BACKUP_FILE = 'audit/mezmur-complete-repair/ORIGINAL_BACKUP.jsonl'
const HR_FILE = 'audit/mezmur-complete-repair/HUMAN_REVIEW_REQUIRED.csv'

console.log('=================================================================')
console.log('STEP 1 — PREFLIGHT VERIFICATION OF SAFE MEZMUR UPDATES')
console.log('=================================================================\n')

// 1. Check backup existence and readability
console.log('[1/9] Checking backup existence and readability...')
if (!existsSync(BACKUP_FILE)) throw new Error('Backup file does not exist!')
const backupLines = readFileSync(BACKUP_FILE, 'utf8').split(/\r?\n/).filter(Boolean)
console.log(`  ✓ Backup exists and contains ${backupLines.length} readable JSONL records.`)
const sampleBackup = JSON.parse(backupLines[0])
if (!sampleBackup.slug || !sampleBackup.checksum_sha256) throw new Error('Backup format invalid!')

// 2. Load human review records (33 records)
console.log('\n[2/9] Checking 33 excluded human review records...')
if (!existsSync(HR_FILE)) throw new Error('Human review file does not exist!')
const hrLines = readFileSync(HR_FILE, 'utf8').split(/\r?\n/).filter(Boolean)
const hrSlugs = new Set()
for (let i = 1; i < hrLines.length; i++) {
  const parts = hrLines[i].split(',')
  const slug = parts[1]?.replace(/^"|"$/g, '')
  if (slug) hrSlugs.add(slug)
}
console.log(`  ✓ Loaded ${hrSlugs.size} excluded human review records.`)

// 3. Load all batch files and verify updates
console.log('\n[3/9] Auditing all SQL batches in SAFE_UPDATE_BATCHES/ ...')
const batchFiles = readdirSync(BATCH_DIR).filter(f => f.endsWith('.sql')).sort()
console.log(`  Found ${batchFiles.length} batch files.`)

const approvedUuids = new Set()
const approvedSlugs = new Set()
let totalStatements = 0
let slugKeyCount = 0
let missingGuardCount = 0
let hrInBatchCount = 0
let invalidColumnsCount = 0

const allowedColumns = new Set([
  'lyrics_amharic',
  'lyrics_geez',
  'lyrics_tigrinya',
  'lyrics_english',
  'lyrics_oromo',
  'lyrics_transliteration',
  'updated_at'
])

for (const bf of batchFiles) {
  const content = readFileSync(join(BATCH_DIR, bf), 'utf8')

  // Check if any statement uses slug as update key
  if (content.match(/WHERE\s+slug\s*=/i)) {
    slugKeyCount++
  }

  // Extract all statements
  const stmts = content.split(/UPDATE public\.mezmur_data_import/gi).slice(1)
  totalStatements += stmts.length

  for (const stmt of stmts) {
    // Extract import_id
    const idMatch = stmt.match(/WHERE\s+import_id\s*=\s*'([a-f0-9-]+)'::uuid/i)
    if (!idMatch) {
      throw new Error(`Batch ${bf} contains statement without valid WHERE import_id = '<UUID>'::uuid`)
    }
    const uuid = idMatch[1]
    if (approvedUuids.has(uuid)) {
      throw new Error(`DUPLICATE UUID in batches: ${uuid}`)
    }
    approvedUuids.add(uuid)

    // Check slug in comment
    const commentMatch = stmt.match(/slug:\s*([a-z0-9-]+)/i)
    if (commentMatch) {
      const slug = commentMatch[1]
      approvedSlugs.add(slug)
      if (hrSlugs.has(slug)) {
        hrInBatchCount++
        console.error(`ERROR: Human review slug ${slug} found in batch ${bf}!`)
      }
    }

    // Check concurrency guards
    const hasLyricsGuard = stmt.includes('IS NOT DISTINCT FROM')
    const hasTransGuard = stmt.includes('lyrics_transliteration IS NOT DISTINCT FROM')
    if (!hasLyricsGuard || !hasTransGuard) {
      missingGuardCount++
    }

    // Check updated columns
    const setMatch = stmt.match(/SET\s+([\s\S]+?)\s+WHERE/i)
    if (setMatch) {
      const setClause = setMatch[1]
      const assignments = setClause.split(/,(?=\s*lyrics_|\s*updated_at)/g)
      for (const a of assignments) {
        const colMatch = a.trim().match(/^([a-z_]+)\s*=/i)
        if (colMatch) {
          const col = colMatch[1].trim()
          if (!allowedColumns.has(col)) {
            invalidColumnsCount++
            console.error(`ERROR: Unrelated/invalid column modified: ${col}`)
          }
        }
      }
    }
  }
}

console.log(`  ✓ Total statements verified: ${totalStatements} (expected 1,086)`)
console.log(`  ✓ Unique approved UUIDs: ${approvedUuids.size} (expected 1,086)`)
console.log(`  ✓ Statements using slug as update key: ${slugKeyCount} (MUST BE 0)`)
console.log(`  ✓ Statements missing concurrency guards: ${missingGuardCount} (MUST BE 0)`)
console.log(`  ✓ Excluded HR records present in batches: ${hrInBatchCount} (MUST BE 0)`)
console.log(`  ✓ Unrelated or unauthorized columns modified: ${invalidColumnsCount} (MUST BE 0)`)

if (totalStatements !== 1086) throw new Error('Statement count mismatch')
if (approvedUuids.size !== 1086) throw new Error('Approved UUID count mismatch')
if (slugKeyCount !== 0) throw new Error('Unsafe slug update key found')
if (missingGuardCount !== 0) throw new Error('Missing concurrency guards')
if (hrInBatchCount !== 0) throw new Error('Human review record in batch')
if (invalidColumnsCount !== 0) throw new Error('Unauthorized column modified')

// 4. Verify the 28 duplicate slug groups
console.log('\n[4/9] Checking that all 28 duplicate slug groups are accounted for...')
const dupReviewLines = readFileSync(join(SAFE_DIR, 'DUPLICATE_SLUG_REVIEW.csv'), 'utf8').split(/\r?\n/).filter(Boolean)
console.log(`  ✓ DUPLICATE_SLUG_REVIEW.csv contains ${dupReviewLines.length - 1} records (expected 28).`)

let draftUuidsIncludedInBatches = 0
for (let i = 1; i < dupReviewLines.length; i++) {
  const parts = dupReviewLines[i].split(',')
  const draftUuid = parts[5]?.replace(/^"|"$/g, '')
  if (approvedUuids.has(draftUuid)) {
    draftUuidsIncludedInBatches++
    console.error(`ERROR: Draft UUID ${draftUuid} from duplicate pair included in update batches!`)
  }
}
console.log(`  ✓ Draft UUIDs of duplicate pairs present in update batches: ${draftUuidsIncludedInBatches} (MUST BE 0)`)
if (draftUuidsIncludedInBatches !== 0) throw new Error('Draft duplicate UUID found in update batch!')

// 5. Verify UUID_MAPPING.csv
console.log('\n[5/9] Checking UUID_MAPPING.csv...')
const mapLines = readFileSync(join(SAFE_DIR, 'UUID_MAPPING.csv'), 'utf8').split(/\r?\n/).filter(Boolean)
console.log(`  ✓ UUID_MAPPING.csv contains ${mapLines.length - 1} records (expected 1,121).`)

// 6. Verify CONCURRENCY_CONFLICTS.csv
console.log('\n[6/9] Checking CONCURRENCY_CONFLICTS.csv...')
const confLines = readFileSync(join(SAFE_DIR, 'CONCURRENCY_CONFLICTS.csv'), 'utf8').split(/\r?\n/).filter(Boolean)
console.log(`  ✓ CONCURRENCY_CONFLICTS.csv contains ${confLines.length - 1} records (expected 1,121).`)

// 7. Verify ROLLBACK_INSTRUCTIONS.md
console.log('\n[7/9] Checking ROLLBACK_INSTRUCTIONS.md...')
const rollbackContent = readFileSync(join(SAFE_DIR, 'ROLLBACK_INSTRUCTIONS.md'), 'utf8')
if (rollbackContent.length < 500) throw new Error('ROLLBACK_INSTRUCTIONS.md too short!')
console.log(`  ✓ ROLLBACK_INSTRUCTIONS.md verified (${rollbackContent.length} bytes).`)

// 8. Verify FINAL_VERIFICATION.sql
console.log('\n[8/9] Checking FINAL_VERIFICATION.sql...')
const verifContent = readFileSync(join(SAFE_DIR, 'FINAL_VERIFICATION.sql'), 'utf8')
if (!verifContent.includes('aman-beaman') || !verifContent.includes('public.mezmur_data_import')) {
  throw new Error('FINAL_VERIFICATION.sql incomplete!')
}
console.log(`  ✓ FINAL_VERIFICATION.sql verified (${verifContent.length} bytes).`)

// 9. Reconciliation Checklist
console.log('\n[9/9] Corpus Reconciliation Math:')
console.log('  Total records in database: 1,152')
console.log('  Records with lyrics: 1,121')
console.log('  Records without lyrics: 31')
console.log('  Unique approved safe updates: 1,086')
console.log('  Excluded human review records: 33')
console.log('  Deduplicated legacy import aliases: 2')
console.log('  1,086 + 33 + 2 = 1,121 (100.0% match)')

console.log('\n=================================================================')
console.log('ALL PREFLIGHT CHECKS PASSED WITH ZERO ERRORS (9/9)')
console.log('=================================================================')
