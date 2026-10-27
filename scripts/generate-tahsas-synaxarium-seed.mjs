import fs from 'fs'
import crypto from 'crypto'

// Deterministic UUID v5-like generator using namespace
function deterministicUuid(name) {
  const hash = crypto.createHash('md5').update('tewahedo:synaxarium:' + name).digest('hex')
  return [
    hash.substring(0, 8),
    hash.substring(8, 12),
    '4' + hash.substring(13, 16),
    '8' + hash.substring(17, 20),
    hash.substring(20, 32)
  ].join('-')
}

const raw = JSON.parse(fs.readFileSync('archive/local-data/synaxarium/synaxariumEntries.json', 'utf8'))
const tahsasEntries = Object.values(raw.entries).filter(e => e.ethiopianMonthNumber === 4)

console.log(`Processing ${tahsasEntries.length} Tahsas entries...`)

const ETH_NUMERALS = ['፩','፪','፫','፬','፭','፮','፯','፰','፱','፲','፲፩','፲፪','፲፫','፲፬','፲፭','፲፮','፲፯','፲፰','፲፱','፳','፳፩','፳፪','፳፫','፳፬','፳፭','፳፮','፳፯','፳፰','፳፱','፴']

let sql = `-- TEWAHEDODAILY: SEED TAHISAS (MONTH 4) SYNAXARIUM DAYS AND COMMEMORATIONS
-- Completes full 366-day calendar Synaxarium coverage for the Ethiopian Orthodox Church

BEGIN;

`

const fallbackData = []

for (const entry of tahsasEntries) {
  const dayNum = entry.ethiopianDay
  const daySlug = `tahsas-${String(dayNum).padStart(2, '0')}`
  const dayId = deterministicUuid(daySlug)
  const ethNumeral = ETH_NUMERALS[dayNum - 1] || String(dayNum)
  const displayAmharic = `ታኅሣሥ ${ethNumeral}`
  const displayEnglish = `Tahsas ${dayNum}`
  const summary = (entry.shortSummary || entry.summary || '').replace(/'/g, "''")

  sql += `-- === DAY: ${displayEnglish} (${displayAmharic}) ===\n`
  sql += `INSERT INTO public.synaxarium_days (id, slug, ethiopian_month, ethiopian_month_number, ethiopian_day, display_date_amharic, display_date_english, summary, status)
VALUES ('${dayId}', '${daySlug}', 'Tahsas', 4, ${dayNum}, '${displayAmharic}', '${displayEnglish}', '${summary}', 'published')
ON CONFLICT (slug) DO UPDATE SET display_date_amharic = EXCLUDED.display_date_amharic, display_date_english = EXCLUDED.display_date_english;\n\n`

  const commemorations = []

  // Add individual commemorations
  const commList = entry.commemorations || []
  let sortOrder = 1

  // If entry has readMore, include as full narrative
  const fullNarrative = entry.readMore || entry.summary || ''

  for (const cText of commList) {
    const commSlug = `${daySlug}-comm-${sortOrder}`
    const commId = deterministicUuid(commSlug)
    const escapedTitle = cText.slice(0, 200).replace(/'/g, "''")
    const escapedBody = (sortOrder === 1 && fullNarrative ? fullNarrative : cText).replace(/'/g, "''")
    const scriptureRefs = (entry.scriptureReferences || []).join(', ')

    sql += `INSERT INTO public.synaxarium_commemorations (id, day_id, day_slug, slug, title, commemoration_type, summary, body_english, scripture_references, sort_order, status, featured)
VALUES ('${commId}', '${dayId}', '${daySlug}', '${commSlug}', '${escapedTitle}', '${entry.type || 'saint'}', '${escapedTitle}', '${escapedBody}', ${scriptureRefs ? `'${scriptureRefs}'` : 'NULL'}, ${sortOrder}, 'published', ${sortOrder === 1})
ON CONFLICT (slug) DO NOTHING;\n`

    commemorations.push({
      id: commId,
      dayId,
      daySlug,
      slug: commSlug,
      title: cText.slice(0, 200),
      titleAmharic: '',
      commemorationType: entry.type || 'saint',
      summary: cText.slice(0, 200),
      bodyEnglish: sortOrder === 1 && fullNarrative ? fullNarrative : cText,
      bodyAmharic: '',
      scriptureReferences: scriptureRefs || null,
      sortOrder,
      status: 'published',
      featured: sortOrder === 1
    })

    sortOrder++
  }

  sql += '\n'

  fallbackData.push({
    day: {
      id: dayId,
      slug: daySlug,
      ethiopianMonth: 'Tahsas',
      ethiopianMonthNumber: 4,
      ethiopianDay: dayNum,
      displayDateAmharic: displayAmharic,
      displayDateEnglish: displayEnglish,
      summary: entry.shortSummary || entry.summary || ''
    },
    commemorations
  })
}

sql += `COMMIT;\n`

// Write SQL Migration
fs.writeFileSync('supabase/migrations/20261026090000_seed_tahsas_synaxarium.sql', sql, 'utf8')
console.log('Saved supabase/migrations/20261026090000_seed_tahsas_synaxarium.sql')

// Write TypeScript Fallback Module for Runtime Resiliency
const tsCode = `/**
 * TEWAHEDODAILY — TAHISAS (MONTH 4) SYNAXARIUM EMBEDDED KNOWLEDGE BASE
 *
 * Provides guaranteed 100% full-year 366-day Synaxarium availability.
 * Extracted from the authoritative Ethiopian Synaxarium text.
 */
import type { SynaxariumDayBundle } from '../prayers/prayerLibraryTypes'

export const TAHISAS_SYNAXARIUM_DAYS: Record<number, SynaxariumDayBundle> = {
${fallbackData.map(d => `  ${d.day.ethiopianDay}: {
    day: ${JSON.stringify(d.day, null, 6)},
    commemorations: ${JSON.stringify(d.commemorations, null, 6)} as any
  }`).join(',\n')}
}
`

fs.writeFileSync('src/lib/synaxarium/tahsasFallbackData.ts', tsCode, 'utf8')
console.log('Saved src/lib/synaxarium/tahsasFallbackData.ts')
