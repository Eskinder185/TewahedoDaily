/**
 * Canonical mezmur classification taxonomy for public.mezmur
 * (language, form, category, occasion).
 */

export const CANONICAL_CATEGORIES = [
  'Jesus Christ',
  'Virgin Mary',
  'Holy Trinity',
  'Holy Spirit',
  'Kidus Michael',
  'Kidus Gabriel',
  'Kidus Raphael',
  'Kidus Uriel',
  'Kidus Giorgis',
  'Abune Tekle Haymanot',
  'Abune Gebre Menfes Kidus',
  'Kidus Yared',
  'Yohannes Metmek / John the Baptist',
  'Kidus Estifanos / Saint Stephen',
  'Apostles',
  'Martyrs',
  'Saints',
  'Angels',
  'Prophets',
  'Cross',
  'Repentance',
  'Praise / Worship',
  'Prayer',
  'Salvation',
  'General',
] as const

export const CANONICAL_OCCASIONS = [
  'Gena',
  'Timket',
  'Meskel',
  'Hosanna',
  'Siklet',
  'Tinsae',
  'Erget',
  'Pentecost',
  'Debre Tabor',
  'Filseta',
  'Kidane Mihret',
  'Lideta Maryam',
  'Abiy Tsom',
  'Tsome Nineveh',
  'Tsome Nebiyat',
  'Tsome Hawariat',
  'Holy Week',
  'New Year / Enkutatash',
  'Annual Saint Feast',
  'Wedding',
  'Baptism',
  'Funeral / Memorial',
  'Communion',
  'General / Anytime',
] as const

export type CanonicalCategory = (typeof CANONICAL_CATEGORIES)[number]
export type CanonicalOccasion = (typeof CANONICAL_OCCASIONS)[number]

/** Values that must never appear in public UI chrome. */
export function isNaClassification(value: string | null | undefined): boolean {
  if (value == null) return true
  const v = value.trim()
  if (!v) return true
  return v.toLowerCase() === 'na' || v.toLowerCase() === 'n/a' || v === '—' || v === '-'
}

export function displayClassification(value: string | null | undefined): string | null {
  if (isNaClassification(value)) return null
  return value!.trim()
}

function normKey(value: string): string {
  return value
    .trim()
    .toLowerCase()
    .replace(/[_/]+/g, ' ')
    .replace(/[-]+/g, ' ')
    .replace(/\s+/g, ' ')
}

/** Legacy / slug → canonical category. */
const CATEGORY_ALIASES: Record<string, CanonicalCategory> = {
  mary: 'Virgin Mary',
  'st mary': 'Virgin Mary',
  'st. mary': 'Virgin Mary',
  'virgin mary': 'Virgin Mary',
  emebetachin: 'Virgin Mary',
  christ: 'Jesus Christ',
  'jesus christ': 'Jesus Christ',
  trinity: 'Holy Trinity',
  'holy trinity': 'Holy Trinity',
  'holy spirit': 'Holy Spirit',
  angels: 'Angels',
  saints: 'Saints',
  apostles: 'Apostles',
  martyrs: 'Martyrs',
  prophets: 'Prophets',
  cross: 'Cross',
  repentance: 'Repentance',
  prayer: 'Prayer',
  salvation: 'Salvation',
  general: 'General',
  'general worship': 'Praise / Worship',
  'praise worship': 'Praise / Worship',
  'praise / worship': 'Praise / Worship',
  praise: 'Praise / Worship',
  worship: 'Praise / Worship',
  'st gabriel': 'Kidus Gabriel',
  'st. gabriel': 'Kidus Gabriel',
  'kidus gabriel': 'Kidus Gabriel',
  'qedus gebriel': 'Kidus Gabriel',
  'st michael': 'Kidus Michael',
  'st. michael': 'Kidus Michael',
  'kidus michael': 'Kidus Michael',
  'st uriel': 'Kidus Uriel',
  'st. uriel': 'Kidus Uriel',
  'kidus uriel': 'Kidus Uriel',
  'qedus urael': 'Kidus Uriel',
  'kidus raphael': 'Kidus Raphael',
  'st george': 'Kidus Giorgis',
  'st. george': 'Kidus Giorgis',
  'kidus giorgis': 'Kidus Giorgis',
  'qedus giorgis': 'Kidus Giorgis',
  'st tekle haymanot': 'Abune Tekle Haymanot',
  'abune teklehaymanot': 'Abune Tekle Haymanot',
  'abune tekle haymanot': 'Abune Tekle Haymanot',
  'abune gebre menfes kidus': 'Abune Gebre Menfes Kidus',
  'st yared': 'Kidus Yared',
  'kidus yared': 'Kidus Yared',
  'qedus yared': 'Kidus Yared',
  'st john the baptist': 'Yohannes Metmek / John the Baptist',
  'yohannes metmek / john the baptist': 'Yohannes Metmek / John the Baptist',
  'qedus yohannes metmik': 'Yohannes Metmek / John the Baptist',
  'kidus estifanos / saint stephen': 'Kidus Estifanos / Saint Stephen',
  'st stephen': 'Kidus Estifanos / Saint Stephen',
}

/** Legacy / slug → canonical occasion. */
const OCCASION_ALIASES: Record<string, CanonicalOccasion> = {
  fasika: 'Tinsae',
  'fasika / tinsae': 'Tinsae',
  'fasika tinsae': 'Tinsae',
  tinsae: 'Tinsae',
  pascha: 'Tinsae',
  easter: 'Tinsae',
  resurrection: 'Tinsae',
  gena: 'Gena',
  nativity: 'Gena',
  christmas: 'Gena',
  lidet: 'Gena',
  timket: 'Timket',
  epiphany: 'Timket',
  meskel: 'Meskel',
  hosanna: 'Hosanna',
  siklet: 'Siklet',
  erget: 'Erget',
  ascension: 'Erget',
  pentecost: 'Pentecost',
  'debre tabor': 'Debre Tabor',
  filseta: 'Filseta',
  'kidane mihret': 'Kidane Mihret',
  'kidane mehret': 'Kidane Mihret',
  'lideta maryam': 'Lideta Maryam',
  'lidet le maryam': 'Lideta Maryam',
  'lidet le-maryam': 'Lideta Maryam',
  'abiy tsom': 'Abiy Tsom',
  'tsome nineveh': 'Tsome Nineveh',
  nineveh: 'Tsome Nineveh',
  'tsome nebiyat': 'Tsome Nebiyat',
  'tsome hawariat': 'Tsome Hawariat',
  'tsome hawaryat': 'Tsome Hawariat',
  'holy week': 'Holy Week',
  'new year': 'New Year / Enkutatash',
  'new year / enkutatash': 'New Year / Enkutatash',
  enkutatash: 'New Year / Enkutatash',
  'annual saint feast': 'Annual Saint Feast',
  wedding: 'Wedding',
  baptism: 'Baptism',
  'funeral / memorial': 'Funeral / Memorial',
  funeral: 'Funeral / Memorial',
  memorial: 'Funeral / Memorial',
  communion: 'Communion',
  eucharist: 'Communion',
  'general / anytime': 'General / Anytime',
  'general worship': 'General / Anytime',
  general: 'General / Anytime',
  anytime: 'General / Anytime',
}

function resolveFromList<T extends string>(
  raw: string,
  canonical: readonly T[],
  aliases: Record<string, T>,
): T | null {
  const trimmed = raw.trim()
  if (!trimmed || isNaClassification(trimmed)) return null
  const exact = canonical.find((item) => item === trimmed)
  if (exact) return exact
  const key = normKey(trimmed)
  const byKey = canonical.find((item) => normKey(item) === key)
  if (byKey) return byKey
  return aliases[key] || null
}

export function canonicalizeCategory(raw: string | null | undefined): CanonicalCategory | null {
  if (!raw) return null
  return resolveFromList(raw, CANONICAL_CATEGORIES, CATEGORY_ALIASES)
}

export function canonicalizeOccasion(raw: string | null | undefined): CanonicalOccasion | null {
  if (!raw) return null
  return resolveFromList(raw, CANONICAL_OCCASIONS, OCCASION_ALIASES)
}

/** Values to match in Supabase for a selected filter (canonical + known legacy forms). */
export function categoryMatchValues(selected: string): string[] {
  const canonical = canonicalizeCategory(selected)
  if (!canonical) return []
  const set = new Set<string>([canonical])
  for (const [alias, target] of Object.entries(CATEGORY_ALIASES)) {
    if (target === canonical) {
      set.add(alias)
      // also title-ish variants already covered by exact canonical
    }
  }
  return [...set]
}

export function occasionMatchValues(selected: string): string[] {
  const canonical = canonicalizeOccasion(selected)
  if (!canonical) return []
  const set = new Set<string>([canonical])
  for (const [alias, target] of Object.entries(OCCASION_ALIASES)) {
    if (target === canonical) set.add(alias)
  }
  // common title-case legacy labels
  if (canonical === 'Tinsae') {
    set.add('Fasika')
    set.add('Fasika / Tinsae')
  }
  if (canonical === 'Lideta Maryam') {
    set.add('Lidet le-Maryam')
    set.add('Lidet le Maryam')
  }
  if (canonical === 'General / Anytime') {
    set.add('General Worship')
    set.add('general-worship')
  }
  return [...set]
}

export function categoryOptions(): { value: string; label: string }[] {
  return CANONICAL_CATEGORIES.map((value) => ({ value, label: value }))
}

export function occasionOptions(): { value: string; label: string }[] {
  return CANONICAL_OCCASIONS.map((value) => ({ value, label: value }))
}

/**
 * Deduplicate raw facet values into canonical labels in canonical order.
 * Drops NA / blanks / unknown leftovers (unknowns appended alphabetically at end if keepUnknown).
 */
export function normalizeFacetValues(
  values: (string | null | undefined)[],
  kind: 'category' | 'occasion',
  keepUnknown = false,
): { value: string; label: string }[] {
  const canonicalize = kind === 'category' ? canonicalizeCategory : canonicalizeOccasion
  const order = kind === 'category' ? CANONICAL_CATEGORIES : CANONICAL_OCCASIONS
  const seen = new Set<string>()
  const unknown: string[] = []

  for (const raw of values) {
    if (isNaClassification(raw)) continue
    const canonical = canonicalize(raw)
    if (canonical) {
      seen.add(canonical)
    } else if (keepUnknown && raw?.trim()) {
      unknown.push(raw.trim())
    }
  }

  const ordered = order.filter((item) => seen.has(item)).map((value) => ({ value, label: value }))
  if (!keepUnknown) return ordered

  const uniqUnknown = [...new Set(unknown.map((u) => u.trim()).filter(Boolean))]
    .filter((u) => !seen.has(u))
    .sort((a, b) => a.localeCompare(b))
    .map((value) => ({ value, label: value }))

  return [...ordered, ...uniqUnknown]
}
