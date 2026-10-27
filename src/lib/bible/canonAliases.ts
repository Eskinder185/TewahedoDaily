/**
 * TEWAHEDODAILY — ETHIOPIAN ORTHODOX BIBLE CANON ALIASES
 *
 * Normalizes book queries and references in English, Amharic, Ge'ez,
 * and Latin transliteration into canonical book slugs and metadata.
 */

export interface CanonicalBookInfo {
  slug: string
  canonicalNumber: number
  collection: 'old' | 'new' | 'orthodox_broader'
  nameEn: string
  nameAm: string
  nameGez?: string
  aliases: string[]
  chapterCount: number
}

export const ORTHODOX_CANON_CATALOG: CanonicalBookInfo[] = [
  // Old Testament (Octateuch, Historical, Poetic, Prophetic & Broader Canon)
  {
    slug: 'genesis',
    canonicalNumber: 1,
    collection: 'old',
    nameEn: 'Genesis',
    nameAm: 'ኦሪት ዘፍጥረት',
    nameGez: 'ኦሪት ዘፍጥረት',
    aliases: ['gen', 'ge', 'zefitret', 'zefetret', 'ዘፍጥረት', 'ዘፍ'],
    chapterCount: 50,
  },
  {
    slug: 'exodus',
    canonicalNumber: 2,
    collection: 'old',
    nameEn: 'Exodus',
    nameAm: 'ኦሪት ዘጸአት',
    nameGez: 'ኦሪት ዘጸአት',
    aliases: ['ex', 'exo', 'zetseat', 'zetse', 'ዘጸአት', 'ዘጸ'],
    chapterCount: 40,
  },
  {
    slug: 'leviticus',
    canonicalNumber: 3,
    collection: 'old',
    nameEn: 'Leviticus',
    nameAm: 'ኦሪት ዘሌዋውያን',
    nameGez: 'ኦሪት ዘሌዋውያን',
    aliases: ['lev', 'le', 'zelewayan', 'ዘሌዋውያን', 'ዘሌ'],
    chapterCount: 27,
  },
  {
    slug: 'numbers',
    canonicalNumber: 4,
    collection: 'old',
    nameEn: 'Numbers',
    nameAm: 'ኦሪት ዘኍልቍ',
    nameGez: 'ኦሪት ዘኍልቍ',
    aliases: ['num', 'nu', 'zehwelqw', 'ዘኍልቍ', 'ዘሁልቁ', 'ዘኍ'],
    chapterCount: 36,
  },
  {
    slug: 'deuteronomy',
    canonicalNumber: 5,
    collection: 'old',
    nameEn: 'Deuteronomy',
    nameAm: 'ኦሪት ዘዳግም',
    nameGez: 'ኦሪት ዘዳግም',
    aliases: ['deut', 'dt', 'zedagim', 'ዘዳግም', 'ዘዳ'],
    chapterCount: 34,
  },
  {
    slug: 'jubilees',
    canonicalNumber: 6,
    collection: 'orthodox_broader',
    nameEn: 'Jubilees',
    nameAm: 'መጽሐፈ ኩፋሌ',
    nameGez: 'መጽሐፈ ኩፋሌ',
    aliases: ['kufale', 'kufaale', 'ኩፋሌ'],
    chapterCount: 50,
  },
  {
    slug: 'enoch',
    canonicalNumber: 7,
    collection: 'orthodox_broader',
    nameEn: '1 Enoch',
    nameAm: 'መጽሐፈ ሄኖክ',
    nameGez: 'መጽሐፈ ሄኖክ',
    aliases: ['henok', 'henoch', 'enoch', 'ሄኖክ'],
    chapterCount: 108,
  },
  {
    slug: 'psalms',
    canonicalNumber: 23,
    collection: 'old',
    nameEn: 'Psalms',
    nameAm: 'መዝሙረ ዳዊት',
    nameGez: 'መዝሙረ ዳዊት',
    aliases: ['ps', 'psalm', 'mezmure dawit', 'dawit', 'መዝሙር', 'መዝ', 'ዳዊት'],
    chapterCount: 150,
  },
  {
    slug: 'proverbs',
    canonicalNumber: 24,
    collection: 'old',
    nameEn: 'Proverbs',
    nameAm: 'መጽሐፈ ምሳሌ',
    nameGez: 'መጽሐፈ ምሳሌ',
    aliases: ['prov', 'pr', 'misale', 'ምሳሌ', 'ምሳ'],
    chapterCount: 31,
  },
  {
    slug: 'isaiah',
    canonicalNumber: 29,
    collection: 'old',
    nameEn: 'Isaiah',
    nameAm: 'ትንቢተ ኢሳይያስ',
    nameGez: 'ትንቢተ ኢሳይያስ',
    aliases: ['isa', 'is', 'isaias', 'esayas', 'ኢሳይያስ', 'ኢሳ'],
    chapterCount: 66,
  },

  // New Testament Gospels & Epistles
  {
    slug: 'matthew',
    canonicalNumber: 47,
    collection: 'new',
    nameEn: 'Matthew',
    nameAm: 'የማቴዎስ ወንጌል',
    nameGez: 'ወንጌል ዘማቴዎስ',
    aliases: ['matt', 'mt', 'matewos', 'ማቴዎስ', 'ማቴ'],
    chapterCount: 28,
  },
  {
    slug: 'mark',
    canonicalNumber: 48,
    collection: 'new',
    nameEn: 'Mark',
    nameAm: 'የማርቆስ ወንጌል',
    nameGez: 'ወንጌል ዘማርቆስ',
    aliases: ['mrk', 'mk', 'marqos', 'ማርቆስ', 'ማር'],
    chapterCount: 16,
  },
  {
    slug: 'luke',
    canonicalNumber: 49,
    collection: 'new',
    nameEn: 'Luke',
    nameAm: 'የሉቃስ ወንጌል',
    nameGez: 'ወንጌል ዘሉቃስ',
    aliases: ['luk', 'lk', 'luqas', 'ሉቃስ', 'ሉቃ'],
    chapterCount: 24,
  },
  {
    slug: 'john',
    canonicalNumber: 50,
    collection: 'new',
    nameEn: 'John',
    nameAm: 'የዮሐንስ ወንጌል',
    nameGez: 'ወንጌል ዘዮሐንስ',
    aliases: ['jhn', 'jn', 'yohannes', 'ዮሐንስ', 'ዮሐ'],
    chapterCount: 21,
  },
  {
    slug: 'acts',
    canonicalNumber: 51,
    collection: 'new',
    nameEn: 'Acts',
    nameAm: 'የሐዋርያት ሥራ',
    nameGez: 'ግብረ ሐዋርያት',
    aliases: ['act', 'ac', 'hawaryat', 'የሐዋርያት ሥራ', 'ሐዋ'],
    chapterCount: 28,
  },
  {
    slug: 'romans',
    canonicalNumber: 52,
    collection: 'new',
    nameEn: 'Romans',
    nameAm: 'ወደ ሮሜ ሰዎች',
    nameGez: 'መልእክት ኀበ ሰብአ ሮሜ',
    aliases: ['rom', 'ro', 'rome', 'ሮሜ'],
    chapterCount: 16,
  },
  {
    slug: 'revelation',
    canonicalNumber: 73,
    collection: 'new',
    nameEn: 'Revelation',
    nameAm: 'የዮሐንስ ራእይ',
    nameGez: 'ራእየ ዮሐንስ',
    aliases: ['rev', 're', 'raey', 'ራእይ', 'ራእየ ዮሐንስ', 'ራእ'],
    chapterCount: 22,
  },
]

export function resolveCanonicalBook(query: string): CanonicalBookInfo | null {
  if (!query || !query.trim()) return null
  const normalized = query.trim().toLowerCase().replace(/^(the\s+book\s+of|መጽሐፈ|ወንጌል\s+ዘ|ኦሪት\s+ዘ|የ|ወደ)\s+/i, '')

  for (const book of ORTHODOX_CANON_CATALOG) {
    if (book.slug === normalized) return book
    if (book.nameEn.toLowerCase() === normalized) return book
    if (book.nameAm === query.trim() || book.nameAm.includes(query.trim())) return book
    if (book.aliases.some((alias) => alias.toLowerCase() === normalized || alias === query.trim())) {
      return book
    }
  }

  return null
}
