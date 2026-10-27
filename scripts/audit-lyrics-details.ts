import { createClient } from '@supabase/supabase-js'
import * as fs from 'node:fs'
import { parseStructuredLyrics } from '../src/lib/mezmur/structuredLyricsParser.ts'

const env = fs.readFileSync('.env.local', 'utf8')
let url = '', key = ''
for (const line of env.split('\n')) {
  if (line.startsWith('VITE_SUPABASE_URL=')) url = line.split('=')[1].trim()
  if (line.startsWith('VITE_SUPABASE_PUBLISHABLE_KEY=')) key = line.split('=')[1].trim()
}
const sb = createClient(url, key)

async function run() {
  let all = []
  let page = 0
  while (true) {
    const { data, error } = await sb.from('mezmur_public')
      .select('mezmur_id, slug, title, title_amharic, status, lyrics_amharic, lyrics_transliteration, lyrics_english, lyrics_geez, lyrics_oromo')
      .range(page * 500, (page + 1) * 500 - 1)
    if (error) throw error
    if (!data || data.length === 0) break
    all.push(...data)
    if (data.length < 500) break
    page++
  }

  // 1. Inspect corrupt chars
  console.log('=== CORRUPT CHARACTERS IN AMHARIC (\\uFFFD) ===')
  for (const m of all) {
    if (m.lyrics_amharic && m.lyrics_amharic.includes('\uFFFD')) {
      console.log(`Slug: ${m.slug}, Title: ${m.title}`)
      const lines = m.lyrics_amharic.split('\n').filter(l => l.includes('\uFFFD'))
      console.log('  Corrupt lines:', lines)
    }
  }

  // 2. Section mismatches
  console.log('\n=== SECTION MISMATCHES ===')
  for (const m of all) {
    if (m.lyrics_amharic && m.lyrics_transliteration) {
      const p = parseStructuredLyrics(m.lyrics_amharic, m.lyrics_transliteration)
      if (p.alignmentStatus === 'section_mismatch') {
        console.log(`Slug: ${m.slug}, Title: ${m.title}`)
        console.log('  Mismatches:', p.mismatches)
      }
    }
  }

  // 3. Inspect amHaric only and transliteration only
  console.log('\n=== AMHARIC ONLY ===')
  for (const m of all) {
    if (m.lyrics_amharic?.trim() && !m.lyrics_transliteration?.trim()) {
      console.log(`Slug: ${m.slug}, Title: ${m.title}`)
    }
  }
  console.log('\n=== TRANSLITERATION ONLY ===')
  for (const m of all) {
    if (!m.lyrics_amharic?.trim() && m.lyrics_transliteration?.trim()) {
      console.log(`Slug: ${m.slug}, Title: ${m.title}`)
    }
  }
}

run().catch(console.error)
