import { readFileSync, existsSync } from 'node:fs'

function parseCsv(filepath) {
  if (!existsSync(filepath)) return []
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

const formatRecords = parseCsv('C:/Users/eskew/Downloads/mezmur-lyrics-format-2026-10-25.csv')
const formatMap = new Map()
for (const r of formatRecords) {
  formatMap.set(r['Mezmur ID'], r)
}

const slugMap = new Map()
for (const r of classRecords) {
  if (!slugMap.has(r.slug)) slugMap.set(r.slug, [])
  slugMap.get(r.slug).push(r)
}

const dups = [...slugMap.entries()].filter(([s, list]) => list.length > 1)

console.log('Duplicate slugs analysis:')
for (const [slug, list] of dups) {
  console.log(`\n========================================`)
  console.log(`SLUG: ${slug}`)
  for (const item of list) {
    const fmt = formatMap.get(item.import_id)
    console.log(`  UUID: ${item.import_id}`)
    console.log(`    Title: "${item.title}"`)
    console.log(`    Class Status: ${item.status} | Cat: ${item.primary_category} | Occ: ${item.primary_occasion}`)
    if (fmt) {
      console.log(`    Format Status: ${fmt['Publication status']} | Langs: ${fmt['Populated languages']} | Result: ${fmt['Result status']}`)
      console.log(`    Verses: ${fmt['Verse count']} | Choruses: ${fmt['Chorus count']} | Alignment: ${fmt['Alignment type']}`)
    } else {
      console.log(`    Format Status: NOT IN FORMAT CSV`)
    }
  }
}
