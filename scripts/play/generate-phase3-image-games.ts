/**
 * Phase 3 Content Generator for Image-Backed Games:
 * Church Feast Challenge, Guess the Saint, and Icon Memory.
 * Strictly adheres to verified artwork in PLAY_IMAGES without asset fabrication.
 */
import fs from 'node:fs'
import path from 'node:path'

process.env.VITE_SUPABASE_URL = 'https://content-studio-test.invalid'
process.env.VITE_SUPABASE_PUBLISHABLE_KEY = 'synthetic-public-key'

async function run() {
  const { validateStudioDraft } = await import('../../src/lib/play/contentStudio')
  const { PLAY_IMAGES } = await import('../../src/lib/play/imageCatalog')
  type PlayImage = import('../../src/lib/play/imageCatalog').PlayImage

  const byId = new Map(PLAY_IMAGES.map(img => [img.id, img]))
  const getImage = (id: string): PlayImage => {
    const img = byId.get(id)
    if (!img) throw new Error(`Missing approved image: ${id}`)
    return structuredClone(img)
  }

  // =========================================================================
  // 1. CHURCH FEAST CHALLENGE (5 DISTINCT DECKS)
  // =========================================================================
  const feastDecks = [
    {
      id: 'feasts-p3-major-dominical',
      name: 'Major Dominical Feasts of the Lord',
      cards: [getImage('gena'), getImage('timket'), getImage('fasika'), getImage('erget'), getImage('peraklitos'), getImage('meskel')]
    },
    {
      id: 'feasts-p3-early-ministry',
      name: 'Incarnation to Early Signs',
      cards: [getImage('tsinset'), getImage('gena'), getImage('timket'), getImage('kana'), getImage('hosanna'), getImage('debre-tabor')]
    },
    {
      id: 'feasts-p3-glorification-light',
      name: 'Manifestation of Light and Glory',
      cards: [getImage('timket'), getImage('kana'), getImage('debre-tabor'), getImage('siqlet'), getImage('fasika'), getImage('erget')]
    },
    {
      id: 'feasts-p3-passion-and-triumph',
      name: 'Passion Week to Victorious Ascension',
      cards: [getImage('hosanna'), getImage('siqlet'), getImage('fasika'), getImage('erget'), getImage('peraklitos'), getImage('meskel')]
    },
    {
      id: 'feasts-p3-extended-cycle',
      name: 'The Complete Nine Dominical Feasts',
      cards: [getImage('tsinset'), getImage('gena'), getImage('timket'), getImage('kana'), getImage('debre-tabor'), getImage('hosanna'), getImage('fasika'), getImage('erget')]
    }
  ]

  console.log(`=== VALIDATING CHURCH FEAST CHALLENGE PHASE 3 (${feastDecks.length} DECKS) ===`)
  for (const deck of feastDecks) {
    const errors = validateStudioDraft({ game: 'feasts', content: deck.cards })
    if (errors.length > 0) {
      console.error(`Validation failed for feast deck ${deck.id}:`, errors)
      process.exit(1)
    }
  }

  const feastsDir = path.join(process.cwd(), 'artifacts', 'faith-challenges', 'phase-3', 'feasts')
  fs.mkdirSync(feastsDir, { recursive: true })
  fs.writeFileSync(path.join(feastsDir, 'decks.json'), JSON.stringify(feastDecks, null, 2), 'utf8')
  fs.writeFileSync(path.join(feastsDir, 'report.json'), JSON.stringify({
    generatedAt: new Date().toISOString(),
    game: 'feasts',
    phase: 3,
    decksCount: feastDecks.length,
    totalCardsCount: feastDecks.reduce((sum, d) => sum + d.cards.length, 0),
    decks: feastDecks.map(d => ({ id: d.id, name: d.name, cardsCount: d.cards.length })),
    validation: { isValid: true, errors: [] }
  }, null, 2), 'utf8')

  // =========================================================================
  // 2. GUESS THE SAINT (5 DISTINCT DECKS)
  // =========================================================================
  const saintDecks = [
    {
      id: 'saints-p3-four-archangels',
      name: 'The Four Glorious Archangels',
      cards: [getImage('michael'), getImage('gabriel'), getImage('raphael'), getImage('uriel')]
    },
    {
      id: 'saints-p3-martyrs-heralds',
      name: 'Martyrs and Heralds of the Kingdom',
      cards: [getImage('giorgis'), getImage('estifanos'), getImage('yohannes'), getImage('petros-pawlos')]
    },
    {
      id: 'saints-p3-holy-fathers-chant',
      name: 'Monastic Fathers and Holy Hymnographers',
      cards: [getImage('tekle-haymanot'), getImage('yared'), getImage('estifanos'), getImage('giorgis'), getImage('michael'), getImage('gabriel')]
    },
    {
      id: 'saints-p3-guardians-witnesses',
      name: 'Heavenly Defenders and Gospel Witnesses',
      cards: [getImage('michael'), getImage('gabriel'), getImage('uriel'), getImage('yohannes'), getImage('petros-pawlos'), getImage('giorgis')]
    },
    {
      id: 'saints-p3-full-ensemble',
      name: 'Complete Saints and Angels Commemoration',
      cards: [getImage('michael'), getImage('gabriel'), getImage('raphael'), getImage('uriel'), getImage('giorgis'), getImage('tekle-haymanot'), getImage('yared'), getImage('yohannes')]
    }
  ]

  console.log(`=== VALIDATING GUESS THE SAINT PHASE 3 (${saintDecks.length} DECKS) ===`)
  for (const deck of saintDecks) {
    const errors = validateStudioDraft({ game: 'saints', content: deck.cards })
    if (errors.length > 0) {
      console.error(`Validation failed for saint deck ${deck.id}:`, errors)
      process.exit(1)
    }
  }

  const saintsDir = path.join(process.cwd(), 'artifacts', 'faith-challenges', 'phase-3', 'saints')
  fs.mkdirSync(saintsDir, { recursive: true })
  fs.writeFileSync(path.join(saintsDir, 'decks.json'), JSON.stringify(saintDecks, null, 2), 'utf8')
  fs.writeFileSync(path.join(saintsDir, 'report.json'), JSON.stringify({
    generatedAt: new Date().toISOString(),
    game: 'saints',
    phase: 3,
    decksCount: saintDecks.length,
    totalCardsCount: saintDecks.reduce((sum, d) => sum + d.cards.length, 0),
    decks: saintDecks.map(d => ({ id: d.id, name: d.name, cardsCount: d.cards.length })),
    validation: { isValid: true, errors: [] }
  }, null, 2), 'utf8')

  // =========================================================================
  // 3. ICON MEMORY (10 DISTINCT PAIR SETS)
  // =========================================================================
  const memorySets: Array<{ id: string; size: 4 | 6 | 8; cards: PlayImage[] }> = [
    // 4-pair sets
    { id: 'mem-p3-dominical-4p', size: 4, cards: [getImage('gena'), getImage('timket'), getImage('fasika'), getImage('erget')] },
    { id: 'mem-p3-angels-4p', size: 4, cards: [getImage('michael'), getImage('gabriel'), getImage('raphael'), getImage('uriel')] },
    { id: 'mem-p3-saints-4p', size: 4, cards: [getImage('giorgis'), getImage('tekle-haymanot'), getImage('yared'), getImage('estifanos')] },
    { id: 'mem-p3-signs-4p', size: 4, cards: [getImage('kana'), getImage('tsinset'), getImage('hosanna'), getImage('meskel')] },

    // 6-pair sets
    { id: 'mem-p3-feasts-6p', size: 6, cards: [getImage('gena'), getImage('timket'), getImage('fasika'), getImage('erget'), getImage('peraklitos'), getImage('meskel')] },
    { id: 'mem-p3-heavenly-witnesses-6p', size: 6, cards: [getImage('michael'), getImage('gabriel'), getImage('raphael'), getImage('giorgis'), getImage('tekle-haymanot'), getImage('yared')] },
    { id: 'mem-p3-cross-and-glory-6p', size: 6, cards: [getImage('tsinset'), getImage('kana'), getImage('debre-tabor'), getImage('hosanna'), getImage('fasika'), getImage('meskel')] },
    { id: 'mem-p3-martyrs-angels-6p', size: 6, cards: [getImage('michael'), getImage('uriel'), getImage('estifanos'), getImage('giorgis'), getImage('yohannes'), getImage('petros-pawlos')] },

    // 8-pair sets
    { id: 'mem-p3-grand-cycle-8p', size: 8, cards: [getImage('gena'), getImage('timket'), getImage('kana'), getImage('debre-tabor'), getImage('hosanna'), getImage('fasika'), getImage('erget'), getImage('meskel')] },
    { id: 'mem-p3-all-saints-angels-8p', size: 8, cards: [getImage('michael'), getImage('gabriel'), getImage('raphael'), getImage('uriel'), getImage('giorgis'), getImage('tekle-haymanot'), getImage('yared'), getImage('yohannes')] }
  ]

  console.log(`=== VALIDATING ICON MEMORY PHASE 3 (${memorySets.length} SETS) ===`)
  for (const set of memorySets) {
    const errors = validateStudioDraft({ game: 'icon-memory', content: set.cards })
    if (errors.length > 0) {
      console.error(`Validation failed for memory set ${set.id}:`, errors)
      process.exit(1)
    }
  }

  const memDir = path.join(process.cwd(), 'artifacts', 'faith-challenges', 'phase-3', 'icon-memory')
  fs.mkdirSync(memDir, { recursive: true })
  fs.writeFileSync(path.join(memDir, 'sets.json'), JSON.stringify(memorySets, null, 2), 'utf8')
  fs.writeFileSync(path.join(memDir, 'report.json'), JSON.stringify({
    generatedAt: new Date().toISOString(),
    game: 'icon-memory',
    phase: 3,
    setsCount: memorySets.length,
    sets: memorySets.map(s => ({ id: s.id, size: s.size, imageIds: s.cards.map(c => c.id) })),
    validation: { isValid: true, errors: [] }
  }, null, 2), 'utf8')

  console.log('Successfully generated and validated Phase 3 Feasts, Saints, and Icon Memory!')
}

run().catch(err => {
  console.error('Error in Phase 3 image games:', err)
  process.exit(1)
})
