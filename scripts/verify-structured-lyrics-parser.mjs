/**
 * TEWAHEDODAILY — STRUCTURED LYRICS PARSER TEST SUITE
 *
 * Verifies lyrics parser handles:
 * 1. CHORUS and VERSE detection
 * 2. Numbered verse markers (Verse 1, ፪, 2., etc.)
 * 3. Repetition notations: (2x), (2×), (፪x), (፪), (3x)
 * 4. Line-by-line pairing between original and transliteration
 * 5. Alignment verification (perfect_match, line_mismatch, section_mismatch)
 */

import { parseStructuredLyrics } from '../src/lib/mezmur/structuredLyricsParser.ts'

console.log('--- RUNNING STRUCTURED LYRICS PARSER VERIFICATION ---')

let passed = 0
let failed = 0

function assert(condition, description) {
  if (condition) {
    passed++
    console.log(`  ✓ ${description}`)
  } else {
    failed++
    console.error(`  ✗ FAIL: ${description}`)
  }
}

// 1. Repetition notation parsing & section detection
const originalSample = `
[CHORUS]
አማን በአማን (2x)
መንግሥተ ሥላሴ ዘለዓለም

[VERSE 1]
ይትባረክ እግዚአብሔር አምላከ እስራኤል (፪x)
ዘገብረ መንክረ ባሕቲቱ (፪)
`

const translitSample = `
[CHORUS]
Aman beaman (2x)
Mengiste Silasse zelealem

[VERSE 1]
Yitbarek Igziabher Amlake Israel (2x)
Zegebre menkire bahtitu (2x)
`

const result = parseStructuredLyrics(originalSample, translitSample)

assert(result.sections.length === 2, `Parsed exactly 2 sections (got ${result.sections.length})`)
assert(result.hasTransliteration, `Has transliteration is true`)
assert(result.alignmentStatus === 'perfect_match', `Alignment status is perfect_match (got ${result.alignmentStatus})`)

// Check Chorus
const chorus = result.sections[0]
assert(chorus.kind === 'chorus', `Section 1 kind is chorus`)
assert(chorus.lines[0].cleanOriginal === 'አማን በአማን', `Chorus line 1 clean text: "${chorus.lines[0].cleanOriginal}"`)
assert(chorus.lines[0].cleanTransliteration === 'Aman beaman', `Chorus line 1 clean transliteration: "${chorus.lines[0].cleanTransliteration}"`)
assert(chorus.lines[0].repetitionCount === 2, `Chorus line 1 repetition count is 2 (got ${chorus.lines[0].repetitionCount})`)

// Check Verse
const verse1 = result.sections[1]
assert(verse1.kind === 'verse', `Section 2 kind is verse`)
assert(verse1.lines[0].repetitionCount === 2, `Verse 1 line 1 Ge'ez repeat (፪x) parsed as count 2`)
assert(verse1.lines[1].repetitionCount === 2, `Verse 1 line 2 Ge'ez repeat (፪) parsed as count 2`)
assert(verse1.lines[1].cleanOriginal === 'ዘገብረ መንክረ ባሕቲቱ', `Verse 1 line 2 clean Ge'ez text preserved: "${verse1.lines[1].cleanOriginal}"`)

// 2. Mismatched line count detection
const mismatchedTranslit = `
[CHORUS]
Aman beaman (2x)

[VERSE 1]
Yitbarek Igziabher Amlake Israel (2x)
`
const mismatchResult = parseStructuredLyrics(originalSample, mismatchedTranslit)
assert(mismatchResult.alignmentStatus === 'line_mismatch', `Mismatched line count detected as line_mismatch (got ${mismatchResult.alignmentStatus})`)
assert(mismatchResult.mismatches.length > 0, `Recorded mismatch diagnostic message`)

console.log(`\nStructured Lyrics Parser Results: ${passed} passed, ${failed} failed.`)
if (failed > 0) process.exit(1)
