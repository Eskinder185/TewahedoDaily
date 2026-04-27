export function slugifyPrayer(input: string, fallback = 'prayer'): string {
  const slug = input
    .normalize('NFKD')
    .replace(/[\u0300-\u036f]/g, '')
    .replace(/&/g, ' and ')
    .replace(/['’]/g, '')
    .toLowerCase()
    .replace(/[^a-z0-9]+/g, '-')
    .replace(/^-+|-+$/g, '')

  return slug || fallback
}

export function prayerCollectionPath(collectionSlug: string): string {
  return `/pray/${collectionSlug}`
}

export function prayerDetailPath(slug: string, collectionSlug?: string): string {
  if (collectionSlug) return `/pray/${collectionSlug}/${slug}`
  return `/pray/${slug}`
}

export function prayerShareUrl(
  slug: string,
  collectionSlug?: string,
  origin = window.location.origin,
): string {
  return `${origin}${prayerDetailPath(slug, collectionSlug)}`
}
