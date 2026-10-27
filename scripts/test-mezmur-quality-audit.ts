import assert from 'node:assert/strict'
import {
  applySafeFormatting,
  auditFormatting,
  normalizedLyric,
  recordingKey,
  tokenSimilarity,
} from '../src/lib/mezmur/qualityAudit.ts'

const geez = 'ወልደ እግዚአብሔር\nክብር ለእግዚአብሔር'
assert.equal(normalizedLyric(geez), normalizedLyric(geez.normalize('NFD')), 'Ethiopic text must survive Unicode normalization')
assert.equal(applySafeFormatting('  አዝ /2/  \r\n  መዝሙር  '), 'አዝ /2/\n  መዝሙር', 'safe formatting must retain repetition notation, words, and intentional indentation')
assert.equal(applySafeFormatting('ቃል\\nሌላ  '), 'ቃል\nሌላ', 'literal line-break escapes may be normalized without altering words')
assert.equal(applySafeFormatting(applySafeFormatting('ቃል\\nሌላ  ')), applySafeFormatting('ቃል\\nሌላ  '), 'safe formatting must be idempotent')
assert.equal(auditFormatting('አዝ /2/', 'lyrics_amharic').some((issue) => issue.kind === 'suspicious_repetition_marker'), true)
assert.equal(auditFormatting('ቃል \uFFFD', 'lyrics_amharic').some((issue) => issue.kind === 'replacement_character'), true)
assert.equal(recordingKey('https://www.youtube.com/watch?v=abc123&utm=campaign'), 'abc123')
assert.equal(recordingKey('https://youtu.be/abc123?t=5'), 'abc123')
assert.equal(tokenSimilarity('CHORUS እግዚአብሔር ፍቅር', 'VERSE 1 እግዚአብሔር ፍቅር') > 0.9, true)

console.log('PASS: Mezmur quality-audit Unicode and safe-formatting checks')
