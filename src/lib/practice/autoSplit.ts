export type PracticeSectionRange = { start: number; end: number }

const MIN_SPAN = 0.5
const END_BUFFER = 2.5

/** Smart auto-split into 2–6 practice sections by duration. */
export function buildPracticeSections(durationSec: number): PracticeSectionRange[] | null {
  if (!Number.isFinite(durationSec) || durationSec <= 0) return null
  const usableEnd = Math.max(0, durationSec - END_BUFFER)
  if (usableEnd < MIN_SPAN * 2) return null

  let count = 3
  if (durationSec < 120) count = 2
  else if (durationSec < 240) count = 3
  else if (durationSec < 420) count = 4
  else if (durationSec < 600) count = 5
  else count = 6

  while (count > 2 && usableEnd / count < 25) count -= 1

  const slice = usableEnd / count
  const sections: PracticeSectionRange[] = []
  for (let i = 0; i < count; i += 1) {
    const start = i * slice
    const end = i === count - 1 ? usableEnd : (i + 1) * slice
    if (end - start >= MIN_SPAN) sections.push({ start, end })
  }
  return sections.length >= 2 ? sections : null
}
