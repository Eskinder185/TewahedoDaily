/**
 * Verified website/calendar entity aliases.
 * Aliases expand search and question matching. They never rewrite stored titles.
 */

export type CalendarEntityKind = 'saint' | 'feast' | 'fast' | 'season'

export type CalendarEntity = {
  key: string
  kind: CalendarEntityKind
  aliases: readonly string[]
  /** Monthly commemoration entry ids from the EOTC dataset. */
  monthlyIds: readonly string[]
  /** Distinct annual observances for the same entity. */
  annualIds: readonly string[]
  feastIds: readonly string[]
  fastIds: readonly string[]
  seasonIds: readonly string[]
}

export type EntityMatchKind = 'exact' | 'alias' | 'fuzzy'

export type EntityMatch = {
  entity: CalendarEntity
  kind: EntityMatchKind
  alias: string
}

/** Meaning-bearing words that must survive normalization. */
export const QUESTION_MEANING_WORDS = [
  'next',
  'today',
  'tomorrow',
  'monthly',
  'annual',
  'yearly',
  'start',
  'end',
  'current',
  'not',
  'no',
  'coming',
  'upcoming',
] as const

const HONORIFIC_RE =
  /\b(saints?|st\.?|holy|kidus|kidist)\b|ቅዱሳን|ቅዱስ|ቅድስት/gi

export const CALENDAR_ENTITIES: readonly CalendarEntity[] = [
  {
    key: 'michael',
    kind: 'saint',
    aliases: ['michael', 'micheal', 'mikael', 'mikail', 'ሚካኤል', 'kidus mikael'],
    monthlyIds: ['saint-michael-monthly-12'],
    annualIds: ['saint-michael-major', 'saint-michael-sene-12'],
    feastIds: [],
    fastIds: [],
    seasonIds: [],
  },
  {
    key: 'gabriel',
    kind: 'saint',
    aliases: ['gabriel', 'gebriel', 'ገብርኤል'],
    monthlyIds: ['saint-gabriel-monthly-19'],
    annualIds: ['saint-gabriel-major'],
    feastIds: [],
    fastIds: [],
    seasonIds: [],
  },
  {
    key: 'raphael',
    kind: 'saint',
    aliases: ['raphael', 'rafael', 'ራፋኤል'],
    monthlyIds: ['saint-raphael-monthly-13'],
    annualIds: ['saint-raphael-major'],
    feastIds: [],
    fastIds: [],
    seasonIds: [],
  },
  {
    key: 'uriel',
    kind: 'saint',
    aliases: ['uriel', 'ዑራኤል'],
    monthlyIds: ['saint-uriel-monthly-22'],
    annualIds: ['saint-uriel-major'],
    feastIds: [],
    fastIds: [],
    seasonIds: [],
  },
  {
    key: 'mary',
    kind: 'saint',
    aliases: ['mary', 'mariam', 'st mary', 'saint mary', 'theotokos', 'ማርያም', 'ፍልሰታ', 'filseta'],
    monthlyIds: ['saint-mary-monthly-21', 'kidane-mihret-monthly-16'],
    annualIds: [
      'kidane-mehret',
      'lideta-maryam',
      'baeta-maryam',
      'asterio-maryam',
      'filseta-assumption',
    ],
    feastIds: [],
    fastIds: ['tsome-filseta'],
    seasonIds: [],
  },
  {
    key: 'george',
    kind: 'saint',
    aliases: ['george', 'georgios', 'ጊዮርጊስ'],
    monthlyIds: ['saint-george-monthly-23'],
    annualIds: ['saint-george-major'],
    feastIds: [],
    fastIds: [],
    seasonIds: [],
  },
  {
    key: 'tekle-haymanot',
    kind: 'saint',
    aliases: ['tekle haymanot', 'teklehaymanot', 'ተክለ ሃይማኖት', 'ተክለሃይማኖት'],
    monthlyIds: ['saint-tekle-haymanot-monthly-24'],
    annualIds: ['saint-tekle-haymanot-major'],
    feastIds: [],
    fastIds: [],
    seasonIds: [],
  },
  {
    key: 'john-the-baptist',
    kind: 'saint',
    aliases: ['john the baptist', 'john baptist', 'መጥምቅ'],
    monthlyIds: [],
    annualIds: ['saint-john-the-baptist'],
    feastIds: [],
    fastIds: [],
    seasonIds: [],
  },
  {
    key: 'stephen',
    kind: 'saint',
    aliases: ['stephen', 'estifanos', 'እስጢፋኖስ'],
    monthlyIds: [],
    annualIds: ['saint-stephen-major'],
    feastIds: [],
    fastIds: [],
    seasonIds: [],
  },
  {
    key: 'yared',
    kind: 'saint',
    aliases: ['yared', 'ያሬድ'],
    monthlyIds: [],
    annualIds: ['saint-yared-major'],
    feastIds: [],
    fastIds: [],
    seasonIds: [],
  },
  {
    key: 'meskel',
    kind: 'feast',
    aliases: ['meskel', 'meskal', 'meskle', 'true cross', 'መስቀል'],
    monthlyIds: [],
    annualIds: ['meskel-finding-of-the-true-cross', 'megabit-meskel'],
    feastIds: ['meskel-finding-of-the-true-cross', 'megabit-meskel'],
    fastIds: [],
    seasonIds: [],
  },
  {
    key: 'timket',
    kind: 'feast',
    aliases: ['timket', 'timkat', 'epiphany', 'ጥምቀት በዓል', 'ጥምቀት'],
    monthlyIds: [],
    annualIds: ['timket'],
    feastIds: ['timket'],
    fastIds: [],
    seasonIds: [],
  },
  {
    key: 'gena',
    kind: 'feast',
    aliases: ['gena', 'christmas', 'nativity', 'lidet', 'ልደት'],
    monthlyIds: ['christ-nativity-monthly-29'],
    annualIds: ['lidet-gena'],
    feastIds: ['lidet-gena'],
    fastIds: [],
    seasonIds: [],
  },
  {
    key: 'prophets-fast',
    kind: 'fast',
    aliases: [
      'prophets fast',
      'fast of the prophets',
      'advent fast',
      'tsome nebiyat',
      'ጾመ ነቢያት',
    ],
    monthlyIds: [],
    annualIds: [],
    feastIds: [],
    fastIds: ['tsome-nebiyat'],
    seasonIds: [],
  },
  {
    key: 'apostles-fast',
    kind: 'fast',
    aliases: ['apostles fast', 'fast of the apostles', 'tsome hawariat', 'ጾመ ሐዋርያት'],
    monthlyIds: [],
    annualIds: [],
    feastIds: [],
    fastIds: ['apostles-fast'],
    seasonIds: [],
  },
  {
    key: 'dormition-fast',
    kind: 'fast',
    aliases: ['dormition fast', 'filseta fast', 'tsome filseta', 'ጾመ ፍልሰታ'],
    monthlyIds: [],
    annualIds: [],
    feastIds: [],
    fastIds: ['tsome-filseta'],
    seasonIds: [],
  },
  {
    key: 'great-lent',
    kind: 'fast',
    aliases: ['great lent', 'abiy tsom', 'hudadi', 'ዓቢይ ጾም', 'ሁዳዴ'],
    monthlyIds: [],
    annualIds: [],
    feastIds: [],
    fastIds: ['abiy-tsom'],
    seasonIds: [],
  },
  {
    key: 'nineveh-fast',
    kind: 'fast',
    aliases: ['nineveh', 'fast of nineveh', 'tsome nenewe', 'ጾመ ነነዌ'],
    monthlyIds: [],
    annualIds: [],
    feastIds: [],
    fastIds: ['nineveh-fast'],
    seasonIds: [],
  },
  {
    key: 'vigil-fast',
    kind: 'fast',
    aliases: ['tsome gehad', 'gehad', 'vigil fast', 'ጾመ ገሃድ'],
    monthlyIds: [],
    annualIds: [],
    feastIds: [],
    fastIds: ['tsome-gehad'],
    seasonIds: [],
  },
  {
    key: 'zemene-tsige',
    kind: 'season',
    aliases: ['season of flowers', 'zemene tsige', 'ዘመነ ጽጌ'],
    monthlyIds: [],
    annualIds: [],
    feastIds: [],
    fastIds: [],
    seasonIds: ['zemene-tsige'],
  },
]

function escapeRegExp(value: string): string {
  return value.replace(/[.*+?^${}()|[\]\\]/g, '\\$&')
}

export function stripHonorifics(value: string): string {
  return value.replace(HONORIFIC_RE, ' ').replace(/\s+/g, ' ').trim()
}

function aliasNeedle(alias: string): string {
  return stripHonorifics(alias).replace(/\s+/g, ' ').trim()
}

function phraseMatches(hay: string, alias: string): boolean {
  const needle = aliasNeedle(alias)
  if (!needle) return false
  if (/[\u1200-\u137F]/.test(needle)) return hay.includes(needle)
  return new RegExp(`(?:^|\\b)${escapeRegExp(needle)}(?:\\b|$)`, 'i').test(hay)
}

function levenshtein(a: string, b: string): number {
  if (a === b) return 0
  if (!a.length) return b.length
  if (!b.length) return a.length
  const row = Array.from({ length: b.length + 1 }, (_, i) => i)
  for (let i = 1; i <= a.length; i += 1) {
    let prev = i - 1
    row[0] = i
    for (let j = 1; j <= b.length; j += 1) {
      const cur = row[j]
      const cost = a[i - 1] === b[j - 1] ? 0 : 1
      row[j] = Math.min(row[j] + 1, row[j - 1] + 1, prev + cost)
      prev = cur
    }
  }
  return row[b.length]
}

/**
 * Prefer exact names, then curated aliases, then conservative single-edit fuzzy
 * matches against known Latin aliases. Never silently pick among several fuzzy hits.
 */
export function matchCalendarEntities(normalizedQuery: string): EntityMatch[] {
  const hay = stripHonorifics(normalizedQuery).replace(/\s+/g, ' ').trim()
  if (!hay) return []
  const hits: EntityMatch[] = []
  for (const entity of CALENDAR_ENTITIES) {
    let best: EntityMatch | null = null
    for (const alias of entity.aliases) {
      if (!phraseMatches(hay, alias) && !phraseMatches(normalizedQuery, alias)) continue
      const needle = aliasNeedle(alias)
      const kind: EntityMatchKind =
        needle === hay || hay === entity.key ? 'exact' : 'alias'
      if (!best || (kind === 'exact' && best.kind !== 'exact') || needle.length > best.alias.length) {
        best = { entity, kind, alias: needle }
      }
    }
    if (best) hits.push(best)
  }
  if (hits.length) {
    hits.sort((a, b) => b.alias.length - a.alias.length)
    return hits
  }

  const tokens = hay.split(/\s+/).filter((t) => t.length >= 5 && !/[\u1200-\u137F]/.test(t))
  const fuzzy: EntityMatch[] = []
  for (const token of tokens) {
    for (const entity of CALENDAR_ENTITIES) {
      for (const alias of entity.aliases) {
        const needle = aliasNeedle(alias)
        if (!needle || /[\u1200-\u137F]/.test(needle) || needle.includes(' ')) continue
        if (needle.length < 5) continue
        if (levenshtein(token, needle) === 1) {
          fuzzy.push({ entity, kind: 'fuzzy', alias: needle })
          break
        }
      }
    }
  }
  const seen = new Set<string>()
  return fuzzy.filter((row) => {
    if (seen.has(row.entity.key)) return false
    seen.add(row.entity.key)
    return true
  })
}

export function entityCatalogIds(entity: CalendarEntity): string[] {
  return [...new Set([...entity.monthlyIds, ...entity.annualIds, ...entity.feastIds, ...entity.fastIds, ...entity.seasonIds])]
}

/** Extra search tokens for website ranking — does not replace the original query. */
export function aliasExpansionTokens(query: string): string[] {
  const matches = matchCalendarEntities(query)
  const extras: string[] = []
  for (const hit of matches) {
    extras.push(...hit.entity.aliases)
  }
  return [...new Set(extras)]
}
