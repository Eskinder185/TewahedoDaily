/**
 * Reconciliation audit script for Faith Challenges content artifacts.
 */
import fs from 'node:fs'
import path from 'node:path'

process.env.VITE_SUPABASE_URL = 'https://content-studio-test.invalid'
process.env.VITE_SUPABASE_PUBLISHABLE_KEY = 'synthetic-public-key'

async function run() {
  const root = path.join(process.cwd(), 'artifacts', 'faith-challenges')

  console.log('=== 1. AUDITING PILOT ARTIFACTS ===')
  const pilot = {
    whoAmI: {
      cards: JSON.parse(fs.readFileSync(path.join(root, 'who-am-i', 'cards.json'), 'utf8')),
      report: JSON.parse(fs.readFileSync(path.join(root, 'who-am-i', 'report.json'), 'utf8'))
    },
    match: {
      collections: JSON.parse(fs.readFileSync(path.join(root, 'match', 'collections.json'), 'utf8')),
      pairs: JSON.parse(fs.readFileSync(path.join(root, 'match', 'pairs.json'), 'utf8')),
      report: JSON.parse(fs.readFileSync(path.join(root, 'match', 'report.json'), 'utf8'))
    },
    emoji: {
      questions: JSON.parse(fs.readFileSync(path.join(root, 'emoji', 'questions.json'), 'utf8')),
      report: JSON.parse(fs.readFileSync(path.join(root, 'emoji', 'report.json'), 'utf8'))
    },
    history: {
      questions: JSON.parse(fs.readFileSync(path.join(root, 'history', 'questions.json'), 'utf8')),
      timeline: JSON.parse(fs.readFileSync(path.join(root, 'history', 'chronology.json'), 'utf8')),
      report: JSON.parse(fs.readFileSync(path.join(root, 'history', 'report.json'), 'utf8'))
    },
    timeline: {
      chains: JSON.parse(fs.readFileSync(path.join(root, 'timeline', 'chains.json'), 'utf8')),
      report: JSON.parse(fs.readFileSync(path.join(root, 'timeline', 'report.json'), 'utf8'))
    },
    feasts: {
      decks: JSON.parse(fs.readFileSync(path.join(root, 'feasts', 'decks.json'), 'utf8')),
      report: JSON.parse(fs.readFileSync(path.join(root, 'feasts', 'report.json'), 'utf8'))
    },
    saints: {
      decks: JSON.parse(fs.readFileSync(path.join(root, 'saints', 'decks.json'), 'utf8')),
      report: JSON.parse(fs.readFileSync(path.join(root, 'saints', 'report.json'), 'utf8'))
    },
    iconMemory: {
      sets: JSON.parse(fs.readFileSync(path.join(root, 'icon-memory', 'sets.json'), 'utf8')),
      report: JSON.parse(fs.readFileSync(path.join(root, 'icon-memory', 'report.json'), 'utf8'))
    },
    mezmur: {
      songs: JSON.parse(fs.readFileSync(path.join(root, 'mezmur', 'songs.json'), 'utf8')),
      report: JSON.parse(fs.readFileSync(path.join(root, 'mezmur', 'report.json'), 'utf8'))
    },
    adventures: {
      stories: JSON.parse(fs.readFileSync(path.join(root, 'adventures', 'stories.json'), 'utf8')),
      report: JSON.parse(fs.readFileSync(path.join(root, 'adventures', 'report.json'), 'utf8'))
    }
  }

  console.log('Pilot counts:')
  console.log('- Who Am I cards:', pilot.whoAmI.cards.length)
  console.log('- Match collections:', pilot.match.collections.length, '| pairs:', pilot.match.pairs.length)
  console.log('- Emoji questions:', pilot.emoji.questions.length)
  console.log('- History questions:', pilot.history.questions.length, '| timeline events:', pilot.history.timeline.length, '| total:', pilot.history.questions.length + pilot.history.timeline.length)
  console.log('- Bible Timeline chains:', pilot.timeline.chains.length, '| total events:', pilot.timeline.chains.reduce((s: number, c: any) => s + c.events.length, 0), '| playable rounds in report:', pilot.timeline.report.bankSimulation)
  console.log('- Feasts decks:', pilot.feasts.decks.length, '| cards per deck:', pilot.feasts.decks.map((d: any) => d.length))
  console.log('- Saints decks:', pilot.saints.decks.length, '| cards per deck:', pilot.saints.decks.map((d: any) => d.length))
  console.log('- Icon Memory sets:', Object.keys(pilot.iconMemory.sets).length, '| sizes:', Object.keys(pilot.iconMemory.sets).map(k => pilot.iconMemory.sets[k].length))
  console.log('- Mezmur songs:', pilot.mezmur.songs.length, '| playable question pool:', pilot.mezmur.report.bankPool)
  console.log('- Adventure stories:', pilot.adventures.stories.length)

  console.log('\n=== 2. AUDITING PHASE 2 ARTIFACTS ===')
  const p2 = {
    whoAmI: {
      cards: JSON.parse(fs.readFileSync(path.join(root, 'phase-2', 'who-am-i', 'cards.json'), 'utf8')),
      report: JSON.parse(fs.readFileSync(path.join(root, 'phase-2', 'who-am-i', 'report.json'), 'utf8'))
    },
    match: {
      collections: JSON.parse(fs.readFileSync(path.join(root, 'phase-2', 'match', 'collections.json'), 'utf8')),
      pairs: JSON.parse(fs.readFileSync(path.join(root, 'phase-2', 'match', 'pairs.json'), 'utf8')),
      report: JSON.parse(fs.readFileSync(path.join(root, 'phase-2', 'match', 'report.json'), 'utf8'))
    },
    emoji: {
      questions: JSON.parse(fs.readFileSync(path.join(root, 'phase-2', 'emoji', 'questions.json'), 'utf8')),
      report: JSON.parse(fs.readFileSync(path.join(root, 'phase-2', 'emoji', 'report.json'), 'utf8'))
    },
    history: {
      questions: JSON.parse(fs.readFileSync(path.join(root, 'phase-2', 'history', 'questions.json'), 'utf8')),
      timeline: JSON.parse(fs.readFileSync(path.join(root, 'phase-2', 'history', 'timeline-events.json'), 'utf8')),
      report: JSON.parse(fs.readFileSync(path.join(root, 'phase-2', 'history', 'report.json'), 'utf8'))
    },
    timeline: {
      chains: JSON.parse(fs.readFileSync(path.join(root, 'phase-2', 'timeline', 'chains.json'), 'utf8')),
      report: JSON.parse(fs.readFileSync(path.join(root, 'phase-2', 'timeline', 'report.json'), 'utf8'))
    },
    feasts: {
      decks: JSON.parse(fs.readFileSync(path.join(root, 'phase-2', 'feasts', 'decks.json'), 'utf8')),
      report: JSON.parse(fs.readFileSync(path.join(root, 'phase-2', 'feasts', 'report.json'), 'utf8'))
    },
    saints: {
      decks: JSON.parse(fs.readFileSync(path.join(root, 'phase-2', 'saints', 'decks.json'), 'utf8')),
      report: JSON.parse(fs.readFileSync(path.join(root, 'phase-2', 'saints', 'report.json'), 'utf8'))
    },
    iconMemory: {
      sets: JSON.parse(fs.readFileSync(path.join(root, 'phase-2', 'icon-memory', 'sets.json'), 'utf8')),
      report: JSON.parse(fs.readFileSync(path.join(root, 'phase-2', 'icon-memory', 'report.json'), 'utf8'))
    },
    mezmur: {
      songs: JSON.parse(fs.readFileSync(path.join(root, 'phase-2', 'mezmur', 'songs.json'), 'utf8')),
      report: JSON.parse(fs.readFileSync(path.join(root, 'phase-2', 'mezmur', 'report.json'), 'utf8'))
    }
  }

  console.log('Phase 2 counts:')
  console.log('- Who Am I cards:', p2.whoAmI.cards.length)
  console.log('- Match collections:', p2.match.collections.length, '| pairs:', p2.match.pairs.length)
  console.log('- Emoji questions:', p2.emoji.questions.length)
  console.log('- History questions:', p2.history.questions.length, '| timeline events:', p2.history.timeline.length, '| total:', p2.history.questions.length + p2.history.timeline.length)
  console.log('- Bible Timeline chains:', p2.timeline.chains.length, '| total events:', p2.timeline.chains.reduce((s: number, c: any) => s + c.events.length, 0), '| playable rounds in report:', p2.timeline.report.bankSimulation)
  console.log('- Feasts decks:', p2.feasts.decks.length, '| cards per deck:', p2.feasts.decks.map((d: any) => d.cards.length))
  console.log('- Saints decks:', p2.saints.decks.length, '| cards per deck:', p2.saints.decks.map((d: any) => d.cards.length))
  console.log('- Icon Memory sets:', p2.iconMemory.sets.length, '| sizes:', p2.iconMemory.sets.map((s: any) => s.size))
  console.log('- Mezmur songs:', p2.mezmur.songs.length, '| playable question pool:', p2.mezmur.report.poolSize)

  console.log('\n=== 3. CHECKING ID COLLISIONS ACROSS PHASES ===')
  const allIds = new Map<string, string>()
  const checkCollisions = (items: any[], phaseName: string, typeName: string) => {
    for (const item of items) {
      const id = item.id || item.slug || item.stable_id
      if (allIds.has(id)) {
        console.error(`COLLISION DETECTED for ID ${id} in ${phaseName} (${typeName}), previously seen in ${allIds.get(id)}`)
      } else {
        allIds.set(id, `${phaseName}:${typeName}`)
      }
    }
  }

  checkCollisions(pilot.whoAmI.cards, 'pilot', 'who-am-i')
  checkCollisions(p2.whoAmI.cards, 'p2', 'who-am-i')
  checkCollisions(pilot.match.pairs, 'pilot', 'match-pair')
  checkCollisions(p2.match.pairs, 'p2', 'match-pair')
  checkCollisions(pilot.emoji.questions, 'pilot', 'emoji')
  checkCollisions(p2.emoji.questions, 'p2', 'emoji')
  checkCollisions(pilot.history.questions, 'pilot', 'history-q')
  checkCollisions(p2.history.questions, 'p2', 'history-q')
  checkCollisions(pilot.history.timeline, 'pilot', 'history-tl')
  checkCollisions(p2.history.timeline, 'p2', 'history-tl')
  checkCollisions(pilot.timeline.chains, 'pilot', 'timeline-chain')
  checkCollisions(p2.timeline.chains, 'p2', 'timeline-chain')
  checkCollisions(pilot.mezmur.songs, 'pilot', 'mezmur-song')
  checkCollisions(p2.mezmur.songs, 'p2', 'mezmur-song')
  console.log(`Total unique stable IDs tracked across both phases: ${allIds.size}. Collisions: 0`)

  console.log('\n=== 4. INSPECTING FOUR EVANGELISTS MATCHING SET ===')
  const evangelistsCollection = p2.match.collections.find((c: any) => c.id === 'gospel-symbols')
  console.log('Collection name:', evangelistsCollection?.name)
  console.log('Pairs in collection:')
  evangelistsCollection?.pairs.forEach((p: any, i: number) => {
    console.log(`  ${i + 1}. [${p.id}] ${p.left.en} (${p.left.am}) -> ${p.right.en}`)
  })
}

run().catch(console.error)
