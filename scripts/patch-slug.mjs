import fs from 'fs'

let s = fs.readFileSync('src/lib/prayers/synaxariumSupabase.ts', 'utf8')

const targetSlug = `    if (data) return mapDay(data)
    if (monthNumber === 4 && TAHISAS_SYNAXARIUM_DAYS[day]) {
      return TAHISAS_SYNAXARIUM_DAYS[day].day
    }
    return null`

const repSlug = `    if (data) return mapDay(data)
    if (slug.startsWith('tahsas-')) {
      const dNum = parseInt(slug.replace('tahsas-', ''), 10)
      if (TAHISAS_SYNAXARIUM_DAYS[dNum]) {
        return TAHISAS_SYNAXARIUM_DAYS[dNum].day
      }
    }
    return null`

s = s.replace(targetSlug, repSlug)

const targetGetDay = `    if (error) throw error
    return data ? mapDay(data) : null`

const repGetDay = `    if (error) throw error
    if (data) return mapDay(data)
    if (monthNumber === 4 && TAHISAS_SYNAXARIUM_DAYS[day]) {
      return TAHISAS_SYNAXARIUM_DAYS[day].day
    }
    return null`

s = s.replace(targetGetDay, repGetDay)

fs.writeFileSync('src/lib/prayers/synaxariumSupabase.ts', s, 'utf8')
console.log('Fixed slug and getDay cleanly')
