import { getAiApiBaseUrl } from '../ai/aiConfig'
import { db } from './mezmurService'
import { publicationBlockReason } from './mezmurPublicationRules'
import { formatRecordedDate, validRecordedTimestamp } from './recordedTimestamp'
import { formatErrorMessage } from './errorMessage'
import { normalizeMezmurLanguage, type MezmurLanguageCode } from '../mezmur/mezmurLanguage'
import { matchZemari, type ZemariCandidate, type ZemariMatch } from '../mezmur/zemariMatching'
import { classifyMezmur, type MezmurClassificationResult } from '../mezmur/mezmurClassification'
import {
  formatMezmurRecordLyrics,
  isLyricsFormatted,
  type FormattedMezmurRecordResult,
} from '../mezmur/lyricsFormatter'

export { formatRecordedDate, validRecordedTimestamp }

export type BulkJobMode =
  | 'all' | 'selected' | 'zemari' | 'classification'
  | 'missing_categories' | 'missing_occasions' | 'retry_failed'

export type EnrichmentJob = {
  id: string
  mode: BulkJobMode
  status: 'queued' | 'running' | 'cancel_requested' | 'cancelled' | 'completed' | 'failed'
  total_count: number
  processed_count: number
  succeeded_count: number
  review_count: number
  failed_count: number
  created_at: string
  completed_at: string | null
  error_message: string | null
}

export type EnrichmentSuggestion = {
  id: string
  job_id: string
  mezmur_import_id: string
  zemari_id: string | null
  zemari_match_method: string | null
  zemari_confidence: number | null
  primary_category_slug: string | null
  category_slugs: string[]
  primary_occasion_slug: string | null
  occasion_slugs: string[]
  section_import_ids: string[]
  evidence: unknown[]
  explanation: string | null
  classification_confidence: number | null
  requires_review: boolean
  publication_eligible: boolean
  publication_block_reason: string | null
  status: 'suggested' | 'approved' | 'applied' | 'rejected' | 'failed'
  error_message: string | null
  mezmur?: { title: string; singer_name: string | null; zemari_id: string | null; status: string } | null
}

export type BulkDashboard = {
  drafts: number
  with_lyrics: number
  missing_lyrics: number
  matched_zemaris: number
  unmatched_zemaris: number
  ready_zemaris?: number
  categorized: number
  missing_categories: number
  missing_occasions: number
  needs_review: number
  eligible: number
  blocked: number
  published: number
  failed: number
  failed_jobs: number
}

export type BulkMezmurRecord = {
  import_id: string
  slug: string
  title: string
  singer_name: string | null
  singer_slug: string | null
  zemari_id: string | null
  zemari_verified: boolean
  zemari_name: string | null
  zemari_match: ZemariMatch
  status: 'draft' | 'published'
  category_slugs: string[]
  occasion_slugs: string[]
  has_lyrics: boolean
  publication_eligible: boolean
  publication_block_reason: string | null
  updated_at: string | null
  language: MezmurLanguageCode | null
  lyrics_amharic?: string | null
  lyrics_geez?: string | null
  lyrics_english?: string | null
  lyrics_oromo?: string | null
  lyrics_transliteration?: string | null
  primary_language?: string | null
}

export type BulkSnapshot = {
  dashboard: BulkDashboard
  records: BulkMezmurRecord[]
  jobs: EnrichmentJob[]
  categorySlugs: string[]
  singers: ZemariCandidate[]
}

export type BulkPublishResult = {
  published: number
  skipped: number
  failed: number
  results: Array<{ import_id: string; outcome: string; reason?: string; sqlstate?: string }>
}

export function parseBulkPublishResult(value: unknown): BulkPublishResult {
  if (!value || typeof value !== 'object' || Array.isArray(value)) {
    throw new Error('RPC public.bulk_publish_mezmur_imports(uuid[]) returned an invalid response.')
  }
  const payload = value as Record<string, unknown>
  const rawResults = Array.isArray(payload.results) ? payload.results : []
  const results = rawResults.flatMap((item) => {
    if (!item || typeof item !== 'object' || Array.isArray(item)) return []
    const row = item as Record<string, unknown>
    const importId = text(row.import_id)
    const outcome = text(row.outcome)
    if (!importId || !outcome) return []
    return [{
      import_id: importId,
      outcome,
      ...(text(row.reason) ? { reason: text(row.reason) } : {}),
      ...(text(row.sqlstate) ? { sqlstate: text(row.sqlstate) } : {}),
    }]
  })
  const number = (key: string) => {
    const parsed = Number(payload[key])
    return Number.isFinite(parsed) && parsed >= 0 ? parsed : 0
  }
  return { published: number('published'), skipped: number('skipped'), failed: number('failed'), results }
}

const MEZMUR_SELECT = [
  'import_id', 'slug', 'title', 'singer_name', 'singer_slug', 'zemari_id', 'status', 'updated_at',
  'lyrics_amharic', 'lyrics_geez', 'lyrics_english', 'lyrics_oromo', 'lyrics_transliteration',
  'rights_status', 'publication_approved_at', 'publication_approved_by', 'youtube_url', 'source_url', 'primary_language',
].join(',')

function text(value: unknown) { return String(value ?? '').trim() }

type PageResult = { data: unknown[] | null; error: unknown }

export async function pagedRows(table: string, loadPage: (from: number, to: number) => PromiseLike<PageResult>) {
  const rows: Record<string, unknown>[] = []
  for (let offset = 0; offset < 100_000; offset += 500) {
    const { data, error } = await loadPage(offset, offset + 499)
    if (error) {
      throw new Error(formatErrorMessage(error, {
        operation: `Load public.${table} rows ${offset + 1}-${offset + 500}`,
      }))
    }
    rows.push(...((data || []) as Record<string, unknown>[]))
    if (!data || data.length < 500) return rows
  }
  throw new Error(`${table} exceeded the safe 100,000-row CMS scan limit.`)
}

function isOptionalBulkTableMissing(error: unknown) {
  const value = error as { code?: string; message?: string }
  return value?.code === '42P01' || value?.code === 'PGRST205' || /PGRST205|42P01|Could not find the table|relation .* does not exist/i.test(value?.message || '')
}

function isColumnMissingError(error: unknown) {
  const value = error as { code?: string; message?: string }
  return (
    value?.code === '42703' ||
    value?.code === 'PGRST204' ||
    /42703|PGRST204|does not exist/i.test(value?.message || '')
  )
}

async function loadStagedRelationshipRows(
  table: 'mezmur_category_links_import' | 'mezmur_occasion_links_import',
  columnsWithUuid: string,
  columnsFallback: string,
): Promise<Record<string, unknown>[]> {
  try {
    return await pagedRows(table, (from, to) =>
      db().from(table as never).select(columnsWithUuid).range(from, to),
    )
  } catch (error) {
    if (isOptionalBulkTableMissing(error)) return []
    if (isColumnMissingError(error)) {
      return await pagedRows(table, (from, to) =>
        db().from(table as never).select(columnsFallback).range(from, to),
      ).catch((fallbackError) => {
        if (isOptionalBulkTableMissing(fallbackError)) return []
        throw fallbackError
      })
    }
    throw error
  }
}

async function directJobs(): Promise<EnrichmentJob[]> {
  const result = await db().from('mezmur_enrichment_jobs' as never).select('*').order('created_at', { ascending: false }).limit(20)
  if (result.error) {
    if (isOptionalBulkTableMissing(result.error)) return []
    throw new Error(formatErrorMessage(result.error, { operation: 'Load recent Mezmur enrichment jobs' }))
  }
  return (result.data || []) as EnrichmentJob[]
}

/**
 * Load the canonical CMS inventory directly from Supabase. AI availability is
 * deliberately irrelevant to this operation. RLS verifies the signed-in staff user.
 */
export async function getSupabaseMezmurBulkSnapshot(): Promise<BulkSnapshot> {
  const [mezmurs, categoryLinks, occasionLinks, taxonomyCategories, zemaris, aliases, jobs, suggestions] = await Promise.all([
    pagedRows('mezmur_data_import', (from, to) => db().from('mezmur_data_import' as never).select(MEZMUR_SELECT).is('deleted_at', null).order('import_id').range(from, to)),
    loadStagedRelationshipRows('mezmur_category_links_import', 'mezmur_import_id,mezmur_slug,category_slug', 'mezmur_slug,category_slug'),
    loadStagedRelationshipRows('mezmur_occasion_links_import', 'mezmur_import_id,mezmur_slug,occasion_slug', 'mezmur_slug,occasion_slug'),
    // Production exposes the category slug but does not have categories.status.
    // Existing relationship rows remain the source of truth for assignments.
    pagedRows('categories', (from, to) => db().from('categories' as never).select('slug').order('slug').range(from, to))
      .catch((error) => isOptionalBulkTableMissing(error) ? [] : Promise.reject(error)),
    pagedRows('zemaris', (from, to) => db().from('zemaris' as never).select('id,slug,name,name_amharic,status,deleted_at').is('deleted_at', null).order('id').range(from, to)),
    pagedRows('zemari_aliases', (from, to) => db().from('zemari_aliases' as never).select('id,zemari_id,alias,is_verified').eq('is_verified', true).order('id').range(from, to))
      .catch((error) => isOptionalBulkTableMissing(error) ? [] : Promise.reject(error)),
    directJobs(),
    pagedRows('mezmur_enrichment_suggestions', (from, to) => db().from('mezmur_enrichment_suggestions' as never).select('mezmur_import_id,requires_review,publication_eligible,status,error_code,analyzed_at').order('analyzed_at', { ascending: false }).range(from, to))
      .catch((error) => isOptionalBulkTableMissing(error) ? [] : Promise.reject(error)),
  ])
  return buildBulkSnapshot({ mezmurs, categoryLinks, occasionLinks, taxonomyCategories, zemaris, aliases, jobs, suggestions })
}

export function buildBulkSnapshot(input: {
  mezmurs: Record<string, unknown>[]
  categoryLinks: Record<string, unknown>[]
  occasionLinks: Record<string, unknown>[]
  taxonomyCategories?: Record<string, unknown>[]
  zemaris: Record<string, unknown>[]
  aliases?: Record<string, unknown>[]
  jobs: EnrichmentJob[]
  suggestions: Record<string, unknown>[]
}): BulkSnapshot {
  const { mezmurs, categoryLinks, occasionLinks, taxonomyCategories = [], zemaris, aliases = [], jobs, suggestions } = input
  const active = mezmurs.filter((row) => !text(row.deleted_at))
  const slugCounts = new Map<string, number>()
  const uniqueIdBySlug = new Map<string, string>()
  for (const row of active) {
    const slug = text(row.slug).trim().toLowerCase()
    if (!slug) continue
    slugCounts.set(slug, (slugCounts.get(slug) || 0) + 1)
    uniqueIdBySlug.set(slug, text(row.import_id))
  }

  const categories = new Map<string, string[]>()
  const occasions = new Map<string, string[]>()
  for (const row of categoryLinks) {
    const slug = text(row.mezmur_slug).trim().toLowerCase()
    const importId = text(row.mezmur_import_id) || (slugCounts.get(slug) === 1 ? uniqueIdBySlug.get(slug) || '' : '')
    const value = text(row.category_slug)
    if (importId && value) categories.set(importId, [...new Set([...(categories.get(importId) || []), value])])
  }
  for (const row of occasionLinks) {
    const slug = text(row.mezmur_slug).trim().toLowerCase()
    const importId = text(row.mezmur_import_id) || (slugCounts.get(slug) === 1 ? uniqueIdBySlug.get(slug) || '' : '')
    const value = text(row.occasion_slug)
    if (importId && value) occasions.set(importId, [...new Set([...(occasions.get(importId) || []), value])])
  }
  const aliasesByZemari = new Map<string, string[]>()
  for (const row of aliases) {
    const id = text(row.zemari_id); const alias = text(row.alias)
    if (id && alias && row.is_verified !== false) aliasesByZemari.set(id, [...new Set([...(aliasesByZemari.get(id) || []), alias])])
  }
  const candidates: ZemariCandidate[] = zemaris
    .filter((row) => !text(row.deleted_at) && text(row.status).toLowerCase() !== 'archived')
    .map((row) => ({ id: text(row.id), slug: text(row.slug) || null, name: text(row.name) || null, nameAmharic: text(row.name_amharic) || null, aliases: aliasesByZemari.get(text(row.id)) || [] }))
    .filter((row) => row.id)
  const zemariIds = new Set(candidates.map((row) => row.id))
  const latest = new Map<string, Record<string, unknown>>()
  for (const row of suggestions) if (!latest.has(text(row.mezmur_import_id))) latest.set(text(row.mezmur_import_id), row)

  const published = active.filter((row) => text(row.status).toLowerCase() === 'published')
  const records = active.map((row): BulkMezmurRecord => {
    const lyrics = ['lyrics_amharic', 'lyrics_geez', 'lyrics_english', 'lyrics_oromo', 'lyrics_transliteration']
      .some((key) => Boolean(text(row[key])))
    const block = publicationBlockReason({
      role: 'super_admin', rightsStatus: text(row.rights_status),
      rightsConfirmedAt: text(row.publication_approved_at), rightsConfirmedBy: text(row.publication_approved_by),
      youtubeUrl: text(row.youtube_url), sourceUrl: text(row.source_url), title: text(row.title),
      slug: text(row.slug), lyricsAmharic: text(row.lyrics_amharic),
    })
    const zemariMatch = matchZemari({ singerName: text(row.singer_name) || null, singerSlug: text(row.singer_slug) || null, zemariId: text(row.zemari_id) || null }, candidates)
    return {
      import_id: text(row.import_id), slug: text(row.slug), title: text(row.title) || '(Untitled Mezmur)',
      singer_name: text(row.singer_name) || null, singer_slug: text(row.singer_slug) || null, zemari_id: text(row.zemari_id) || null,
      zemari_verified: Boolean(text(row.zemari_id) && zemariIds.has(text(row.zemari_id))),
      zemari_name: zemariMatch.state === 'linked' || zemariMatch.state === 'available' ? zemariMatch.canonicalName : null,
      zemari_match: zemariMatch,
      status: text(row.status).toLowerCase() === 'published' ? 'published' : 'draft',
      category_slugs: categories.get(text(row.import_id)) || [], occasion_slugs: occasions.get(text(row.import_id)) || [],
      has_lyrics: lyrics, publication_eligible: !block, publication_block_reason: block,
      updated_at: validRecordedTimestamp(row.updated_at),
      language: normalizeMezmurLanguage(row.primary_language),
      lyrics_amharic: text(row.lyrics_amharic) || null,
      lyrics_geez: text(row.lyrics_geez) || null,
      lyrics_english: text(row.lyrics_english) || null,
      lyrics_oromo: text(row.lyrics_oromo) || null,
      lyrics_transliteration: text(row.lyrics_transliteration) || null,
      primary_language: text(row.primary_language) || null,
    }
  })
  const currentSuggestions = [...latest.values()]
  const draftRecords = records.filter((row) => row.status === 'draft')
  return {
    dashboard: {
      drafts: draftRecords.length,
      with_lyrics: records.filter((row) => row.has_lyrics).length,
      missing_lyrics: records.filter((row) => !row.has_lyrics).length,
      matched_zemaris: records.filter((row) => row.zemari_verified).length,
      unmatched_zemaris: records.filter((row) => !row.zemari_verified).length,
      ready_zemaris: records.filter((row) => row.zemari_match.state === 'available').length,
      categorized: records.filter((row) => row.category_slugs.length > 0).length,
      missing_categories: records.filter((row) => row.category_slugs.length === 0).length,
      missing_occasions: records.filter((row) => row.occasion_slugs.length === 0).length,
      needs_review: currentSuggestions.filter((row) => Boolean(row.requires_review)).length,
      eligible: draftRecords.filter((row) => row.publication_eligible).length,
      blocked: draftRecords.filter((row) => !row.publication_eligible).length,
      published: published.length,
      failed: currentSuggestions.filter((row) => Boolean(row.error_code) || row.status === 'failed').length,
      failed_jobs: jobs.filter((job) => job.status === 'failed').length,
    },
    records,
    jobs,
    categorySlugs: [...new Set(
      (taxonomyCategories.length ? taxonomyCategories.map((row) => text(row.slug)) : categoryLinks.map((row) => text(row.category_slug))).filter(Boolean),
    )].sort(),
    singers: candidates,
  }
}

async function backendRequest<T>(path: string, init: RequestInit = {}): Promise<T> {
  const base = getAiApiBaseUrl()
  if (!base) throw new Error('Automatic AI analysis is unavailable because no public AI API URL is configured. Manual Zemari links, categories, and publishing remain available through Supabase.')
  const { data, error } = await db().auth.getSession()
  if (error || !data.session) throw new Error('Sign in as staff before managing bulk Mezmurs.')
  const response = await fetch(`${base.replace(/\/$/, '')}${path}`, {
    ...init, cache: 'no-store', headers: { 'Content-Type': 'application/json', Authorization: `Bearer ${data.session.access_token}`, ...(init.headers || {}) },
  })
  if (!response.ok) {
    const payload = await response.json().catch(() => null) as { detail?: string | { message?: string } } | null
    const detail = typeof payload?.detail === 'string' ? payload.detail : payload?.detail?.message
    const fallback: Record<number, string> = {
      401: 'Your staff session is missing or expired. Sign in again.',
      403: 'Your account does not have permission for this AI operation.',
      404: `Automatic AI analysis is unavailable because the deployed API does not expose ${path.split('?')[0]}. Manual Zemari links, categories, and publishing remain available through Supabase.`,
      409: 'This operation conflicts with the current job state. Refresh and try again.',
      422: 'The enrichment request contains invalid or incomplete values.',
      429: 'The AI service is busy or rate-limited. Wait before starting another job.',
      500: 'AI enrichment failed unexpectedly. No successful analysis should be assumed.',
    }
    const summary = fallback[response.status]
    throw new Error(summary ? `${summary}${detail && detail !== 'Not Found' ? ` Detail: ${detail}` : ''}` : detail || `AI request failed (${response.status}).`)
  }
  try { return await response.json() as T }
  catch { throw new Error(`${init.method || 'GET'} ${path} returned invalid JSON.`) }
}

export function createMezmurEnrichmentJob(mode: BulkJobMode, importIds: string[] = []) {
  return backendRequest<EnrichmentJob>('/api/mezmur-bulk/jobs', { method: 'POST', body: JSON.stringify({ mode, import_ids: importIds }) })
}
export async function checkMezmurAiAvailability() {
  await backendRequest<unknown[]>('/api/mezmur-bulk/jobs?limit=1')
  return true
}
export function cancelMezmurEnrichmentJob(jobId: string) {
  return backendRequest<{ job_id: string; status: string }>(`/api/mezmur-bulk/jobs/${encodeURIComponent(jobId)}/cancel`, { method: 'POST' })
}
export function resumeMezmurEnrichmentJob(jobId: string) {
  return backendRequest<{ job_id: string; status: string }>(`/api/mezmur-bulk/jobs/${encodeURIComponent(jobId)}/resume`, { method: 'POST' })
}

export async function getMezmurEnrichmentJob(jobId: string) {
  const { data, error } = await db().from('mezmur_enrichment_jobs' as never).select('*').eq('id', jobId).maybeSingle()
  if (error) throw error
  if (!data) throw new Error('Enrichment job not found.')
  return data as EnrichmentJob
}

export async function listMezmurSuggestions(jobId: string) {
  const rows = await pagedRows('mezmur_enrichment_suggestions', (from, to) => db().from('mezmur_enrichment_suggestions' as never).select('*').eq('job_id', jobId).order('analyzed_at').range(from, to))
  const mezmurIds = [...new Set(rows.map((row) => text(row.mezmur_import_id)).filter(Boolean))]
  const mezmurs: Record<string, unknown>[] = []
  for (let offset = 0; offset < mezmurIds.length; offset += 100) {
    const page = await db().from('mezmur_data_import' as never).select('import_id,title,singer_name,zemari_id,status').in('import_id', mezmurIds.slice(offset, offset + 100))
    if (page.error) throw page.error
    mezmurs.push(...((page.data || []) as Record<string, unknown>[]))
  }
  const byId = new Map(mezmurs.map((row) => [text(row.import_id), row]))
  return rows.map((row) => ({ ...row, mezmur: byId.get(text(row.mezmur_import_id)) || null })) as EnrichmentSuggestion[]
}

export async function applyMezmurSuggestions(_jobId: string, suggestionIds: string[]) {
  const results: Array<{ suggestionId: string; ok: boolean; error?: string }> = []
  for (const suggestionId of suggestionIds) {
    const { error } = await db().rpc('apply_mezmur_enrichment_suggestion' as never, { p_suggestion_id: suggestionId } as never)
    results.push(error ? {
      suggestionId,
      ok: false,
      error: formatErrorMessage(error, { operation: 'RPC public.apply_mezmur_enrichment_suggestion(uuid)' }),
    } : { suggestionId, ok: true })
  }
  return results
}

export async function assignCategoryToMezmurs(records: BulkMezmurRecord[], categorySlug: string) {
  const category = text(categorySlug).toLowerCase()
  if (!category) throw new Error('Choose an existing category.')
  const results: Array<{ importId: string; ok: boolean; error?: string }> = []
  for (let offset = 0; offset < records.length; offset += 100) {
    const batch = records.slice(offset, offset + 100)
    const { data, error } = await db().rpc('bulk_add_mezmur_category' as never, {
      p_import_ids: batch.map((row) => row.import_id), p_category_slug: category,
    } as never)
    if (error) {
      const rendered = formatErrorMessage(error, { operation: 'RPC public.bulk_add_mezmur_category(uuid[],text)' })
      const detail = /PGRST202|Could not find.*bulk_add_mezmur_category|schema cache/i.test(rendered)
        ? 'The stable-ID bulk category RPC is not installed. Apply migration 20261024270000_mezmur_bulk_schema_compatibility.sql.'
        : rendered
      results.push(...batch.map((row) => ({ importId: row.import_id, ok: false, error: detail })))
      continue
    }
    const payload = data as unknown as { results?: Array<{ import_id: string; outcome: string; reason?: string }> }
    results.push(...(payload.results || []).map((row) => ({ importId: row.import_id, ok: row.outcome === 'applied', error: row.reason })))
  }
  return results
}

export async function assignLanguageToMezmurs(
  records: BulkMezmurRecord[], language: MezmurLanguageCode, overwrite = false,
) {
  const results: Array<{ importId: string; ok: boolean; error?: string }> = []
  for (let offset = 0; offset < records.length; offset += 100) {
    const batch = records.slice(offset, offset + 100)
    const { data, error } = await db().rpc('bulk_assign_mezmur_language' as never, {
      p_import_ids: batch.map((row) => row.import_id), p_language: language, p_overwrite: overwrite,
    } as never)
    if (error) {
      const message = formatErrorMessage(error, { operation: 'RPC public.bulk_assign_mezmur_language(uuid[],text,boolean)' })
      results.push(...batch.map((row) => ({ importId: row.import_id, ok: false, error: message })))
      continue
    }
    const payload = data as unknown as { results?: Array<{ import_id: string; outcome: string; reason?: string }> }
    results.push(...(payload.results || []).map((row) => ({ importId: row.import_id, ok: row.outcome === 'applied', error: row.outcome === 'failed' ? row.reason : undefined })))
  }
  return results
}

export async function linkMezmursToZemaris(
  links: Array<{ importId: string; zemariId: string }>, overwrite = false,
) {
  const results: Array<{ importId: string; ok: boolean; outcome?: string; error?: string }> = []
  for (let offset = 0; offset < links.length; offset += 100) {
    const batch = links.slice(offset, offset + 100)
    const { data, error } = await db().rpc('bulk_link_mezmur_zemaris' as never, {
      p_links: batch.map((row) => ({ import_id: row.importId, zemari_id: row.zemariId })),
      p_overwrite: overwrite,
    } as never)
    if (error) {
      const rendered = formatErrorMessage(error, { operation: 'RPC public.bulk_link_mezmur_zemaris(jsonb,boolean)' })
      const message = /PGRST202|Could not find.*bulk_link_mezmur_zemaris|schema cache/i.test(rendered)
        ? 'The protected Zemari-link RPC is not installed. Apply migration 20261024290000_mezmur_zemari_matching.sql.'
        : rendered
      results.push(...batch.map((row) => ({ importId: row.importId, ok: false, error: message })))
      continue
    }
    const payload = data as unknown as { results?: Array<{ import_id: string; outcome: string; reason?: string }> }
    results.push(...(payload.results || []).map((row) => ({ importId: row.import_id, ok: row.outcome === 'linked', outcome: row.outcome, error: row.reason })))
  }
  return results
}

export async function publishEligibleMezmurs(importIds: string[]): Promise<BulkPublishResult> {
  const aggregate: BulkPublishResult = { published: 0, skipped: 0, failed: 0, results: [] }
  for (let offset = 0; offset < importIds.length; offset += 100) {
    const { data, error } = await db().rpc('bulk_publish_mezmur_imports' as never, { p_import_ids: importIds.slice(offset, offset + 100) } as never)
    if (error) throw new Error(formatErrorMessage(error, { operation: 'RPC public.bulk_publish_mezmur_imports(uuid[])' }))
    const result = parseBulkPublishResult(data)
    aggregate.published += Number(result?.published || 0); aggregate.skipped += Number(result?.skipped || 0); aggregate.failed += Number(result?.failed || 0)
    aggregate.results.push(...(result?.results || []))
  }
  return aggregate
}

function csvCell(value: unknown) {
  const valueText = Array.isArray(value) ? value.join(' | ') : String(value ?? '')
  return `"${valueText.split('"').join('""')}"`
}

export function exportSuggestionsCsv(rows: EnrichmentSuggestion[]) {
  const header = ['mezmur_import_id', 'zemari_id', 'categories', 'occasions', 'confidence', 'needs_review', 'publication_eligible', 'status', 'reason']
  const body = rows.map((row) => [row.mezmur_import_id, row.zemari_id, row.category_slugs, row.occasion_slugs, row.classification_confidence, row.requires_review, row.publication_eligible, row.status, row.error_message || row.publication_block_reason || row.explanation].map(csvCell).join(','))
  downloadCsv(`mezmur-enrichment-${new Date().toISOString().slice(0, 10)}.csv`, [header.join(','), ...body])
}

export function exportPublicationResultsCsv(rows: BulkPublishResult['results']) {
  downloadCsv(`mezmur-publication-results-${new Date().toISOString().slice(0, 10)}.csv`, [
    'import_id,outcome,sqlstate,reason',
    ...rows.map((row) => [row.import_id, row.outcome, row.sqlstate, row.reason].map(csvCell).join(',')),
  ])
}

export type AutoCategorizeMode = 'all' | 'missing_categories' | 'missing_occasions' | 'selected'

export type ClassificationRunProgress = {
  phase: 'classifying' | 'persisting' | 'completed' | 'failed'
  totalEligible: number
  draftCount: number
  publishedCount: number
  analyzed: number
  saved: number
  categoriesAssigned: number
  occasionsAssigned: number
  categoriesInserted?: number
  categoriesAlreadyPresent?: number
  occasionsInserted?: number
  occasionsAlreadyPresent?: number
  manualRelationshipsPreserved?: number
  generalFallback: number
  skipped: number
  failed: number
  remaining: number
  currentTitle?: string
}

export type ClassificationItemResult = {
  importId: string
  slug: string
  title: string
  primaryCategory: string
  additionalCategories: string[]
  primaryOccasion: string | null
  additionalOccasions: string[]
  method: string
  confidence: number
  ok: boolean
  outcome: 'applied' | 'skipped' | 'failed'
  categoriesInserted?: number
  categoriesAlreadyPresent?: number
  occasionsInserted?: number
  occasionsAlreadyPresent?: number
  manualRelationshipsPreserved?: number
  error?: string
}

export type AutoCategorizeResult = {
  totalEligible: number
  draftCount: number
  publishedCount: number
  analyzed: number
  saved: number
  categoriesAssigned: number
  occasionsAssigned: number
  categoriesInserted: number
  categoriesAlreadyPresent: number
  occasionsInserted: number
  occasionsAlreadyPresent: number
  manualRelationshipsPreserved: number
  generalFallback: number
  skipped: number
  failed: number
  items: ClassificationItemResult[]
}

export async function autoCategorizeMezmurs(
  records: BulkMezmurRecord[],
  options: {
    mode: AutoCategorizeMode
    selectedIds?: Set<string>
    overwrite?: boolean
    onProgress?: (progress: ClassificationRunProgress) => void
    signal?: AbortSignal
  },
): Promise<AutoCategorizeResult> {
  const overwrite = Boolean(options.overwrite)
  let targetRecords: BulkMezmurRecord[] = []

  if (options.mode === 'all') {
    targetRecords = [...records]
  } else if (options.mode === 'missing_categories') {
    targetRecords = records.filter((r) => r.category_slugs.length === 0)
  } else if (options.mode === 'missing_occasions') {
    targetRecords = records.filter((r) => r.occasion_slugs.length === 0)
  } else if (options.mode === 'selected') {
    const selected = options.selectedIds || new Set<string>()
    targetRecords = records.filter((r) => selected.has(r.import_id))
  }

  const totalEligible = targetRecords.length
  const draftCount = targetRecords.filter((r) => r.status === 'draft').length
  const publishedCount = targetRecords.filter((r) => r.status === 'published').length
  let analyzed = 0
  let saved = 0
  let categoriesAssigned = 0
  let occasionsAssigned = 0
  let categoriesInserted = 0
  let categoriesAlreadyPresent = 0
  let occasionsInserted = 0
  let occasionsAlreadyPresent = 0
  let manualRelationshipsPreserved = 0
  let generalFallback = 0
  let skipped = 0
  let failed = 0

  const items: ClassificationItemResult[] = []
  const pendingPersist: Array<{
    record: BulkMezmurRecord
    categories: string[]
    occasions: string[]
    classification: MezmurClassificationResult
  }> = []

  // Phase 1: Analyze lyrics
  for (let i = 0; i < targetRecords.length; i++) {
    if (options.signal?.aborted) break
    const rec = targetRecords[i]

    const classification = classifyMezmur({
      import_id: rec.import_id,
      slug: rec.slug,
      title: rec.title,
      singer_name: rec.singer_name,
      zemari_name: rec.zemari_name,
      lyrics_amharic: rec.lyrics_amharic,
      lyrics_geez: rec.lyrics_geez,
      lyrics_english: rec.lyrics_english,
      lyrics_oromo: rec.lyrics_oromo,
      lyrics_transliteration: rec.lyrics_transliteration,
      primary_language: rec.language,
    })

    analyzed++
    if (classification.method === 'fallback_general') {
      generalFallback++
    }

    const hasExistingCats = rec.category_slugs.length > 0
    const hasExistingOccs = rec.occasion_slugs.length > 0

    if (hasExistingCats && hasExistingOccs && !overwrite) {
      skipped++
      items.push({
        importId: rec.import_id,
        slug: rec.slug,
        title: rec.title,
        primaryCategory: rec.category_slugs[0] || classification.primaryCategorySlug,
        additionalCategories: rec.category_slugs.slice(1),
        primaryOccasion: rec.occasion_slugs[0] || null,
        additionalOccasions: rec.occasion_slugs.slice(1),
        method: 'preserved_existing',
        confidence: 1.0,
        ok: true,
        outcome: 'skipped',
      })
    } else {
      const finalCategories = hasExistingCats && !overwrite
        ? [...rec.category_slugs]
        : [classification.primaryCategorySlug, ...classification.additionalCategorySlugs]

      const finalOccasions = hasExistingOccs && !overwrite
        ? [...rec.occasion_slugs]
        : [
            ...(classification.primaryOccasionSlug ? [classification.primaryOccasionSlug] : []),
            ...classification.additionalOccasionSlugs,
          ]

      pendingPersist.push({
        record: rec,
        categories: [...new Set(finalCategories)],
        occasions: [...new Set(finalOccasions)],
        classification,
      })
    }

    options.onProgress?.({
      phase: 'classifying',
      totalEligible,
      draftCount,
      publishedCount,
      analyzed,
      saved,
      categoriesAssigned,
      occasionsAssigned,
      generalFallback,
      skipped,
      failed,
      remaining: totalEligible - analyzed,
      currentTitle: rec.title,
    })
  }

  // Phase 2: Persist classifications to Supabase in chunks of 50
  const CHUNK_SIZE = 50
  for (let offset = 0; offset < pendingPersist.length; offset += CHUNK_SIZE) {
    if (options.signal?.aborted) break
    const chunk = pendingPersist.slice(offset, offset + CHUNK_SIZE)

    const payload = chunk.map((item) => ({
      import_id: item.record.import_id,
      slug: item.record.slug,
      category_slugs: item.categories,
      occasion_slugs: item.occasions,
    }))

    try {
      const { data, error } = await db().rpc('bulk_assign_mezmur_classifications' as never, {
        p_classifications: payload,
        p_overwrite: overwrite,
      } as never)

      if (error) {
        const errorMsg = formatErrorMessage(error, {
          operation: 'RPC public.bulk_assign_mezmur_classifications(jsonb,boolean)',
        })
        const hint = /PGRST202|Could not find.*bulk_assign_mezmur_classifications|schema cache/i.test(errorMsg)
          ? 'The auto-classification RPC is not installed in Supabase. Apply migration 20261025020000_mezmur_bulk_classification.sql in Supabase SQL Editor.'
          : errorMsg

        failed += chunk.length
        for (const item of chunk) {
          items.push({
            importId: item.record.import_id,
            slug: item.record.slug,
            title: item.record.title,
            primaryCategory: item.classification.primaryCategorySlug,
            additionalCategories: item.classification.additionalCategorySlugs,
            primaryOccasion: item.classification.primaryOccasionSlug,
            additionalOccasions: item.classification.additionalOccasionSlugs,
            method: item.classification.method,
            confidence: item.classification.confidence,
            ok: false,
            outcome: 'failed',
            error: hint,
          })
        }
      } else {
        const parsed = data as unknown as {
          applied?: number
          failed?: number
          categories_inserted?: number
          categories_already_present?: number
          occasions_inserted?: number
          occasions_already_present?: number
          manual_relationships_preserved?: number
          results?: Array<{
            import_id: string
            slug?: string
            outcome: string
            reason?: string
            categories_inserted?: number
            categories_already_present?: number
            occasions_inserted?: number
            occasions_already_present?: number
            manual_relationships_preserved?: number
          }>
        }
        const outcomeMap = new Map((parsed?.results || []).map((r) => [r.import_id, r]))

        // Read-after-write verification is UUID-only. Slugs are deliberately
        // excluded because production contains legacy duplicate slugs.
        const chunkIds = chunk.map((c) => c.record.import_id)
        const [catCheck, occCheck] = await Promise.all([
          db()
            .from('mezmur_category_links_import' as never)
            .select('mezmur_import_id,category_slug')
            .in('mezmur_import_id', chunkIds),
          db()
            .from('mezmur_occasion_links_import' as never)
            .select('mezmur_import_id,occasion_slug')
            .in('mezmur_import_id', chunkIds),
        ])
        if (catCheck.error || occCheck.error) {
          throw new Error(formatErrorMessage(catCheck.error || occCheck.error, {
            operation: 'Verify UUID-keyed Mezmur classification relationships',
          }))
        }

        const verifiedCats = new Set(
          ((catCheck.data || []) as Array<{ mezmur_import_id: string; category_slug: string }>).map(
            (r) => `${r.mezmur_import_id}:${r.category_slug}`,
          ),
        )
        const verifiedOccs = new Set(
          ((occCheck.data || []) as Array<{ mezmur_import_id: string; occasion_slug: string }>).map(
            (r) => `${r.mezmur_import_id}:${r.occasion_slug}`,
          ),
        )

        for (const item of chunk) {
          const outcomeInfo = outcomeMap.get(item.record.import_id)
          const isRpcSuccess = outcomeInfo?.outcome === 'applied'

          // Every requested relationship must physically exist for this exact UUID.
          const hasConfirmedCategory =
            item.categories.every((c) => verifiedCats.has(`${item.record.import_id}:${c}`))
          const hasConfirmedOccasion =
            item.occasions.every((o) => verifiedOccs.has(`${item.record.import_id}:${o}`))
          const isVerified = isRpcSuccess && hasConfirmedCategory && hasConfirmedOccasion

          if (isVerified) {
            saved++
            categoriesAssigned += item.categories.length
            occasionsAssigned += item.occasions.length
            categoriesInserted += outcomeInfo.categories_inserted || 0
            categoriesAlreadyPresent += outcomeInfo.categories_already_present || 0
            occasionsInserted += outcomeInfo.occasions_inserted || 0
            occasionsAlreadyPresent += outcomeInfo.occasions_already_present || 0
            manualRelationshipsPreserved += outcomeInfo.manual_relationships_preserved || 0
            items.push({
              importId: item.record.import_id,
              slug: item.record.slug,
              title: item.record.title,
              primaryCategory: item.classification.primaryCategorySlug,
              additionalCategories: item.classification.additionalCategorySlugs,
              primaryOccasion: item.classification.primaryOccasionSlug,
              additionalOccasions: item.classification.additionalOccasionSlugs,
              method: item.classification.method,
              confidence: item.classification.confidence,
              ok: true,
              outcome: 'applied',
              categoriesInserted: outcomeInfo.categories_inserted || 0,
              categoriesAlreadyPresent: outcomeInfo.categories_already_present || 0,
              occasionsInserted: outcomeInfo.occasions_inserted || 0,
              occasionsAlreadyPresent: outcomeInfo.occasions_already_present || 0,
              manualRelationshipsPreserved: outcomeInfo.manual_relationships_preserved || 0,
            })
          } else {
            failed++
            items.push({
              importId: item.record.import_id,
              slug: item.record.slug,
              title: item.record.title,
              primaryCategory: item.classification.primaryCategorySlug,
              additionalCategories: item.classification.additionalCategorySlugs,
              primaryOccasion: item.classification.primaryOccasionSlug,
              additionalOccasions: item.classification.additionalOccasionSlugs,
              method: item.classification.method,
              confidence: item.classification.confidence,
              ok: false,
              outcome: 'failed',
              error: outcomeInfo?.reason || 'Database persistence could not be verified in link staging tables.',
            })
          }
        }
      }
    } catch (err) {
      const errorMsg = formatErrorMessage(err, { operation: 'Classification persistence execution' })
      failed += chunk.length
      for (const item of chunk) {
        items.push({
          importId: item.record.import_id,
          slug: item.record.slug,
          title: item.record.title,
          primaryCategory: item.classification.primaryCategorySlug,
          additionalCategories: item.classification.additionalCategorySlugs,
          primaryOccasion: item.classification.primaryOccasionSlug,
          additionalOccasions: item.classification.additionalOccasionSlugs,
          method: item.classification.method,
          confidence: item.classification.confidence,
          ok: false,
          outcome: 'failed',
          error: errorMsg,
        })
      }
    }

    options.onProgress?.({
      phase: 'persisting',
      totalEligible,
      draftCount,
      publishedCount,
      analyzed,
      saved,
      categoriesAssigned,
      occasionsAssigned,
      generalFallback,
      skipped,
      failed,
      remaining: Math.max(0, pendingPersist.length - (offset + chunk.length)),
      currentTitle: chunk[chunk.length - 1]?.record.title,
    })
  }

  options.onProgress?.({
    phase: 'completed',
    totalEligible,
    draftCount,
    publishedCount,
    analyzed,
    saved,
    categoriesAssigned,
    occasionsAssigned,
    categoriesInserted,
    categoriesAlreadyPresent,
    occasionsInserted,
    occasionsAlreadyPresent,
    manualRelationshipsPreserved,
    generalFallback,
    skipped,
    failed,
    remaining: 0,
  })

  return {
    totalEligible,
    draftCount,
    publishedCount,
    analyzed,
    saved,
    categoriesAssigned,
    occasionsAssigned,
    categoriesInserted,
    categoriesAlreadyPresent,
    occasionsInserted,
    occasionsAlreadyPresent,
    manualRelationshipsPreserved,
    generalFallback,
    skipped,
    failed,
    items,
  }
}

export function exportClassificationResultsCsv(items: ClassificationItemResult[]) {
  const header = ['import_id', 'slug', 'title', 'primary_category', 'additional_categories', 'primary_occasion', 'additional_occasions', 'method', 'confidence', 'status', 'categories_inserted', 'categories_already_present', 'occasions_inserted', 'occasions_already_present', 'manual_relationships_preserved', 'error']
  const body = items.map((i) => [
    i.importId,
    i.slug,
    i.title,
    i.primaryCategory,
    i.additionalCategories.join(' | '),
    i.primaryOccasion || '',
    i.additionalOccasions.join(' | '),
    i.method,
    i.confidence,
    i.outcome,
    i.categoriesInserted ?? '',
    i.categoriesAlreadyPresent ?? '',
    i.occasionsInserted ?? '',
    i.occasionsAlreadyPresent ?? '',
    i.manualRelationshipsPreserved ?? '',
    i.error || '',
  ].map(csvCell).join(','))
  downloadCsv(`mezmur-classification-${new Date().toISOString().slice(0, 10)}.csv`, [header.join(','), ...body])
}

export function exportFailedClassificationsCsv(items: ClassificationItemResult[]) {
  const failedItems = items.filter((i) => !i.ok || i.outcome === 'failed')
  const header = ['import_id', 'slug', 'title', 'primary_category', 'primary_occasion', 'status', 'error']
  const body = failedItems.map((i) => [
    i.importId,
    i.slug,
    i.title,
    i.primaryCategory,
    i.primaryOccasion || '',
    i.outcome,
    i.error || '',
  ].map(csvCell).join(','))
  downloadCsv(`mezmur-classification-failed-${new Date().toISOString().slice(0, 10)}.csv`, [header.join(','), ...body])
}

export type AutoFormatLyricsMode =
  | 'all'
  | 'draft'
  | 'published'
  | 'selected'
  | 'unformatted_only'
  | 'reformat_existing'

export type AutoFormatLyricsProgress = {
  phase: 'analyzing' | 'persisting' | 'completed' | 'cancelled'
  totalEligible: number
  total: number
  draftCount: number
  publishedCount: number
  processed: number
  saved: number
  formatted: number
  alreadyFormatted: number
  missingLyrics: number
  pairedAligned: number
  paragraphsAligned: number
  mergedTransCount: number
  splitTransCount: number
  approximateCount: number
  failed: number
  remaining: number
  currentTitle?: string
}

export type AutoFormatLyricsResult = {
  totalEligible: number
  total: number
  draftCount: number
  publishedCount: number
  processed: number
  saved: number
  formatted: number
  alreadyFormatted: number
  missingLyrics: number
  pairedAligned: number
  paragraphsAligned: number
  mergedTransCount: number
  splitTransCount: number
  approximateCount: number
  failed: number
  items: FormattedMezmurRecordResult[]
}

export async function autoFormatMezmurLyrics(
  records: BulkMezmurRecord[],
  options: {
    mode: AutoFormatLyricsMode
    selectedIds?: Set<string>
    onProgress?: (progress: AutoFormatLyricsProgress) => void
    signal?: AbortSignal
    dryRun?: boolean
  },
): Promise<AutoFormatLyricsResult> {
  const reformatExisting = options.mode === 'reformat_existing'
  let targetRecords: BulkMezmurRecord[] = []

  if (options.mode === 'all' || options.mode === 'reformat_existing') {
    targetRecords = records.filter((r) => r.has_lyrics)
  } else if (options.mode === 'draft') {
    targetRecords = records.filter((r) => r.status === 'draft' && r.has_lyrics)
  } else if (options.mode === 'published') {
    targetRecords = records.filter((r) => r.status === 'published' && r.has_lyrics)
  } else if (options.mode === 'selected') {
    const selected = options.selectedIds || new Set<string>()
    targetRecords = records.filter((r) => selected.has(r.import_id) && r.has_lyrics)
  } else if (options.mode === 'unformatted_only') {
    targetRecords = records.filter((r) => {
      if (!r.has_lyrics) return false
      const am = r.lyrics_amharic?.trim()
      const gz = r.lyrics_geez?.trim()
      const en = r.lyrics_english?.trim()
      const om = r.lyrics_oromo?.trim()
      const tr = r.lyrics_transliteration?.trim()
      // If any populated field is not yet formatted, it's eligible
      return (
        (am && !isLyricsFormatted(am)) ||
        (gz && !isLyricsFormatted(gz)) ||
        (en && !isLyricsFormatted(en)) ||
        (om && !isLyricsFormatted(om)) ||
        (tr && !isLyricsFormatted(tr))
      )
    })
  }

  const totalEligible = targetRecords.length
  const draftCount = targetRecords.filter((r) => r.status === 'draft').length
  const publishedCount = targetRecords.filter((r) => r.status === 'published').length
  let processed = 0
  let saved = 0
  let alreadyFormatted = 0
  let missingLyrics = 0
  let pairedAligned = 0
  let paragraphsAligned = 0
  let mergedTransCount = 0
  let splitTransCount = 0
  let approximateCount = 0
  let failed = 0

  const items: FormattedMezmurRecordResult[] = []
  const pendingPersist: Array<{
    record: BulkMezmurRecord
    formatResult: FormattedMezmurRecordResult
  }> = []

  // Phase 1: Format and align lyrics
  for (let i = 0; i < targetRecords.length; i++) {
    if (options.signal?.aborted) break
    const rec = targetRecords[i]

    const res = formatMezmurRecordLyrics(
      {
        import_id: rec.import_id,
        slug: rec.slug,
        title: rec.title,
        status: rec.status,
        lyrics_amharic: rec.lyrics_amharic,
        lyrics_geez: rec.lyrics_geez,
        lyrics_english: rec.lyrics_english,
        lyrics_oromo: rec.lyrics_oromo,
        lyrics_transliteration: rec.lyrics_transliteration,
      },
      { reformatExisting },
    )

    processed++

    if (!res.hasLyrics) {
      missingLyrics++
      items.push(res)
    } else if (res.alreadyFormatted && !reformatExisting) {
      alreadyFormatted++
      items.push(res)
    } else if (!res.ok) {
      failed++
      items.push(res)
    } else {
      if (res.alignmentType !== 'none') {
        pairedAligned++
        paragraphsAligned += res.origParagraphCount
      }
      if (res.alignmentType === 'merged') mergedTransCount++
      if (res.alignmentType === 'split') splitTransCount++
      if (res.alignmentType === 'approximate') approximateCount++

      pendingPersist.push({
        record: rec,
        formatResult: res,
      })
    }

    options.onProgress?.({
      phase: 'analyzing',
      totalEligible,
      total: totalEligible,
      draftCount,
      publishedCount,
      processed,
      saved,
      formatted: saved,
      alreadyFormatted,
      missingLyrics,
      pairedAligned,
      paragraphsAligned,
      mergedTransCount,
      splitTransCount,
      approximateCount,
      failed,
      remaining: totalEligible - processed,
      currentTitle: rec.title,
    })
  }

function verifyPersistedLyrics(
  persistedRow: Record<string, unknown> | null | undefined,
  expectedLyrics: FormattedMezmurRecordResult['updatedLyrics'],
  expectedStatus: string,
): void {
  if (!persistedRow) {
    throw new Error('Database did not return persisted row for read-after-write confirmation.')
  }
  if (persistedRow.status !== expectedStatus) {
    throw new Error(`Record status was unexpectedly changed from ${expectedStatus} to ${persistedRow.status}`)
  }
  for (const [key, expectedVal] of Object.entries(expectedLyrics)) {
    if (expectedVal !== undefined && expectedVal !== null && key in persistedRow) {
      const actualVal = persistedRow[key]
      if (typeof actualVal === 'string' && actualVal.trim() !== expectedVal.trim()) {
        throw new Error(`Read-after-write verification failed for ${key}: persisted content does not match.`)
      }
    }
  }
}

  // Phase 2: Persist formatted lyrics to Supabase in chunks of 25
  const CHUNK_SIZE = 25
  for (let offset = 0; offset < pendingPersist.length; offset += CHUNK_SIZE) {
    if (options.signal?.aborted) break
    const chunk = pendingPersist.slice(offset, offset + CHUNK_SIZE)

    for (const item of chunk) {
      if (options.dryRun) {
        saved++
        items.push({
          ...item.formatResult,
          ok: true,
        })
        continue
      }
      try {
        const updatePayload: Record<string, unknown> = {
          ...item.formatResult.updatedLyrics,
          updated_at: new Date().toISOString(),
        }

        const { data, error } = await db()
          .from('mezmur_data_import' as never)
          .update(updatePayload as never)
          .eq('import_id', item.record.import_id)
          .select('import_id, slug, status, lyrics_amharic, lyrics_geez, lyrics_english, lyrics_oromo, lyrics_transliteration')

        let savedRow = (data as Record<string, unknown>[] | null)?.[0]

        if (error || !savedRow) {
          // Retry by slug if import_id match fails
          const { data: slugData, error: slugErr } = await db()
            .from('mezmur_data_import' as never)
            .update(updatePayload as never)
            .eq('slug', item.record.slug)
            .select('import_id, slug, status, lyrics_amharic, lyrics_geez, lyrics_english, lyrics_oromo, lyrics_transliteration')

          if (slugErr) throw slugErr
          savedRow = (slugData as Record<string, unknown>[] | null)?.[0]
        }

        verifyPersistedLyrics(savedRow, item.formatResult.updatedLyrics, item.record.status)

        saved++
        items.push({
          ...item.formatResult,
          ok: true,
        })
      } catch (err) {
        failed++
        items.push({
          ...item.formatResult,
          ok: false,
          error: formatErrorMessage(err, { operation: `Update lyrics for ${item.record.title}` }),
        })
      }
    }

    options.onProgress?.({
      phase: 'persisting',
      totalEligible,
      total: totalEligible,
      draftCount,
      publishedCount,
      processed,
      saved,
      formatted: saved,
      alreadyFormatted,
      missingLyrics,
      pairedAligned,
      paragraphsAligned,
      mergedTransCount,
      splitTransCount,
      approximateCount,
      failed,
      remaining: Math.max(0, pendingPersist.length - (offset + chunk.length)),
      currentTitle: chunk[chunk.length - 1]?.record.title,
    })
  }

  options.onProgress?.({
    phase: options.signal?.aborted ? 'cancelled' : 'completed',
    totalEligible,
    total: totalEligible,
    draftCount,
    publishedCount,
    processed,
    saved,
    formatted: saved,
    alreadyFormatted,
    missingLyrics,
    pairedAligned,
    paragraphsAligned,
    mergedTransCount,
    splitTransCount,
    approximateCount,
    failed,
    remaining: 0,
  })

  return {
    totalEligible,
    total: totalEligible,
    draftCount,
    publishedCount,
    processed,
    saved,
    formatted: saved,
    alreadyFormatted,
    missingLyrics,
    pairedAligned,
    paragraphsAligned,
    mergedTransCount,
    splitTransCount,
    approximateCount,
    failed,
    items,
  }
}

export function exportLyricsFormatResultsCsv(items: FormattedMezmurRecordResult[]): string {
  const header = [
    'Mezmur ID',
    'Title',
    'Publication status',
    'Populated languages',
    'Original paragraph count',
    'Transliteration paragraph count before alignment',
    'Transliteration paragraph count after alignment',
    'Chorus count',
    'Verse count',
    'Alignment type',
    'Result status',
    'Error message',
  ]
  const body = items.map((i) => [
    i.importId,
    i.title,
    i.status,
    i.populatedLanguages.join(' | '),
    i.origParagraphCount,
    i.transParagraphCountBefore,
    i.transParagraphCountAfter,
    i.chorusCount,
    i.verseCount,
    i.alignmentType,
    i.ok ? (i.alreadyFormatted ? 'already_formatted' : i.changed ? 'formatted' : 'preserved') : 'failed',
    i.error || '',
  ].map(csvCell).join(','))
  return downloadCsv(`mezmur-lyrics-format-${new Date().toISOString().slice(0, 10)}.csv`, [header.join(','), ...body])
}

export function exportFailedLyricsFormatCsv(items: FormattedMezmurRecordResult[]): string {
  const failedItems = items.filter((i) => !i.ok || i.error)
  const header = ['Mezmur ID', 'Title', 'Publication status', 'Error message']
  const body = failedItems.map((i) => [
    i.importId,
    i.title,
    i.status,
    i.error || 'Formatting failed',
  ].map(csvCell).join(','))
  return downloadCsv(`mezmur-lyrics-format-failed-${new Date().toISOString().slice(0, 10)}.csv`, [header.join(','), ...body])
}

function downloadCsv(filename: string, rows: string[]): string {
  const content = rows.join('\n')
  if (typeof document !== 'undefined' && typeof window !== 'undefined') {
    const blob = new Blob([content], { type: 'text/csv;charset=utf-8' })
    const url = URL.createObjectURL(blob)
    const anchor = document.createElement('a')
    anchor.href = url
    anchor.download = filename
    anchor.click()
    URL.revokeObjectURL(url)
  }
  return content
}
