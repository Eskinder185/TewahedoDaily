import { readFileSync } from 'node:fs'

const b29 = readFileSync('supabase/mezmur-import/SAFE_MEZMUR_UPDATES/SAFE_UPDATE_BATCHES/batch_29.sql', 'utf8')
const backupLines = readFileSync('audit/mezmur-complete-repair/ORIGINAL_BACKUP.jsonl', 'utf8').split(/\r?\n/).filter(Boolean)
const backupMap = new Map()
for (const l of backupLines) {
  const o = JSON.parse(l)
  if (o.slug) backupMap.set(o.slug, o)
}

// Extract all blocks in batch_29.sql
const blocks = b29.split(/\s+--\s+([a-z0-9-]+)\s+\("([^"]+)"\)/gi)

console.log('=== AUDITING ALL RECORDS IN BATCH 29 ===\n')

const records = []
// blocks structure: [preamble, slug1, title1, sql1, slug2, title2, sql2, ...]
for (let i = 1; i < blocks.length; i += 3) {
  const slug = blocks[i]
  const title = blocks[i + 1]
  const sql = blocks[i + 2]

  const idMatch = sql.match(/WHERE import_id = '([a-f0-9-]+)'::uuid/i)
  const import_id = idMatch ? idMatch[1] : null

  const targetMatch = sql.match(/SET (lyrics_[a-z]+) =/i)
  const target_field = targetMatch ? targetMatch[1] : null

  const origGuardMatch = sql.match(/AND (lyrics_[a-z]+) IS NOT DISTINCT FROM ([\s\S]+?);/i)
  const origGuard = origGuardMatch ? origGuardMatch[0] : null

  const backup = backupMap.get(slug)

  records.push({
    index: Math.floor(i / 3) + 1,
    slug,
    title,
    import_id,
    target_field,
    has_backup: !!backup,
    backup_status: backup?.status,
    has_dots_in_backup: backup?.lyrics_amharic?.includes('....') || false
  })
}

console.log(`Total records in batch_29: ${records.length}`)
records.forEach(r => {
  console.log(`${r.index}. [${r.slug}] (UUID: ${r.import_id}) status: ${r.backup_status} | has_dots: ${r.has_dots_in_backup}`)
})

console.log('\nRecords with dotted lines in backup in Batch 29:')
const dotted = records.filter(r => r.has_dots_in_backup)
dotted.forEach(d => console.log(`  ${d.slug} (UUID: ${d.import_id})`))
