/**
 * ethiopicTransliterator.ts
 *
 * Comprehensive, production-grade Latin transliteration engine for
 * Ethiopian Orthodox Tewahedo hymn lyrics (Amharic, Ge'ez, Tigrinya).
 *
 * Adheres strictly to Ethiopian Orthodox liturgical singing conventions:
 * - Proper representation of the 7 Ethiopic orders (Ge'ez, Ka'eb, Sals, Rabi, Hamis, Sadis, Sabi).
 * - Labiovelar series (kwa, gwa, qwa, hwa, etc.).
 * - Sacred ecclesiastical vocabulary and saint/angel names (Egziabher, Maryam, Mikael, etc.).
 * - Punctuation, repetition counters (2), (4), and structural headings (CHORUS, VERSE 1, etc.).
 * - Exact line-by-line and verse-by-verse alignment with original Ethiopic text.
 */

function b(term: string): RegExp {
  return new RegExp(`(?<=^|[^\\u1200-\\u137F])${term}(?=[^\\u1200-\\u137F]|$)`, 'gu')
}

// 1. Common Sacred Terminology & Names
const SACRED_TERMS: [RegExp, string][] = [
  [b('እግዚአብሔር'), 'Egziabher'],
  [b('እግዚአብሔርን'), 'Egziabhern'],
  [b('ለእግዚአብሔር'), 'leEgziabher'],
  [b('የእግዚአብሔር'), 'yeEgziabher'],
  [b('በእግዚአብሔር'), 'beEgziabher'],
  [b('እንደ\\s*እግዚአብሔር'), 'Ende Egziabher'],
  [b('እግዚኦ'), 'Egzi’o'],
  [b('አማኑኤል'), 'Amanuel'],
  [b('ለአማኑኤል'), 'leAmanuel'],
  [b('የአማኑኤል'), 'yeAmanuel'],
  [b('ኢየሱስ'), 'Iyesus'],
  [b('ክርስቶስ'), 'Kristos'],
  [b('ክርስቶስን'), 'Kristosn'],
  [b('ለክርስቶስ'), 'leKristos'],
  [b('የክርስቶስ'), 'yeKristos'],
  [b('በክርስቶስ'), 'beKristos'],
  [b('ማርያም'), 'Maryam'],
  [b('ማርያምን'), 'Maryamn'],
  [b('ለማርያም'), 'leMaryam'],
  [b('የማርያም'), 'yeMaryam'],
  [b('በማርያም'), 'beMaryam'],
  [b('ድንግል'), 'Dingil'],
  [b('ድንግልና'), 'dingilina'],
  [b('በድንግልና'), 'bedingilina'],
  [b('ሚካኤል'), 'Mikael'],
  [b('ለሚካኤል'), 'leMikael'],
  [b('የሚካኤል'), 'yeMikael'],
  [b('ገብርኤል'), 'Gebriel'],
  [b('ለገብርኤል'), 'leGebriel'],
  [b('የገብርኤል'), 'yeGebriel'],
  [b('ሩፋኤል'), 'Rufael'],
  [b('ኡራኤል'), 'Urael'],
  [b('ፋኑኤል'), 'Fanuel'],
  [b('ጊዮርጊስ'), 'Giyorgis'],
  [b('ተክለ\\s*ሃይማኖት'), 'Tekle Haymanot'],
  [b('ተክለሃይማኖት'), 'Tekle Haymanot'],
  [b('ተዋሕዶ'), 'Tewahedo'],
  [b('ተዋህዶ'), 'Tewahedo'],
  [b('ኦርቶዶክስ'), 'Ortodoks'],
  [b('መድኃኔዓለም'), 'Medhanealem'],
  [b('መድኃኔ\\s*ዓለም'), 'Medhanealem'],
  [b('መድሃኒዓለም'), 'Medhanealem'],
  [b('መድሀኒዓለም'), 'Medhanealem'],
  [b('ሥላሴ'), 'Silassie'],
  [b('ስላሴ'), 'Silassie'],
  [b('ለሥላሴ'), 'leSilassie'],
  [b('ለስላሴ'), 'leSilassie'],
  [b('ቅዱስ'), 'Kidus'],
  [b('ቅድስት'), 'Kidist'],
  [b('ቅዱሳን'), 'Kidusan'],
  [b('ቤተ\\s*ክርስቲያን'), 'Bete Kristian'],
  [b('ቤተክርስቲያን'), 'Bete Kristian'],
  [b('እመቤታችን'), 'Emebetachen'],
  [b('እመቤቴ'), 'Emebete'],
  [b('ጌታ'), 'Geta'],
  [b('ጌታዬ'), 'Getaye'],
  [b('ጌታችን'), 'Getachen'],
  [b('ሃሌ\\s*ሉያ'), 'Halleluya'],
  [b('ሃሌሉያ'), 'Halleluya'],
  [b('አሌሉያ'), 'Halleluya'],
  [b('አሜን'), 'Amen'],
  [b('ተመስገን'), 'temesgen'],
  [b('ይመስገን'), 'yemesgen'],
  [b('ምስጋና'), 'misgana'],
  [b('ክብር'), 'kibir'],
  [b('ሰላም'), 'selam'],
  [b('አባታችን'), 'Abatachen'],
  [b('መንፈስ\\s*ቅዱስ'), 'Menfes Kidus'],
  [b('መንፈስ'), 'menfes'],
  [b('ወልድ'), 'Weld'],
  [b('አብ'), 'Ab'],
]

// 2. Base Consonant Rows and Orders
// Order: 1 (e), 2 (u), 3 (i), 4 (a), 5 (e), 6 (consonant), 7 (o)
type FidelRow = [string, string, string, string, string, string, string]

const FIDEL_TABLE: Record<string, FidelRow> = {
  // Hoy
  'ሀ': ['he', 'hu', 'hi', 'ha', 'he', 'h', 'ho'],
  // Lawe
  'ለ': ['le', 'lu', 'li', 'la', 'le', 'l', 'lo'],
  // Hawt
  'ሐ': ['he', 'hu', 'hi', 'ha', 'he', 'h', 'ho'],
  // May
  'መ': ['me', 'mu', 'mi', 'ma', 'me', 'm', 'mo'],
  // Sawt
  'ሠ': ['se', 'su', 'si', 'sa', 'se', 's', 'so'],
  // Re'es
  'ረ': ['re', 'ru', 'ri', 'ra', 're', 'r', 'ro'],
  // Sat
  'ሰ': ['se', 'su', 'si', 'sa', 'se', 's', 'so'],
  // Shat
  'ሸ': ['she', 'shu', 'shi', 'sha', 'she', 'sh', 'sho'],
  // Qaf
  'ቀ': ['qe', 'qu', 'qi', 'qa', 'qe', 'q', 'qo'],
  // Qaf (Tigrinya/variant)
  'ቐ': ['khe', 'khu', 'khi', 'kha', 'khe', 'kh', 'kho'],
  // Bet
  'በ': ['be', 'bu', 'bi', 'ba', 'be', 'b', 'bo'],
  // Vet
  'ቨ': ['ve', 'vu', 'vi', 'va', 've', 'v', 'vo'],
  // Taw
  'ተ': ['te', 'tu', 'ti', 'ta', 'te', 't', 'to'],
  // Chaw
  'ቸ': ['che', 'chu', 'chi', 'cha', 'che', 'ch', 'cho'],
  // Harm (Ge'ez h)
  'ኀ': ['he', 'hu', 'hi', 'ha', 'he', 'h', 'ho'],
  // Nahas
  'ነ': ['ne', 'nu', 'ni', 'na', 'ne', 'n', 'no'],
  // Gnaha
  'ኘ': ['gne', 'gnu', 'gni', 'gna', 'gne', 'gn', 'gno'],
  // Alf (Glottal / vowel)
  'አ': ['a', 'u', 'i', 'a', 'e', 'e', 'o'],
  // Kaf
  'ከ': ['ke', 'ku', 'ki', 'ka', 'ke', 'k', 'ko'],
  // Xaf (Tigrinya/variant)
  'ኸ': ['khe', 'khu', 'khi', 'kha', 'khe', 'kh', 'kho'],
  // Wawe
  'ወ': ['we', 'wu', 'wi', 'wa', 'we', 'w', 'wo'],
  // Ayn
  'ዐ': ['a', 'u', 'i', 'a', 'e', 'e', 'o'],
  // Zay
  'ዘ': ['ze', 'zu', 'zi', 'za', 'ze', 'z', 'zo'],
  // Zhay
  'ዠ': ['zhe', 'zhu', 'zhi', 'zha', 'zhe', 'zh', 'zho'],
  // Yaman
  'የ': ['ye', 'yu', 'yi', 'ya', 'ye', 'y', 'yo'],
  // Dent
  'ደ': ['de', 'du', 'di', 'da', 'de', 'd', 'do'],
  // Jaw
  'ጀ': ['je', 'ju', 'ji', 'ja', 'je', 'j', 'jo'],
  // Gay
  'ገ': ['ge', 'gu', 'gi', 'ga', 'ge', 'g', 'go'],
  // Tayt
  'ጠ': ['t’e', 't’u', 't’i', 't’a', 't’e', 't’', 't’o'],
  // Ch’ayt
  'ጨ': ['ch’e', 'ch’u', 'ch’i', 'ch’a', 'ch’e', 'ch’', 'ch’o'],
  // P’ayt
  'ጰ': ['p’e', 'p’u', 'p’i', 'p’a', 'p’e', 'p’', 'p’o'],
  // Ts’aday
  'ጸ': ['ts’e', 'ts’u', 'ts’i', 'ts’a', 'ts’e', 'ts’', 'ts’o'],
  // Ts’appaw
  'ፀ': ['ts’e', 'ts’u', 'ts’i', 'ts’a', 'ts’e', 'ts’', 'ts’o'],
  // Af
  'ፈ': ['fe', 'fu', 'fi', 'fa', 'fe', 'f', 'fo'],
  // Psa
  'ፐ': ['pe', 'pu', 'pi', 'pa', 'pe', 'p', 'po'],
}

// Single lookup map: char -> transliteration string
const CHAR_MAP = new Map<string, string>()

// Populate standard 7 orders
const ROW_STARTS: [string, number][] = [
  ['ሀ', 0x1200],
  ['ለ', 0x1208],
  ['ሐ', 0x1210],
  ['መ', 0x1218],
  ['ሠ', 0x1220],
  ['ረ', 0x1228],
  ['ሰ', 0x1230],
  ['ሸ', 0x1238],
  ['ቀ', 0x1240],
  ['ቐ', 0x1248],
  ['በ', 0x1260],
  ['ቨ', 0x1268],
  ['ተ', 0x1270],
  ['ቸ', 0x1278],
  ['ኀ', 0x1280],
  ['ነ', 0x1290],
  ['ኘ', 0x1298],
  ['አ', 0x12a0],
  ['ከ', 0x12a8],
  ['ኸ', 0x12b0],
  ['ወ', 0x12c8],
  ['ዐ', 0x12d0],
  ['ዘ', 0x12d8],
  ['ዠ', 0x12e0],
  ['የ', 0x12e8],
  ['ደ', 0x12f0],
  ['ጀ', 0x1300],
  ['ገ', 0x1308],
  ['ጠ', 0x1320],
  ['ጨ', 0x1328],
  ['ጰ', 0x1330],
  ['ጸ', 0x1338],
  ['ፀ', 0x1340],
  ['ፈ', 0x1348],
  ['ፐ', 0x1350],
]

for (const [rowChar, startCode] of ROW_STARTS) {
  const row = FIDEL_TABLE[rowChar]
  if (!row) continue
  for (let order = 0; order < 7; order++) {
    const char = String.fromCharCode(startCode + order)
    CHAR_MAP.set(char, row[order])
  }
}

// 3. Labiovelars and Special Forms
const SPECIAL_CHARS: [string, string][] = [
  // ሏ ሟ ሯ ሷ ሿ ቧ ቷ ቿ ኗ ኟ ዟ ዧ ዷ ጇ ጧ ጯ ጷ ጿ ፏ ፗ
  ['ሏ', 'lwa'], ['ሟ', 'mwa'], ['ሯ', 'rwa'], ['ሷ', 'swa'], ['ሿ', 'shwa'],
  ['ቧ', 'bwa'], ['ቷ', 'twa'], ['ቿ', 'chwa'], ['ኗ', 'nwa'], ['ኟ', 'gnwa'],
  ['ዟ', 'zwa'], ['ዧ', 'zhwa'], ['ዷ', 'dwa'], ['ጇ', 'jwa'], ['ጧ', 't’wa'],
  ['ጯ', 'ch’wa'], ['ጷ', 'p’wa'], ['ጿ', 'ts’wa'], ['ፏ', 'fwa'], ['ፗ', 'pwa'],

  // Qw Series (ቈ, ቊ, ቋ, ቌ, ቍ)
  ['ቈ', 'qwe'], ['ቊ', 'qwi'], ['ቋ', 'qwa'], ['ቌ', 'qwe'], ['ቍ', 'qw'],
  // Hw Series (ኈ, ኊ, ኋ, ኌ, ኍ)
  ['ኈ', 'hwe'], ['ኊ', 'hwi'], ['ኋ', 'hwa'], ['ኌ', 'hwe'], ['ኍ', 'hw'],
  // Kw Series (ኰ, ኲ, ኳ, ኴ, ኵ)
  ['ኰ', 'kwe'], ['ኲ', 'kwi'], ['ኳ', 'kwa'], ['ኴ', 'kwe'], ['ኵ', 'kw'],
  // Gw Series (ጐ, ጒ, ጓ, ጔ, ጕ)
  ['ጐ', 'gwe'], ['ጒ', 'gwi'], ['ጓ', 'gwa'], ['ጔ', 'gwe'], ['ጕ', 'gw'],
  // Khw Series (ዀ, ዂ, ዃ, ዄ, ዅ)
  ['ዀ', 'khwe'], ['ዂ', 'khwi'], ['ዃ', 'khwa'], ['ዄ', 'khwe'], ['ዅ', 'khw'],

  // Ethiopic Numerals (፩ - ፲)
  ['፩', '1'], ['፪', '2'], ['፫', '3'], ['፬', '4'], ['፭', '5'],
  ['፮', '6'], ['፯', '7'], ['፰', '8'], ['፱', '9'], ['፲', '10'],

  // Ethiopic Punctuation
  ['፡', ' '], ['።', '.'], ['፣', ','], ['፤', ';'], ['፥', ':'], ['፦', ':'], ['፧', '?'], ['፨', ' '],
]

for (const [char, latin] of SPECIAL_CHARS) {
  CHAR_MAP.set(char, latin)
}

/**
 * Checks if a string contains any Ethiopic characters.
 */
export function containsEthiopic(text: string): boolean {
  return /[\u1200-\u137F]/.test(text)
}

/**
 * Transliterates a single word from Ethiopic script to Latin characters.
 * Handles 6th-order vowels intelligently (e.g. word-internal consonant clusters vs final consonants).
 */
export function transliterateWord(word: string, _language: string = 'amharic'): string {
  if (!word) return ''

  // Preserve non-Ethiopic words (e.g. already Latin)
  if (!containsEthiopic(word)) return word

  const chars = Array.from(word)
  const result: string[] = []

  for (let i = 0; i < chars.length; i++) {
    const c = chars[i]
    const next = i + 1 < chars.length ? chars[i + 1] : null

    // Check if known in CHAR_MAP
    const latin = CHAR_MAP.get(c)
    if (latin === undefined) {
      result.push(c)
      continue
    }

    // 6th order consonant handling:
    // First character of word: 'ስ' in 'ስምህ' -> 'si'
    const code = c.charCodeAt(0)
    const isSadis = (code >= 0x1200 && code <= 0x1357 && (code - 0x1200) % 8 === 5)

    if (isSadis) {
      if (i === 0 && next && containsEthiopic(next)) {
        if (latin.length === 1 && !['a', 'e', 'i', 'o', 'u'].includes(latin)) {
          result.push(latin + 'i')
          continue
        }
      }
    }

    result.push(latin)
  }

  return result.join('')
}

/**
 * Transliterates an entire lyric line, preserving structural markers,
 * repetition tokens ((2), /2/, (x2)), numbers, and Sacred Vocabulary.
 */
export function transliterateLyricLine(line: string, language: string = 'amharic'): string {
  const trimmed = line.trim()
  if (!trimmed) return ''

  // If line is an explicit structural marker, return standardized Latin marker
  if (/^(?:CHORUS|አዝማች|አዝ\.?|መደጋገሚያ|ይትበሃል)/i.test(trimmed)) {
    return 'CHORUS'
  }
  const verseMatch = trimmed.match(/^(?:VERSE\s*(\d+)|ክፍል\s*(\d+)|ቁጥር\s*(\d+)|ስንኝ\s*(\d+))/i)
  if (verseMatch) {
    const num = verseMatch[1] || verseMatch[2] || verseMatch[3] || verseMatch[4] || '1'
    return `VERSE ${num}`
  }

  // Pre-process sacred terminology
  let working = line
  for (const [pattern, replacement] of SACRED_TERMS) {
    working = working.replace(pattern, replacement)
  }

  // Handle Ethiopic repetition tokens like (፪) -> (2), (፬) -> (4)
  working = working.replace(/\(፪\)/g, '(2)')
  working = working.replace(/\/፪\//g, '(2)')
  working = working.replace(/፪\s*ጊዜ/g, '(2)')
  working = working.replace(/\(፬\)/g, '(4)')
  working = working.replace(/\/፬\//g, '(4)')
  working = working.replace(/፬\s*ጊዜ/g, '(4)')
  working = working.replace(/\/(\d+)\//g, '($1)')

  // Tokenize by whitespace and punctuation while preserving delimiters
  const tokens = working.split(/(\s+|[.,;:!?'"()\[\]/\\-]+)/)
  const transliteratedTokens = tokens.map((token) => {
    if (!token || /^\s+$/.test(token) || /^[.,;:!?'"()\[\]/\\-]+$/.test(token)) {
      return token
    }
    return transliterateWord(token, language)
  })

  let out = transliteratedTokens.join('')

  // Clean up double spaces or artifacts
  out = out.replace(/\s{2,}/g, ' ').trim()

  // Clean up repetition markers
  out = out.replace(/\s*\(\s*(\d+)\s*\)/g, ' ($1)')

  // Capitalize first character of lyric line
  if (out.length > 0) {
    out = out.charAt(0).toUpperCase() + out.slice(1)
  }

  return out
}

/**
 * Transliterates full formatted Ethiopic lyrics into structurally matching Latin transliteration.
 * Guarantees:
 * - Exact same line count
 * - Exact same section headers (CHORUS, VERSE 1, etc.)
 * - Exact same stanza breaks
 * - Exact same repetition counters
 */
export function generateMatchingTransliteration(
  formattedEthiopicLyrics: string,
  language: string = 'amharic',
): string {
  if (!formattedEthiopicLyrics || !formattedEthiopicLyrics.trim()) {
    return ''
  }

  const lines = formattedEthiopicLyrics.split(/\r?\n/)
  const transliteratedLines: string[] = []

  for (const line of lines) {
    const trimmed = line.trim()
    if (!trimmed) {
      transliteratedLines.push('')
      continue
    }

    if (trimmed === 'CHORUS' || /^VERSE\s*\d+$/i.test(trimmed)) {
      transliteratedLines.push(trimmed)
      continue
    }

    const trLine = transliterateLyricLine(line, language)
    transliteratedLines.push(trLine)
  }

  return transliteratedLines.join('\n')
}
