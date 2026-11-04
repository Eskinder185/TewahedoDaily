/** File-only staging preparation. Never opens a database connection or imports a question. */
import { readFileSync, writeFileSync } from 'node:fs'
import { resolve } from 'node:path'
import { inventoryGenerated, parseCompleteStaffInventory } from './inventory-generated-questions'

type Plan = ReturnType<typeof inventoryGenerated>

export function selectFiveQuestionStaging(plan: Plan) {
  if (!plan.databaseReconciled) throw new Error('A complete counted staff inventory is required before staging selection.')
  if (plan.conflicts || plan.rejected) throw new Error('Resolve generated conflicts and rejected items before staging selection.')
  const candidates = plan.items.filter(item => item.action === 'insert-draft')
  const chosen: typeof candidates = []
  for (const [game, count] of [['trivia', 3], ['finish-the-verse', 2]] as const) {
    const group = candidates.filter(item => item.game === game)
    const files = new Set<string>()
    for (const item of group) {
      if (chosen.filter(entry => entry.game === game).length >= count) break
      if (!files.has(item.sourceFile)) { chosen.push(item); files.add(item.sourceFile) }
    }
    for (const item of group) {
      if (chosen.filter(entry => entry.game === game).length >= count) break
      if (!chosen.includes(item)) chosen.push(item)
    }
    if (chosen.filter(item => item.game === game).length !== count) throw new Error(`Not enough new ${game} candidates for a five-question staging import.`)
  }
  return chosen
}

if (process.argv[1]?.replaceAll('\\', '/').endsWith('/prepare-five-question-staging.ts')) {
  const args = process.argv.slice(2)
  const exportIndex = args.indexOf('--existing-export')
  const outIndex = args.indexOf('--out')
  const manifestIndex = args.indexOf('--manifest-out')
  if (args.length !== 6 || exportIndex < 0 || outIndex < 0 || manifestIndex < 0 ||
      !args[exportIndex + 1] || !args[outIndex + 1] || !args[manifestIndex + 1]) {
    throw new Error('Usage: prepare-five-question-staging.ts --existing-export complete-staff-export.json --out new-five-drafts.json --manifest-out new-five-manifest.json')
  }
  const rows = parseCompleteStaffInventory(JSON.parse(readFileSync(resolve(args[exportIndex + 1]), 'utf8')))
  const plan = inventoryGenerated(rows)
  const selected = selectFiveQuestionStaging(plan)
  const drafts = selected.map(item => item.draft)
  const manifest = { kind: 'faith-challenges-five-staging-plan-v1', databaseReconciled: true,
    total: drafts.length, gameBreakdown: { trivia: 3, 'finish-the-verse': 2 },
    items: selected.map(({ id, game, sourceFile, sourceHash, draftHash }) => ({ id, game, sourceFile, sourceHash, draftHash, action: 'insert-draft' })) }
  writeFileSync(resolve(args[outIndex + 1]), JSON.stringify(drafts, null, 2) + '\n', { flag: 'wx' })
  writeFileSync(resolve(args[manifestIndex + 1]), JSON.stringify(manifest, null, 2) + '\n', { flag: 'wx' })
  console.log(JSON.stringify(manifest, null, 2))
}
