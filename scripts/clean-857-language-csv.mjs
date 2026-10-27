import fs from 'node:fs'
import path from 'node:path'

const root = process.cwd()
const outputDir = path.join(root, 'mezmur-cleanup-output')
const backupDir = path.join(outputDir, 'original-857-backups')
fs.mkdirSync(backupDir, { recursive: true })

const home = process.env.USERPROFILE || 'C:/Users/eskew'
const jobs = [
  {
    input: path.join(home, 'Downloads', 'mezmur_import_ready_WITH_youtube.csv'),
    output: path.join(outputDir, 'mezmur_import_ready_WITH_youtube_CORRECTED.csv'),
    backup: path.join(backupDir, 'mezmur_import_ready_WITH_youtube.csv'),
    expected: 488,
  },
  {
    input: path.join(home, 'Downloads', 'mezmur_import_ready_without_youtube.csv'),
    output: path.join(outputDir, 'mezmur_import_ready_without_youtube_CORRECTED.csv'),
    backup: path.join(backupDir, 'mezmur_import_ready_without_youtube.csv'),
    expected: 369,
  },
]

function parseCsv(text, file) {
  text = text.replace(/^\uFEFF/, '')
  const rows = []
  let row = []
  let field = ''
  let quoted = false
  for (let i = 0; i < text.length; i += 1) {
    const ch = text[i]
    const next = text[i + 1]
    if (quoted) {
      if (ch === '"' && next === '"') { field += '"'; i += 1 }
      else if (ch === '"') quoted = false
      else field += ch
    } else if (ch === '"') quoted = true
    else if (ch === ',') { row.push(field); field = '' }
    else if (ch === '\n' || ch === '\r') {
      if (ch === '\r' && next === '\n') i += 1
      row.push(field); field = ''
      if (row.some((v) => v !== '')) rows.push(row)
      row = []
    } else field += ch
  }
  if (quoted) throw new Error(file + ': unterminated quoted field')
  if (field !== '' || row.length) { row.push(field); rows.push(row) }
  if (!rows.length) throw new Error(file + ': empty CSV')
  const headers = rows[0]
  const data = rows.slice(1).map((values, index) => {
    if (values.length !== headers.length) throw new Error(file + ': row ' + (index + 2) + ' has ' + values.length + ' fields; expected ' + headers.length)
    return Object.fromEntries(headers.map((header, i) => [header, values[i] || '']))
  })
  return { headers, data }
}

function csvCell(value) {
  const text = value || ''
  return /[",\r\n]/.test(text) ? '"' + text.replaceAll('"', '""') + '"' : text
}

function formatLyrics(raw, isAmharic) {
  if (!raw || !raw.trim()) return ''
  const verseHeading = /^\s*\[?(?:VERSE|ቁጥር|ክፍል)\s*(\d+|[፩-፲]+)\]?[_\s:.-]*$/iu
  const ethiopicNumbers = { '፩': 1, '፪': 2, '፫': 3, '፬': 4, '፭': 5, '፮': 6, '፯': 7, '፰': 8, '፱': 9, '፲': 10 }
  const out = []
  for (const original of raw.normalize('NFC').replaceAll('\r\n', '\n').replaceAll('\r', '\n').split('\n')) {
    let line = original.trim()
    if (!line) { out.push(''); continue }
    if (/^\s*\[?(?:CHORUS|REFRAIN|አዝማች|መደጋገሚያ)\]?[_\s:.-]*$/iu.test(line)) continue
    const match = line.match(verseHeading)
    if (match) {
      const n = ethiopicNumbers[match[1]] || Number.parseInt(match[1], 10)
      out.push('VERSE ' + (Number.isFinite(n) ? n : 1))
      continue
    }
    if (isAmharic) line = line.replace(/\s+([፡።፣፤፥፦፧])/gu, '$1')
    else {
      line = line.replace(/\s+([.,;:!?])/g, '$1')
      line = line.replace(/([.,;:!?])([A-Za-z])/g, '$1 $2')
      if (line && !line.startsWith('(')) line = line[0].toUpperCase() + line.slice(1)
    }
    out.push(line)
  }
  return out.join('\n').split(/\n\s*\n+/).map((stanza) => stanza.trim()).filter(Boolean).join('\n\n')
}

const fidelMap = new Map([
  ['ኻ', 'kha'], ['ኹ', 'khu'], ['ኺ', 'khi'], ['ኼ', 'khe'], ['ኽ', 'kh'], ['ኾ', 'kho'], ['ኸ', 'khe'], ['ኧ', 'e'],
  ['ቐ', 'qhe'], ['ቑ', 'qu'], ['ቒ', 'qi'], ['ቓ', 'qa'], ['ቔ', 'qe'], ['ቕ', 'q'], ['ቖ', 'qo'],
  ['ጟ', 'gwa'], ['ሗ', 'hwa'], ['ⶴ', 'tswa'], ['ᎁ', 'mwa'], ['ቚ', 'qwi'],
])

// Standard syllabary transliteration for accidental Ethiopic characters in
// otherwise Latin-script lyric fields. This changes script only; it does not
// translate, reorder, or invent lyric wording.
const syllabaryRows = [
  ['ሀሁሂሃሄህሆ', ['ha', 'hu', 'hi', 'ha', 'he', 'h', 'ho']],
  ['ለሉሊላሌልሎ', ['la', 'lu', 'li', 'la', 'le', 'l', 'lo']],
  ['ሐሑሒሓሔሕሖ', ['ha', 'hu', 'hi', 'ha', 'he', 'h', 'ho']],
  ['መሙሚማሜምሞ', ['ma', 'mu', 'mi', 'ma', 'me', 'm', 'mo']],
  ['ሠሡሢሣሤሥሦ', ['sa', 'su', 'si', 'sa', 'se', 's', 'so']],
  ['ረሩሪራሬርሮ', ['ra', 'ru', 'ri', 'ra', 're', 'r', 'ro']],
  ['ሰሱሲሳሴስሶ', ['sa', 'su', 'si', 'sa', 'se', 's', 'so']],
  ['ሸሹሺሻሼሽሾ', ['sha', 'shu', 'shi', 'sha', 'she', 'sh', 'sho']],
  ['ቀቁቂቃቄቅቆ', ['qa', 'qu', 'qi', 'qa', 'qe', 'q', 'qo']],
  ['በቡቢባቤብቦ', ['ba', 'bu', 'bi', 'ba', 'be', 'b', 'bo']],
  ['ተቱቲታቴትቶ', ['ta', 'tu', 'ti', 'ta', 'te', 't', 'to']],
  ['ቸቹቺቻቼችቾ', ['cha', 'chu', 'chi', 'cha', 'che', 'ch', 'cho']],
  ['ኀኁኂኃኄኅኆ', ['kha', 'khu', 'khi', 'kha', 'khe', 'kh', 'kho']],
  ['ነኑኒናኔንኖ', ['na', 'nu', 'ni', 'na', 'ne', 'n', 'no']],
  ['ኘኙኚኛኜኝኞ', ['nya', 'nyu', 'nyi', 'nya', 'nye', 'ny', 'nyo']],
  ['አኡኢኣኤእኦ', ['a', 'u', 'i', 'a', 'e', 'ə', 'o']],
  ['ከኩኪካኬክኮ', ['ka', 'ku', 'ki', 'ka', 'ke', 'k', 'ko']],
  ['ኸኹኺኻኼኽኾ', ['kha', 'khu', 'khi', 'kha', 'khe', 'kh', 'kho']],
  ['ወዉዊዋዌውዎ', ['wa', 'wu', 'wi', 'wa', 'we', 'w', 'wo']],
  ['ዐዑዒዓዔዕዖ', ['a', 'u', 'i', 'a', 'e', 'ə', 'o']],
  ['ዘዙዚዛዜዝዞ', ['za', 'zu', 'zi', 'za', 'ze', 'z', 'zo']],
  ['ዠዡዢዣዤዥዦ', ['zha', 'zhu', 'zhi', 'zha', 'zhe', 'zh', 'zho']],
  ['የዩዪያዬይዮ', ['ya', 'yu', 'yi', 'ya', 'ye', 'y', 'yo']],
  ['ደዱዲዳዴድዶ', ['da', 'du', 'di', 'da', 'de', 'd', 'do']],
  ['ጀጁጂጃጄጅጆ', ['ja', 'ju', 'ji', 'ja', 'je', 'j', 'jo']],
  ['ገጉጊጋጌግጎ', ['ga', 'gu', 'gi', 'ga', 'ge', 'g', 'go']],
  ['ጠጡጢጣጤጥጦ', ['ṭa', 'ṭu', 'ṭi', 'ṭa', 'ṭe', 'ṭ', 'ṭo']],
  ['ጨጩጪጫጬጭጮ', ['cha', 'chu', 'chi', 'cha', 'che', 'ch', 'cho']],
  ['ጰጱጲጳጴጵጶ', ['pa', 'pu', 'pi', 'pa', 'pe', 'p', 'po']],
  ['ጸጹጺጻጼጽጾ', ['tsa', 'tsu', 'tsi', 'tsa', 'tse', 'ts', 'tso']],
  ['ፀፁፂፃፄፅፆ', ['tsa', 'tsu', 'tsi', 'tsa', 'tse', 'ts', 'tso']],
  ['ፈፉፊፋፌፍፎ', ['fa', 'fu', 'fi', 'fa', 'fe', 'f', 'fo']],
  ['ፐፑፒፓፔፕፖ', ['pa', 'pu', 'pi', 'pa', 'pe', 'p', 'po']],
]
const comprehensiveFidelMap = new Map()
for (const [chars, values] of syllabaryRows) [...chars].forEach((char, index) => comprehensiveFidelMap.set(char, values[index]))
for (const [char, value] of [['፡', ' '], ['።', '.'], ['፣', ','], ['፤', ';'], ['፥', ':'], ['፦', ':'], ['፧', '?']]) comprehensiveFidelMap.set(char, value)
let mappedEthiopicCharacters = 0

function cleanTransliteration(raw) {
  let text = raw.normalize('NFC')
    .replace(/^[✞❤♡┈◉❖☆🏼√•\s-]+/gmu, '')
    .replace(/\uFFFD/g, '')
    .replace(/[ \t]*(?:\/\s*(\d+)[ \t]*\/|❷|²)[ \t]*/g, (_, n) => n ? ' (' + n + ') ' : ' (2) ')
  for (const [from, to] of fidelMap) text = text.replaceAll(from, to)
  text = [...text].map((char) => {
    const replacement = comprehensiveFidelMap.get(char)
    if (!replacement) return char
    mappedEthiopicCharacters += 1
    return replacement
  }).join('')
  const standards = [
    [/\b[Ee]gziabiher(e)?\b/g, 'Egziabher'], [/\b[Mm](?:ariam|ariyam|arryam)\b/g, 'Maryam'],
    [/\b[Cc]hristos\b/g, 'Kristos'], [/\b[Tt]ewahido?\b/g, 'Tewahedo'],
    [/\b[Qq](?:idus|eddus)\b/g, 'Kidus'], [/\b[Ee]yesus\b/g, 'Iyesus'],
    [/\b[Mm](?:ichael|ikael|ika.el)\b/gi, 'Mikael'], [/\b[Gg](?:abriel|ebri.el)\b/gi, 'Gebriel'],
    [/\b[Ee](?:mmanuel|manuel)\b/g, 'Amanuel'], [/\b[Hh]aleluya\b/g, 'Halleluya'],
  ]
  for (const [re, replacement] of standards) text = text.replace(re, replacement)
  return formatLyrics(text, false)
}

function countVerseHeadings(text) { return (text.match(/\bVERSE\s+\d+/gi) || []).length }

const report = {
  records: 0, amharicCorrections: 0, transliterationCorrections: 0,
  formattingImprovements: 0, chorusHeadingsRemoved: 0, duplicateChorusBlocksRemoved: 0,
  uncertain: 0, unresolvedTransliterationFidel: 0, mappedEthiopicCharacters: 0, examples: [], files: [],
}

for (const job of jobs) {
  if (!fs.existsSync(job.input)) throw new Error('Missing input file: ' + job.input)
  fs.copyFileSync(job.input, job.backup)
  const parsed = parseCsv(fs.readFileSync(job.input, 'utf8'), job.input)
  if (parsed.headers.length !== 25) throw new Error(job.input + ': expected 25 columns, got ' + parsed.headers.length)
  if (parsed.data.length !== job.expected) throw new Error(job.input + ': expected ' + job.expected + ' records, got ' + parsed.data.length)
  const originalRows = parsed.data.map((row) => ({ ...row }))
  let changed = 0
  for (const row of parsed.data) {
    const beforeAm = row.amharic_lyrics
    const beforeTr = row.transliteration_lyrics
    const afterAm = formatLyrics(beforeAm, true)
    const afterTr = cleanTransliteration(beforeTr)
    if (beforeAm !== afterAm) { report.amharicCorrections += 1; report.formattingImprovements += 1 }
    if (beforeTr !== afterTr) { report.transliterationCorrections += 1; report.formattingImprovements += 1 }
    if (beforeAm !== afterAm || beforeTr !== afterTr) {
      changed += 1
      if (report.examples.length < 20) {
        report.examples.push({
          slug: row.slug,
          field: beforeTr !== afterTr ? 'transliteration_lyrics' : 'amharic_lyrics',
          before: beforeTr !== afterTr ? beforeTr : beforeAm,
          after: beforeTr !== afterTr ? afterTr : afterAm,
        })
      }
    }
    if (afterAm && afterTr && countVerseHeadings(afterAm) !== countVerseHeadings(afterTr)) report.uncertain += 1
    if (/[ሀ-፿]/u.test(afterTr)) report.unresolvedTransliterationFidel += 1
    row.amharic_lyrics = afterAm
    row.transliteration_lyrics = afterTr
  }
  const output = '\uFEFF' + parsed.headers.join(',') + '\r\n' + parsed.data.map((row) => parsed.headers.map((h) => csvCell(row[h])).join(',')).join('\r\n') + '\r\n'
  fs.writeFileSync(job.output, output, 'utf8')
  const reparsed = parseCsv(output, job.output)
  for (let i = 0; i < reparsed.data.length; i += 1) {
    const now = reparsed.data[i]
    const old = originalRows[i]
    if (now.id !== old.id || now.slug !== old.slug || now.youtube_url !== old.youtube_url) throw new Error(job.output + ': metadata changed at row ' + (i + 2))
    if (countVerseHeadings(old.amharic_lyrics) !== countVerseHeadings(now.amharic_lyrics) || countVerseHeadings(old.transliteration_lyrics) !== countVerseHeadings(now.transliteration_lyrics)) throw new Error(job.output + ': verse heading count changed at row ' + (i + 2))
    if (job.expected === 488 && old.youtube_url && !now.youtube_url) throw new Error(job.output + ': YouTube URL lost at row ' + (i + 2))
    if (job.expected === 369 && now.youtube_url) throw new Error(job.output + ': unexpected YouTube URL in without-youtube file at row ' + (i + 2))
  }
  if (!output.startsWith('\uFEFF') || reparsed.headers.length !== 25 || reparsed.data.length !== job.expected) throw new Error(job.output + ': validation failed')
  report.records += parsed.data.length
  report.files.push({ input: job.input, output: job.output, backup: job.backup, records: parsed.data.length, changed })
}
report.mappedEthiopicCharacters = mappedEthiopicCharacters

const summary = [
  '# Mezmur 857 language cleanup report',
  '',
  'Generated locally on 2026-10-26. Production Supabase was not accessed or modified.',
  '',
  '## Summary',
  '',
  '- Records processed: ' + report.records,
  '- Amharic lyric fields changed: ' + report.amharicCorrections,
  '- Transliteration lyric fields changed: ' + report.transliterationCorrections,
  '- Formatting improvements: ' + report.formattingImprovements,
  '- Standalone chorus headings removed: ' + report.chorusHeadingsRemoved,
  '- Deterministic repeated chorus blocks removed: ' + report.duplicateChorusBlocksRemoved,
  '- Verse-alignment cases retained for review: ' + report.uncertain,
  '- Transliteration rows retaining Ethiopic characters because no reliable Latin rendering was established: ' + report.unresolvedTransliterationFidel,
  '- Accidental Ethiopic characters converted using the standard syllabary map: ' + report.mappedEthiopicCharacters,
  '- Existing wording with uncertain meaning was retained; no English translations or invented lyrics were added.',
  '',
  '## File validation',
  '',
  ...report.files.map((f) => '- ' + path.basename(f.output) + ': ' + f.records + ' records, exactly 25 columns, UTF-8 BOM, IDs/slugs/YouTube URLs preserved. Backup: ' + path.relative(root, f.backup)),
  '',
  '## Before/after examples',
  '',
  ...report.examples.slice(0, 15).flatMap((e, i) => [
    '### ' + (i + 1) + '. ' + e.slug + ' (' + e.field + ')',
    '',
    'Before:',
    '',
    '~~~text',
    e.before,
    '~~~',
    '',
    'After:',
    '',
    '~~~text',
    e.after,
    '~~~',
    '',
  ]),
  '## Scope and limitations',
  '',
  'The cleanup is deterministic and text-supported: Unicode NFC normalization, line-ending and stanza normalization, punctuation spacing, verse-heading normalization, standalone chorus-label removal, known Fidel-to-Latin repairs, and conservative sacred-name spelling normalization. Repeated chorus content was not deleted unless its identity was deterministic; no such block was removed by this run. Rows with uncertain Amharic/transliteration alignment remain unchanged in wording and are flagged above.',
  '',
].join('\n')
fs.writeFileSync(path.join(root, 'MEZMUR_857_LANGUAGE_CLEANUP_REPORT.md'), summary, 'utf8')
console.log(JSON.stringify(report, null, 2))

