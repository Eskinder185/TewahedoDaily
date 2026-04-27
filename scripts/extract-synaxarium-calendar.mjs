import { inflateSync } from 'node:zlib'
import { readFileSync, writeFileSync } from 'node:fs'

const SOURCE_PDF = 'The_Ethiopian_Synaxarium.pdf'
const OUT_FILE = 'src/data/synaxariumEntries.json'

const MONTHS = [
  'Meskerem',
  'Tekemt',
  'Hedar',
  'Tahsas',
  'Tir',
  'Yekatit',
  'Megabit',
  'Miyazya',
  'Ginbot',
  'Senne',
  'Hamle',
  'Nehasse',
  'Pagumen',
]

const MONTH_ALIASES = new Map([
  ['Maskaram', 'Meskerem'],
  ['Meskerem', 'Meskerem'],
  ['Teqemt', 'Tekemt'],
  ['Tekemt', 'Tekemt'],
  ['Tikimt', 'Tekemt'],
  ['Hedar', 'Hedar'],
  ['Hidar', 'Hedar'],
  ['Tahsas', 'Tahsas'],
  ['Tahisas', 'Tahsas'],
  ['Ter', 'Tir'],
  ['Tir', 'Tir'],
  ['Yakatit', 'Yekatit'],
  ['Yekatit', 'Yekatit'],
  ['Magabit', 'Megabit'],
  ['Megabit', 'Megabit'],
  ['Miyazya', 'Miyazya'],
  ['Miyazia', 'Miyazya'],
  ['Miazia', 'Miyazya'],
  ['Genbot', 'Ginbot'],
  ['Ginbot', 'Ginbot'],
  ['Sane', 'Senne'],
  ['Sene', 'Senne'],
  ['Senne', 'Senne'],
  ['Hamle', 'Hamle'],
  ['Nahasse', 'Nehasse'],
  ['Nehase', 'Nehasse'],
  ['Nehasse', 'Nehasse'],
  ['Paguemen', 'Pagumen'],
  ['Pagumen', 'Pagumen'],
])

function canonicalMonthName(month) {
  const hit = [...MONTH_ALIASES.entries()].find(
    ([alias]) => alias.toLowerCase() === month.toLowerCase(),
  )
  return hit?.[1] ?? month
}

const TYPE_KEYWORDS = [
  ['martyr', /\bmartyr(?:ed|dom)?\b/i],
  ['apostle', /\bapostle\b/i],
  ['saint', /\bsaint|holy\b/i],
  ['feast', /\bfeast|festival|consecration\b/i],
  ['fast', /\bfast\b/i],
  ['prophet', /\bprophet\b/i],
  ['patriarch', /\bpatriarch|archbishop|bishop\b/i],
]

const GREGORIAN_APPROX_START = [
  ['Sep', 11],
  ['Oct', 11],
  ['Nov', 10],
  ['Dec', 10],
  ['Jan', 9],
  ['Feb', 8],
  ['Mar', 10],
  ['Apr', 9],
  ['May', 9],
  ['Jun', 8],
  ['Jul', 8],
  ['Aug', 7],
  ['Sep', 6],
]

const MAJOR_TERMS = /\b(nativity|baptism|resurrection|ascension|paraclete|crucifixion|festival of the cross|finding of the cross|our lord and redeemer|birth of our lord)\b/i
const MEDIUM_TERMS = /\b(apostle|prophet|patriarch|archbishop|bishop|martyr|consecration|abuna|abune|abba|virgin mary|archangel|michael|gabriel|raphael|john the baptist)\b/i

function decodePdfLiteral(raw) {
  let out = ''
  for (let i = 0; i < raw.length; i++) {
    const ch = raw[i]
    if (ch !== '\\') {
      out += ch
      continue
    }
    const next = raw[++i]
    if (next === undefined) break
    if (next === 'n') out += '\n'
    else if (next === 'r') out += '\r'
    else if (next === 't') out += '\t'
    else if (next === 'b') out += '\b'
    else if (next === 'f') out += '\f'
    else if (next === '(' || next === ')' || next === '\\') out += next
    else if (/[0-7]/.test(next)) {
      let oct = next
      for (let j = 0; j < 2 && /[0-7]/.test(raw[i + 1] ?? ''); j++) oct += raw[++i]
      out += String.fromCharCode(Number.parseInt(oct, 8))
    } else if (next === '\r' && raw[i + 1] === '\n') {
      i++
    } else if (next !== '\n' && next !== '\r') {
      out += next
    }
  }
  return out
}

function extractStringsFromStream(stream) {
  const text = stream.toString('latin1')
  const strings = []
  for (let i = 0; i < text.length; i++) {
    if (text[i] !== '(') continue
    let depth = 1
    let escaped = false
    let value = ''
    i++
    for (; i < text.length; i++) {
      const ch = text[i]
      if (escaped) {
        value += `\\${ch}`
        escaped = false
      } else if (ch === '\\') {
        escaped = true
      } else if (ch === '(') {
        depth++
        value += ch
      } else if (ch === ')') {
        depth--
        if (depth === 0) break
        value += ch
      } else {
        value += ch
      }
    }
    const decoded = decodePdfLiteral(value)
    if (decoded.trim()) strings.push(decoded)
  }
  return strings
}

function normalizeText(text) {
  return text
    .replace(/[“”]/g, '"')
    .replace(/[‘’]/g, "'")
    .replace(/\s+/g, ' ')
    .replace(/\s+([,.;:!?])/g, '$1')
    .replace(/\(\s+/g, '(')
    .replace(/\s+\)/g, ')')
    .trim()
}

function repairPdfWordSpacing(text) {
  let repaired = text
  const splitLetters = ['b', 'c', 'd', 'e', 'f', 'h', 'i', 'k', 'l', 'm', 'n', 'o', 'p', 'r', 's', 't', 'u', 'v', 'w']
  for (const letter of splitLetters) {
    repaired = repaired.replace(new RegExp(`\\b${letter}\\s+(?=[a-z]{2,}\\b)`, 'g'), letter)
  }
  repaired = repaired.replace(/\b([A-Za-z])\s+([A-Za-z])\s+([A-Za-z])\b/g, '$1$2$3')
  const replacements = [
    [/\bm a nwashed\b/g, 'man washed'],
    [/\bm a n(?=[a-z])/g, 'man '],
    [/\bmanwashed\b/g, 'man washed'],
    [/\bm a n\b/g, 'man'],
    [/\bm e n\b/g, 'men'],
    [/\bwom e n\b/g, 'women'],
    [/\bnam e\b/g, 'name'],
    [/\bnamewas\b/g, 'name was'],
    [/\bm other\b/g, 'mother'],
    [/\bmother'snamewas\b/g, "mother's name was"],
    [/\bfather'snamewas\b/g, "father's name was"],
    [/\bfather'ssheep\b/g, "father's sheep"],
    [/\bfather'swife\b/g, "father's wife"],
    [/\bf a ther\b/g, 'father'],
    [/\bhi s\b/g, 'his'],
    [/\bhisson\b/g, 'his son'],
    [/\bfr om\b/g, 'from'],
    [/\bcam efrom\b/g, 'came from'],
    [/\bpeopl ewhereof\b/g, 'people whereof'],
    [/\bmenand\b/g, 'men and'],
    [/\bmenwho\b/g, 'men who'],
    [/\bopene d\b/g, 'opened'],
    [/\bopene dhis\b/g, 'opened his'],
    [/\bcaptivit y\b/g, 'captivity'],
    [/\bpr ophecy\b/g, 'prophecy'],
    [/\bW hen\b/g, 'When'],
    [/\bda ys\b/g, 'days'],
    [/\btim e\b/g, 'time'],
    [/\btimehe\b/g, 'time he'],
    [/\bfam ine\b/g, 'famine'],
    [/\bm a rried\b/g, 'married'],
    [/\bm a ny\b/g, 'many'],
    [/\bman y\b/g, 'many'],
    [/\bm a de\b/g, 'made'],
    [/\bm a y\b/g, 'may'],
    [/\bdi ed\b/g, 'died'],
    [/\bBi shop\b/g, 'Bishop'],
    [/\bBis hop\b/g, 'Bishop'],
    [/\brighte ous\b/g, 'righteous'],
    [/\bri ghteous\b/g, 'righteous'],
    [/\bhum ility\b/g, 'humility'],
    [/\bAga bos\b/g, 'Agabos'],
    [/\bSa int\b/g, 'Saint'],
    [/\bEgyptia nbook\b/g, 'Egyptian book'],
    [/\ba nd\b/g, 'and'],
    [/\bm a tte rs\b/g, 'matters'],
    [/\bhi m a\b/g, 'him a'],
    [/\bdom inions\b/g, 'dominions'],
    [/\bhim self\b/g, 'himself'],
    [/\bMu se\b/g, 'Muse'],
    [/\bDionys ias\b/g, 'Dionysias'],
    [/\bstrif e\b/g, 'strife'],
    [/\bf orthe\b/g, 'for the'],
    [/\bfa ther\b/g, 'father'],
    [/\bW ho\b/g, 'Who'],
    [/\bSolom o\b/g, 'Solomo'],
    [/\bama nwho\b/g, 'a man who'],
    [/\bpare nts\b/g, 'parents'],
    [/\bproclaim er\b/g, 'proclaimer'],
    [/\bDom itianus\b/g, 'Domitianus'],
    [/\bcom pletely\b/g, 'completely'],
    [/\bJam eswent\b/g, 'James went'],
    [/\bto ld\b/g, 'told'],
    [/\bAm ong\b/g, 'Among'],
    [/\bthes etribes\b/g, 'these tribes'],
    [/\bha dtheir\b/g, 'had their'],
    [/\bim age\b/g, 'image'],
    [/\bservi ce\b/g, 'service'],
    [/\bm a keth\b/g, 'maketh'],
    [/\bhe r\b/g, 'her'],
    [/\bBe rutawos\b/g, 'Berutawos'],
    [/\bmem orable\b/g, 'memorable'],
    [/\bcom panion\b/g, 'companion'],
    [/\bMegab it\b/g, 'Megabit'],
    [/\bAf\b/g, 'After'],
    [/\brem a ined\b/g, 'remained'],
    [/\bpr ison\b/g, 'prison'],
    [/\bFarm a\b/g, 'Farma'],
    [/\btim ewas\b/g, 'time was'],
    [/\bwom a nwas\b/g, 'woman was'],
    [/\bChristia n\b/g, 'Christian'],
    [/\bth econsecration\b/g, 'the consecration'],
    [/\bconsecra tion\b/g, 'consecration'],
    [/\bSi na\b/g, 'Sina'],
    [/\bRighte ous\b/g, 'Righteous'],
    [/\bfigh\b/g, 'fighter'],
    [/\bBartholom ew\b/g, 'Bartholomew'],
    [/\bevangelis t\b/g, 'evangelist'],
    [/\bEm peror\b/g, 'Emperor'],
    [/\bRom e\b/g, 'Rome'],
    [/\bChri st\b/g, 'Christ'],
    [/\bRedeem er\b/g, 'Redeemer'],
    [/\bSam uel\b/g, 'Samuel'],
    [/\bMacar ius\b/g, 'Macarius'],
    [/\bGre gory\b/g, 'Gregory'],
    [/\bAm o s\b/g, 'Amos'],
    [/\bange l\b/g, 'angel'],
    [/\bth eson\b/g, 'the son'],
    [/\bth e\b/g, 'the'],
    [/\bwh ich\b/g, 'which'],
    [/\bpr ophet\b/g, 'prophet'],
    [/\bwom a n\b/g, 'woman'],
    [/\bwo man\b/g, 'woman'],
    [/\bsis ter\b/g, 'sister'],
    [/\bJam e sthe\b/g, 'James the'],
    [/\bJam e s\b/g, 'James'],
    [/\bSim on\b/g, 'Simon'],
    [/\bDeci us\b/g, 'Decius'],
    [/\bMaxim u s\b/g, 'Maximus'],
    [/\bA bba\b/g, 'Abba'],
    [/\bMa rk\b/g, 'Mark'],
    [/\bth eapostolic\b/g, 'the apostolic'],
    [/\bfifty-th ird\b/g, 'fifty-third'],
    [/\bapos tle\b/g, 'apostle'],
    [/\bfirs tof\b/g, 'first of'],
    [/\bm a ke\b/g, 'make'],
    [/\bbl essed\b/g, 'blessed'],
    [/\brem ove\b/g, 'remove'],
    [/\bdim inisheth\b/g, 'diminisheth'],
    [/\bfi rst\b/g, 'first'],
    [/\bm onth\b/g, 'month'],
    [/\bm onths\b/g, 'months'],
    [/\bm artyr\b/g, 'martyr'],
    [/\bm a rtyr\b/g, 'martyr'],
    [/\bm a rtyrs\b/g, 'martyrs'],
    [/\bm a rtyrdom\b/g, 'martyrdom'],
    [/\bm a rvelous\b/g, 'marvelous'],
    [/\bm a rt yr\b/g, 'martyr'],
    [/\bm artyred\b/g, 'martyred'],
    [/\bm a rtyred\b/g, 'martyred'],
    [/\bema rtyr\b/g, 'e a martyr'],
    [/\bbecam e a martyr\b/g, 'became a martyr'],
    [/\bbecam ea martyr\b/g, 'became a martyr'],
    [/\bbecam eam a rtyr\b/g, 'became a martyr'],
    [/\bbecam eam a rtyrs\b/g, 'became martyrs'],
    [/\bbecam ema rtyr\b/g, 'became a martyr'],
    [/\bbecam ema rtyrs\b/g, 'became martyrs'],
    [/\bbecam ema rt yrs\b/g, 'became martyrs'],
    [/\bcom m emorated\b/g, 'commemorated'],
    [/\bcom mem orated\b/g, 'commemorated'],
    [/\bcom mem oration\b/g, 'commemoration'],
    [/\bcom memoration\b/g, 'commemoration'],
    [/\bcom m emoration\b/g, 'commemoration'],
    [/\bcom man ded\b/g, 'commanded'],
    [/\bcom m anded\b/g, 'commanded'],
    [/\bcom mem orate\b/g, 'commemorate'],
    [/\barch angel\b/g, 'archangel'],
    [/\bconsecr ation\b/g, 'consecration'],
    [/\bf irst\b/g, 'first'],
    [/\bMiyaz ia\b/g, 'Miyazia'],
    [/\bMiaz ia\b/g, 'Miazia'],
    [/\bBar'am a\b/g, "Bar'ama"],
    [/father'snam ewas/g, "father's name was"],
    [/mother'snam ewas/g, "mother's name was"],
    [/father'snamewas/g, "father's name was"],
    [/mother'snamewas/g, "mother's name was"],
    [/father'ssheep/g, "father's sheep"],
    [/father'swife/g, "father's wife"],
    [/\btim ehe\b/g, 'time he'],
    [/\bhi sson\b/g, 'his son'],
    [/\bbecam e\b/g, 'became'],
    [/\bopene d\b/g, 'opened'],
    [/\bopene dhis\b/g, 'opened his'],
    [/\s+,/g, ','],
  ]
  for (const [pattern, replacement] of replacements) {
    repaired = repaired.replace(pattern, replacement)
  }
  return repaired
}

function extractPdfPages(bytes) {
  const pages = []
  const streamRe = /stream\r?\n([\s\S]*?)\r?\nendstream/g
  let match
  while ((match = streamRe.exec(bytes.toString('latin1')))) {
    const compressed = Buffer.from(match[1], 'latin1')
    let inflated
    try {
      inflated = inflateSync(compressed)
    } catch {
      continue
    }
    const strings = extractStringsFromStream(inflated)
    const text = repairPdfWordSpacing(normalizeText(strings.join(' ')))
    if (text.length > 40) pages.push(text)
  }
  return pages
}

const HEADING_MONTH_PATTERN = [...MONTH_ALIASES.keys()]
  .sort((a, b) => b.length - a.length)
  .map((month) => month.replace(/[.*+?^${}()|[\]\\]/g, '\\$&'))
  .join('|')

function findDateHeadings(page) {
  const headingRe = new RegExp(`\\b(${HEADING_MONTH_PATTERN})\\s+(\\d{1,2})\\s*\\(([^)]+)\\)`, 'gi')
  const headings = []
  let heading
  while ((heading = headingRe.exec(page))) {
    headings.push({
      index: heading.index,
      raw: heading[0],
      month: canonicalMonthName(heading[1]),
      day: Number.parseInt(heading[2], 10),
      gregorianApprox: heading[3].replace(/\s+/g, ' ').trim(),
      originalDateHeading: `${heading[1]} ${heading[2].padStart(2, '0')} (${heading[3].replace(/\s+/g, ' ').trim()})`,
    })
  }
  return headings
}

function pageDateHeading(page) {
  const heading = findDateHeadings(page)[0]
  if (!heading) return null
  return {
    month: heading.month,
    day: heading.day,
    gregorianApprox: heading.gregorianApprox,
    originalDateHeading: heading.originalDateHeading,
  }
}

function splitEntriesByHeading(pages) {
  const chunks = []
  let current = null
  pages.forEach((page, index) => {
    const headings = findDateHeadings(page)
    if (headings.length === 0) {
      if (current) current.pages.push(page)
      return
    }

    const leading = page.slice(0, headings[0].index).trim()
    if (current) {
      if (leading) current.pages.push(leading)
      chunks.push(current)
      current = null
    }

    headings.forEach((heading, headingIndex) => {
      const nextHeading = headings[headingIndex + 1]
      const start = heading.index
      const end = nextHeading?.index ?? page.length
      const chunk = {
        month: heading.month,
        day: heading.day,
        gregorianApprox: heading.gregorianApprox,
        originalDateHeading: heading.originalDateHeading,
        pdfPage: index + 1,
        pages: [page.slice(start, end).trim()],
      }
      if (nextHeading) chunks.push(chunk)
      else current = chunk
    })
  })
  if (current) chunks.push(current)
  return chunks
}

function sentenceList(text) {
  return normalizeText(text)
    .split(/(?<=[.!?])\s+/)
    .map((s) => s.trim())
    .filter((s) => s.length > 18)
}

function cleanSentence(sentence) {
  return repairPdfWordSpacing(
    sentence.replace(/[\u0091\u0092]/g, "'").replace(/[\u0093\u0094]/g, '"'),
  )
    .replace(/\bTHE ETHIOPIAN SYNAXARIUM\s+\d+\b/gi, '')
    .replace(/^And\s+/i, '')
    .replace(/\s*\([^)]{0,80}\)\s*/g, ' ')
    .replace(/\s+/g, ' ')
    .trim()
}

function truncateSentence(text, maxLength) {
  if (text.length <= maxLength) return text
  const sliced = text.slice(0, maxLength - 3)
  const lastSpace = sliced.lastIndexOf(' ')
  return `${sliced.slice(0, Math.max(40, lastSpace)).trim()}...`
}

function capitalizeFirst(text) {
  const trimmed = text.trim()
  if (!trimmed) return trimmed
  return `${trimmed[0].toUpperCase()}${trimmed.slice(1)}`
}

function entryBody(chunk) {
  const text = normalizeText(chunk.pages.join(' '))
    .replace(new RegExp(`^.*?\\b${HEADING_MONTH_PATTERN}\\s+${String(chunk.day).padStart(2, '0')}\\s*\\([^)]+\\)\\s*`, 'i'), '')
    .replace(new RegExp(`^.*?\\b${HEADING_MONTH_PATTERN}\\s+${chunk.day}\\s*\\([^)]+\\)\\s*`, 'i'), '')
  const prayerStart = text.search(/IN THE NAME OF THE FATHER AND THE SON AND THE HOLY SPIRIT/i)
  const body = prayerStart >= 0 ? text.slice(prayerStart) : text
  return body.replace(/^IN THE NAME OF THE FATHER AND THE SON AND THE HOLY SPIRIT,\s*ONE GOD\.\s*AMEN\.\s*/i, '')
}

function extractCommemorations(body) {
  const hits = []
  for (const sentence of sentenceList(body)) {
    if (!/\bOn this day\b/i.test(sentence)) continue
    const cleaned = cleanSentence(sentence)
      .replace(/^.*?\bOn this day(?: also)?\s*/i, '')
      .replace(/^there took place\s*/i, '')
    if (cleaned.length > 0) hits.push(truncateSentence(cleaned, 240))
    if (hits.length >= 6) break
  }
  return hits
}

function titleFromCommemorations(commemorations, month, day) {
  if (commemorations.length === 0) return `Synaxarium Reading for ${month} ${day}`
  const first = formatCommemorationPhrase(commemorations[0])
    .replace(/^(died|became a martyr|was martyred|is commemorated|we commemorate)\s+/i, '')
    .replace(/\.$/, '')
  const title = first
    .replace(/^the repose of\s+/i, '')
    .replace(/^the martyrdom of\s+/i, '')
    .replace(/^the holy father\s+/i, '')
    .replace(/^the holy and blessed father\s+/i, '')
    .replace(/^the holy and spiritual father\s+/i, '')
    .replace(/^the glorious angel\s+/i, 'Archangel ')
    .split(/[,;]/)[0]
    .replace(/\s+/g, ' ')
    .trim()
  return truncateSentence(capitalizeFirst(title), 90)
}

function classifyType(text) {
  for (const [type, pattern] of TYPE_KEYWORDS) {
    if (pattern.test(text)) return type
  }
  return 'commemoration'
}

function importanceLevel(text) {
  const scope = text.slice(0, 900)
  if (MAJOR_TERMS.test(scope)) return 'major'
  if (MEDIUM_TERMS.test(scope)) return 'medium'
  return 'minor'
}

function scriptureReferences(text) {
  const refs = new Set()
  const re = /\b(?:Genesis|Exodus|Leviticus|Numbers|Deuteronomy|Joshua|Judges|Ruth|Samuel|Kings|Chronicles|Ezra|Nehemiah|Tobit|Judith|Esther|Job|Psalm|Psalms|Proverbs|Ecclesiastes|Song of Songs|Wisdom|Sirach|Isaiah|Jeremiah|Lamentations|Baruch|Ezekiel|Daniel|Hosea|Joel|Amos|Obadiah|Jonah|Micah|Nahum|Habakkuk|Zephaniah|Haggai|Zechariah|Malachi|Matthew|Mark|Luke|John|Acts|Romans|Corinthians|Galatians|Ephesians|Philippians|Colossians|Thessalonians|Timothy|Titus|Philemon|Hebrews|James|Peter|Jude|Revelation)\s+\d{1,3}:\d{1,3}(?:-\d{1,3})?/gi
  for (const match of text.matchAll(re)) refs.add(match[0])
  return [...refs].slice(0, 8)
}

function ensureSentence(text) {
  const trimmed = text.trim()
  if (!trimmed) return ''
  return /[.!?]$/.test(trimmed) ? trimmed : `${trimmed}.`
}

function formatCommemorationPhrase(line) {
  const cleaned = cleanSentence(line)
  const diedSuffix = /^(.+?)\s+died\.?$/i.exec(cleaned)
  if (diedSuffix) return `the repose of ${diedSuffix[1]}`
  return cleaned
    .replace(/^died\s+/i, 'the repose of ')
    .replace(/^became a martyr\s+/i, 'the martyrdom of ')
    .replace(/^was martyred\s+/i, 'the martyrdom of ')
    .replace(/^are commemorated\s+/i, '')
    .replace(/^is commemorated\s+/i, '')
    .replace(/^they commemorate\s+/i, '')
    .replace(/^we commemorate\s+/i, '')
}

function polishCommemoration(line) {
  const phrase = formatCommemorationPhrase(line)
  return truncateSentence(phrase.split(/;| concerning whom | who was /i)[0].trim(), 170)
}

function buildSummary(body, commemorations) {
  const lines = []
  if (commemorations.length > 0) {
    const first = formatCommemorationPhrase(commemorations[0]).replace(/\.$/, '')
    const second = commemorations[1]
      ? formatCommemorationPhrase(commemorations[1]).replace(/\.$/, '')
      : ''
    lines.push(`The Synaxarium commemorates ${first}.`)
    if (second && second.length < 180) {
      lines.push(`It also remembers ${second}.`)
    }
  }

  const context = sentenceList(body)
    .map(cleanSentence)
    .filter((line) => !/^On this day\b/i.test(line))
    .filter((line) => !/IN THE NAME OF THE FATHER/i.test(line))
    .filter((line) => line.length < 260)
    .slice(0, Math.max(0, 3 - lines.length))

  lines.push(...context.map(ensureSentence))
  if (lines.length === 0) return 'Synaxarium details for this date are being prepared.'
  return truncateSentence(lines.join(' '), 520)
}

function buildReadMore(body) {
  return truncateSentence(sentenceList(body)
    .map(cleanSentence)
    .filter((line) => !/^On this day\b/i.test(line))
    .filter((line) => !/IN THE NAME OF THE FATHER/i.test(line))
    .slice(0, 4)
    .map(ensureSentence)
    .join(' '), 760)
}

const PUBLIC_TEXT_ARTIFACT = /\b(?:m a n|m a |fr om|becam e|opene d|th e|nam e|wom e n|m artyr|com mem|A bba|Ma rk|THE ETHIOPIAN SYNAXARIUM|\s{2,})\b/i

function hasPublicTextArtifact(entry) {
  const fields = [
    entry.title,
    entry.shortSummary,
    entry.readMore,
    ...entry.mainCommemorations,
  ]
  return fields.some((value) => PUBLIC_TEXT_ARTIFACT.test(value))
}

const bytes = readFileSync(SOURCE_PDF)
const pages = extractPdfPages(bytes)
const chunks = splitEntriesByHeading(pages)

const extractedEntries = chunks.map((chunk) => {
  const body = entryBody(chunk)
  const commemorations = extractCommemorations(body)
  const allText = `${body} ${commemorations.join(' ')}`
  const monthIndex = MONTHS.indexOf(chunk.month) + 1
  const dayPadded = String(chunk.day).padStart(2, '0')
  const summary = buildSummary(body, commemorations)
  const readMore = buildReadMore(body)
  const status = commemorations.length > 0 || readMore ? 'extracted' : 'needs_review'
  const mainCommemorations =
    commemorations.length > 0
      ? commemorations.map(formatCommemorationPhrase)
      : sentenceList(body).map(cleanSentence).filter(Boolean).slice(0, 2)
  const polishedCommemorations = mainCommemorations.map(polishCommemoration)
  const entry = {
    id: `${chunk.month.toLowerCase()}-${dayPadded}`,
    ethiopianMonth: chunk.month,
    ethiopianMonthNumber: monthIndex,
    ethiopianDay: chunk.day,
    gregorianApprox: chunk.gregorianApprox,
    title: titleFromCommemorations(commemorations, chunk.month, chunk.day),
    type: classifyType(allText),
    category: 'synaxarium',
    summary,
    shortSummary: summary,
    commemorations,
    mainCommemorations: polishedCommemorations,
    scriptureReferences: scriptureReferences(body),
    importanceLevel: importanceLevel(commemorations.join(' ') || allText),
    readMore,
    status: 'verified',
    sourceTitle: 'The Ethiopian Synaxarium',
    sourceDateHeading: chunk.originalDateHeading,
    sourcePage: chunk.pdfPage,
    source: {
      title: 'The Ethiopian Synaxarium',
      dateHeading: chunk.originalDateHeading,
      page: chunk.pdfPage,
    },
  }
  entry.status = status === 'extracted' && !hasPublicTextArtifact(entry) ? 'verified' : 'needs_review'
  return entry
})

const entries = []
const extractedByMonthDay = new Set()
for (const entry of extractedEntries) {
  const key = `${entry.ethiopianMonthNumber}-${entry.ethiopianDay}`
  if (extractedByMonthDay.has(key)) continue
  extractedByMonthDay.add(key)
  entries.push(entry)
}

const byMonthDay = new Set(entries.map((entry) => `${entry.ethiopianMonthNumber}-${entry.ethiopianDay}`))
for (let monthNumber = 1; monthNumber <= MONTHS.length; monthNumber++) {
  const maxDay = monthNumber === 13 ? 6 : 30
  const month = MONTHS[monthNumber - 1]
  const [gregMonth, gregStart] = GREGORIAN_APPROX_START[monthNumber - 1]
  for (let day = 1; day <= maxDay; day++) {
    if (byMonthDay.has(`${monthNumber}-${day}`)) continue
    const dayPadded = String(day).padStart(2, '0')
    const gregDay = String(gregStart + day - 1).padStart(2, '0')
    entries.push({
      id: `${month.toLowerCase()}-${dayPadded}`,
      ethiopianMonth: month,
      ethiopianMonthNumber: monthNumber,
      ethiopianDay: day,
      gregorianApprox: `${gregMonth} ${gregDay}`,
      title: `Synaxarium Reading for ${month} ${day}`,
      type: 'commemoration',
      category: 'synaxarium',
      summary: 'Synaxarium details for this date are being prepared.',
      shortSummary: 'Synaxarium details for this date are being prepared.',
      commemorations: [],
      mainCommemorations: [],
      scriptureReferences: [],
      importanceLevel: 'minor',
      readMore: '',
      status: 'needs_review',
      sourceTitle: 'The Ethiopian Synaxarium',
      sourceDateHeading: `${month} ${dayPadded}`,
      sourcePage: null,
      source: {
        title: 'The Ethiopian Synaxarium',
        dateHeading: `${month} ${dayPadded}`,
        page: null,
      },
    })
  }
}

entries.sort((a, b) => {
  if (a.ethiopianMonthNumber !== b.ethiopianMonthNumber) {
    return a.ethiopianMonthNumber - b.ethiopianMonthNumber
  }
  return a.ethiopianDay - b.ethiopianDay
})

writeFileSync(
  OUT_FILE,
  `${JSON.stringify(
    {
      type: 'synaxarium_calendar',
      source: 'The Ethiopian Synaxarium',
      generatedFrom: SOURCE_PDF,
      entryCount: entries.length,
      entries,
    },
    null,
    2,
  )}\n`,
)

console.log(`Extracted ${entries.length} Synaxarium entries to ${OUT_FILE}`)
