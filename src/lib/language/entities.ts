import { ORTHODOX_CANON_CATALOG } from '../bible/canonAliases.ts'
import { CALENDAR_ENTITIES } from '../search/entityAliases.ts'

export type EntityKind = 'saint' | 'archangel' | 'feast' | 'fast' | 'biblical-book' | 'place' | 'term'
export type LanguageEntity = {
  id: string
  kind: EntityKind
  names: { en: string; am?: string; gez?: string }
  aliases: readonly string[]
  /** Repository source for the display names and aliases. */
  source: string
}

const calendarSource = 'src/lib/search/entityAliases.ts'
const calendarNames: Record<string, { en: string; am: string; kind: EntityKind }> = {
  michael: { en: 'Archangel Michael', am: 'ሚካኤል', kind: 'archangel' },
  gabriel: { en: 'Archangel Gabriel', am: 'ገብርኤል', kind: 'archangel' },
  raphael: { en: 'Archangel Raphael', am: 'ራፋኤል', kind: 'archangel' },
  uriel: { en: 'Archangel Uriel', am: 'ዑራኤል', kind: 'archangel' },
  mary: { en: 'Saint Mary', am: 'ማርያም', kind: 'saint' },
  george: { en: 'Saint George', am: 'ጊዮርጊስ', kind: 'saint' },
  'tekle-haymanot': { en: 'Saint Tekle Haymanot', am: 'ተክለ ሃይማኖት', kind: 'saint' },
  'john-the-baptist': { en: 'Saint John the Baptist', am: 'መጥምቅ', kind: 'saint' },
  stephen: { en: 'Saint Stephen', am: 'እስጢፋኖስ', kind: 'saint' },
  yared: { en: 'Saint Yared', am: 'ያሬድ', kind: 'saint' },
  meskel: { en: 'Meskel', am: 'መስቀል', kind: 'feast' },
  timket: { en: 'Timket', am: 'ጥምቀት', kind: 'feast' },
  gena: { en: 'Gena', am: 'ልደት', kind: 'feast' },
  'great-lent': { en: 'Great Lent', am: 'ዐቢይ ጾም', kind: 'fast' },
}

/** Only source-backed forms are included. Broad calendar relationships are not entity aliases. */
const calendarEntities: LanguageEntity[] = CALENDAR_ENTITIES.flatMap((entry) => {
  const named = calendarNames[entry.key]
  if (!named) return []
  // Filseta and Theotokos have distinct theological/feast meanings; do not collapse them into Mary.
  const aliases = entry.key === 'mary'
    ? entry.aliases.filter((alias) => !['theotokos', 'ፍልሰታ', 'filseta'].includes(alias.toLowerCase()))
    : entry.aliases
  // Full honorific forms occur in calendar/knowledge/angelicAndSaints.ts.
  const verifiedAliases = entry.key === 'michael'
    ? [...aliases, 'Saint Michael', 'ቅዱስ ሚካኤል']
    : entry.key === 'gabriel'
      ? [...aliases, 'Saint Gabriel', 'ቅዱስ ገብርኤል']
      : aliases
  return [{ id: `${named.kind}:${entry.key}`, kind: named.kind, names: { en: named.en, am: named.am }, aliases: verifiedAliases, source: calendarSource }]
})

const bookEntities: LanguageEntity[] = ORTHODOX_CANON_CATALOG.map((book) => ({
  id: `biblical-book:${book.slug}`,
  kind: 'biblical-book' as const,
  names: { en: book.nameEn, am: book.nameAm, gez: book.nameGez },
  // Abbreviations under three characters are reference syntax, not safe content entities.
  aliases: book.aliases.filter((alias) => alias.length >= 3),
  source: 'src/lib/bible/canonAliases.ts',
}))

export const LANGUAGE_ENTITIES: readonly LanguageEntity[] = [
  ...calendarEntities,
  ...bookEntities,
  { id: 'feast:filseta', kind: 'feast', names: { en: 'Filseta', am: 'ፍልሰታ' }, aliases: ['filseta', 'ፍልሰታ'], source: calendarSource },
  { id: 'term:theotokos', kind: 'term', names: { en: 'Theotokos' }, aliases: ['theotokos'], source: calendarSource },
  { id: 'term:cross', kind: 'term', names: { en: 'Cross', am: 'መስቀል' }, aliases: ['cross'], source: calendarSource },
  { id: 'place:golgotha', kind: 'place', names: { en: 'Golgotha' }, aliases: [], source: 'src/data/calendarEvents.json' },
  { id: 'place:jerusalem', kind: 'place', names: { en: 'Jerusalem' }, aliases: [], source: 'src/data/calendarEvents.json' },
  { id: 'term:holy-spirit', kind: 'term', names: { en: 'Holy Spirit', am: 'መንፈስ ቅዱስ' }, aliases: ['መንፈስ ቅዱስ'], source: 'src/lib/mezmur/ethiopicTransliterator.ts' },
  { id: 'term:liturgy', kind: 'term', names: { en: 'Liturgy', am: 'ቅዳሴ' }, aliases: [], source: 'src/lib/calendar/knowledge/angelicAndSaints.ts' },
  { id: 'term:tabot', kind: 'term', names: { en: 'Tabot' }, aliases: [], source: 'src/lib/calendar/knowledge/angelicAndSaints.ts' },
]
