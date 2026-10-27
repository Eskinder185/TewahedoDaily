import { readFileSync, existsSync } from 'node:fs'
import { createHash } from 'node:crypto'

function sha256(data) {
  return createHash('sha256').update(typeof data === 'string' ? data : JSON.stringify(data)).digest('hex')
}

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

// 1. Load classification DB records (1,152 rows)
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

const dbRecords = []
for (let i = 1; i < classLines.length; i++) {
  const parts = parseCsvLine(classLines[i])
  dbRecords.push({
    import_id: parts[0],
    slug: parts[1],
    title: parts[2],
    primary_category: parts[3],
    additional_categories: parts[4],
    primary_occasion: parts[5],
    additional_occasions: parts[6]
  })
}

// 2. Load lyrics format metadata
const formatRecords = parseCsv('C:/Users/eskew/Downloads/mezmur-lyrics-format-2026-10-25.csv')
const formatMap = new Map()
for (const r of formatRecords) {
  formatMap.set(r['Mezmur ID'], r)
}

// 3. Load backup records
const backupLines = readFileSync('audit/mezmur-complete-repair/ORIGINAL_BACKUP.jsonl', 'utf8').split(/\r?\n/).filter(Boolean)
const backupRecords = backupLines.map(l => JSON.parse(l))

// 4. Load human review records
const hrLines = readFileSync('audit/mezmur-complete-repair/HUMAN_REVIEW_REQUIRED.csv', 'utf8').split(/\r?\n/).filter(Boolean)
const hrSet = new Set()
for (let i = 1; i < hrLines.length; i++) {
  const parts = parseCsvLine(hrLines[i])
  hrSet.add(parts[1]) // slug
}

// Group DB records by slug
const dbBySlug = new Map()
for (const r of dbRecords) {
  if (!dbBySlug.has(r.slug)) dbBySlug.set(r.slug, [])
  dbBySlug.get(r.slug).push(r)
}

// Match proposed updates from backup & SQL
let matchedCount = 0
let unmappedCount = 0
let duplicateSlugCount = 0
let hrCount = 0

const mappings = []
for (const b of backupRecords) {
  if (!b.slug) continue // skip empty drafts
  const hasLyrics = !!(b.lyrics_amharic || b.lyrics_geez || b.lyrics_tigrinya || b.lyrics_english || b.lyrics_oromo)
  if (!hasLyrics) continue // only records with lyrics had updates

  const dbMatches = dbBySlug.get(b.slug) || []
  let resolvedId = null
  let isDup = dbMatches.length > 1
  let resolutionStatus = ''

  if (dbMatches.length === 1) {
    resolvedId = dbMatches[0].import_id
    resolutionStatus = 'auto_matched_unique'
  } else if (dbMatches.length > 1) {
    duplicateSlugCount++
    // Match by status (published) and title
    const pubMatch = dbMatches.find(m => formatMap.get(m.import_id)?.['Publication status'] === 'published')
    if (pubMatch) {
      resolvedId = pubMatch.import_id
      resolutionStatus = 'auto_matched_duplicate_slug_resolved'
    } else {
      resolutionStatus = 'ambiguous_duplicate_slug'
    }
  } else {
    resolutionStatus = 'unmapped'
  }

  const isHr = hrSet.has(b.slug)
  if (isHr) {
    hrCount++
    resolutionStatus = 'human_review_required'
  }

  if (resolvedId) {
    matchedCount++
    mappings.push({
      import_id: resolvedId,
      slug: b.slug,
      title: b.title,
      status: b.status,
      is_duplicate_slug: isDup,
      resolution_status: resolutionStatus,
      is_human_review: isHr
    })
  } else {
    unmappedCount++
    console.warn(`Unmapped slug: ${b.slug}`)
  }
}

console.log('--- RECONCILIATION SUMMARY ---')
console.log('Total updates matched with UUIDs:', matchedCount)
console.log('Unmapped updates:', unmappedCount)
console.log('Duplicate slugs encountered:', duplicateSlugCount)
console.log('Human review records flagged:', hrCount)
console.log('Safe automatic update records:', matchedCount - hrCount)
