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

// In backupRecords:
// 994 published records
// 158 draft records
// How did each record get mapped?
// Let's check which records in allClassRecords had NO update statement in our previous mapping!
