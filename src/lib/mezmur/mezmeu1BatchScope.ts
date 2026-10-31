/** A stable, publication-independent marker for the October Mezmeu1 import. */
export function isMezmeu1Published(row: { slug: string; status: string }): boolean {
  return row.status === 'published' && /^mezmeu1-\d{4}$/i.test(row.slug.trim())
}
