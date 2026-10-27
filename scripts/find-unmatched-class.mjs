import { readFileSync } from 'node:fs'

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

const allClassRecords = []
for (let i = 1; i < classLines.length; i++) {
  const p = parseCsvLine(classLines[i])
  allClassRecords.push({ import_id: p[0], slug: p[1], title: p[2] })
}

const formatFile = 'C:/Users/eskew/Downloads/mezmur-lyrics-format-2026-10-25.csv'
const formatLines = readFileSync(formatFile, 'utf8').split(/\r?\n/).filter(l => l.trim())
const formatMap = new Map()
for (let i = 1; i < formatLines.length; i++) {
  const p = parseCsvLine(formatLines[i])
  formatMap.set(p[0], { title: p[1], status: p[2] })
}

const lines = readFileSync('audit/mezmur-complete-repair/ORIGINAL_BACKUP.jsonl', 'utf8').split(/\r?\n/).filter(Boolean)
const records = lines.map(l => JSON.parse(l))

// Set of all slugs in backup EXCEPT nana-amanuel and share
const backupSlugs = new Set(records.map(r => r.slug).filter(s => s && s !== 'nana-amanuel' && s !== 'share'))

// Find which records in allClassRecords have a slug NOT in backupSlugs
const candidates = allClassRecords.filter(r => !backupSlugs.has(r.slug))
console.log('Class records with slug not in backup:', candidates.length)
candidates.forEach(c => {
  const fmt = formatMap.get(c.import_id)
  console.log(c.import_id, c.slug, `"${c.title}"`, 'status:', fmt?.status)
})
