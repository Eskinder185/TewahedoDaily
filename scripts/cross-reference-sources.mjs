import { readFileSync, existsSync } from 'node:fs'

const classFile = 'C:/Users/eskew/Downloads/mezmur-classification-2026-10-25 (7).csv'
const classLines = readFileSync(classFile, 'utf8').split(/\r?\n/).filter(l => l.trim())

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

const eotcWithLyrics = parseCsv('data/imports/eotcmedia/eotcmedia_supabase_mezmurs_with_lyrics.csv')
const codexMezmur = parseCsv('C:/Users/eskew/Documents/Codex/2026-09-29/files-mentioned-by-the-user-amharic/outputs/mezmur_data.csv')
const export889 = parseCsv('C:/Users/eskew/Downloads/tewahedodaily_mezmur_data_import_889.csv')

console.log('eotcWithLyrics:', eotcWithLyrics.length)
console.log('codexMezmur:', codexMezmur.length)
console.log('export889:', export889.length)

// Let's check aman-beaman across all 3
console.log('\n--- aman-beaman in eotcWithLyrics ---')
eotcWithLyrics.filter(r => r.slug === 'aman-beaman').forEach(r => console.log('eotc:', r.slug, r.title, r.lyrics_amharic?.slice(0, 50)))

console.log('\n--- aman-beaman in codexMezmur ---')
codexMezmur.filter(r => r.slug === 'aman-beaman').forEach(r => console.log('codex:', r.slug, r.title, r.lyrics_amharic?.slice(0, 50)))

console.log('\n--- aman-beaman in export889 ---')
export889.filter(r => r.slug === 'aman-beaman').forEach(r => console.log('889:', r.slug, r.title, r.lyrics_amharic?.slice(0, 50)))
