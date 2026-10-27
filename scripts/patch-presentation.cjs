const fs = require('fs')

let code = fs.readFileSync('src/lib/calendar/calendarPresentation.ts', 'utf8').replace(/\r\n/g, '\n')

// 1. Add import of getKnowledgeArticle
if (!code.includes("import { getKnowledgeArticle } from './calendarKnowledgeRegistry'")) {
  code = code.replace(
    "import type { ResolvedCalendarCard } from './resolveCalendarCard'",
    "import { getKnowledgeArticle } from './calendarKnowledgeRegistry'\nimport type { ResolvedCalendarCard } from './resolveCalendarCard'"
  )
}

// 2. Update fieldsFromDay
const oldFieldsFromDay = `function fieldsFromDay(row: DayEnrichedFields & { description?: string }): EnrichedContentFields {
  return {
    summary: row.summary,
    summaryAmharic: row.summaryAmharic,
    whatIsIt: row.whatIsIt,
    whatIsItAmharic: row.whatIsItAmharic,
    whyCelebrated: row.whyCelebrated,
    whyCelebratedAmharic: row.whyCelebratedAmharic,
    importantInformation: row.importantInformation,
    importantInformationAmharic: row.importantInformationAmharic,
    scriptureReferences: row.scriptureReferences,
    fastingNotes: row.fastingNotes,
    fastingNotesAmharic: row.fastingNotesAmharic,
    seasonNotes: row.seasonNotes,
    seasonNotesAmharic: row.seasonNotesAmharic,
    description: row.description,
    contentReviewStatus: row.contentReviewStatus,
  }
}`

const newFieldsFromDay = `function fieldsFromDay(
  row: DayEnrichedFields & { description?: string },
  lookupKey?: string | number | null,
): EnrichedContentFields {
  const article = lookupKey ? getKnowledgeArticle(lookupKey) : null

  return {
    summary: row.summary || article?.summary || null,
    summaryAmharic: row.summaryAmharic || article?.summaryAmharic || null,
    whatIsIt: row.whatIsIt || article?.whatIsIt || null,
    whatIsItAmharic: row.whatIsItAmharic || article?.whatIsItAmharic || null,
    historicalBackground: article?.historicalBackground || null,
    historicalBackgroundAmharic: article?.historicalBackgroundAmharic || null,
    whyCelebrated: row.whyCelebrated || article?.whyCelebrated || null,
    whyCelebratedAmharic: row.whyCelebratedAmharic || article?.whyCelebratedAmharic || null,
    theologicalMeaning: article?.theologicalMeaning || null,
    theologicalMeaningAmharic: article?.theologicalMeaningAmharic || null,
    traditionsPractices: article?.traditionsPractices || null,
    traditionsPracticesAmharic: article?.traditionsPracticesAmharic || null,
    importantInformation: row.importantInformation || article?.importantInformation || null,
    importantInformationAmharic: row.importantInformationAmharic || article?.importantInformationAmharic || null,
    scriptureReferences: row.scriptureReferences || article?.scriptureReferences || null,
    fastingNotes: row.fastingNotes || article?.fastingNotes || null,
    fastingNotesAmharic: row.fastingNotesAmharic || article?.fastingNotesAmharic || null,
    seasonNotes: row.seasonNotes || null,
    seasonNotesAmharic: row.seasonNotesAmharic || null,
    relatedMezmurs: article?.relatedMezmurs || null,
    relatedPrayers: article?.relatedPrayers || null,
    sources: article?.sources || null,
    sourcesAmharic: article?.sourcesAmharic || null,
    description: row.description || article?.summary || null,
    contentReviewStatus: row.contentReviewStatus || article?.researchStatus || null,
  }
}`

if (!code.includes(oldFieldsFromDay)) {
  console.error('Failed to find oldFieldsFromDay in calendarPresentation.ts')
  process.exit(1)
}
code = code.replace(oldFieldsFromDay, newFieldsFromDay)

// 3. Update callers of fieldsFromDay
code = code.replace(
  'export function presentObservance(\n  row: DayObservance,\n  cards: ResolvedCalendarCard[] = [],\n  ethMonthName?: string,\n  options?: { occurrenceDate?: Date | string | null; surface?: \'calendar\' | \'homepage\' },\n): PresentableCalendarEvent {\n  const fields = fieldsFromDay(row)',
  'export function presentObservance(\n  row: DayObservance,\n  cards: ResolvedCalendarCard[] = [],\n  ethMonthName?: string,\n  options?: { occurrenceDate?: Date | string | null; surface?: \'calendar\' | \'homepage\' },\n): PresentableCalendarEvent {\n  const fields = fieldsFromDay(row, row.slug || row.title)'
)

code = code.replace(
  'export function presentFast(\n  row: DayFast,\n  cards: ResolvedCalendarCard[] = [],\n  options?: { occurrenceDate?: Date | string | null; surface?: \'calendar\' | \'homepage\' },\n): PresentableCalendarEvent {\n  const fields = fieldsFromDay(row)',
  'export function presentFast(\n  row: DayFast,\n  cards: ResolvedCalendarCard[] = [],\n  options?: { occurrenceDate?: Date | string | null; surface?: \'calendar\' | \'homepage\' },\n): PresentableCalendarEvent {\n  const fields = fieldsFromDay(row, row.slug || row.name)'
)

code = code.replace(
  'export function presentSeason(\n  row: DaySeason,\n  cards: ResolvedCalendarCard[] = [],\n  options?: { occurrenceDate?: Date | string | null; surface?: \'calendar\' | \'homepage\' },\n): PresentableCalendarEvent {\n  const fields = fieldsFromDay(row)',
  'export function presentSeason(\n  row: DaySeason,\n  cards: ResolvedCalendarCard[] = [],\n  options?: { occurrenceDate?: Date | string | null; surface?: \'calendar\' | \'homepage\' },\n): PresentableCalendarEvent {\n  const fields = fieldsFromDay(row, row.slug || row.title)'
)

code = code.replace(
  'export function presentMonthly(\n  row: DayMonthlyCommemoration,\n  cards: ResolvedCalendarCard[] = [],\n  options?: { occurrenceDate?: Date | string | null; surface?: \'calendar\' | \'homepage\' },\n): PresentableCalendarEvent {\n  const fields = fieldsFromDay(row)',
  'export function presentMonthly(\n  row: DayMonthlyCommemoration,\n  cards: ResolvedCalendarCard[] = [],\n  options?: { occurrenceDate?: Date | string | null; surface?: \'calendar\' | \'homepage\' },\n): PresentableCalendarEvent {\n  const fields = fieldsFromDay(row, row.ethiopianDay || row.slug || row.title)'
)

fs.writeFileSync('src/lib/calendar/calendarPresentation.ts', code, 'utf8')
console.log('Successfully patched calendarPresentation.ts!')
