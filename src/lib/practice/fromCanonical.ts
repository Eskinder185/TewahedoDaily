import type {
  MezmurCategory,
  MezmurCategoryDetail,
  MezmurEntry,
} from '../../data/types/mezmur'
import type { PrayerEntry } from '../../data/types/tselot'
import { parseYoutubeVideoId } from '../../data/utils/youtube'
import type { MezmurItem, TselotPrayer } from './types'

function chantCategoryToMezmurCategory(raw: unknown): MezmurCategory | undefined {
  if (typeof raw === 'string') return raw as MezmurCategory
  if (raw && typeof raw === 'object' && 'primary' in raw) {
    const p = String((raw as { primary?: unknown }).primary ?? '')
    const map: Record<string, MezmurCategory> = {
      mary: 'feast',
      praise: 'praise',
      lament: 'lament',
      communion: 'communion',
      feast: 'feast',
      ordinary: 'ordinary',
      other: 'other',
      'major-holiday': 'feast',
      general: 'ordinary',
      saint: 'feast',
      liturgical: 'communion',
    }
    return map[p] ?? 'other'
  }
  return undefined
}

function mezmurCategoryDetail(
  c: MezmurEntry['category'],
): MezmurCategoryDetail | null {
  if (typeof c === 'string') return null
  return c
}

export function mezmurEntryToMezmurItem(e: MezmurEntry): MezmurItem {
  const youtubeId = parseYoutubeVideoId((e as any).youtubeUrl)
  if (!youtubeId) {
    console.warn(`[TewahedoDaily] Missing YouTube id for mezmur "${e.id}"`, { youtubeUrl: (e as any).youtubeUrl })
  }
  const detail = mezmurCategoryDetail(e.category)
  const seasonParts: string[] = []
  if (typeof e.season === 'string' && e.season.trim()) {
    seasonParts.push(e.season.trim())
  }
  if (detail?.season?.length) {
    for (const s of detail.season) {
      if (typeof s === 'string' && s.trim()) seasonParts.push(s.trim())
    }
  }
  const seasonLine = seasonParts.length ? seasonParts.join(' · ') : undefined

  const feastSeason = [
    e.feast,
    e.season,
    ...(detail?.majorHoliday ?? []),
    ...(detail?.season ?? []),
    ...(detail?.themes ?? []),
    ...(detail?.usage ?? []),
  ]
    .filter((x): x is string => typeof x === 'string' && x.trim().length > 0)
    .join(' · ')

  const category =
    chantCategoryToMezmurCategory(e.category) ??
    (typeof e.category === 'string' ? (e.category as MezmurCategory) : 'other')
  return {
    id: e.id,
    title: e.title,
    youtubeId: youtubeId ?? '',
    thumbnailUrl: e.thumbnail,
    titleTransliteration: e.transliterationTitle,
    lyricsGez: e.lyrics,
    lyricsTransliteration: e.transliterationLyrics,
    meaning: e.meaning,
    relatedFeast: feastSeason || undefined,
    category,
    feastLine: e.feast,
    seasonLine,
    categoryThemes: detail?.themes,
    categoryUsage: detail?.usage,
    categorySaints: detail?.saints,
    categoryMajorHoliday: detail?.majorHoliday,
    categoryConfidence: detail?.confidence,
    language: e.language,
    movementGuide: e.movementGuide,
    postureNotes: e.postureNotes,
    instrumentSummary: e.instrumentSummary,
  }
}

function joinTextBlocks(t: PrayerEntry['text'] | unknown): string {
  if (!t || typeof t !== 'object') return ''
  const o = t as Record<string, unknown>
  return [o.amharic, o.geez, o.english]
    .filter((s): s is string => typeof s === 'string')
    .map((s) => s.trim())
    .filter(Boolean)
    .join('\n\n')
}

function safePrayerCategory(
  e: PrayerEntry,
): {
  primary: TselotPrayer['categoryPrimary']
  usage: string[]
  season: string[]
  confidence: string
} {
  const c = e.category
  if (c && typeof c === 'object' && 'primary' in c && typeof c.primary === 'string') {
    return {
      primary: c.primary as TselotPrayer['categoryPrimary'],
      usage: Array.isArray(c.usage) ? c.usage : [],
      season: Array.isArray(c.season) ? c.season : [],
      confidence: typeof c.confidence === 'string' ? c.confidence : '',
    }
  }
  return {
    primary: 'daily',
    usage: [],
    season: [],
    confidence: 'low',
  }
}

function safeSummary(e: PrayerEntry): { amharic: string; english: string } {
  const s = e.summary
  if (s && typeof s === 'object') {
    return {
      amharic: typeof s.amharic === 'string' ? s.amharic : '',
      english: typeof s.english === 'string' ? s.english : '',
    }
  }
  return { amharic: '', english: '' }
}

function safeTextBlock(
  t: PrayerEntry['text'] | unknown,
): { amharic: string; geez: string; english: string } {
  if (!t || typeof t !== 'object') {
    return { amharic: '', geez: '', english: '' }
  }
  const o = t as Record<string, unknown>
  return {
    amharic: typeof o.amharic === 'string' ? o.amharic : '',
    geez: typeof o.geez === 'string' ? o.geez : '',
    english: typeof o.english === 'string' ? o.english : '',
  }
}

function safeSource(e: PrayerEntry): TselotPrayer['source'] {
  const s = e.source
  if (s && typeof s === 'object') {
    return {
      bookTitle: typeof s.bookTitle === 'string' ? s.bookTitle : '',
      fullTextLink: typeof s.fullTextLink === 'string' ? s.fullTextLink : '',
      audioUrl: typeof s.audioUrl === 'string' ? s.audioUrl : '',
    }
  }
  return { bookTitle: '', fullTextLink: '', audioUrl: '' }
}

export function prayerEntryToTselotPrayer(e: PrayerEntry): TselotPrayer {
  const text = safeTextBlock(e.text)
  const transliteration = safeTextBlock(e.transliteration)
  const fullText = joinTextBlocks(text)
  const summary = safeSummary(e)
  const cat = safePrayerCategory(e)
  const purposeLine =
    summary.english.trim() ||
    summary.amharic.trim() ||
    e.transliterationTitle.trim() ||
    e.title

  return {
    id: e.id,
    title: e.title,
    transliterationTitle: e.transliterationTitle,
    categoryPrimary: cat.primary,
    categoryUsage: cat.usage,
    categorySeason: cat.season,
    categoryConfidence: cat.confidence,
    summary,
    text,
    transliteration,
    source: safeSource(e),
    purposeLine,
    fullText,
  }
}
