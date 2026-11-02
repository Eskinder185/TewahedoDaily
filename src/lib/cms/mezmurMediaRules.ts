/**
 * Accepted thumbnail references for a Mezmur: a CMS Media Library path (`calendar/...`, `hymns/...`), a bundled
 * site image (`/images/...`), an HTTPS URL, or this Mezmur's own private upload (`storage://mezmur-images/mezmur/<id>/file`).
 */
export function isAllowedThumbnailReference(value: string, row?: { id: string }): boolean {
  const reference = value.trim()
  if (!reference) return true
  if (reference.includes('..')) return false
  if (reference.startsWith('storage://')) {
    return Boolean(row && reference.startsWith(`storage://mezmur-images/mezmur/${row.id}/`) && reference.split('/').at(-1))
  }
  if (/^\/images\/[A-Za-z0-9._\-/ %]+$/.test(reference)) return true
  if (/^[A-Za-z0-9][A-Za-z0-9._\-/ %]*$/.test(reference) && !reference.includes('//')) return true
  try {
    return new URL(reference).protocol === 'https:'
  } catch {
    return false
  }
}
