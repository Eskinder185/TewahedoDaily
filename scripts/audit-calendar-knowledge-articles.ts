import fs from 'fs'
import {
  MONTHLY_COMMEMORATION_ARTICLES,
  ANNUAL_AND_MOVABLE_FEAST_ARTICLES,
  CalendarKnowledgeArticle
} from '../src/lib/calendar/calendarKnowledgeRegistry'

console.log('--- AUDITING CALENDAR KNOWLEDGE ARTICLES ---')

const allArticles: CalendarKnowledgeArticle[] = []

// Monthly (1-30)
for (let day = 1; day <= 30; day++) {
  const art = MONTHLY_COMMEMORATION_ARTICLES[day]
  if (art) allArticles.push(art)
}

// Annual, Movable, Fasts, Seasons
for (const art of Object.values(ANNUAL_AND_MOVABLE_FEAST_ARTICLES)) {
  allArticles.push(art)
}

console.log(`Total Knowledge Articles in Registry: ${allArticles.length}`)

interface AuditRow {
  slug: string
  title: string
  titleAmharic: string
  category: string
  date: string
  allSectionsPresent: boolean
  missingSections: string[]
  englishWordCount: number
  amharicWordCount: number
  bilingualRatio: number
  hasCitations: boolean
  hasScripture: boolean
  hasFastingRules: boolean
  researchStatus: string
  semanticParityScore: number // 0-100%
  theologicalDepthFlag: 'verified_research' | 'mechanical_expansion' | 'summary_only'
}

const auditRows: AuditRow[] = []

const mandatoryFields = [
  'summary', 'summaryAmharic',
  'whatIsIt', 'whatIsItAmharic',
  'historicalBackground', 'historicalBackgroundAmharic',
  'whyCelebrated', 'whyCelebratedAmharic',
  'theologicalMeaning', 'theologicalMeaningAmharic',
  'traditionsPractices', 'traditionsPracticesAmharic',
  'importantInformation', 'importantInformationAmharic',
  'scriptureReferences',
  'sources', 'sourcesAmharic'
]

for (const art of allArticles) {
  const missing: string[] = []
  for (const f of mandatoryFields) {
    const val = (art as any)[f]
    if (!val || typeof val !== 'string' || val.trim().length === 0) {
      missing.push(f)
    }
  }

  // Count words
  const enText = [
    art.summary,
    art.whatIsIt,
    art.historicalBackground,
    art.whyCelebrated,
    art.theologicalMeaning,
    art.traditionsPractices,
    art.importantInformation,
    art.fastingNotes || ''
  ].join(' ')

  const amText = [
    art.summaryAmharic,
    art.whatIsItAmharic,
    art.historicalBackgroundAmharic,
    art.whyCelebratedAmharic,
    art.theologicalMeaningAmharic,
    art.traditionsPracticesAmharic,
    art.importantInformationAmharic,
    art.fastingNotesAmharic || ''
  ].join(' ')

  const enWords = enText.trim().split(/\s+/).filter(Boolean).length
  const amWords = amText.trim().split(/\s+/).filter(Boolean).length
  const ratio = enWords > 0 ? Number((amWords / enWords).toFixed(2)) : 0

  const hasCitations = Boolean(art.sources && art.sources.trim().length > 10)
  const hasScripture = Boolean(art.scriptureReferences && art.scriptureReferences.trim().length > 5)
  const hasFasting = Boolean(art.fastingNotes && art.fastingNotes.trim().length > 5)

  // Depth flag
  let depthFlag: 'verified_research' | 'mechanical_expansion' | 'summary_only' = 'verified_research'
  if (enWords < 80 || amWords < 50) {
    depthFlag = 'summary_only'
  } else if (!hasCitations || !hasScripture) {
    depthFlag = 'mechanical_expansion'
  }

  // Semantic parity score
  let parity = 100
  if (missing.length > 0) parity -= missing.length * 5
  if (ratio < 0.4 || ratio > 2.5) parity -= 20
  if (!hasCitations) parity -= 15
  if (!hasScripture) parity -= 10
  if (parity < 0) parity = 0

  const dateStr = art.ethiopianMonthNumber && art.ethiopianDay
    ? `M${art.ethiopianMonthNumber} D${art.ethiopianDay}`
    : art.isMonthly ? `Day ${art.ethiopianDay || 'N/A'} (Monthly)` : 'Movable'

  auditRows.push({
    slug: art.slug,
    title: art.title,
    titleAmharic: art.titleAmharic,
    category: art.category,
    date: dateStr,
    allSectionsPresent: missing.length === 0,
    missingSections: missing,
    englishWordCount: enWords,
    amharicWordCount: amWords,
    bilingualRatio: ratio,
    hasCitations,
    hasScripture,
    hasFastingRules: hasFasting,
    researchStatus: art.researchStatus,
    semanticParityScore: parity,
    theologicalDepthFlag: depthFlag
  })
}

// Generate CSV
const csvHeaders = [
  'slug',
  'title',
  'title_amharic',
  'category',
  'liturgical_date',
  'complete_11_sections',
  'missing_sections',
  'en_words',
  'am_words',
  'am_en_ratio',
  'has_citations',
  'has_scripture',
  'has_fasting_rules',
  'research_status',
  'semantic_parity_pct',
  'depth_classification'
]

const csvLines = [csvHeaders.join(',')]
for (const r of auditRows) {
  csvLines.push([
    JSON.stringify(r.slug),
    JSON.stringify(r.title),
    JSON.stringify(r.titleAmharic),
    JSON.stringify(r.category),
    JSON.stringify(r.date),
    r.allSectionsPresent ? 'YES' : 'NO',
    JSON.stringify(r.missingSections.join('; ')),
    r.englishWordCount,
    r.amharicWordCount,
    r.bilingualRatio,
    r.hasCitations ? 'YES' : 'NO',
    r.hasScripture ? 'YES' : 'NO',
    r.hasFastingRules ? 'YES' : 'NO',
    JSON.stringify(r.researchStatus),
    r.semanticParityScore,
    r.theologicalDepthFlag
  ].join(','))
}

fs.writeFileSync('CONTENT_ACCURACY_AUDIT.csv', csvLines.join('\n'), 'utf8')
console.log(`Saved CONTENT_ACCURACY_AUDIT.csv (${auditRows.length} entries)`)

// Summary statistics
const completeCount = auditRows.filter(r => r.allSectionsPresent).length
const verifiedCount = auditRows.filter(r => r.theologicalDepthFlag === 'verified_research').length
const citationCount = auditRows.filter(r => r.hasCitations).length
const scriptureCount = auditRows.filter(r => r.hasScripture).length
const fastingCount = auditRows.filter(r => r.hasFastingRules).length
const avgParity = (auditRows.reduce((acc, r) => acc + r.semanticParityScore, 0) / auditRows.length).toFixed(1)

console.log({
  total_articles: auditRows.length,
  complete_11_sections: completeCount,
  theological_verified_research: verifiedCount,
  with_authoritative_citations: citationCount,
  with_scriptural_references: scriptureCount,
  with_fasting_rules: fastingCount,
  average_semantic_parity_pct: avgParity
})
