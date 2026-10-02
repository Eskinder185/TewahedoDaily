/**
 * Chant library loader for legacy PracticePage / werb workshop only.
 * Public /practice Mezmur library uses src/lib/publicContent/service.ts (public.mezmur).
 * This module must not be the public hymn source of truth.
 */
import type { MezmurCategoryDetail, MezmurEntry } from '../../data/types/mezmur'
import type { WerbEntry } from '../../data/types/werb'
import type { Database, Json } from '../supabase/database.types'
import { supabase } from '../supabase/client'
import { useLegacyMezmur } from '../publicContent/service'
import { mezmurEntryToMezmurItem } from './fromCanonical'
import type { ChantLibraryEntry } from './chantLibraryModel'

type ChantRow = Database['public']['Tables']['chants']['Row']

export type ChantLibrarySource = 'supabase' | 'local'

export type ChantLibraryResult = {
  entries: ChantLibraryEntry[]
  source: ChantLibrarySource
  warning?: Error
}

const PAGE_SIZE = 500
let cachedLibrary: ChantLibraryResult | null = null
let pendingLibrary: Promise<ChantLibraryResult> | null = null

function asObject(value: Json): Record<string, Json | undefined> {
  return value && typeof value === 'object' && !Array.isArray(value)
    ? value
    : {}
}

function optionalString(value: Json | undefined): string | undefined {
  return typeof value === 'string' && value.trim() ? value : undefined
}

function categoryFromRow(row: ChantRow): MezmurCategoryDetail {
  return {
    primary: row.category_primary || 'other',
    majorHoliday: row.category_major_holidays,
    saints: row.category_saints,
    themes: row.category_themes,
    usage: row.category_usage,
    season: row.category_seasons,
    confidence: row.category_confidence ?? undefined,
  }
}

function rowToLibraryEntry(row: ChantRow): ChantLibraryEntry | null {
  const metadata = asObject(row.metadata)
  const category = categoryFromRow(row)

  if (row.form === 'mezmur') {
    const entry: MezmurEntry = {
      id: row.id,
      slug: row.slug,
      type: 'mezmur',
      title: row.title,
      transliterationTitle: row.transliteration_title,
      lyrics: row.lyrics,
      transliterationLyrics: row.transliteration_lyrics,
      meaning: row.meaning ?? undefined,
      youtubeUrl: row.youtube_url ?? '',
      audioUrl: row.audio_url ?? undefined,
      thumbnail: row.thumbnail_url ?? undefined,
      category,
      feast: optionalString(metadata.feast),
      season: optionalString(metadata.season),
      movementGuide: optionalString(metadata.movementGuide),
      postureNotes: optionalString(metadata.postureNotes),
      instrumentSummary: optionalString(metadata.instrumentSummary),
      language: row.language ?? undefined,
    }
    return { form: 'mezmur', item: mezmurEntryToMezmurItem(entry) }
  }

  if (row.form === 'werb') {
    const usageParts = [
      row.category_usage.join(' · '),
      row.category_major_holidays.join(' · '),
    ].filter(Boolean)
    const item: WerbEntry = {
      id: row.id,
      type: 'werb',
      title: row.title,
      transliterationTitle: row.transliteration_title,
      lyrics: row.lyrics,
      transliterationLyrics: row.transliteration_lyrics,
      meaning: row.meaning ?? undefined,
      youtubeUrl: row.youtube_url ?? undefined,
      thumbnail: row.thumbnail_url ?? undefined,
      teaser: optionalString(metadata.teaser),
      chantTitle: optionalString(metadata.chantTitle),
      usage:
        optionalString(metadata.usage) ?? (usageParts.join(' · ') || undefined),
      season:
        optionalString(metadata.season) ||
        row.category_seasons.join(' · ') ||
        undefined,
      movementGuide: optionalString(metadata.movementGuide),
      postureNotes: optionalString(metadata.postureNotes),
      instrumentUsage: optionalString(metadata.instrumentUsage),
      mistakesToAvoid: optionalString(metadata.mistakesToAvoid),
      beginnerTips: optionalString(metadata.beginnerTips),
      guidedSteps: Array.isArray(metadata.guidedSteps)
        ? (metadata.guidedSteps as unknown as WerbEntry['guidedSteps'])
        : undefined,
      categoryDetail: category,
      language: row.language ?? undefined,
    }
    return { form: 'werb', item }
  }

  return null
}

function compareEntries(a: ChantLibraryEntry, b: ChantLibraryEntry): number {
  return a.item.title.localeCompare(b.item.title, 'am', { sensitivity: 'base' })
}

async function loadLocalLibrary(warning?: Error): Promise<ChantLibraryResult> {
  // Legacy PracticePage only. Public library never imports JSON chant packs.
  if (!useLegacyMezmur) {
    return { entries: [], source: 'local', warning }
  }
  const { CHANT_LIBRARY } = await import('./chantLibrary')
  return { entries: CHANT_LIBRARY, source: 'local', warning }
}

async function fetchLegacyChantsTable(): Promise<ChantLibraryEntry[]> {
  if (!supabase) return []

  const rows: ChantRow[] = []
  for (let from = 0; ; from += PAGE_SIZE) {
    const { data, error } = await supabase
      .from('chants')
      .select('*')
      .eq('published', true)
      .order('title', { ascending: true })
      .range(from, from + PAGE_SIZE - 1)

    if (error) throw error
    rows.push(...data)
    if (data.length < PAGE_SIZE) break
  }

  return rows
    .map(rowToLibraryEntry)
    .filter((entry): entry is ChantLibraryEntry => entry !== null)
    .sort(compareEntries)
}

async function loadLibrary(): Promise<ChantLibraryResult> {
  if (!useLegacyMezmur) {
    return {
      entries: [],
      source: 'supabase',
      warning: new Error(
        'Public mezmur library uses public.mezmur via publicContent/service — not this loader.',
      ),
    }
  }

  if (!supabase) return loadLocalLibrary()

  try {
    const entries = await fetchLegacyChantsTable()
    if (!entries.length) {
      throw new Error('Supabase returned no published chants')
    }
    return { entries, source: 'supabase' }
  } catch (cause) {
    const warning =
      cause instanceof Error ? cause : new Error('Unable to load content. Please try again.')
    // Do not ship archived mezmur JSON as a silent fallback.
    return { entries: [], source: 'supabase', warning }
  }
}

export function getChantLibrary(): Promise<ChantLibraryResult> {
  if (cachedLibrary) return Promise.resolve(cachedLibrary)
  if (pendingLibrary) return pendingLibrary

  pendingLibrary = loadLibrary().then((result) => {
    cachedLibrary = result
    pendingLibrary = null
    return result
  })
  return pendingLibrary
}
