/**
 * Generates and validates image games pilot batches:
 * - Church Feast Challenge ('feasts')
 * - Guess the Saint ('saints')
 * - Icon Memory ('icon-memory')
 * Strictly adheres to PLAY_IMAGES and validateStudioDraft constraints.
 */
import fs from 'node:fs'
import path from 'node:path'

process.env.VITE_SUPABASE_URL = 'https://content-studio-test.invalid'
process.env.VITE_SUPABASE_PUBLISHABLE_KEY = 'synthetic-public-key'

async function run() {
  const { validateStudioDraft } = await import('../../src/lib/play/contentStudio')
  const { PLAY_IMAGES } = await import('../../src/lib/play/imageCatalog')
  type PlayImage = import('../../src/lib/play/imageCatalog').PlayImage

  console.log(`Loaded ${PLAY_IMAGES.length} approved PLAY_IMAGES.`)
  const byId = new Map(PLAY_IMAGES.map(img => [img.id, img]))

  const getImage = (id: string): PlayImage => {
    const img = byId.get(id)
    if (!img) throw new Error(`Missing image in PLAY_IMAGES: ${id}`)
    return structuredClone(img)
  }

  // --- 1. Church Feast Challenge ('feasts') ---
  const feastsDeck1: PlayImage[] = [
    getImage('gena'),
    getImage('timket'),
    getImage('kana'),
    getImage('hosanna'),
    getImage('siqlet'),
    getImage('fasika'),
    getImage('erget'),
    getImage('peraklitos')
  ]

  const feastsDeck2: PlayImage[] = [
    getImage('tsinset'),
    getImage('tsige'),
    getImage('debre-tabor'),
    getImage('meskel'),
    getImage('gena'),
    getImage('timket'),
    getImage('hosanna'),
    getImage('fasika')
  ]

  console.log('=== VALIDATING CHURCH FEAST CHALLENGE DECKS ===')
  for (const [idx, deck] of [feastsDeck1, feastsDeck2].entries()) {
    const errors = validateStudioDraft({ game: 'feasts', content: deck })
    if (errors.length > 0) {
      console.error(`Feasts deck ${idx + 1} validation failed:`, errors)
      process.exit(1)
    }
  }

  // --- 2. Guess the Saint ('saints') ---
  const saintsDeck1: PlayImage[] = [
    getImage('michael'),
    getImage('gabriel'),
    getImage('raphael'),
    getImage('uriel'),
    getImage('tekle-haymanot'),
    getImage('yared'),
    getImage('giorgis'),
    getImage('estifanos')
  ]

  const saintsDeck2: PlayImage[] = [
    getImage('giorgis'),
    getImage('estifanos'),
    getImage('yohannes'),
    getImage('petros-pawlos'),
    getImage('michael'),
    getImage('gabriel'),
    getImage('raphael'),
    getImage('uriel')
  ]

  console.log('=== VALIDATING GUESS THE SAINT DECKS ===')
  for (const [idx, deck] of [saintsDeck1, saintsDeck2].entries()) {
    const errors = validateStudioDraft({ game: 'saints', content: deck })
    if (errors.length > 0) {
      console.error(`Saints deck ${idx + 1} validation failed:`, errors)
      process.exit(1)
    }
  }

  // --- 3. Icon Memory ('icon-memory') ---
  const memory4: PlayImage[] = [
    getImage('gena'),
    getImage('timket'),
    getImage('fasika'),
    getImage('meskel')
  ]

  const memory6: PlayImage[] = [
    getImage('gena'),
    getImage('timket'),
    getImage('fasika'),
    getImage('meskel'),
    getImage('michael'),
    getImage('gabriel')
  ]

  const memory8: PlayImage[] = [
    getImage('gena'),
    getImage('timket'),
    getImage('fasika'),
    getImage('meskel'),
    getImage('michael'),
    getImage('gabriel'),
    getImage('giorgis'),
    getImage('yared')
  ]

  console.log('=== VALIDATING ICON MEMORY DECKS (4, 6, 8 PAIRS) ===')
  for (const [size, deck] of [[4, memory4], [6, memory6], [8, memory8]] as const) {
    const errors = validateStudioDraft({ game: 'icon-memory', content: deck as PlayImage[] })
    if (errors.length > 0) {
      console.error(`Icon Memory deck (${size} pairs) validation failed:`, errors)
      process.exit(1)
    }
  }

  // Save Feasts artifacts
  const feastsDir = path.join(process.cwd(), 'artifacts', 'faith-challenges', 'feasts')
  fs.mkdirSync(feastsDir, { recursive: true })
  fs.writeFileSync(path.join(feastsDir, 'decks.json'), JSON.stringify([feastsDeck1, feastsDeck2], null, 2), 'utf8')
  fs.writeFileSync(path.join(feastsDir, 'report.json'), JSON.stringify({
    generatedAt: new Date().toISOString(),
    game: 'feasts',
    decksCount: 2,
    cardsPerDeck: 8,
    uniqueCardsReferenced: Array.from(new Set([...feastsDeck1, ...feastsDeck2].map(c => c.id))),
    validation: { isValid: true, errors: [] }
  }, null, 2), 'utf8')

  // Save Saints artifacts
  const saintsDir = path.join(process.cwd(), 'artifacts', 'faith-challenges', 'saints')
  fs.mkdirSync(saintsDir, { recursive: true })
  fs.writeFileSync(path.join(saintsDir, 'decks.json'), JSON.stringify([saintsDeck1, saintsDeck2], null, 2), 'utf8')
  fs.writeFileSync(path.join(saintsDir, 'report.json'), JSON.stringify({
    generatedAt: new Date().toISOString(),
    game: 'saints',
    decksCount: 2,
    cardsPerDeck: 8,
    uniqueCardsReferenced: Array.from(new Set([...saintsDeck1, ...saintsDeck2].map(c => c.id))),
    validation: { isValid: true, errors: [] }
  }, null, 2), 'utf8')

  // Save Icon Memory artifacts
  const memoryDir = path.join(process.cwd(), 'artifacts', 'faith-challenges', 'icon-memory')
  fs.mkdirSync(memoryDir, { recursive: true })
  fs.writeFileSync(path.join(memoryDir, 'sets.json'), JSON.stringify({ easy4: memory4, medium6: memory6, hard8: memory8 }, null, 2), 'utf8')
  fs.writeFileSync(path.join(memoryDir, 'report.json'), JSON.stringify({
    generatedAt: new Date().toISOString(),
    game: 'icon-memory',
    setsAvailable: [4, 6, 8],
    validation: { isValid: true, errors: [] }
  }, null, 2), 'utf8')

  console.log('Feasts, Saints, and Icon Memory pilot batches generated and validated successfully!')
}

run().catch(err => {
  console.error(err)
  process.exit(1)
})

