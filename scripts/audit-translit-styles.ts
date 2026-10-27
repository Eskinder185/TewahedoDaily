import { createClient } from '@supabase/supabase-js'
import * as fs from 'node:fs'

const env = fs.readFileSync('.env.local', 'utf8')
let url = '', key = ''
for (const line of env.split('\n')) {
  if (line.startsWith('VITE_SUPABASE_URL=')) url = line.split('=')[1].trim()
  if (line.startsWith('VITE_SUPABASE_PUBLISHABLE_KEY=')) key = line.split('=')[1].trim()
}
const sb = createClient(url, key)

async function run() {
  let all: any[] = []
  let page = 0
  while (true) {
    const { data, error } = await sb.from('mezmur_public')
      .select('mezmur_id, slug, title, lyrics_amharic, lyrics_transliteration')
      .range(page * 500, (page + 1) * 500 - 1)
    if (error) throw error
    if (!data || data.length === 0) break
    all.push(...data)
    if (data.length < 500) break
    page++
  }

  let withStraightApos = 0
  let withCurlyApos = 0
  let withTs = 0
  let withT_Apos = 0
  let withCh_Apos = 0
  let sampleStanzas: string[] = []

  for (const r of all) {
    const tr = r.lyrics_transliteration || ''
    if (tr.includes("'")) withStraightApos++
    if (tr.includes('’') || tr.includes('‘')) withCurlyApos++
    if (/\bts\b|\bts[aeiou]/i.test(tr)) withTs++
    if (/t’|t'/i.test(tr)) withT_Apos++
    if (/ch’|ch'/i.test(tr)) withCh_Apos++
    if (sampleStanzas.length < 10 && tr.length > 50) {
      sampleStanzas.push(`[${r.slug}]\n` + tr.split('\n').slice(0, 5).join('\n'))
    }
  }

  console.log('Total with transliteration:', all.filter(r => r.lyrics_transliteration).length)
  console.log({
    withStraightApos,
    withCurlyApos,
    withTs,
    withT_Apos,
    withCh_Apos
  })
  console.log('\nSample stanzas:')
  for (const s of sampleStanzas) {
    console.log('------------------------------------')
    console.log(s)
  }
}

run().catch(console.error)
