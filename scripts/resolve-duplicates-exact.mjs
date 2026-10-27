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

const formatRecords = parseCsv('C:/Users/eskew/Downloads/mezmur-lyrics-format-2026-10-25.csv')
const formatMap = new Map()
for (const r of formatRecords) {
  formatMap.set(r['Mezmur ID'], r)
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

const dbSlugMap = new Map()
for (let i = 1; i < classLines.length; i++) {
  const parts = parseCsvLine(classLines[i])
  const id = parts[0]
  const slug = parts[1]
  const title = parts[2]
  if (!dbSlugMap.has(slug)) dbSlugMap.set(slug, [])
  dbSlugMap.get(slug).push({ id, title })
}

const dbDups = [...dbSlugMap.entries()].filter(([s, list]) => list.length > 1)

// Parse SQL statements to get the lyrics being updated for each slug
const sql = readFileSync('supabase/mezmur-import/APPLY_ALL_MEZMUR_LYRICS_AND_TRANSLITERATIONS.sql', 'utf8')
const sqlMap = new Map()
for (const l of sql.split(/\r?\n/)) {
  const m = l.match(/where slug = '([^']+)'/i)
  if (m) {
    sqlMap.set(m[1], l)
  }
}

// Check backup
const backupLines = readFileSync('audit/mezmur-complete-repair/ORIGINAL_BACKUP.jsonl', 'utf8').split(/\r?\n/).filter(Boolean)
const backupMap = new Map()
for (const l of backupLines) {
  const obj = JSON.parse(l)
  if (obj.slug) backupMap.set(obj.slug, obj)
}

console.log('Resolving 28 Duplicate Slugs:')
const resolutions = []
for (const [slug, list] of dbDups) {
  const pubRec = list.find(r => formatMap.get(r.id)?.['Publication status'] === 'published')
  const draftRec = list.find(r => formatMap.get(r.id)?.['Publication status'] === 'draft')
  const sqlStatement = sqlMap.get(slug)
  const backup = backupMap.get(slug)

  resolutions.push({
    slug,
    pub_uuid: pubRec?.id,
    pub_title: pubRec?.title,
    draft_uuid: draftRec?.id,
    draft_title: draftRec?.title,
    backup_status: backup?.status,
    backup_title: backup?.title,
    has_sql: !!sqlStatement
  })
}

resolutions.forEach((r, idx) => {
  console.log(`${idx + 1}. [${r.slug}]`)
  console.log(`   Published UUID: ${r.pub_uuid} ("${r.pub_title}")`)
  console.log(`   Draft UUID:     ${r.draft_uuid} ("${r.draft_title}")`)
  console.log(`   Backup Status:  ${r.backup_status} ("${r.backup_title}")`)
})
