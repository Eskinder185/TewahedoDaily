import { readFileSync } from 'node:fs'

const formatFile = 'C:/Users/eskew/Downloads/mezmur-lyrics-format-2026-10-25.csv'
const formatLines = readFileSync(formatFile, 'utf8').split(/\r?\n/).filter(l => l.trim())

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

const classFile = 'C:/Users/eskew/Downloads/mezmur-classification-2026-10-25 (7).csv'
const classLines = readFileSync(classFile, 'utf8').split(/\r?\n/).filter(l => l.trim())
const classMap = new Map()
for (let i = 1; i < classLines.length; i++) {
  const parts = parseCsvLine(classLines[i])
  classMap.set(parts[0], { slug: parts[1], title: parts[2] })
}

const drafts = []
for (let i = 1; i < formatLines.length; i++) {
  const parts = parseCsvLine(formatLines[i])
  if (parts[2] === 'draft') {
    const id = parts[0]
    const title = parts[1]
    const cm = classMap.get(id)
    drafts.push({ id, title, slug: cm?.slug })
  }
}

console.log('Sample drafts:');
drafts.slice(0, 20).forEach(d => console.log(d.id, d.slug, `"${d.title}"`))
