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

const lines = readFileSync('audit/mezmur-complete-repair/ORIGINAL_BACKUP.jsonl', 'utf8').split(/\r?\n/).filter(Boolean)
const backupRecords = lines.map(l => JSON.parse(l))

const backupSlugSet = new Set(backupRecords.map(r => r.slug).filter(Boolean))
const classSlugSet = new Set(allClassRecords.map(r => r.slug))

console.log('Slugs in class but not in backup:')
for (const s of classSlugSet) {
  if (!backupSlugSet.has(s)) {
    const match = allClassRecords.find(r => r.slug === s)
    console.log('  In class only:', s, match.import_id, `"${match.title}"`)
  }
}

console.log('\nSlugs in backup but not in class:')
for (const s of backupSlugSet) {
  if (!classSlugSet.has(s)) {
    const match = backupRecords.find(r => r.slug === s)
    console.log('  In backup only:', s, match.import_id, `"${match.title}"`)
  }
}
