const fs = require('fs')

let file = fs.readFileSync('src/lib/synaxarium/synaxariumPresentation.ts', 'utf8')

const target = `  // Parenthetical transliterations: keep primary form short
  // "Kotolos (Cotylus)" stays; strip noisy multi-clause tails
  if (title.length > 72 && /,/.test(title)) {
    const first = title.split(',')[0]?.trim()
    if (first && first.length >= 8) title = first
  }`

const replacement = `  // Preserve full commemoration title; let layout handle wrapping cleanly.`

const normalizedTarget = target.replace(/\r?\n/g, '\r\n')
const normalizedReplacement = replacement.replace(/\r?\n/g, '\r\n')

if (file.includes(normalizedTarget)) {
  file = file.replace(normalizedTarget, normalizedReplacement)
  fs.writeFileSync('src/lib/synaxarium/synaxariumPresentation.ts', file, 'utf8')
  console.log('Successfully removed arbitrary 72-char comma truncation from synaxariumPresentation.ts')
} else {
  console.error('Target not found')
  process.exit(1)
}
