/** Structural regressions for Mezmur search recovery, keyboard semantics, and mobile targets. */
import assert from 'node:assert/strict'
import { readFileSync } from 'node:fs'

const library = readFileSync('src/pages/PublicMezmurLibrary.tsx', 'utf8')
const lyrics = readFileSync('src/components/hymns/HymnLyricsExperience.tsx', 'utf8')
const css = readFileSync('src/pages/HymnPractice.module.css', 'utf8')

assert.match(library, /if \(loading && !items\.length\) return <MezmurSkeletonGrid/)
assert.match(library, /items=\{result\?\.items \|\| \[\]\}\s+loading=\{loading\}/)
assert.match(library, /setError\(t\('practice\.loadError'\)\)\s+setLoading\(false\)/)
assert.doesNotMatch(library, /setError\(t\('practice\.loadError'\)\)[\s\S]{0,100}setResult\(null\)/)
assert.match(library, /role="alert"[\s\S]{0,180}onClick=\{onRetry\}/)
assert.match(library, /aria-activedescendant=/)
for (const key of ['ArrowDown', 'ArrowUp', 'Home', 'End', 'Enter', 'Escape']) assert.ok(library.includes(key), key)
assert.match(library, /tabIndex=\{mode === tab\.id \? 0 : -1\}/)
assert.match(library, /aria-controls=\{panelId\}/)
assert.match(lyrics, /aria-controls="lyrics-tabpanel"/)
assert.match(lyrics, /id="lyrics-tabpanel"/)
assert.match(css, /languageChips \.languageChip,[\s\S]{0,100}min-height: 44px/)
assert.match(css, /prefers-reduced-motion: reduce[\s\S]{0,180}\.skeletonMedia \{ animation: none/)
assert.match(library, /aria-pressed=\{werbOnly\}/)

console.log('mezmur library Phase 1 structural regressions: passed')
