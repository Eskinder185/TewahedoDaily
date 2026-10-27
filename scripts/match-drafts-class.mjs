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

const classRecords = []
const classBySlug = new Map()
const classById = new Map()
for (let i = 1; i < classLines.length; i++) {
  const p = parseCsvLine(classLines[i])
  const r = { import_id: p[0], slug: p[1], title: p[2] }
  classRecords.push(r)
  if (!classBySlug.has(r.slug)) classBySlug.set(r.slug, [])
  classBySlug.get(r.slug).push(r)
  classById.set(r.import_id, r)
}

const lines = readFileSync('audit/mezmur-complete-repair/ORIGINAL_BACKUP.jsonl', 'utf8').split(/\r?\n/).filter(Boolean)
const records = lines.map(l => JSON.parse(l))
const draftsWithLyrics = records.filter(r => r.status === 'draft' && (r.lyrics_amharic || r.lyrics_geez || r.lyrics_tigrinya || r.lyrics_english || r.lyrics_oromo))

const unmatched = []
for (const d of draftsWithLyrics) {
  const matches = classBySlug.get(d.slug) || []
  if (matches.length === 0) {
    unmatched.push(d)
  }
}

console.log('Total drafts with lyrics:', draftsWithLyrics.length)
console.log('Unmatched drafts by slug:', unmatched.length)
unmatched.forEach(u => console.log('unmatched:', u.slug, `"${u.title}"`, 'import_id in backup:', u.import_id))
