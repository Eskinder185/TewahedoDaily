/**
 * Calendar Card image storage paths under content-media/calendar/<category>/.
 * Broad category folders + reusable subject filenames (not per-date folders).
 */

export const CALENDAR_IMAGE_ROOT = 'calendar'

export const CALENDAR_IMAGE_CATEGORY_FOLDERS = [
  'christ',
  'mary',
  'angels',
  'saints',
  'apostles',
  'prophets',
  'martyrs',
  'trinity',
  'holy-spirit',
  'cross',
  'fasts',
  'seasons',
  'church-events',
  'general',
] as const

export type CalendarImageCategoryFolder = (typeof CALENDAR_IMAGE_CATEGORY_FOLDERS)[number]

/** Media library filter labels for calendar subfolders. */
export const CALENDAR_MEDIA_FILTERS: Array<{
  id: string
  label: string
  folderPrefix: string
}> = [
  { id: 'all-calendar', label: 'All Calendar', folderPrefix: `${CALENDAR_IMAGE_ROOT}/` },
  { id: 'christ', label: 'Christ', folderPrefix: `${CALENDAR_IMAGE_ROOT}/christ/` },
  { id: 'mary', label: 'Mary', folderPrefix: `${CALENDAR_IMAGE_ROOT}/mary/` },
  { id: 'angels', label: 'Angels', folderPrefix: `${CALENDAR_IMAGE_ROOT}/angels/` },
  { id: 'saints', label: 'Saints', folderPrefix: `${CALENDAR_IMAGE_ROOT}/saints/` },
  { id: 'apostles', label: 'Apostles', folderPrefix: `${CALENDAR_IMAGE_ROOT}/apostles/` },
  { id: 'prophets', label: 'Prophets', folderPrefix: `${CALENDAR_IMAGE_ROOT}/prophets/` },
  { id: 'martyrs', label: 'Martyrs', folderPrefix: `${CALENDAR_IMAGE_ROOT}/martyrs/` },
  { id: 'trinity', label: 'Trinity', folderPrefix: `${CALENDAR_IMAGE_ROOT}/trinity/` },
  { id: 'holy-spirit', label: 'Holy Spirit', folderPrefix: `${CALENDAR_IMAGE_ROOT}/holy-spirit/` },
  { id: 'cross', label: 'Cross', folderPrefix: `${CALENDAR_IMAGE_ROOT}/cross/` },
  { id: 'fasts', label: 'Fasts', folderPrefix: `${CALENDAR_IMAGE_ROOT}/fasts/` },
  { id: 'seasons', label: 'Seasons', folderPrefix: `${CALENDAR_IMAGE_ROOT}/seasons/` },
  {
    id: 'church-events',
    label: 'Church Events',
    folderPrefix: `${CALENDAR_IMAGE_ROOT}/church-events/`,
  },
  { id: 'general', label: 'General', folderPrefix: `${CALENDAR_IMAGE_ROOT}/general/` },
]

/**
 * Verified subject aliases from existing project data / requested mappings.
 * Do not invent saint identities beyond this list.
 */
export const CALENDAR_IMAGE_SUBJECT_ALIASES: Record<string, string> = {
  giorgis: 'george',
  'kidus-giorgis': 'george',
  'saint-giorgis': 'george',
  'saint-georgios': 'george',
  georgios: 'george',
  maryam: 'virgin-mary',
  'saint-maryam': 'virgin-mary',
  'saint-mary': 'virgin-mary',
  'qidist-maryam': 'virgin-mary',
  trinity: 'holy-trinity',
  'holy-trinity': 'holy-trinity',
}

const PREFIXES_TO_STRIP = [
  'saint-',
  'kidus-',
  'qidist-',
  'abune-',
  'archangel-',
  'monthly-',
] as const

const SUFFIXES_TO_STRIP = [
  /-monthly-\d+$/i,
  /-monthly$/i,
  /-commemoration$/i,
  /-remembrance$/i,
] as const

export type CalendarImageSuggestInput = {
  sourceSlug?: string | null
  cardSlug?: string | null
  category?: string | null
  cardType?: string | null
  title?: string | null
}

function slugifySegment(value: string): string {
  return value
    .normalize('NFKD')
    .toLowerCase()
    .replace(/[^\p{L}\p{N}]+/gu, '-')
    .replace(/-+/g, '-')
    .replace(/^-|-$/g, '')
}

/** Map CMS category / card_type to a calendar storage folder. */
export function calendarCategoryToImageFolder(
  category?: string | null,
  cardType?: string | null,
): CalendarImageCategoryFolder {
  const raw = `${category || ''} ${cardType || ''}`.trim().toLowerCase()
  const compact = raw.replace(/[_-]+/g, ' ')

  if (/\bangel/.test(compact)) return 'angels'
  if (/\bmary|\bmarian/.test(compact)) return 'mary'
  if (/\bchrist|\bjesus|\blord/.test(compact)) return 'christ'
  if (/\bmartyr/.test(compact)) return 'martyrs'
  if (/\bapostle/.test(compact)) return 'apostles'
  if (/\bprophet/.test(compact)) return 'prophets'
  if (/\btrinity/.test(compact)) return 'trinity'
  if (/\bholy spirit|\bparaclete|\bperaklitos/.test(compact)) return 'holy-spirit'
  if (/\bcross|\bmeskel|\bdemera/.test(compact)) return 'cross'
  if (/\bfast|\btsom/.test(compact)) return 'fasts'
  if (/\bseason|\bzemene/.test(compact)) return 'seasons'
  if (/\bchurch event|\bliturgy|\bmeeting of priests/.test(compact)) return 'church-events'
  if (/\bsaint/.test(compact)) return 'saints'

  const type = (cardType || '').trim().toLowerCase()
  if (type === 'angel') return 'angels'
  if (type === 'mary') return 'mary'
  if (type === 'martyr') return 'martyrs'
  if (type === 'apostle') return 'apostles'
  if (type === 'prophet') return 'prophets'
  if (type === 'fast') return 'fasts'
  if (type === 'saint') return 'saints'
  if (type === 'feast') return 'general'

  return 'general'
}

/**
 * Normalize a calendar slug into a reusable subject filename stem.
 * Strips recurrence-only suffixes (-monthly, -monthly-19) and known prefixes.
 */
export function normalizeCalendarImageSubject(slugOrTitle: string): string {
  let value = slugifySegment(slugOrTitle)
  if (!value) return 'image'

  for (const prefix of PREFIXES_TO_STRIP) {
    if (value.startsWith(prefix)) value = value.slice(prefix.length)
  }

  for (const pattern of SUFFIXES_TO_STRIP) {
    value = value.replace(pattern, '')
  }

  // Drop trailing numeric day tokens left after monthly strip (gabriel-19 → gabriel)
  // only when the remaining stem is still meaningful.
  const withoutDay = value.replace(/-\d{1,2}$/, '')
  if (withoutDay.length >= 3) value = withoutDay

  const aliased = CALENDAR_IMAGE_SUBJECT_ALIASES[value]
  if (aliased) return aliased

  // Partial alias: last segment or known alias embedded (e.g. saint-gabriel already stripped)
  const parts = value.split('-').filter(Boolean)
  if (parts.length) {
    const last = parts[parts.length - 1]
    if (CALENDAR_IMAGE_SUBJECT_ALIASES[last]) {
      return CALENDAR_IMAGE_SUBJECT_ALIASES[last]
    }
  }

  return value || 'image'
}

export function buildCalendarImagePath(
  folder: CalendarImageCategoryFolder,
  subjectStem: string,
  extension: 'webp' | 'jpg' | 'jpeg' | 'png' = 'webp',
): string {
  const stem = normalizeCalendarImageSubject(subjectStem)
  const ext = extension === 'jpeg' ? 'jpg' : extension
  return `${CALENDAR_IMAGE_ROOT}/${folder}/${stem}.${ext}`
}

/**
 * Suggest a reusable storage path for a calendar card / linked source.
 * Example: gabriel-monthly + Angel → calendar/angels/gabriel.webp
 */
export function getSuggestedCalendarImagePath(
  source: CalendarImageSuggestInput,
): string | null {
  const folder = calendarCategoryToImageFolder(source.category, source.cardType)
  const raw =
    (source.sourceSlug || '').trim() ||
    (source.cardSlug || '').trim() ||
    (source.title || '').trim()
  if (!raw) return null
  const subject = normalizeCalendarImageSubject(raw)
  if (!subject || subject === 'image') return null
  return buildCalendarImagePath(folder, subject, 'webp')
}

/** True when path looks like calendar/<known-folder>/… */
export function isValidCalendarImagePath(path: string | null | undefined): boolean {
  const bare = (path || '')
    .trim()
    .replace(/^storage:\/\/[^/]+\//, '')
    .replace(/^https?:\/\/[^/]+\/storage\/v1\/object\/public\/[^/]+\//, '')
    .replace(/^\/+/, '')
  if (!bare.startsWith(`${CALENDAR_IMAGE_ROOT}/`)) return false
  const parts = bare.split('/')
  if (parts.length < 3) return false
  const folder = parts[1]
  return (CALENDAR_IMAGE_CATEGORY_FOLDERS as readonly string[]).includes(folder)
}

export function calendarMediaFolderPrefix(
  category?: string | null,
  cardType?: string | null,
): string {
  return `${CALENDAR_IMAGE_ROOT}/${calendarCategoryToImageFolder(category, cardType)}`
}

/** Recommended alt text when none is provided — never a raw filename. */
export function suggestCalendarImageAlt(title?: string | null, category?: string | null): string {
  const name = (title || '').trim()
  if (name) return name
  const cat = (category || '').trim()
  if (cat) return cat
  return 'Calendar observance image'
}
