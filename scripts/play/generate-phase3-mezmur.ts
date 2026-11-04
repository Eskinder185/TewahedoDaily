/**
 * Phase 3 Content Generator for Finish the Mezmur.
 * Produces 50 new verified songs from archive/local-data/chants/amharic-chants.json.
 * Validated with validateStudioDraft and buildFinishMezmurBank.
 */
import fs from 'node:fs'
import path from 'node:path'

process.env.VITE_SUPABASE_URL = 'https://content-studio-test.invalid'
process.env.VITE_SUPABASE_PUBLISHABLE_KEY = 'synthetic-public-key'

async function run() {
  const { validateStudioDraft } = await import('../../src/lib/play/contentStudio')
  const { buildFinishMezmurBank, usableLines } = await import('../../src/lib/play/finishMezmur')
  type MezmurSong = import('../../src/lib/play/finishMezmur').MezmurSong

  const rawChantsPath = path.join(process.cwd(), 'archive', 'local-data', 'chants', 'amharic-chants.json')
  const rawChants = JSON.parse(fs.readFileSync(rawChantsPath, 'utf8'))

  // Load existing songs from pilot and phase 2 to prevent duplicates
  const existingSlugs = new Set<string>()
  const p1Path = path.join(process.cwd(), 'artifacts', 'faith-challenges', 'mezmur', 'songs.json')
  if (fs.existsSync(p1Path)) {
    const p1: MezmurSong[] = JSON.parse(fs.readFileSync(p1Path, 'utf8'))
    p1.forEach(s => existingSlugs.add(s.slug))
  }
  const p2Path = path.join(process.cwd(), 'artifacts', 'faith-challenges', 'phase-2', 'mezmur', 'songs.json')
  if (fs.existsSync(p2Path)) {
    const p2: MezmurSong[] = JSON.parse(fs.readFileSync(p2Path, 'utf8'))
    p2.forEach(s => existingSlugs.add(s.slug))
  }

  console.log(`Initial existing mezmur songs: ${existingSlugs.size}`)

  const phase3Songs: MezmurSong[] = []
  for (const chant of rawChants) {
    if (phase3Songs.length >= 50) break
    const rawSlug = chant.id.toLowerCase().replace(/[^a-z0-9]+/g, '-').replace(/^-|-$/g, '')
    if (existingSlugs.has(rawSlug)) continue

    const song: MezmurSong = {
      slug: rawSlug,
      title: chant.title,
      title_amharic: chant.title,
      title_english: chant.transliterationTitle || null,
      primary_language: 'am',
      lyrics_amharic: chant.lyrics,
      lyrics_transliteration: chant.transliterationLyrics || null,
      lyrics_english: null,
      youtube_url: chant.youtubeUrl && chant.youtubeUrl.startsWith('https://') ? chant.youtubeUrl : null
    }

    const lines = usableLines(song)
    if (lines.length >= 5) {
      const errors = validateStudioDraft({ game: 'finish-the-mezmur', content: song })
      if (errors.length === 0) {
        phase3Songs.push(song)
        existingSlugs.add(rawSlug)
      }
    }
  }

  console.log(`=== VALIDATING FINISH THE MEZMUR PHASE 3 (${phase3Songs.length} SONGS) ===`)
  if (phase3Songs.length < 50) {
    console.warn(`Only found ${phase3Songs.length} eligible songs meeting >= 5 usable lines.`)
  }

  const chooseBank = buildFinishMezmurBank(phase3Songs, 'choose', 'easy')
  const arrangeBank = buildFinishMezmurBank(phase3Songs, 'arrange', 'medium')
  const typeBank = buildFinishMezmurBank(phase3Songs, 'type', 'hard')
  console.log(`Phase 3 Mezmur playable question pool: Choose=${chooseBank.length}, Arrange=${arrangeBank.length}, Type=${typeBank.length}`)

  // Save Mezmur artifacts
  const mezmurDir = path.join(process.cwd(), 'artifacts', 'faith-challenges', 'phase-3', 'mezmur')
  fs.mkdirSync(mezmurDir, { recursive: true })
  fs.writeFileSync(path.join(mezmurDir, 'songs.json'), JSON.stringify(phase3Songs, null, 2), 'utf8')
  fs.writeFileSync(path.join(mezmurDir, 'sample-questions.json'), JSON.stringify({
    choose: chooseBank.slice(0, 15),
    arrange: arrangeBank.slice(0, 10),
    type: typeBank.slice(0, 10)
  }, null, 2), 'utf8')
  fs.writeFileSync(path.join(mezmurDir, 'report.json'), JSON.stringify({
    generatedAt: new Date().toISOString(),
    game: 'finish-the-mezmur',
    phase: 3,
    acceptedSongsCount: phase3Songs.length,
    poolSize: { chooseEasy: chooseBank.length, arrangeMedium: arrangeBank.length, typeHard: typeBank.length },
    songs: phase3Songs.map(s => ({ slug: s.slug, title: s.title, transliteration: s.title_english, usableLines: usableLines(s).length })),
    validation: { isValid: true, errors: [] }
  }, null, 2), 'utf8')

  console.log(`Successfully generated and validated ${phase3Songs.length} Finish the Mezmur songs for Phase 3!`)
}

run().catch(err => {
  console.error('Error generating Phase 3 Mezmur:', err)
  process.exit(1)
})
