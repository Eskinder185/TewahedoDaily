const fs = require('fs')

let code = fs.readFileSync('src/lib/calendar/calendarEnrichedContent.ts', 'utf8')

// Normalize to LF first to do clean replaces, then write back
code = code.replace(/\r\n/g, '\n')

const oldFields = `export type EnrichedContentFields = {
  summary?: string | null
  summaryAmharic?: string | null
  whatIsIt?: string | null
  whatIsItAmharic?: string | null
  whyCelebrated?: string | null
  whyCelebratedAmharic?: string | null
  importantInformation?: string | null
  importantInformationAmharic?: string | null
  scriptureReferences?: string | null
  fastingNotes?: string | null
  fastingNotesAmharic?: string | null
  seasonNotes?: string | null
  seasonNotesAmharic?: string | null
  description?: string | null
  contentReviewStatus?: string | null
}`

const newFields = `export type EnrichedContentFields = {
  summary?: string | null
  summaryAmharic?: string | null
  whatIsIt?: string | null
  whatIsItAmharic?: string | null
  historicalBackground?: string | null
  historicalBackgroundAmharic?: string | null
  whyCelebrated?: string | null
  whyCelebratedAmharic?: string | null
  theologicalMeaning?: string | null
  theologicalMeaningAmharic?: string | null
  traditionsPractices?: string | null
  traditionsPracticesAmharic?: string | null
  importantInformation?: string | null
  importantInformationAmharic?: string | null
  scriptureReferences?: string | null
  fastingNotes?: string | null
  fastingNotesAmharic?: string | null
  seasonNotes?: string | null
  seasonNotesAmharic?: string | null
  relatedMezmurs?: string | null
  relatedPrayers?: string | null
  sources?: string | null
  sourcesAmharic?: string | null
  description?: string | null
  contentReviewStatus?: string | null
}`

if (!code.includes(oldFields)) {
  console.error('Failed to find oldFields in calendarEnrichedContent.ts')
  process.exit(1)
}
code = code.replace(oldFields, newFields)

const helpers = `
export function enrichedHistory(fields: EnrichedContentFields): BilingualBlock {
  return bilingualField(
    fields.historicalBackground,
    fields.historicalBackgroundAmharic,
    null,
    fields.contentReviewStatus,
  )
}

export function enrichedTheology(fields: EnrichedContentFields): BilingualBlock {
  return bilingualField(
    fields.theologicalMeaning,
    fields.theologicalMeaningAmharic,
    null,
    fields.contentReviewStatus,
  )
}

export function enrichedTraditions(fields: EnrichedContentFields): BilingualBlock {
  return bilingualField(
    fields.traditionsPractices,
    fields.traditionsPracticesAmharic,
    null,
    fields.contentReviewStatus,
  )
}

export function enrichedMezmurs(fields: EnrichedContentFields): BilingualBlock {
  return bilingualField(fields.relatedMezmurs, fields.relatedMezmurs, null, fields.contentReviewStatus)
}

export function enrichedPrayers(fields: EnrichedContentFields): BilingualBlock {
  return bilingualField(fields.relatedPrayers, fields.relatedPrayers, null, fields.contentReviewStatus)
}

export function enrichedSources(fields: EnrichedContentFields): BilingualBlock {
  return bilingualField(fields.sources, fields.sourcesAmharic, null, fields.contentReviewStatus)
}
`

code = code.replace('export function enrichedScripture', helpers + '\nexport function enrichedScripture')

const oldSections = `export function buildDetailSections(fields: EnrichedContentFields): DetailSection[] {
  const sections: DetailSection[] = []
  const what = enrichedWhatIsIt(fields)
  if (what.english || what.amharic) {
    sections.push({ id: 'what', title: 'What is this?', english: what.english, amharic: what.amharic })
  }
  const why = enrichedWhy(fields)
  if (why.english || why.amharic) {
    sections.push({
      id: 'why',
      title: 'Why is it celebrated?',
      english: why.english,
      amharic: why.amharic,
    })
  }
  const important = enrichedImportant(fields)
  if (important.english || important.amharic) {
    sections.push({
      id: 'important',
      title: 'Important information',
      english: important.english,
      amharic: important.amharic,
    })
  }
  const scripture = enrichedScripture(fields)
  if (scripture) {
    sections.push({ id: 'scripture', title: 'Scripture', english: scripture, amharic: '' })
  }
  const fasting = enrichedFasting(fields)
  if (fasting.english || fasting.amharic) {
    sections.push({
      id: 'fasting',
      title: 'Fasting information',
      english: fasting.english,
      amharic: fasting.amharic,
    })
  }
  const season = enrichedSeason(fields)
  if (season.english || season.amharic) {
    sections.push({
      id: 'season',
      title: 'Season information',
      english: season.english,
      amharic: season.amharic,
    })
  }
  return sections
}`

const newSections = `export function buildDetailSections(fields: EnrichedContentFields): DetailSection[] {
  const sections: DetailSection[] = []

  // 1. What is this?
  const what = enrichedWhatIsIt(fields)
  if (what.english || what.amharic) {
    sections.push({ id: 'what', title: 'What is this?', english: what.english, amharic: what.amharic })
  }

  // 2. Historical background / The story
  const history = enrichedHistory(fields)
  if (history.english || history.amharic) {
    sections.push({
      id: 'history',
      title: 'Historical background',
      english: history.english,
      amharic: history.amharic,
    })
  }

  // 3. Why is it celebrated?
  const why = enrichedWhy(fields)
  if (why.english || why.amharic) {
    sections.push({
      id: 'why',
      title: 'Why is it celebrated?',
      english: why.english,
      amharic: why.amharic,
    })
  }

  // 4. Theological meaning
  const theology = enrichedTheology(fields)
  if (theology.english || theology.amharic) {
    sections.push({
      id: 'theology',
      title: 'Theological meaning',
      english: theology.english,
      amharic: theology.amharic,
    })
  }

  // 5. Traditions and practices
  const traditions = enrichedTraditions(fields)
  if (traditions.english || traditions.amharic) {
    sections.push({
      id: 'traditions',
      title: 'Traditions and practices',
      english: traditions.english,
      amharic: traditions.amharic,
    })
  }

  // 6. Important information
  const important = enrichedImportant(fields)
  if (important.english || important.amharic) {
    sections.push({
      id: 'important',
      title: 'Important information',
      english: important.english,
      amharic: important.amharic,
    })
  }

  // 7. Fasting information
  const fasting = enrichedFasting(fields)
  if (fasting.english || fasting.amharic) {
    sections.push({
      id: 'fasting',
      title: 'Fasting information',
      english: fasting.english,
      amharic: fasting.amharic,
    })
  }

  // 8. Season information
  const season = enrichedSeason(fields)
  if (season.english || season.amharic) {
    sections.push({
      id: 'season',
      title: 'Season information',
      english: season.english,
      amharic: season.amharic,
    })
  }

  // 9. Scripture & Bible connections
  const scripture = enrichedScripture(fields)
  if (scripture) {
    sections.push({ id: 'scripture', title: 'Scripture', english: scripture, amharic: '' })
  }

  // 10. Related Mezmurs
  const mezmurs = enrichedMezmurs(fields)
  if (mezmurs.english || mezmurs.amharic) {
    sections.push({
      id: 'mezmurs',
      title: 'Related Mezmurs',
      english: mezmurs.english,
      amharic: mezmurs.amharic,
    })
  }

  // 11. Related prayers & Church documents
  const prayers = enrichedPrayers(fields)
  if (prayers.english || prayers.amharic) {
    sections.push({
      id: 'prayers',
      title: 'Related prayers & resources',
      english: prayers.english,
      amharic: prayers.amharic,
    })
  }

  // 12. Authoritative sources & citations
  const sources = enrichedSources(fields)
  if (sources.english || sources.amharic) {
    sections.push({
      id: 'sources',
      title: 'Sources & citations',
      english: sources.english,
      amharic: sources.amharic,
    })
  }

  return sections
}`

if (!code.includes(oldSections)) {
  console.error('Failed to find oldSections in calendarEnrichedContent.ts')
  process.exit(1)
}
code = code.replace(oldSections, newSections)

fs.writeFileSync('src/lib/calendar/calendarEnrichedContent.ts', code, 'utf8')
console.log('Successfully patched calendarEnrichedContent.ts!')
