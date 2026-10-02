/**
 * Favorites: guest → localStorage; signed-in → public.user_favorites only.
 * Legacy public.mezmur_favorites is not queried (migration complete).
 */
import { supabase } from '../supabase/client'
import {
  getGuestFavorites,
  isGuestFavorite,
  toggleGuestFavorite,
} from './guestStorage'
import type { FavoriteIdentity, FavoriteRecord, UserContentType } from './types'
import { favoriteKey } from './types'

function logErr(context: string, error: unknown) {
  if (!import.meta.env.DEV) return
  if (error && typeof error === 'object') {
    const e = error as { code?: string; message?: string; details?: string; hint?: string }
    console.error(`[favorites] ${context}`, {
      code: e.code,
      message: e.message,
      details: e.details,
      hint: e.hint,
    })
    return
  }
  console.error(`[favorites] ${context}`, error)
}

type FavoriteRow = {
  id: string
  user_id: string
  content_type: string
  content_id: string | null
  content_slug: string | null
  collection_slug: string | null
  title: string | null
  route: string | null
  created_at: string
}

function mapRow(row: FavoriteRow): FavoriteRecord {
  return {
    id: row.id,
    contentType: row.content_type as UserContentType,
    contentId: row.content_id,
    contentSlug: row.content_slug,
    collectionSlug: row.collection_slug,
    title: row.title,
    route: row.route,
    createdAt: row.created_at,
    source: 'remote',
  }
}

function db() {
  if (!supabase) throw new Error('Supabase is not configured.')
  return supabase
}

export async function isFavorited(
  userId: string | null | undefined,
  identity: FavoriteIdentity,
): Promise<{ favorited: boolean; source: 'local' | 'remote' | 'none'; error?: string }> {
  if (!userId) {
    return { favorited: isGuestFavorite(identity), source: 'local' }
  }
  try {
    let query = db()
      .from('user_favorites')
      .select('id')
      .eq('user_id', userId)
      .eq('content_type', identity.contentType)
      .limit(1)

    if (identity.contentId) {
      query = query.eq('content_id', identity.contentId)
    } else if (identity.contentSlug) {
      query = query.eq('content_slug', identity.contentSlug)
      if (identity.collectionSlug) query = query.eq('collection_slug', identity.collectionSlug)
    } else {
      return { favorited: false, source: 'none' }
    }

    const { data, error } = await query.maybeSingle()
    if (error) {
      logErr('isFavorited', error)
      throw error
    }
    return { favorited: !!data, source: 'remote' }
  } catch (error) {
    const message =
      error && typeof error === 'object' && 'message' in error
        ? String((error as { message?: unknown }).message)
        : 'Could not load favorites.'
    // Guest localStorage as soft fallback only — never hit mezmur_favorites.
    return { favorited: isGuestFavorite(identity), source: 'local', error: message }
  }
}

export async function toggleFavorite(
  userId: string | null | undefined,
  identity: FavoriteIdentity,
  currentlyFavorited: boolean,
): Promise<{ favorited: boolean; error?: string }> {
  if (!userId) {
    const favorited = toggleGuestFavorite(identity)
    return { favorited }
  }

  try {
    if (currentlyFavorited) {
      let del = db()
        .from('user_favorites')
        .delete()
        .eq('user_id', userId)
        .eq('content_type', identity.contentType)
      if (identity.contentId) del = del.eq('content_id', identity.contentId)
      else if (identity.contentSlug) {
        del = del.eq('content_slug', identity.contentSlug)
        if (identity.collectionSlug) del = del.eq('collection_slug', identity.collectionSlug)
      }
      const { error } = await del
      if (error) throw error
      return { favorited: false }
    }

    const { error } = await db().from('user_favorites').insert({
      user_id: userId,
      content_type: identity.contentType,
      content_id: identity.contentId || null,
      content_slug: identity.contentSlug || null,
      collection_slug: identity.collectionSlug || null,
      title: identity.title || null,
      route: identity.route || null,
    })
    if (error) throw error
    return { favorited: true }
  } catch (error) {
    logErr('toggleFavorite', error)
    const message =
      error && typeof error === 'object' && 'message' in error
        ? String((error as { message?: unknown }).message)
        : 'Could not update favorite.'
    return { favorited: currentlyFavorited, error: message }
  }
}

export async function listFavorites(
  userId: string | null | undefined,
): Promise<{ items: FavoriteRecord[]; error?: string }> {
  if (!userId) {
    return {
      items: getGuestFavorites().map((g) => ({
        id: favoriteKey(g),
        contentType: g.contentType,
        contentId: g.contentId || null,
        contentSlug: g.contentSlug || null,
        collectionSlug: g.collectionSlug || null,
        title: g.title || null,
        route: g.route || null,
        createdAt: g.createdAt || new Date().toISOString(),
        source: 'local' as const,
      })),
    }
  }

  try {
    const { data, error } = await db()
      .from('user_favorites')
      .select(
        'id,user_id,content_type,content_id,content_slug,collection_slug,title,route,created_at',
      )
      .eq('user_id', userId)
      .order('created_at', { ascending: false })
    if (error) throw error
    return { items: ((data || []) as FavoriteRow[]).map(mapRow) }
  } catch (error) {
    logErr('listFavorites', error)
    const message =
      error && typeof error === 'object' && 'message' in error
        ? String((error as { message?: unknown }).message)
        : 'Could not load favorites.'
    return { items: [], error: message }
  }
}

/** Merge device-only favorites into user_favorites after sign-in. */
export async function importGuestFavorites(userId: string): Promise<{ imported: number }> {
  const guests = getGuestFavorites()
  let imported = 0
  for (const item of guests) {
    const identity: FavoriteIdentity = {
      contentType: item.contentType,
      contentId: item.contentId || undefined,
      contentSlug: item.contentSlug || undefined,
      collectionSlug: item.collectionSlug || undefined,
      title: item.title || undefined,
      route: item.route || undefined,
    }
    const existing = await isFavorited(userId, identity)
    if (existing.favorited) continue
    const result = await toggleFavorite(userId, identity, false)
    if (result.favorited && !result.error) imported += 1
  }
  return { imported }
}
