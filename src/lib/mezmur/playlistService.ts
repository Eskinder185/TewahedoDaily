/**
 * TEWAHEDODAILY — PLAYLIST & FAVORITES SERVICE
 *
 * Manages user favorites and custom spiritual playlists.
 * Stores in localStorage for guest listeners and synchronizes with Supabase for authenticated users.
 */

import { supabase } from '../supabase/client'

export interface PlayableHymn {
  id: string
  slug: string
  title: string
  titleAmharic?: string | null
  singerName?: string | null
  audioUrl?: string | null
  youtubeUrl?: string | null
  thumbnailUrl?: string | null
  category?: string | null
  occasion?: string | null
}

export interface Playlist {
  id: string
  name: string
  description?: string
  createdAt: string
  updatedAt: string
  hymns: PlayableHymn[]
}

const STORAGE_KEY_PLAYLISTS = 'tewahedo_playlists_v1'
const STORAGE_KEY_FAVORITES = 'tewahedo_mezmur_favorites_v1'
const EVENT_PLAYLIST_CHANGE = 'td-playlists-updated'
const EVENT_FAVORITES_CHANGE = 'td-favorites-updated'

function getLocalPlaylists(): Playlist[] {
  try {
    const raw = localStorage.getItem(STORAGE_KEY_PLAYLISTS)
    if (!raw) return []
    const parsed = JSON.parse(raw)
    return Array.isArray(parsed) ? parsed : []
  } catch {
    return []
  }
}

function saveLocalPlaylists(playlists: Playlist[]): void {
  try {
    localStorage.setItem(STORAGE_KEY_PLAYLISTS, JSON.stringify(playlists))
    window.dispatchEvent(new CustomEvent(EVENT_PLAYLIST_CHANGE, { detail: playlists }))
  } catch {}
}

function getLocalFavorites(): PlayableHymn[] {
  try {
    const raw = localStorage.getItem(STORAGE_KEY_FAVORITES)
    if (!raw) return []
    const parsed = JSON.parse(raw)
    return Array.isArray(parsed) ? parsed : []
  } catch {
    return []
  }
}

function saveLocalFavorites(favs: PlayableHymn[]): void {
  try {
    localStorage.setItem(STORAGE_KEY_FAVORITES, JSON.stringify(favs))
    window.dispatchEvent(new CustomEvent(EVENT_FAVORITES_CHANGE, { detail: favs }))
  } catch {}
}

export const playlistService = {
  getFavorites(): PlayableHymn[] {
    return getLocalFavorites()
  },

  isFavorite(idOrSlug: string): boolean {
    const favs = getLocalFavorites()
    return favs.some((h) => h.id === idOrSlug || h.slug === idOrSlug)
  },

  async toggleFavorite(hymn: PlayableHymn): Promise<boolean> {
    const favs = getLocalFavorites()
    const index = favs.findIndex((h) => h.id === hymn.id || h.slug === hymn.slug)
    let isNowFavorite = false

    if (index >= 0) {
      favs.splice(index, 1)
      isNowFavorite = false
    } else {
      favs.unshift(hymn)
      isNowFavorite = true
    }

    saveLocalFavorites(favs)

    // Attempt remote synchronization if logged in
    try {
      const sb = supabase
      if (sb) {
        const { data: { session } } = await sb.auth.getSession()
        if (session?.user) {
          if (isNowFavorite) {
            await sb.from('user_favorites').insert({
              user_id: session.user.id,
              content_type: 'mezmur',
              content_id: hymn.id,
              content_slug: hymn.slug,
              title: hymn.title,
              route: `/practice/mezmur/${hymn.slug}`,
            })
          } else {
            await sb
              .from('user_favorites')
              .delete()
              .match({ user_id: session.user.id, content_type: 'mezmur', content_slug: hymn.slug })
          }
        }
      }
    } catch {
      // Remote sync failure does not break local favorites
    }

    return isNowFavorite
  },

  getPlaylists(): Playlist[] {
    return getLocalPlaylists()
  },

  getPlaylist(id: string): Playlist | null {
    const lists = getLocalPlaylists()
    return lists.find((p) => p.id === id) || null
  },

  createPlaylist(name: string, description?: string): Playlist {
    const trimmed = name.trim() || 'My Mezmur Playlist'
    const newPlaylist: Playlist = {
      id: 'pl_' + Date.now() + '_' + Math.random().toString(36).substring(2, 7),
      name: trimmed,
      description: description?.trim() || '',
      createdAt: new Date().toISOString(),
      updatedAt: new Date().toISOString(),
      hymns: [],
    }

    const lists = getLocalPlaylists()
    lists.unshift(newPlaylist)
    saveLocalPlaylists(lists)
    return newPlaylist
  },

  renamePlaylist(playlistId: string, newName: string): boolean {
    const lists = getLocalPlaylists()
    const p = lists.find((item) => item.id === playlistId)
    if (!p) return false

    p.name = newName.trim() || p.name
    p.updatedAt = new Date().toISOString()
    saveLocalPlaylists(lists)
    return true
  },

  deletePlaylist(playlistId: string): boolean {
    let lists = getLocalPlaylists()
    const initialLen = lists.length
    lists = lists.filter((item) => item.id !== playlistId)
    if (lists.length === initialLen) return false

    saveLocalPlaylists(lists)
    return true
  },

  addToPlaylist(playlistId: string, hymn: PlayableHymn): boolean {
    const lists = getLocalPlaylists()
    const p = lists.find((item) => item.id === playlistId)
    if (!p) return false

    const exists = p.hymns.some((h) => h.id === hymn.id || h.slug === hymn.slug)
    if (exists) return false

    p.hymns.push(hymn)
    p.updatedAt = new Date().toISOString()
    saveLocalPlaylists(lists)
    return true
  },

  removeFromPlaylist(playlistId: string, hymnIdOrSlug: string): boolean {
    const lists = getLocalPlaylists()
    const p = lists.find((item) => item.id === playlistId)
    if (!p) return false

    const initialLen = p.hymns.length
    p.hymns = p.hymns.filter((h) => h.id !== hymnIdOrSlug && h.slug !== hymnIdOrSlug)
    if (p.hymns.length === initialLen) return false

    p.updatedAt = new Date().toISOString()
    saveLocalPlaylists(lists)
    return true
  },

  reorderPlaylist(playlistId: string, newHymnOrder: string[]): boolean {
    const lists = getLocalPlaylists()
    const p = lists.find((item) => item.id === playlistId)
    if (!p) return false

    const hymnMap = new Map(p.hymns.map((h) => [h.id, h]))
    const reordered: PlayableHymn[] = []

    for (const id of newHymnOrder) {
      const hymn = hymnMap.get(id)
      if (hymn) {
        reordered.push(hymn)
        hymnMap.delete(id)
      }
    }

    // Append any remaining
    for (const h of hymnMap.values()) {
      reordered.push(h)
    }

    p.hymns = reordered
    p.updatedAt = new Date().toISOString()
    saveLocalPlaylists(lists)
    return true
  },
}
