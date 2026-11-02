/**
 * Deterministic multilingual theological classification engine for Mezmurs.
 *
 * Analyzes authentic original-language lyrics (Amharic, Ge'ez, Tigrinya, Oromo,
 * English transliteration and translation) without remote AI dependency.
 *
 * Identifies core theological subjects (Jesus Christ, Virgin Mary, Holy Trinity,
 * Holy Spirit, Angels, Named Saints / Martyrs / Apostles, Praise, Repentance, Fasting,
 * Sacraments) while filtering out singer name collisions and incidental mentions.
 */

export interface MezmurClassificationInput {
  import_id?: string
  slug?: string
  title?: string
  singer_name?: string | null
  zemari_name?: string | null
  lyrics_amharic?: string | null
  lyrics_geez?: string | null
  lyrics_english?: string | null
  lyrics_oromo?: string | null
  lyrics_transliteration?: string | null
  primary_language?: string | null
  category_slugs?: string[]
  occasion_slugs?: string[]
}

export interface MezmurClassificationResult {
  import_id?: string
  slug?: string
  primaryCategorySlug: string
  additionalCategorySlugs: string[]
  primaryOccasionSlug: string | null
  additionalOccasionSlugs: string[]
  confidence: number
  method: 'deterministic_lyrics' | 'fallback_general'
  signals: string[]
  explanation: string
}

/**
 * Normalizes Ethiopic characters to canonical forms for robust matching
 * across dialect and orthographic variations (ሀ/ሐ/ኀ, ሠ/ሰ, ዐ/አ, ጸ/ፀ).
 * Also replaces traditional Ethiopic punctuation with standard whitespace.
 */
export function normalizeEthiopic(text: string): string {
  if (!text) return ''
  return text
    .replace(/[\u1360-\u1368]/g, ' ')
    .replace(/[ሐኀ]/g, 'ሀ')
    .replace(/[ሑኁ]/g, 'ሁ')
    .replace(/[ሒኂ]/g, 'ሂ')
    .replace(/[ሓኃ]/g, 'ሃ')
    .replace(/[ሔኄ]/g, 'ሄ')
    .replace(/[ሕኅ]/g, 'ህ')
    .replace(/[ሖኆ]/g, 'ሆ')
    .replace(/ሠ/g, 'ሰ')
    .replace(/ሡ/g, 'ሱ')
    .replace(/ሢ/g, 'ሲ')
    .replace(/ሣ/g, 'ሳ')
    .replace(/ሤ/g, 'ሴ')
    .replace(/ሥ/g, 'ስ')
    .replace(/ሦ/g, 'ሶ')
    .replace(/[ዐዓ]/g, 'አ')
    .replace(/ዑ/g, 'ኡ')
    .replace(/ዒ/g, 'ኢ')
    .replace(/ዔ/g, 'ኤ')
    .replace(/ዕ/g, 'እ')
    .replace(/ዖ/g, 'ኦ')
    .replace(/ፀ/g, 'ጸ')
    .replace(/ፁ/g, 'ጹ')
    .replace(/ፂ/g, 'ጺ')
    .replace(/ፃ/g, 'ጻ')
    .replace(/ፄ/g, 'ጼ')
    .replace(/ፅ/g, 'ጽ')
    .replace(/ፆ/g, 'ጾ')
    .replace(/ጐ/g, 'ጎ')
    .replace(/ጒ/g, 'ጊ')
    .replace(/ጓ/g, 'ጋ')
    .replace(/ጔ/g, 'ጌ')
    .replace(/ጕ/g, 'ግ')
}

/**
 * Normalizes Latin / transliterated text.
 */
export function normalizeLatin(text: string): string {
  if (!text) return ''
  return text
    .toLowerCase()
    .replace(/['’`ʼ]/g, '')
    .replace(/ph/g, 'f')
    .replace(/th/g, 't')
    .replace(/[^a-z0-9\s]/g, ' ')
    .replace(/\s+/g, ' ')
    .trim()
}

interface TermPattern {
  pattern: RegExp
  weight: number
  label: string
}

function ethPattern(terms: string[], weight: number, label: string): TermPattern {
  const normTerms = terms
    .map(normalizeEthiopic)
    .map((t) => t.trim().replace(/\s+/g, '\\s+'))
    .filter(Boolean)
  const pattern = new RegExp(`(?:^|[^\\p{L}\\p{N}])(?:${normTerms.join('|')})(?:[^\\p{L}\\p{N}]|$)`, 'u')
  return { pattern, weight, label }
}

function latPattern(terms: string[], weight: number, label: string): TermPattern {
  const normTerms = terms
    .map(normalizeLatin)
    .map((t) => t.trim().replace(/\s+/g, '\\s+'))
    .filter(Boolean)
  const pattern = new RegExp(`\\b(?:${normTerms.join('|')})\\b`, 'i')
  return { pattern, weight, label }
}

interface CategoryDefinition {
  primarySlug: string
  subCategorySlugs?: string[]
  amharicPatterns: TermPattern[]
  latinPatterns: TermPattern[]
  minimumThreshold: number
}

// ---------------------------------------------------------------------------
// Category Definitions
// ---------------------------------------------------------------------------

const JESUS_CHRIST_DEF: CategoryDefinition = {
  primarySlug: 'jesus-christ',
  minimumThreshold: 3.0,
  amharicPatterns: [
    ethPattern(['ኢየሱስ', 'የሱስ'], 4.0, 'Jesus'),
    ethPattern(['ክርስቶስ'], 4.0, 'Christ'),
    ethPattern(['መድኃኔዓለም', 'መድኃኔ ዓለም', 'መድሃኒ ዓለም', 'መድሃኒዓለም'], 4.5, 'Medhane Alem'),
    ethPattern(['አማኑኤል'], 4.0, 'Emmanuel'),
    ethPattern(['መድኃኒት', 'መድኃኒታችን', 'መድሃኒትና'], 3.0, 'Savior'),
    ethPattern(['ጌታችን', 'ጌታዬ', 'ጌታ ሆይ', 'ጐይታ', 'ጎይታ', 'ጐይታይ', 'ጎይታይ'], 2.5, 'Lord'),
    ethPattern(['ወልደ እግዚአብሔር', 'ወልደ አብ', 'ቤዛ ዓለም', 'ቤዛችን'], 3.5, 'Son of God / Redeemer'),
    ethPattern(['ናዝራዊ', 'ቀራንዮ', 'ስቅለት', 'ተሰቀለ', 'ትንሣኤ', 'ትንሳኤ', 'ፋሲካ', 'ደብረ ታቦር', 'ዕርገት', 'እርገት'], 3.0, 'Passion/Resurrection/Ascension'),
  ],
  latinPatterns: [
    latPattern(['jesus', 'yesus', 'iyyesus', 'kristos', 'christ'], 4.0, 'Jesus/Christ'),
    latPattern(['medhane alem', 'medhanie alem', 'medhanealem'], 4.5, 'Medhane Alem'),
    latPattern(['emmanuel', 'immanuel', 'ammanuel', 'amanuel'], 4.0, 'Emmanuel'),
    latPattern(['savior', 'saviour', 'redeemer', 'messiah'], 3.0, 'Savior'),
    latPattern(['gooftaa', 'fayyisaa', 'yesuus'], 4.0, 'Lord/Savior (Oromo)'),
    latPattern(['lord jesus', 'our lord'], 3.0, 'Lord Jesus'),
  ],
}

const VIRGIN_MARY_DEF: CategoryDefinition = {
  primarySlug: 'virgin-mary',
  minimumThreshold: 3.0,
  amharicPatterns: [
    ethPattern(['ድንግል ማርያም', 'ማርያም ድንግል'], 5.0, 'Virgin Mary'),
    ethPattern(['ማርያም', 'ማርያምስ', 'ማርያመ'], 3.5, 'Mary'),
    ethPattern(['ድንግል', 'ድንግል ሆይ'], 3.0, 'Virgin'),
    ethPattern(['እመቤታችን', 'እመቤቴ', 'እመ ብርሃን', 'እመ አምላክ'], 4.0, 'Our Lady'),
    ethPattern(['ወላዲተ አምላክ', 'ወላዲተአምላክ'], 4.5, 'Theotokos'),
    ethPattern(['ኪዳነ ምሕረት', 'ኪዳነምሕረት'], 4.5, 'Kidane Mihret'),
    ethPattern(['ሰአሊ ለነ', 'ሰአሊለነ'], 3.5, 'Seali Lene'),
    ethPattern(['ጽዮን', 'ጽዮኔ', 'ታቦተ ጽዮን'], 3.0, 'Zion'),
    ethPattern(['አደይ ማርያም', 'እኖና ማርያም'], 4.0, 'Mother Mary (Tigrinya)'),
  ],
  latinPatterns: [
    latPattern(['virgin mary', 'st mary', 'saint mary'], 5.0, 'Virgin Mary'),
    latPattern(['mary', 'mariam', 'maryam', 'dingil', 'debre tsion'], 3.5, 'Mary'),
    latPattern(['emebet', 'emebetachen', 'our lady', 'theotokos', 'mother of god'], 4.0, 'Theotokos / Our Lady'),
    latPattern(['kidane mihret', 'kidane mehret', 'kidanemihret'], 4.5, 'Kidane Mihret'),
    latPattern(['maariyaam', 'durbee', 'haadha waaqayyoo'], 4.5, 'Mary (Oromo)'),
  ],
}

const ANGELS_SAINTS_DEF: CategoryDefinition = {
  primarySlug: 'angels-saints',
  subCategorySlugs: ['angels', 'saints'],
  minimumThreshold: 3.0,
  amharicPatterns: [
    // Angels
    ethPattern(['ሚካኤል', 'ቅዱስ ሚካኤል', 'ሊቀ መላእክት ሚካኤል'], 5.0, 'Michael'),
    ethPattern(['ገብርኤል', 'ቅዱስ ገብርኤል', 'ሊቀ መላእክት ገብርኤል'], 5.0, 'Gabriel'),
    ethPattern(['ሩፋኤል', 'ቅዱስ ሩፋኤል', 'ዑራኤል', 'ቅዱስ ዑራኤል', 'ራጉኤል', 'ፋኑኤል'], 4.5, 'Archangels'),
    ethPattern(['መላእክት', 'መላእክተ', 'መልአክ', 'መልአከ ሰላም', 'መልአከ ምሕረት', 'ኪሩቤል', 'ሱራፌል'], 3.0, 'Angels'),
    // Saints & Martyrs & Apostles
    ethPattern(['ጊዮርጊስ', 'ቅዱስ ጊዮርጊስ'], 5.0, 'St. George'),
    ethPattern(['ተክለ ሃይማኖት', 'አቡነ ተክለ ሃይማኖት', 'ተክለሃይማኖት'], 5.0, 'Tekle Haymanot'),
    ethPattern(['ገብረ መንፈስ ቅዱስ', 'አቡነ ገብረ መንፈስ ቅዱስ', 'ገብረመንፈስቅዱስ'], 5.0, 'Gebre Menfes Kidus'),
    ethPattern(['እስጢፋኖስ', 'ቅዱስ እስጢፋኖስ'], 5.0, 'Stephen'),
    ethPattern(['ያሬድ', 'ቅዱስ ያሬድ'], 5.0, 'St. Yared'),
    ethPattern(['ቂርቆስ', 'ቅዱስ ቂርቆስ'], 5.0, 'St. Kirkos'),
    ethPattern(['አርሴማ', 'ቅድስት አርሴማ'], 5.0, 'St. Arsema'),
    ethPattern(['ሐዋርያት', 'ሐዋርያ', 'ጴጥሮስ', 'ጳውሎስ', 'መጥምቀ መለኮት'], 3.5, 'Apostles / Martyrs'),
    ethPattern(['ሰማዕት', 'ሰማዕታት', 'ጻድቅ', 'ጻድቃን', 'ቅዱሳን'], 2.5, 'Saints/Martyrs'),
  ],
  latinPatterns: [
    latPattern(['michael', 'mikael', 'saint michael', 'st michael'], 5.0, 'Michael'),
    latPattern(['gabriel', 'saint gabriel', 'st gabriel'], 5.0, 'Gabriel'),
    latPattern(['raphael', 'uriel', 'raguel', 'phanuel', 'archangel', 'archangels'], 4.5, 'Archangels'),
    latPattern(['angel', 'angels'], 2.5, 'Angels'),
    latPattern(['george', 'st george', 'giorgis', 'saint george'], 5.0, 'St. George'),
    latPattern(['tekle haymanot', 'takla haymanot'], 5.0, 'Tekle Haymanot'),
    latPattern(['gebre menfes kidus', 'gabre manfas qeddus'], 5.0, 'Gebre Menfes Kidus'),
    latPattern(['estifanos', 'stephen', 'yared', 'kirkos', 'arsema'], 4.5, 'Named Saint'),
    latPattern(['apostle', 'apostles', 'martyr', 'martyrs', 'saints'], 3.0, 'Saints/Apostles'),
  ],
}

const REPENTANCE_FASTING_DEF: CategoryDefinition = {
  primarySlug: 'repentance-fasting',
  subCategorySlugs: ['repentance'],
  minimumThreshold: 2.5,
  amharicPatterns: [
    ethPattern(['ንስሐ', 'ንስሓ'], 4.5, 'Repentance'),
    ethPattern(['ይቅር', 'ይቅርታ', 'ይቅር በለን', 'ይቅር በለኝ', 'ይቕረ'], 4.0, 'Forgiveness'),
    ethPattern(['ማረን', 'ማረኝ', 'አቤቱ ማረን', 'ምሕረት'], 3.5, 'Mercy'),
    ethPattern(['ኃጢአት', 'ኃጢአቴን', 'በደል', 'በደሌን', 'በደላችንን'], 3.5, 'Sin / Transgression'),
    ethPattern(['ጾም', 'ጾመ', 'አጽዋማት', 'ሁዳዴ', 'ዐቢይ ጾም', 'አቢይ ጾም', 'ነነዌ', 'ጾመ ነነዌ'], 4.0, 'Fasting / Lent'),
    ethPattern(['ኪሪያላይሶን', 'ስግደት', 'ስገዱ', 'ተመለሱ'], 3.0, 'Kyrie / Penance'),
  ],
  latinPatterns: [
    latPattern(['repentance', 'repent', 'confession', 'penance'], 4.5, 'Repentance'),
    latPattern(['forgive', 'forgiveness', 'mercy', 'have mercy'], 3.5, 'Forgiveness/Mercy'),
    latPattern(['sin', 'sins', 'sinner', 'transgression'], 3.0, 'Sin'),
    latPattern(['fasting', 'fast', 'lent', 'great lent', 'nineveh'], 4.0, 'Fasting'),
    latPattern(['qalbii jijjiirraa', 'dhiifama', 'sooma', 'araara'], 4.0, 'Repentance/Fasting (Oromo)'),
  ],
}

const PRAISE_GENERAL_DEF: CategoryDefinition = {
  primarySlug: 'praise-general',
  subCategorySlugs: ['praise-worship', 'general'],
  minimumThreshold: 2.0,
  amharicPatterns: [
    ethPattern(['ምስጋና', 'አመስግኑ', 'እናመስግን', 'እንዘምራለን', 'ዝማሬ', 'ውዳሴ', 'ግናይ'], 3.0, 'Praise'),
    ethPattern(['ሃሌ ሉያ', 'ሃሌሉያ', 'አሌሉያ'], 3.5, 'Hallelujah'),
    ethPattern(['ክብር', 'ይድረሰው', 'ክብር ላንተ', 'ክብር ላንቺ'], 2.5, 'Glory'),
    ethPattern(['እልልታ', 'እልል', 'አምልኮ'], 2.0, 'Worship / Rejoicing'),
    ethPattern(['ሥላሴ', 'ቅድስት ሥላሴ', 'አብ ወልድ መንፈስ ቅዱስ'], 4.5, 'Holy Trinity'),
    ethPattern(['መንፈስ ቅዱስ', 'ጰራቅሊጦስ'], 4.0, 'Holy Spirit'),
  ],
  latinPatterns: [
    latPattern(['praise', 'worship', 'thanksgiving', 'glorify', 'glory', 'magnify'], 2.5, 'Praise/Worship'),
    latPattern(['hallelujah', 'halleluya', 'alleluia'], 3.5, 'Hallelujah'),
    latPattern(['trinity', 'holy trinity'], 4.5, 'Holy Trinity'),
    latPattern(['holy spirit', 'paraclete'], 4.0, 'Holy Spirit'),
    latPattern(['galata', 'faarsaa', 'ulfina', 'alleluuyyaa'], 3.5, 'Praise (Oromo)'),
  ],
}

const SACRAMENTS_CHURCH_DEF: CategoryDefinition = {
  primarySlug: 'sacraments-church-life',
  minimumThreshold: 3.0,
  amharicPatterns: [
    ethPattern(['ሰርግ', 'ተክሊል', 'ጋብቻ', 'ሙሽራ', 'ሙሽራይቱ', 'ሙሽሮች'], 5.0, 'Wedding / Matrimony'),
    ethPattern(['ቁርባን', 'ቅዱስ ቁርባን', 'ቅዳሴ'], 4.0, 'Communion / Liturgy'),
    ethPattern(['ቤተክርስቲያን', 'ታቦት', 'ታቦቱ', 'ጽላት'], 3.0, 'Church / Tabot'),
  ],
  latinPatterns: [
    latPattern(['wedding', 'marriage', 'matrimony', 'bridegroom', 'bride'], 5.0, 'Wedding'),
    latPattern(['communion', 'eucharist', 'liturgy', 'qeddase'], 4.0, 'Communion'),
    latPattern(['church', 'tabot'], 2.5, 'Church'),
  ],
}

const ALL_CATEGORY_DEFS: CategoryDefinition[] = [
  JESUS_CHRIST_DEF,
  VIRGIN_MARY_DEF,
  ANGELS_SAINTS_DEF,
  REPENTANCE_FASTING_DEF,
  SACRAMENTS_CHURCH_DEF,
  PRAISE_GENERAL_DEF,
]

// ---------------------------------------------------------------------------
// Occasion Definitions
// ---------------------------------------------------------------------------

interface OccasionRule {
  slug: string
  amharicPatterns: TermPattern[]
  latinPatterns: TermPattern[]
  minimumThreshold: number
}

const OCCASION_RULES: OccasionRule[] = [
  {
    slug: 'gena',
    minimumThreshold: 3.0,
    amharicPatterns: [
      ethPattern(['ገና', 'ልደት', 'ቤተልሔም', 'ተወለደ', 'በጎል', 'በበረት'], 4.0, 'Nativity / Gena'),
    ],
    latinPatterns: [
      latPattern(['christmas', 'nativity', 'gena', 'lidet', 'bethlehem'], 4.0, 'Christmas'),
    ],
  },
  {
    slug: 'timket',
    minimumThreshold: 3.0,
    amharicPatterns: [
      ethPattern(['ጥምቀት', 'ዮርዳኖስ', 'ተጠመቀ'], 4.0, 'Timkat / Jordan'),
    ],
    latinPatterns: [
      latPattern(['timket', 'timkat', 'epiphany', 'jordan'], 4.0, 'Timkat'),
    ],
  },
  {
    slug: 'meskel',
    minimumThreshold: 3.0,
    amharicPatterns: [
      ethPattern(['መስቀል', 'ደመራ', 'መስቀሉ', 'መስቀልህ', 'መስቀልሽ', 'መስቀል ኃይላችን'], 4.0, 'Meskel / Cross'),
    ],
    latinPatterns: [
      latPattern(['meskel', 'demera', 'holy cross', 'the cross'], 4.0, 'Meskel'),
    ],
  },
  {
    slug: 'hosanna',
    minimumThreshold: 3.0,
    amharicPatterns: [
      ethPattern(['ሆሣዕና', 'ሆሳዕና', 'ሆሳእና'], 4.5, 'Hosanna'),
    ],
    latinPatterns: [
      latPattern(['hosanna', 'palm sunday'], 4.5, 'Hosanna'),
    ],
  },
  {
    slug: 'siklet',
    minimumThreshold: 3.0,
    amharicPatterns: [
      ethPattern(['ስቅለት', 'ቀራንዮ', 'ተሰቀለ', 'የመስቀሉ ሞት', 'ሕማማት'], 4.0, 'Siklet / Passion'),
    ],
    latinPatterns: [
      latPattern(['siklet', 'good friday', 'crucifixion', 'calvary', 'golgotha'], 4.0, 'Siklet'),
    ],
  },
  {
    slug: 'tinsae',
    minimumThreshold: 3.0,
    amharicPatterns: [
      ethPattern(['ትንሣኤ', 'ትንሳኤ', 'ፋሲካ', 'ተነሥቷል', 'ተነስቷል', 'ሞትን ድል አድርጎ'], 4.0, 'Tinsae / Easter'),
    ],
    latinPatterns: [
      latPattern(['tinsae', 'fasika', 'easter', 'resurrection', 'pascha'], 4.0, 'Tinsae'),
    ],
  },
  {
    slug: 'erget',
    minimumThreshold: 3.0,
    amharicPatterns: [
      ethPattern(['ዕርገት', 'እርገት', 'ዐረገ', 'አረገ'], 4.0, 'Ascension'),
    ],
    latinPatterns: [
      latPattern(['erget', 'ascension'], 4.0, 'Erget'),
    ],
  },
  {
    slug: 'pentecost',
    minimumThreshold: 3.0,
    amharicPatterns: [
      ethPattern(['ጰንጠቆስጤ', 'ጰራቅሊጦስ'], 4.5, 'Pentecost'),
    ],
    latinPatterns: [
      latPattern(['pentecost', 'paraclete'], 4.5, 'Pentecost'),
    ],
  },
  {
    slug: 'debre-tabor',
    minimumThreshold: 3.0,
    amharicPatterns: [
      ethPattern(['ደብረ ታቦር', 'ደብረታቦር', 'ቡሄ'], 4.5, 'Debre Tabor / Buhe'),
    ],
    latinPatterns: [
      latPattern(['debre tabor', 'buhe', 'transfiguration'], 4.5, 'Debre Tabor'),
    ],
  },
  {
    slug: 'filseta',
    minimumThreshold: 3.0,
    amharicPatterns: [
      ethPattern(['ፍልሰታ', 'ጾመ ፍልሰታ'], 4.5, 'Filseta'),
    ],
    latinPatterns: [
      latPattern(['filseta', 'assumption fast', 'dormition'], 4.5, 'Filseta'),
    ],
  },
  {
    slug: 'kidane-mihret',
    minimumThreshold: 3.0,
    amharicPatterns: [
      ethPattern(['ኪዳነ ምሕረት', 'ኪዳነምሕረት'], 4.5, 'Kidane Mihret'),
    ],
    latinPatterns: [
      latPattern(['kidane mihret', 'kidane mehret', 'covenant of mercy'], 4.5, 'Kidane Mihret'),
    ],
  },
  {
    slug: 'lideta-maryam',
    minimumThreshold: 3.0,
    amharicPatterns: [
      ethPattern(['ልደታ ማርያም', 'ልደቷ'], 4.5, 'Lideta Maryam'),
    ],
    latinPatterns: [
      latPattern(['lideta maryam', 'nativity of mary'], 4.5, 'Lideta Maryam'),
    ],
  },
  {
    slug: 'abiy-tsom',
    minimumThreshold: 3.0,
    amharicPatterns: [
      ethPattern(['ዐቢይ ጾም', 'አቢይ ጾም', 'ሁዳዴ'], 4.5, 'Abiy Tsom'),
    ],
    latinPatterns: [
      latPattern(['abiy tsom', 'great lent', 'hudadi'], 4.5, 'Great Lent'),
    ],
  },
  {
    slug: 'tsome-nineveh',
    minimumThreshold: 3.0,
    amharicPatterns: [
      ethPattern(['ነነዌ', 'ጾመ ነነዌ'], 4.5, 'Nineveh'),
    ],
    latinPatterns: [
      latPattern(['nineveh', 'tsome nineveh'], 4.5, 'Nineveh'),
    ],
  },
  {
    slug: 'wedding',
    minimumThreshold: 3.0,
    amharicPatterns: [
      ethPattern(['ሰርግ', 'ተክሊል', 'ጋብቻ', 'ሙሽራ', 'ሙሽራይቱ'], 5.0, 'Wedding'),
    ],
    latinPatterns: [
      latPattern(['wedding', 'matrimony', 'marriage'], 5.0, 'Wedding'),
    ],
  },
  {
    slug: 'communion',
    minimumThreshold: 3.0,
    amharicPatterns: [
      ethPattern(['ቁርባን', 'ቅዱስ ቁርባን'], 4.5, 'Communion'),
    ],
    latinPatterns: [
      latPattern(['communion', 'eucharist'], 4.5, 'Communion'),
    ],
  },
  {
    slug: 'annual-saint-feast',
    minimumThreshold: 3.0,
    amharicPatterns: [
      ethPattern(['ዓመታዊ በዓል', 'ዓመታዊ የቅዱሳን በዓል', 'መታሰቢያ'], 4.0, 'Saint Feast'),
    ],
    latinPatterns: [
      latPattern(['annual feast', 'saint feast'], 4.0, 'Saint Feast'),
    ],
  },
  {
    slug: 'repentance',
    minimumThreshold: 3.5,
    amharicPatterns: [
      ethPattern(['ንስሐ', 'ንስሓ', 'ይቅር በለን'], 4.0, 'Repentance'),
    ],
    latinPatterns: [
      latPattern(['repentance', 'confession'], 4.0, 'Repentance'),
    ],
  },
  {
    slug: 'praise',
    minimumThreshold: 3.0,
    amharicPatterns: [
      ethPattern(['ምስጋና', 'አመስግኑ', 'እናመስግን', 'ሃሌሉያ'], 3.5, 'Praise'),
    ],
    latinPatterns: [
      latPattern(['praise', 'worship', 'thanksgiving'], 3.5, 'Praise'),
    ],
  },
]

// ---------------------------------------------------------------------------
// Main Classifier Function
// ---------------------------------------------------------------------------

/**
 * Classifies a single Mezmur deterministically from available lyrics fields.
 *
 * Does NOT use remote AI. Does NOT rely on YouTube titles.
 * Ignores singer name from lyric checks to prevent false subject matches.
 */
export function classifyMezmur(input: MezmurClassificationInput): MezmurClassificationResult {
  const lyricsList = [
    input.lyrics_amharic || '',
    input.lyrics_geez || '',
    input.lyrics_english || '',
    input.lyrics_oromo || '',
    input.lyrics_transliteration || '',
  ].filter((s) => s.trim().length > 0)

  // If no lyrics are present at all, return General fallback
  if (lyricsList.length === 0) {
    return {
      import_id: input.import_id,
      slug: input.slug,
      primaryCategorySlug: 'praise-general',
      additionalCategorySlugs: [],
      primaryOccasionSlug: null,
      additionalOccasionSlugs: [],
      confidence: 0.3,
      method: 'fallback_general',
      signals: ['No usable lyrics recorded'],
      explanation: 'No lyrics available; assigned default General category with no specific occasions.',
    }
  }

  // Combine lyrics and lines
  const combinedRaw = lyricsList.join('\n')
  const lines = combinedRaw
    .split(/\r?\n/)
    .map((l) => l.trim())
    .filter(Boolean)

  // Count line frequencies to identify refrains/choruses (repeat >= 2)
  const lineCounts = new Map<string, number>()
  for (const line of lines) {
    const key = line.toLowerCase()
    lineCounts.set(key, (lineCounts.get(key) || 0) + 1)
  }

  // Extract singer names to exclude from text matching
  const singerNamesToExclude: string[] = []
  for (const s of [input.singer_name, input.zemari_name]) {
    if (!s) continue
    const parts = s.split(/[\s/,-]+/).filter((p) => p.length >= 3)
    singerNamesToExclude.push(...parts)
  }

  // Build clean text representations
  const normalizedAmharic = normalizeEthiopic(combinedRaw)
  const normalizedLatin = normalizeLatin(combinedRaw)

  // Build excluded regex for singer tokens
  const excludedAmharicRegex = singerNamesToExclude.length > 0
    ? new RegExp(`(?:^|[^\\p{L}\\p{N}])(?:${singerNamesToExclude.map(normalizeEthiopic).filter(Boolean).join('|')})(?:[^\\p{L}\\p{N}]|$)`, 'giu')
    : null
  const excludedLatinRegex = singerNamesToExclude.length > 0
    ? new RegExp(`\\b(?:${singerNamesToExclude.map(normalizeLatin).filter(Boolean).join('|')})\\b`, 'gi')
    : null

  // Clean lines for analysis with weights (refrain lines get 2.5x weight)
  const weightedSegments: Array<{ textAm: string; textLat: string; weight: number }> = []
  for (const line of lines) {
    const count = lineCounts.get(line.toLowerCase()) || 1
    const weight = count >= 2 ? 2.5 : 1.0
    let cleanAm = normalizeEthiopic(line)
    let cleanLat = normalizeLatin(line)
    if (excludedAmharicRegex) cleanAm = cleanAm.replace(excludedAmharicRegex, ' ')
    if (excludedLatinRegex) cleanLat = cleanLat.replace(excludedLatinRegex, ' ')
    weightedSegments.push({ textAm: cleanAm, textLat: cleanLat, weight })
  }

  // Score categories
  interface CategoryScore {
    def: CategoryDefinition
    score: number
    matches: string[]
  }

  const categoryScores: CategoryScore[] = []

  for (const def of ALL_CATEGORY_DEFS) {
    let score = 0
    const matches = new Set<string>()

    for (const segment of weightedSegments) {
      for (const p of def.amharicPatterns) {
        if (p.pattern.test(segment.textAm)) {
          score += p.weight * segment.weight
          matches.add(p.label)
        }
      }
      for (const p of def.latinPatterns) {
        if (p.pattern.test(segment.textLat)) {
          score += p.weight * segment.weight
          matches.add(p.label)
        }
      }
    }

    categoryScores.push({ def, score, matches: [...matches] })
  }

  // Sort categories by score descending
  categoryScores.sort((a, b) => b.score - a.score)

  const topCategory = categoryScores[0]
  const secondCategory = categoryScores[1]

  // Detect English language category tag
  const isEnglish = (input.primary_language || '').toLowerCase() === 'en' ||
    (input.lyrics_english && !input.lyrics_amharic && !input.lyrics_geez)

  let primaryCategorySlug = 'praise-general'
  const additionalCategorySlugs: string[] = []
  const signals: string[] = []
  let confidence = 0.5
  let method: 'deterministic_lyrics' | 'fallback_general' = 'deterministic_lyrics'

  if (topCategory && topCategory.score >= topCategory.def.minimumThreshold) {
    primaryCategorySlug = topCategory.def.primarySlug
    confidence = Math.min(0.98, 0.6 + topCategory.score * 0.04)
    signals.push(...topCategory.matches.map((m) => `${topCategory.def.primarySlug}: ${m}`))

    // Add subcategories if specific angels/saints were detected
    if (topCategory.def.primarySlug === 'angels-saints') {
      const textAm = normalizedAmharic
      const textLat = normalizedLatin
      if (/ሚካኤል|michael/i.test(textAm) || /michael|mikael/i.test(textLat)) {
        additionalCategorySlugs.push('kidus-michael')
      }
      if (/ገብርኤል|gabriel/i.test(textAm) || /gabriel/i.test(textLat)) {
        additionalCategorySlugs.push('kidus-gabriel')
      }
      if (/ዑራኤል|uriel/i.test(textAm) || /uriel/i.test(textLat)) {
        additionalCategorySlugs.push('kidus-uriel')
      }
      if (/ሩፋኤል|raphael/i.test(textAm) || /raphael/i.test(textLat)) {
        additionalCategorySlugs.push('kidus-raphael')
      }
      if (/ጊዮርጊስ|george/i.test(textAm) || /george|giorgis/i.test(textLat)) {
        additionalCategorySlugs.push('kidus-giorgis')
      }
      if (/አርሴማ|arsema/i.test(textAm) || /arsema/i.test(textLat)) {
        additionalCategorySlugs.push('kidist-arsema')
      }
      if (/ሐዋርያ|apostle/i.test(textAm) || /apostle/i.test(textLat)) {
        additionalCategorySlugs.push('apostles')
      }
      if (/ሰማዕት|martyr/i.test(textAm) || /martyr/i.test(textLat)) {
        additionalCategorySlugs.push('martyrs')
      }
    }

    // Check if second category also has significant presence (at least 55% of top score)
    // to distinguish combined categories from incidental mentions
    if (
      secondCategory &&
      secondCategory.score >= secondCategory.def.minimumThreshold &&
      secondCategory.score >= topCategory.score * 0.55 &&
      secondCategory.def.primarySlug !== primaryCategorySlug
    ) {
      additionalCategorySlugs.push(secondCategory.def.primarySlug)
      signals.push(...secondCategory.matches.map((m) => `additional ${secondCategory.def.primarySlug}: ${m}`))
    }
  } else {
    // Score below threshold: fallback to General
    primaryCategorySlug = 'praise-general'
    confidence = 0.45
    method = 'fallback_general'
    signals.push('No decisive theological subject detected; defaulted to Praise & General')
  }

  // Add English Mezmur category if primarily English
  if (isEnglish && !additionalCategorySlugs.includes('english-mezmur') && primaryCategorySlug !== 'english-mezmur') {
    additionalCategorySlugs.push('english-mezmur')
  }

  // -------------------------------------------------------------------------
  // Occasions Scoring
  // -------------------------------------------------------------------------
  interface OccasionScore {
    rule: OccasionRule
    score: number
    matches: string[]
  }

  const occasionScores: OccasionScore[] = []

  for (const rule of OCCASION_RULES) {
    let score = 0
    const matches = new Set<string>()

    for (const segment of weightedSegments) {
      for (const p of rule.amharicPatterns) {
        if (p.pattern.test(segment.textAm)) {
          score += p.weight * segment.weight
          matches.add(p.label)
        }
      }
      for (const p of rule.latinPatterns) {
        if (p.pattern.test(segment.textLat)) {
          score += p.weight * segment.weight
          matches.add(p.label)
        }
      }
    }

    if (score >= rule.minimumThreshold) {
      occasionScores.push({ rule, score, matches: [...matches] })
    }
  }

  occasionScores.sort((a, b) => b.score - a.score)

  let primaryOccasionSlug: string | null = null
  const additionalOccasionSlugs: string[] = []

  if (occasionScores.length > 0) {
    primaryOccasionSlug = occasionScores[0].rule.slug
    signals.push(`occasion: ${occasionScores[0].rule.slug} (${occasionScores[0].matches.join(', ')})`)

    for (let i = 1; i < occasionScores.length; i++) {
      const occ = occasionScores[i]
      if (occ.score >= occasionScores[0].score * 0.6) {
        additionalOccasionSlugs.push(occ.rule.slug)
        signals.push(`additional occasion: ${occ.rule.slug}`)
      }
    }
  }

  // If no specific occasion was found, leave occasion null or general only if praise/general
  if (!primaryOccasionSlug && primaryCategorySlug === 'praise-general' && topCategory && topCategory.score >= 2.0) {
    primaryOccasionSlug = 'general'
  }

  const explanation = method === 'fallback_general'
    ? 'Assigned General category because lyrics contain general devotional text without a specific focal theological subject.'
    : `Primary category ${primaryCategorySlug} assigned based on ${signals.slice(0, 4).join('; ')}.`

  return {
    import_id: input.import_id,
    slug: input.slug,
    primaryCategorySlug,
    additionalCategorySlugs: [...new Set(additionalCategorySlugs)],
    primaryOccasionSlug,
    additionalOccasionSlugs: [...new Set(additionalOccasionSlugs)],
    confidence: Number(confidence.toFixed(2)),
    method,
    signals,
    explanation,
  }
}
