import { createClient } from '@supabase/supabase-js'
import * as fs from 'node:fs'
import { parseStructuredLyrics } from '../src/lib/mezmur/structuredLyricsParser.ts'

// Read env
const env = fs.readFileSync('.env.local', 'utf8')
let url = '', key = ''
for (const line of env.split('\n')) {
  if (line.startsWith('VITE_SUPABASE_URL=')) url = line.split('=')[1].trim()
  if (line.startsWith('VITE_SUPABASE_PUBLISHABLE_KEY=')) key = line.split('=')[1].trim()
}
const sb = createClient(url, key)

async function fetchAll() {
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
  return all
}

async function run() {
  const mezmurs = await fetchAll()
  console.log('Total records:', mezmurs.length)

  // 1. Coverage
  let withAm = 0, withTr = 0, withBoth = 0, withNeither = 0
  let perfectAlignment = 0, sectionMismatch = 0, lineMismatch = 0

  // 2. Formatting issues
  let trSingleParagraph = 0
  let trHasChorusHeading = 0
  let trHasVerseHeading = 0
  let amHasChorusHeading = 0
  let amHasVerseHeading = 0
  let trInconsistentPunctuation = 0
  let amCorruptChars = 0
  let amLatinChars = 0

  // 3. Sacred term spelling variations in transliteration
  const termCounts = {
    maryam: { Maryam: 0, Mariam: 0, Mariyam: 0, other: 0 },
    egziabher: { Egziabher: 0, Egziabiher: 0, Igziabher: 0, other: 0 },
    kristos: { Kristos: 0, Christos: 0, Kirstos: 0, other: 0 },
    tewahedo: { Tewahedo: 0, Tewahdo: 0, Tewahido: 0, other: 0 },
    kidus: { Kidus: 0, Qidus: 0, Qeddus: 0, other: 0 },
    silassie: { Silassie: 0, Selassie: 0, Silase: 0, other: 0 },
  }

  for (const m of mezmurs) {
    const am = m.lyrics_amharic?.trim() || ''
    const tr = m.lyrics_transliteration?.trim() || ''

    if (am && tr) withBoth++
    else if (am) withAm++
    else if (tr) withTr++
    else withNeither++

    if (am && tr) {
      const parsed = parseStructuredLyrics(am, tr)
      if (parsed.alignmentStatus === 'perfect_match') perfectAlignment++
      else if (parsed.alignmentStatus === 'section_mismatch') sectionMismatch++
      else if (parsed.alignmentStatus === 'line_mismatch') lineMismatch++
    }

    if (tr) {
      if (!tr.includes('\n') && tr.length > 100) trSingleParagraph++
      if (/\b(CHORUS|refrain)\b/i.test(tr)) trHasChorusHeading++
      if (/\bVERSE\s*\d+\b/i.test(tr)) trHasVerseHeading++
      if (/[,.][a-zA-Z]|\s[,.]/.test(tr)) trInconsistentPunctuation++

      // Count term variations
      if (/\bmaryam\b/i.test(tr)) {
        if (/\bMaryam\b/.test(tr)) termCounts.maryam.Maryam++
        else if (/\bMariam\b/.test(tr)) termCounts.maryam.Mariam++
        else if (/\bMariyam\b/.test(tr)) termCounts.maryam.Mariyam++
        else termCounts.maryam.other++
      }
      if (/\begziab/i.test(tr) || /\bigziab/i.test(tr)) {
        if (/\bEgziabher\b/.test(tr)) termCounts.egziabher.Egziabher++
        else if (/\bEgziabiher\b/.test(tr)) termCounts.egziabher.Egziabiher++
        else if (/\bIgziabher\b/.test(tr)) termCounts.egziabher.Igziabher++
        else termCounts.egziabher.other++
      }
      if (/\bkristos\b/i.test(tr) || /\bchristos\b/i.test(tr)) {
        if (/\bKristos\b/.test(tr)) termCounts.kristos.Kristos++
        else if (/\bChristos\b/.test(tr)) termCounts.kristos.Christos++
        else if (/\bKirstos\b/.test(tr)) termCounts.kristos.Kirstos++
        else termCounts.kristos.other++
      }
      if (/\btewah/i.test(tr)) {
        if (/\bTewahedo\b/.test(tr)) termCounts.tewahedo.Tewahedo++
        else if (/\bTewahdo\b/.test(tr)) termCounts.tewahedo.Tewahdo++
        else if (/\bTewahido\b/.test(tr)) termCounts.tewahedo.Tewahido++
        else termCounts.tewahedo.other++
      }
    }

    if (am) {
      if (/\b(CHORUS|አዝማች)\b/i.test(am)) amHasChorusHeading++
      if (/\bVERSE\s*\d+\b/i.test(am)) amHasVerseHeading++
      if (/[\uFFFD]/.test(am)) amCorruptChars++
      if (/[a-zA-Z]/.test(am)) amLatinChars++
    }
  }

  console.log('\n--- COVERAGE ---')
  console.log({ withBoth, withAmOnly: withAm, withTrOnly: withTr, withNeither })

  console.log('\n--- ALIGNMENT (for withBoth = ' + withBoth + ') ---')
  console.log({ perfectAlignment, sectionMismatch, lineMismatch })

  console.log('\n--- FORMATTING & ISSUES ---')
  console.log({
    trSingleParagraph,
    trHasChorusHeading,
    trHasVerseHeading,
    amHasChorusHeading,
    amHasVerseHeading,
    trInconsistentPunctuation,
    amCorruptChars,
    amLatinChars,
  })

  console.log('\n--- SACRED TERM SPELLING IN TRANSLITERATION ---')
  console.log(JSON.stringify(termCounts, null, 2))
}

run().catch(console.error)
