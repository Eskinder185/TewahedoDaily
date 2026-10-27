import { readFileSync, existsSync } from 'node:fs'

const classFile = 'C:/Users/eskew/Downloads/mezmur-classification-2026-10-25 (7).csv'
const classLines = readFileSync(classFile, 'utf8').split(/\r?\n/).filter(l => l.trim())

function parseCsvLine(line) {
  const result = []
  let current = ''
  let inQuotes = false
  for (let i = 0; i < line.length; i++) {
    const c = line[i]
    if (c === '"') {
      if (inQuotes && line[i + 1] === '"') {
        current += '"'
        i++
      } else {
        inQuotes = !inQuotes
      }
    } else if (c === ',' && !inQuotes) {
      result.push(current)
      current = ''
    } else {
      current += c
    }
  }
  result.push(current)
  return result
}

const classRecords = []
for (let i = 1; i < classLines.length; i++) {
  const parts = parseCsvLine(classLines[i])
  classRecords.push({
    import_id: parts[0],
    slug: parts[1],
    title: parts[2],
    primary_category: parts[3],
    additional_categories: parts[4],
    primary_occasion: parts[5],
    additional_occasions: parts[6],
    method: parts[7],
    confidence: parts[8],
    status: parts[9]
  })
}

// Find 28 duplicate slugs
const slugMap = new Map()
for (const r of classRecords) {
  if (!slugMap.has(r.slug)) slugMap.set(r.slug, [])
  slugMap.get(r.slug).push(r)
}

const dups = [...slugMap.entries()].filter(([s, list]) => list.length > 1)
console.log('Duplicated slugs count:', dups.length)

// Check in ORIGINAL_BACKUP.jsonl
const backupLines = readFileSync('audit/mezmur-complete-repair/ORIGINAL_BACKUP.jsonl', 'utf8').split(/\r?\n/).filter(Boolean)
const backupRecords = backupLines.map(l => JSON.parse(l))

for (const [slug, list] of dups) {
  console.log(`\n=== SLUG: ${slug} (${list.length} rows) ===`)
  list.forEach(r => {
    console.log(`  UUID: ${r.import_id} | Title: "${r.title}" | Cat: ${r.primary_category} | Occ: ${r.primary_occasion}`)
  })
  const inBackup = backupRecords.filter(b => b.slug === slug)
  console.log(`  Occurrences in ORIGINAL_BACKUP.jsonl: ${inBackup.length}`)
  inBackup.forEach(b => {
    console.log(`    Backup import_id: ${b.import_id} | Title: "${b.title}" | Status: ${b.status} | Lang: ${b.primary_language || 'N/A'}`)
    console.log(`    Backup lyrics snippet: ${(b.lyrics_amharic || b.lyrics_english || b.lyrics_geez || '').slice(0, 60).replace(/\n/g, ' ')}`)
  })
}
