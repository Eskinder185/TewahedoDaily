import * as fs from 'node:fs'
import { parseStructuredLyrics } from '../src/lib/mezmur/structuredLyricsParser.ts'

const backup = JSON.parse(fs.readFileSync('backup/MEZMUR_ORIGINAL_BACKUP.json', 'utf8'))

console.log('Total backup records:', backup.length)

// Let's inspect some of the 80 line mismatches to understand WHY they mismatch
let lineMismatchSamples: any[] = []
for (const r of backup) {
  if (r.lyrics_amharic && r.lyrics_transliteration) {
    const p = parseStructuredLyrics(r.lyrics_amharic, r.lyrics_transliteration)
    if (p.alignmentStatus === 'line_mismatch') {
      lineMismatchSamples.push({
        slug: r.slug,
        title: r.title,
        mismatches: p.mismatches,
        amharicSections: p.sections.map(s => ({
          label: s.label,
          lines: s.lines.map(l => l.originalText)
        })),
        translitSections: p.sections.map(s => ({
          label: s.label,
          lines: s.lines.map(l => l.transliterationText)
        }))
      })
    }
  }
}

console.log('Total line mismatches:', lineMismatchSamples.length)
for (let i = 0; i < Math.min(5, lineMismatchSamples.length); i++) {
  const sample = lineMismatchSamples[i]
  console.log(`\n======================================================`)
  console.log(`SAMPLE ${i + 1}: ${sample.slug} (${sample.title})`)
  console.log(`Mismatches:`, sample.mismatches)
  console.log(`--- Amharic Section 1 ---`)
  console.log(sample.amharicSections[0])
  console.log(`--- Transliteration Section 1 ---`)
  console.log(sample.translitSections[0])
}
