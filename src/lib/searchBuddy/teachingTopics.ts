/**
 * Explicit church-teaching topics that may search Faith and Order.
 * This is a keyword/alias map, not a model classifier.
 */
import type {
  FaithAndOrderSearchHit,
  FaithAndOrderSearchResponse,
} from './faithAndOrderSearch.ts'
import { parseQuestion } from './questionParse.ts'

export const SEVEN_SACRAMENTS_PARAGRAPH_ID = 'p000165'
export const SEVEN_SACRAMENTS_TEXT =
  'There are seven sacraments: baptism, confirmation, penance, Holy Communion, function of the sick, matrimony, and holy orders.'

export type PassageRule = {
  paragraphId?: string
  exactText?: string
  sectionTitles?: readonly string[]
  textIncludes?: readonly string[]
  textExcludes?: readonly string[]
}

export type TeachingTopic = {
  id: string
  group?: 'sacrament' | 'pillar'
  /** Canonical English query sent to the English source document. */
  documentQuery: string
  aliases: readonly string[]
  /**
   * When set, a hit must match one rule before it is shown as the supporting
   * passage. Missing validation yields no passage, not the top keyword hit.
   */
  expected?: PassageRule | readonly PassageRule[]
}

export type SelectedPassage =
  | { kind: 'validated'; hit: FaithAndOrderSearchHit; topic: TeachingTopic }
  | { kind: 'related'; hit: FaithAndOrderSearchHit; topic: TeachingTopic }
  | { kind: 'none'; topic: TeachingTopic }

export const TEACHING_TOPICS: readonly TeachingTopic[] = [
  {
    id: 'seven-sacraments',
    documentQuery: 'seven sacraments',
    aliases: [
      'seven sacraments',
      '7 sacraments',
      'how many sacraments',
      'what are the sacraments',
      'what are the seven sacraments',
      'church sacraments',
      'sacraments of the church',
      'number of church sacraments',
      'sacraments',
      'ሰባት ምሥጢራት',
      'ሰባት ምስጢራት',
      'ሰባቱ ምሥጢራት',
      'ሰባቱ ምስጢራት',
      'ሰባት ሚስጢራት',
      'ሰባቱ ሚስጢራት',
    ],
    expected: {
      paragraphId: SEVEN_SACRAMENTS_PARAGRAPH_ID,
      exactText: SEVEN_SACRAMENTS_TEXT,
      textExcludes: ['Burial'],
    },
  },
  {
    id: 'infant-baptism',
    documentQuery: 'infant baptism',
    aliases: ['infant baptism', 'baptism of infants', 'baptism of infant'],
    expected: [
      { exactText: 'Baptism of Infants' },
      { textIncludes: ['male infants at the age of 40 days'] },
    ],
  },
  {
    id: 'baptism',
    documentQuery: 'baptism',
    aliases: ['what is baptism', 'baptism', 'ጥምቀት'],
    expected: {
      sectionTitles: ['THE MYSTERY OF BAPTISM', 'The Sacrament of Baptism', 'THE SACRAMENT OF BAPTISM'],
    },
  },
  {
    id: 'sacrament.baptism',
    group: 'sacrament',
    documentQuery: 'baptism',
    aliases: [
      'sacrament of baptism',
      'baptism',
      'ምሥጢረ ጥምቀት',
      'ምስጢረ ጥምቀት',
    ],
    expected: {
      sectionTitles: ['THE MYSTERY OF BAPTISM', 'The Sacrament of Baptism'],
    },
  },
  {
    id: 'sacrament.penance',
    group: 'sacrament',
    documentQuery: 'penance',
    aliases: ['sacrament of penance', 'penance', 'repentance', 'confession', 'ምሥጢረ ንስሓ', 'ንስሓ'],
    expected: { sectionTitles: ['THE SACRAMENT OF PENANCE'] },
  },
  {
    id: 'pillar.trinity',
    group: 'pillar',
    documentQuery: 'Trinity',
    aliases: [
      'mystery of the holy trinity',
      'mystery of the trinity',
      'holy trinity',
      'trinity',
      'ምሥጢረ ሥላሴ',
      'ምስጢረ ስላሴ',
      'ምሥጢረ ስላሴ',
    ],
    expected: { sectionTitles: ['THE MYSTERY OF THE HOLY TRINITY'] },
  },
  {
    id: 'sacrament.myron',
    group: 'sacrament',
    documentQuery: 'confirmation',
    aliases: ['sacrament of confirmation', 'confirmation', 'holy myron', 'chrismation', 'ምሥጢረ ሜሮን'],
    expected: { sectionTitles: ['THE SACRAMENT OF CONFIRMATION'] },
  },
  {
    id: 'sacrament.anointing',
    group: 'sacrament',
    documentQuery: 'function of the sick',
    aliases: [
      'sacrament of the function of the sick',
      'function of the sick',
      'unction of the sick',
      'anointing of the sick',
      'holy unction',
      'ምሥጢረ ቀንዲል',
    ],
    expected: { sectionTitles: ['THE SACRAMENT OF THE FUNCTION OF THE SICK'] },
  },
  {
    id: 'sacrament.communion',
    group: 'sacrament',
    documentQuery: 'Holy Communion',
    aliases: ['holy communion', 'eucharist', 'sacrament of communion', 'ምሥጢረ ቁርባን'],
    expected: { sectionTitles: ['THE SACRAMENT OF THE HOLY COMMUNION', 'THE SACRAMENT OF HOLY COMMUNION'] },
  },
  {
    id: 'holy-communion',
    documentQuery: 'Holy Communion',
    aliases: ['what is holy communion', 'communion'],
    expected: {
      sectionTitles: [
        'THE SACRAMENT OF THE HOLY COMMUNION',
        'THE SACRAMENT OF HOLY COMMUNION',
        'THE MYSTERY OF THE HOLY COMMUNION',
        'THE MYSTERY OF HOLY COMMUNION',
      ],
    },
  },
  {
    id: 'sacrament.matrimony',
    group: 'sacrament',
    documentQuery: 'matrimony',
    aliases: ['holy matrimony', 'sacrament of matrimony', 'matrimony', 'marriage', 'ምሥጢረ ተክሊል'],
    expected: { sectionTitles: ['THE SACRAMENT OF MATRIMONY', 'THE SACRAMENT OF HOLY MATRIMONY'] },
  },
  {
    id: 'sacrament.orders',
    group: 'sacrament',
    documentQuery: 'holy orders',
    aliases: ['sacrament of holy orders', 'holy orders', 'priesthood', 'ምሥጢረ ክህነት'],
    expected: { sectionTitles: ['THE SACRAMENT OF HOLY ORDERS', 'THE SACRAMENT OF THE HOLY ORDERS'] },
  },
  {
    id: 'five-pillars',
    group: 'pillar',
    documentQuery: 'five pillars of mystery',
    aliases: ['five pillars of mystery', 'five mysteries', 'አምስቱ አዕማደ ምሥጢር'],
    expected: { textIncludes: ['five'] },
  },
  {
    id: 'pillar.incarnation',
    group: 'pillar',
    documentQuery: 'Incarnation',
    aliases: ['mystery of the incarnation', 'incarnation', 'ምሥጢረ ሥጋዌ'],
    expected: { sectionTitles: ['THE MYSTERY OF THE INCARNATION', 'THE MYSTERY OF INCARNATION'] },
  },
  {
    id: 'pillar.baptism',
    group: 'pillar',
    documentQuery: 'baptism',
    aliases: ['mystery of baptism', 'baptism', 'ምሥጢረ ጥምቀት'],
    expected: { sectionTitles: ['THE MYSTERY OF BAPTISM'] },
  },
  {
    id: 'pillar.communion',
    group: 'pillar',
    documentQuery: 'Holy Communion',
    aliases: ['mystery of the holy communion', 'mystery of communion', 'ምሥጢረ ቁርባን'],
    expected: { sectionTitles: ['THE MYSTERY OF THE HOLY COMMUNION', 'THE MYSTERY OF HOLY COMMUNION'] },
  },
  {
    id: 'pillar.resurrection',
    group: 'pillar',
    documentQuery: 'resurrection of the dead',
    aliases: ['mystery of the resurrection of the dead', 'resurrection of the dead', 'ምሥጢረ ትንሣኤ ሙታን'],
    expected: { sectionTitles: ['THE MYSTERY OF THE RESURRECTION OF THE DEAD', 'THE MYSTERY OF RESURRECTION OF THE DEAD'] },
  },
]

function escapeRegExp(value: string): string {
  return value.replace(/[.*+?^${}()|[\]\\]/g, '\\$&')
}

/** Fold common spelling variants without translating the query. */
export function normalizeTeachingQuery(query: string): string {
  return (query || '')
    .normalize('NFKC')
    .replace(/\u1225/g, '\u1235')
    .replace(/ንስሐ/g, 'ንስሓ')
    .replace(/አእማደ/g, 'አዕማደ')
    .replace(/ቤተ\s*ክርስቲያን/g, 'ቤተ ክርስቲያን')
    .replace(/ጥምቃት/g, 'ጥምቀት')
    .replace(/ቃንዴል/g, 'ቀንዲል')
    .replace(/ሚስትራ?/g, 'ምስጢረ')
    .replace(/['’ʼ]/g, '')
    .replace(/\s+/g, ' ')
    .trim()
    .toLowerCase()
}

function aliasMatches(normalizedQuery: string, alias: string): boolean {
  const needle = normalizeTeachingQuery(alias)
  if (!needle) return false
  if (/[\u1200-\u137F]/.test(needle)) return normalizedQuery.includes(needle)
  return new RegExp(`(?:^|\\b)${escapeRegExp(needle)}(?:\\b|$)`).test(normalizedQuery)
}

function isWebsiteResourceQuery(query: string): boolean {
  const n = normalizeTeachingQuery(query)
  if (!n) return true
  if (/\b(hymn|hymns|mezmur|mezmurs|zemari|zemaris|singer|singers)\b/.test(n)) return true
  if (/(መዝሙር|ዘማሪ)/.test(query)) return true
  if (
    /^(go to|open|take me to|navigate to|show me)\b/.test(n) &&
    !/\b(sacrament|mystery|baptism|trinity|penance|confirmation|communion|matrimony)\b/.test(n)
  ) {
    return true
  }
  if (
    /\b(genesis|exodus|leviticus|numbers|deuteronomy|matthew|mark|luke|john|psalm|psalms|romans|acts)\s+\d+/i.test(
      n,
    )
  ) {
    return true
  }
  if (/\b(jn|mt|mk|lk)\s*\d+\s*:\s*\d+/i.test(n)) return true
  if (/(ዮሐንስ|ማቴዎስ|ማርቆስ|ሉቃስ)/.test(query) && /\d/.test(query)) return true
  return false
}

export function matchTeachingTopic(query: string): TeachingTopic | null {
  const n = normalizeTeachingQuery(query)
  if (!n) return null
  const pillarContext = /\b(five|pillars?)\b/.test(n) || /(አምስቱ|አዕማደ)/.test(n)
  const sacramentContext = /\b(seven|sacraments?)\b/.test(n) || /ሰባቱ/.test(n)
  const requiredGroup = pillarContext && !sacramentContext
    ? 'pillar'
    : sacramentContext && !pillarContext
      ? 'sacrament'
      : null
  let best: { topic: TeachingTopic; length: number } | null = null
  for (const topic of TEACHING_TOPICS) {
    if (requiredGroup && topic.group !== requiredGroup) continue
    for (const alias of topic.aliases) {
      if (!aliasMatches(n, alias)) continue
      const length = normalizeTeachingQuery(alias).length + (requiredGroup && topic.id.includes('.') ? 1000 : 0)
      if (!best || length > best.length) best = { topic, length }
    }
  }
  return best?.topic ?? null
}

/**
 * Document search runs only for mapped teaching questions.
 * Empty website results never enable it.
 */
export function shouldSearchFaithAndOrder(query: string): TeachingTopic | null {
  const domain = parseQuestion(query).domain
  if (
    domain === 'calendar' ||
    domain === 'hymn' ||
    domain === 'singer' ||
    domain === 'navigation' ||
    domain === 'bible' ||
    domain === 'prayer'
  ) {
    return null
  }
  if (isWebsiteResourceQuery(query)) return null
  return matchTeachingTopic(query)
}

function rulesFor(topic: TeachingTopic): PassageRule[] {
  const expected = topic.expected
  if (!expected) return []
  if (Array.isArray(expected)) return [...expected]
  return [expected as PassageRule]
}

export function hitMatchesRule(hit: FaithAndOrderSearchHit, rule: PassageRule): boolean {
  if (!hit?.text) return false
  if (rule.paragraphId && hit.id !== rule.paragraphId) return false
  if (rule.exactText && hit.text !== rule.exactText) return false
  if (rule.sectionTitles && !rule.sectionTitles.includes(hit.section_title)) return false
  if (rule.textIncludes && !rule.textIncludes.every((part) => hit.text.includes(part))) return false
  if (rule.textExcludes && rule.textExcludes.some((part) => hit.text.includes(part))) return false
  return true
}

function hitLooksRelated(hit: FaithAndOrderSearchHit, topic: TeachingTopic): boolean {
  if (hit.is_heading || !hit.text.trim()) return false
  const blob = normalizeTeachingQuery(`${hit.section_title} ${hit.text}`)
  return topic.aliases.some((alias) => {
    const needle = normalizeTeachingQuery(alias)
    return needle.length >= 5 && blob.includes(needle)
  })
}

export function selectFaithAndOrderPassage(
  topic: TeachingTopic,
  response: FaithAndOrderSearchResponse | null | undefined,
): SelectedPassage {
  if (!response || response.generated !== false || response.mode !== 'exact_document_search') {
    return { kind: 'none', topic }
  }
  const hits = Array.isArray(response.results) ? response.results : []
  const rules = rulesFor(topic)
  if (rules.length) {
    const matched = hits.filter(
      (hit) => !hit.is_heading && hit.text.trim() && rules.some((rule) => hitMatchesRule(hit, rule)),
    )
    if (!matched.length) return { kind: 'none', topic }
    return { kind: 'validated', hit: matched[0], topic }
  }
  const related = hits.find((hit) => hitLooksRelated(hit, topic))
  if (related) return { kind: 'related', hit: related, topic }
  return { kind: 'none', topic }
}
