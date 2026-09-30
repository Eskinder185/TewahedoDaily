/**
 * Build the master EOTC calendar research dataset for Tewahedo Daily.
 *
 * Merges:
 * - src/data/synaxariumEntries.json (366 Synaxarium day extracts)
 * - src/data/eotc_calendar_json/* (feasts, fasts, monthly, seasons, paschal)
 * - cross-checked monthly table from parish/reference sources
 *
 * Outputs UTF-8-SIG CSVs + markdown reports under research/eotc-calendar/
 *
 * Does NOT invent religious facts. Unverified fields stay blank and are flagged.
 */
import { readFileSync, writeFileSync, mkdirSync } from 'node:fs'
import { dirname, join } from 'node:path'
import { fileURLToPath } from 'node:url'

const __dirname = dirname(fileURLToPath(import.meta.url))
const ROOT = join(__dirname, '..')
const OUT = join(ROOT, 'research', 'eotc-calendar')

const MONTHS = [
  { number: 1, name: 'Meskerem', days: 30 },
  { number: 2, name: 'Tikimt', days: 30 },
  { number: 3, name: 'Hidar', days: 30 },
  { number: 4, name: 'Tahsas', days: 30 },
  { number: 5, name: 'Tir', days: 30 },
  { number: 6, name: 'Yekatit', days: 30 },
  { number: 7, name: 'Megabit', days: 30 },
  { number: 8, name: 'Miazia', days: 30 },
  { number: 9, name: 'Ginbot', days: 30 },
  { number: 10, name: 'Sene', days: 30 },
  { number: 11, name: 'Hamle', days: 30 },
  { number: 12, name: 'Nehase', days: 30 },
  { number: 13, name: 'Pagumen', days: 6 },
]

const MONTH_ALIASES = new Map(
  Object.entries({
    meskerem: 1,
    maskaram: 1,
    tikimt: 2,
    tekemt: 2,
    teqemt: 2,
    hidar: 3,
    hedar: 3,
    tahsas: 4,
    tahisas: 4,
    tir: 5,
    ter: 5,
    yekatit: 6,
    yakatit: 6,
    megabit: 7,
    magabit: 7,
    miazia: 8,
    miyazya: 8,
    miyazia: 8,
    ginbot: 9,
    genbot: 9,
    sene: 10,
    senne: 10,
    sane: 10,
    hamle: 11,
    nehase: 12,
    nehasse: 12,
    nahasse: 12,
    pagumen: 13,
    paguemen: 13,
  }),
)

/** Cross-checked monthly commemorations (day-of-month → entries). */
const MONTHLY_TABLE = [
  {
    day: 1,
    title: 'Lideta (Birth of the Holy Virgin Mary) / Elias (Elijah)',
    type: 'mary',
    amharic: '',
    transliteration: 'Lideta / Elias',
    confidence: 'high',
    sources: ['stmaryeotctoronto-liturgical-calendar', 'wikipedia-tewahedo-calendar'],
  },
  {
    day: 2,
    title: 'Thaddius',
    type: 'saint',
    amharic: '',
    transliteration: 'Thaddius',
    confidence: 'medium',
    sources: ['stmaryeotctoronto-liturgical-calendar', 'wikipedia-tewahedo-calendar'],
  },
  {
    day: 3,
    title: "Be'eta (Presentation of the Holy Virgin)",
    type: 'mary',
    amharic: '',
    transliteration: "Be'eta",
    confidence: 'high',
    sources: ['stmaryeotctoronto-liturgical-calendar', 'wikipedia-tewahedo-calendar'],
  },
  {
    day: 4,
    title: 'Yohannes Wolde Negedgad (John Son of Thunder)',
    type: 'saint',
    amharic: '',
    transliteration: 'Yohannes Wolde Negedgad',
    confidence: 'medium',
    sources: ['stmaryeotctoronto-liturgical-calendar', 'wikipedia-tewahedo-calendar'],
  },
  {
    day: 5,
    title: 'Petros and Paulos / Gebre Menfes Kidus',
    type: 'apostle',
    amharic: '',
    transliteration: 'Petros we Paulos / Gebre Menfes Kidus',
    confidence: 'high',
    sources: ['stmaryeotctoronto-liturgical-calendar', 'wikipedia-tewahedo-calendar'],
  },
  {
    day: 6,
    title: 'Our Lady of Qusquam',
    type: 'mary',
    amharic: '',
    transliteration: 'Qusquam',
    confidence: 'medium',
    sources: ['stmaryeotctoronto-liturgical-calendar', 'wikipedia-tewahedo-calendar'],
  },
  {
    day: 7,
    title: 'Holy Trinity',
    type: 'trinity',
    amharic: 'ቅድስት ሥላሴ',
    transliteration: 'Kidist Selassie',
    confidence: 'high',
    sources: ['stmaryeotctoronto-services', 'stmaryeotctoronto-liturgical-calendar', 'wikipedia-tewahedo-calendar'],
  },
  {
    day: 8,
    title: 'Kiros (Cyrus) / Abba Banuda',
    type: 'saint',
    amharic: '',
    transliteration: 'Kiros / Abba Banuda',
    confidence: 'medium',
    sources: ['stmaryeotctoronto-liturgical-calendar', 'wikipedia-tewahedo-calendar'],
  },
  {
    day: 9,
    title: 'Thomas (not the Apostle)',
    type: 'saint',
    amharic: '',
    transliteration: 'Thomas',
    confidence: 'medium',
    sources: ['stmaryeotctoronto-liturgical-calendar', 'wikipedia-tewahedo-calendar'],
  },
  {
    day: 10,
    title: 'Kidus Meskel (Holy Cross)',
    type: 'feast',
    amharic: '',
    transliteration: 'Kidus Meskel',
    confidence: 'high',
    sources: ['stmaryeotctoronto-liturgical-calendar', 'wikipedia-tewahedo-calendar'],
  },
  {
    day: 11,
    title: 'Hanna and Iyaqem / Fasilides',
    type: 'saint',
    amharic: '',
    transliteration: 'Hanna we Iyaqem / Fasilides',
    confidence: 'medium',
    sources: ['stmaryeotctoronto-liturgical-calendar', 'wikipedia-tewahedo-calendar'],
  },
  {
    day: 12,
    title: 'Saint Michael the Archangel',
    type: 'angel',
    amharic: 'ቅዱስ ሚካኤል',
    transliteration: 'Kidus Mikael',
    confidence: 'high',
    sources: ['stmaryeotctoronto-services', 'stmaryeotctoronto-liturgical-calendar', 'wikipedia-tewahedo-calendar', 'eotc-monthly-json'],
  },
  {
    day: 13,
    title: 'Igziabher Ab / Raphael the Archangel',
    type: 'angel',
    amharic: '',
    transliteration: 'Igziabher Ab / Ruphael',
    confidence: 'medium',
    sources: ['stmaryeotctoronto-liturgical-calendar', 'wikipedia-tewahedo-calendar'],
  },
  {
    day: 14,
    title: 'Abuna Aregawi / Gebre Kristos',
    type: 'saint',
    amharic: '',
    transliteration: 'Abuna Aregawi / Gebre Kristos',
    confidence: 'medium',
    sources: ['stmaryeotctoronto-liturgical-calendar', 'wikipedia-tewahedo-calendar'],
  },
  {
    day: 15,
    title: 'Kirkos and Iyeluta (Cyricus and Julitta)',
    type: 'martyr',
    amharic: '',
    transliteration: 'Kirkos we Iyeluta',
    confidence: 'high',
    sources: ['stmaryeotctoronto-liturgical-calendar', 'wikipedia-tewahedo-calendar'],
  },
  {
    day: 16,
    title: 'Kidane Mihret (Covenant of Mercy)',
    type: 'mary',
    amharic: 'ኪዳነ ምህረት',
    transliteration: 'Kidane Mihret',
    confidence: 'high',
    sources: ['stmaryeotctoronto-services', 'stmaryeotctoronto-liturgical-calendar', 'wikipedia-tewahedo-calendar'],
  },
  {
    day: 17,
    title: 'Estifanos (Stephen) / Abba Gerima',
    type: 'martyr',
    amharic: '',
    transliteration: 'Estifanos / Abba Gerima',
    confidence: 'high',
    sources: ['stmaryeotctoronto-liturgical-calendar', 'wikipedia-tewahedo-calendar'],
  },
  {
    day: 18,
    title: 'Ewostatewos',
    type: 'saint',
    amharic: '',
    transliteration: 'Ewostatewos',
    confidence: 'medium',
    sources: ['stmaryeotctoronto-liturgical-calendar', 'wikipedia-tewahedo-calendar'],
  },
  {
    day: 19,
    title: 'Saint Gabriel the Archangel',
    type: 'angel',
    amharic: 'ቅዱስ ገብርኤል',
    transliteration: 'Kidus Gebriel',
    confidence: 'high',
    sources: [
      'stmaryeotctoronto-services',
      'stmaryeotctoronto-liturgical-calendar',
      'wikipedia-tewahedo-calendar',
      'eotcmk-gabriel',
      'eotc-monthly-json',
    ],
  },
  {
    day: 20,
    title: 'Hnstata',
    type: 'other',
    amharic: '',
    transliteration: 'Hnstata',
    confidence: 'low',
    sources: ['stmaryeotctoronto-liturgical-calendar', 'wikipedia-tewahedo-calendar'],
  },
  {
    day: 21,
    title: 'Holy Virgin Mary, Mother of God',
    type: 'mary',
    amharic: 'ቅድስት ድንግል ማርያም',
    transliteration: 'Kidist Dingil Mariam',
    confidence: 'high',
    sources: ['stmaryeotctoronto-services', 'stmaryeotctoronto-liturgical-calendar', 'wikipedia-tewahedo-calendar', 'eotc-monthly-json'],
  },
  {
    day: 22,
    title: 'Deqsius / Uriel the Archangel',
    type: 'angel',
    amharic: 'ቅዱስ ኡራኤል',
    transliteration: 'Deqsius / Kidus Uriel',
    confidence: 'medium',
    sources: ['stmaryeotctoronto-services', 'stmaryeotctoronto-liturgical-calendar', 'wikipedia-tewahedo-calendar', 'eotc-monthly-json'],
    notes: 'Parish sources list Uriel; Wikipedia lists Deqsius with Uriel. Record both.',
  },
  {
    day: 23,
    title: 'Georgis (Saint George)',
    type: 'martyr',
    amharic: 'ቅዱስ ጊዮርጊስ',
    transliteration: 'Kidus Giyorgis',
    confidence: 'high',
    sources: ['stmaryeotctoronto-liturgical-calendar', 'wikipedia-tewahedo-calendar', 'eotc-monthly-json'],
  },
  {
    day: 24,
    title: 'Abune Tekle Haymanot / Twenty-Four Heavenly Priests',
    type: 'saint',
    amharic: '',
    transliteration: 'Abune Tekle Haymanot',
    confidence: 'high',
    sources: ['stmaryeotctoronto-liturgical-calendar', 'wikipedia-tewahedo-calendar'],
  },
  {
    day: 25,
    title: 'Merkorios (Saint Mercurius)',
    type: 'martyr',
    amharic: '',
    transliteration: 'Merkorios',
    confidence: 'high',
    sources: ['stmaryeotctoronto-liturgical-calendar', 'wikipedia-tewahedo-calendar'],
  },
  {
    day: 26,
    title: 'Thomas the Apostle',
    type: 'apostle',
    amharic: '',
    transliteration: 'Thomas',
    confidence: 'high',
    sources: ['stmaryeotctoronto-liturgical-calendar', 'wikipedia-tewahedo-calendar'],
  },
  {
    day: 27,
    title: 'Medhane Alem (Savior of the World)',
    type: 'christ',
    amharic: '',
    transliteration: 'Medhane Alem',
    confidence: 'high',
    sources: ['stmaryeotctoronto-liturgical-calendar', 'wikipedia-tewahedo-calendar'],
  },
  {
    day: 28,
    title: 'Immanuel',
    type: 'christ',
    amharic: '',
    transliteration: 'Immanuel',
    confidence: 'high',
    sources: ['stmaryeotctoronto-liturgical-calendar', 'wikipedia-tewahedo-calendar'],
  },
  {
    day: 29,
    title: 'Bale Wold (Feast of God the Son) / Kidist Arsema',
    type: 'christ',
    amharic: '',
    transliteration: 'Bale Wold / Kidist Arsema',
    confidence: 'medium',
    sources: ['stmaryeotctoronto-liturgical-calendar', 'wikipedia-tewahedo-calendar'],
  },
  {
    day: 30,
    title: 'Markos (Mark the Evangelist)',
    type: 'apostle',
    amharic: '',
    transliteration: 'Markos',
    confidence: 'high',
    sources: ['stmaryeotctoronto-liturgical-calendar', 'wikipedia-tewahedo-calendar'],
  },
]

const SOURCES = [
  {
    id: 'ethiopian-synaxarium-pdf',
    name: 'The Ethiopian Synaxarium (Budge / PDF extract)',
    url: '',
    type: 'synaxarium',
    notes: 'Extracted into synaxariumEntries.json; OCR/summary quality varies; not a substitute for licensed full text.',
  },
  {
    id: 'eotc-calendar-json',
    name: 'Tewahedo Daily eotc_calendar_json collections',
    url: 'src/data/eotc_calendar_json/',
    type: 'project-dataset',
    notes: 'Internal curated feast/fast/season/monthly entries used by the app.',
  },
  {
    id: 'stmaryeotctoronto-services',
    name: 'St. Mary EOTC Cathedral Toronto — Services / Monthly feasts',
    url: 'https://stmaryeotctoronto.com/services',
    type: 'parish',
    notes: 'Diocesan parish listing of monthly and annual feasts.',
  },
  {
    id: 'stmaryeotctoronto-liturgical-calendar',
    name: 'St. Mary EOTC Cathedral Toronto — Liturgical Calendar & Feasts',
    url: 'https://stmaryeotctoronto.com/liturgical-calendar-feasts',
    type: 'parish',
    notes: 'Full monthly feast table and Marian feast notes.',
  },
  {
    id: 'wikipedia-tewahedo-calendar',
    name: 'Wikipedia — Calendar of saints (Orthodox Tewahedo)',
    url: 'https://en.wikipedia.org/wiki/Calendar_of_saints_(Orthodox_Tewahedo)',
    type: 'secondary-reference',
    notes: 'Secondary; useful for monthly table cross-check; not sole authority.',
  },
  {
    id: 'eotcmk-gabriel',
    name: 'Mahibere Kidusan / EOTC Sunday School — Archangel Gabriel',
    url: 'https://eotcmk.org/e/the-prince-of-ramah/',
    type: 'church-department',
    notes: 'Confirms monthly Gabriel on the 19th and annual commemorations.',
  },
  {
    id: 'bahre-hasab-wiki',
    name: 'Wikipedia — Bahre Hasab',
    url: 'https://en.wikipedia.org/wiki/Bahre_Hasab',
    type: 'secondary-reference',
    notes: 'Documents Nineveh-anchored movable offsets (Abiy Tsom +14, Fasika +69, etc.).',
  },
  {
    id: 'geezapps-holidays',
    name: 'GeezApps — Ethiopian Orthodox Holidays & Liturgical Calendar',
    url: 'https://www.geezapps.com/articles/ethiopian-orthodox-holidays.html',
    type: 'secondary-reference',
    notes: 'Summarizes movable feast windows and major fasts; verify against Bahire Hasab.',
  },
  {
    id: 'eotc-ma-bahire-hasab',
    name: 'EOTC-MA — Bahire Hasab',
    url: 'https://www.eotc-ma.com/post/bahire-hasab-the-ethiopian-calendar',
    type: 'parish-education',
    notes: 'Tewsak offsets for movable fasts/feasts from Nineveh.',
  },
  {
    id: 'pascha-gregorian-table',
    name: 'Tewahedo Daily PASCHA_GREGORIAN_ISO table',
    url: 'src/data/paschaGregorianTable.ts',
    type: 'project-dataset',
    notes: 'Curated civil Fasika dates for runtime conversion; not a computus replacement.',
  },
]

function readJson(rel) {
  return JSON.parse(readFileSync(join(ROOT, rel), 'utf8'))
}

function slugify(text) {
  return String(text || '')
    .normalize('NFKD')
    .replace(/[^\x00-\x7F]/g, '')
    .toLowerCase()
    .replace(/[^a-z0-9]+/g, '-')
    .replace(/^-+|-+$/g, '')
    .slice(0, 80) || 'item'
}

function monthNumberFromName(name) {
  if (!name) return null
  return MONTH_ALIASES.get(String(name).toLowerCase()) || null
}

function monthName(number) {
  return MONTHS.find((m) => m.number === number)?.name || `Month${number}`
}

function csvEscape(value) {
  if (value == null) return ''
  const s = String(value)
  if (/[",\n\r]/.test(s)) return `"${s.replace(/"/g, '""')}"`
  return s
}

function writeCsv(filename, headers, rows) {
  const lines = [headers.join(',')]
  for (const row of rows) {
    lines.push(headers.map((h) => csvEscape(row[h])).join(','))
  }
  const bom = '\uFEFF'
  writeFileSync(join(OUT, filename), bom + lines.join('\n') + '\n', 'utf8')
}

function inferType(text) {
  const t = String(text || '').toLowerCase()
  if (/\bmartyr/.test(t)) return 'martyr'
  if (/\bapostle/.test(t)) return 'apostle'
  if (/\bprophet|elijah|elias|isaiah|moses\b/.test(t)) return 'prophet'
  if (/\bangel|michael|gabriel|raphael|uriel|raguel\b/.test(t)) return 'angel'
  if (/\bmary|mariam|theotokos|virgin\b/.test(t)) return 'mary'
  if (/\bfeast|festival|consecration|nativity|baptism\b/.test(t)) return 'feast'
  if (/\bpatriarch|archbishop|bishop|abba|abune\b/.test(t)) return 'saint'
  if (/\bsaint|holy father|holy mother\b/.test(t)) return 'saint'
  return 'other'
}

function cleanCommText(raw) {
  return String(raw || '')
    .replace(/\s+/g, ' ')
    .replace(/^\s*(died|is celebrated|and )\s+/i, '')
    .trim()
}

function shortCard(text, max = 280) {
  const s = String(text || '').replace(/\s+/g, ' ').trim()
  if (!s) return ''
  if (s.length <= max) return s
  return s.slice(0, max - 1).replace(/\s+\S*$/, '') + '…'
}

function loadCollection(name) {
  try {
    return readJson(`src/data/eotc_calendar_json/${name}.json`)
  } catch {
    return { entries: [] }
  }
}

function entryMonthDay(entry) {
  const d = entry.date || {}
  if (d.kind === 'fixed' && d.ethiopianMonth && d.ethiopianDay) {
    return {
      monthNumber: monthNumberFromName(d.ethiopianMonth),
      day: Number(d.ethiopianDay),
      fixed: true,
      movable: false,
    }
  }
  if (d.kind === 'monthly-recurring' && d.monthlyRecurringDay) {
    return {
      monthNumber: null,
      day: Number(d.monthlyRecurringDay),
      fixed: false,
      movable: false,
      monthly: true,
    }
  }
  if (d.kind === 'movable') {
    return {
      monthNumber: null,
      day: null,
      fixed: false,
      movable: true,
      anchor: d.movableAnchor || '',
      offset: d.offsetFromAnchor,
    }
  }
  return { monthNumber: null, day: null, fixed: false, movable: false }
}

mkdirSync(OUT, { recursive: true })

const synax = readJson('src/data/synaxariumEntries.json')
const fixedFeasts = loadCollection('fixed-feasts')
const mary = loadCollection('mary')
const angels = loadCollection('angels')
const saintsCol = loadCollection('major-saints')
const monthlyJson = loadCollection('monthly-commemorations')
const fastsCol = loadCollection('fasts')
const seasonsCol = loadCollection('liturgical-seasons')
const paschalCol = loadCollection('paschal-cycle')

const days = []
const commemorations = []
const feasts = []
const saints = []
const fasts = []
const seasons = []
const monthly = []
const movable = []
const sources = []
const quality = []

const dayIndex = new Map()

for (const m of MONTHS) {
  for (let day = 1; day <= m.days; day++) {
    const slug = `${slugify(m.name)}-${String(day).padStart(2, '0')}`
    const key = `${m.number}-${day}`
    const row = {
      slug,
      ethiopian_month: m.name,
      ethiopian_month_number: m.number,
      ethiopian_day: day,
      display_date_english: `${m.name} ${day}`,
      display_date_amharic: '',
      summary: '',
      season: '',
      fasting_status: '',
      major_feast: '',
      source_page_start: '',
      source_page_end: '',
      status: 'draft',
      confidence: 'medium',
      needs_review: 'true',
      synaxarium_id: '',
      source_ids: 'ethiopian-synaxarium-pdf',
    }
    dayIndex.set(key, row)
    days.push(row)
  }
}

// Fill from Synaxarium extracts
for (const entry of synax.entries || []) {
  const monthNumber = entry.ethiopianMonthNumber || monthNumberFromName(entry.ethiopianMonth)
  const day = entry.ethiopianDay
  const key = `${monthNumber}-${day}`
  const row = dayIndex.get(key)
  if (!row) {
    quality.push({
      ethiopian_month: monthName(monthNumber),
      ethiopian_day: day,
      record_slug: entry.id,
      issue: 'synaxarium_day_outside_canonical_grid',
      confidence: 'low',
      source_count: 1,
      needs_review: 'true',
      recommended_action: 'Inspect month alias / Pagumen handling',
    })
    continue
  }

  row.synaxarium_id = entry.id
  row.summary = shortCard(entry.shortSummary || entry.summary, 400)
  row.source_page_start = entry.sourcePage || entry.source?.page || ''
  row.source_page_end = entry.sourcePage || entry.source?.page || ''
  row.status = entry.status === 'verified' ? 'published' : 'draft'
  row.confidence = entry.status === 'verified' ? 'medium' : 'low'
  row.needs_review = 'true'
  row.source_ids = 'ethiopian-synaxarium-pdf'

  if (!row.display_date_amharic && entry.sourceDateHeading) {
    // Keep English display; Amharic not invented from OCR heading
  }

  const list = entry.mainCommemorations?.length
    ? entry.mainCommemorations
    : entry.commemorations || []

  let sort = 0
  for (const raw of list) {
    const title = cleanCommText(raw)
    if (!title || title.length < 4) continue
    sort += 10
    const type = inferType(title)
    const cslug = `${row.slug}-${slugify(title).slice(0, 48)}-${sort}`
    commemorations.push({
      slug: cslug,
      day_slug: row.slug,
      day_id: '',
      title,
      title_amharic: '',
      title_transliteration: '',
      title_geez: '',
      commemoration_type: type,
      summary: shortCard(title, 220),
      body_english: '',
      body_amharic: '',
      short_card_summary: shortCard(
        `The Synaxarium commemorates: ${title}`,
        240,
      ),
      full_explanation: shortCard(entry.summary || entry.readMore || '', 1200),
      scripture_references: (entry.scriptureReferences || []).join(' | '),
      keywords: '',
      sort_order: sort,
      status: 'published',
      source_reference: 'ethiopian-synaxarium-pdf',
      source_page: entry.sourcePage || '',
      confidence: 'medium',
      needs_review: 'true',
      fixed_date: 'true',
      movable: 'false',
      is_monthly: 'false',
      feast_rank: entry.importanceLevel || '',
    })

    if (!(entry.scriptureReferences || []).length) {
      // no issue
    } else {
      quality.push({
        ethiopian_month: row.ethiopian_month,
        ethiopian_day: row.ethiopian_day,
        record_slug: cslug,
        issue: 'scripture_references_from_ocr_need_verification',
        confidence: 'low',
        source_count: 1,
        needs_review: 'true',
        recommended_action: 'Verify against Synaxarium / lectionary before public display',
      })
    }
  }

  if (!list.length) {
    quality.push({
      ethiopian_month: row.ethiopian_month,
      ethiopian_day: row.ethiopian_day,
      record_slug: row.slug,
      issue: 'synaxarium_day_missing_commemoration_list',
      confidence: 'low',
      source_count: 1,
      needs_review: 'true',
      recommended_action: 'Re-extract Synaxarium day or clergy review',
    })
  }
}

// Expand monthly commemorations onto every month day (not Pagumen beyond 5 for day 30)
for (const m of MONTHS) {
  for (const item of MONTHLY_TABLE) {
    if (item.day > m.days) continue
    const key = `${m.number}-${item.day}`
    const dayRow = dayIndex.get(key)
    if (!dayRow) continue
    const cslug = `${dayRow.slug}-monthly-${slugify(item.title).slice(0, 40)}`
    commemorations.push({
      slug: cslug,
      day_slug: dayRow.slug,
      day_id: '',
      title: item.title,
      title_amharic: item.amharic || '',
      title_transliteration: item.transliteration || '',
      title_geez: '',
      commemoration_type: item.type,
      summary: `Monthly commemoration observed on the ${item.day} of each Ethiopian month.`,
      body_english: '',
      body_amharic: '',
      short_card_summary: `${item.title} is remembered on the ${item.day}${ordinal(item.day)} of each Ethiopian month.`,
      full_explanation:
        item.notes ||
        `The Ethiopian Orthodox Tewahedo Church keeps a monthly remembrance of ${item.title} on day ${item.day}. Details of local observance may vary by parish; Synaxarium entries for specific months should be consulted for the full narrative.`,
      scripture_references: '',
      keywords: `monthly|day-${item.day}|${item.type}`,
      sort_order: 5,
      status: 'published',
      source_reference: item.sources.join('|'),
      source_page: '',
      confidence: item.confidence,
      needs_review: item.confidence === 'high' ? 'false' : 'true',
      fixed_date: 'false',
      movable: 'false',
      is_monthly: 'true',
      feast_rank: 'monthly',
    })
  }
}

function ordinal(n) {
  const s = ['th', 'st', 'nd', 'rd']
  const v = n % 100
  return s[(v - 20) % 10] || s[v] || s[0]
}

// Monthly catalog rows
for (const item of MONTHLY_TABLE) {
  monthly.push({
    slug: `monthly-day-${String(item.day).padStart(2, '0')}-${slugify(item.title).slice(0, 40)}`,
    ethiopian_day: item.day,
    title: item.title,
    title_amharic: item.amharic || '',
    title_transliteration: item.transliteration || '',
    commemoration_type: item.type,
    frequency: 'every-ethiopian-month',
    description: `Observed on day ${item.day} of each Ethiopian month (Pagumen when day exists).`,
    confidence: item.confidence,
    needs_review: item.confidence === 'high' ? 'false' : 'true',
    source_ids: item.sources.join('|'),
    notes: item.notes || '',
  })
}

// Also record project monthly-json entries for source merge
for (const entry of monthlyJson.entries || []) {
  const md = entryMonthDay(entry)
  if (!md.monthly || !md.day) continue
  monthly.push({
    slug: entry.id,
    ethiopian_day: md.day,
    title: entry.englishTitle || entry.transliterationTitle || entry.title,
    title_amharic: /[\u1200-\u137F]/.test(entry.title || '') ? entry.title : '',
    title_transliteration: entry.transliterationTitle || '',
    commemoration_type: entry.category?.primary || 'other',
    frequency: 'every-ethiopian-month',
    description: entry.summary?.short || '',
    confidence: entry.confidence || 'medium',
    needs_review: 'true',
    source_ids: 'eotc-calendar-json',
    notes: 'From project monthly-commemorations.json',
  })
}

function pushFeastFromEntry(entry, sourceId) {
  const md = entryMonthDay(entry)
  const title = entry.englishTitle || entry.transliterationTitle || entry.title || entry.id
  feasts.push({
    slug: entry.id,
    title,
    title_amharic: /[\u1200-\u137F]/.test(entry.title || '') ? entry.title : '',
    title_transliteration: entry.transliterationTitle || '',
    description: entry.summary?.short || entry.summary?.panel || '',
    short_card_summary: entry.summary?.short || '',
    full_explanation: [
      entry.summary?.whyItMatters,
      entry.summary?.connection,
      entry.content?.expandedContent?.significance,
    ]
      .filter(Boolean)
      .join(' '),
    feast_rank: entry.category?.majorHoliday ? 'major' : entry.category?.primary || 'minor',
    fixed_or_movable: md.movable ? 'movable' : md.monthly ? 'monthly' : 'fixed',
    ethiopian_month_number: md.monthNumber || '',
    ethiopian_day: md.day || '',
    pascha_offset: md.offset ?? '',
    movable_anchor: md.anchor || '',
    fasting_relationship: entry.observance?.fastStatus || '',
    image_path: '',
    status: 'published',
    confidence: entry.confidence || 'medium',
    needs_review: 'true',
    source_ids: sourceId,
  })

  if (md.fixed && md.monthNumber && md.day) {
    const dayRow = dayIndex.get(`${md.monthNumber}-${md.day}`)
    if (dayRow && entry.category?.majorHoliday) {
      dayRow.major_feast = title
      dayRow.confidence = 'high'
    }
  }
}

for (const entry of [...(fixedFeasts.entries || []), ...(mary.entries || []), ...(angels.entries || [])]) {
  pushFeastFromEntry(entry, 'eotc-calendar-json')
}

for (const entry of saintsCol.entries || []) {
  saints.push({
    slug: entry.id,
    name: entry.englishTitle || entry.transliterationTitle || entry.title,
    name_amharic: /[\u1200-\u137F]/.test(entry.title || '') ? entry.title : '',
    transliteration: entry.transliterationTitle || '',
    type: entry.category?.primary || 'saint',
    short_bio: entry.summary?.short || '',
    full_bio: entry.content?.extended || entry.summary?.whyItMatters || '',
    historical_period: '',
    image_path: '',
    source: 'eotc-calendar-json',
    status: 'published',
    confidence: entry.confidence || 'medium',
    needs_review: 'true',
  })
}

// Deduplicate saint names from high-confidence monthly table
for (const item of MONTHLY_TABLE.filter((i) => ['saint', 'martyr', 'apostle', 'angel', 'prophet'].includes(i.type))) {
  const slug = `person-${slugify(item.title).slice(0, 50)}`
  if (saints.some((s) => s.slug === slug)) continue
  saints.push({
    slug,
    name: item.title,
    name_amharic: item.amharic || '',
    transliteration: item.transliteration || '',
    type: item.type,
    short_bio: `Person/figure commemorated monthly on day ${item.day}.`,
    full_bio: '',
    historical_period: '',
    image_path: '',
    source: item.sources.join('|'),
    status: 'published',
    confidence: item.confidence,
    needs_review: item.confidence === 'high' ? 'false' : 'true',
  })
}

for (const entry of fastsCol.entries || []) {
  const md = entryMonthDay(entry)
  const range = entry.date?.seasonRange || {}
  fasts.push({
    slug: entry.id,
    title: entry.englishTitle || entry.transliterationTitle || entry.title,
    title_amharic: /[\u1200-\u137F]/.test(entry.title || '') ? entry.title : '',
    fast_type: entry.category?.secondary?.includes('weekly') ? 'weekly' : 'seasonal',
    fixed_or_movable: md.movable ? 'movable' : range.startFixed ? 'fixed-range' : 'unknown',
    start_rule: range.startFixed
      ? `${range.startFixed.ethiopianMonth} ${range.startFixed.ethiopianDay}`
      : entry.date?.gregorianHint || '',
    end_rule: range.endFixed
      ? `${range.endFixed.ethiopianMonth} ${range.endFixed.ethiopianDay}`
      : '',
    pascha_offset_start: md.offset ?? '',
    pascha_offset_end: '',
    movable_anchor: md.anchor || '',
    description: entry.summary?.short || '',
    importance: entry.category?.majorHoliday ? 'major' : 'standard',
    confidence: entry.confidence || 'medium',
    needs_review: 'true',
    source_ids: 'eotc-calendar-json|geezapps-holidays|bahre-hasab-wiki',
  })
}

// Explicit weekly fasts (not Synaxarium commemorations)
fasts.push({
  slug: 'wednesday-weekly-fast',
  title: 'Wednesday Fast',
  title_amharic: '',
  fast_type: 'weekly',
  fixed_or_movable: 'weekly',
  start_rule: 'Every Wednesday (except designated fast-free periods)',
  end_rule: '',
  pascha_offset_start: '',
  pascha_offset_end: '',
  movable_anchor: '',
  description: 'Weekly fasting discipline. Not a Synaxarium feast/commemoration by itself.',
  importance: 'standard',
  confidence: 'high',
  needs_review: 'false',
  source_ids: 'geezapps-holidays|eotc-calendar-json',
})
fasts.push({
  slug: 'friday-weekly-fast',
  title: 'Friday Fast',
  title_amharic: '',
  fast_type: 'weekly',
  fixed_or_movable: 'weekly',
  start_rule: 'Every Friday (except designated fast-free periods)',
  end_rule: '',
  pascha_offset_start: '',
  pascha_offset_end: '',
  movable_anchor: '',
  description: 'Weekly fasting discipline. Not a Synaxarium feast/commemoration by itself.',
  importance: 'standard',
  confidence: 'high',
  needs_review: 'false',
  source_ids: 'geezapps-holidays|eotc-calendar-json',
})

for (const entry of seasonsCol.entries || []) {
  const range = entry.date?.seasonRange || {}
  seasons.push({
    slug: entry.id,
    title: entry.englishTitle || entry.transliterationTitle || entry.title,
    title_amharic: /[\u1200-\u137F]/.test(entry.title || '') ? entry.title : '',
    description: entry.summary?.short || '',
    start_rule: range.startFixed
      ? `${range.startFixed.ethiopianMonth} ${range.startFixed.ethiopianDay}`
      : entry.date?.gregorianHint || '',
    end_rule: range.endFixed
      ? `${range.endFixed.ethiopianMonth} ${range.endFixed.ethiopianDay}`
      : '',
    sort_order: entry.display?.priority || 0,
    confidence: entry.confidence || 'medium',
    needs_review: 'true',
    source_ids: 'eotc-calendar-json',
  })
}

const NENEWE_OFFSETS = [
  { id: 'nineveh-fast', title: 'Fast of Nineveh', offset: 0, kind: 'fast' },
  { id: 'abiy-tsom', title: 'Abiy Tsom / Great Lent', offset: 14, kind: 'fast' },
  { id: 'debre-zeit', title: 'Debre Zeit', offset: 41, kind: 'feast' },
  { id: 'hosanna', title: 'Hosanna (Palm Sunday)', offset: 62, kind: 'feast' },
  { id: 'siklet', title: 'Siklet (Good Friday)', offset: 67, kind: 'feast' },
  { id: 'fasika', title: 'Fasika / Tinsae (Pascha)', offset: 69, kind: 'feast' },
  { id: 'erget', title: 'Erget (Ascension)', offset: 69 + 39, kind: 'feast' },
  { id: 'pentecost', title: 'Pentecost / Paraclete', offset: 69 + 49, kind: 'feast' },
]

for (const entry of paschalCol.entries || []) {
  const md = entryMonthDay(entry)
  movable.push({
    slug: entry.id,
    title: entry.englishTitle || entry.transliterationTitle || entry.title,
    title_amharic: /[\u1200-\u137F]/.test(entry.title || '') ? entry.title : '',
    kind: entry.category?.primary || 'movable',
    calculation_basis: 'bahire-hasab / nineveh-anchored paschal cycle',
    relation_to_fasika: md.anchor === 'fasika' ? 'anchor-or-relative' : 'via-nineveh-or-fasika',
    offset_from_nineveh_days: md.offset ?? '',
    movable_anchor: md.anchor || entry.date?.movableAnchor || '',
    description: entry.summary?.short || '',
    confidence: 'medium',
    needs_review: 'true',
    source_ids: 'eotc-calendar-json|bahre-hasab-wiki|eotc-ma-bahire-hasab|pascha-gregorian-table',
  })
}

for (const item of NENEWE_OFFSETS) {
  if (movable.some((m) => m.slug === item.id)) continue
  movable.push({
    slug: item.id,
    title: item.title,
    title_amharic: '',
    kind: item.kind,
    calculation_basis: 'bahire-hasab: days after Fast of Nineveh (Monday)',
    relation_to_fasika: item.id === 'fasika' ? 'fasika' : 'offset-from-nineveh',
    offset_from_nineveh_days: item.offset,
    movable_anchor: 'nineveh-fast',
    description: `Compute from Nineveh Monday + ${item.offset} days (standard Bahire Hasab table).`,
    confidence: 'high',
    needs_review: 'false',
    source_ids: 'bahre-hasab-wiki|eotc-ma-bahire-hasab',
  })
}

for (const s of SOURCES) {
  sources.push({
    source_id: s.id,
    source_name: s.name,
    source_url: s.url,
    source_type: s.type,
    source_notes: s.notes,
  })
}

// Coverage / quality audit
for (const m of MONTHS) {
  for (let day = 1; day <= m.days; day++) {
    const row = dayIndex.get(`${m.number}-${day}`)
    if (!row.synaxarium_id && !(m.number === 13 && day === 6)) {
      quality.push({
        ethiopian_month: m.name,
        ethiopian_day: day,
        record_slug: row.slug,
        issue: 'missing_synaxarium_extract',
        confidence: 'low',
        source_count: 0,
        needs_review: 'true',
        recommended_action: 'Locate Synaxarium entry for this day',
      })
    }
    if (!row.title_amharic && !row.display_date_amharic) {
      quality.push({
        ethiopian_month: m.name,
        ethiopian_day: day,
        record_slug: row.slug,
        issue: 'missing_amharic_date_label',
        confidence: 'medium',
        source_count: 1,
        needs_review: 'true',
        recommended_action: 'Add verified Amharic month/day label',
      })
    }
  }
}

quality.push({
  ethiopian_month: 'ALL',
  ethiopian_day: '',
  record_slug: 'monthly-day-22',
  issue: 'conflicting_saint_name',
  confidence: 'medium',
  source_count: 3,
  needs_review: 'true',
  recommended_action: 'Confirm Uriel vs Deqsius emphasis by diocese; keep both names',
})

quality.push({
  ethiopian_month: 'ALL',
  ethiopian_day: '',
  record_slug: 'weekly-fasts',
  issue: 'do_not_treat_wednesday_friday_as_synaxarium',
  confidence: 'high',
  source_count: 2,
  needs_review: 'false',
  recommended_action: 'Keep weekly fasts only in fasts table / fasting_status',
})

// Season assignment (best-effort from seasons ranges)
for (const season of seasons) {
  // leave day.season blank unless we can parse fixed ranges simply
  const start = String(season.start_rule || '').trim()
  const end = String(season.end_rule || '').trim()
  const sm = start.match(/^(\w+)\s+(\d+)$/)
  const em = end.match(/^(\w+)\s+(\d+)$/)
  if (!sm || !em) continue
  const sn = monthNumberFromName(sm[1])
  const en = monthNumberFromName(em[1])
  const sd = Number(sm[2])
  const ed = Number(em[2])
  if (!sn || !en) continue
  for (const day of days) {
    const ord = day.ethiopian_month_number * 100 + day.ethiopian_day
    const a = sn * 100 + sd
    const b = en * 100 + ed
    const inRange = a <= b ? ord >= a && ord <= b : ord >= a || ord <= b
    if (inRange) {
      day.season = day.season ? `${day.season}|${season.title}` : season.title
    }
  }
}

writeCsv(
  'eotc-calendar-days.csv',
  [
    'slug',
    'ethiopian_month',
    'ethiopian_month_number',
    'ethiopian_day',
    'display_date_english',
    'display_date_amharic',
    'summary',
    'season',
    'fasting_status',
    'major_feast',
    'source_page_start',
    'source_page_end',
    'status',
    'confidence',
    'needs_review',
    'synaxarium_id',
    'source_ids',
  ],
  days,
)

writeCsv(
  'eotc-commemorations.csv',
  [
    'slug',
    'day_slug',
    'day_id',
    'title',
    'title_amharic',
    'title_transliteration',
    'title_geez',
    'commemoration_type',
    'summary',
    'body_english',
    'body_amharic',
    'short_card_summary',
    'full_explanation',
    'scripture_references',
    'keywords',
    'sort_order',
    'status',
    'source_reference',
    'source_page',
    'confidence',
    'needs_review',
    'fixed_date',
    'movable',
    'is_monthly',
    'feast_rank',
  ],
  commemorations,
)

writeCsv(
  'eotc-feasts.csv',
  [
    'slug',
    'title',
    'title_amharic',
    'title_transliteration',
    'description',
    'short_card_summary',
    'full_explanation',
    'feast_rank',
    'fixed_or_movable',
    'ethiopian_month_number',
    'ethiopian_day',
    'pascha_offset',
    'movable_anchor',
    'fasting_relationship',
    'image_path',
    'status',
    'confidence',
    'needs_review',
    'source_ids',
  ],
  feasts,
)

writeCsv(
  'eotc-saints.csv',
  [
    'slug',
    'name',
    'name_amharic',
    'transliteration',
    'type',
    'short_bio',
    'full_bio',
    'historical_period',
    'image_path',
    'source',
    'status',
    'confidence',
    'needs_review',
  ],
  saints,
)

writeCsv(
  'eotc-fasts.csv',
  [
    'slug',
    'title',
    'title_amharic',
    'fast_type',
    'fixed_or_movable',
    'start_rule',
    'end_rule',
    'pascha_offset_start',
    'pascha_offset_end',
    'movable_anchor',
    'description',
    'importance',
    'confidence',
    'needs_review',
    'source_ids',
  ],
  fasts,
)

writeCsv(
  'eotc-liturgical-seasons.csv',
  [
    'slug',
    'title',
    'title_amharic',
    'description',
    'start_rule',
    'end_rule',
    'sort_order',
    'confidence',
    'needs_review',
    'source_ids',
  ],
  seasons,
)

writeCsv(
  'eotc-monthly-commemorations.csv',
  [
    'slug',
    'ethiopian_day',
    'title',
    'title_amharic',
    'title_transliteration',
    'commemoration_type',
    'frequency',
    'description',
    'confidence',
    'needs_review',
    'source_ids',
    'notes',
  ],
  monthly,
)

writeCsv(
  'eotc-movable-feasts.csv',
  [
    'slug',
    'title',
    'title_amharic',
    'kind',
    'calculation_basis',
    'relation_to_fasika',
    'offset_from_nineveh_days',
    'movable_anchor',
    'description',
    'confidence',
    'needs_review',
    'source_ids',
  ],
  movable,
)

writeCsv(
  'eotc-calendar-sources.csv',
  ['source_id', 'source_name', 'source_url', 'source_type', 'source_notes'],
  sources,
)

writeCsv(
  'eotc-calendar-quality-report.csv',
  [
    'ethiopian_month',
    'ethiopian_day',
    'record_slug',
    'issue',
    'confidence',
    'source_count',
    'needs_review',
    'recommended_action',
  ],
  quality,
)

const highConf =
  commemorations.filter((c) => c.confidence === 'high').length +
  monthly.filter((m) => m.confidence === 'high').length +
  movable.filter((m) => m.confidence === 'high').length +
  fasts.filter((f) => f.confidence === 'high').length

const needsReview =
  commemorations.filter((c) => c.needs_review === 'true').length +
  days.filter((d) => d.needs_review === 'true').length

const summary = {
  total_ethiopian_days: days.length,
  days_by_month: Object.fromEntries(MONTHS.map((m) => [m.name, m.days])),
  synaxarium_source_days: (synax.entries || []).length,
  total_commemorations: commemorations.length,
  synaxarium_commemorations: commemorations.filter((c) => c.is_monthly === 'false').length,
  monthly_expanded_commemorations: commemorations.filter((c) => c.is_monthly === 'true').length,
  total_saints: saints.length,
  total_feasts: feasts.length,
  total_fasts: fasts.length,
  total_movable_feasts: movable.length,
  total_monthly_catalog_rows: monthly.length,
  total_liturgical_seasons: seasons.length,
  total_sources: sources.length,
  high_confidence_records: highConf,
  records_needing_review: needsReview,
  quality_flags: quality.length,
}

writeFileSync(join(OUT, 'eotc-calendar-build-summary.json'), JSON.stringify(summary, null, 2))

console.log(JSON.stringify(summary, null, 2))
console.log(`Wrote research files to ${OUT}`)
