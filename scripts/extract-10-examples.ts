import * as fs from 'node:fs'

const preview = fs.readFileSync('MEZMUR_CORRECTED_PREVIEW.csv', 'utf8')

// Parse CSV
function parseCsv(csvText: string): Record<string, string>[] {
  const rows: string[][] = []
  let currentRow: string[] = []
  let currentField = ''
  let inQuotes = false

  for (let i = 0; i < csvText.length; i++) {
    const char = csvText[i]
    const next = csvText[i + 1]

    if (inQuotes) {
      if (char === '"' && next === '"') {
        currentField += '"'
        i++
      } else if (char === '"') {
        inQuotes = false
      } else {
        currentField += char
      }
    } else {
      if (char === '"') {
        inQuotes = true
      } else if (char === ',') {
        currentRow.push(currentField)
        currentField = ''
      } else if (char === '\n' || (char === '\r' && next === '\n')) {
        if (char === '\r') i++
        currentRow.push(currentField)
        currentField = ''
        if (currentRow.length > 1 || currentRow[0] !== '') {
          rows.push(currentRow)
        }
        currentRow = []
      } else {
        currentField += char
      }
    }
  }
  if (currentRow.length > 0 || currentField) {
    currentRow.push(currentField)
    rows.push(currentRow)
  }

  const headers = rows[0]
  const result: Record<string, string>[] = []
  for (let r = 1; r < rows.length; r++) {
    const row = rows[r]
    const obj: Record<string, string> = {}
    for (let c = 0; c < headers.length; c++) {
      obj[headers[c]] = row[c] ?? ''
    }
    result.push(obj)
  }
  return result
}

const rows = parseCsv(preview)
const slugs = [
  'yetewedede-ken-zemarit-betselot-asimare',
  'mariyam-nitsihit',
  'dej-tenahu-koyiche-kidane-mihiretin',
  'ete-mushraye-selomon-yalesh-ashenafi-gebremariam',
  'beritemiyos-negn-bupmngp_p5g',
  'tewedaj-yekidus-mikael-mezimurat-liredagn-meta-yeafomiya-eredat-neh-bebe',
  'abiet-neaka-zemarit-merry-temelso-eritrean-orthodox-tewahdo-mezmur',
  'aboy-mezimur-nay-nisiha-b-zemari-berehet-tikue-new-eritrean-orthodox-mez',
  'altewegnm-zemarit-fasika-mekonen',
  'adanegn-geta'
]

for (const s of slugs) {
  const r = rows.find(x => x.slug === s)
  if (!r) continue
  console.log(`### Example: ${r.title} (\`${r.slug}\`)`)
  if (r.amharic_changed === 'true') {
    console.log('**Amharic Before:**')
    console.log('```text')
    console.log(r.lyrics_amharic_original.slice(0, 150))
    console.log('```')
    console.log('**Amharic After:**')
    console.log('```text')
    console.log(r.lyrics_amharic_corrected.slice(0, 150))
    console.log('```')
  }
  if (r.transliteration_changed === 'true') {
    console.log('**Transliteration Before:**')
    console.log('```text')
    console.log(r.lyrics_transliteration_original.slice(0, 150))
    console.log('```')
    console.log('**Transliteration After:**')
    console.log('```text')
    console.log(r.lyrics_transliteration_corrected.slice(0, 150))
    console.log('```')
  }
  console.log('\n---\n')
}
