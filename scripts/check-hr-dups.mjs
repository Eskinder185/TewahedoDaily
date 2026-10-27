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

const slugMap = new Map()
for (let i = 1; i < classLines.length; i++) {
  const parts = parseCsvLine(classLines[i])
  const slug = parts[1]
  if (!slugMap.has(slug)) slugMap.set(slug, [])
  slugMap.get(slug).push(parts[0])
}

const hrLines = readFileSync('audit/mezmur-complete-repair/HUMAN_REVIEW_REQUIRED.csv', 'utf8').split(/\r?\n/).filter(Boolean)
const hrSlugs = []
for (let i = 1; i < hrLines.length; i++) {
  const parts = parseCsvLine(hrLines[i])
  hrSlugs.push(parts[1])
}

console.log('Human review records count:', hrSlugs.length)
const hrDups = hrSlugs.filter(s => slugMap.get(s)?.length > 1)
console.log('Human review records that are duplicate slugs:', hrDups)
