import { collapseLines } from '../src/lib/synaxarium/synaxariumPresentation'

function extractCompleteSynaxariumTitle(rawTitle: string | null | undefined, body: string | null | undefined): string {
  let title = (rawTitle || '').replace(/\r\n/g, ' ').replace(/\n+/g, ' ').replace(/\s+/g, ' ').trim()
  const source = (body || '').replace(/\r\n/g, ' ').replace(/\n+/g, ' ').replace(/\s+/g, ' ').trim()

  const hangingEnd = /(?:,?\s+(?:and|the|of|with|in|at|to|a|an|saint|abba|five\s+and))+$/i
  const brokenNarrativeStart = /^(?:on this day(?: also)?\s+)?(?:died|reposed|became|is commemorated|are commemorated)\b/i

  const isBroken = hangingEnd.test(title) || brokenNarrativeStart.test(title) || title.length < 5

  if (isBroken && source) {
    // Try to extract full name and subject from first sentence of source body
    const firstSentence = source.split(/[.\n]/)[0].trim()

    // 1. Died / Reposed pattern
    const diedMatch = firstSentence.match(/(?:died|reposed)\s+(?:the\s+holy\s+father,?\s+)?(.+)/i)
    if (diedMatch) {
      let subj = diedMatch[1].trim()
      // e.g. "Abba Agathon, the thirty-ninth Archbishop of the City of Alexandria"
      subj = subj.replace(/,\s+the\s+(\w+)\s+(?:Archbishop|Bishop|Patriarch)\s+of\s+(.+)/i, ' ($1 Archbishop of $2)')
      title = subj
    } else {
      // 2. Commemorated pattern
      const commMatch = firstSentence.match(/(?:is|are)\s+commemorated\s+(.+)/i)
      if (commMatch) {
        let subj = commMatch[1].trim()
        // e.g. "Paracu, and the five and forty righteous men of the city of Senan"
        subj = subj.replace(/the\s+five\s+and\s+forty\s+righteous\s+men/i, 'the forty-five righteous men')
        subj = subj.replace(/of the city of/i, 'of')
        title = subj
      } else {
        // 3. Fallback to general narrative opener
        const genMatch = firstSentence.match(/^On this day(?: also)?\s+(?:the\s+)?(.+)/i)
        if (genMatch) {
          title = genMatch[1].trim()
        }
      }
    }
  }

  // Clean remaining hanging ends
  title = title.replace(hangingEnd, '').trim()
  title = title.replace(/^(?:on this day(?: also)?\s+)/i, '')
  title = title.replace(/^(?:the repose of|the martyrdom of)\s+/i, '')
  title = title.replace(/\s+became\s+(?:a\s+)?martyrs?\.?$/i, '')
  title = title.replace(/^[a-z]/, (c) => c.toUpperCase())
  title = title.replace(/\.$/, '')

  return title
}

const samples = [
  {
    title: 'died the holy father, Abba Agathon, the',
    body: 'On this day died the holy father, Abba Agathon, the thirty-ninth Archbishop of the City of Alexandria.'
  },
  {
    title: 'Abba Agathon.',
    body: 'Salutation to Abba Agathon.'
  },
  {
    title: 'are commemorated Saint Abba Macrobius, and Saint',
    body: 'on this day also are commemorated Saint Abba Macrobius, and Saint Abba ‘Eblo (or Ablo) his brother, and Peter.'
  },
  {
    title: 'Macrobius, ‘Eblo, and Peter.',
    body: 'Salutation to Macrobius, ‘Eblo, and Peter.'
  },
  {
    title: 'are commemorated Paracu, and the five and',
    body: 'on this day also are commemorated Paracu, and the five and forty righteous men of the city of Senan.'
  }
]

for (const s of samples) {
  console.log('INPUT: ', s.title)
  console.log('OUTPUT:', extractCompleteSynaxariumTitle(s.title, s.body))
  console.log('---')
}
