/** Never represent absent or invalid legacy timestamps as the Unix epoch. */
export function validRecordedTimestamp(value: unknown): string | null {
  const raw = String(value ?? '').trim()
  if (!raw || raw === '0') return null
  const timestamp = Date.parse(raw)
  if (!Number.isFinite(timestamp) || timestamp <= 0) return null
  return new Date(timestamp).toISOString()
}

export function formatRecordedDate(value: unknown): string {
  const valid = validRecordedTimestamp(value)
  return valid ? new Date(valid).toLocaleDateString() : 'Not recorded'
}
