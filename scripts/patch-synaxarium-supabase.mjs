import fs from 'fs'

let s = fs.readFileSync('src/lib/prayers/synaxariumSupabase.ts', 'utf8')

// Add import
if (!s.includes('TAHISAS_SYNAXARIUM_DAYS')) {
  s = s.replace(
    "import { parseKeywordsFromDb } from '../synaxarium/keywords'",
    "import { parseKeywordsFromDb } from '../synaxarium/keywords'\nimport { TAHISAS_SYNAXARIUM_DAYS } from '../synaxarium/tahsasFallbackData'"
  )
}

// In getSynaxariumDaysForMonth: return Tahsas if empty
const oldMonthMap = "    if (error) throw error\n    return (data ?? []).map(mapDay)"
const newMonthMap = `    if (error) throw error
    const mapped = (data ?? []).map(mapDay)
    if (mapped.length === 0 && monthNumber === 4) {
      return Object.values(TAHISAS_SYNAXARIUM_DAYS).map(b => b.day)
    }
    return mapped`

if (s.includes(oldMonthMap)) {
  s = s.replace(oldMonthMap, newMonthMap)
} else {
  // Try CRLF
  const oldMonthMapCRLF = "    if (error) throw error\r\n    return (data ?? []).map(mapDay)"
  s = s.replace(oldMonthMapCRLF, newMonthMap)
}

// In getSynaxariumDay: return Tahsas if not found
const oldGetDay = "    if (error) throw error\n    return data ? mapDay(data) : null"
const newGetDay = `    if (error) throw error
    if (data) return mapDay(data)
    if (monthNumber === 4 && TAHISAS_SYNAXARIUM_DAYS[day]) {
      return TAHISAS_SYNAXARIUM_DAYS[day].day
    }
    return null`

if (s.includes(oldGetDay)) {
  s = s.replace(oldGetDay, newGetDay)
} else {
  const oldGetDayCRLF = "    if (error) throw error\r\n    return data ? mapDay(data) : null"
  s = s.replace(oldGetDayCRLF, newGetDay)
}

// In getSynaxariumDayWithCommemorations:
s = s.replace(
  "if (synDay) return { day: synDay, commemorations }",
  `if (synDay && commemorations.length > 0) return { day: synDay, commemorations }
  if (monthNumber === 4 && TAHISAS_SYNAXARIUM_DAYS[day]) {
    return TAHISAS_SYNAXARIUM_DAYS[day]
  }
  if (synDay) return { day: synDay, commemorations }`
)

fs.writeFileSync('src/lib/prayers/synaxariumSupabase.ts', s, 'utf8')
console.log('Successfully updated synaxariumSupabase.ts with Tahsas fallback')
