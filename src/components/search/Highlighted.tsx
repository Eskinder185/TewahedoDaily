import type { ReactNode } from 'react'

/** Text with the matched ranges wrapped in <mark>. The text is never altered; invalid or overlapping ranges are ignored. */
export function Highlighted({ text, ranges }: { text: string; ranges?: Array<[number, number]> }) {
  if (!ranges?.length) return <>{text}</>
  const sorted = [...ranges].filter(([a, b]) => a >= 0 && b > a && b <= text.length).sort((x, y) => x[0] - y[0])
  const parts: ReactNode[] = []
  let cursor = 0
  for (const [start, end] of sorted) {
    if (start < cursor) continue
    if (start > cursor) parts.push(text.slice(cursor, start))
    parts.push(<mark key={start}>{text.slice(start, end)}</mark>)
    cursor = end
  }
  if (cursor < text.length) parts.push(text.slice(cursor))
  return <>{parts}</>
}
