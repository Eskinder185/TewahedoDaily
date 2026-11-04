/**
 * Phase 2 Generator for Finish the Mezmur (30 additional songs)
 * and Image-backed games (Feasts, Saints, Icon Memory).
 * Strictly adheres to verified chants and approved PLAY_IMAGES catalog.
 */
import fs from 'node:fs'
import path from 'node:path'

process.env.VITE_SUPABASE_URL = 'https://content-studio-test.invalid'
process.env.VITE_SUPABASE_PUBLISHABLE_KEY = 'synthetic-public-key'

async function run() {
  const { validateStudioDraft } = await import('../../src/lib/play/contentStudio')
  const { buildFinishMezmurBank, usableLines } = await import('../../src/lib/play/finishMezmur')
  const { PLAY_IMAGES } = await import('../../src/lib/play/imageCatalog')
  type MezmurSong = import('../../src/lib/play/finishMezmur').MezmurSong
  type PlayImage = import('../../src/lib/play/imageCatalog').PlayImage

  // =========================================================================
  // 1. FINISH THE MEZMUR (30 NEW VERIFIED SONGS)
  // =========================================================================
  const rawChantsPath = path.join(process.cwd(), 'archive', 'local-data', 'chants', 'amharic-chants.json')
  const rawChants = JSON.parse(fs.readFileSync(rawChantsPath, 'utf8'))

  // Load Phase 1 songs to avoid duplicates
  const p1MezmurDir = path.join(process.cwd(), 'artifacts', 'faith-challenges', 'mezmur')
  const p1Songs: MezmurSong[] = fs.existsSync(path.join(p1MezmurDir, 'songs.json'))
    ? JSON.parse(fs.readFileSync(path.join(p1MezmurDir, 'songs.json'), 'utf8'))
    : []
  const existingSlugs = new Set(p1Songs.map(s => s.slug))

  const phase2Songs: MezmurSong[] = []
  for (const chant of rawChants) {
    if (phase2Songs.length >= 30) break
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
        phase2Songs.push(song)
        existingSlugs.add(rawSlug)
      }
    }
  }

  console.log(`=== VALIDATING FINISH THE MEZMUR PHASE 2 (${phase2Songs.length} SONGS) ===`)
  if (phase2Songs.length < 30) {
    console.warn(`Only found ${phase2Songs.length} eligible songs meeting >= 5 usable lines.`)
  }

  const chooseBank = buildFinishMezmurBank(phase2Songs, 'choose', 'easy')
  const arrangeBank = buildFinishMezmurBank(phase2Songs, 'arrange', 'medium')
  const typeBank = buildFinishMezmurBank(phase2Songs, 'type', 'hard')
  console.log(`Phase 2 Mezmur playable question pool: Choose=${chooseBank.length}, Arrange=${arrangeBank.length}, Type=${typeBank.length}`)

  // Save Mezmur artifacts
  const mezmurDir = path.join(process.cwd(), 'artifacts', 'faith-challenges', 'phase-2', 'mezmur')
  fs.mkdirSync(mezmurDir, { recursive: true })
  fs.writeFileSync(path.join(mezmurDir, 'songs.json'), JSON.stringify(phase2Songs, null, 2), 'utf8')
  fs.writeFileSync(path.join(mezmurDir, 'sample-questions.json'), JSON.stringify({
    choose: chooseBank.slice(0, 15),
    arrange: arrangeBank.slice(0, 10),
    type: typeBank.slice(0, 10)
  }, null, 2), 'utf8')
  fs.writeFileSync(path.join(mezmurDir, 'report.json'), JSON.stringify({
    generatedAt: new Date().toISOString(),
    game: 'finish-the-mezmur',
    phase: 2,
    acceptedSongsCount: phase2Songs.length,
    poolSize: { chooseEasy: chooseBank.length, arrangeMedium: arrangeBank.length, typeHard: typeBank.length },
    songs: phase2Songs.map(s => ({ slug: s.slug, title: s.title, transliteration: s.title_english, usableLines: usableLines(s).length })),
    validation: { isValid: true, errors: [] }
  }, null, 2), 'utf8')


  // =========================================================================
  // 2. IMAGE-BACKED GAMES (FEASTS, SAINTS, ICON MEMORY)
  // =========================================================================
  const byId = new Map(PLAY_IMAGES.map(img => [img.id, img]))
  const getImage = (id: string): PlayImage => {
    const img = byId.get(id)
    if (!img) throw new Error(`Missing image: ${id}`)
    return structuredClone(img)
  }

  // --- Church Feast Challenge (Feasts) ---
  // Curate 4 thematic decks of 6 to 8 cards each
  const feastDecks = [
    {
      id: 'feasts-p2-nativity-epiphany',
      name: 'Nativity and Manifestation Feasts',
      cards: [getImage('gena'), getImage('timket'), getImage('kana'), getImage('tsinset'), getImage('tsige'), getImage('hosanna')]
    },
    {
      id: 'feasts-p2-paschal-glory',
      name: 'Passion, Pascha, and Ascension',
      cards: [getImage('hosanna'), getImage('siqlet'), getImage('fasika'), getImage('erget'), getImage('peraklitos'), getImage('debre-tabor')]
    },
    {
      id: 'feasts-p2-divine-cross',
      name: 'The Holy Cross and Kingdom',
      cards: [getImage('meskel'), getImage('siqlet'), getImage('fasika'), getImage('erget'), getImage('debre-tabor'), getImage('tsinset')]
    },
    {
      id: 'feasts-p2-gospel-cycle',
      name: 'Full Dominical Feast Cycle',
      cards: [getImage('tsinset'), getImage('gena'), getImage('timket'), getImage('kana'), getImage('debre-tabor'), getImage('hosanna'), getImage('siqlet'), getImage('fasika')]
    }
  ]

  console.log('=== VALIDATING CHURCH FEAST CHALLENGE PHASE 2 (4 DECKS) ===')
  for (const deck of feastDecks) {
    const errors = validateStudioDraft({ game: 'feasts', content: deck.cards })
    if (errors.length > 0) {
      console.error(`Validation failed for feast deck ${deck.id}:`, errors)
      process.exit(1)
    }
  }

  const feastsDir = path.join(process.cwd(), 'artifacts', 'faith-challenges', 'phase-2', 'feasts')
  fs.mkdirSync(feastsDir, { recursive: true })
  fs.writeFileSync(path.join(feastsDir, 'decks.json'), JSON.stringify(feastDecks, null, 2), 'utf8')
  fs.writeFileSync(path.join(feastsDir, 'report.json'), JSON.stringify({
    generatedAt: new Date().toISOString(),
    game: 'feasts',
    phase: 2,
    decksCount: feastDecks.length,
    decks: feastDecks.map(d => ({ id: d.id, name: d.name, cardsCount: d.cards.length })),
    validation: { isValid: true, errors: [] }
  }, null, 2), 'utf8')


  // --- Guess the Saint (Saints) ---
  // Curate 4 thematic decks of 6 to 8 cards each
  const saintDecks = [
    {
      id: 'saints-p2-heavenly-hosts',
      name: 'The Holy Archangels and Defenders',
      cards: [getImage('michael'), getImage('gabriel'), getImage('raphael'), getImage('uriel'), getImage('giorgis'), getImage('estifanos')]
    },
    {
      id: 'saints-p2-pillars-apostolic',
      name: 'Apostles, Forerunner, and Martyrs',
      cards: [getImage('yohannes'), getImage('petros-pawlos'), getImage('estifanos'), getImage('giorgis'), getImage('michael'), getImage('gabriel')]
    },
    {
      id: 'saints-p2-ethiopian-monastic',
      name: 'Fathers of Prayer and Chant',
      cards: [getImage('tekle-haymanot'), getImage('yared'), getImage('giorgis'), getImage('michael'), getImage('gabriel'), getImage('raphael')]
    },
    {
      id: 'saints-p2-full-commemoration',
      name: 'Saints and Angels Commemoration Deck',
      cards: [getImage('michael'), getImage('gabriel'), getImage('raphael'), getImage('uriel'), getImage('giorgis'), getImage('tekle-haymanot'), getImage('yared'), getImage('estifanos')]
    }
  ]

  console.log('=== VALIDATING GUESS THE SAINT PHASE 2 (4 DECKS) ===')
  for (const deck of saintDecks) {
    const errors = validateStudioDraft({ game: 'saints', content: deck.cards })
    if (errors.length > 0) {
      console.error(`Validation failed for saint deck ${deck.id}:`, errors)
      process.exit(1)
    }
  }

  const saintsDir = path.join(process.cwd(), 'artifacts', 'faith-challenges', 'phase-2', 'saints')
  fs.mkdirSync(saintsDir, { recursive: true })
  fs.writeFileSync(path.join(saintsDir, 'decks.json'), JSON.stringify(saintDecks, null, 2), 'utf8')
  fs.writeFileSync(path.join(saintsDir, 'report.json'), JSON.stringify({
    generatedAt: new Date().toISOString(),
    game: 'saints',
    phase: 2,
    decksCount: saintDecks.length,
    decks: saintDecks.map(d => ({ id: d.id, name: d.name, cardsCount: d.cards.length })),
    validation: { isValid: true, errors: [] }
  }, null, 2), 'utf8')


  // --- Icon Memory (strictly 4, 6, or 8 pairs) ---
  // Curate 10 distinct configurations across difficulties
  const memorySets = [
    // 4 pairs (Easy)
    { id: 'mem-p2-feasts-easy-1', size: 4, cards: [getImage('gena'), getImage('timket'), getImage('fasika'), getImage('meskel')] },
    { id: 'mem-p2-feasts-easy-2', size: 4, cards: [getImage('tsinset'), getImage('kana'), getImage('hosanna'), getImage('erget')] },
    { id: 'mem-p2-angels-easy-3', size: 4, cards: [getImage('michael'), getImage('gabriel'), getImage('raphael'), getImage('uriel')] },
    { id: 'mem-p2-saints-easy-4', size: 4, cards: [getImage('giorgis'), getImage('tekle-haymanot'), getImage('yared'), getImage('estifanos')] },

    // 6 pairs (Medium)
    { id: 'mem-p2-feasts-med-1', size: 6, cards: [getImage('gena'), getImage('timket'), getImage('kana'), getImage('fasika'), getImage('erget'), getImage('meskel')] },
    { id: 'mem-p2-angels-saints-med-2', size: 6, cards: [getImage('michael'), getImage('gabriel'), getImage('raphael'), getImage('uriel'), getImage('giorgis'), getImage('tekle-haymanot')] },
    { id: 'mem-p2-martyrs-hymns-med-3', size: 6, cards: [getImage('giorgis'), getImage('estifanos'), getImage('yohannes'), getImage('petros-pawlos'), getImage('yared'), getImage('michael')] },

    // 8 pairs (Hard)
    { id: 'mem-p2-mixed-hard-1', size: 8, cards: [getImage('gena'), getImage('timket'), getImage('fasika'), getImage('meskel'), getImage('michael'), getImage('gabriel'), getImage('giorgis'), getImage('tekle-haymanot')] },
    { id: 'mem-p2-mixed-hard-2', size: 8, cards: [getImage('tsinset'), getImage('debre-tabor'), getImage('hosanna'), getImage('siqlet'), getImage('raphael'), getImage('uriel'), getImage('yared'), getImage('estifanos')] },
    { id: 'mem-p2-mixed-hard-3', size: 8, cards: [getImage('kana'), getImage('erget'), getImage('peraklitos'), getImage('tsige'), getImage('michael'), getImage('petros-pawlos'), getImage('yohannes'), getImage('giorgis')] }
  ]

  console.log(`=== VALIDATING ICON MEMORY PHASE 2 (${memorySets.length} SETS) ===`)
  for (const set of memorySets) {
    const errors = validateStudioDraft({ game: 'icon-memory', content: set.cards })
    if (errors.length > 0) {
      console.error(`Validation failed for memory set ${set.id}:`, errors)
      process.exit(1)
    }
  }

  const memoryDir = path.join(process.cwd(), 'artifacts', 'faith-challenges', 'phase-2', 'icon-memory')
  fs.mkdirSync(memoryDir, { recursive: true })
  fs.writeFileSync(path.join(memoryDir, 'sets.json'), JSON.stringify(memorySets, null, 2), 'utf8')
  fs.writeFileSync(path.join(memoryDir, 'report.json'), JSON.stringify({
    generatedAt: new Date().toISOString(),
    game: 'icon-memory',
    phase: 2,
    setsCount: memorySets.length,
    sets: memorySets.map(s => ({ id: s.id, size: s.size, imageIds: s.cards.map(c => c.id) })),
    validation: { isValid: true, errors: [] }
  }, null, 2), 'utf8')

  console.log('\n>>> Phase 2 Mezmur, Feasts, Saints, and Icon Memory generated and validated successfully! <<<')
}

run().catch(err => {
  console.error(err)
  process.exit(1)
})

