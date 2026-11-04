import { readFileSync } from 'node:fs'

const manifest = JSON.parse(readFileSync('artifacts/faith-challenges/campaign-manifest.json', 'utf8'))

console.log('====================================================')
console.log('       TEWAHEDODAILY BIBLE QUESTIONS CAMPAIGN        ')
console.log('====================================================')
console.log(`Campaign Target:        ${manifest.targetQuestions} questions`)
console.log(`Accepted & Validated:   ${manifest.acceptedQuestions} questions (${manifest.completedBatches.length} batches completed)`)
console.log(`Pending Generation:     ${manifest.pendingBatches.length} batches (${manifest.pendingPassages ?? manifest.batches.filter((batch: { status: string }) => batch.status === 'pending_generation').reduce((sum: number, batch: { passageCount: number }) => sum + batch.passageCount, 0)} passages prepared)`)
console.log(`Total Source Capacity:  ${manifest.preparedPassages ?? manifest.usedPassages.length} prepared passages`)
console.log(`Unprepared Candidates:  ${manifest.remainingEligiblePassages ?? 'unknown'} audit-clean chapters (may fail batch preparation)`)
console.log(`Total Batches:          ${manifest.totalBatches}`)
console.log(`Completed Batches:      ${manifest.completedBatches.join(', ')}`)
if (manifest.failedBatches?.length) console.log(`Blocked Batches:        ${manifest.failedBatches.join(', ')}`)
const staleSidecars = manifest.sidecarAudit?.filter((item: { status: string }) => item.status === 'stale').map((item: { batchId: string }) => item.batchId) ?? []
if (staleSidecars.length) console.log(`Stale Sidecars:         ${staleSidecars.join(', ')}`)
console.log('----------------------------------------------------')
console.log('Category Coverage (Passages Prepared):')
for (const [cat, count] of Object.entries(manifest.categoryCoverage)) {
  console.log(`  - ${cat}: ${count}`)
}
console.log('----------------------------------------------------')
console.log(`Engine Status: ${manifest.geminiExecution.apiAvailable ? 'API Connected' : 'Offline / Copilot Generation Mode'}`)
console.log('====================================================')

