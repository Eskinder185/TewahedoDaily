export function slugifyMezmur(input: string, fallback = 'mezmur'): string {
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

export function mezmurDetailPath(slug: string): string {
  return `/practice/mezmur/${slug}`
}

export function mezmurShareUrl(slug: string, origin = window.location.origin): string {
  return `${origin}${mezmurDetailPath(slug)}`
}
