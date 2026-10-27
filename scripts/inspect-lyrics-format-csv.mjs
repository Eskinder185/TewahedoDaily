import { readFileSync } from 'node:fs'

const lyricsFormatFile = 'C:/Users/eskew/Downloads/mezmur-lyrics-format-2026-10-25.csv'
const lines = readFileSync(lyricsFormatFile, 'utf8').split(/\r?\n/).filter(l => l.trim())
console.log('Total rows in lyrics-format CSV:', lines.length - 1)

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

const header = parseCsvLine(lines[0])
console.log('Header:', header)

const records = []
for (let i = 1; i < lines.length; i++) {
  const parts = parseCsvLine(lines[i])
  records.push({
    import_id: parts[0],
    title: parts[1],
    status: parts[2],
    languages: parts[3],
    result_status: parts[10],
    error_message: parts[11]
  })
}

console.log('Parsed lyrics format records:', records.length)
console.log('Unique import_ids:', new Set(records.map(r => r.import_id)).size)
const statusCounts = {}
for (const r of records) {
  statusCounts[r.status] = (statusCounts[r.status] || 0) + 1
}
console.log('Status counts:', statusCounts)
const resultCounts = {}
for (const r of records) {
  resultCounts[r.result_status] = (resultCounts[r.result_status] || 0) + 1
}
console.log('Result status counts:', resultCounts)
