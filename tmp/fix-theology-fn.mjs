import fs from 'node:fs'

const path = new URL('../src/lib/searchBuddy/calendarStructuredSearch.ts', import.meta.url)
let src = fs.readFileSync(path, 'utf8')
const start = src.indexOf('export function isExplanatoryTheologyQuery')
const end = src.indexOf('function hasFeastSignal', start)
if (start < 0 || end < 0) {
  throw new Error(`markers not found start=${start} end=${end}`)
}

const replacement = `export function isExplanatoryTheologyQuery(text: string): boolean {
  const hay = normalizeCalendarIntentText(text)
  if (!hay) return false
  // Fold Ethiopic U+1225 into U+1235 so mystery/Trinity stems match both spellings.
  const folded = hay.replace(/\\u1225/g, '\\u1235')

  if (
    /\\b(explain|explanation|theolog(?:y|ical)|significance|meaning|doctrine|dogma|myster(?:y|ies)|sacrament(?:s)?|incarnation|trinity|theotokos|salvation|why)\\b/i.test(
      hay,
    )
  ) {
    return true
  }

  // "What are the Five Mysteries / Seven Sacraments ..." list-explain questions.
  if (
    /\\bwhat\\s+are\\s+the\\b/i.test(hay) &&
    /\\b(myster|sacrament|pillar|commandment)/i.test(hay)
  ) {
    return true
  }

  // Amharic: mystery / Trinity / why / meaning / significance
  return (
    folded.includes('\\u121D\\u1235\\u1322\\u122D') || // mystery stem
    folded.includes('\\u1235\\u120B\\u1234') || // Trinity stem
    hay.includes('\\u1235\\u1208\\u121D\\u1295') || // why
    hay.includes('\\u1275\\u122D\\u1309\\u121D') || // meaning
    hay.includes('\\u12A0\\u1235\\u1348\\u120B\\u130A') // significance-ish
  )
}

`

src = src.slice(0, start) + replacement + src.slice(end)
fs.writeFileSync(path, src)
console.log('rewrote isExplanatoryTheologyQuery ok')
