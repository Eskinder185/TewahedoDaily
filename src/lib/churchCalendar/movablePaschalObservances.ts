import type { MovableObservanceOnDay, UpcomingObservanceEntry } from '../../data/types/churchDay'
import {
  addDays,
  damawiTensaeFromPascha,
  resolvePaschaGregorianDate,
  sameLocalCalendarDay,
  toIsoLocalDate,
} from './pascha'

type CatalogEvent = {
  id: string
  title: string
  englishTitle?: string
  transliterationTitle: string
  type?: string
  shortDescription: string
  summary?: string
  meaning: string
  whyItMatters?: string
  howToObserve?: string
  prayAndChant?: string
  observance: string
  notes?: string
  fixedOrMovable?: string
}

type PaschalOffsetRule =
  | { kind: 'offset'; days: number }
  | { kind: 'damawi_tensae' }

const PASCHA_SEQUENCE: Array<{
  id: string
  rule: PaschalOffsetRule
  upcomingKind: UpcomingObservanceEntry['kind']
}> = [
  { id: 'abiy-tsom', rule: { kind: 'offset', days: -55 }, upcomingKind: 'fast' },
  { id: 'hosanna', rule: { kind: 'offset', days: -7 }, upcomingKind: 'feast' },
  { id: 'semune-himamat', rule: { kind: 'offset', days: -6 }, upcomingKind: 'fast' },
  { id: 'siqlet', rule: { kind: 'offset', days: -2 }, upcomingKind: 'feast' },
  { id: 'fasika', rule: { kind: 'offset', days: 0 }, upcomingKind: 'feast' },
  { id: 'damawi-tensae', rule: { kind: 'damawi_tensae' }, upcomingKind: 'feast' },
  { id: 'erget', rule: { kind: 'offset', days: 39 }, upcomingKind: 'feast' },
  { id: 'peraklitos', rule: { kind: 'offset', days: 49 }, upcomingKind: 'feast' },
]

function resolveGregorianDate(
  pascha: Date,
  rule: PaschalOffsetRule,
): Date {
  if (rule.kind === 'offset') return addDays(pascha, rule.days)
  return damawiTensaeFromPascha(pascha)
}

function ruleSummary(rule: PaschalOffsetRule, paschaIso: string): string {
  if (rule.kind === 'damawi_tensae') {
    return `First Sunday after Fasika (${paschaIso})`
  }
  if (rule.days === 0) return 'Paschal full moon cycle — Resurrection Sunday'
  if (rule.days === -55) return 'Monday before Great Fast — tied to Fasika'
  if (rule.days === -58) return 'Approx. Nineveh fast window before Lent — tied to Fasika'
  if (rule.days === -7) return 'Seven days before Fasika — Hosanna'
  if (rule.days === -6) return 'Holy Week begins — tied to Fasika'
  if (rule.days === -2) return 'Two days before Fasika — Siqlet'
  if (rule.days === 39) return '39 days after Fasika — Ascension (Erget)'
  if (rule.days === 49) return '49 days after Fasika — Pentecost (Peraklitos)'
  return 'Derived from Fasika'
}

const RELATED_PRAYER: Partial<Record<string, string>> = {
  'damawi-tensae': 'Zeweter Tselot — festal morning prayer with the parish when possible',
  fasika: 'Zeweter Tselot — Paschal vigil and festal communion',
  hosanna: 'Zeweter Tselot — branch-blessing and entrance hymns with the Church',
  siqlet: 'Zeweter Tselot — solemn adoration of the Cross',
  'abiy-tsom': 'Zeweter Tselot — lenten offices and prostrations as directed',
  'nineveh-fast': 'Zeweter Tselot — Jonah and repentance readings',
  'semune-himamat': 'Zeweter Tselot — Holy Week gospel services',
  erget: 'Zeweter Tselot — ascension hymns and festal praise',
  peraklitos: 'Zeweter Tselot — Spirit hymns and renewal',
}

const RELATED_CHANT: Partial<Record<string, string>> = {
  'damawi-tensae': 'Paschal mezmur and “Christ is risen” refrains — parish repertoire',
  fasika: 'Night vigil and festal mezmur — follow parish leadership',
  hosanna: 'Hosanna processional mezmur — local custom',
  siqlet: 'Sorrowful hymns before the Cross — local parish cycle',
}

export function buildPaschalUpcomingEntries(
  gregorianYear: number,
  eventById: Map<string, CatalogEvent>,
): UpcomingObservanceEntry[] {
  const pascha = resolvePaschaGregorianDate(gregorianYear)
  if (!pascha) return []

  const paschaIso = toIsoLocalDate(pascha)
  const out: UpcomingObservanceEntry[] = []

  for (const row of PASCHA_SEQUENCE) {
    const ev = eventById.get(row.id)
    if (!ev) continue
    const d = resolveGregorianDate(pascha, row.rule)
    const iso = toIsoLocalDate(d)
    out.push({
      id: ev.id,
      title: ev.title,
      transliterationTitle: ev.transliterationTitle,
      shortDescription: ev.shortDescription,
      meaning: ev.meaning,
      observance: ev.observance,
      kind: row.upcomingKind,
      dateEthiopian: `Movable (Fasika ${paschaIso})`,
      dateGregorian: `${iso} — confirm with parish`,
      gregorianAnchorIso: iso,
      scheduling: 'movable',
      ruleSummary: ruleSummary(row.rule, paschaIso),
      relatedPrayerHint: RELATED_PRAYER[row.id],
      relatedChantHint: RELATED_CHANT[row.id],
    })
  }
  return out
}

export function movableObservancesOnGregorianDay(
  d: Date,
  gregorianYear: number,
  eventById: Map<string, CatalogEvent>,
): MovableObservanceOnDay[] {
  const pascha =
    resolvePaschaGregorianDate(gregorianYear) ??
    resolvePaschaGregorianDate(gregorianYear - 1) ??
    resolvePaschaGregorianDate(gregorianYear + 1)
  if (!pascha) return []

  const paschaIso = toIsoLocalDate(pascha)
  const hits: MovableObservanceOnDay[] = []

  for (const row of PASCHA_SEQUENCE) {
    const ev = eventById.get(row.id)
    if (!ev) continue
    const obsDate = resolveGregorianDate(pascha, row.rule)
    if (!sameLocalCalendarDay(d, obsDate)) continue
    hits.push({
      id: ev.id,
      catalogEventId: ev.id,
      scheduling: 'movable',
      title: ev.title,
      transliterationTitle: ev.transliterationTitle,
      shortDescription: ev.shortDescription,
      meaning: ev.meaning,
      observance: ev.observance,
      ruleSummary: ruleSummary(row.rule, paschaIso),
      relatedPrayerHint: RELATED_PRAYER[row.id],
      relatedChantHint: RELATED_CHANT[row.id],
    })
  }
  return hits
}

export function markedGregorianDaysForMonth(
  gregorianYear: number,
  monthIndex: number,
  eventById: Map<string, CatalogEvent>,
): number[] {
  const pascha = resolvePaschaGregorianDate(gregorianYear)
  if (!pascha) return []
  const days = new Set<number>()
  for (const row of PASCHA_SEQUENCE) {
    if (!eventById.has(row.id)) continue
    const obs = resolveGregorianDate(pascha, row.rule)
    if (obs.getFullYear() === gregorianYear && obs.getMonth() === monthIndex) {
      days.add(obs.getDate())
    }
  }
  return [...days].sort((a, b) => a - b)
}
