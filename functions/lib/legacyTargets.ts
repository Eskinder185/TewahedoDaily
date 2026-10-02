/**
 * Cloudflare function helper — browser no longer ships local mezmur packs.
 * Local JSON lives under `archive/local-data/chants/` for migration only.
 * Workers should resolve titles from Supabase; this returns undefined.
 */
export function bundledMezmur(_key: string): { title: string } | undefined {
  return undefined
}
