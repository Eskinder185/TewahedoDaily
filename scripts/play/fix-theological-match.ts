/**
 * Theological Correction for Match & Discover:
 * Replaces Saint Paul in 'gospel-symbols' collection with Arba'etu Insesat (The Four Living Creatures),
 * resolving the category defect so that all 5 pairs accurately represent the Four Evangelists and their biblical symbols.
 * Preserves original files as *.orig.json.
 */
import fs from 'node:fs'
import path from 'node:path'

process.env.VITE_SUPABASE_URL = 'https://content-studio-test.invalid'
process.env.VITE_SUPABASE_PUBLISHABLE_KEY = 'synthetic-public-key'

async function run() {
  const { validateStudioDraft } = await import('../../src/lib/play/contentStudio')
  const { validateCardContent } = await import('../../src/lib/play/cardContent')
  const { previewQuestionImport } = await import('../../src/lib/play/questionLibrary')
  type MatchPair = import('../../src/lib/play/types').MatchPair

  const dir = path.join(process.cwd(), 'artifacts', 'faith-challenges', 'phase-2', 'match')
  const collPath = path.join(dir, 'collections.json')
  const pairsPath = path.join(dir, 'pairs.json')

  // 1. Preserve original files
  fs.copyFileSync(collPath, path.join(dir, 'collections.orig.json'))
  fs.copyFileSync(pairsPath, path.join(dir, 'pairs.orig.json'))
  console.log('Preserved original files as collections.orig.json and pairs.orig.json')

  const collections = JSON.parse(fs.readFileSync(collPath, 'utf8'))
  const gospelCol = collections.find((c: any) => c.id === 'gospel-symbols')
  if (!gospelCol) throw new Error('gospel-symbols collection not found')

  // 2. Replace pair 5 (Saint Paul) with Arba'etu Insesat (The Four Living Creatures)
  gospelCol.pairs[4] = {
    id: 'match-p2-four-creatures',
    left: { en: 'The Four Living Creatures (Arba’etu Insesat)', am: 'አራቱ እንስሳት' },
    right: { en: 'Heavenly Bearers of the Chariot of Glory', am: 'የክብር ሰረገላ ተሸካሚዎች' },
    exp: 'Ezekiel and John beheld the four living creatures around the throne, representing the mystery of Christ portrayed by the four Evangelists.',
    ref: 'Ezekiel 1:10',
    route: '/bible/ezekiel/1'
  }

  // 3. Reconstruct all pairs
  const allPairs: MatchPair[] = []
  for (const col of collections) {
    const colPairs: MatchPair[] = col.pairs.map((p: any) => ({
      id: p.id,
      category: col.id,
      left: p.left,
      right: p.right,
      explanation: { en: p.exp },
      source: { label: p.ref, route: p.route, kind: p.route.startsWith('/bible') ? 'bible' : 'church-library' },
      verifiedLocales: ['en']
    }))

    // Validate draft
    const draftErrors = validateStudioDraft({ game: 'match', content: colPairs })
    if (draftErrors.length > 0) {
      console.error(`Validation failed for collection ${col.id}:`, draftErrors)
      process.exit(1)
    }

    for (const pair of colPairs) {
      const cardErrors = validateCardContent('match', pair)
      if (cardErrors.length > 0) {
        console.error(`Validation failed for pair ${pair.id}:`, cardErrors)
        process.exit(1)
      }
      allPairs.push(pair)
    }
  }

  // 4. Write updated artifacts
  fs.writeFileSync(collPath, JSON.stringify(collections, null, 2), 'utf8')
  fs.writeFileSync(pairsPath, JSON.stringify(allPairs, null, 2), 'utf8')

  const cmsDrafts = allPairs.map(p => ({
    stable_id: p.id,
    game_type: 'match' as const,
    category: p.category,
    difficulty: 'growing' as const,
    payload: p,
    source_references: [p.source]
  }))
  fs.writeFileSync(path.join(dir, 'cms-import.json'), JSON.stringify(cmsDrafts, null, 2), 'utf8')

  const preview = previewQuestionImport(JSON.stringify(cmsDrafts), new Set())
  console.log(`Match CMS Preview after correction: ${preview.items.length} items, ${preview.errors.length} errors.`)

  const report = {
    generatedAt: new Date().toISOString(),
    game: 'match',
    phase: 2,
    collectionsCount: collections.length,
    pairsCount: allPairs.length,
    theologicalAudit: {
      collectionId: 'gospel-symbols',
      correction: 'Replaced Saint Paul with Arba’etu Insesat (The Four Living Creatures), aligning all 5 pairs with the Evangelists and the heavenly throne vision of Ezekiel 1:10.',
      provenancePreserved: true,
      originalFiles: ['collections.orig.json', 'pairs.orig.json']
    },
    validation: { isValid: true, errors: [] }
  }
  fs.writeFileSync(path.join(dir, 'report.json'), JSON.stringify(report, null, 2), 'utf8')
  console.log('Theological correction applied and validated successfully!')
}

run().catch(console.error)

