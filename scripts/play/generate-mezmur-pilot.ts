/**
 * Generates and validates Finish the Mezmur pilot batch (10 verified Mezmur songs).
 * Fully conforms to validateStudioDraft for 'finish-the-mezmur' and verifies
 * that buildFinishMezmurBank can build playable questions.
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

  const candidateIds = [
    'elel-belu',
    'anchin-yeyaze-sew',
    'yiberal-bekinfu',
    'ende-egziabeher-yale-manim-yelem-na',
    'bale-wuletaye',
    'simih-behulu-temesgene',
    'enat-alegn-yemitabis-inba',
    'dengel-weladite-kal',
    'eyakem-we-hana',
    'kaln-lemwled'
  ]

  const songs: MezmurSong[] = []

  for (const id of candidateIds) {
    const found = rawChants.find((c: any) => c.id === id)
    if (!found) throw new Error(`Mezmur not found in chants: ${id}`)

    const song: MezmurSong = {
      slug: found.id.toLowerCase().replace(/[^a-z0-9]+/g, '-').replace(/^-|-$/g, ''),
      title: found.title,
      title_amharic: found.title,
      title_english: found.transliterationTitle || null,
      primary_language: 'am',
      lyrics_amharic: found.lyrics,
      lyrics_transliteration: found.transliterationLyrics || null,
      lyrics_english: null,
      youtube_url: found.youtubeUrl && found.youtubeUrl.startsWith('https://') ? found.youtubeUrl : null
    }

    songs.push(song)
  }

  console.log(`=== VALIDATING FINISH THE MEZMUR PILOT (${songs.length} SONGS) ===`)
  for (const song of songs) {
    const lines = usableLines(song)
    if (lines.length < 5) {
      console.error(`Song ${song.slug} has fewer than 5 usable lines: ${lines.length}`)
      process.exit(1)
    }
    const errors = validateStudioDraft({ game: 'finish-the-mezmur', content: song })
    if (errors.length > 0) {
      console.error(`Studio draft validation failed for ${song.slug}:`, errors)
      process.exit(1)
    }
  }

  // Generate question banks to verify playability across modes
  const chooseBank = buildFinishMezmurBank(songs, 'choose', 'easy')
  const arrangeBank = buildFinishMezmurBank(songs, 'arrange', 'medium')
  const typeBank = buildFinishMezmurBank(songs, 'type', 'hard')

  console.log(`Generated Mezmur playable question pool: Choose=${chooseBank.length}, Arrange=${arrangeBank.length}, Type=${typeBank.length}`)

  const outDir = path.join(process.cwd(), 'artifacts', 'faith-challenges', 'mezmur')
  fs.mkdirSync(outDir, { recursive: true })

  fs.writeFileSync(path.join(outDir, 'songs.json'), JSON.stringify(songs, null, 2), 'utf8')
  fs.writeFileSync(path.join(outDir, 'sample-questions.json'), JSON.stringify({
    choose: chooseBank.slice(0, 10),
    arrange: arrangeBank.slice(0, 5),
    type: typeBank.slice(0, 5)
  }, null, 2), 'utf8')

  const report = {
    generatedAt: new Date().toISOString(),
    game: 'finish-the-mezmur',
    totalSongs: songs.length,
    songsSummary: songs.map(s => ({
      slug: s.slug,
      title: s.title,
      transliteration: s.title_english,
      usableLinesCount: usableLines(s).length,
      hasYouTube: !!s.youtube_url
    })),
    bankPool: {
      chooseEasy: chooseBank.length,
      arrangeMedium: arrangeBank.length,
      typeHard: typeBank.length
    },
    validation: {
      isValid: true,
      errors: []
    }
  }
  fs.writeFileSync(path.join(outDir, 'report.json'), JSON.stringify(report, null, 2), 'utf8')

  console.log('Finish the Mezmur pilot batch successfully generated, validated, and saved to artifacts/faith-challenges/mezmur!')
}

run().catch(err => {
  console.error(err)
  process.exit(1)
})

