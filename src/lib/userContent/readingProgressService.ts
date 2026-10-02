/**
 * Reading progress: guest → localStorage; signed-in → public.user_reading_progress.
 * Callers should debounce writes (see useReadingProgressTracker).
 */
import { supabase } from '../supabase/client'
import { getGuestProgress, upsertGuestProgress } from './guestStorage'
import type { ProgressIdentity, ReadingProgressRecord, UserContentType } from './types'
import { progressKey } from './types'

function logErr(context: string, error: unknown) {
  if (!import.meta.env.DEV) return
  if (error && typeof error === 'object') {
    const e = error as { code?: string; message?: string; details?: string; hint?: string }
    console.error(`[readingProgress] ${context}`, {
      code: e.code,
      message: e.message,
      details: e.details,
      hint: e.hint,
    })
    return
  }
  console.error(`[readingProgress] ${context}`, error)
}

type ProgressRow = {
  id: string
  user_id: string
  content_type: string
  content_id: string | null
  content_slug: string | null
  collection_slug: string | null
  section_slug: string | null
  title: string | null
  route: string | null
  position_percent: number | null
  scroll_offset: number | null
  updated_at: string
}

function mapRow(row: ProgressRow): ReadingProgressRecord {
  return {
    id: row.id,
    contentType: row.content_type as UserContentType,
    contentId: row.content_id,
    contentSlug: row.content_slug,
    collectionSlug: row.collection_slug,
    sectionSlug: row.section_slug,
    title: row.title,
    route: row.route,
    positionPercent: row.position_percent,
    scrollOffset: row.scroll_offset,
    updatedAt: row.updated_at,
    source: 'remote',
  }
}

function db() {
  if (!supabase) throw new Error('Supabase is not configured.')
  return supabase
}

export async function saveReadingProgress(
  userId: string | null | undefined,
  identity: ProgressIdentity,
): Promise<ReadingProgressRecord> {
  const local = upsertGuestProgress(identity)
  if (!userId || !supabase) return local

  try {
    // Prefer update-by-identity; insert if missing
    let existingQuery = db()
      .from('user_reading_progress')
      .select('id')
      .eq('user_id', userId)
      .eq('content_type', identity.contentType)
      .limit(1)

    if (identity.contentId) {
      existingQuery = existingQuery.eq('content_id', identity.contentId)
    } else if (identity.route) {
      existingQuery = existingQuery.eq('route', identity.route)
    } else if (identity.contentSlug) {
      existingQuery = existingQuery.eq('content_slug', identity.contentSlug)
    }

    const { data: existing, error: findError } = await existingQuery.maybeSingle()
    if (findError) throw findError

    const payload = {
      user_id: userId,
      content_type: identity.contentType,
      content_id: identity.contentId || null,
      content_slug: identity.contentSlug || null,
      collection_slug: identity.collectionSlug || null,
      section_slug: identity.sectionSlug || null,
      title: identity.title || null,
      route: identity.route || null,
      position_percent: identity.positionPercent ?? null,
      scroll_offset: identity.scrollOffset ?? null,
      updated_at: new Date().toISOString(),
    }

    if (existing?.id) {
      const { data, error } = await db()
        .from('user_reading_progress')
        .update(payload)
        .eq('id', existing.id)
        .select('*')
        .single()
      if (error) throw error
      return mapRow(data as ProgressRow)
    }

    const { data, error } = await db()
      .from('user_reading_progress')
      .insert(payload)
      .select('*')
      .single()
    if (error) throw error
    return mapRow(data as ProgressRow)
  } catch (error) {
    logErr('saveReadingProgress', error)
    return local
  }
}

export async function listReadingProgress(
  userId: string | null | undefined,
  limit = 8,
): Promise<{ items: ReadingProgressRecord[]; error?: string }> {
  const local = getGuestProgress()
  if (!userId || !supabase) {
    return { items: local.slice(0, limit) }
  }
  try {
    const { data, error } = await db()
      .from('user_reading_progress')
      .select('*')
      .eq('user_id', userId)
      .order('updated_at', { ascending: false })
      .limit(limit)
    if (error) throw error
    const remote = ((data || []) as ProgressRow[]).map(mapRow)
    const remoteKeys = new Set(remote.map((item) => progressKey(item)))
    const localOnly = local.filter((item) => !remoteKeys.has(progressKey(item)))
    return {
      items: [...remote, ...localOnly]
        .sort((a, b) => b.updatedAt.localeCompare(a.updatedAt))
        .slice(0, limit),
    }
  } catch (error) {
    logErr('listReadingProgress', error)
    const message =
      error && typeof error === 'object' && 'message' in error
        ? String((error as { message?: unknown }).message)
        : 'Could not load reading progress.'
    return { items: local.slice(0, limit), error: message }
  }
}

export async function importGuestProgress(userId: string): Promise<{ imported: number }> {
  const guests = getGuestProgress()
  let imported = 0
  for (const item of guests) {
    await saveReadingProgress(userId, item)
    imported += 1
  }
  return { imported }
}
