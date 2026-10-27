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

const sb = createClient(url, key)

let allData = []
let page = 0
const pageSize = 500
while (true) {
  const { data, error } = await sb
    .from('mezmur_public')
    .select('mezmur_id, slug, title, title_amharic, lyrics_amharic, lyrics_transliteration, lyrics_english, lyrics_geez, lyrics_oromo')
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

console.log('Total fetched records:', allData.length)

// Analyze structure of blocks
const CHORUS_HEADING_REGEX = /^(?:\[?(?:chorus|refrain|አዝማች|አዝ|መልስ|ምላሽ)(?:\s*(\d+|[፩-፲]+))?\]?)[_\s:.-]*$/i
const VERSE_HEADING_REGEX = /^(?:\[?(?:verse|ቁጥር)(?:\s*(\d+|[፩-፲]+))?\]?)[_\s:.-]*$/i
const ANY_HEADING_REGEX = /^(?:\[?(?:chorus|refrain|verse|bridge|intro|outro|ቁጥር|አዝማች|አዝ|መልስ|ምላሽ)(?:\s*(\d+|[፩-፲]+))?\]?)[_\s:.-]*$/i

let startsWithChorus = 0
let startsWithVerse = 0
let startsWithOther = 0
let multipleUniqueChoruses = 0
let chorusWithoutHeading = 0

const patterns = new Map()

for (const m of allData) {
  const lyrics = m.lyrics_amharic || m.lyrics_transliteration || ''
  if (!lyrics.trim()) continue

  const blocks = lyrics.trim().split(/\r?\n\s*\r?\n+/).map(b => b.trim()).filter(Boolean)
  if (blocks.length === 0) continue

  const blockKinds = blocks.map(b => {
    const lines = b.split(/\r?\n/).map(l => l.trim()).filter(Boolean)
    const firstLine = lines[0] || ''
    if (CHORUS_HEADING_REGEX.test(firstLine)) return 'CHORUS'
    if (VERSE_HEADING_REGEX.test(firstLine)) return 'VERSE'
    if (ANY_HEADING_REGEX.test(firstLine)) return 'OTHER'
    return 'NO_HEADING'
  })

  const signature = blockKinds.join(' -> ')
  // simplify signature for tallying: e.g. C -> V -> C -> V -> C -> V
  const simplified = blockKinds.map(k => k[0]).join('')
  patterns.set(simplified, (patterns.get(simplified) || 0) + 1)

  if (blockKinds[0] === 'CHORUS') startsWithChorus++
  else if (blockKinds[0] === 'VERSE') startsWithVerse++
  else startsWithOther++

  // Check if there are different chorus lyrics
  const chorusBlocks = []
  blocks.forEach(b => {
    const lines = b.split(/\r?\n/).map(l => l.trim()).filter(Boolean)
    if (CHORUS_HEADING_REGEX.test(lines[0] || '')) {
      chorusBlocks.push(lines.slice(1).join('\n'))
    }
  })

  const uniqueChoruses = new Set(chorusBlocks)
  if (uniqueChoruses.size > 1) {
    multipleUniqueChoruses++
  }
}

console.log('Structure statistics:', {
  startsWithChorus,
  startsWithVerse,
  startsWithOther,
  multipleUniqueChoruses,
})

const otherSamples = []
const noHeadingSamples = []

for (const m of allData) {
  const lyrics = m.lyrics_amharic || m.lyrics_transliteration || ''
  if (!lyrics.trim()) continue
  const blocks = lyrics.trim().split(/\r?\n\s*\r?\n+/).map(b => b.trim()).filter(Boolean)
  if (blocks.length === 0) continue
  const firstLine = blocks[0].split(/\r?\n/)[0].trim()
  if (!CHORUS_HEADING_REGEX.test(firstLine) && !VERSE_HEADING_REGEX.test(firstLine)) {
    if (blocks.length === 1) noHeadingSamples.push({ slug: m.slug, title: m.title, preview: blocks[0].slice(0, 100) })
    else otherSamples.push({ slug: m.slug, title: m.title, firstLine, blockCount: blocks.length, preview: blocks[0].slice(0, 100) })
  }
}

console.log('Other samples count:', otherSamples.length)
console.log(otherSamples.slice(0, 5))
console.log('No-heading single block count:', noHeadingSamples.length)
console.log(noHeadingSamples.slice(0, 5))
