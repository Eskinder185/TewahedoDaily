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

const formatFile = 'C:/Users/eskew/Downloads/mezmur-lyrics-format-2026-10-25.csv'
const formatLines = readFileSync(formatFile, 'utf8').split(/\r?\n/).filter(l => l.trim())
const formatMap = new Map()
for (let i = 1; i < formatLines.length; i++) {
  const p = parseCsvLine(formatLines[i])
  formatMap.set(p[0], { title: p[1], status: p[2], result: p[10] })
}

const classBySlug = new Map()
for (const r of allClassRecords) {
  if (!classBySlug.has(r.slug)) classBySlug.set(r.slug, [])
  classBySlug.get(r.slug).push(r)
}

const dups = [...classBySlug.entries()].filter(([s, list]) => list.length > 1)
console.log('Duplicate slugs:', dups.length)
const dupDraftIds = new Set()
for (const [s, list] of dups) {
  const draftItem = list.find(r => formatMap.get(r.import_id)?.status === 'draft')
  if (draftItem) dupDraftIds.add(draftItem.import_id)
}
console.log('Duplicate draft IDs count:', dupDraftIds.size)

// The 5 no lyrics records
const noLyricsIds = new Set([
  '0dd181cb-232e-4955-b73d-004df23ecabd', // mudaye-mena
  '3bf00467-dfdb-4021-a902-228d8998643e', // nu-beegziaber-des-yibelen
  'db0d58ad-7215-4021-9c69-36ed63ef4908', // adergehlegnal-ena-amesegnalew
  'f1e46b92-b413-4d94-9d5d-bd1f6ea32557', // titnash-gerum-new
  'ffc11e6d-4380-4287-9c81-16374fb47f68'  // silassen-amesgnu
])

// The remaining records in allClassRecords:
const targetEligibleRecords = allClassRecords.filter(r => !dupDraftIds.has(r.import_id) && !noLyricsIds.has(r.import_id))
console.log('Target eligible records in DB:', targetEligibleRecords.length)

// Are there any duplicate slugs among targetEligibleRecords?
const targetSlugs = new Set()
let dupTargetSlugs = 0
for (const r of targetEligibleRecords) {
  if (targetSlugs.has(r.slug)) dupTargetSlugs++
  targetSlugs.add(r.slug)
}
console.log('Duplicate slugs among target eligible records:', dupTargetSlugs)
