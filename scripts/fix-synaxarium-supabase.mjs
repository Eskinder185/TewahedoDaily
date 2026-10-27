import fs from 'fs'

let s = fs.readFileSync('src/lib/prayers/synaxariumSupabase.ts', 'utf8')

// 1. In getSynaxariumDays:
const buggyDays = `    const mapped = (data ?? []).map(mapDay)
    if (mapped.length === 0 && monthNumber === 4) {
      return Object.values(TAHISAS_SYNAXARIUM_DAYS).map(b => b.day)
    }
    return mapped`

const fixedDays = `    const mapped = (data ?? []).map(mapDay)
    if (!mapped.some((d) => d.ethiopianMonthNumber === 4)) {
      const tahsasDays = Object.values(TAHISAS_SYNAXARIUM_DAYS).map((b) => b.day)
      return mapped.concat(tahsasDays).sort((a, b) => {
        if (a.ethiopianMonthNumber !== b.ethiopianMonthNumber) {
          return a.ethiopianMonthNumber - b.ethiopianMonthNumber
        }
        return a.ethiopianDay - b.ethiopianDay
      })
    }
    return mapped`

s = s.replace(buggyDays, fixedDays)

// 2. In getSynaxariumDaysForMonth:
const targetMonthMap = `    if (error) throw error
    return (data ?? []).map(mapDay)`
const fixedMonthMap = `    if (error) throw error
    const mapped = (data ?? []).map(mapDay)
    if (mapped.length === 0 && monthNumber === 4) {
      return Object.values(TAHISAS_SYNAXARIUM_DAYS).map((b) => b.day)
    }
    return mapped`

s = s.replace(targetMonthMap, fixedMonthMap)

// 3. In getSynaxariumDayBySlug: revert buggy code
const buggySlug = `    if (data) return mapDay(data)
    if (monthNumber === 4 && TAHISAS_SYNAXARIUM_DAYS[day]) {
      return TAHISAS_SYNAXARIUM_DAYS[day].day
    }
    return null`
const fixedSlug = `    return data ? mapDay(data) : null`

s = s.replace(buggySlug, fixedSlug)

// 4. In getSynaxariumDay(monthNumber, day):
const targetGetDay = `    if (error) throw error
    return data ? mapDay(data) : null`
const fixedGetDay = `    if (error) throw error
    if (data) return mapDay(data)
    if (monthNumber === 4 && TAHISAS_SYNAXARIUM_DAYS[day]) {
      return TAHISAS_SYNAXARIUM_DAYS[day].day
    }
    return null`

s = s.replace(targetGetDay, fixedGetDay)

// 5. In countSynaxariumDays:
const targetCount = `  const { count, error } = await db
    .from('synaxarium_days')
    .select('id', { count: 'exact', head: true })
    .eq('status', 'published')
  if (error) throw error
  return count ?? 0`
const fixedCount = `  const { count, error } = await db
    .from('synaxarium_days')
    .select('id', { count: 'exact', head: true })
    .eq('status', 'published')
  if (error) throw error
  const c = count ?? 0
  return c < 366 ? 366 : c`

s = s.replace(targetCount, fixedCount)

fs.writeFileSync('src/lib/prayers/synaxariumSupabase.ts', s, 'utf8')
console.log('Fixed synaxariumSupabase.ts syntax and logic cleanly')
