import type {
  MezmurCategory,
  MezmurCategoryDetail,
  MezmurEntry,
} from '../../data/types/mezmur'
import amharicChants from '../../data/chants/amharic-chants.json'
import englishChantsPack from '../../data/chants/english-mezmur-chants.json'

function stringArray(v: unknown): string[] | undefined {
  if (!Array.isArray(v)) return undefined
  const out = v.filter(
    (x): x is string => typeof x === 'string' && x.trim().length > 0,
  )
  return out.length ? out : undefined
}

/** Workshop JSON sometimes used `language: ["amharic"]` — coerce to a single string. */
function normalizeWorkshopLanguage(raw: unknown): string | undefined {
  if (typeof raw === 'string' && raw.trim()) return raw.trim()
  if (Array.isArray(raw)) {
    const parts = raw.filter(
      (x): x is string => typeof x === 'string' && x.trim().length > 0,
    )
    if (!parts.length) return undefined
    return parts.map((x) => x.trim()).join('-')
  }
  return undefined
}

function parseWorkshopCategory(
  raw: unknown,
): MezmurCategory | MezmurCategoryDetail {
  if (typeof raw === 'string') {
    const t = raw.trim()
    if (t) return t as MezmurCategory
    return 'other'
  }
  if (raw && typeof raw === 'object' && !Array.isArray(raw)) {
    const o = raw as Record<string, unknown>
    const primary =
      typeof o.primary === 'string' && o.primary.trim()
        ? o.primary.trim()
        : 'other'
    return {
      primary,
      majorHoliday: stringArray(o.majorHoliday),
      saints: stringArray(o.saints),
      themes: stringArray(o.themes),
      usage: stringArray(o.usage),
      season: stringArray(o.season),
      confidence:
        typeof o.confidence === 'string' && o.confidence.trim()
          ? o.confidence.trim()
          : undefined,
    }
  }
  return 'other'
}

function normalizeWorkshopRow(raw: unknown): MezmurEntry | null {
  if (!raw || typeof raw !== 'object') return null
  const o = raw as Record<string, unknown>
  const id = typeof o.id === 'string' ? o.id : null
  if (!id) return null
  const isMezmurForm =
    o.type === 'mezmur' ||
    (o.type === 'chant' && o.form === 'mezmur')
  if (!isMezmurForm) return null
  const youtubeUrl = typeof o.youtubeUrl === 'string' ? o.youtubeUrl : ''
  return {
    id,
    type: 'mezmur',
    title: String(o.title ?? ''),
    transliterationTitle: String(o.transliterationTitle ?? ''),
    lyrics: String(o.lyrics ?? ''),
    transliterationLyrics: String(o.transliterationLyrics ?? ''),
    meaning: typeof o.meaning === 'string' ? o.meaning : undefined,
    youtubeUrl,
    thumbnail: typeof o.thumbnail === 'string' ? o.thumbnail : undefined,
    category: parseWorkshopCategory(o.category),
    feast: typeof o.feast === 'string' ? o.feast : undefined,
    season: typeof o.season === 'string' ? o.season : undefined,
    movementGuide: typeof o.movementGuide === 'string' ? o.movementGuide : undefined,
    postureNotes: typeof o.postureNotes === 'string' ? o.postureNotes : undefined,
    instrumentSummary:
      typeof o.instrumentSummary === 'string' ? o.instrumentSummary : undefined,
    language: normalizeWorkshopLanguage(o.language),
  }
}

function loadAmharicEntries(): MezmurEntry[] {
  const arr = Array.isArray(amharicChants) ? amharicChants : []
  return arr
    .map(normalizeWorkshopRow)
    .filter(Boolean)
    .map((e) => {
      const m = e as MezmurEntry
      return { ...m, language: m.language ?? 'am' }
    })
}

function normalizeEnglishLanguage(lang: string | undefined): string {
  if (lang == null || lang === '') return 'en'
  const t = lang.trim().toLowerCase()
  if (t === 'english') return 'en'
  return lang
}

function loadEnglishEntries(): MezmurEntry[] {
  // Import the English chants JSON directly and extract the entries array
  const entries = Array.isArray(englishChantsPack.entries) ? englishChantsPack.entries : []
  return entries
    .map(normalizeWorkshopRow)
    .filter(Boolean)
    .map((e) => {
      const m = e as MezmurEntry
      return { ...m, language: normalizeEnglishLanguage(m.language ?? 'en') }
    })
}

/** Chants from `data/chants/amharic-chants.json` (array) and `english-mezmur-chants.json` (`entries` or array). */
export const CHANT_WORKSHOP_MEZMUR_ENTRIES: MezmurEntry[] = [
  ...loadAmharicEntries(),
  ...loadEnglishEntries(),
]
