import type { UpcomingObservance } from '../lib/churchCalendar'
import { resolveUpcomingImage } from './calendarImageManifest'
import { COMPANION_IMAGE_FILE, isCompanionObservanceId } from './nextObservancesCompanions'

const CALENDAR_ROOT = '/images/calendar'

/** Authoritative pool for Next Observances — filenames match `/public/images/calendar/`. */
export const NEXT_OBSERVANCES_POOL_FILES = [
  'Debre Zeit.png',
  'DebreTabor.jpg',
  'DebreTabor.png',
  'Enkutatash.png',
  'Erget.jpg',
  'EthiopianSaintsRemembrance.png',
  'Fasika.png',
  'FastingSeasonAtmosphere.png',
  'FeastDayPreparation.png',
  'FilsetaFast.png',
  'Gena.png',
  'HolyTrinityCommemoration.png',
  'Hosanna.png',
  'JoyfulFeastSeason.jpg',
  'LidetaMaryam.png',
  'LiturgicalSeason.png',
  'MarianFeast.png',
  'Meskel.png',
  'MonasticSaintsRemembrance.png',
  'MonthlyAbuneTeklehaymanot.png',
  'MonthlySaintGabrielCommemoration.png',
  'MonthlySaintMaryCommemoration.png',
  'MonthlySaintMichaelCommemoration.png',
  'Nineveh.jpg',
  'Peraklitos.jpg',
  'SacredCalendarContinuity.png',
  'SaintGabrielFeast.png',
  'SaintMichaelFeast.png',
  'SemuneHimamat.jpg',
  'Siqlet.png',
  'Timket.png',
  'TodayInChurch.png',
  'TsigeSeason.jpg',
  'TsomeHawaryat.png',
  'TsomeNebiyat.png',
  'UpcomingHolyDays.png',
] as const

export type NextObservancesPoolCategory =
  | 'feast'
  | 'fast'
  | 'saints'
  | 'angels'
  | 'marian-feast'
  | 'season'
  | 'general'

export type NextObservancesPoolArt = {
  readonly src: string
  readonly fileName: string
  readonly title: string
  readonly category: NextObservancesPoolCategory
  readonly categoryLabel: string
  readonly summary: string
}

export function poolImageSrc(fileName: string): string {
  return encodeURI(`${CALENDAR_ROOT}/${fileName}`)
}

function stemFromFileName(fileName: string): string {
  return fileName.replace(/\.(png|jpg|jpeg)$/i, '')
}

/** Human title from filename stem (PascalCase / runs). */
export function titleFromPoolFileName(fileName: string): string {
  const s = stemFromFileName(fileName)
  const spaced = s
    .replace(/([a-z])([A-Z])/g, '$1 $2')
    .replace(/([A-Z])([A-Z][a-z])/g, '$1 $2')
    .replace(/[-_]/g, ' ')
  return spaced.replace(/\s+/g, ' ').trim() || s
}

function formatCategoryLabel(c: NextObservancesPoolCategory): string {
  const map: Record<NextObservancesPoolCategory, string> = {
    feast: 'Feast',
    fast: 'Fast',
    saints: 'Saints',
    angels: 'Angels',
    'marian-feast': 'Marian',
    season: 'Season',
    general: 'General',
  }
  return map[c]
}

export function inferPoolCategoryFromFileName(fileName: string): NextObservancesPoolCategory {
  const s = stemFromFileName(fileName).toLowerCase()
  if (
    /fast|fasting|tsome|nineveh|filseta|semune|hawaryat|nebiyat/.test(s)
  ) {
    return 'fast'
  }
  if (/monthly.*michael|saintmichaelfeast|saintgabrielfeast|monthly.*gabriel/.test(s)) {
    return 'angels'
  }
  if (/mary|marian|lideta/.test(s)) {
    return 'marian-feast'
  }
  if (/ethiopian|monastic|abune|saints?/.test(s)) {
    return 'saints'
  }
  if (/tsige|liturgical|joyful|season|sacredcalendar|upcoming|todayinchurch/.test(s)) {
    return 'season'
  }
  if (
    /gena|timket|meskel|hosanna|fasika|damawi|tensae|thomas|siqlet|erget|peraklitos|enkutatash|debre|holytrinity/.test(
      s,
    )
  ) {
    return 'feast'
  }
  return 'general'
}

function summaryFromPoolMeta(title: string, c: NextObservancesPoolCategory): string {
  switch (c) {
    case 'feast':
      return `Sacred art for ${title} — festal remembrance in the Church year.`
    case 'fast':
      return `Visual companion for fasting, repentance, and holy preparation.`
    case 'saints':
      return `Honouring the communion of saints and holy witnesses in Ethiopia.`
    case 'angels':
      return `The heavenly hosts and archangels in liturgical praise and intercession.`
    case 'marian-feast':
      return `The Mother of God in feast, intercession, and the life of the Church.`
    case 'season':
      return `The rhythm of liturgical seasons across the sacred calendar.`
    default:
      return `Calendar art for upcoming observances and the day the Church keeps.`
  }
}

function buildPoolEntry(fileName: string): NextObservancesPoolArt {
  const category = inferPoolCategoryFromFileName(fileName)
  const title = titleFromPoolFileName(fileName)
  return {
    src: poolImageSrc(fileName),
    fileName,
    title,
    category,
    categoryLabel: formatCategoryLabel(category),
    summary: summaryFromPoolMeta(title, category),
  }
}

export const NEXT_OBSERVANCES_POOL: NextObservancesPoolArt[] =
  NEXT_OBSERVANCES_POOL_FILES.map((fn) => buildPoolEntry(fn))

export function fileNameFromImageUrl(imageUrl: string): string {
  const noQuery = imageUrl.split('?')[0] ?? ''
  const slash = noQuery.lastIndexOf('/')
  const raw = slash >= 0 ? noQuery.slice(slash + 1) : noQuery
  try {
    return decodeURIComponent(raw)
  } catch {
    return raw
  }
}

function poolEntryByFileName(fileName: string): NextObservancesPoolArt | undefined {
  const k = fileName.toLowerCase()
  return NEXT_OBSERVANCES_POOL.find((p) => p.fileName.toLowerCase() === k)
}

function poolEntryBySrc(src: string): NextObservancesPoolArt | undefined {
  const k = fileNameFromImageUrl(src).toLowerCase()
  return poolEntryByFileName(k)
}

/**
 * When `resolveUpcomingImage` points outside the user pool (e.g. AbiyTsom.png),
 * map catalog event ids to a pool filename so the card art always matches the observance.
 */
const POOL_FILE_BY_EVENT_ID: Record<string, string> = {
  gena: 'Gena.png',
  timket: 'Timket.png',
  hosanna: 'Hosanna.png',
  siqlet: 'Siqlet.png',
  fasika: 'Fasika.png',
  'damawi-tensae': 'JoyfulFeastSeason.jpg',
  erget: 'Erget.jpg',
  peraklitos: 'Peraklitos.jpg',
  'debre-tabor': 'DebreTabor.jpg',
  meskel: 'Meskel.png',
  'nineveh-fast': 'Nineveh.jpg',
  'abiy-tsom': 'FastingSeasonAtmosphere.png',
  'semune-himamat': 'SemuneHimamat.jpg',
  'tsome-hawaryat': 'TsomeHawaryat.png',
  filseta: 'FilsetaFast.png',
  'tsome-nebiyat': 'TsomeNebiyat.png',
  /** Advent (Tsome Gena) — distinct from the Prophets’ fast art. */
  'nativity-fast': 'FeastDayPreparation.png',
  enkutatash: 'Enkutatash.png',
  tsige: 'TsigeSeason.jpg',
  'lideta-maryam': 'LidetaMaryam.png',
  'debre-zeit': 'Debre Zeit.png',
  /** Monthly Ba‘āla Māryām — prefer monthly commemoration art in the pool bundle. */
  'beale-maryam': 'MonthlySaintMaryCommemoration.png',
  'beale-michael': 'MonthlySaintMichaelCommemoration.png',
  'beale-gabriel': 'MonthlySaintGabrielCommemoration.png',
  'beale-selassie': 'HolyTrinityCommemoration.png',
  'daily-senksar-commemoration': 'EthiopianSaintsRemembrance.png',
  'righteous-remembrance': 'MonasticSaintsRemembrance.png',
  'abune-teklehaymanot': 'MonthlyAbuneTeklehaymanot.png',
  'saint-mary-commemoration': 'MonthlySaintMaryCommemoration.png',
  'saint-michael-commemoration': 'MonthlySaintMichaelCommemoration.png',
  'saint-gabriel-commemoration': 'MonthlySaintGabrielCommemoration.png',
  pagumen: 'SacredCalendarContinuity.png',
}

function poolArtFromEventId(id: string): NextObservancesPoolArt | undefined {
  const file = POOL_FILE_BY_EVENT_ID[id.trim().toLowerCase()]
  return file ? poolEntryByFileName(file) : undefined
}

/** What the observance row “needs” visually when no exact pool URL match. */
export function inferObservanceVisualNeed(
  item: UpcomingObservance,
): NextObservancesPoolCategory {
  const t = `${item.title} ${item.transliterationTitle ?? ''}`
  if (item.kind === 'fast') return 'fast'
  if (/mary|ማርያም|marian|lideta/i.test(t)) return 'marian-feast'
  if (/michael|gabriel|raphael|archangel|መላእክት/i.test(t)) return 'angels'
  if (item.kind === 'feast') return 'feast'
  if (/trinity|ሥላሴ|selass/i.test(t)) return 'feast'
  if (/season|ወቅት|tsige|ጽጌ/i.test(t)) return 'season'
  if (item.kind === 'commemoration') return 'saints'
  return 'general'
}

function simpleHash(s: string): number {
  let h = 0
  for (let i = 0; i < s.length; i++) h = (h * 31 + s.charCodeAt(i)) | 0
  return Math.abs(h)
}

export type AssignedNextObservanceArt = {
  item: UpcomingObservance
  art: NextObservancesPoolArt
}

export type AssignedNextObservanceVisual =
  | { item: UpcomingObservance; mode: 'image'; art: NextObservancesPoolArt }
  | { item: UpcomingObservance; mode: 'placeholder'; tone: UpcomingObservance['kind'] }

/**
 * Maps each observance to pool art: prefer exact URL basename in pool, else category fallbacks,
 * cycling the pool so many distinct images appear across the strip.
 */
/**
 * Assign art for a filtered deck: companions use fixed pool files; catalog rows use
 * event-id / URL / category resolution so observances stay visually tied to their meaning.
 */
export function assignObservanceRowArts(items: UpcomingObservance[]): AssignedNextObservanceVisual[] {
  const catalog = items.filter((i) => !isCompanionObservanceId(i.id))
  const seed = nextObservancesRotationSeed(catalog)
  const catalogAssigned = assignNextObservanceArts(catalog, seed)
  const artByCatalogId = new Map(catalogAssigned.map((r) => [r.item.id, r.art]))

  const resolveCompanion = (item: UpcomingObservance): AssignedNextObservanceVisual => {
    const file = COMPANION_IMAGE_FILE[item.id]
    const art = file ? poolEntryByFileName(file) : undefined
    if (art) return { item, mode: 'image', art }
    return { item, mode: 'placeholder', tone: item.kind }
  }

  const resolveCatalog = (item: UpcomingObservance): AssignedNextObservanceVisual => {
    const art = artByCatalogId.get(item.id)
    if (art) return { item, mode: 'image', art }
    return { item, mode: 'placeholder', tone: item.kind }
  }

  return items.map((item) =>
    isCompanionObservanceId(item.id) ? resolveCompanion(item) : resolveCatalog(item),
  )
}

export function assignNextObservanceArts(
  items: UpcomingObservance[],
  rotationSeed: number,
): AssignedNextObservanceArt[] {
  const used = new Set<string>()

  const pickFrom = (
    subset: NextObservancesPoolArt[],
    index: number,
  ): NextObservancesPoolArt => {
    const unused = subset.filter((p) => !used.has(p.src))
    if (unused.length) {
      const u = unused[(rotationSeed + index * 11) % unused.length]
      used.add(u.src)
      return u
    }
    const c = subset[(rotationSeed + index * 13) % subset.length] ?? NEXT_OBSERVANCES_POOL[0]
    used.add(c.src)
    return c
  }

  return items.map((item, i) => {
    const fromEvent = poolArtFromEventId(item.id)
    if (fromEvent) {
      used.add(fromEvent.src)
      return { item, art: fromEvent }
    }

    const resolved = resolveUpcomingImage(item)
    const exact = poolEntryBySrc(resolved)
    if (exact) {
      used.add(exact.src)
      return { item, art: exact }
    }

    const need = inferObservanceVisualNeed(item)
    let subset = NEXT_OBSERVANCES_POOL.filter((p) => p.category === need)
    if (!subset.length) subset = NEXT_OBSERVANCES_POOL.filter((p) => p.category === 'general')
    if (!subset.length) subset = [...NEXT_OBSERVANCES_POOL]

    return { item, art: pickFrom(subset, i) }
  })
}

/** Three rotating gallery tiles — spreads pool usage without crowding the strip. */
export function nextObservancesHeaderArts(rotationSeed: number): NextObservancesPoolArt[] {
  const L = NEXT_OBSERVANCES_POOL.length
  const out: NextObservancesPoolArt[] = []
  let step = 0
  while (out.length < 3 && step < L * 2) {
    const j = (rotationSeed + step * 17) % L
    const p = NEXT_OBSERVANCES_POOL[j]
    if (!out.some((x) => x.src === p.src)) out.push(p)
    step++
  }
  while (out.length < 3) out.push(NEXT_OBSERVANCES_POOL[out.length % L])
  return out.slice(0, 3)
}

export function nextObservancesRotationSeed(items: UpcomingObservance[]): number {
  return simpleHash(items.map((x) => x.id).join('|')) % Math.max(1, NEXT_OBSERVANCES_POOL.length)
}
