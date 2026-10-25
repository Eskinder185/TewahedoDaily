import { supabase } from '../supabase/client'
import { requireCmsStaffSession } from './cmsStaffAuth'

export type HymnTrashType = 'mezmur' | 'zemari' | 'collection' | 'section'

export type HymnTrashItem = {
  type: HymnTrashType
  key: string
  title: string
  slug: string | null
  previousStatus: string | null
  deletedAt: string
  deletedBy: string | null
  associatedMezmurCount: number
}

type DbError = { code?: string; message?: string; details?: string; hint?: string }

function text(value: unknown): string {
  return typeof value === 'string' ? value.trim() : value == null ? '' : String(value).trim()
}

function contextualTrashError(operation: string, error: DbError): Error {
  const message = text(error.message)
  const context = `${message} ${text(error.details)} ${text(error.hint)}`
  if (import.meta.env.DEV) {
    console.error(`[contentTrash] ${operation}`, {
      code: error.code,
      message: error.message,
      details: error.details,
      hint: error.hint,
    })
  }
  if (error.code === 'PGRST301' || /jwt expired|invalid jwt|session.*expired/i.test(context)) {
    return new Error('Your login session expired. Sign in again before using Trash management.')
  }
  if (error.code === '42501') {
    return new Error(`Permission denied while trying to ${operation}. Admin is required for Trash/Restore and Super Admin for permanent deletion.`)
  }
  if (error.code === 'PGRST202') {
    return new Error(
      `The connected Supabase project does not expose the required Trash RPC signature for “${operation}”. Verify VITE_SUPABASE_URL, apply the final Trash repair migration, then reload the PostgREST schema cache.`,
    )
  }
  if (error.code === '42883' || /function .* does not exist|wrong.*signature/i.test(context)) {
    return new Error(`The Trash RPC exists with the wrong signature for “${operation}”. Apply the final repair migration and reload the API schema.`)
  }
  if (
    (error.code === '42703' || error.code === 'PGRST204') &&
    /(?:mezmur_data_import|mezmur_collections_import|mezmur_sections_import)?\.?import_id.*(?:does not exist|not found|schema cache)/i.test(context)
  ) {
    return new Error(
      `The connected project is missing the internal UUID identifiers required to ${operation}. Apply the corrected 20261024220000 Trash repair migration once, then reload the PostgREST schema cache. Existing content will be preserved.`,
    )
  }
  if (/schema cache/i.test(context)) {
    return new Error(`PostgREST has stale schema metadata while trying to ${operation}. Reload the Supabase API schema cache; do not recreate columns.`)
  }
  if (error.code === '42P01') {
    return new Error(`The database object required to ${operation} is missing from the connected Supabase project.`)
  }
  if (error.code === '23503' || /associated with|still contains|still referenced/i.test(message)) {
    return new Error(message || 'This content is still referenced by other records.')
  }
  if (/failed to fetch|networkerror|network request failed/i.test(context)) {
    return new Error(`Unable to reach the configured Supabase project while trying to ${operation}. Check the project URL and network connection.`)
  }
  const suffix = error.code ? ` (${error.code})` : ''
  return new Error(message ? `${message}${suffix}` : `Unexpected database error while trying to ${operation}${suffix}.`)
}

function isStaleZemariCountsView(error: DbError): boolean {
  const message = text(error.message)
  return (
    (error.code === '42703' || error.code === 'PGRST204') &&
    /(?:zemaris_with_counts\.)?(deleted_at|deleted_by|deleted_from_status).*does not exist/i.test(message)
  )
}

function mapRows(
  type: HymnTrashType,
  rows: Array<Record<string, unknown>>,
): HymnTrashItem[] {
  const mapped = rows.map((row) => ({
    type,
    key: text(type === 'zemari' ? row.id : row.import_id),
    title: text(type === 'zemari' ? row.name : row.title) || 'Untitled',
    slug: text(
      type === 'mezmur' || type === 'zemari'
        ? row.slug
        : type === 'collection'
          ? row.collection_slug
          : row.section_slug,
    ) || null,
    previousStatus: text(row.deleted_from_status) || null,
    deletedAt: text(row.deleted_at),
    deletedBy: text(row.deleted_by) || null,
    associatedMezmurCount: Number(row.mezmur_count) || 0,
  }))
  if (mapped.some((item) => !item.key)) {
    throw new Error(`A trashed ${type} record has no stable UUID identifier. Repair that record before performing destructive actions.`)
  }
  return mapped
}

async function trashedRows(
  table: string,
  select: string,
  type: HymnTrashType,
): Promise<HymnTrashItem[]> {
  if (!supabase) throw new Error('Supabase is not configured.')
  const { data, error } = await supabase
    .from(table as never)
    .select(select)
    .not('deleted_at', 'is', null)
    .order('deleted_at', { ascending: false })
  if (error) throw contextualTrashError(`load trashed ${type} records`, error)
  return mapRows(type, (data || []) as Array<Record<string, unknown>>)
}

async function trashedZemariRows(): Promise<HymnTrashItem[]> {
  if (!supabase) throw new Error('Supabase is not configured.')
  const viewResult = await supabase
    .from('zemaris_with_counts' as never)
    .select('id, slug, name, mezmur_count, deleted_from_status, deleted_at, deleted_by')
    .not('deleted_at', 'is', null)
    .order('deleted_at', { ascending: false })
  if (!viewResult.error) {
    return mapRows('zemari', (viewResult.data || []) as Array<Record<string, unknown>>)
  }
  if (!isStaleZemariCountsView(viewResult.error)) {
    throw contextualTrashError('load trashed zemari records', viewResult.error)
  }

  // Some production projects added the base-table Trash columns before
  // rebuilding this derived view. Query the canonical table so the UI remains
  // usable while the view is repaired; do not misreport this as a missing base
  // column or ask administrators to recreate already-existing columns.
  const baseResult = await supabase
    .from('zemaris' as never)
    .select('id, slug, name, deleted_from_status, deleted_at, deleted_by')
    .not('deleted_at', 'is', null)
    .order('deleted_at', { ascending: false })
  if (baseResult.error) {
    throw contextualTrashError('load trashed zemari records from canonical table', baseResult.error)
  }
  const rows = (baseResult.data || []) as Array<Record<string, unknown>>
  const ids = rows.map((row) => text(row.id)).filter(Boolean)
  const counts = new Map<string, number>()
  if (ids.length) {
    const linkResult = await supabase
      .from('mezmur_data_import' as never)
      .select('zemari_id')
      .in('zemari_id', ids)
      .is('deleted_at', null)
    if (linkResult.error) {
      throw contextualTrashError('count Mezmurs for trashed Zemaris', linkResult.error)
    }
    for (const link of (linkResult.data || []) as Array<Record<string, unknown>>) {
      const id = text(link.zemari_id)
      if (id) counts.set(id, (counts.get(id) || 0) + 1)
    }
  }
  return mapRows(
    'zemari',
    rows.map((row) => ({ ...row, mezmur_count: counts.get(text(row.id)) || 0 })),
  )
}

export async function listHymnTrash(): Promise<HymnTrashItem[]> {
  await requireCmsStaffSession('Hymns Trash read')
  const [mezmurs, zemaris, collections, sections] = await Promise.all([
    trashedRows(
      'mezmur_data_import',
      'import_id, mezmur_id, slug, title, deleted_from_status, deleted_at, deleted_by',
      'mezmur',
    ),
    trashedZemariRows(),
    trashedRows(
      'mezmur_collections_import',
      'import_id, collection_id, collection_slug, title, deleted_from_status, deleted_at, deleted_by',
      'collection',
    ),
    trashedRows(
      'mezmur_sections_import',
      'import_id, section_id, section_slug, title, deleted_from_status, deleted_at, deleted_by',
      'section',
    ),
  ])
  return [...mezmurs, ...zemaris, ...collections, ...sections].sort(
    (a, b) => Date.parse(b.deletedAt) - Date.parse(a.deletedAt),
  )
}

async function callTrashRpc(
  operation: string,
  rpc: string,
  args: Record<string, string>,
): Promise<void> {
  await requireCmsStaffSession(`Hymns Trash ${operation}`)
  if (!supabase) throw new Error('Supabase is not configured.')
  const { error } = await supabase.rpc(rpc as never, args as never)
  if (error) throw contextualTrashError(operation, error)
}

export async function moveHymnContentToTrash(type: HymnTrashType, key: string): Promise<void> {
  return callTrashRpc(`move this ${type} to Trash`, 'trash_hymn_content', {
    p_content_type: type,
    p_content_key: key,
  })
}

export async function restoreHymnContent(type: HymnTrashType, key: string): Promise<void> {
  return callTrashRpc(`restore this ${type}`, 'restore_hymn_content', {
    p_content_type: type,
    p_content_key: key,
  })
}

export async function permanentlyDeleteHymnContent(
  type: HymnTrashType,
  key: string,
): Promise<void> {
  return callTrashRpc(`permanently delete this ${type}`, 'permanently_delete_hymn_content', {
    p_content_type: type,
    p_content_key: key,
  })
}

export async function reassignAndDeleteZemari(
  zemariId: string,
  targetZemariId: string,
): Promise<void> {
  return callTrashRpc('reassign these Mezmurs and permanently delete this Zemari', 'reassign_and_delete_zemari', {
    p_zemari_id: zemariId,
    p_target_zemari_id: targetZemariId,
  })
}
