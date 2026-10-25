/** Public catalog rules shared by list, detail, and search paths. */
export function isPublicMezmurStatus(status: unknown): boolean {
  return String(status ?? '').trim().toLowerCase() === 'published'
}

export function isEligiblePublicMezmurRow(row: {
  status?: unknown
}): boolean {
  // public.mezmur_public is the database security boundary. It excludes unsafe
  // rows and redacts lyrics for media/source-only records.
  return isPublicMezmurStatus(row.status)
}

/**
 * Collect a PostgREST-style paginated result without assuming the server's
 * default 1,000-row cap. `maxRows` is an explicit caller cap, not a page cap.
 */
export async function collectPagedRows<T>(
  loadPage: (from: number, to: number) => Promise<T[]>,
  options: { pageSize?: number; maxRows?: number } = {},
): Promise<T[]> {
  const pageSize = Math.max(1, Math.floor(options.pageSize || 500))
  const maxRows = Math.max(0, options.maxRows ?? Number.POSITIVE_INFINITY)
  if (maxRows === 0) return []

  const rows: T[] = []
  while (rows.length < maxRows) {
    const from = rows.length
    const requested = Math.min(pageSize, maxRows - rows.length)
    const page = await loadPage(from, from + requested - 1)
    rows.push(...page.slice(0, requested))
    if (page.length < requested) break
  }
  return rows
}
