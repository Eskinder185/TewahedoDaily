import { readFileSync } from 'node:fs'

function parseCsv(filepath) {
  const content = readFileSync(filepath, 'utf8')
  const lines = content.split(/\r?\n/)
  const header = lines[0].replace(/^\ufeff/, '').split(',').map((s) => s.trim())
  const rows = []
  let currentRow = []
  let inQuotes = false
  let currentField = ''

  for (let i = 1; i < lines.length; i++) {
    const line = lines[i]
    for (let c = 0; c < line.length; c++) {
      const char = line[c]
      if (char === '"') {
        if (inQuotes && line[c + 1] === '"') {
          currentField += '"'
          c++
        } else {
          inQuotes = !inQuotes
        }
      } else if (char === ',' && !inQuotes) {
        currentRow.push(currentField)
        currentField = ''
      } else {
        currentField += char
      }
    }
    if (!inQuotes) {
      currentRow.push(currentField)
      if (currentRow.length >= header.length) {
        const obj = {}
        header.forEach((h, idx) => (obj[h] = currentRow[idx]))
        rows.push(obj)
      }
      currentRow = []
      currentField = ''
    } else {
      currentField += '\n'
    }
  }
  return rows
}

const proc = parseCsv('audit/mezmur-complete-repair/PROCESSING_RESULTS.csv')
console.log('Total rows in PROCESSING_RESULTS:', proc.length)

const missingLyrics = proc.filter(r => r.error === 'NO_LYRICS_AVAILABLE')
console.log('Missing lyrics count:', missingLyrics.length)
missingLyrics.forEach((r, idx) => {
  console.log(`${idx + 1}. import_id: ${r.import_id} | slug: ${r.slug} | title: ${r.title} | status: ${r.status}`)
})
