import type { ChurchDaySnapshot, UpcomingObservance } from '../lib/churchCalendar'

const CALENDAR_IMAGE_ROOT = '/images/calendar'

/** Encode spaces and non-ASCII file names so `/images/calendar/Debre Zeit.png` resolves reliably. */
const img = (name: string, ext: 'png' | 'jpg' | 'JPG' = 'png') =>
  encodeURI(`${CALENDAR_IMAGE_ROOT}/${name}.${ext}`)

export const calendarImageAssets = {
  abiyTsom: img('AbiyTsom'),
  abuneAregawi: img('AbuneAregawi', 'JPG'),
  /** Canonical saint icon (legacy monthly alias remains mapped below). */
  abuneTeklehaymanot: img('AbuneTeklehaymanot'),
  apostlesPeterAndPaul: img('SaintsPeterandPaul'),
  apostlesRemembrance: img('ApostlesRemembrance'),
  archangelRaphael: img('ArchangelRaphael'),
  archangelUriel: img('ArchangelUriel'),
  archangelsRemembrance: img('ArchangelsRemembrance'),
  calendarLiturgicalSeasonLegacy: img('calendar-liturgical-season', 'jpg'),
  calendarUpcomingHolyDaysLegacy: img('calendar-upcoming-holy-days', 'jpg'),
  dagmawiTensia: img('DagmawiTensia'),
  debreZeit: img('Debre Zeit'),
  /** Many bundles ship `DebreTabor.jpg` only — prefer JPEG for the Transfiguration feast. */
  debreTaborPng: img('DebreTabor'),
  debreTabor: img('DebreTabor', 'jpg'),
  debreTaborLegacy: img('DebreTabor', 'jpg'),
  enkutatash: img('Enkutatash'),
  erget: img('Erget', 'jpg'),
  ethiopianSaintsRemembrance: img('EthiopianSaintsRemembrance'),
  fasika: img('Fasika'),
  fastingSeasonAtmosphere: img('FastingSeasonAtmosphere'),
  feastDayPreparation: img('FeastDayPreparation'),
  filsetaFast: img('FilsetaFast'),
  gena: img('Gena'),
  gizret: img('Gizret'),
  holyTrinityCommemoration: img('HolyTrinityCommemoration'),
  hosanna: img('Hosanna'),
  joyfulFeastSeason: img('JoyfulFeastSeason', 'jpg'),
  kanaZeGalilee: img('KanaZeGalilee'),
  kidaneMehret: img('KidaneMehret'),
  kidusGiorgis: img('KidusGiorgis'),
  lidetaMaryam: img('LidetaMaryam'),
  liturgicalSeason: img('LiturgicalSeason'),
  marianFeast: img('MarianFeast'),
  medhaneAlem: img('MedhaneAlem'),
  meetingOfPriests: img('MeetingofPriests'),
  megabitMeskel: img('MegabitMeskel'),
  meskel: img('Meskel'),
  monasticSaintsRemembrance: img('MonasticSaintsRemembrance'),
  nineveh: img('Nineveh', 'jpg'),
  peraklitos: img('Peraklitos', 'jpg'),
  sacredCalendarContinuity: img('SacredCalendarContinuity'),
  saintGabrielCommemoration: img('SaintGabrielCommemoration'),
  saintGabrielFeast: img('SaintGabrielFeast'),
  saintDavid: img('SaintDavid', 'JPG'),
  saintGeorge: img('Saint George', 'JPG'),
  saintJohnTheBaptist: img('SaintJohntheBaptist'),
  saintMaryCommemoration: img('SaintMaryCommemoration'),
  saintMichaelCommemoration: img('SaintMichaelCommemoration'),
  saintMichaelFeast: img('SaintMichaelFeast'),
  saintPhilip: img('Saint Philip', 'JPG'),
  saintStephen: img('SaintStephen', 'JPG'),
  saintStephenLegacy: img('SaintStephen'),
  stMerkorious: img('St.Merkorious'),
  saintYared: img('SaintYared'),
  semuneHimamat: img('SemuneHimamat', 'jpg'),
  siqlet: img('Siqlet'),
  timket: img('Timket'),
  todayInChurch: img('TodayInChurch'),
  tsinset: img('Tsinset'),
  tsomeGehad: img('TsomeGehad'),
  tsigeSeason: img('TsigeSeason', 'jpg'),
  tsomeHawaryat: img('TsomeHawaryat'),
  tsomeNebiyat: img('TsomeNebiyat'),
  upcomingHolyDays: img('UpcomingHolyDays'),
  zemeneTinsae: img('ZemeneTinsae'),
} as const

export const calendarImageManifest = {
  anchors: {
    todayInChurch: calendarImageAssets.todayInChurch,
  },
  support: {
    liturgicalSeason: calendarImageAssets.liturgicalSeason,
    liturgicalSeasonLegacy: calendarImageAssets.calendarLiturgicalSeasonLegacy,
    upcomingHolyDays: calendarImageAssets.upcomingHolyDays,
    upcomingHolyDaysLegacy: calendarImageAssets.calendarUpcomingHolyDaysLegacy,
    sacredCalendarContinuity: calendarImageAssets.sacredCalendarContinuity,
    joyfulFeastSeason: calendarImageAssets.joyfulFeastSeason,
    fastingSeasonAtmosphere: calendarImageAssets.fastingSeasonAtmosphere,
    feastDayPreparation: calendarImageAssets.feastDayPreparation,
  },
  remembrance: {
    archangels: calendarImageAssets.archangelsRemembrance,
    ethiopianSaints: calendarImageAssets.ethiopianSaintsRemembrance,
    monasticSaints: calendarImageAssets.monasticSaintsRemembrance,
    apostles: calendarImageAssets.apostlesRemembrance,
  },
  eventsById: {
    'tsinset-annunciation': calendarImageAssets.tsinset,
    gena: calendarImageAssets.gena,
    'lidet-gena': calendarImageAssets.gena,
    'gizret-circumcision': calendarImageAssets.gizret,
    timket: calendarImageAssets.timket,
    'kana-ze-galilee': calendarImageAssets.kanaZeGalilee,
    'megabit-meskel': calendarImageAssets.megabitMeskel,
    hosanna: calendarImageAssets.hosanna,
    'good-friday': calendarImageAssets.siqlet,
    siqlet: calendarImageAssets.siqlet,
    fasika: calendarImageAssets.fasika,
    'damawi-tensae': calendarImageAssets.dagmawiTensia,
    'rikbe-kahnat': calendarImageAssets.meetingOfPriests,
    ascension: calendarImageAssets.erget,
    erget: calendarImageAssets.erget,
    pentecost: calendarImageAssets.peraklitos,
    peraklitos: calendarImageAssets.peraklitos,
    'bright-season-after-fasika': calendarImageAssets.zemeneTinsae,
    'zemene-tsige': calendarImageAssets.tsigeSeason,
    'holy-week': calendarImageAssets.semuneHimamat,
    'debre-tabor': calendarImageAssets.debreTabor,
    'meskel-finding-of-the-true-cross': calendarImageAssets.meskel,
    pagumen: calendarImageAssets.sacredCalendarContinuity,
    meskel: calendarImageAssets.meskel,
    'nineveh-fast': calendarImageAssets.nineveh,
    'abiy-tsom': calendarImageAssets.abiyTsom,
    'semune-himamat': calendarImageAssets.semuneHimamat,
    'tsome-hawaryat': calendarImageAssets.tsomeHawaryat,
    filseta: calendarImageAssets.filsetaFast,
    'tsome-nebiyat': calendarImageAssets.tsomeNebiyat,
    'nativity-fast': calendarImageAssets.tsomeNebiyat,
    enkutatash: calendarImageAssets.enkutatash,
    tsige: calendarImageAssets.tsigeSeason,
    'lideta-maryam': calendarImageAssets.lidetaMaryam,
    'debre-zeit': calendarImageAssets.debreZeit,
    'saint-john-the-baptist': calendarImageAssets.saintJohnTheBaptist,
    'saint-george-major': calendarImageAssets.saintGeorge,
    'saint-georgios': calendarImageAssets.saintGeorge,
    'kidus-giorgis': calendarImageAssets.saintGeorge,
    'saint-george-monthly-23': calendarImageAssets.saintGeorge,
    'saint-georgios-monthly-23': calendarImageAssets.saintGeorge,
    'saint-tekle-haymanot-major': calendarImageAssets.abuneTeklehaymanot,
    'saint-tekle-haymanot-monthly-24': calendarImageAssets.abuneTeklehaymanot,
    'saint-yared-major': calendarImageAssets.saintYared,
    'saint-stephen-major': calendarImageAssets.saintStephen,
    'kidus-estifanos': calendarImageAssets.saintStephen,
    'kidus-estifanos-major': calendarImageAssets.saintStephen,
    'saint-philip': calendarImageAssets.saintPhilip,
    'kidus-filpos': calendarImageAssets.saintPhilip,
    philippos: calendarImageAssets.saintPhilip,
    'abune-aregawi': calendarImageAssets.abuneAregawi,
    'abune-aragawi': calendarImageAssets.abuneAregawi,
    'saint-david': calendarImageAssets.saintDavid,
    'saint-peter-and-paul': calendarImageAssets.apostlesPeterAndPaul,
    'saint-michael-major': calendarImageAssets.saintMichaelFeast,
    'saint-gabriel-major': calendarImageAssets.saintGabrielFeast,
    'saint-raphael-major': calendarImageAssets.archangelRaphael,
    'saint-uriel-major': calendarImageAssets.archangelUriel,
    'weekly-wednesday-fast': calendarImageAssets.tsomeGehad,
    'weekly-friday-fast': calendarImageAssets.tsomeGehad,
    'weekly-sunday-resurrection': calendarImageAssets.dagmawiTensia,
    'weekly-saturday-sabbath': calendarImageAssets.sacredCalendarContinuity,
    'kidane-mehret': calendarImageAssets.kidaneMehret,
    'baeta-maryam': calendarImageAssets.marianFeast,
    'asterio-maryam': calendarImageAssets.marianFeast,
    'filseta-assumption': calendarImageAssets.filsetaFast,
    'apostles-fast': calendarImageAssets.tsomeHawaryat,
    'tsome-gehad': calendarImageAssets.tsomeGehad,
    'medhane-alem': calendarImageAssets.medhaneAlem,
    medhanealem: calendarImageAssets.medhaneAlem,
    'medhane-alem-monthly-27': calendarImageAssets.medhaneAlem,
    'silase-monthly-7': calendarImageAssets.holyTrinityCommemoration,
    'saint-raphael-monthly-13': calendarImageAssets.archangelRaphael,
    'kidane-mihret-monthly-16': calendarImageAssets.kidaneMehret,
    'saint-uriel-monthly-22': calendarImageAssets.archangelUriel,
    'saint-mercurius-monthly-25': calendarImageAssets.stMerkorious,
    'st-merkorious': calendarImageAssets.stMerkorious,
    'kidus-merkorious': calendarImageAssets.stMerkorious,
    'kidus-mercurius': calendarImageAssets.stMerkorious,
    mercurius: calendarImageAssets.stMerkorious,
    'christ-nativity-monthly-29': calendarImageAssets.gena,
    /** Monthly Marian day — prefer dedicated monthly art when bundled. */
    'beale-maryam': calendarImageAssets.saintMaryCommemoration,
    'saint-mary-monthly-21': calendarImageAssets.saintMaryCommemoration,
    'beale-michael': calendarImageAssets.saintMichaelCommemoration,
    'saint-michael-monthly-12': calendarImageAssets.saintMichaelCommemoration,
    'beale-gabriel': calendarImageAssets.saintGabrielCommemoration,
    'saint-gabriel-monthly-19': calendarImageAssets.saintGabrielCommemoration,
    'beale-selassie': calendarImageAssets.holyTrinityCommemoration,
    'daily-senksar-commemoration': calendarImageAssets.ethiopianSaintsRemembrance,
    'righteous-remembrance': calendarImageAssets.monasticSaintsRemembrance,
    'abune-teklehaymanot': calendarImageAssets.abuneTeklehaymanot,
    'saint-mary-commemoration': calendarImageAssets.saintMaryCommemoration,
    'saint-michael-commemoration': calendarImageAssets.saintMichaelCommemoration,
    'saint-gabriel-commemoration': calendarImageAssets.saintGabrielCommemoration,
  },
  monthlyByEthMonth: {
    1: calendarImageAssets.enkutatash,
    2: calendarImageAssets.tsigeSeason,
    3: calendarImageAssets.tsomeNebiyat,
    4: calendarImageAssets.gena,
    5: calendarImageAssets.timket,
    6: calendarImageAssets.abiyTsom,
    7: calendarImageAssets.semuneHimamat,
    8: calendarImageAssets.fasika,
    9: calendarImageAssets.peraklitos,
    10: calendarImageAssets.tsomeHawaryat,
    11: calendarImageAssets.filsetaFast,
    12: calendarImageAssets.lidetaMaryam,
    13: calendarImageAssets.sacredCalendarContinuity,
  } as Record<number, string>,
} as const

type EventImageId = keyof typeof calendarImageManifest.eventsById

const titleKeywordMap: Array<{ pattern: RegExp; image: string }> = [
  { pattern: /abune\s+ar[ae]gawi|ar[ae]gawi|za-?\s*mikael/i, image: calendarImageAssets.abuneAregawi },
  { pattern: /saint\s+david|king\s+david|david/i, image: calendarImageAssets.saintDavid },
  { pattern: /giorgis|georgios|george/i, image: calendarImageAssets.saintGeorge },
  { pattern: /estifanos|stephen|st[eé]phanos/i, image: calendarImageAssets.saintStephen },
  { pattern: /philippos|filpos|philip/i, image: calendarImageAssets.saintPhilip },
  { pattern: /medhane\s*alem|medhanealem|savior of the world/i, image: calendarImageAssets.medhaneAlem },
  { pattern: /merkorious|mercurius|merkourios|philopator/i, image: calendarImageAssets.stMerkorious },
  { pattern: /teklehaymanot|ተክለሃይማኖት/i, image: calendarImageAssets.abuneTeklehaymanot },
  { pattern: /yohannes|john the baptist|መጥምቅ/i, image: calendarImageAssets.saintJohnTheBaptist },
  { pattern: /giorgis|george|ጊዮርጊስ/i, image: calendarImageAssets.kidusGiorgis },
  { pattern: /yared|ያሬድ/i, image: calendarImageAssets.saintYared },
  { pattern: /stephen|st[eé]phanos|እስጢፋኖስ/i, image: calendarImageAssets.saintStephen },
  { pattern: /peter.*paul|ጴጥሮስ.*ጳውሎስ/i, image: calendarImageAssets.apostlesPeterAndPaul },
  { pattern: /raphael|ሩፋኤል/i, image: calendarImageAssets.archangelRaphael },
  { pattern: /uriel|ዑራኤል/i, image: calendarImageAssets.archangelUriel },
  { pattern: /michael|ሚካኤል/i, image: calendarImageAssets.saintMichaelCommemoration },
  { pattern: /gabriel|ገብርኤል/i, image: calendarImageAssets.saintGabrielCommemoration },
  { pattern: /mary|ማርያም|marian/i, image: calendarImageAssets.saintMaryCommemoration },
  { pattern: /kidane|ኪዳነ/i, image: calendarImageAssets.kidaneMehret },
  { pattern: /tsinset|annunciation|ጽንሰት/i, image: calendarImageAssets.tsinset },
  { pattern: /gizret|circumcision|ግዝረት/i, image: calendarImageAssets.gizret },
  { pattern: /kana|galilee|ቃና/i, image: calendarImageAssets.kanaZeGalilee },
  { pattern: /megabit.*meskel|መጋቢት.*መስቀል/i, image: calendarImageAssets.megabitMeskel },
  { pattern: /rikbe|kahnat|meeting of priests/i, image: calendarImageAssets.meetingOfPriests },
  { pattern: /trinity|sellass|ሥላሴ/i, image: calendarImageAssets.holyTrinityCommemoration },
  { pattern: /zemene tinsae|bright season|resurrection season/i, image: calendarImageAssets.zemeneTinsae },
  { pattern: /gehad|struggle fast|ገሃድ/i, image: calendarImageAssets.tsomeGehad },
  { pattern: /apostle|hawaryat|ሐዋርያት/i, image: calendarImageAssets.apostlesRemembrance },
  { pattern: /archangel|መላእክት/i, image: calendarImageAssets.archangelsRemembrance },
  { pattern: /monastic|ገዳማት/i, image: calendarImageAssets.monasticSaintsRemembrance },
  { pattern: /saint|martyr|senkessar|ቅዱሳን/i, image: calendarImageAssets.ethiopianSaintsRemembrance },
]

export function resolveEventImageById(id?: string | null): string | undefined {
  if (!id) return undefined
  const normalized = id.trim().toLowerCase() as EventImageId
  return calendarImageManifest.eventsById[normalized]
}

/**
 * Fine-tuned focal points for cover-cropped calendar cards so key subjects stay visible.
 * Default is center-ish upper-third for icon-heavy art.
 */
const EVENT_IMAGE_FOCAL_POINTS: Record<string, string> = {
  fasika: '50% 40%',
  timket: '50% 34%',
  gena: '50% 34%',
  hosanna: '50% 36%',
  siqlet: '50% 30%',
  'good-friday': '50% 30%',
  peraklitos: '50% 36%',
  ascension: '50% 34%',
  erget: '50% 34%',
  'debre-tabor': '50% 30%',
  meskel: '50% 34%',
  'damawi-tensae': '50% 32%',
  'saint-mary-commemoration': '50% 30%',
  'saint-michael-commemoration': '50% 30%',
  'saint-gabriel-commemoration': '50% 30%',
  'saint-tekle-haymanot-major': '50% 28%',
  'saint-tekle-haymanot-monthly-24': '50% 28%',
  'saint-george-major': '50% 30%',
  'saint-george-monthly-23': '50% 30%',
  'saint-georgios': '50% 30%',
  'saint-georgios-monthly-23': '50% 30%',
  'kidus-estifanos': '50% 30%',
  'kidus-estifanos-major': '50% 30%',
  'saint-philip': '50% 32%',
  'abune-aregawi': '50% 30%',
  'abune-aragawi': '50% 30%',
  'saint-david': '50% 32%',
  'medhane-alem': '50% 50%',
  'medhane-alem-monthly-27': '50% 50%',
  'saint-mercurius-monthly-25': '50% 50%',
  'saint-john-the-baptist': '50% 30%',
}

export function resolveEventImageObjectPosition(
  id?: string | null,
  fallback = '50% 34%',
): string {
  if (!id) return fallback
  const normalized = id.trim().toLowerCase()
  return EVENT_IMAGE_FOCAL_POINTS[normalized] ?? fallback
}

export type CalendarImagePresentation = {
  objectFit: 'cover' | 'contain'
  objectPosition: string
}

export type CalendarImageFocalMeta = {
  focalPoint?: string | null
  focalX?: number | null
  focalY?: number | null
}

export function resolveCalendarImageFocalPoint(
  meta?: CalendarImageFocalMeta | null,
): string | undefined {
  const explicit = meta?.focalPoint?.trim()
  if (explicit) return explicit
  if (typeof meta?.focalX === 'number' && typeof meta?.focalY === 'number') {
    const x = Math.min(100, Math.max(0, meta.focalX))
    const y = Math.min(100, Math.max(0, meta.focalY))
    return `${x}% ${y}%`
  }
  return undefined
}

/**
 * Some observance art is portrait/icon-like. For those IDs, `contain` prevents face/halo clipping.
 * Landscape feast scenes remain `cover` with tuned focal points.
 */
const EVENT_IMAGE_CONTAIN_IDS = new Set<string>([
  'saint-mary-commemoration',
  'saint-michael-commemoration',
  'saint-gabriel-commemoration',
  'saint-tekle-haymanot-major',
  'saint-tekle-haymanot-monthly-24',
  'saint-george-major',
  'saint-george-monthly-23',
  'saint-georgios',
  'saint-georgios-monthly-23',
  'saint-john-the-baptist',
  'saint-yared-major',
  'saint-stephen-major',
  'kidus-estifanos',
  'kidus-estifanos-major',
  'saint-philip',
  'abune-aregawi',
  'abune-aragawi',
  'saint-david',
  'daily-senksar-commemoration',
  'righteous-remembrance',
  'abune-teklehaymanot',
])

export function resolveEventImagePresentation(
  id?: string | null,
  fallback: CalendarImagePresentation = {
    objectFit: 'cover',
    objectPosition: '50% 30%',
  },
  focalMeta?: CalendarImageFocalMeta | null,
): CalendarImagePresentation {
  const explicitFocal = resolveCalendarImageFocalPoint(focalMeta)
  if (!id) {
    return explicitFocal ? { ...fallback, objectPosition: explicitFocal } : fallback
  }
  const normalized = id.trim().toLowerCase()
  const objectPosition =
    explicitFocal ?? EVENT_IMAGE_FOCAL_POINTS[normalized] ?? fallback.objectPosition
  const objectFit = EVENT_IMAGE_CONTAIN_IDS.has(normalized)
    ? 'contain'
    : fallback.objectFit
  return { objectFit, objectPosition }
}

export function resolveCommemorationImage(
  title: string,
  transliterationTitle?: string,
  catalogEventId?: string | null,
): string {
  const fromCatalog = resolveEventImageById(catalogEventId)
  if (fromCatalog) return fromCatalog
  const combined = `${title} ${transliterationTitle ?? ''}`
  const direct = resolveEventImageById(
    combined
      .toLowerCase()
      .replace(/[^\w\s-]/g, ' ')
      .trim()
      .replace(/\s+/g, '-'),
  )
  if (direct) return direct
  for (const matcher of titleKeywordMap) {
    if (matcher.pattern.test(combined)) return matcher.image
  }
  return calendarImageManifest.remembrance.ethiopianSaints
}

export function resolveUpcomingImage(item: UpcomingObservance): string {
  const fromId = resolveEventImageById(item.id)
  if (fromId) return fromId
  const fromKw = resolveCommemorationImage(item.title, item.transliterationTitle)
  const generic = calendarImageManifest.remembrance.ethiopianSaints
  if (item.kind === 'fast' || item.kind === 'weekly') {
    if (fromKw !== generic) return fromKw
    return calendarImageManifest.support.fastingSeasonAtmosphere
  }
  if (
    (item.kind === 'feast' || item.kind === 'season') &&
    fromKw === generic
  ) {
    return calendarImageManifest.support.feastDayPreparation
  }
  return fromKw
}

/** Rich hero for a selected civil day: catalog art, else monthly rhythm, else remembrance. */
export function resolveSelectedDayHeroImage(snapshot: ChurchDaySnapshot): string {
  const ethMonth = snapshot.ethiopian.month
  const isDailySenksar =
    snapshot.commemoration.catalogEventId === 'daily-senksar-commemoration'
  if (isDailySenksar && snapshot.movableOnDay?.length) {
    for (const m of snapshot.movableOnDay) {
      const fromMovable = resolveEventImageById(m.catalogEventId)
      if (fromMovable) return fromMovable
    }
  }
  const catalog = resolveEventImageById(snapshot.commemoration.catalogEventId)
  if (catalog) return catalog
  const monthly = resolveMonthlyImage(ethMonth)
  const commemoration = resolveCommemorationImage(
    snapshot.commemoration.title,
    snapshot.commemoration.transliterationTitle,
    snapshot.commemoration.catalogEventId,
  )
  if (commemoration !== calendarImageManifest.remembrance.ethiopianSaints) {
    return commemoration
  }
  return monthly
}

export function observanceTypeLabel(item: UpcomingObservance): string {
  const t = `${item.title} ${item.transliterationTitle ?? ''}`
  if (item.kind === 'fast') return 'Fast'
  if (item.kind === 'feast') {
    if (/mary|ማርያም|marian|lideta/i.test(t)) return 'Marian'
    if (/cross|meskel|tsige|መስቀል/i.test(t)) return 'Feast'
    if (/trinity|selass|ሥላሴ/i.test(t)) return 'Feast'
    return 'Feast'
  }
  if (/mary|ማርያም|marian/i.test(t)) return 'Marian'
  if (/michael|gabriel|raphael|archangel|መላእክት/i.test(t)) return 'Angel'
  if (/fast|tsome|ጾም/i.test(t)) return 'Fast'
  if (/season|ወቅት|pagumen/i.test(t)) return 'Season'
  return 'Saint'
}

export function resolveSeasonSupportImage(
  seasonId?: string,
  seasonalFast?: string | null,
): string {
  const id = (seasonId ?? '').toLowerCase()
  if (id.includes('tikimt') || id.includes('hidar')) {
    return calendarImageManifest.support.liturgicalSeasonLegacy
  }
  if (id.includes('meskerem') || id.includes('pagumen')) {
    return calendarImageManifest.support.sacredCalendarContinuity
  }
  if (seasonalFast?.trim()) {
    return calendarImageManifest.support.fastingSeasonAtmosphere
  }
  if (id.includes('miazia') || id.includes('ginbot')) {
    return calendarImageManifest.support.joyfulFeastSeason
  }
  return calendarImageManifest.support.feastDayPreparation
}

export function resolveMonthlyImage(ethiopianMonth?: number): string {
  if (!ethiopianMonth) return calendarImageManifest.anchors.todayInChurch
  return (
    calendarImageManifest.monthlyByEthMonth[ethiopianMonth] ??
    calendarImageManifest.anchors.todayInChurch
  )
}
