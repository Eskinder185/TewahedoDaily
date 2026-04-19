/**
 * Reads a file containing one or more concatenated JSON objects `{...}{...}`
 * (string-aware) and writes a wrapper with `entries: [...]`.
 * Usage: node scripts/wrap-concat-json.mjs path/to/input.json path/to/output.json
 */
import fs from 'node:fs'

function extractJsonObjects(s) {
  const objs = []
  let i = 0
  while (i < s.length) {
    while (i < s.length && /\s/.test(s[i])) i++
    if (i >= s.length) break
    if (s[i] !== '{') throw new Error(`Expected { at ${i}`)
    let depth = 0
    let inStr = false
    let escape = false
    const start = i
    for (; i < s.length; i++) {
      const c = s[i]
      if (inStr) {
        if (escape) {
          escape = false
          continue
        }
        if (c === '\\') {
          escape = true
          continue
        }
        if (c === '"') {
          inStr = false
          continue
        }
        continue
      }
      if (c === '"') {
        inStr = true
        continue
      }
      if (c === '{') depth++
      else if (c === '}') {
        depth--
        if (depth === 0) {
          objs.push(JSON.parse(s.slice(start, i + 1)))
          i++
          break
        }
      }
    }
  }
  return objs
}

const [inPath, outPath] = process.argv.slice(2)
if (!inPath || !outPath) {
  console.error('Usage: node scripts/wrap-concat-json.mjs input.json output.json')
  process.exit(1)
}
const raw = fs.readFileSync(inPath, 'utf8')
const objs = extractJsonObjects(raw)
const out = {
  kind: 'chant',
  language: 'en',
  description: 'English mezmur chants for practice (chant workshop).',
  implementationNotes: 'Each entry matches MezmurEntry in src/data/types/mezmur.ts.',
  entries: objs,
}
fs.writeFileSync(outPath, JSON.stringify(out, null, 2), 'utf8')
console.log('entries:', objs.length)
