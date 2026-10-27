import { createClient } from '@supabase/supabase-js'
import { readFileSync, existsSync } from 'node:fs'

let url = '', key = ''
for (const f of ['.env.local', '.env']) {
  if (!existsSync(f)) continue
  for (const line of readFileSync(f, 'utf8').split(/\r?\n/)) {
    const eq = line.indexOf('=')
    if (eq === -1 || line.trim().startsWith('#')) continue
    const name = line.slice(0, eq).trim()
    let val = line.slice(eq + 1).trim()
    if ((val.startsWith('"') && val.endsWith('"')) || (val.startsWith("'") && val.endsWith("'"))) val = val.slice(1, -1)
    if (name === 'VITE_SUPABASE_URL') url = val
    if (name === 'VITE_SUPABASE_PUBLISHABLE_KEY' || name === 'VITE_SUPABASE_ANON_KEY') key = val
  }
}

if (!url || !key) {
  console.log('No supabase credentials found in .env.local')
  process.exit(1)
}

const sb = createClient(url, key)
// Fetch all public mezmurs
let allData = []
let page = 0
const pageSize = 500
while (true) {
  const { data, error } = await sb
    .from('mezmur_public')
    .select('mezmur_id, slug, title, title_amharic, lyrics_amharic, lyrics_transliteration, lyrics_english, status')
    .range(page * pageSize, (page + 1) * pageSize - 1)
  
  if (error) {
    console.error('Error fetching mezmur_public:', error)
    break
  }
  if (!data || data.length === 0) break
  allData.push(...data)
  if (data.length < pageSize) break
  page++
}

const data = allData

console.log('Total mezmurs fetched from mezmur_data_import:', data.length)

let withAmharic = 0
let withTranslit = 0
let withEnglish = 0
let hasChorusHeading = 0
let hasAzmachHeading = 0
let hasVerseHeading = 0
let hasRepeatedChoruses = 0

const samplesWithRepeatedChoruses = []

for (const m of data) {
  if (m.lyrics_amharic) withAmharic++
  if (m.lyrics_transliteration) withTranslit++
  if (m.lyrics_english) withEnglish++

  const textAm = m.lyrics_amharic || ''
  const textTr = m.lyrics_transliteration || ''

  if (/(?:^|\n)\s*(?:\[?chorus(?:\s*\d+)?\]?|chorus\b)/i.test(textAm + '\n' + textTr)) hasChorusHeading++
  if (/(?:^|\n)\s*(?:\[?(?:አዝማች|አዝ)(?:\s*[፩-፲\d]+)?\]?)/i.test(textAm)) hasAzmachHeading++
  if (/(?:^|\n)\s*(?:\[?verse(?:\s*\d+)?\]?|ቁጥር(?:\s*[፩-፲\d]+)?)/i.test(textAm + '\n' + textTr)) hasVerseHeading++

  // Check for repeated blocks in lyrics_amharic
  const blocks = textAm.trim().split(/\r?\n\s*\r?\n+/).map(b => b.trim()).filter(Boolean)
  const normalizedBlocks = blocks.map(b => {
    // Strip standalone structural heading if present
    const lines = b.split(/\r?\n/).map(l => l.trim()).filter(Boolean)
    if (/^(?:\[?(?:chorus|refrain|verse|bridge|ቁጥር|አዝማች|አዝ|መልስ|ምላሽ)(?:\s*(\d+|[፩-፲]+))?\]?)[_\s:.-]*$/i.test(lines[0] || '')) {
      return lines.slice(1).join('\n')
    }
    return lines.join('\n')
  })

  // Check if any block appears > 1 time
  const counts = new Map()
  let hasDup = false
  for (const nb of normalizedBlocks) {
    if (!nb) continue
    const c = (counts.get(nb) || 0) + 1
    counts.set(nb, c)
    if (c > 1) hasDup = true
  }

  if (hasDup) {
    hasRepeatedChoruses++
    if (samplesWithRepeatedChoruses.length < 5) {
      samplesWithRepeatedChoruses.push({
        slug: m.slug,
        title: m.title,
        title_amharic: m.title_amharic,
        blockCount: blocks.length,
        blocks: blocks.slice(0, 6)
      })
    }
  }
}

console.log({
  total: data.length,
  withAmharic,
  withTranslit,
  withEnglish,
  hasChorusHeading,
  hasAzmachHeading,
  hasVerseHeading,
  hasRepeatedChoruses
})

console.log('\n--- Sample Mezmurs with Repeated Blocks ---')
for (const s of samplesWithRepeatedChoruses) {
  console.log(`\n=== [${s.slug}] ${s.title} (${s.title_amharic}) - ${s.blockCount} blocks ===`)
  s.blocks.forEach((b, i) => {
    console.log(`Block ${i + 1}:\n${b.slice(0, 120)}...\n`)
  })
}
