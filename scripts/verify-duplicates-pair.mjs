import { readFileSync } from 'node:fs'

const classFile = 'C:/Users/eskew/Downloads/mezmur-classification-2026-10-25 (7).csv'
const classLines = readFileSync(classFile, 'utf8').split(/\r?\n/).filter(l => l.trim())

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

const formatRecords = parseCsv('C:/Users/eskew/Downloads/mezmur-lyrics-format-2026-10-25.csv')
const formatMap = new Map()
for (const r of formatRecords) {
  formatMap.set(r['Mezmur ID'], r)
}

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
  classRecords.push({ import_id: parts[0], slug: parts[1], title: parts[2] })
}

const slugMap = new Map()
for (const r of classRecords) {
  if (!slugMap.has(r.slug)) slugMap.set(r.slug, [])
  slugMap.get(r.slug).push(r)
}

const dups = [...slugMap.entries()].filter(([s, list]) => list.length > 1)
console.log('Duplicated slugs count:', dups.length)

let allOnePublishedOneDraft = true
for (const [slug, list] of dups) {
  const statuses = list.map(item => {
    const fmt = formatMap.get(item.import_id)
    return fmt ? fmt['Publication status'] : 'unknown'
  })
  const pubCount = statuses.filter(s => s === 'published').length
  const draftCount = statuses.filter(s => s === 'draft').length
  if (pubCount !== 1 || draftCount !== 1) {
    console.log(`Slug ${slug} DOES NOT have 1 pub and 1 draft:`, statuses)
    allOnePublishedOneDraft = false
  }
}
console.log('Are all 28 duplicate slugs exactly 1 published and 1 draft?', allOnePublishedOneDraft)
