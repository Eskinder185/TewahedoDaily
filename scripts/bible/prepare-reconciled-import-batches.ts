/** Produces bounded draft-only JSON arrays. This script never connects to Supabase. */
import { existsSync, readFileSync, writeFileSync } from 'node:fs'
import { resolve, join } from 'node:path'
import { inventoryGenerated, parseCompleteStaffInventory } from './inventory-generated-questions'

type Plan = ReturnType<typeof inventoryGenerated>

export function buildReconciledImportBatches(plan: Plan) {
  if (!plan.databaseReconciled) throw new Error('A complete counted staff inventory is required.')
  if (plan.conflicts || plan.rejected) throw new Error('Resolve every conflict and rejected item before preparing all-question batches.')
  const inserts = plan.items.filter(item => item.action === 'insert-draft')
  const batches: typeof inserts[] = []
  for (let offset = 0; offset < inserts.length; offset += 100) {
    const batch = inserts.slice(offset, offset + 100)
    if (JSON.stringify(batch.map(item => item.draft), null, 2).length > 1_000_000) throw new Error('An import batch exceeds the browser importer’s 1 MB limit.')
    batches.push(batch)
  }
  return batches
}

if (process.argv[1]?.replaceAll('\\', '/').endsWith('/prepare-reconciled-import-batches.ts')) {
  const args = process.argv.slice(2)
  if (args.length !== 4 || args[0] !== '--existing-export' || args[2] !== '--out-dir' || !args[1] || !args[3]) {
    throw new Error('Usage: prepare-reconciled-import-batches.ts --existing-export complete-staff-records.json --out-dir existing-empty-directory')
  }
  const rows = parseCompleteStaffInventory(JSON.parse(readFileSync(resolve(args[1]), 'utf8')))
  const plan = inventoryGenerated(rows)
  const batches = buildReconciledImportBatches(plan)
  const directory = resolve(args[3])
  if (!existsSync(directory)) throw new Error('Create the output directory explicitly before preparing batches.')
  const paths = batches.map((_, index) => join(directory, `batch-${String(index + 1).padStart(3, '0')}.json`))
  const manifestPath = join(directory, 'import-plan.json')
  if ([...paths, manifestPath].some(existsSync)) throw new Error('Output files already exist; use an empty directory to avoid overwriting a reviewed plan.')
  const manifest = { kind: 'faith-challenges-reconciled-batches-v1', totalGenerated: plan.total,
    insert: plan.notYetImported, skip: plan.skipped, conflict: plan.conflicts, rejected: plan.rejected,
    batches: batches.map((batch, index) => ({ file: `batch-${String(index + 1).padStart(3, '0')}.json`, count: batch.length,
      items: batch.map(({ id, draftHash }) => ({ id, draftHash })) })) }
  paths.forEach((path, index) => writeFileSync(path, JSON.stringify(batches[index].map(item => item.draft), null, 2) + '\n', { flag: 'wx' }))
  writeFileSync(manifestPath, JSON.stringify(manifest, null, 2) + '\n', { flag: 'wx' })
  console.log(JSON.stringify({ ...manifest, batches: manifest.batches.map(({ file, count }) => ({ file, count })) }, null, 2))
}
