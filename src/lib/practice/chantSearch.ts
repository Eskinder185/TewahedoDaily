import Fuse from 'fuse.js'
import type { WerbEntry } from '../../data/types/werb'
import amharicChants from '../../data/chants/amharic-chants.json'
import werbJson from '../../data/chants/werb.json'
import {
  CHANT_LIBRARY,
  chantEntryKey,
  type ChantLibraryEntry,
} from './chantLibrary'
import { MEZMUR_ENTRIES } from './mezmurData'
import type { MezmurItem } from './types'

export type ChantFormFilter = 'all' | 'mezmur' | 'werb' | 'english'

/** Single searchable document per chant — keys aligned with Fuse fields. */
export type ChantSearchDocument = {
  key: string
  title: string
  transliterationTitle: string
  lyrics: string
  transliterationLyrics: string
  form: string
  categoryPrimary: string
  themes: string
  usage: string
  saints: string
  majorHoliday: string
  season: string
  extras: string
}

const STORAGE_KEY = 'td-chant-search-recent'
const MAX_RECENT = 6

function joinArr(v: unknown): string {
  if (!Array.isArray(v)) return ''
  return v
    .filter((x): x is string => typeof x === 'string' && x.trim().length > 0)
    .join(' ')
}

/**
 * Normalize category from JSON (string union or rich object with themes, etc.).
 */
export function parseCategoryForSearch(cat: unknown): {
  primary: string
  themes: string
  usage: string
  saints: string
  majorHoliday: string
  season: string
} {
  const empty = {
    primary: '',
    themes: '',
    usage: '',
    saints: '',
    majorHoliday: '',
    season: '',
  }
  if (cat == null) return empty
  if (typeof cat === 'string') return { ...empty, primary: cat }
  if (typeof cat === 'object' && !Array.isArray(cat)) {
    const o = cat as Record<string, unknown>
    return {
      primary: typeof o.primary === 'string' ? o.primary : '',
      themes: joinArr(o.themes),
      usage: joinArr(o.usage),
      saints: joinArr(o.saints),
      majorHoliday: joinArr(o.majorHoliday),
      season: joinArr(o.season),
    }
  }
  return empty
}

type RawWerb = {
  form?: string
  type?: string
  id?: string
  category?: {
    primary?: string
    themes?: string[]
    usage?: string[]
    season?: string[]
    majorHoliday?: string[]
    saints?: string[]
  }
}

function rawWerbById(): Map<string, RawWerb> {
  const m = new Map<string, RawWerb>()
  for (const x of werbJson as unknown[]) {
    if (!x || typeof x !== 'object') continue
    const o = x as RawWerb
    if (o.form === 'werb' && o.type === 'chant' && typeof o.id === 'string') {
      m.set(o.id, o)
    }
  }
  for (const x of amharicChants as unknown[]) {
    if (!x || typeof x !== 'object') continue
    const o = x as RawWerb
    if (o.form === 'werb' && o.type === 'chant' && typeof o.id === 'string') {
      m.set(o.id, o)
    }
  }
  return m
}

const RAW_WERB = rawWerbById()

function mezmurExtras(item: MezmurItem): string {
  return [
    item.relatedFeast,
    item.feastLine,
    item.seasonLine,
    item.meaning,
    item.categoryThemes?.join(' '),
    item.categoryUsage?.join(' '),
    item.categorySaints?.join(' '),
    item.categoryMajorHoliday?.join(' '),
    item.categoryConfidence,
    item.movementGuide,
    item.postureNotes,
    item.instrumentSummary,
  ]
    .filter(Boolean)
    .join('\n')
}

function werbExtras(item: WerbEntry): string {
  return [
    item.teaser,
    item.usage,
    item.season,
    item.chantTitle,
    item.meaning,
    item.movementGuide,
    item.postureNotes,
    item.instrumentUsage,
    item.mistakesToAvoid,
    item.beginnerTips,
  ]
    .filter(Boolean)
    .join('\n')
}

function buildDocuments(): ChantSearchDocument[] {
  const mezById = new Map(MEZMUR_ENTRIES.map((m) => [m.id, m]))

  return CHANT_LIBRARY.map((entry) => {
    const key = chantEntryKey(entry)
    if (entry.form === 'mezmur') {
      const item = entry.item
      const raw = mezById.get(item.id)
      const cat = parseCategoryForSearch(
        raw ? (raw as unknown as { category?: unknown }).category : item.category,
      )
      return {
        key,
        title: item.title,
        transliterationTitle: item.titleTransliteration ?? '',
        lyrics: item.lyricsGez ?? '',
        transliterationLyrics: item.lyricsTransliteration ?? '',
        form: 'mezmur',
        categoryPrimary: cat.primary,
        themes: cat.themes,
        usage: cat.usage,
        saints: cat.saints,
        majorHoliday: cat.majorHoliday,
        season: cat.season,
        extras: mezmurExtras(item),
      }
    }

    const item = entry.item
    const raw = RAW_WERB.get(item.id)
    const cat = parseCategoryForSearch(raw?.category)
    const extraBlob = [
      werbExtras(item),
      cat.themes,
      cat.usage,
      cat.saints,
    ]
      .filter(Boolean)
      .join('\n')
    return {
      key,
      title: item.title,
      transliterationTitle: item.transliterationTitle ?? '',
      lyrics: item.lyrics ?? '',
      transliterationLyrics: item.transliterationLyrics ?? '',
      form: 'werb',
      categoryPrimary: cat.primary,
      themes: cat.themes,
      usage: cat.usage,
      saints: cat.saints,
      majorHoliday: cat.majorHoliday,
      season: cat.season,
      extras: extraBlob,
    }
  })
}

const DOCS = buildDocuments()

const entryByKey = new Map(
  CHANT_LIBRARY.map((e) => [chantEntryKey(e), e] as const),
)

const fuse = new Fuse(DOCS, {
  keys: [
    { name: 'title', weight: 0.2 },
    { name: 'transliterationTitle', weight: 0.18 },
    { name: 'lyrics', weight: 0.12 },
    { name: 'transliterationLyrics', weight: 0.12 },
    { name: 'form', weight: 0.04 },
    { name: 'categoryPrimary', weight: 0.08 },
    { name: 'themes', weight: 0.08 },
    { name: 'usage', weight: 0.08 },
    { name: 'saints', weight: 0.06 },
    { name: 'majorHoliday', weight: 0.05 },
    { name: 'season', weight: 0.05 },
    { name: 'extras', weight: 0.04 },
  ],
  threshold: 0.38,
  distance: 120,
  ignoreLocation: true,
  minMatchCharLength: 1,
  shouldSort: true,
  includeScore: true,
})

/** Used by browse UI and fuzzy search so “English mezmur” matches `mezmur` + English, not `form === 'english'`. */
export function matchesForm(
  entry: ChantLibraryEntry,
  formFilter: ChantFormFilter,
): boolean {
  if (formFilter === 'all') return true
  if (formFilter === 'english') {
    return entry.form === 'mezmur' && entry.item.language === 'en'
  }
  return entry.form === formFilter
}

/**
 * Fuzzy search with fuse.js; respects form filter. Empty query returns all
 * entries matching the form filter (stable library order).
 */
export function searchChants(
  query: string,
  formFilter: ChantFormFilter,
): ChantLibraryEntry[] {
  const q = query.trim()
  if (!q) {
    return CHANT_LIBRARY.filter((e) => matchesForm(e, formFilter))
  }

  const hits = fuse.search(q)
  const out: ChantLibraryEntry[] = []
  for (const h of hits) {
    const e = entryByKey.get(h.item.key)
    if (e && matchesForm(e, formFilter)) out.push(e)
  }
  return out
}

export function getRecentChantSearches(): string[] {
  try {
    const raw = localStorage.getItem(STORAGE_KEY)
    if (!raw) return []
    const parsed = JSON.parse(raw) as unknown
    if (!Array.isArray(parsed)) return []
    return parsed
      .filter((x): x is string => typeof x === 'string' && x.trim().length > 0)
      .slice(0, MAX_RECENT)
  } catch {
    return []
  }
}

export function addRecentChantSearch(query: string): void {
  const q = query.trim()
  if (q.length < 2) return
  try {
    const prev = getRecentChantSearches().filter((s) => s !== q)
    const next = [q, ...prev].slice(0, MAX_RECENT)
    localStorage.setItem(STORAGE_KEY, JSON.stringify(next))
  } catch {
    /* ignore quota / private mode */
  }
}
