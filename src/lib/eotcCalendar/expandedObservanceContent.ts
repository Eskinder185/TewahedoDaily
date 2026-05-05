import type { EotcCalendarEntry, EotcExpandedContent } from './eotcTypes'

function clean(value: string | undefined | null): string | undefined {
  const trimmed = value?.trim()
  return trimmed || undefined
}

function uniqueLines(lines: Array<string | undefined>): string[] {
  const seen = new Set<string>()
  const result: string[] = []
  for (const line of lines) {
    const trimmed = clean(line)
    if (!trimmed) continue
    const key = trimmed.toLocaleLowerCase()
    if (seen.has(key)) continue
    seen.add(key)
    result.push(trimmed)
  }
  return result
}

export function getExpandedObservanceContent(
  entry: EotcCalendarEntry,
): EotcExpandedContent | null {
  const explicit = entry.content.expandedContent
  const whyCelebrated =
    clean(explicit?.whyCelebrated) ||
    clean(entry.summary.panel) ||
    clean(entry.summary.short)
  const whatHappened =
    explicit?.whatHappened?.map((line) => line.trim()).filter(Boolean) ??
    uniqueLines([entry.content.extended, entry.summary.connection])
  const significance =
    clean(explicit?.significance) ||
    clean(entry.summary.whyItMatters) ||
    clean(entry.summary.connection)
  const relatedSaints =
    explicit?.relatedSaints?.map((line) => line.trim()).filter(Boolean) ?? []
  const observanceType = clean(explicit?.observanceType)
  const source = explicit?.source

  if (
    !whyCelebrated &&
    whatHappened.length === 0 &&
    !significance &&
    relatedSaints.length === 0
  ) {
    return null
  }

  return {
    whyCelebrated,
    whatHappened,
    significance,
    relatedSaints,
    observanceType,
    source,
  }
}
