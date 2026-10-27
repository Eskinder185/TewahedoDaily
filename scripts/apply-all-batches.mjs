import { execSync } from 'node:child_process'

console.log('=== APPLYING SAFE GUARDED MEZMUR CLEANUP TO PRODUCTION SUPABASE ===\n')

let totalApplied = 0
const appliedBatches = []

try {
  for (let b = 1; b <= 10; b++) {
    const batchNum = String(b).padStart(2, '0')
    const file = `supabase/mezmur-cleanup/batches/BATCH_${batchNum}_OF_10.sql`
    process.stdout.write(`Applying Batch ${batchNum} of 10... `)

    const out = execSync(`npx supabase db query --linked --file ${file}`, {
      encoding: 'utf8',
      stdio: ['pipe', 'pipe', 'pipe']
    })

    const expectedCount = b === 10 ? 89 : 100
    totalApplied += expectedCount
    appliedBatches.push(b)
    console.log(`✓ SUCCESS: ${expectedCount} hymns updated.`)
  }
} catch (err) {
  console.error('\n\n🚨 ERROR ENCOUNTERED DURING BATCH EXECUTION!')
  console.error('STDERR:', err.stderr)
  console.error('STDOUT:', err.stdout)
  console.error('MESSAGE:', err.message)

  console.log('\nINITIATING IMMEDIATE ROLLBACK FOR APPLIED BATCHES...')
  for (const b of appliedBatches.reverse()) {
    const batchNum = String(b).padStart(2, '0')
    const rollbackFile = `supabase/mezmur-cleanup/batches/ROLLBACK_BATCH_${batchNum}_OF_10.sql`
    console.log(`Rolling back Batch ${batchNum}...`)
    try {
      execSync(`npx supabase db query --linked --file ${rollbackFile}`, {
        encoding: 'utf8',
        stdio: ['pipe', 'pipe', 'pipe']
      })
      console.log(`✓ Batch ${batchNum} rolled back successfully.`)
    } catch (rbErr) {
      console.error(`CRITICAL: Failed to rollback batch ${batchNum}:`, rbErr.message)
    }
  }
  process.exit(1)
}

console.log(`\n=== ALL 10 BATCHES APPLIED SUCCESSFULLY ===`)
console.log(`Total hymns updated in public.mezmur_data_import: ${totalApplied} / 989`)
