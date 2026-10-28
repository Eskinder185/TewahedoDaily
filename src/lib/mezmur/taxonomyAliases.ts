/**
 * Canonical multilingual alias dictionary for the 25 Mezmur categories and
 * 24 Mezmur occasions defined in `src/lib/publicContent/taxonomy.ts`.
 *
 * Every alias points at an existing canonical label — no new taxonomy entries
 * are created here. Aliases are used for two things:
 *   1. lyrics-based classification (`lyricsTaxonomyClassifier.ts`)
 *   2. search / filter resolution (`taxonomy.ts`, `mezmurSearch.ts`)
 *
 * Evidence strength (1–5): how strongly the alias, found in lyrics, indicates
 * the canonical subject. 5 = the name itself; 1 = weak contextual hint.
 * `ambiguous` aliases have other common meanings and only count when the
 * classifier finds supporting context. `searchOnly` aliases are valid search
 * terms (e.g. feast names that are also everyday words) but are never used as
 * lyric evidence.
 */
import type { CanonicalCategory, CanonicalOccasion } from '../publicContent/taxonomy'

export type TaxonomyKind = 'category' | 'occasion'
export type AliasLanguage = 'amharic' | 'geez' | 'english' | 'transliteration' | 'tigrinya'
export type AliasScript = 'ethiopic' | 'latin'
export type AliasType =
  | 'exact_name'
  | 'spelling_variation'
  | 'transliteration'
  | 'honorific'
  | 'contextual_phrase'

export interface TaxonomyAlias {
  kind: TaxonomyKind
  canonical: CanonicalCategory | CanonicalOccasion
  slug: string
  alias: string
  language: AliasLanguage
  script: AliasScript
  type: AliasType
  strength: number
  ambiguous: boolean
  /** Valid as a search term only; never used as lyric evidence. */
  searchOnly?: boolean
  /** Regex (applied to normalized text) instead of a literal alias. */
  pattern?: string
  /** Match the alias as a whole word only (no attached prefixes/suffixes). */
  exactOnly?: boolean
  notes?: string
}

export interface TaxonomyEntry {
  kind: TaxonomyKind
  canonical: CanonicalCategory | CanonicalOccasion
  slug: string
  amharic: string
  /**
   * Browse groups (mezmur_collections_import slugs) where this entry has a
   * section: the live mezmur_sections_import snapshot (2026-10-24) plus the
   * code fallbacks in src/lib/publicContent/browseTaxonomy.ts.
   */
  browseSections: string[]
  group?: 'person' | 'theme' | 'general'
}

// ---------------------------------------------------------------------------
// Canonical entries (labels, existing slugs, Amharic names, browse sections)
// ---------------------------------------------------------------------------

export const CATEGORY_ENTRIES: TaxonomyEntry[] = [
  { kind: 'category', canonical: 'Jesus Christ', slug: 'jesus-christ', amharic: 'ኢየሱስ ክርስቶስ', browseSections: ['jesus-christ'], group: 'person' },
  { kind: 'category', canonical: 'Virgin Mary', slug: 'virgin-mary', amharic: 'ድንግል ማርያም', browseSections: ['virgin-mary'], group: 'person' },
  { kind: 'category', canonical: 'Holy Trinity', slug: 'holy-trinity', amharic: 'ቅድስት ሥላሴ', browseSections: ['praise-general'], group: 'person' },
  { kind: 'category', canonical: 'Holy Spirit', slug: 'holy-spirit', amharic: 'መንፈስ ቅዱስ', browseSections: ['praise-general'], group: 'person' },
  { kind: 'category', canonical: 'Kidus Michael', slug: 'kidus-michael', amharic: 'ቅዱስ ሚካኤል', browseSections: ['angels-saints'], group: 'person' },
  { kind: 'category', canonical: 'Kidus Gabriel', slug: 'kidus-gabriel', amharic: 'ቅዱስ ገብርኤል', browseSections: ['angels-saints'], group: 'person' },
  { kind: 'category', canonical: 'Kidus Raphael', slug: 'kidus-raphael', amharic: 'ቅዱስ ሩፋኤል', browseSections: ['angels-saints'], group: 'person' },
  { kind: 'category', canonical: 'Kidus Uriel', slug: 'kidus-uriel', amharic: 'ቅዱስ ኡራኤል', browseSections: ['angels-saints'], group: 'person' },
  { kind: 'category', canonical: 'Kidus Giorgis', slug: 'kidus-giorgis', amharic: 'ቅዱስ ጊዮርጊስ', browseSections: ['angels-saints'], group: 'person' },
  { kind: 'category', canonical: 'Abune Tekle Haymanot', slug: 'abune-tekle-haymanot', amharic: 'አቡነ ተክለ ሃይማኖት', browseSections: ['angels-saints'], group: 'person' },
  { kind: 'category', canonical: 'Abune Gebre Menfes Kidus', slug: 'abune-gebre-menfes-kidus', amharic: 'አቡነ ገብረ መንፈስ ቅዱስ', browseSections: ['angels-saints'], group: 'person' },
  { kind: 'category', canonical: 'Kidus Yared', slug: 'kidus-yared', amharic: 'ቅዱስ ያሬድ', browseSections: ['angels-saints'], group: 'person' },
  { kind: 'category', canonical: 'Yohannes Metmek / John the Baptist', slug: 'yohannes-metmek-john-the-baptist', amharic: 'ዮሐንስ መጥምቅ', browseSections: ['angels-saints'], group: 'person' },
  { kind: 'category', canonical: 'Kidus Estifanos / Saint Stephen', slug: 'kidus-estifanos-saint-stephen', amharic: 'ቅዱስ እስጢፋኖስ', browseSections: ['angels-saints'], group: 'person' },
  { kind: 'category', canonical: 'Apostles', slug: 'apostles', amharic: 'ሐዋርያት', browseSections: ['angels-saints'], group: 'person' },
  { kind: 'category', canonical: 'Martyrs', slug: 'martyrs', amharic: 'ሰማዕታት', browseSections: ['angels-saints'], group: 'person' },
  { kind: 'category', canonical: 'Saints', slug: 'saints', amharic: 'ቅዱሳን', browseSections: ['angels-saints'], group: 'person' },
  { kind: 'category', canonical: 'Angels', slug: 'angels', amharic: 'መላእክት', browseSections: ['angels-saints'], group: 'person' },
  { kind: 'category', canonical: 'Prophets', slug: 'prophets', amharic: 'ነቢያት', browseSections: ['angels-saints'], group: 'person' },
  { kind: 'category', canonical: 'Cross', slug: 'cross', amharic: 'መስቀል', browseSections: ['praise-general'], group: 'theme' },
  { kind: 'category', canonical: 'Repentance', slug: 'repentance', amharic: 'ንስሐ', browseSections: ['repentance-fasting'], group: 'theme' },
  { kind: 'category', canonical: 'Praise / Worship', slug: 'praise-worship', amharic: 'ምስጋናና አምልኮ', browseSections: ['praise-general'], group: 'theme' },
  { kind: 'category', canonical: 'Prayer', slug: 'prayer', amharic: 'ጸሎት', browseSections: ['praise-general'], group: 'theme' },
  { kind: 'category', canonical: 'Salvation', slug: 'salvation', amharic: 'ድኅነት', browseSections: ['jesus-christ'], group: 'theme' },
  { kind: 'category', canonical: 'General', slug: 'general', amharic: 'አጠቃላይ', browseSections: ['praise-general'], group: 'general' },
]

export const OCCASION_ENTRIES: TaxonomyEntry[] = [
  { kind: 'occasion', canonical: 'Gena', slug: 'gena', amharic: 'ገና', browseSections: ['holidays-feasts', 'jesus-christ', 'virgin-mary'] },
  { kind: 'occasion', canonical: 'Timket', slug: 'timket', amharic: 'ጥምቀት', browseSections: ['holidays-feasts', 'jesus-christ'] },
  { kind: 'occasion', canonical: 'Meskel', slug: 'meskel', amharic: 'መስቀል', browseSections: ['holidays-feasts'] },
  { kind: 'occasion', canonical: 'Hosanna', slug: 'hosanna', amharic: 'ሆሳዕና', browseSections: ['holidays-feasts', 'jesus-christ'] },
  { kind: 'occasion', canonical: 'Siklet', slug: 'siklet', amharic: 'ስቅለት', browseSections: ['holidays-feasts', 'jesus-christ'] },
  { kind: 'occasion', canonical: 'Tinsae', slug: 'tinsae', amharic: 'ትንሣኤ', browseSections: ['holidays-feasts', 'jesus-christ'] },
  { kind: 'occasion', canonical: 'Erget', slug: 'erget', amharic: 'ዕርገት', browseSections: ['holidays-feasts'] },
  { kind: 'occasion', canonical: 'Pentecost', slug: 'pentecost', amharic: 'ጰራቅሊጦስ', browseSections: ['holidays-feasts'] },
  { kind: 'occasion', canonical: 'Debre Tabor', slug: 'debre-tabor', amharic: 'ደብረ ታቦር', browseSections: ['holidays-feasts', 'jesus-christ'] },
  { kind: 'occasion', canonical: 'Filseta', slug: 'filseta', amharic: 'ፍልሰታ', browseSections: ['holidays-feasts', 'virgin-mary'] },
  { kind: 'occasion', canonical: 'Kidane Mihret', slug: 'kidane-mihret', amharic: 'ኪዳነ ምሕረት', browseSections: ['holidays-feasts', 'virgin-mary'] },
  { kind: 'occasion', canonical: 'Lideta Maryam', slug: 'lideta-maryam', amharic: 'ልደታ ማርያም', browseSections: ['holidays-feasts', 'virgin-mary'] },
  { kind: 'occasion', canonical: 'Abiy Tsom', slug: 'abiy-tsom', amharic: 'ዐቢይ ጾም', browseSections: ['repentance-fasting'] },
  { kind: 'occasion', canonical: 'Tsome Nineveh', slug: 'tsome-nineveh', amharic: 'ጾመ ነነዌ', browseSections: ['repentance-fasting'] },
  { kind: 'occasion', canonical: 'Tsome Nebiyat', slug: 'tsome-nebiyat', amharic: 'ጾመ ነቢያት', browseSections: ['repentance-fasting'] },
  { kind: 'occasion', canonical: 'Tsome Hawariat', slug: 'tsome-hawariat', amharic: 'ጾመ ሐዋርያት', browseSections: ['repentance-fasting'] },
  { kind: 'occasion', canonical: 'Holy Week', slug: 'holy-week', amharic: 'ሰሙነ ሕማማት', browseSections: ['holidays-feasts', 'repentance-fasting'] },
  { kind: 'occasion', canonical: 'New Year / Enkutatash', slug: 'new-year', amharic: 'እንቁጣጣሽ', browseSections: ['holidays-feasts'] },
  { kind: 'occasion', canonical: 'Annual Saint Feast', slug: 'annual-saint-feast', amharic: 'የቅዱሳን ዓመታዊ በዓላት', browseSections: ['angels-saints'] },
  { kind: 'occasion', canonical: 'Wedding', slug: 'wedding', amharic: 'ሰርግ', browseSections: ['sacraments-church-life'] },
  { kind: 'occasion', canonical: 'Baptism', slug: 'baptism', amharic: 'ሥርዓተ ጥምቀት', browseSections: ['sacraments-church-life'] },
  { kind: 'occasion', canonical: 'Funeral / Memorial', slug: 'funeral', amharic: 'ፍትሐት / መታሰቢያ', browseSections: ['sacraments-church-life'] },
  { kind: 'occasion', canonical: 'Communion', slug: 'communion', amharic: 'ቅዱስ ቁርባን', browseSections: ['sacraments-church-life'] },
  { kind: 'occasion', canonical: 'General / Anytime', slug: 'general', amharic: 'አጠቃላይ / በማንኛውም ጊዜ', browseSections: ['praise-general'] },
]

export const ALL_ENTRIES: TaxonomyEntry[] = [...CATEGORY_ENTRIES, ...OCCASION_ENTRIES]

// ---------------------------------------------------------------------------
// Alias authoring helpers
// ---------------------------------------------------------------------------

const ETHIOPIC = /[ሀ-᎟ⶀ-⷟]/

interface Opts {
  ambiguous?: boolean
  searchOnly?: boolean
  exactOnly?: boolean
  language?: AliasLanguage
  notes?: string
}

type Spec = [AliasType, number, string[], Opts?]
type PatternSpec = { pattern: string; label: string; strength: number; notes?: string; ambiguous?: boolean }

function entryFor(kind: TaxonomyKind, canonical: string): TaxonomyEntry {
  const list = kind === 'category' ? CATEGORY_ENTRIES : OCCASION_ENTRIES
  const entry = list.find((e) => e.canonical === canonical)
  if (!entry) throw new Error(`Unknown ${kind} "${canonical}" in alias dictionary`)
  return entry
}

const ALIASES: TaxonomyAlias[] = []

function define(kind: TaxonomyKind, canonical: string, specs: Spec[], patterns: PatternSpec[] = []): void {
  const entry = entryFor(kind, canonical)
  const seen = new Map<string, number>()
  const push = (a: TaxonomyAlias) => {
    const key = `${a.alias}|${a.pattern || ''}`
    const at = seen.get(key)
    if (at !== undefined) {
      const prev = ALIASES[at]
      if (prev.searchOnly && !a.searchOnly) {
        // A label that is also lyric evidence: an exact evidence alias replaces the
        // search-only label; an ambiguous one is added beside it, so the feast name
        // stays an exact search term while lyrics need context (e.g. ጥምቀት, ትንሣኤ).
        if (a.ambiguous || a.type === 'contextual_phrase') {
          seen.set(`${key}|evidence`, ALIASES.length)
          ALIASES.push(a)
        } else {
          ALIASES[at] = a
        }
      }
      return
    }
    seen.set(key, ALIASES.length)
    ALIASES.push(a)
  }
  // canonical English label and Amharic label are always exact names
  push(base(entry, entry.canonical, 'exact_name', 5, { searchOnly: kind === 'occasion' || entry.group === 'general' }))
  for (const part of entry.canonical.split(' / ')) {
    if (part !== entry.canonical) push(base(entry, part, 'exact_name', 5, { searchOnly: kind === 'occasion' || entry.group === 'general' }))
  }
  for (const part of entry.amharic.split(/\s*[/()]\s*/).filter(Boolean)) {
    push(base(entry, part.trim(), 'exact_name', 5, { searchOnly: true }))
  }
  for (const [type, strength, aliases, opts] of specs) {
    for (const alias of aliases) push(base(entry, alias, type, strength, opts))
  }
  for (const p of patterns) {
    push({
      ...base(entry, p.label, 'contextual_phrase', p.strength, { ambiguous: p.ambiguous, notes: p.notes }),
      pattern: p.pattern,
    })
  }
}

function base(entry: TaxonomyEntry, alias: string, type: AliasType, strength: number, opts: Opts = {}): TaxonomyAlias {
  const ethiopic = ETHIOPIC.test(alias)
  const language: AliasLanguage =
    opts.language || (ethiopic ? 'amharic' : type === 'transliteration' ? 'transliteration' : 'english')
  return {
    kind: entry.kind,
    canonical: entry.canonical,
    slug: entry.slug,
    alias,
    language,
    script: ethiopic ? 'ethiopic' : 'latin',
    type,
    strength,
    ambiguous: Boolean(opts.ambiguous),
    ...(opts.searchOnly ? { searchOnly: true } : {}),
    ...(opts.exactOnly ? { exactOnly: true } : {}),
    ...(opts.notes ? { notes: opts.notes } : {}),
  }
}

/** Ge'ez liturgical forms and Tigrinya forms — labelled with their real language. */
const GEEZ_FORMS = new Set([
  'ወላዲተ አምላክ', 'ወላዲተ ቃል', 'ሰአሊ ለነ', 'ሰዓሊ ለነ', 'ሰላም ለኪ', 'ንዒ', 'ርግብየ', 'ኪዳንኪ', 'ወልድኪ', 'ወልዳ', 'ወልደ እግዚአብሔር',
  'ወልደ አብ', 'ወልድ ዋሕድ', 'ቤዛ ኩሉ ዓለም', 'ተንሥአ', 'ክርስቶስ ተንሥአ', 'ትንሣኤከ', 'ትንሣኤሁ', 'ዮም ተወልደ', 'ተወልደ', 'ተጠምቀ',
  'ዐርገ', 'መሐረነ', 'መሐረኒ', 'ንሴብሖ', 'ስብሐት ለእግዚአብሔር', 'ይትባረክ', 'ግነዩ', 'እመስቀሉ', 'በመስቀልከ', 'አብ ወወልድ ወመንፈስ ቅዱስ',
  'ሥሉስ ቅዱስ', 'ሠለስቱ', 'ዕርገተ ክርስቶስ', 'ልደተ ክርስቶስ', 'ቃለ አዋዲ', 'ርእሰ ዮሐንስ', 'ቀዳሜ ሰማዕት', 'ሐመልማለ ወርቅ',
  'ኪርያላይሶን', 'አስተርእዮ', 'ጥምቀተ ባሕር', 'በዓለ ኀምሳ', 'መንፈሰ ቅዱስ', 'ንግሥተ ሰማይ', 'ማኅደረ መለኮት',
])
const TIGRINYA_FORMS = new Set(['አደይ ማርያም', 'ጎይታይ', 'ኣምላኽ', 'ሓጥያት'])

// ---------------------------------------------------------------------------
// CATEGORIES
// ---------------------------------------------------------------------------

define('category', 'Jesus Christ', [
  ['exact_name', 5, ['ኢየሱስ', 'እየሱስ', 'ክርስቶስ', 'ኢየሱስ ክርስቶስ', 'መድኃኔ ዓለም', 'መድኃኔዓለም', 'መድሃኔዓለም', 'መድኃኒዓለም', 'አማኑኤል', 'ዐማኑኤል']],
  ['honorific', 5, ['ወልደ እግዚአብሔር', 'ወልደ ማርያም', 'ወልድ ዋሕድ', 'የእግዚአብሔር በግ', 'ቤዛ ዓለም', 'ቤዛ ኩሉ ዓለም', 'መሲሕ', 'መሲህ']],
  ['honorific', 4, ['ወልደ አብ', 'ናዝራዊ', 'የናዝሬቱ', 'ኢየሱስ ናዝራዊ', 'ክርስቶስ ንጉሥ', 'ንጉሠ ስብሐት']],
  ['spelling_variation', 4, ['የሱስ'], { exactOnly: true, notes: 'Short form; whole word only' }],
  ['contextual_phrase', 2, ['ሥጋ ለበሰ', 'ሥጋን ለበሰ', 'ደሙን አፈሰሰ', 'ስለ እኛ ሞተ', 'ሞተልኝ', 'ሞተልን', 'ተሰቀለልኝ', 'በጡጫ', 'ምራቅ ተተፋ']],
  ['contextual_phrase', 2, ['ልጅሽ', 'ወልድኪ', 'ወልዳ'], { ambiguous: true, notes: "Mary's Son; only with Christ/Mary context" }],
  ['contextual_phrase', 1, ['ጌታችን', 'ጌታዬ', 'ጎይታይ'], { ambiguous: true, notes: 'Lord — may refer to God generally' }],
  ['exact_name', 5, ['jesus', 'jesus christ', 'christ', 'emmanuel', 'immanuel', 'lamb of god', 'son of god', 'messiah', 'son of mary']],
  ['transliteration', 5, ['iyesus', 'iyyesus', 'yesus', 'kristos', 'krestos', 'amanuel', 'amanuel', 'medhane alem', 'medhanealem', 'medhanialem', 'medhanie alem', 'medhanit alem', 'yesuus']],
  ['contextual_phrase', 3, ['our saviour', 'our savior', 'the saviour', 'the savior', 'redeemer', 'the lord jesus']],
], [
  { pattern: '(?:ከ|አም)ድንግል\\S{0,2}\\s*(?:ማርያም\\S{0,2}\\s*)?(?:ተወለደ|ተወልደ|ተወለድክ)', label: 'ከድንግል ማርያም ተወለደ (born of the Virgin)', strength: 5, notes: 'Incarnation statement about Christ' },
])

define('category', 'Virgin Mary', [
  ['exact_name', 5, ['ማርያም', 'ማሪያም', 'ድንግል ማርያም', 'ቅድስት ድንግል ማርያም', 'ማርያም ድንግል']],
  ['honorific', 5, ['እመቤታችን', 'እመቤቴ', 'እመ ብርሃን', 'እመብርሃን', 'እመ አምላክ', 'እመአምላክ', 'የአምላክ እናት', 'ወላዲተ አምላክ', 'ወላዲተ ቃል', 'ንግሥተ ሰማይ', 'ማኅደረ መለኮት', 'እመ ብዙኃን']],
  ['honorific', 4, ['ወላዲት', 'ኪዳነ ምሕረት', 'ኪዳነምሕረት', 'ሰአሊ ለነ', 'ሰዓሊ ለነ', 'ቅድስተ ቅዱሳን', 'ታቦተ ጽዮን', 'አደይ ማርያም', 'ኪዳንኪ', 'ኪዳንሽ']],
  ['honorific', 3, ['ድንግል', 'አዛኝቱ', 'አዛኚት', 'ሰላም ለኪ', 'እመቤት'], { notes: 'Usually Mary in Orthodox hymnody' }],
  ['contextual_phrase', 2, ['ጽዮን', 'ንዒ', 'ርግብየ', 'እናታችን', 'እናቴ'], { ambiguous: true, notes: 'Marian imagery / address; needs Marian context' }],
  ['contextual_phrase', 3, ['መሰደድሽ', 'ስደትሽ', 'የጌታችን እናት', 'የጌታ እናት'], { notes: "Mary's exile to Egypt / Mother of the Lord" }],
  ['exact_name', 5, ['mary', 'saint mary', 'st mary', 'st. mary', 'virgin mary', 'the virgin', 'mother of god', 'theotokos', 'our lady', 'holy mother', 'mother of the lord', 'kidane mihret']],
  ['honorific', 4, ['god bearer', 'god-bearer', 'bearer of god', 'mother of light']],
  ['contextual_phrase', 3, ['garden enclosed', 'fountain sealed', 'full of grace'], { notes: 'Marian imagery (Song of Songs / Annunciation)' }],
  ['transliteration', 5, ['mariam', 'maryam', 'mariyam', 'dingil', 'dingel', 'dengel', 'emebetachin', 'emebetachen', 'emebete', 'emebet', 'eme amlak', 'emebirhan', 'kidane mehret', 'kidanemihret', 'maariyaam']],
])

define('category', 'Holy Trinity', [
  ['exact_name', 5, ['ሥላሴ', 'ቅድስት ሥላሴ', 'ሥሉስ ቅዱስ', 'አብ ወወልድ ወመንፈስ ቅዱስ', 'አብ ወልድ መንፈስ ቅዱስ', 'አብ ወልድና መንፈስ ቅዱስ']],
  ['contextual_phrase', 4, ['ሦስትነት', 'ሦስትነቱ', 'ሦስትነታቸው', 'አንድነትና ሦስትነት', 'ሦስት አካል', 'ሠለስቱ', 'ሦስቱ አካላት']],
  ['exact_name', 5, ['trinity', 'holy trinity', 'father son and holy spirit', 'father, son and holy spirit']],
  ['transliteration', 5, ['selassie', 'selase', 'silassie', 'kidist selassie', 'qidist selassie']],
], [
  { pattern: '(?:የ|ለ|በ|ከ|ወ)?አብ\\s*(?:ና|ም)?[\\s,]+(?:የ|ለ|በ|ከ|ወ)?ወልድ\\S{0,2}[\\s,]+(?:የ|ለ|በ|ከ|ወ)?መንፈስ\\s*ቅዱስ', label: 'አብ … ወልድ … መንፈስ ቅዱስ (Trinitarian formula)', strength: 5 },
])

define('category', 'Holy Spirit', [
  ['exact_name', 4, ['መንፈስ ቅዱስ', 'መንፈስቅዱስ', 'ቅዱስ መንፈስ', 'መንፈሰ ቅዱስ']],
  ['exact_name', 5, ['ጰራቅሊጦስ', 'አጽናኙ መንፈስ', 'መንፈስ ጰራቅሊጦስ']],
  ['contextual_phrase', 2, ['መንፈስህ', 'ቅዱስ መንፈስህ'], { ambiguous: true }],
  ['exact_name', 5, ['holy spirit', 'holy ghost', 'paraclete', 'spirit of god']],
  ['transliteration', 5, ['menfes kidus', 'menfes qidus', 'menfes qeddus', 'paraklitos']],
  ['contextual_phrase', 2, ['comforter'], { ambiguous: true }],
])

define('category', 'Kidus Michael', [
  ['exact_name', 5, ['ሚካኤል', 'ሚካኢል', 'ቅዱስ ሚካኤል', 'ሊቀ መላእክት ሚካኤል', 'መልአኩ ሚካኤል', 'መልአከ ኃይል ሚካኤል']],
  ['exact_name', 5, ['michael', 'mikael', 'mikail', 'saint michael', 'st michael', 'st. michael', 'archangel michael', 'archangel mikael']],
  ['transliteration', 5, ['kidus michael', 'kidus mikael', 'qidus mikael', 'qeddus mikael', 'kiddus mikael', 'kudus mikael']],
])

define('category', 'Kidus Gabriel', [
  ['exact_name', 5, ['ገብርኤል', 'ቅዱስ ገብርኤል', 'መልአኩ ገብርኤል', 'ሊቀ መላእክት ገብርኤል']],
  ['contextual_phrase', 2, ['ብሥራት', 'አበሠራት'], { ambiguous: true, notes: 'Annunciation — Gabriel context' }],
  ['honorific', 4, ['መልአከ ብሥራት', 'ገብርኤል ዜናዊ'], { notes: 'Title: angel of the Annunciation' }],
  ['exact_name', 4, ['ብሥራተ ገብርኤል', 'bisrate gabriel', 'bisrate gebriel', 'annunciation', 'angel of the annunciation'], { searchOnly: true, notes: 'Feast of the Annunciation (browse shortcut); search term only' }],
  ['exact_name', 5, ['gabriel', 'saint gabriel', 'st gabriel', 'st. gabriel', 'archangel gabriel']],
  ['transliteration', 5, ['gebriel', 'gebrael', 'kidus gabriel', 'kidus gebriel', 'qidus gebriel', 'qeddus gebriel']],
])

define('category', 'Kidus Raphael', [
  ['exact_name', 5, ['ሩፋኤል', 'ሩፋዔል', 'ቅዱስ ሩፋኤል']],
  ['honorific', 4, ['ፈታሔ ማኅፀን'], { notes: 'Title: opener of the womb (invoked for childbirth)' }],
  ['exact_name', 5, ['raphael', 'saint raphael', 'st raphael', 'archangel raphael']],
  ['transliteration', 5, ['rufael', 'rafael', 'kidus rufael', 'kidus raphael']],
])

define('category', 'Kidus Uriel', [
  ['exact_name', 5, ['ኡራኤል', 'ዑራኤል', 'ቅዱስ ዑራኤል', 'ቅዱስ ኡራኤል']],
  ['exact_name', 5, ['uriel', 'saint uriel', 'st uriel', 'archangel uriel']],
  ['transliteration', 5, ['urael', 'kidus uriel', 'kidus urael', 'qidus urael']],
])

define('category', 'Kidus Giorgis', [
  ['exact_name', 5, ['ጊዮርጊስ', 'ቅዱስ ጊዮርጊስ', 'ጊዮርጊስ ሰማዕት']],
  ['contextual_phrase', 2, ['ልዳ'], { ambiguous: true, exactOnly: true, notes: 'Lydda, home of St George' }],
  ['honorific', 4, ['ሊቀ ሰማዕታት', 'ሊቀ ሰማዕታት ጊዮርጊስ'], { notes: 'Title: chief of martyrs' }],
  ['exact_name', 5, ['george', 'saint george', 'st george', 'st. george', 'great martyr george']],
  ['honorific', 4, ['chief of martyrs']],
  ['transliteration', 5, ['giorgis', 'giyorgis', 'georgis', 'kidus giorgis', 'qidus giyorgis', 'kidus giyorgis']],
])

define('category', 'Abune Tekle Haymanot', [
  ['exact_name', 5, ['ተክለ ሃይማኖት', 'ተክለሃይማኖት', 'አቡነ ተክለ ሃይማኖት']],
  ['contextual_phrase', 3, ['ደብረ ሊባኖስ', 'ጸጋ ዘአብ', 'እግዚእ ኃረያ']],
  ['transliteration', 5, ['tekle haymanot', 'teklehaymanot', 'takla haymanot', 'abune tekle haymanot', 'abune teklehaymanot']],
  ['contextual_phrase', 3, ['debre libanos']],
])

define('category', 'Abune Gebre Menfes Kidus', [
  ['exact_name', 5, ['ገብረ መንፈስ ቅዱስ', 'ገብረመንፈስ ቅዱስ', 'ገብረ መንፈስቅዱስ', 'ገብረመንፈስቅዱስ', 'አቡነ ገብረ መንፈስ ቅዱስ']],
  ['honorific', 3, ['አቦዬ', 'ዝቋላ'], { notes: 'Popular title / monastery' }],
  ['honorific', 2, ['አቦ'], { ambiguous: true, exactOnly: true }],
  ['transliteration', 5, ['gebre menfes kidus', 'gabra manfas qeddus', 'abune gebre menfes kidus', 'gebremenfes kidus']],
  ['contextual_phrase', 3, ['zuqualla', 'zuquala']],
])

define('category', 'Kidus Yared', [
  ['exact_name', 5, ['ያሬድ', 'ቅዱስ ያሬድ', 'ማኅሌታይ ያሬድ', 'ቅዱስ ያሬድ ማኅሌታይ']],
  ['honorific', 2, ['ማኅሌታይ'], { ambiguous: true, notes: 'Title: the hymnographer — usually Yared' }],
  ['exact_name', 5, ['saint yared', 'st yared', 'st. yared', 'yared']],
  ['transliteration', 5, ['kidus yared', 'qidus yared', 'qeddus yared']],
])

define('category', 'Yohannes Metmek / John the Baptist', [
  ['exact_name', 5, ['ዮሐንስ መጥምቅ', 'መጥምቁ ዮሐንስ', 'ዮሐንስ መጥምቀ መለኮት', 'መጥምቀ መለኮት']],
  ['honorific', 4, ['መጥምቅ', 'መጥምቁ', 'ርእሰ ዮሐንስ', 'ቃለ አዋዲ']],
  ['contextual_phrase', 4, ['ሄሮድያዳ', 'ሄሮድያዳ']],
  ['exact_name', 2, ['ዮሐንስ'], { ambiguous: true, notes: 'May be John the Evangelist; needs Baptist context' }],
  ['exact_name', 5, ['john the baptist', 'saint john the baptist', 'st john the baptist', 'john the forerunner', 'the forerunner']],
  ['transliteration', 5, ['yohannes metmek', 'yohannes metmiq', 'yohannis metmik', 'qidus yohannes metmik']],
  ['contextual_phrase', 4, ['herodias']],
])

define('category', 'Kidus Estifanos / Saint Stephen', [
  ['exact_name', 5, ['እስጢፋኖስ', 'ቅዱስ እስጢፋኖስ']],
  ['contextual_phrase', 3, ['ሊቀ ዲያቆናት', 'ቀዳሜ ሰማዕት']],
  ['exact_name', 5, ['stephen', 'saint stephen', 'st stephen', 'st. stephen', 'protomartyr', 'first martyr', 'archdeacon stephen']],
  ['transliteration', 5, ['estifanos', 'istifanos', 'kidus estifanos', 'qidus estifanos']],
])

define('category', 'Apostles', [
  ['exact_name', 4, ['ሐዋርያት', 'ሐዋርያቱ', 'አርድእት', 'አርድእቱ']],
  ['exact_name', 3, ['ሐዋርያ', 'ጴጥሮስ', 'ጳውሎስ', 'እንድርያስ', 'በርተሎሜዎስ', 'ታዴዎስ']],
  ['exact_name', 2, ['ቶማስ', 'ማቴዎስ', 'ፊልጶስ'], { ambiguous: true }],
  ['exact_name', 4, ['apostle', 'apostles', 'disciples', 'saint peter', 'saint paul']],
  ['transliteration', 4, ['hawariat', 'hawaryat', 'petros', 'paulos']],
  ['contextual_phrase', 3, ['ሳዖል', 'ደማስቆ'], { notes: "Paul's conversion" }],
])

define('category', 'Martyrs', [
  ['exact_name', 4, ['ሰማዕታት', 'ሰማዕት', 'ሰማዕቱ', 'ሰማዕትነት']],
  ['exact_name', 4, ['ቂርቆስ', 'ቅዱስ ቂርቆስ', 'ኢየሉጣ', 'አርሴማ', 'ቅድስት አርሴማ', 'ቴክላ']],
  ['exact_name', 4, ['martyr', 'martyrs', 'martyrdom']],
  ['transliteration', 4, ['kirkos', 'qirqos', 'qirkos', 'iyeluta', 'arsema', 'kidist arsema']],
])

define('category', 'Saints', [
  ['exact_name', 3, ['ቅዱሳን', 'ጻድቃን', 'ቅዱሳኑ', 'ጻድቃኑ', 'ሊቃውንት']],
  ['honorific', 2, ['አቡነ'], { ambiguous: true, exactOnly: true, notes: 'Also opens the Lord\'s Prayer (አቡነ ዘበሰማያት)' }],
  ['honorific', 3, ['አቡነ አረጋዊ', 'አረጋዊ', 'ኪሮስ', 'አባ ኪሮስ', 'መርቆሬዎስ', 'ሳሙኤል ዘዋልድባ', 'ክርስቶስ ሠምራ', 'ዘርዓ ቡሩክ', 'አባ ሳሙኤል', 'ገብረ ክርስቶስ', 'ፊልጶስ ዘደብረ ሊባኖስ']],
  ['contextual_phrase', 2, ['ገድል', 'ገድሉ', 'ገድላቸው', 'በረከታቸው']],
  ['contextual_phrase', 1, ['ጻድቅ'], { ambiguous: true, notes: 'Also means "righteous" generally' }],
  ['exact_name', 3, ['saints', 'the saints', 'holy fathers']],
  ['transliteration', 3, ['kidusan', 'tsadkan', 'aregawi', 'merkorios', 'abune aregawi']],
])

define('category', 'Angels', [
  ['exact_name', 4, ['መላእክት', 'መላእክቱ', 'ሠራዊተ መላእክት', 'ሱርያል', 'ፋኑኤል', 'ራጉኤል', 'ሰዳካኤል', 'ሰላታኤል', 'አናንኤል']],
  ['exact_name', 3, ['መልአክ', 'መልአኩ', 'ሊቀ መላእክት', 'ኪሩቤል', 'ሱራፌል', 'ትጉሃን']],
  ['exact_name', 4, ['angel', 'angels', 'archangel', 'archangels', 'cherubim', 'seraphim', 'heavenly host']],
  ['transliteration', 4, ['melaekt', 'melaikt', 'suryal', 'fanuel', 'raguel', 'sedakiel']],
])

define('category', 'Prophets', [
  ['exact_name', 4, ['ነቢያት', 'ኤልያስ', 'ሄኖክ', 'ኢሳይያስ', 'ኤርምያስ', 'ሕዝቅኤል', 'ኤልሳዕ']],
  ['exact_name', 3, ['ነቢይ', 'ነቢዩ', 'ዳንኤል', 'ዮናስ', 'ሆሴዕ', 'ሚክያስ']],
  ['exact_name', 2, ['ሙሴ', 'ዳዊት', 'ሳሙኤል'], { ambiguous: true, notes: 'Frequent biblical references; not necessarily the subject' }],
  ['exact_name', 4, ['prophet', 'prophets', 'elijah', 'enoch', 'isaiah', 'jeremiah', 'ezekiel']],
  ['transliteration', 4, ['nebiyat', 'eliyas', 'henok', 'isayas']],
])

define('category', 'Cross', [
  ['exact_name', 4, ['መስቀል', 'ዕፀ መስቀል', 'ቅዱስ መስቀል', 'መስቀለ ክርስቶስ', 'እመስቀሉ', 'በመስቀልከ']],
  ['exact_name', 4, ['cross', 'holy cross', 'the cross', 'true cross']],
  ['transliteration', 4, ['meskel', 'mesqel', 'meskal'], { notes: 'Also the feast name' }],
])

define('category', 'Repentance', [
  ['exact_name', 5, ['ንስሐ', 'ንስሓ', 'ተጸጸትኩ', 'ኪርያላይሶን', 'የጠፋው ልጅ', 'ጠፍቶ የነበረው']],
  ['contextual_phrase', 4, ['ይቅር በለኝ', 'ይቅር በለን', 'አቤቱ ማረን', 'አቤቱ ማረኝ', 'ልመለስ', 'ተመለስኩ', 'ጠፋሁ']],
  ['contextual_phrase', 3, ['ይቅርታ', 'ማረኝ', 'ማረን', 'መሐረነ', 'መሐረኒ', 'ኃጢአቴ', 'ኃጢአቴን', 'ሀጥያቴ', 'በደሌ', 'በደሌን', 'በደላችን', 'ኃጢአተኛ', 'ኃጢአተኛው']],
  ['contextual_phrase', 2, ['ኃጢአት', 'ኃጢአታችን', 'ኃጢያት', 'ሀጥያት', 'ሓጥያት', 'በደል', 'ተመለስ', 'እንባዬ']],
  ['exact_name', 5, ['repent', 'repentance', 'prodigal', 'forgive me', 'forgive us']],
  ['contextual_phrase', 3, ['have mercy', 'lord have mercy', 'kyrie eleison', 'sinner', 'my sins', 'our sins']],
  ['contextual_phrase', 2, ['sin', 'sins'], { ambiguous: true }],
  ['transliteration', 5, ['nisha', 'nisiha', 'yikir belen', 'yiqir belen']],
])

define('category', 'Praise / Worship', [
  ['exact_name', 4, ['ስብሐት ለእግዚአብሔር', 'ንሴብሖ', 'ቅዱስ ቅዱስ ቅዱስ', 'ሃሌ ሉያ', 'ሃሌሉያ']],
  ['contextual_phrase', 3, ['ምስጋና', 'ምስጋናዬ', 'እናመስግን', 'አመስግኑ', 'ይመስገን', 'ተመስገን', 'አመሰግናለሁ', 'አመሰግንሃለሁ', 'ስብሐት', 'ስቡሕ', 'ይትባረክ', 'ይባረክ', 'ግነዩ', 'እንዘምር', 'እንዘምራለን', 'ዘምሩ', 'እዘምራለሁ', 'ውዳሴ', 'እናመልክ', 'ናመልክ']],
  ['contextual_phrase', 2, ['እልል', 'እልልታ', 'እንሰግድ', 'ስገዱ', 'ክብር ይሁን', 'ክብር ለአንተ', 'ዝማሬ']],
  ['exact_name', 4, ['praise', 'praises', 'worship', 'hallelujah', 'alleluia', 'glory to god', 'thanksgiving', 'give thanks']],
  ['contextual_phrase', 2, ['glory', 'sing', 'we sing'], { ambiguous: true }],
  ['transliteration', 4, ['misgana', 'mesgana', 'halleluya', 'nisebiho', 'sibhat']],
])

define('category', 'Prayer', [
  ['exact_name', 4, ['ጸሎት', 'ጸሎቴ', 'ጸሎታችን', 'ጸሎቴን', 'ጸሎታችንን', 'አቤቱ ስማኝ', 'ጸሎቴን ስማ']],
  ['contextual_phrase', 3, ['ተማጸንኩ', 'እማጸናለሁ', 'እማጸንሻለሁ', 'አማልጂኝ', 'አማልጅን', 'አማልጂን', 'ለምኚልን', 'ለምኝልን', 'ጸልዩ', 'ጸልዪ', 'ጸልይልን', 'ጸልዪልን', 'ልመናዬ', 'ልመናችን', 'እለምንሻለሁ', 'እለምንሃለሁ']],
  ['contextual_phrase', 2, ['ስማኝ', 'ስማን', 'ድረስልኝ', 'ድረሺልኝ', 'ድረስልን', 'አትተወኝ', 'አትጣለኝ', 'እርዳኝ', 'እርዳን', 'ጠብቀኝ', 'ጠብቀን']],
  ['exact_name', 4, ['pray', 'prayer', 'prayers', 'intercede', 'intercession', 'hear our prayer', 'hear my prayer']],
  ['contextual_phrase', 2, ['hear me', 'help me', 'help us'], { ambiguous: true }],
  ['transliteration', 4, ['tselot', 'tsilot', 'selot']],
])

define('category', 'Salvation', [
  ['exact_name', 5, ['ድኅነት', 'ድኅነትን']],
  ['contextual_phrase', 4, ['አዳነኝ', 'አዳነን', 'አዳንከኝ', 'አዳንከን', 'ያዳነን', 'ያዳነኝ', 'ነጻ አወጣኝ', 'ነጻ አወጣን', 'ነጻ አደረግከኝ', 'ከሲኦል', 'ሞትን ድል']],
  ['contextual_phrase', 3, ['ደኅንነት', 'መዳን', 'ቤዛ', 'ቤዛችን', 'አርነት', 'ዕዳችንን', 'አዳምን', 'ታረቀ', 'ዋጀን', 'ዋጀኝ']],
  ['contextual_phrase', 2, ['ከሞት', 'የአዳም', 'ዲያብሎስን']],
  ['contextual_phrase', 3, ['ከገሀነም', 'ከገሃነም', 'ከሲዖል']],
  ['exact_name', 5, ['salvation', 'redemption', 'redeemed']],
  ['contextual_phrase', 3, ['saved us', 'saved me', 'set us free', 'ransom']],
  ['transliteration', 5, ['dihnet', 'dhnet']],
])

define('category', 'General', [
  ['exact_name', 5, ['general worship'], { searchOnly: true }],
  ['contextual_phrase', 1, ['እግዚአብሔር', 'አምላክ', 'አምላኬ', 'አምላካችን', 'ፈጣሪ', 'ኤልሻዳይ', 'አዶናይ', 'ጌታ', 'ኣምላኽ'], { notes: 'Generic references to God — used only to mark a hymn as God-centred' }],
  ['contextual_phrase', 1, ['god', 'lord', 'almighty', 'creator']],
])

// ---------------------------------------------------------------------------
// OCCASIONS
// ---------------------------------------------------------------------------

define('occasion', 'Gena', [
  ['exact_name', 5, ['በዓለ ገና', 'ልደተ ክርስቶስ', 'ክርስቶስ ተወለደ', 'ዮም ተወልደ', 'ሰብአ ሰገል', 'ሰብዓ ሰገል', 'ግርግም']],
  ['contextual_phrase', 4, ['ቤተልሔም', 'ቤተ ልሔም', 'በበረት', 'በጎል', 'ልደቱ', 'ተወልደ']],
  ['contextual_phrase', 3, ['እረኞች', 'ሰሎሜ']],
  ['contextual_phrase', 2, ['ተወለደ', 'ሲወለድ', 'ዮሴፍ'], { ambiguous: true, notes: 'Birth reference; needs Christ context' }],
  ['exact_name', 1, ['ገና'], { searchOnly: true, exactOnly: true, notes: 'Also means "yet / still"' }],
  ['exact_name', 5, ['christmas', 'nativity', 'manger', 'wise men', 'magi', 'nativity of christ']],
  ['contextual_phrase', 4, ['bethlehem', 'shepherds']],
  ['transliteration', 5, ['gena', 'genna', 'lidet', 'ledet']],
])

define('occasion', 'Timket', [
  ['exact_name', 5, ['ተጠመቀ', 'ተጠምቀ', 'ኤጲፋንያ', 'በዓለ ጥምቀት', 'ጥምቀተ ባሕር', 'አስተርእዮ']],
  ['contextual_phrase', 4, ['ዮርዳኖስ'], { notes: 'Place name; also used as a metaphor' }],
  ['contextual_phrase', 4, ['አጠመቀው', 'አጠመቀ']],
  ['exact_name', 3, ['ጥምቀት'], { ambiguous: true, notes: 'Feast of Timket or sacramental baptism; disambiguated by context' }],
  ['exact_name', 5, ['epiphany', 'theophany', 'jordan', 'baptism of christ']],
  ['contextual_phrase', 3, ['was baptized', 'was baptised'], { ambiguous: true }],
  ['transliteration', 5, ['timket', 'timkat', 'temket']],
])

define('occasion', 'Meskel', [
  ['exact_name', 5, ['እሌኒ', 'ዕሌኒ', 'ንግሥት እሌኒ', 'ደመራ', 'መስቀሉ ተገኘ', 'በዓለ መስቀል', 'ተገኘ መስቀሉ']],
  ['contextual_phrase', 3, ['ቁፋሮ', 'ቆፈረች', 'ተቀብሮ']],
  ['contextual_phrase', 2, ['አደይ አበባ'], { ambiguous: true, notes: 'Also New Year imagery' }],
  ['exact_name', 1, ['መስቀል'], { searchOnly: true, notes: 'A mention of the Cross alone does not make a Meskel hymn' }],
  ['exact_name', 5, ['demera', 'helena', 'finding of the true cross', 'feast of the cross', 'meskel feast']],
  ['transliteration', 5, ['meskel', 'mesqel'], { searchOnly: true }],
])

define('occasion', 'Hosanna', [
  ['exact_name', 5, ['ሆሳዕና', 'ሆሳእና', 'ሆሳዕና በአርያም', 'ዘንባባ', 'ውርንጫ']],
  ['contextual_phrase', 3, ['ቢታንያ', 'የወይራ ዝንጣፊ', 'ልብሳቸውን አነጠፉ']],
  ['exact_name', 5, ['hosanna', 'palm sunday']],
  ['contextual_phrase', 3, ['palms', 'colt']],
  ['transliteration', 5, ['hosaena', 'hosaina']],
])

define('occasion', 'Siklet', [
  ['exact_name', 5, ['ስቅለት', 'ስቅለቱ', 'የእሾህ አክሊል', 'የሾህ አክሊል', 'የሾክ አክሊል', 'የእሾክ አክሊል', 'ሆምጣጤ', 'ስቀለው']],
  ['contextual_phrase', 4, ['ተቸነከረ', 'ቸነከሩት']],
  ['contextual_phrase', 3, ['ተሰቀለ', 'ተሰቅሎ', 'ተሰቅለህ', 'ሰቀሉት', 'ሰቀሉህ', 'ጎልጎታ', 'ቀራንዮ', 'ተገረፈ', 'ጲላጦስ']],
  ['exact_name', 5, ['good friday', 'crucifixion', 'crucified', 'crown of thorns']],
  ['contextual_phrase', 3, ['golgotha', 'calvary']],
  ['transliteration', 5, ['siklet', 'seklet']],
])

define('occasion', 'Tinsae', [
  ['exact_name', 5, ['ፋሲካ', 'ተንሥአ', 'ክርስቶስ ተንሥአ', 'ከሙታን ተነሣ', 'ተነሥቷል', 'ተነስቷል']],
  ['contextual_phrase', 4, ['ትንሣኤው', 'ትንሣኤህ', 'ትንሣኤከ', 'ትንሣኤሁ'], { notes: 'His / your resurrection — Christ; one passing mention is not an Easter hymn' }],
  ['contextual_phrase', 4, ['መቃብሩ ባዶ', 'ድንጋዩ ተንከባለለ', 'ድንጋዩ ተፈነቃቅሏል']],
  ['exact_name', 2, ['ትንሣኤ', 'ትንሳኤ'], { ambiguous: true, notes: 'Also the general resurrection of the dead' }],
  ['contextual_phrase', 2, ['ተነሣ', 'ተነሳ'], { ambiguous: true, notes: 'Rose — needs Christ context' }],
  ['exact_name', 5, ['easter', 'pascha', 'he is risen', 'is risen', 'christ is risen', 'rose from the dead', 'empty tomb']],
  ['contextual_phrase', 3, ['resurrection', 'risen'], { ambiguous: true }],
  ['transliteration', 5, ['tinsae', 'tensae', 'fasika']],
])

define('occasion', 'Erget', [
  ['exact_name', 5, ['ዕርገቱ', 'ዕርገት', 'ዕርገተ ክርስቶስ']],
  ['contextual_phrase', 2, ['ዐረገ', 'ዐርገ'], { ambiguous: true, notes: 'Colloquial አረገ also means "did / made"; needs "to heaven" context' }],
  ['exact_name', 5, ['ascension', 'ascended into heaven']],
  ['contextual_phrase', 3, ['ascended'], { ambiguous: true }],
  ['transliteration', 5, ['erget', 'irget']],
], [
  { pattern: '(?<![\\u1200-\\u137F])(?:አ)(?:ረገ|ርገ|ርጋል)\\s+(?:ወደ\\s*ሰማ|ወደ\\s*ላይ|በክብር|ውስተ\\s*ሰማ)', label: 'ዐረገ ወደ ሰማይ (Christ ascended to heaven)', strength: 5, notes: 'Masculine form only; ዐረገች (she ascended) is Filseta' },
])

define('occasion', 'Pentecost', [
  ['exact_name', 5, ['ጰንጠቆስጤ', 'በዓለ ሃምሳ', 'በዓለ ኀምሳ']],
  ['contextual_phrase', 4, ['ጰራቅሊጦስ', 'እንደ እሳት ልሳን']],
  ['contextual_phrase', 3, ['በልሳን', 'በልሳናት']],
  ['exact_name', 5, ['pentecost', 'tongues of fire']],
  ['contextual_phrase', 3, ['upper room']],
  ['transliteration', 5, ['pentecoste', 'paraklitos']],
])

define('occasion', 'Debre Tabor', [
  ['exact_name', 5, ['ደብረ ታቦር', 'ቡሄ']],
  ['contextual_phrase', 4, ['ታቦር'], { notes: 'Place name' }],
  ['exact_name', 5, ['debre tabor', 'transfiguration', 'mount tabor', 'buhe']],
], [
  { pattern: 'ሙሴ\\S{0,3}[^\\n]{0,40}ኤልያስ|ኤልያስ\\S{0,3}[^\\n]{0,40}ሙሴ', label: 'ሙሴ … ኤልያስ (Moses and Elijah)', strength: 4 },
])

define('occasion', 'Filseta', [
  ['exact_name', 5, ['ፍልሰታ', 'ጾመ ፍልሰታ', 'ትንሣኤሽ', 'ዕርገትሽ']],
  ['contextual_phrase', 4, ['ፍልሰት']],
  ['contextual_phrase', 3, ['ነሐሴ']],
  ['exact_name', 5, ['assumption', 'dormition', 'filseta', 'felseta']],
], [
  { pattern: '(?:ማርያም|ድንግል|አመቤ)[^\\n]{0,40}(?:አረገች|አርገት)', label: 'ድንግል … ዐረገች (the Virgin ascended)', strength: 4 },
])

define('occasion', 'Kidane Mihret', [
  ['exact_name', 5, ['ኪዳነ ምሕረት', 'ኪዳነምሕረት']],
  ['contextual_phrase', 3, ['የካቲት ፲፮', 'የካቲት 16']],
  ['exact_name', 5, ['kidane mihret', 'kidane mehret', 'kidanemihret', 'covenant of mercy']],
])

define('occasion', 'Lideta Maryam', [
  ['exact_name', 5, ['ልደታ', 'ልደታ ለማርያም', 'ልደታ ማርያም', 'ኢያቄምና ሐና', 'ኢያቄምና ሐና']],
  ['contextual_phrase', 3, ['ኢያቄም'], { notes: "Mary's father; one mention is a title, not the feast" }],
  ['contextual_phrase', 4, ['ልደትሽ', 'ተወለደች']],
  ['contextual_phrase', 2, ['ሐና'], { ambiguous: true, exactOnly: true }],
  ['exact_name', 5, ['lideta', 'lideta maryam', 'nativity of mary', 'birth of mary', 'joachim']],
])

define('occasion', 'Abiy Tsom', [
  ['exact_name', 5, ['ዐቢይ ጾም', 'አቢይ ጾም', 'ሁዳዴ', 'ጾመ ኢየሱስ', 'ገዳመ ቆሮንቶስ']],
  ['contextual_phrase', 4, ['አርባ ቀንና አርባ ሌሊት', 'አርባ ቀን ጾመ']],
  ['contextual_phrase', 2, ['አርባ ቀን', 'ጾም'], { ambiguous: true }],
  ['exact_name', 5, ['great lent', 'lent', 'forty days and forty nights']],
  ['transliteration', 5, ['abiy tsom', 'hudade', 'hudadi']],
])

define('occasion', 'Tsome Nineveh', [
  ['exact_name', 5, ['ነነዌ', 'ጾመ ነነዌ']],
  ['contextual_phrase', 3, ['ዮናስ', 'ዓሣ አንበሪ']],
  ['exact_name', 5, ['nineveh', 'fast of nineveh']],
  ['contextual_phrase', 3, ['jonah']],
  ['transliteration', 5, ['tsome nineveh', 'neneweh']],
])

define('occasion', 'Tsome Nebiyat', [
  ['exact_name', 5, ['ጾመ ነቢያት', 'ጾመ ገና']],
  ['exact_name', 5, ['fast of the prophets', 'advent', 'nativity fast']],
  ['transliteration', 5, ['tsome nebiyat', 'tsome gena']],
])

define('occasion', 'Tsome Hawariat', [
  ['exact_name', 5, ['ጾመ ሐዋርያት', 'ጾመ ሰኔ']],
  ['exact_name', 5, ['fast of the apostles', 'apostles fast']],
  ['transliteration', 5, ['tsome hawariat', 'tsome hawaryat', 'tsome sene']],
])

define('occasion', 'Holy Week', [
  ['exact_name', 5, ['ሰሙነ ሕማማት', 'ሕማማት', 'ጸሎተ ሐሙስ', 'ቀዳም ሥዑር', 'እግራቸውን አጠበ']],
  ['contextual_phrase', 3, ['ሕማሙ', 'ሕማማቱ']],
  ['exact_name', 5, ['holy week', 'passion week', 'maundy thursday', 'holy thursday', 'washing of the feet']],
  ['contextual_phrase', 3, ['passion'], { ambiguous: true }],
  ['transliteration', 5, ['himamat', 'hmamat', 'tselote hamus']],
])

define('occasion', 'New Year / Enkutatash', [
  ['exact_name', 5, ['እንቁጣጣሽ', 'አዲስ ዓመት', 'ዘመን መለወጫ', 'አበባዮሽ', 'ዘመኑን ባርክ', 'ዓመቱን ባርክ', 'ዐውደ ዓመት']],
  ['contextual_phrase', 4, ['ዓመተ ምሕረት', 'ዘመነ ማቴዎስ', 'ዘመነ ማርቆስ', 'ዘመነ ሉቃስ', 'ዘመነ ዮሐንስ', 'ከዘመን ወደ ዘመን']],
  ['contextual_phrase', 2, ['መስከረም', 'አደይ አበባ'], { ambiguous: true }],
  ['exact_name', 5, ['new year', 'enkutatash']],
  ['transliteration', 5, ['inkutatash', 'enqutatash', 'addis amet']],
])

define('occasion', 'Annual Saint Feast', [
  ['exact_name', 5, ['ዓመታዊ በዓል', 'የንግሥ በዓል', 'ዓመታዊ ክብረ በዓል']],
  ['contextual_phrase', 4, ['ዓመታዊ', 'ክብረ በዓል']],
  ['contextual_phrase', 3, ['በዓልህ', 'በዓልሽ', 'በዓሉን', 'በዓላቸው']],
  ['contextual_phrase', 2, ['ንግሥ'], { exactOnly: true, ambiguous: true }],
  ['exact_name', 5, ['annual feast', 'feast day', 'patronal feast', 'saint feast']],
  ['transliteration', 5, ['nigs', 'negs']],
])

define('occasion', 'Wedding', [
  ['exact_name', 5, ['ሰርግ', 'ሠርግ', 'ጋብቻ', 'ተክሊል', 'ተጋቢዎች', 'ሙሽራውና ሙሽራይቱ', 'ሙሽራውና ሙሽሪት']],
  ['contextual_phrase', 4, ['ሙሽሮች', 'ሙሽሮቹ', 'ተጋቡ', 'ቃና ዘገሊላ']],
  ['contextual_phrase', 2, ['ሙሽራ', 'ሙሽራው', 'ሙሽራዋ', 'ሙሽሪት', 'ሙሽራይቱ'], { ambiguous: true, notes: 'Also used of the Church / Mary as bride' }],
  ['exact_name', 5, ['wedding', 'marriage', 'matrimony', 'bride and groom', 'newlyweds', 'wedding at cana']],
  ['contextual_phrase', 2, ['bride', 'bridegroom'], { ambiguous: true }],
  ['transliteration', 5, ['serg', 'tekelil', 'teklil']],
])

define('occasion', 'Baptism', [
  ['exact_name', 5, ['የልጅነት ጥምቀት', 'ክርስትና ተነሣ', 'የክርስትና አባት', 'የክርስትና እናት', 'ሥርዓተ ጥምቀት']],
  ['contextual_phrase', 4, ['ክርስትና ማስነሳት', 'ልጅነትን አገኘ', 'ከውኃና ከመንፈስ ተወለደ']],
  ['contextual_phrase', 2, ['ክርስትና', 'ዳግም ተወለድን'], { ambiguous: true, notes: 'ክርስትና usually means "Christianity"; christening only with a baptism term' }],
  ['exact_name', 5, ['christening', 'godparent', 'godfather', 'godmother', 'baptismal font']],
  ['contextual_phrase', 3, ['born of water and the spirit']],
  ['contextual_phrase', 2, ['baptism', 'baptized', 'baptised'], { ambiguous: true, notes: 'Could be Timket; disambiguated by context' }],
  ['transliteration', 5, ['kiristina', 'kristina']],
])

define('occasion', 'Funeral / Memorial', [
  ['exact_name', 5, ['ፍትሐት', 'ነፍስ ይማር', 'ነፍሱን ይማር', 'ነፍሷን ይማር', 'አፀደ ነፍስ', 'ተዝካር', 'ዕረፍተ ነፍስ']],
  ['contextual_phrase', 4, ['ለነፍሴ እረፍት', 'ለነፍሱ እረፍት', 'አታልቅሱ', 'ቀብር', 'ሬሳ']],
  ['contextual_phrase', 3, ['መታሰቢያ'], { ambiguous: true }],
  ['exact_name', 5, ['funeral', 'memorial', 'rest in peace', 'requiem', 'the departed']],
  ['transliteration', 5, ['fithat', 'tezkar']],
])

define('occasion', 'Communion', [
  ['exact_name', 5, ['ቁርባን', 'ቅዱስ ቁርባን', 'ሥጋውና ደሙ', 'ሥጋ ወደሙ', 'ሥጋ ወደም', 'ሥጋዬን ብሉ', 'ደሜን ጠጡ', 'ሥጋህና ደምህ', 'ምሥጢረ ቁርባን']],
  ['contextual_phrase', 3, ['ቅዳሴ', 'ሥጋህን', 'ደምህን']],
  ['contextual_phrase', 2, ['ማዕዱ'], { ambiguous: true }],
  ['exact_name', 5, ['communion', 'holy communion', 'eucharist', 'body and blood']],
  ['transliteration', 5, ['qurban', 'kurban', 'kidase', 'qidase']],
], [
  { pattern: '(?:የ|በ|ለ)?ስጋ\\S{0,4}\\s+(?:\\S+\\s+)?(?:አና\\s+|ና\\s+)?(?:የ|ወ)?ደም', label: 'ሥጋ … ደም (Body and Blood)', strength: 5, notes: 'Pattern on normalized text (ሥ→ስ, እ→አ); one word may intervene' },
])

define('occasion', 'General / Anytime', [
  ['exact_name', 5, ['anytime', 'general worship', 'በማንኛውም ጊዜ'], { searchOnly: true }],
])

// ---------------------------------------------------------------------------
// Public API
// ---------------------------------------------------------------------------

for (const a of ALIASES) {
  if (GEEZ_FORMS.has(a.alias)) a.language = 'geez'
  else if (TIGRINYA_FORMS.has(a.alias)) a.language = 'tigrinya'
}

export const TAXONOMY_ALIASES: readonly TaxonomyAlias[] = Object.freeze(ALIASES)

export function aliasesFor(kind: TaxonomyKind, canonical: string): TaxonomyAlias[] {
  return ALIASES.filter((a) => a.kind === kind && a.canonical === canonical)
}

export function entryByCanonical(kind: TaxonomyKind, canonical: string): TaxonomyEntry | undefined {
  return (kind === 'category' ? CATEGORY_ENTRIES : OCCASION_ENTRIES).find((e) => e.canonical === canonical)
}
