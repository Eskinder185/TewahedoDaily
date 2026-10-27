import { readFileSync } from 'node:fs'

const classFile = 'C:/Users/eskew/Downloads/mezmur-classification-2026-10-25 (7).csv'
const classLines = readFileSync(classFile, 'utf8').split(/\r?\n/).filter(l => l.trim())

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

const classIds = new Set()
const classMap = new Map()
for (let i = 1; i < classLines.length; i++) {
  const p = parseCsvLine(classLines[i])
  classIds.add(p[0])
  classMap.set(p[0], { import_id: p[0], slug: p[1], title: p[2] })
}

const formatIds = new Set()
for (let i = 1; i < formatLines.length; i++) {
  const p = parseCsvLine(formatLines[i])
  formatIds.add(p[0])
}

console.log('Class IDs count:', classIds.size)
console.log('Format IDs count:', formatIds.size)

const inClassNotFormat = [...classIds].filter(id => !formatIds.has(id))
console.log('In class but not in format (count):', inClassNotFormat.length)
inClassNotFormat.forEach(id => {
  const rec = classMap.get(id)
  console.log(`  id: ${id} | slug: ${rec.slug} | title: ${rec.title}`)
})

const inFormatNotClass = [...formatIds].filter(id => !classIds.has(id))
console.log('In format but not in class (count):', inFormatNotClass.length)
