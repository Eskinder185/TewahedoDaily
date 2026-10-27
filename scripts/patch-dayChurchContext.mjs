import fs from 'fs'

let s = fs.readFileSync('src/services/dayChurchContext.ts', 'utf8')

// 1. Update imports
s = s.replace(
  "import { gregorianToEthiopian, formatEthiopianLong, ETHIOPIAN_MONTH_NAMES } from '../lib/ethiopianDate'",
  "import { gregorianToEthiopian, formatEthiopianLong, formatEthiopianDate, ETHIOPIAN_MONTH_NAMES } from '../lib/ethiopianDate'"
)

// 2. Update DayMezmurRecommendation interface
s = s.replace(
  `export type DayMezmurRecommendation = {
  id: string
  slug: string
  title: string
  titleAmharic: string
  language: string | null`,
  `export type DayMezmurRecommendation = {
  id: string
  slug: string
  title: string
  titleAmharic: string
  singerName?: string | null
  hasPlayableMedia?: boolean
  language: string | null`
)

// 3. Update DayChurchContext interface
s = s.replace(
  `  ethiopianLabel: string
  dayTitle: string`,
  `  ethiopianLabel: string
  ethiopianLabelAmharic?: string
  dayTitle: string`
)

s = s.replace(
  `  fastingStatus: {
    isFastDay: boolean
    isFastFree: boolean
    label: string | null
    exceptionNote: string | null
  }`,
  `  fastingStatus: {
    isFastDay: boolean
    isFastFree: boolean
    isOptionalFast?: boolean
    label: string | null
    exceptionNote: string | null
  }`
)

// 4. Update ethiopianLabel computation
s = s.replace(
  "const ethiopianLabel = `${formatEthiopianLong(eth)} E.C.`",
  "const ethiopianLabel = formatEthiopianLong(eth)\n  const ethiopianLabelAmharic = formatEthiopianDate(eth, 'am', { includeYear: true })"
)

// 5. Update mezmurRecommendations mapping
s = s.replace(
  `    title: m.title,
    titleAmharic: m.titleAmharic || m.title,
    language: null,`,
  `    title: m.title,
    titleAmharic: m.titleAmharic || m.title,
    singerName: m.singerName ?? null,
    hasPlayableMedia: m.hasPlayableMedia,
    language: null,`
)

// 6. Return ethiopianLabelAmharic in buildDayChurchContext
s = s.replace(
  `    ethiopianDate: eth,
    ethiopianLabel,
    dayTitle: primaryTitle || orthodox.season?.title || weekdayLabel,`,
  `    ethiopianDate: eth,
    ethiopianLabel,
    ethiopianLabelAmharic,
    dayTitle: primaryTitle || orthodox.season?.title || weekdayLabel,`
)

fs.writeFileSync('src/services/dayChurchContext.ts', s, 'utf8')
console.log('Successfully patched dayChurchContext.ts')
