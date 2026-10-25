// Read-only aggregate audit. Never prints credentials, lyrics, titles, or record identifiers.
const base = (process.env.SUPABASE_URL || process.env.VITE_SUPABASE_URL || '').replace(/\/$/, '')
const key = process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.SUPABASE_SECRET_KEY || ''
if (!base || !key) throw new Error('A server-side Supabase read credential is not configured; authenticated Draft records cannot be audited from this environment.')
const headers = { apikey: key, Authorization: `Bearer ${key}`, Accept: 'application/json' }

async function rows(table, select, filters = {}) {
  const found = []
  for (let offset = 0; offset < 100000; offset += 500) {
    const query = new URLSearchParams({ select, ...filters })
    const response = await fetch(`${base}/rest/v1/${table}?${query}`, { headers: { ...headers, Range: `${offset}-${offset + 499}` }, cache: 'no-store' })
    if (!response.ok) throw new Error(`GET ${table} failed (${response.status}): ${await response.text()}`)
    const page = await response.json()
    found.push(...page)
    if (page.length < 500) return found
  }
  throw new Error(`${table} exceeded the safe audit limit.`)
}

const mezmurs = await rows('mezmur_data_import', 'import_id,slug,status,updated_at,title,lyrics_amharic,lyrics_geez,lyrics_english,lyrics_oromo,lyrics_transliteration,zemari_id,rights_status,publication_approved_at,publication_approved_by,youtube_url,source_url,deleted_at')
const active = mezmurs.filter((row) => !row.deleted_at)
const drafts = active.filter((row) => String(row.status || '').trim().toLowerCase() !== 'published')
const published = active.filter((row) => String(row.status || '').trim().toLowerCase() === 'published')
const categories = await rows('mezmur_category_links_import', 'mezmur_slug,category_slug')
const occasions = await rows('mezmur_occasion_links_import', 'mezmur_slug,occasion_slug')
const zemaris = await rows('zemaris', 'id,deleted_at')
const categorySlugs = new Set(categories.map((row) => row.mezmur_slug))
const occasionSlugs = new Set(occasions.map((row) => row.mezmur_slug))
const zemariIds = new Set(zemaris.filter((row) => !row.deleted_at).map((row) => row.id))
const hasLyrics = (row) => ['lyrics_amharic', 'lyrics_geez', 'lyrics_english', 'lyrics_oromo', 'lyrics_transliteration'].some((key) => String(row[key] || '').trim())
const eligible = (row) => {
  if (!String(row.title || '').trim() || !String(row.slug || '').trim() || !String(row.lyrics_amharic || '').trim()) return false
  const rights = ['owned', 'licensed', 'authorized_contributor', 'public_domain', 'display_only'].includes(String(row.rights_status || '').trim()) && row.publication_approved_at && row.publication_approved_by
  return Boolean(rights || String(row.youtube_url || '').trim() || String(row.source_url || '').trim())
}
const validDate = (value) => {
  const raw = String(value || '').trim(); if (!raw || raw === '0') return false
  const timestamp = Date.parse(raw); return Number.isFinite(timestamp) && timestamp > 0
}

console.log(JSON.stringify({
  source: 'public.mezmur_data_import',
  active_records: active.length,
  draft_records: drafts.length,
  published_records: published.length,
  unique_import_ids: new Set(active.map((row) => row.import_id)).size,
  duplicate_import_ids: active.length - new Set(active.map((row) => row.import_id)).size,
  duplicate_slugs: active.length - new Set(active.map((row) => String(row.slug || '').trim().toLowerCase())).size,
  drafts_with_any_lyrics: drafts.filter(hasLyrics).length,
  drafts_missing_all_lyrics: drafts.filter((row) => !hasLyrics(row)).length,
  drafts_with_category: drafts.filter((row) => categorySlugs.has(row.slug)).length,
  drafts_missing_category: drafts.filter((row) => !categorySlugs.has(row.slug)).length,
  drafts_with_occasion: drafts.filter((row) => occasionSlugs.has(row.slug)).length,
  drafts_missing_occasion: drafts.filter((row) => !occasionSlugs.has(row.slug)).length,
  drafts_with_verified_zemari_uuid: drafts.filter((row) => row.zemari_id && zemariIds.has(row.zemari_id)).length,
  drafts_with_unmatched_zemari: drafts.filter((row) => !row.zemari_id || !zemariIds.has(row.zemari_id)).length,
  drafts_eligible_by_current_rule: drafts.filter(eligible).length,
  drafts_blocked_by_current_rule: drafts.filter((row) => !eligible(row)).length,
  records_without_valid_updated_at: active.filter((row) => !validDate(row.updated_at)).length,
}, null, 2))
