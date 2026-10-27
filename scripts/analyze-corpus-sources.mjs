import { readFileSync, existsSync } from 'node:fs'

const classFile = 'C:/Users/eskew/Downloads/mezmur-classification-2026-10-25 (7).csv'
const classLines = readFileSync(classFile, 'utf8').split(/\r?\n/).filter(l => l.trim())

console.log('Classification rows (excl header):', classLines.length - 1)

// Parse CSV with quotes handling
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

console.log('Parsed classRecords count:', classRecords.length)
console.log('Sample classRecord[0]:', classRecords[0])

// Check unique import_ids
const uniqueIds = new Set(classRecords.map(r => r.import_id))
console.log('Unique import_ids:', uniqueIds.size)

// Check unique slugs
const uniqueSlugs = new Set(classRecords.map(r => r.slug))
console.log('Unique slugs:', uniqueSlugs.size)

// Duplicate slugs
const slugMap = new Map()
for (const r of classRecords) {
  if (!slugMap.has(r.slug)) slugMap.set(r.slug, [])
  slugMap.get(r.slug).push(r)
}

const dups = [...slugMap.entries()].filter(([s, list]) => list.length > 1)
console.log('Duplicate slug groups in classRecords:', dups.length)
console.log('Total records in duplicate slug groups:', dups.reduce((acc, [s, list]) => acc + list.length, 0))

