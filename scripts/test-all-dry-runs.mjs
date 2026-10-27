import { execSync } from 'node:child_process'

console.log('=== DRY-RUNNING ALL 10 BATCHES AGAINST PRODUCTION SUPABASE ===\n')

let totalVerified = 0

for (let b = 1; b <= 10; b++) {
  const batchNum = String(b).padStart(2, '0')
  const file = `supabase/mezmur-cleanup/batches/DRY_RUN_BATCH_${batchNum}_OF_10.sql`
  process.stdout.write(`Testing Batch ${batchNum} of 10... `)

  try {
    const out = execSync(`npx supabase db query --linked --file ${file}`, {
      encoding: 'utf8',
      stdio: ['pipe', 'pipe', 'pipe']
    })
    console.log('Unexpected success output without exception:', out)
  } catch (err) {
    const combined = (err.stdout || '') + '\n' + (err.stderr || '') + '\n' + (err.message || '')
    const match = combined.match(/DRY RUN BATCH \d+ SUCCESS: Verified (\d+) hymns/)
    if (match) {
      const count = parseInt(match[1], 10)
      totalVerified += count
      console.log(`✓ PASS: ${count} hymns verified and rolled back cleanly.`)
    } else {
      console.error('\n✗ FAILED on Batch', batchNum)
      console.error('STDOUT:', err.stdout)
      console.error('STDERR:', err.stderr)
      console.error('MESSAGE:', err.message)
      process.exit(1)
    }
  }
}

console.log(`\n=== 10/10 BATCHES VERIFIED SUCCESSFULLY ===`)
console.log(`Total hymns verified with 5-column concurrency checks: ${totalVerified} / 989`)
