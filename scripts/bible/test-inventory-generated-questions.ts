import assert from 'node:assert/strict'
import { readFileSync } from 'node:fs'
import { inventoryGenerated, parseCompleteStaffInventory } from './inventory-generated-questions'
import { selectFiveQuestionStaging } from './prepare-five-question-staging'
import { buildReconciledImportBatches } from './prepare-reconciled-import-batches'

const plan = inventoryGenerated()
assert.equal(plan.total, 220)
assert.deepEqual(plan.breakdown, { 'finish-the-verse': 23, trivia: 197 })
assert.equal(plan.valid, 220)
assert.equal(plan.rejected, 0)
assert.deepEqual(plan.duplicateIds, [])
assert.deepEqual(plan.missingSources, [])
assert.equal(plan.alreadyImported, null)
assert.equal(plan.notYetImported, null)
assert(plan.items.every(item => item.action === 'pending-reconciliation'))
assert.equal(new Set(plan.items.map(item => item.id)).size, 220)
assert(plan.items.every(item => item.draft.payload.id === item.id &&
  Array.isArray(item.draft.payload.verifiedLocales) && item.draft.payload.verifiedLocales.includes('en') &&
  !item.draft.payload.verifiedLocales.includes('am') &&
  item.draft.source_references[0].route.startsWith('/bible/')))
const hasAmharicPrompt = (item: (typeof plan.items)[number]) => !!(item.draft.payload.prompt as { am?: string } | undefined)?.am?.trim()
assert.equal(plan.items.filter(hasAmharicPrompt).length, 100)
assert.equal(plan.items.filter(item => item.game === 'trivia' && !hasAmharicPrompt(item)).length, 120)

const campaign = JSON.parse(readFileSync('artifacts/faith-challenges/library/cms-import-all.json', 'utf8')) as Array<{ stable_id: string }>
const campaignIds = plan.items.filter(item => item.sourceFile.includes('faith-challenges')).map(item => item.id)
assert.deepEqual(new Set(campaign.map(item => item.stable_id)), new Set(campaignIds))
assert.equal(campaignIds.length, 100)

const first = plan.items[0]
const exactExisting = { ...first.draft, id: 'fixture-row', question_id: first.id, status: 'published' }
const withExisting = inventoryGenerated([exactExisting])
assert.equal(withExisting.alreadyImported, 1)
assert.equal(withExisting.notYetImported, 219)
assert.equal(withExisting.items[0].action, 'skip-existing')
assert.equal(withExisting.items[0].existingStatus, 'published')
const changedExisting = inventoryGenerated([{ ...exactExisting, payload: { ...exactExisting.payload, explanation: { en: 'Edited explanation' } } }])
assert.equal(changedExisting.items[0].action, 'conflict')
assert.equal(changedExisting.conflicts, 1)
const mismatchedIds = inventoryGenerated([{ ...exactExisting, question_id: 'different-existing-id' }])
assert.equal(mismatchedIds.items[0].action, 'conflict')
assert.equal(mismatchedIds.notYetImported, 219)
const doubleMatch = inventoryGenerated([exactExisting, { ...exactExisting, id: 'second-row' }])
assert.equal(doubleMatch.items[0].action, 'conflict')
const emptyExport = inventoryGenerated([])
assert.equal(emptyExport.databaseReconciled, true)
assert.equal(emptyExport.alreadyImported, 0)
assert.equal(emptyExport.notYetImported, 220)
assert.throws(() => parseCompleteStaffInventory([]), /complete counted staff-inventory/)
assert.equal(parseCompleteStaffInventory({ kind: 'faith-challenges-staff-inventory-v1', complete: true, exportedAt: new Date().toISOString(), visibleCount: 1, pageSize: 250, pages: 1, rows: [exactExisting] }).length, 1)
assert.throws(() => parseCompleteStaffInventory({ kind: 'faith-challenges-staff-inventory-v1', complete: true, exportedAt: new Date().toISOString(), visibleCount: 2, pageSize: 250, pages: 1, rows: [exactExisting] }), /complete counted staff-inventory/)
const five = selectFiveQuestionStaging(emptyExport)
assert.equal(five.length, 5)
assert.deepEqual(five.reduce((count, item) => ({ ...count, [item.game]: (count[item.game] || 0) + 1 }), {} as Record<string, number>), { trivia: 3, 'finish-the-verse': 2 })
assert(five.every(item => item.action === 'insert-draft'))
assert.throws(() => selectFiveQuestionStaging(plan), /complete counted staff inventory/)
assert.throws(() => selectFiveQuestionStaging(changedExisting), /Resolve generated conflicts/)
assert.deepEqual(buildReconciledImportBatches(emptyExport).map(batch => batch.length), [100, 100, 20])
assert.throws(() => buildReconciledImportBatches(plan), /complete counted staff inventory/)
assert.throws(() => buildReconciledImportBatches(changedExisting), /Resolve every conflict/)
console.log('Generated inventory, canonical campaign deduplication, bilingual draft retention, and existing-ID skip passed.')
