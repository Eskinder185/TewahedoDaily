import { parseYoutubeVideoId } from '../../data/utils/youtube'
import { youtubeWatchUrl } from '../../lib/practice'
import type { ChantForm, ChantLibraryEntry } from '../../lib/practice/chantLibrary'
import type { MezmurCategory } from '../../data/types/mezmur'

const MEZMUR_CAT: Record<MezmurCategory, string> = {
  praise: 'Praise & thanksgiving',
  lament: 'Lament & supplication',
  communion: 'Communion & the mysteries',
  feast: 'Feast & celebration',
  ordinary: 'Ordinary time',
  other: 'General',
}

/** Learning context derived from chant JSON — never rewrites lyrics text. */
export type ChantLearningMeta = {
  meaning?: string
  categoryLabel?: string
  /** Keyword tags from workshop `category.themes` (mezmur) */
  themesLine?: string
  feastLine?: string
  seasonLine?: string
  /** Saints tags from workshop `category.saints` */
  saintsLine?: string
  /** Major-holiday tags from workshop `category.majorHoliday` */
  majorHolidayLine?: string
  /** `category.confidence` from workshop JSON */
  categoryConfidence?: string
  movementGuide?: string
  postureNotes?: string
  instrumentSummary?: string
  /** Werb: free text; mezmur: joined `category.usage` tags */
  usage?: string
  season?: string
  beginnerTips?: string
  mistakesToAvoid?: string
  instrumentUsage?: string
}

export type ChantPracticePayload = {
  form: ChantForm
  /** Stable key for React / player teardown */
  entryId: string
  title: string
  transliterationTitle: string
  /** Ge’ez (or primary script) — full string from JSON */
  lyricsGez: string
  transliterationLyrics: string
  videoId: string | null
  /** Open in YouTube when embed is unavailable */
  watchUrl?: string
  learning?: ChantLearningMeta
}

export function chantEntryToPracticePayload(
  entry: ChantLibraryEntry,
): ChantPracticePayload {
  if (entry.form === 'mezmur') {
    const m = entry.item
    const id = m.youtubeId?.trim() || null
    const joinTags = (arr: string[] | undefined) =>
      arr?.length ? arr.join(', ') : undefined
    const learning: ChantLearningMeta = {
      meaning: m.meaning?.trim() || undefined,
      categoryLabel: m.category ? MEZMUR_CAT[m.category] : undefined,
      themesLine: joinTags(m.categoryThemes),
      feastLine: m.feastLine?.trim() || undefined,
      seasonLine: m.seasonLine?.trim() || undefined,
      saintsLine: joinTags(m.categorySaints),
      majorHolidayLine: joinTags(m.categoryMajorHoliday),
      categoryConfidence: m.categoryConfidence?.trim() || undefined,
      usage: joinTags(m.categoryUsage),
      movementGuide: m.movementGuide?.trim() || undefined,
      postureNotes: m.postureNotes?.trim() || undefined,
      instrumentSummary: m.instrumentSummary?.trim() || undefined,
    }
    return {
      form: 'mezmur',
      entryId: m.id,
      title: m.title,
      transliterationTitle: m.titleTransliteration,
      lyricsGez: m.lyricsGez,
      transliterationLyrics: m.lyricsTransliteration ?? '',
      videoId: id || null,
      watchUrl: id ? youtubeWatchUrl(id) : undefined,
      learning,
    }
  }
  const w = entry.item
  const id = w.youtubeUrl ? parseYoutubeVideoId(w.youtubeUrl) : null
  const learning: ChantLearningMeta = {
    meaning: w.meaning?.trim() || undefined,
    usage: w.usage?.trim() || undefined,
    season: w.season?.trim() || undefined,
    movementGuide: w.movementGuide?.trim() || undefined,
    postureNotes: w.postureNotes?.trim() || undefined,
    instrumentUsage: w.instrumentUsage?.trim() || undefined,
    beginnerTips: w.beginnerTips?.trim() || undefined,
    mistakesToAvoid: w.mistakesToAvoid?.trim() || undefined,
  }
  return {
    form: 'werb',
    entryId: w.id,
    title: w.title,
    transliterationTitle: w.transliterationTitle,
    lyricsGez: w.lyrics,
    transliterationLyrics: w.transliterationLyrics ?? '',
    videoId: id,
    watchUrl: w.youtubeUrl,
    learning,
  }
}

export function chantEntryHasVideo(entry: ChantLibraryEntry): boolean {
  return chantEntryToPracticePayload(entry).videoId !== null
}

export type CustomPracticeInput = {
  youtubeUrl: string
  title?: string
  lyricsGez?: string
  transliterationLyrics?: string
  notes?: string
}

/**
 * Build a practice payload from a pasted YouTube URL plus optional text fields.
 * Uses the same `ChantPracticePayload` shape as library chants so the player, loops, and lyrics tools work unchanged.
 */
export type CustomPracticeBuildError = 'missing_url' | 'invalid_url'

export function buildCustomPracticePayload(
  input: CustomPracticeInput,
):
  | { ok: true; payload: ChantPracticePayload }
  | { ok: false; error: CustomPracticeBuildError } {
  const raw = input.youtubeUrl?.trim() ?? ''
  if (!raw) {
    return { ok: false, error: 'missing_url' }
  }
  const id = parseYoutubeVideoId(raw)
  if (!id) {
    return { ok: false, error: 'invalid_url' }
  }

  const title = input.title?.trim() || 'Custom practice'
  const translitTitle = input.title?.trim() || 'YouTube'
  const lyrics = input.lyricsGez?.trim() ?? ''
  const translit = input.transliterationLyrics?.trim() ?? ''
  const notes = input.notes?.trim()

  const learning: ChantLearningMeta = {}
  if (notes) learning.meaning = notes

  const payload: ChantPracticePayload = {
    form: 'mezmur',
    entryId: `custom:${id}`,
    title,
    transliterationTitle: translitTitle,
    lyricsGez: lyrics,
    transliterationLyrics: translit,
    videoId: id,
    watchUrl: youtubeWatchUrl(id),
    learning: Object.keys(learning).length ? learning : undefined,
  }

  return { ok: true, payload }
}

export function formatChantTime(sec: number | null): string {
  if (sec === null || !Number.isFinite(sec)) return '—'
  const m = Math.floor(sec / 60)
  const s = Math.floor(sec % 60)
  return `${m}:${s.toString().padStart(2, '0')}`
}
