import { useEffect, useMemo, useRef, type ReactNode } from 'react'
import { useLocation } from 'react-router-dom'
import { usePlayer, type QueueContext } from '../../lib/mezmur/playerContext'
import type { PlayableHymn } from '../../lib/mezmur/playlistService'
import { AudioContext } from '../../lib/publicContent/audio'
import { discover, type MezmurCard } from '../../lib/publicContent/service'

function toPlayable(item: MezmurCard): PlayableHymn {
  return {
    id: item.id,
    slug: item.slug,
    title: item.title,
    titleAmharic: item.title_amharic,
    singerName: item.singer_name,
    audioUrl: item.audio_url,
    youtubeUrl: item.youtube_url,
    thumbnailUrl: item.thumbnail_url,
    category: item.category_name || item.category,
    occasion: item.occasion,
  }
}

function contextFor(pathname: string, search: string, loadMore: QueueContext['loadMore']): QueueContext {
  const base = { key: `${pathname}${search}`, href: `${pathname}${search}`, loadMore }
  if (pathname.includes('/favorites')) return { ...base, key: 'favorites', label: 'Favorites' }
  if (pathname.includes('/zemari/')) return { ...base, label: 'Zemari' }
  if (pathname.includes('/occasion/')) return { ...base, label: 'Occasion' }
  if (pathname.includes('/category/')) return { ...base, label: 'Category' }
  if (search.includes('q=')) return { ...base, label: 'Search results' }
  return { ...base, label: 'Mezmur Library' }
}

/** Public-card compatibility provider. PlayerProvider owns the app's only audio element. */
export function GlobalAudio({ children }: { children: ReactNode }) {
  const player = usePlayer()
  const location = useLocation()
  const nextPage = useRef(2)
  useEffect(() => {
    const params = new URLSearchParams(location.search)
    nextPage.current = Math.max(1, Number(params.get('page')) || 1) + 1
  }, [location.pathname, location.search])
  const value = useMemo(() => ({
    play(track: MezmurCard, playlist: MezmurCard[] = [track]) {
      const loadMore = location.pathname === '/hymns' || location.pathname === '/practice'
        ? async () => {
            const params = new URLSearchParams(location.search)
            params.set('page', String(nextPage.current++))
            const result = await discover(params)
            return result.items.map(toPlayable)
          }
        : undefined
      player.play(toPlayable(track), playlist.map(toPlayable), contextFor(location.pathname, location.search, loadMore))
    },
    stop: player.clearQueue,
  }), [location.pathname, location.search, player])
  return <AudioContext.Provider value={value}>{children}</AudioContext.Provider>
}
