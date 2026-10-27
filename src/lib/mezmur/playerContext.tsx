/**
 * TEWAHEDODAILY — UNIVERSAL MEZMUR PLAYER CONTEXT
 *
 * Provides continuous background audio across route transitions, queue management,
 * playlist sequencing, seek/volume/speed controls, and lock-screen Media Session APIs.
 */

import {
  createContext,
  useCallback,
  useContext,
  useEffect,
  useRef,
  useState,
  type ReactNode,
} from 'react'
import type { PlayableHymn } from './playlistService'

export interface PlayerContextValue {
  currentTrack: PlayableHymn | null
  isPlaying: boolean
  currentTime: number
  duration: number
  volume: number
  isMuted: boolean
  playbackSpeed: number
  queue: PlayableHymn[]
  queueIndex: number
  repeatMode: 'none' | 'all' | 'one'
  play: (track: PlayableHymn, queue?: PlayableHymn[]) => void
  pause: () => void
  resume: () => void
  togglePlay: () => void
  seek: (seconds: number) => void
  next: () => void
  previous: () => void
  setVolume: (volume: number) => void
  toggleMute: () => void
  setSpeed: (speed: number) => void
  enqueue: (track: PlayableHymn) => void
  removeFromQueue: (index: number) => void
  clearQueue: () => void
  setRepeatMode: (mode: 'none' | 'all' | 'one') => void
}

const PlayerContext = createContext<PlayerContextValue | null>(null)

export function PlayerProvider({ children }: { children: ReactNode }) {
  const [currentTrack, setCurrentTrack] = useState<PlayableHymn | null>(null)
  const [isPlaying, setIsPlaying] = useState(false)
  const [currentTime, setCurrentTime] = useState(0)
  const [duration, setDuration] = useState(0)
  const [volume, setVolumeState] = useState(1)
  const [isMuted, setIsMuted] = useState(false)
  const [playbackSpeed, setPlaybackSpeed] = useState(1)
  const [queue, setQueue] = useState<PlayableHymn[]>([])
  const [queueIndex, setQueueIndex] = useState(0)
  const [repeatMode, setRepeatMode] = useState<'none' | 'all' | 'one'>('none')

  const audioRef = useRef<HTMLAudioElement | null>(null)

  // Initialize audio element once
  useEffect(() => {
    const audio = new Audio()
    audio.preload = 'metadata'
    audioRef.current = audio

    const onTimeUpdate = () => setCurrentTime(audio.currentTime)
    const onLoadedMetadata = () => setDuration(audio.duration || 0)
    const onPlay = () => setIsPlaying(true)
    const onPause = () => setIsPlaying(false)
    const onEnded = () => {
      // Handle repeat mode and queue progression
      if (repeatMode === 'one') {
        audio.currentTime = 0
        audio.play().catch(() => {})
      } else {
        handleTrackEnd()
      }
    }

    audio.addEventListener('timeupdate', onTimeUpdate)
    audio.addEventListener('loadedmetadata', onLoadedMetadata)
    audio.addEventListener('play', onPlay)
    audio.addEventListener('pause', onPause)
    audio.addEventListener('ended', onEnded)

    return () => {
      audio.pause()
      audio.removeEventListener('timeupdate', onTimeUpdate)
      audio.removeEventListener('loadedmetadata', onLoadedMetadata)
      audio.removeEventListener('play', onPlay)
      audio.removeEventListener('pause', onPause)
      audio.removeEventListener('ended', onEnded)
    }
  }, [repeatMode])

  const handleTrackEnd = useCallback(() => {
    if (queue.length > 0 && queueIndex < queue.length - 1) {
      const nextIdx = queueIndex + 1
      const nextTrack = queue[nextIdx]
      setQueueIndex(nextIdx)
      playTrack(nextTrack)
    } else if (repeatMode === 'all' && queue.length > 0) {
      setQueueIndex(0)
      playTrack(queue[0])
    } else {
      setIsPlaying(false)
    }
  }, [queue, queueIndex, repeatMode])

  const playTrack = useCallback((track: PlayableHymn) => {
    setCurrentTrack(track)
    if (!audioRef.current) return

    const audio = audioRef.current
    if (track.audioUrl) {
      audio.src = track.audioUrl
      audio.playbackRate = playbackSpeed
      audio.volume = isMuted ? 0 : volume
      audio.play().catch((err) => {
        if (import.meta.env.DEV) console.warn('[PlayerContext] Autoplay prevented:', err)
      })
    } else {
      audio.pause()
      audio.src = ''
    }

    // Media Session API for lock screen and native controls
    if ('mediaSession' in navigator && track) {
      try {
        navigator.mediaSession.metadata = new MediaMetadata({
          title: track.title,
          artist: track.singerName || 'TewahedoDaily Zemari',
          album: 'Ethiopian Orthodox Mezmur',
          artwork: track.thumbnailUrl
            ? [
                { src: track.thumbnailUrl, sizes: '96x96', type: 'image/jpeg' },
                { src: track.thumbnailUrl, sizes: '128x128', type: 'image/jpeg' },
                { src: track.thumbnailUrl, sizes: '256x256', type: 'image/jpeg' },
              ]
            : [],
        })

        navigator.mediaSession.setActionHandler('play', () => audio.play())
        navigator.mediaSession.setActionHandler('pause', () => audio.pause())
        navigator.mediaSession.setActionHandler('seekto', (details) => {
          if (details.seekTime !== undefined && Number.isFinite(details.seekTime)) {
            audio.currentTime = details.seekTime
          }
        })
      } catch {}
    }
  }, [playbackSpeed, isMuted, volume])

  const play = useCallback((track: PlayableHymn, newQueue?: PlayableHymn[]) => {
    if (newQueue && newQueue.length > 0) {
      setQueue(newQueue)
      const foundIdx = newQueue.findIndex((t) => t.id === track.id || t.slug === track.slug)
      setQueueIndex(foundIdx >= 0 ? foundIdx : 0)
    } else {
      setQueue([track])
      setQueueIndex(0)
    }
    playTrack(track)
  }, [playTrack])

  const pause = useCallback(() => {
    audioRef.current?.pause()
  }, [])

  const resume = useCallback(() => {
    audioRef.current?.play().catch(() => {})
  }, [])

  const togglePlay = useCallback(() => {
    if (!audioRef.current) return
    if (isPlaying) {
      audioRef.current.pause()
    } else {
      audioRef.current.play().catch(() => {})
    }
  }, [isPlaying])

  const seek = useCallback((seconds: number) => {
    if (!audioRef.current) return
    audioRef.current.currentTime = Math.max(0, Math.min(seconds, duration))
  }, [duration])

  const next = useCallback(() => {
    if (queue.length > 0 && queueIndex < queue.length - 1) {
      const nextIdx = queueIndex + 1
      setQueueIndex(nextIdx)
      playTrack(queue[nextIdx])
    } else if (repeatMode === 'all' && queue.length > 0) {
      setQueueIndex(0)
      playTrack(queue[0])
    }
  }, [queue, queueIndex, repeatMode, playTrack])

  const previous = useCallback(() => {
    if (audioRef.current && audioRef.current.currentTime > 3) {
      audioRef.current.currentTime = 0
    } else if (queue.length > 0 && queueIndex > 0) {
      const prevIdx = queueIndex - 1
      setQueueIndex(prevIdx)
      playTrack(queue[prevIdx])
    }
  }, [queue, queueIndex, playTrack])

  const setVolume = useCallback((val: number) => {
    const clamped = Math.max(0, Math.min(1, val))
    setVolumeState(clamped)
    if (audioRef.current) {
      audioRef.current.volume = isMuted ? 0 : clamped
    }
  }, [isMuted])

  const toggleMute = useCallback(() => {
    setIsMuted((prev) => {
      const nextMuted = !prev
      if (audioRef.current) {
        audioRef.current.volume = nextMuted ? 0 : volume
      }
      return nextMuted
    })
  }, [volume])

  const setSpeed = useCallback((speed: number) => {
    setPlaybackSpeed(speed)
    if (audioRef.current) {
      audioRef.current.playbackRate = speed
    }
  }, [])

  const enqueue = useCallback((track: PlayableHymn) => {
    setQueue((prev) => [...prev, track])
  }, [])

  const removeFromQueue = useCallback((index: number) => {
    setQueue((prev) => prev.filter((_, i) => i !== index))
  }, [])

  const clearQueue = useCallback(() => {
    setQueue([])
  }, [])

  const value: PlayerContextValue = {
    currentTrack,
    isPlaying,
    currentTime,
    duration,
    volume,
    isMuted,
    playbackSpeed,
    queue,
    queueIndex,
    repeatMode,
    play,
    pause,
    resume,
    togglePlay,
    seek,
    next,
    previous,
    setVolume,
    toggleMute,
    setSpeed,
    enqueue,
    removeFromQueue,
    clearQueue,
    setRepeatMode,
  }

  return <PlayerContext.Provider value={value}>{children}</PlayerContext.Provider>
}

export function usePlayer(): PlayerContextValue {
  const ctx = useContext(PlayerContext)
  if (!ctx) {
    throw new Error('usePlayer must be used within a PlayerProvider')
  }
  return ctx
}
