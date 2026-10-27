/**
 * TEWAHEDODAILY — CONSOLIDATED DELIVERABLES VERIFICATION
 *
 * Runs all validation test suites:
 * 1. Ethiopian Calendar Engine
 * 2. Bahire Hasab Computus
 * 3. Structured Lyrics Parser
 * 4. Daily Recommendations Engine
 * 5. Zero Mezmur Data Loss Verification
 */

import { execSync } from 'child_process'

const suites = [
  { name: 'Ethiopian Calendar Engine', cmd: 'node scripts/verify-ethiopian-calendar-engine.mjs' },
  { name: 'Bahire Hasab Computus', cmd: 'npx tsx scripts/verify-bahire-hasab.mjs' },
  { name: 'Structured Lyrics Parser', cmd: 'npx tsx scripts/verify-structured-lyrics-parser.mjs' },
  { name: 'Daily Recommendations Engine', cmd: 'npx tsx scripts/verify-daily-recommendations.mjs' },
  { name: 'Zero Mezmur Data Loss Verification', cmd: 'node scripts/verify-mezmur-zero-loss.mjs' },
]

console.log('=================================================================')
console.log('TEWAHEDODAILY — COMPLETE DELIVERABLES VERIFICATION RUNNER')
console.log('=================================================================\n')

let allPassed = true

for (const suite of suites) {
  console.log(`>>> RUNNING: ${suite.name}`)
  try {
    const out = execSync(suite.cmd, { stdio: 'pipe', encoding: 'utf8' })
    console.log(out)
    console.log(`[PASS] ${suite.name}\n`)
  } catch (err) {
    allPassed = false
    console.error(`[FAIL] ${suite.name}`)
    console.error(err.stdout || err.message)
    console.error('\n')
  }
}

if (allPassed) {
  console.log('=================================================================')
  console.log('ALL VERIFICATION SUITES PASSED (5/5)')
  console.log('=================================================================')
  process.exit(0)
} else {
  console.error('=================================================================')
  console.error('SOME SUITES FAILED')
  console.error('=================================================================')
  process.exit(1)
}
