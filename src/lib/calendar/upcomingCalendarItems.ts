/**
 * Upcoming meaningful observances for the public Calendar (not every monthly recurrence).
 */
import { addDays } from '../churchCalendar/pascha'
import {
  loadOrthodoxCalendarCatalog,
  resolveOrthodoxDay,
  type OrthodoxCalendarCatalog,
} from './orthodoxCalendarData'
import type { DayObservance, DayFast } from './orthodoxCalendarTypes'

export type UpcomingCalendarItem = {
  id: string
  date: Date
  iso: string
  relativeLabel: string
  kind: 'observance' | 'fast_start'
  title: string
  titleAmharic: string
  isMajor: boolean
  summary: string
}

function stripLocal(d: Date): Date {
  return new Date(d.getFullYear(), d.getMonth(), d.getDate())
}

function toIso(d: Date): string {
  const y = d.getFullYear()
  const m = String(d.getMonth() + 1).padStart(2, '0')
  const day = String(d.getDate()).padStart(2, '0')
  return `${y}-${m}-${day}`
}

function relativeLabel(from: Date, target: Date): string {
  const a = stripLocal(from).getTime()
  const b = stripLocal(target).getTime()
  const days = Math.round((b - a) / 86400000)
  if (days === 1) return 'Tomorrow'
  if (days === 0) return 'Today'
  if (days > 1 && days <= 14) return `In ${days} days`
  return target.toLocaleDateString('en-US', { month: 'short', day: 'numeric' })
}

function meaningfulObservance(o: DayObservance): boolean {
  if (o.isMajor) return true
  const t = `${o.observanceType} ${o.category} ${o.title}`.toLowerCase()
  if (/monthly/.test(t)) return false
  return Boolean(o.observanceType || o.category)
}

function meaningfulFastStart(fast: DayFast | null, prevFastId: string | null): boolean {
  if (!fast) return false
  if (fast.id === prevFastId) return false
  const type = (fast.fastType || '').toLowerCase()
  if (type.includes('fast_free') || type === 'weekly_fast') return false
  return true
}

export async function loadUpcomingCalendarItems(
  from: Date,
  options?: { horizonDays?: number; limit?: number; catalog?: OrthodoxCalendarCatalog },
): Promise<UpcomingCalendarItem[]> {
  const horizon = options?.horizonDays ?? 60
  const limit = options?.limit ?? 6
  const catalog = options?.catalog ?? (await loadOrthodoxCalendarCatalog())
  const start = stripLocal(from)
  const items: UpcomingCalendarItem[] = []
  const seen = new Set<string>()
  let prevFastId: string | null = null

  for (let i = 1; i <= horizon; i++) {
    const date = addDays(start, i)
    const day = resolveOrthodoxDay(date, catalog)
    const primary = day.primaryObservance
    if (primary && meaningfulObservance(primary)) {
      const key = `o:${primary.id}:${toIso(date)}`
      if (!seen.has(`o:${primary.id}`)) {
        seen.add(`o:${primary.id}`)
        items.push({
          id: key,
          date,
          iso: toIso(date),
          relativeLabel: primary.isMajor && i > 7 ? `Next major feast · ${relativeLabel(start, date)}` : relativeLabel(start, date),
          kind: 'observance',
          title: primary.title,
          titleAmharic: primary.titleAmharic,
          isMajor: primary.isMajor,
          summary: primary.summary || primary.description,
        })
      }
    }
    if (meaningfulFastStart(day.activeFast, prevFastId) && day.activeFast) {
      const key = `f:${day.activeFast.id}`
      if (!seen.has(key)) {
        seen.add(key)
        items.push({
          id: key,
          date,
          iso: toIso(date),
          relativeLabel: relativeLabel(start, date),
          kind: 'fast_start',
          title: day.activeFast.name,
          titleAmharic: day.activeFast.nameAmharic,
          isMajor: true,
          summary: day.activeFast.summary || day.activeFast.description,
        })
      }
    }
    prevFastId = day.activeFast?.id || null
    if (items.length >= limit * 2) break
  }

  items.sort((a, b) => {
    if (a.isMajor !== b.isMajor) return a.isMajor ? -1 : 1
    return a.date.getTime() - b.date.getTime()
  })

  return items
    .sort((a, b) => a.date.getTime() - b.date.getTime())
    .slice(0, limit)
}
