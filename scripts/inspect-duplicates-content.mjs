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
  classRecords.push({ import_id: parts[0], slug: parts[1], title: parts[2] })
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

// Sources
const eotcWithLyrics = parseCsv('data/imports/eotcmedia/eotcmedia_supabase_mezmurs_with_lyrics.csv')
const codexMezmur = parseCsv('C:/Users/eskew/Documents/Codex/2026-09-29/files-mentioned-by-the-user-amharic/outputs/mezmur_data.csv')
const export889 = parseCsv('C:/Users/eskew/Downloads/tewahedodaily_mezmur_data_import_889.csv')

console.log('Comparing 28 duplicate slugs between Published and Draft:')
for (const [slug, list] of dups) {
  const pubItem = list.find(item => formatMap.get(item.import_id)?.['Publication status'] === 'published')
  const draftItem = list.find(item => formatMap.get(item.import_id)?.['Publication status'] === 'draft')

  const eotcMatches = eotcWithLyrics.filter(r => r.slug === slug)
  const codexMatches = codexMezmur.filter(r => r.slug === slug)
  const exportMatches = export889.filter(r => r.slug === slug)

  console.log(`\n=== SLUG: ${slug} ===`)
  console.log(`  Published UUID: ${pubItem?.import_id} | Title: "${pubItem?.title}"`)
  console.log(`  Draft UUID:     ${draftItem?.import_id} | Title: "${draftItem?.title}"`)
  console.log(`  Occurrences: eotc=${eotcMatches.length}, codex=${codexMatches.length}, export889=${exportMatches.length}`)
  
  if (exportMatches[0]) {
    console.log(`    export889: title="${exportMatches[0].title}", lyrics="${exportMatches[0].lyrics_amharic?.slice(0, 40).replace(/\n/g, ' ')}"`)
  }
  if (codexMatches[0]) {
    console.log(`    codex:     title="${codexMatches[0].title}", lyrics="${codexMatches[0].lyrics_amharic?.slice(0, 40).replace(/\n/g, ' ')}"`)
  }
}
