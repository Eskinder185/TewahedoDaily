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

const mappingLines = readFileSync('supabase/mezmur-import/SAFE_MEZMUR_UPDATES/UUID_MAPPING.csv', 'utf8').split(/\r?\n/).filter(Boolean)
const mappedUuids = new Set()
for (let i = 1; i < mappingLines.length; i++) {
  const parts = mappingLines[i].split(',')
  mappedUuids.add(parts[0].replace(/^"|"$/g, ''))
}

console.log('Total DB records in classification CSV:', allClassRecords.length)
console.log('Total unique mapped UUIDs in UUID_MAPPING.csv:', mappedUuids.size)

const unmappedClassRecords = allClassRecords.filter(r => !mappedUuids.has(r.import_id))
console.log('Class records not mapped at all:', unmappedClassRecords.length)

const formatFile = 'C:/Users/eskew/Downloads/mezmur-lyrics-format-2026-10-25.csv'
const formatLines = readFileSync(formatFile, 'utf8').split(/\r?\n/).filter(l => l.trim())
const formatMap = new Map()
for (let i = 1; i < formatLines.length; i++) {
  const p = parseCsvLine(formatLines[i])
  formatMap.set(p[0], { title: p[1], status: p[2], result: p[10] })
}

unmappedClassRecords.forEach(r => {
  const fmt = formatMap.get(r.import_id)
  console.log('Unmapped DB row:', r.import_id, r.slug, `"${r.title}"`, 'status:', fmt?.status)
})
