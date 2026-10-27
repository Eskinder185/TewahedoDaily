import fs from 'fs'

let s = fs.readFileSync('src/services/dayChurchContext.ts', 'utf8')

// 1. DayMezmurRecommendation
s = s.replace(
  '  titleAmharic: string\n  language: string | null',
  '  titleAmharic: string\n  singerName?: string | null\n  hasPlayableMedia?: boolean\n  language: string | null'
)
s = s.replace(
  '  titleAmharic: string\r\n  language: string | null',
  '  titleAmharic: string\r\n  singerName?: string | null\r\n  hasPlayableMedia?: boolean\r\n  language: string | null'
)

// 2. DayChurchContext
s = s.replace(
  '  ethiopianLabel: string\n  dayTitle: string',
  '  ethiopianLabel: string\n  ethiopianLabelAmharic?: string\n  dayTitle: string'
)
s = s.replace(
  '  ethiopianLabel: string\r\n  dayTitle: string',
  '  ethiopianLabel: string\r\n  ethiopianLabelAmharic?: string\r\n  dayTitle: string'
)

// 3. fastingStatus
s = s.replace(
  '  fastingStatus: {\n    isFastDay: boolean\n    isFastFree: boolean\n    label: string | null',
  '  fastingStatus: {\n    isFastDay: boolean\n    isFastFree: boolean\n    isOptionalFast?: boolean\n    label: string | null'
)
s = s.replace(
  '  fastingStatus: {\r\n    isFastDay: boolean\r\n    isFastFree: boolean\r\n    label: string | null',
  '  fastingStatus: {\r\n    isFastDay: boolean\r\n    isFastFree: boolean\r\n    isOptionalFast?: boolean\r\n    label: string | null'
)

// 4. Return ethiopianLabelAmharic
s = s.replace(
  '    ethiopianLabel,\n    dayTitle,',
  '    ethiopianLabel,\n    ethiopianLabelAmharic,\n    dayTitle,'
)
s = s.replace(
  '    ethiopianLabel,\r\n    dayTitle,',
  '    ethiopianLabel,\r\n    ethiopianLabelAmharic,\r\n    dayTitle,'
)

fs.writeFileSync('src/services/dayChurchContext.ts', s, 'utf8')
console.log('Updated dayChurchContext.ts successfully')
