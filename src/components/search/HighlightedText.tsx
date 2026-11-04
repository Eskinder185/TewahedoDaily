import type { ReactNode } from 'react'

/**
 * Renders stored text with <mark> around the given [start, end) ranges. The text itself is never altered;
 * ranges come from textMatch (word-aligned) and point into exactly this string.
 */
export function HighlightedText({
  text,
  ranges,
  markClassName,
}: {
  text: string
  ranges: Array<[number, number]>
  markClassName?: string
}) {
  const sorted = [...ranges].filter(([from, to]) => from >= 0 && to > from && to <= text.length).sort((a, b) => a[0] - b[0])
  const parts: ReactNode[] = []
  let cursor = 0
  sorted.forEach(([from, to], index) => {
    if (from < cursor) return // overlapping range already covered
    if (from > cursor) parts.push(text.slice(cursor, from))
    parts.push(<mark key={`${from}-${index}`} className={markClassName}>{text.slice(from, to)}</mark>)
    cursor = to
  })
  if (cursor < text.length) parts.push(text.slice(cursor))
  return <>{parts}</>
}
