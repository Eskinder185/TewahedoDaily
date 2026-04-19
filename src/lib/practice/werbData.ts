import type { WerbEntry } from '../../data/types/werb'
import amharicChants from '../../data/chants/amharic-chants.json'
import werbJson from '../../data/chants/werb.json'

type ChantWerbRecord = {
  type: string
  form: string
  id: string
  title: string
  transliterationTitle: string
  lyrics: string
  transliterationLyrics: string
  meaning?: string
  youtubeUrl?: string
  category?: {
    primary?: string
    themes?: string[]
    usage?: string[]
    season?: string[]
    majorHoliday?: string[]
    saints?: string[]
  }
}

function isChantWerb(x: unknown): x is ChantWerbRecord {
  if (typeof x !== 'object' || x === null) return false
  const o = x as Record<string, unknown>
  if (o.type !== 'chant' || o.form !== 'werb') return false
  if (typeof o.id !== 'string' || !o.id.trim()) return false
  if (typeof o.title !== 'string') return false
  if (typeof o.transliterationTitle !== 'string') return false
  if (typeof o.lyrics !== 'string') return false
  if (typeof o.transliterationLyrics !== 'string') return false
  return true
}

function chantToWerbEntry(c: ChantWerbRecord): WerbEntry {
  const themes = c.category?.themes?.slice(0, 4).join(' · ')
  const teaser = [c.category?.primary, themes].filter(Boolean).join(' — ') || undefined
  const usageParts = [
    c.category?.usage?.join(' · '),
    c.category?.majorHoliday?.filter(Boolean).join(' · '),
  ].filter(Boolean)
  const season = c.category?.season?.filter(Boolean).join(' · ')

  return {
    id: c.id,
    type: 'werb',
    title: c.title,
    transliterationTitle: c.transliterationTitle,
    lyrics: c.lyrics,
    transliterationLyrics: c.transliterationLyrics,
    youtubeUrl: c.youtubeUrl,
    meaning: typeof c.meaning === 'string' && c.meaning.trim() ? c.meaning.trim() : undefined,
    teaser,
    usage: usageParts.length ? usageParts.join(' · ') : undefined,
    season: season || undefined,
  }
}

function normalizeWerbEntry(raw: unknown): WerbEntry {
  if (isChantWerb(raw)) return chantToWerbEntry(raw)
  return raw as WerbEntry
}

function mergeWerbSources(): WerbEntry[] {
  const fromFile = (werbJson as unknown[]).map(normalizeWerbEntry)
  const amharicList = Array.isArray(amharicChants) ? amharicChants : []
  const fromAmharic: WerbEntry[] = []
  for (const row of amharicList) {
    if (isChantWerb(row)) fromAmharic.push(chantToWerbEntry(row))
  }

  const byId = new Map<string, WerbEntry>()
  for (const e of fromFile) byId.set(e.id, e)
  for (const e of fromAmharic) byId.set(e.id, e)

  return [...byId.values()].sort((a, b) =>
    a.title.localeCompare(b.title, undefined, { sensitivity: 'base' }),
  )
}

export const WERB_ENTRIES: WerbEntry[] = mergeWerbSources()
