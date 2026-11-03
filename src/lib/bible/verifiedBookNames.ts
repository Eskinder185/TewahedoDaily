/**
 * Verified English–Amharic Bible book names extracted from the user-supplied
 * Ethiopian Bible table of contents (amahricethiobible.ocr.txt, page 3).
 *
 * The list has 66 books (Protestant order); each maps one-to-one to a source volume of the
 * English (web) edition, and so to a canonical book (`slug`) plus `volume` for combined books.
 * Amharic wording is copied from the list and never machine-translated.
 *
 *  - verbatim:        exactly as printed in the list.
 *  - ocr-cleaned:     stray OCR punctuation/heading text removed; wording unchanged (`ocr` keeps the raw text).
 *  - db-corroborated: the OCR text is corrupt/ambiguous; the wording is the existing Amharic-edition volume
 *                     name and needs confirmation against the printed book (`ocr` keeps the raw text).
 *
 * Priority: the list is AUTHORITATIVE over conflicting database display names for `verbatim` and
 * `ocr-cleaned` entries. `db-corroborated` entries are NOT source-verified (the OCR is corrupt): they
 * never override a database label and only fill a gap, and callers must treat them as needing review.
 */
export type VerifiedBookName = {
  slug: string
  /** 1-based volume inside a combined canonical book. */
  volume?: number
  /** Source-volume English name, as in the English edition. */
  en: string
  am: string
  status: 'verbatim' | 'ocr-cleaned' | 'db-corroborated'
  ocr?: string
  note?: string
}

export const VERIFIED_BOOK_NAMES: readonly VerifiedBookName[] = [
  { slug: 'genesis', en: 'Genesis', am: 'ኦሪት ዘፍጥረት', status: 'ocr-cleaned', ocr: 'ብሌይ ኪዳን . ኦሪት ዘፍጥረት', note: 'Stray OCR punctuation or heading text removed; Amharic wording unchanged.' },
  { slug: 'exodus', en: 'Exodus', am: 'ኦሪት ዘጸአት', status: 'verbatim' },
  { slug: 'leviticus', en: 'Leviticus', am: 'ኦሪት ዘሌዋውያን', status: 'verbatim' },
  { slug: 'numbers', en: 'Numbers', am: 'ኦሪት ዘኍልቍ', status: 'verbatim' },
  { slug: 'deuteronomy', en: 'Deuteronomy', am: 'ኦሪት ዘዳግም', status: 'verbatim' },
  { slug: 'joshua', en: 'Joshua', am: 'መጽሐፈ ኢያሱ ወልደ ነዌ', status: 'verbatim' },
  { slug: 'judges', en: 'Judges', am: 'መጽሐፈ መሣፍንት', status: 'verbatim' },
  { slug: 'ruth', en: 'Ruth', am: 'መጽሐፈ ሩት', status: 'verbatim' },
  { slug: 'samuel', volume: 1, en: '1 Samuel', am: 'መጽሐፈ ሳሙኤል ቀዳማዊ', status: 'verbatim' },
  { slug: 'samuel', volume: 2, en: '2 Samuel', am: 'መጽሐፈ ሳሙኤል ካልዕ', status: 'db-corroborated', ocr: 'መጽሐፈ ሳሙኤል ካል', note: 'OCR text is truncated (ካል). Completed from the existing Amharic edition volume name; same ካልዕ form as 2 Kings in the list. Confirm against the printed book.' },
  { slug: 'kings', volume: 1, en: '1 Kings', am: 'መጽሐፈ ነገሥት ቀዳማዊ', status: 'ocr-cleaned', ocr: 'መጽሐፈ ነገሥት ቀዳማዊ።', note: 'Stray OCR punctuation or heading text removed; Amharic wording unchanged.' },
  { slug: 'kings', volume: 2, en: '2 Kings', am: 'መጽሐፈ ነገሥት ካልዕ', status: 'ocr-cleaned', ocr: 'መጽሐፈ ነገሥት ካልዕ።', note: 'Stray OCR punctuation or heading text removed; Amharic wording unchanged.' },
  { slug: 'first-chronicles', en: '1 Chronicles', am: 'መጽሐፈ ዜና መዋዕል ቀዳማዊ', status: 'ocr-cleaned', ocr: 'መጽሐፈ ዜና መዋዕል ቀዳማዊ።', note: 'Stray OCR punctuation or heading text removed; Amharic wording unchanged.' },
  { slug: 'second-chronicles', en: '2 Chronicles', am: 'መጽሐፈ ዜና መዋዕል ካልዕ', status: 'verbatim' },
  { slug: 'ezra-nehemiah', volume: 1, en: 'Ezra', am: 'መጽሐፈ ዕዝራ', status: 'ocr-cleaned', ocr: 'መጽሐፈ ዕዝራ።', note: 'Stray OCR punctuation or heading text removed; Amharic wording unchanged.' },
  { slug: 'ezra-nehemiah', volume: 2, en: 'Nehemiah', am: 'መጽሐፈ ነህምያ', status: 'verbatim' },
  { slug: 'esther', en: 'Esther', am: 'መጽሐፈ አስቴር', status: 'ocr-cleaned', ocr: 'መጽሐፈ አስቴር።', note: 'Stray OCR punctuation or heading text removed; Amharic wording unchanged.' },
  { slug: 'job', en: 'Job', am: 'መጽሐፈ ኢዮብ', status: 'ocr-cleaned', ocr: 'መጽሐፈ ኢዮብ።', note: 'Stray OCR punctuation or heading text removed; Amharic wording unchanged.' },
  { slug: 'psalms', en: 'Psalms', am: 'መዝሙረ ዳዊት', status: 'verbatim' },
  { slug: 'proverbs', en: 'Proverbs', am: 'መጽሐፈ ምሳሌ', status: 'verbatim' },
  { slug: 'ecclesiastes', en: 'Ecclesiastes', am: 'መጽሐፈ መክብብ', status: 'verbatim' },
  { slug: 'song-of-songs', en: 'Song of Solomon', am: 'መኃልየ መኃልይ ዘሰሎሞን', status: 'verbatim' },
  { slug: 'isaiah', en: 'Isaiah', am: 'ትንቢተ ኢሳይያስ', status: 'verbatim' },
  { slug: 'jeremiah-collection', volume: 1, en: 'Jeremiah', am: 'ትንቢተ ኤርምያስ', status: 'verbatim' },
  { slug: 'jeremiah-collection', volume: 2, en: 'Lamentations', am: 'ሰቆቃው ኤርምያስ', status: 'verbatim' },
  { slug: 'ezekiel', en: 'Ezekiel', am: 'ትንቢተ ሕዝቅኤል', status: 'verbatim' },
  { slug: 'daniel', en: 'Daniel', am: 'ትንቢተ ዳንኤል', status: 'verbatim' },
  { slug: 'hosea', en: 'Hosea', am: 'ትንቢተ ሆሴዕ', status: 'verbatim' },
  { slug: 'joel', en: 'Joel', am: 'ትንቢተ ኢዮኤል', status: 'verbatim' },
  { slug: 'amos', en: 'Amos', am: 'ትንቢተ አሞጽ', status: 'verbatim' },
  { slug: 'obadiah', en: 'Obadiah', am: 'ትንቢተ አብድዩ', status: 'verbatim' },
  { slug: 'jonah', en: 'Jonah', am: 'ትንቢተ ዮናስ', status: 'verbatim' },
  { slug: 'micah', en: 'Micah', am: 'ትንቢተ ሚክያስ', status: 'verbatim' },
  { slug: 'nahum', en: 'Nahum', am: 'ትንቢተ ናሆም', status: 'verbatim' },
  { slug: 'habakkuk', en: 'Habakkuk', am: 'ትንቢተ ዕንባቆም', status: 'verbatim' },
  { slug: 'zephaniah', en: 'Zephaniah', am: 'ትንቢተ ሶፎንያስ', status: 'verbatim' },
  { slug: 'haggai', en: 'Haggai', am: 'ትንቢተ ሐጌ', status: 'verbatim' },
  { slug: 'zechariah', en: 'Zechariah', am: 'ትንቢተ ዘካርያስ', status: 'verbatim' },
  { slug: 'malachi', en: 'Malachi', am: 'ትንቢተ ሚልክያ', status: 'verbatim' },
  { slug: 'matthew', en: 'Matthew', am: 'የማቴዎስ ወንጌል', status: 'verbatim' },
  { slug: 'mark', en: 'Mark', am: 'የማርቆስ ወንጌል', status: 'verbatim' },
  { slug: 'luke', en: 'Luke', am: 'የሉቃስ ወንጌል', status: 'verbatim' },
  { slug: 'john', en: 'John', am: 'የዮሐንስ ወንጌል', status: 'verbatim' },
  { slug: 'acts', en: 'Acts', am: 'የሐዋርያት ሥራ', status: 'verbatim' },
  { slug: 'romans', en: 'Romans', am: 'ወደ ሮሜ ሰዎች', status: 'verbatim' },
  { slug: 'first-corinthians', en: '1 Corinthians', am: '1ኛ ወደ ቆሮንቶስ ሰዎች', status: 'db-corroborated', ocr: '1ኛ ቆሮንጦስ', note: 'OCR reads 1ኛ ቆሮንጦስ with English "Corinthians" (no number, no ወደ, ጦ vs ቶ). Matched by position before 2 Corinthians; wording taken from the existing Amharic edition volume name. Confirm against the printed book.' },
  { slug: 'second-corinthians', en: '2 Corinthians', am: '2ኛ ወደ ቆሮንቶስ ሰዎች', status: 'verbatim' },
  { slug: 'galatians', en: 'Galatians', am: 'ወደ ገላትያ ሰዎች', status: 'verbatim' },
  { slug: 'ephesians', en: 'Ephesians', am: 'ወደ ኤፌሶን ሰዎች', status: 'verbatim' },
  { slug: 'philippians', en: 'Philippians', am: 'ወደ ፊልጵስዩስ ሰዎች', status: 'verbatim' },
  { slug: 'colossians', en: 'Colossians', am: 'ወደ ቆላስይስ ሰዎች', status: 'verbatim' },
  { slug: 'first-thessalonians', en: '1 Thessalonians', am: '1ኛ ወደ ተሰሎንቄ ሰዎች', status: 'verbatim' },
  { slug: 'second-thessalonians', en: '2 Thessalonians', am: '2ኛ ወደ ተሰሎንቄ ሰዎች', status: 'verbatim' },
  { slug: 'first-timothy', en: '1 Timothy', am: '1ኛ ወደ ጢሞቴዎስ', status: 'verbatim' },
  { slug: 'second-timothy', en: '2 Timothy', am: '2ኛ ወደ ጢሞቴዎስ', status: 'verbatim' },
  { slug: 'titus', en: 'Titus', am: 'ወደ ቲቶ', status: 'verbatim' },
  { slug: 'philemon', en: 'Philemon', am: 'ወደ ፊልሞና', status: 'verbatim' },
  { slug: 'hebrews', en: 'Hebrews', am: 'ወደ ዕብራውያን', status: 'verbatim' },
  { slug: 'james', en: 'James', am: 'የያዕቆብ መልእክት', status: 'verbatim' },
  { slug: 'first-peter', en: '1 Peter', am: '1ኛ የጴጥሮስ መልእክት', status: 'ocr-cleaned', ocr: '.. 1ኛ የጴጥሮስ መልእክት', note: 'Stray OCR punctuation or heading text removed; Amharic wording unchanged.' },
  { slug: 'second-peter', en: '2 Peter', am: '2ኛ የጴጥሮስ መልእክት', status: 'verbatim' },
  { slug: 'first-john', en: '1 John', am: '1ኛ የዮሐንስ መልእክት', status: 'verbatim' },
  { slug: 'second-john', en: '2 John', am: '2ኛ የዮሐንስ መልእክት', status: 'verbatim' },
  { slug: 'third-john', en: '3 John', am: '3ኛ የዮሐንስ መልእክት', status: 'verbatim' },
  { slug: 'jude', en: 'Jude', am: 'የይሁዳ መልእክት', status: 'verbatim' },
  { slug: 'revelation', en: 'Revelation', am: 'የዮሐንስ ራእይ', status: 'ocr-cleaned', ocr: '. የዮሐንስ ራእይ', note: 'Stray OCR punctuation or heading text removed; Amharic wording unchanged.' },
]

const normalizeEnglish = (value: string) => value.normalize('NFKC').toLowerCase().replace(/\s+/g, ' ').trim()
const normalizeAmharic = (value: string) => value.normalize('NFC').replace(/\s+/g, ' ').trim()

const byEnglish = new Map(VERIFIED_BOOK_NAMES.map((entry) => [normalizeEnglish(entry.en), entry]))
const bySlug = new Map<string, VerifiedBookName[]>()
for (const entry of VERIFIED_BOOK_NAMES) bySlug.set(entry.slug, [...(bySlug.get(entry.slug) || []), entry])

/** True only for names actually read from the list (not OCR-corrupt entries completed from database wording). */
export const isSourceVerified = (entry: VerifiedBookName) => entry.status !== 'db-corroborated'

/** Authoritative Amharic name for a source volume, by English source name ("1 Samuel"). Overrides database labels. */
export function verifiedAmharicForSourceName(englishName: string | null | undefined): string | null {
  if (!englishName) return null
  const entry = byEnglish.get(normalizeEnglish(englishName))
  return entry && isSourceVerified(entry) ? entry.am : null
}

/** Review-flagged fallback for a source volume: used only when no database or verified name exists. */
export function flaggedAmharicForSourceName(englishName: string | null | undefined): string | null {
  if (!englishName) return null
  const entry = byEnglish.get(normalizeEnglish(englishName))
  return entry && !isSourceVerified(entry) ? entry.am : null
}

/** Authoritative Amharic name for a canonical book that has exactly one volume in the list. */
export function verifiedAmharicForCanonicalSlug(slug: string): string | null {
  const entries = bySlug.get(slug)
  return entries?.length === 1 && isSourceVerified(entries[0]) ? entries[0].am : null
}

/** Review-flagged fallback for a single-volume canonical book. */
export function flaggedAmharicForCanonicalSlug(slug: string): string | null {
  const entries = bySlug.get(slug)
  return entries?.length === 1 && !isSourceVerified(entries[0]) ? entries[0].am : null
}

/** Every verified Amharic and English name (and raw OCR spelling) that should find this canonical book in search. */
export function verifiedSearchNamesForSlug(slug: string): { am: string[]; en: string[] } {
  const entries = bySlug.get(slug) || []
  const am = new Set<string>()
  for (const entry of entries) {
    am.add(normalizeAmharic(entry.am))
    if (entry.ocr) am.add(normalizeAmharic(entry.ocr.replace(/^ብሌይ ኪዳን\s*\.?\s*/, '').replace(/[\s.።]+$/, '').replace(/^[\s.]+/, '')))
  }
  return { am: [...am], en: entries.map((entry) => entry.en) }
}
