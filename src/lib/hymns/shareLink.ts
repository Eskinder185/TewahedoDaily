/** The exact Mezmur page being read (no #hash), never the home page and never the lyrics. */
export function currentMezmurUrl(
  loc: Pick<Location, 'origin' | 'pathname' | 'search'> = window.location,
): string {
  return `${loc.origin}${loc.pathname}${loc.search}`
}
