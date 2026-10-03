/**
 * Regression: Learn How to Pray prayer steps must use theme tokens (not Day-only cream/white).
 * Run: node scripts/test-prayer-learning-theme.mjs
 */
import assert from 'node:assert/strict'
import { readFileSync } from 'node:fs'

const css = readFileSync(
  new URL('../src/components/prayerLearning/prayerLearning.module.css', import.meta.url),
  'utf8',
)

assert.doesNotMatch(css, /#fffaf2/i, 'prayerBlock must not hardcode cream #fffaf2')
assert.doesNotMatch(
  css,
  /color-mix\([^)]*,\s*white\s*\)/i,
  'elevated surfaces must not mix with bare white (breaks Night theme)',
)

const prayerBlock = css.match(/\.prayerBlock\s*\{[^}]+\}/)
assert.ok(prayerBlock, 'prayerBlock rule missing')
assert.match(prayerBlock[0], /var\(--color-bg\)/)
assert.match(prayerBlock[0], /var\(--color-gold-faint\)/)
assert.match(prayerBlock[0], /color:\s*var\(--color-text\)/)

const stepCard = css.match(/\.stepCard\s*\{[^}]+\}/)
assert.ok(stepCard, 'stepCard rule missing')
assert.match(stepCard[0], /var\(--color-bg-elevated\)/)

const renderer = readFileSync(
  new URL('../src/components/prayerLearning/ContentRenderer.tsx', import.meta.url),
  'utf8',
)
assert.match(renderer, /isPrayerSection/)
assert.match(renderer, /PrayerBlock/)

console.log('test-prayer-learning-theme: ok')
