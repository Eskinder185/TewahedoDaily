/**
 * Lyrics-only Mezmur classifier for the canonical 25 categories / 24 occasions.
 *
 * Evidence = lyrics only (Amharic, Ge'ez, English; Oromo/transliteration only
 * when no Ethiopic lyrics exist). Titles, YouTube data, singer names and
 * existing classifications are never used.
 *
 * A Mezmur may receive several categories and several occasions. Results are
 * proposals for review — this module never writes to the database.
 */
import { CANONICAL_CATEGORIES, type CanonicalCategory, type CanonicalOccasion } from '../publicContent/taxonomy'
import {
  findAliasHits,
  isEthiopic,
  normalizeEthiopicForMatch,
  normalizeLatinForMatch,
  type AliasHit,
} from './aliasMatcher'
import { CATEGORY_ENTRIES, OCCASION_ENTRIES, entryByCanonical } from './taxonomyAliases'

export interface LyricsClassificationInput {
  import_id?: string
  lyrics_amharic?: string | null
  lyrics_geez?: string | null
  lyrics_english?: string | null
  lyrics_oromo?: string | null
  lyrics_transliteration?: string | null
}

export type Confidence = 'HIGH' | 'MEDIUM' | 'LOW'

export interface MatchedAlias {
  canonical: string
  kind: 'category' | 'occasion'
  alias: string
  count: number
  strength: number
  ambiguous: boolean
}

export interface LyricsClassificationResult {
  import_id?: string
  primaryCategory: CanonicalCategory | null
  additionalCategories: CanonicalCategory[]
  primaryOccasion: CanonicalOccasion
  additionalOccasions: CanonicalOccasion[]
  /** Browse sections (hymn_browse_groups slugs) implied by the assignments. */
  hymnSections: string[]
  confidence: Confidence
  reviewRequired: boolean
  reviewReasons: string[]
  matchedAliases: MatchedAlias[]
  excerpts: string[]
  explanation: string
  scores: Record<string, number>
}

const PERSON = new Set(CATEGORY_ENTRIES.filter((e) => e.group === 'person').map((e) => e.canonical))
const THEME = new Set(CATEGORY_ENTRIES.filter((e) => e.group === 'theme').map((e) => e.canonical))
const NAMED = new Set([
  'Kidus Michael', 'Kidus Gabriel', 'Kidus Raphael', 'Kidus Uriel', 'Kidus Giorgis', 'Abune Tekle Haymanot',
  'Abune Gebre Menfes Kidus', 'Kidus Yared', 'Yohannes Metmek / John the Baptist', 'Kidus Estifanos / Saint Stephen',
])
const CHRIST_FEASTS = new Set(['Gena', 'Timket', 'Hosanna', 'Siklet', 'Tinsae', 'Erget', 'Debre Tabor', 'Holy Week'])
const MARIAN_FEASTS = new Set(['Filseta', 'Kidane Mihret', 'Lideta Maryam'])
const MAX_ALIAS_COUNT = 4

const TIGRINYA_TOKENS = /(?:^|\s)(?:ኣብ|ናይ|ናብ|ንሱ|እቲ|ኣነ|ካብ|ኢኻ|ኢና|ኢዩ|እዩ|ብዘይ|ይኹን|ንዑ|ኩሉ|ኣምላኽ\S*|ጎይታ\S*|ብኣኻ|ንዓና)(?=\s|$|\/)/g
const OROMO_TOKENS = /ፈኖ|ዋቀዮ|ኬኛ|ኢፋ|ጎፍታ|ዋቃ|ኒማቲ|ጀዋማ|waaqayyo|gooftaa|faarfannaa|yesuus/gi

interface Tally {
  score: number
  strongScore: number
  aliases: Map<string, MatchedAlias>
  lineScores: Map<number, number>
}

function emptyTally(): Tally {
  return { score: 0, strongScore: 0, aliases: new Map(), lineScores: new Map() }
}

function lyricLines(input: LyricsClassificationInput): string[] {
  const hasEthiopic = [input.lyrics_amharic, input.lyrics_geez].some((t) => t && isEthiopic(t))
  const parts = [input.lyrics_amharic, input.lyrics_geez, input.lyrics_english]
  if (!hasEthiopic && !(input.lyrics_english || '').trim()) parts.push(input.lyrics_oromo, input.lyrics_transliteration)
  return parts
    .filter((p): p is string => Boolean(p && p.trim()))
    .join('\n')
    .split(/\r?\n/)
    .map((l) => l.trim())
    .filter((l) => l && !/^(?:VERSE|CHORUS|አዝ)\b[\s\d:.\-/]*$/i.test(l))
}

export function classifyMezmurLyrics(input: LyricsClassificationInput): LyricsClassificationResult {
  const lines = lyricLines(input)
  const fullText = lines.join('\n')
  const reviewReasons: string[] = []

  const empty = (reason: string, explanation: string): LyricsClassificationResult => ({
    import_id: input.import_id,
    primaryCategory: null,
    additionalCategories: [],
    primaryOccasion: 'General / Anytime',
    additionalOccasions: [],
    hymnSections: [],
    confidence: 'LOW',
    reviewRequired: true,
    reviewReasons: [reason],
    matchedAliases: [],
    excerpts: [],
    explanation,
    scores: {},
  })

  if (!lines.length) return empty('no_lyrics', 'No lyrics in the row, so it cannot be classified from lyrics.')
  if (fullText.replace(/\s/g, '').length < 20) return empty('too_short', 'Lyrics are too short to classify.')

  const ethLines = lines.map(normalizeEthiopicForMatch)
  const latLines = lines.map(normalizeLatinForMatch)
  const hits = findAliasHits(ethLines, latLines)

  // refrain weighting: a line repeated in the hymn counts once more (capped)
  const lineRepeat = new Map<string, number>()
  for (const l of ethLines) lineRepeat.set(l, (lineRepeat.get(l) || 0) + 1)

  const tallies = new Map<string, Tally>()
  const tallyOf = (kind: string, canonical: string) => {
    const key = `${kind}|${canonical}`
    let t = tallies.get(key)
    if (!t) tallies.set(key, (t = emptyTally()))
    return t
  }
  const perAliasCount = new Map<string, number>()
  for (const h of hits) {
    const a = h.compiled.alias
    const id = `${a.kind}|${a.canonical}|${a.alias}`
    const n = (perAliasCount.get(id) || 0) + 1
    perAliasCount.set(id, n)
    const t = tallyOf(a.kind, a.canonical)
    const rec = t.aliases.get(a.alias) || { canonical: a.canonical, kind: a.kind, alias: a.alias, count: 0, strength: a.strength, ambiguous: a.ambiguous }
    rec.count++
    t.aliases.set(a.alias, rec)
    if (n > MAX_ALIAS_COUNT) continue
    t.score += a.strength
    if (!a.ambiguous) t.strongScore += a.strength
    t.lineScores.set(h.lineIndex, (t.lineScores.get(h.lineIndex) || 0) + a.strength)
  }

  const cat = (c: string) => tallies.get(`category|${c}`) || emptyTally()
  const occ = (o: string) => tallies.get(`occasion|${o}`) || emptyTally()
  const has = (kind: 'category' | 'occasion', c: string, alias: string) => tallies.get(`${kind}|${c}`)?.aliases.has(alias) ?? false
  const ctxChrist = cat('Jesus Christ').strongScore > 0
  const ctxMary = cat('Virgin Mary').strongScore > 0
  const ctxBaptist = cat('Yohannes Metmek / John the Baptist').strongScore > 0

  // --- context rules for ambiguous evidence -------------------------------
  const promote = (t: Tally, aliases: string[]) => {
    for (const al of aliases) {
      const rec = t.aliases.get(al)
      if (rec) t.strongScore += rec.strength * Math.min(rec.count, MAX_ALIAS_COUNT)
    }
  }
  // Mary's imagery counts when Mary is clearly present
  if (ctxMary) promote(cat('Virgin Mary'), ['ጽዮን', 'ንዒ', 'ርግብየ', 'እናታችን', 'እናቴ'])
  // Hymns addressed to "you" (feminine: -ሽ, -ሽን, -ሽው, -ኪ) are, in this repertoire, addressed to the Virgin
  if (cat('Virgin Mary').score > 0) {
    const fem = /[\u1200-\u137F]{2,}(?:ሽ|ሽን|ሽም|ሽው|ሽና|ኪ)(?![\u1200-\u137F])/u
    const mary = cat('Virgin Mary')
    let femLines = 0
    lines.forEach((l, i) => {
      if (fem.test(l) && femLines < 6) {
        femLines++
        mary.lineScores.set(i, (mary.lineScores.get(i) || 0) + 1)
      }
    })
    if (femLines >= 3) mary.strongScore += Math.max(mary.strongScore === 0 ? 0 : 2 * femLines, 0)
  }
  if (ctxChrist || ctxMary) promote(cat('Jesus Christ'), ['ልጅሽ', 'ወልድኪ', 'ወልዳ'])
  // ዮሐንስ = Baptist only with Baptist context (Jordan, baptizing, Herodias…)
  const jordanCtx = has('occasion', 'Timket', 'ዮርዳኖስ') || has('occasion', 'Timket', 'ተጠመቀ') || has('occasion', 'Timket', 'jordan')
  if (ctxBaptist || jordanCtx) promote(cat('Yohannes Metmek / John the Baptist'), ['ዮሐንስ'])
  // Births: Gena needs Christ context; Lideta needs Mary context
  if (ctxChrist) promote(occ('Gena'), ['ተወለደ', 'ሲወለድ', 'ዮሴፍ'])
  // Rising: Tinsae needs Christ context; ትንሣኤ alone may be the general resurrection
  if (ctxChrist) promote(occ('Tinsae'), ['ተነሣ', 'ተነሳ', 'ትንሣኤ', 'ትንሳኤ', 'resurrection', 'risen'])
  // ጥምቀት: Timket with Christ/John/Jordan context; sacramental Baptism with christening context
  const tim = occ('Timket')
  const bap = occ('Baptism')
  if (tim.aliases.has('ጥምቀት') || tim.aliases.has('was baptized') || bap.aliases.has('baptism') || bap.aliases.has('baptized')) {
    if (bap.strongScore > 0) {
      promote(bap, ['baptism', 'baptized', 'baptised', 'ክርስትና', 'ዳግም ተወለድን'])
    } else if (ctxChrist || ctxBaptist || jordanCtx) {
      promote(tim, ['ጥምቀት', 'was baptized', 'was baptised'])
    } else {
      reviewReasons.push('baptism_ambiguous')
    }
  }
  // Wedding: bride/groom words count only alongside a clear wedding term
  if (occ('Wedding').strongScore > 0) promote(occ('Wedding'), ['ሙሽራ', 'ሙሽራው', 'ሙሽራዋ', 'ሙሽሪት', 'ሙሽራይቱ', 'bride', 'bridegroom'])
  // Fasting words count for Abiy Tsom only with a Lent-specific term
  if (occ('Abiy Tsom').strongScore > 0) promote(occ('Abiy Tsom'), ['ጾም', 'አርባ ቀን'])
  // Lideta: ሐና only with Mary present
  if (ctxMary) promote(occ('Lideta Maryam'), ['ሐና'])
  // A saint's feast day needs a named saint / saints in the hymn
  const saintPresent = [...NAMED, 'Saints', 'Martyrs', 'Angels'].some((c) => cat(c).strongScore >= 5)
  if (!saintPresent) {
    const asf = occ('Annual Saint Feast')
    asf.strongScore = 0
  } else {
    promote(occ('Annual Saint Feast'), ['ንግሥ'])
  }
  // Kidane Mihret is also a common Marian title; as an occasion it needs repetition
  const km = occ('Kidane Mihret')
  if (km.strongScore > 0 && km.strongScore < 9) km.strongScore = 0

  // --- category selection -------------------------------------------------
  const catScores: Array<[CanonicalCategory, number]> = CANONICAL_CATEGORIES.filter((c) => c !== 'General').map(
    (c) => [c, cat(c).strongScore] as [CanonicalCategory, number],
  )
  const persons = catScores.filter(([c, s]) => PERSON.has(c) && s >= 4).sort((a, b) => b[1] - a[1])
  const themes = catScores.filter(([c, s]) => THEME.has(c) && s >= 4).sort((a, b) => b[1] - a[1])
  const totalPerson = persons.reduce((n, [, s]) => n + s, 0)
  const godScore = cat('General').score

  const GENERIC_GROUPS = ['Angels', 'Saints', 'Martyrs', 'Apostles', 'Prophets']
  const isSubject = (c: string, s: number) => {
    const lineCount = cat(c).lineScores.size
    // in a longer hymn, one line naming a person is a mention, not a subject
    if (lines.length >= 8 && lineCount < 2 && s < 8) return false
    if (!NAMED.has(c) && !GENERIC_GROUPS.includes(c)) return true
    // a mention does not make a saint the subject: needs repetition or a large share
    const t = cat(c)
    const distinctLines = t.lineScores.size
    return s >= 9 || distinctLines >= 2 || s >= 0.45 * totalPerson
  }

  let primary: CanonicalCategory | null = null
  let primaryWhy = ''
  const subjectPersons = persons.filter(([c, s]) => isSubject(c, s))
  // named saints/angels take precedence over generic groups and over passing mentions of Christ/Mary
  const namedTop = subjectPersons.find(([c]) => NAMED.has(c))
  const topPerson = subjectPersons[0]
  if (namedTop && (namedTop[1] >= 0.6 * (topPerson?.[1] || 0) || namedTop[1] >= 12)) {
    primary = namedTop[0]
    primaryWhy = 'named'
  } else if (topPerson) {
    // a generic group (Angels, Saints…) does not outrank Christ or the Virgin Mary when they are present
    if (GENERIC_GROUPS.includes(topPerson[0])) {
      const core = subjectPersons.find(([c, s]) => (c === 'Jesus Christ' || c === 'Virgin Mary') && s >= 0.5 * topPerson[1])
      if (core) subjectPersons.unshift(subjectPersons.splice(subjectPersons.indexOf(core), 1)[0])
    }
  }
  const leadPerson = subjectPersons[0]
  if (primary) {
    // named saint already chosen
  } else if (leadPerson) {
    const topPerson = leadPerson
    const topTheme = themes[0]
    if (topTheme && topTheme[1] >= 2 * topPerson[1] && topTheme[1] >= 9) {
      primary = topTheme[0]
      primaryWhy = 'theme'
    } else {
      primary = topPerson[0]
      primaryWhy = 'person'
    }
  } else if (themes[0]) {
    primary = themes[0][0]
    primaryWhy = 'theme'
  }

  // --- occasions ----------------------------------------------------------
  // a single feast-defining word (strength 5, not a place name or ambiguous) is enough even in a long hymn
  const strongEvent = (o: string) => [...occ(o).aliases.values()].some((m) => m.strength >= 5 && !m.ambiguous)
  const occCandidates = OCCASION_ENTRIES.filter((e) => e.canonical !== 'General / Anytime')
    .map((e) => [e.canonical as CanonicalOccasion, occ(e.canonical).strongScore] as [CanonicalOccasion, number])
    // in a longer hymn a single passing mention (e.g. a metaphor) does not establish the occasion
    .filter(([o, s]) => s >= 5 && (lines.length < 8 || s >= 8 || occ(o).lineScores.size >= 2 || strongEvent(o)))
    .sort((a, b) => b[1] - a[1])
  // Meskel requires feast-specific evidence (Cross alone is not enough — handled by searchOnly alias)
  const occasions = occCandidates.slice(0, 4).map(([o]) => o)

  // a hymn describing a feast of Christ is about Christ unless a theme clearly dominates
  if (primary && THEME.has(primary) && cat(primary).strongScore < 12 && occasions.some((o) => CHRIST_FEASTS.has(o)) && (ctxChrist || godScore >= 1)) {
    primary = 'Jesus Christ'
    primaryWhy = 'feast'
  }
  if (!primary) {
    const feast = occasions.find((o) => CHRIST_FEASTS.has(o))
    const marian = occasions.find((o) => MARIAN_FEASTS.has(o))
    if (feast) { primary = 'Jesus Christ'; primaryWhy = 'feast' }
    else if (marian) { primary = 'Virgin Mary'; primaryWhy = 'feast' }
    else if (occasions.includes('Meskel')) { primary = 'Cross'; primaryWhy = 'feast' }
    else if (occasions.includes('Pentecost')) { primary = 'Holy Spirit'; primaryWhy = 'feast' }
    else if (persons[0]) { primary = persons[0][0]; primaryWhy = 'weak' }
    else if (occasions.length || godScore >= 2) { primary = 'General'; primaryWhy = 'general' }
  }

  // additional categories: every other well-evidenced category (multiple allowed)
  const primaryScore = primary ? cat(primary).strongScore : 0
  const additional = catScores
    // additional categories need evidence on ≥ 2 lines (or a strong score): one passing mention is not enough
    .filter(([c, s]) => c !== primary && s >= 4 && isSubject(c, s) && (cat(c).lineScores.size >= 2 || s >= 9) && (s >= 0.25 * primaryScore || s >= 8))
    .sort((a, b) => b[1] - a[1])
    .slice(0, 4)
    .map(([c]) => c)
  // generic groups are redundant next to a named angel / saint that outweighs them
  const ARCHANGELS = ['Kidus Michael', 'Kidus Gabriel', 'Kidus Raphael', 'Kidus Uriel']
  const namedIn = [primary, ...additional].filter((c): c is CanonicalCategory => Boolean(c && NAMED.has(c)))
  const namedMax = Math.max(0, ...namedIn.map((c) => cat(c).strongScore))
  for (const g of ['Angels', 'Saints', 'Martyrs'] as CanonicalCategory[]) {
    const i = additional.indexOf(g)
    if (i < 0) continue
    const relevant = g === 'Angels' ? namedIn.some((c) => ARCHANGELS.includes(c)) : namedIn.some((c) => !ARCHANGELS.includes(c))
    if (relevant && cat(g).strongScore <= namedMax) additional.splice(i, 1)
  }
  // a feast of Christ implies Christ; Marian feast implies Mary
  if (primary !== 'Jesus Christ' && !additional.includes('Jesus Christ') && occasions.some((o) => CHRIST_FEASTS.has(o)) && ctxChrist) additional.push('Jesus Christ')
  if (primary !== 'Virgin Mary' && !additional.includes('Virgin Mary') && occasions.some((o) => MARIAN_FEASTS.has(o)) && ctxMary) additional.push('Virgin Mary')

  // --- confidence & review ------------------------------------------------
  const nonEmptyLines = lines.length
  const competitor = Math.max(0, ...catScores.filter(([c]) => c !== primary && PERSON.has(c)).map(([, s]) => s))
  let confidence: Confidence = 'LOW'
  if (primary && primaryWhy !== 'general' && primaryWhy !== 'feast') {
    if (primaryScore >= 10 && primaryScore >= 1.5 * competitor && nonEmptyLines >= 4) confidence = 'HIGH'
    else if (primaryScore >= 5) confidence = 'MEDIUM'
  } else if (primaryWhy === 'feast') {
    confidence = 'MEDIUM'
  } else if (primaryWhy === 'general') {
    confidence = godScore >= 4 && nonEmptyLines >= 4 ? 'MEDIUM' : 'LOW'
  } else if (primaryWhy === 'weak') {
    confidence = 'LOW'
    reviewReasons.push('single_mention')
  }
  if (!primary) reviewReasons.push('no_clear_subject')
  if (nonEmptyLines < 3) { reviewReasons.push('very_short'); if (confidence === 'HIGH') confidence = 'MEDIUM' }
  if (primary && PERSON.has(primary) && competitor >= 0.85 * primaryScore && competitor >= 5) reviewReasons.push('competing_subjects')
  const tig = (fullText.match(TIGRINYA_TOKENS) || []).length
  const oro = (fullText.match(OROMO_TOKENS) || []).length
  if (tig >= 5) { reviewReasons.push('language_tigrinya'); confidence = 'LOW' }
  if (oro >= 3) { reviewReasons.push('language_oromo'); confidence = 'LOW' }
  if (confidence === 'LOW' && !reviewReasons.includes('low_confidence')) reviewReasons.push('low_confidence')

  // --- evidence -----------------------------------------------------------
  const bestLine = (t: Tally) => {
    let best = -1, bestScore = 0
    for (const [i, s] of t.lineScores) if (s > bestScore) { best = i; bestScore = s }
    return best
  }
  const excerpts: string[] = []
  if (primary && primary !== 'General') {
    const i = bestLine(cat(primary))
    if (i >= 0) excerpts.push(lines[i])
  }
  if (occasions[0]) {
    const i = bestLine(occ(occasions[0]))
    if (i >= 0 && !excerpts.includes(lines[i])) excerpts.push(lines[i])
  }
  if (!excerpts.length && primary === 'General') {
    const i = bestLine(cat('General'))
    if (i >= 0) excerpts.push(lines[i])
  }

  const used = new Set<string>([primary || '', ...additional, ...occasions])
  const allMatched = [...tallies.values()].flatMap((t) => [...t.aliases.values()])
  const usedMatched = allMatched.filter((m) => used.has(m.canonical))
  // when nothing was assigned, still show what was found so a reviewer can decide
  const matchedAliases = (usedMatched.length ? usedMatched : allMatched.filter((m) => m.canonical !== 'General'))
    .sort((a, b) => b.strength * b.count - a.strength * a.count)

  const fmt = (c: string, kind: 'category' | 'occasion') => {
    const t = tallies.get(`${kind}|${c}`)
    if (!t) return c
    const top = [...t.aliases.values()].filter((m) => !m.ambiguous || t.strongScore > 0).sort((a, b) => b.count * b.strength - a.count * a.strength).slice(0, 3)
    return `${c} (${top.map((m) => `"${m.alias}"×${m.count}`).join(', ')})`
  }
  const parts: string[] = []
  if (!primary) {
    parts.push('No person, saint or theme is named clearly enough in the lyrics to choose a category.')
  } else if (primaryWhy === 'general') {
    parts.push(`Addressed to God in general terms (${fmt('General', 'category')}) without naming Christ, the Virgin Mary, a saint or a single clear theme.`)
  } else if (primaryWhy === 'feast') {
    parts.push(`No subject is named often enough, but the lyrics describe ${occasions[0]}, so the category follows the feast.`)
  } else if (primaryWhy === 'weak') {
    parts.push(`Only one line names a subject: ${fmt(primary, 'category')}. Proposed with low confidence.`)
  } else if (primaryWhy === 'theme') {
    parts.push(`Theme-centred hymn: ${fmt(primary, 'category')}; no single person or saint dominates.`)
  } else {
    parts.push(`Main subject: ${fmt(primary, 'category')}.`)
  }
  if (additional.length) parts.push(`Also: ${additional.map((c) => fmt(c, 'category')).join('; ')}.`)
  if (occasions.length) parts.push(`Occasion evidence: ${occasions.map((o) => fmt(o, 'occasion')).join('; ')}.`)
  else parts.push('No feast or season is named in the lyrics, so General / Anytime.')
  if (reviewReasons.includes('baptism_ambiguous')) parts.push('Mentions ጥምቀት/baptism without enough context to tell Timket from sacramental Baptism.')
  if (reviewReasons.includes('language_tigrinya')) parts.push('Lyrics appear to be Tigrinya.')
  if (reviewReasons.includes('language_oromo')) parts.push('Lyrics appear to be Afaan Oromo.')
  if (reviewReasons.includes('competing_subjects')) parts.push('Two subjects have similar weight.')

  const hymnSections = new Set<string>()
  for (const c of [primary, ...additional]) if (c) for (const s of entryByCanonical('category', c)?.browseSections || []) hymnSections.add(s)
  for (const o of occasions) for (const s of entryByCanonical('occasion', o)?.browseSections || []) hymnSections.add(s)

  const scores: Record<string, number> = {}
  for (const [key, t] of tallies) if (t.strongScore > 0) scores[key] = t.strongScore

  const reviewRequired = reviewReasons.length > 0 || confidence === 'LOW'
  return {
    import_id: input.import_id,
    primaryCategory: primary,
    additionalCategories: additional,
    primaryOccasion: occasions[0] || 'General / Anytime',
    additionalOccasions: occasions.slice(1),
    hymnSections: [...hymnSections],
    confidence,
    reviewRequired,
    reviewReasons: [...new Set(reviewReasons)],
    matchedAliases,
    excerpts,
    explanation: parts.join(' '),
    scores,
  }
}

export function formatMatchedAliases(list: MatchedAlias[]): string {
  const by = new Map<string, string[]>()
  for (const m of list) {
    const arr = by.get(m.canonical) || []
    arr.push(`${m.alias}×${m.count}${m.ambiguous ? '?' : ''}`)
    by.set(m.canonical, arr)
  }
  return [...by.entries()].map(([c, arr]) => `${c}: ${arr.join(', ')}`).join(' | ')
}

export type { AliasHit }
