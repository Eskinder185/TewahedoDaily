/* eslint-disable react-refresh/only-export-components */
import { createContext, useCallback, useContext, useEffect, useMemo, useRef, useState, type ReactNode } from 'react'
import { publicMedia } from '../publicContent/service'
import { useLocation, useNavigate } from 'react-router-dom'
import type { PlayableHymn } from './playlistService'
import { moveQueueItem, playableQueue, sameTrack, shuffledAfterCurrent, shuffledCycle } from './playerQueue'

export type RepeatMode = 'none' | 'all' | 'one'
export type SleepTimerOption = 15 | 30 | 45 | 60 | 'end' | null
export interface QueueContext {
  key: string
  label: string
  href?: string
  loadMore?: () => Promise<PlayableHymn[]>
}

export interface PlayerContextValue {
  currentTrack: PlayableHymn | null; isPlaying: boolean; currentTime: number; duration: number
  volume: number; isMuted: boolean; playbackSpeed: number; queue: PlayableHymn[]; queueIndex: number
  history: PlayableHymn[]; queueContext: QueueContext | null; repeatMode: RepeatMode; shuffle: boolean
  autoplayNext: boolean; error: string; sleepTimer: SleepTimerOption; sleepEndsAt: number | null
  play: (track: PlayableHymn, queue?: PlayableHymn[], context?: QueueContext) => void
  pause: () => void; resume: () => void; retry: () => void; togglePlay: () => void
  seek: (seconds: number) => void; next: () => void; previous: () => void
  setVolume: (volume: number) => void; toggleMute: () => void; setSpeed: (speed: number) => void
  enqueue: (track: PlayableHymn) => void; playNext: (track: PlayableHymn) => void
  selectQueueItem: (index: number) => void; moveQueueItem: (from: number, to: number) => void
  removeFromQueue: (index: number) => void; clearQueue: () => void
  setRepeatMode: (mode: RepeatMode) => void; toggleShuffle: () => void
  setAutoplayNext: (enabled: boolean) => void; setSleepTimer: (option: SleepTimerOption) => void
}

interface StoredPlayer {
  track: PlayableHymn | null; queue: PlayableHymn[]; queueIndex: number; currentTime: number
  volume: number; playbackSpeed: number; repeatMode: RepeatMode; shuffle: boolean
  autoplayNext: boolean; queueContext: QueueContext | null
}
const STORAGE_KEY = 'tewahedo:mezmur-player:v2'
const PlayerContext = createContext<PlayerContextValue | null>(null)
function readStoredPlayer(): StoredPlayer | null {
  try { const value = localStorage.getItem(STORAGE_KEY); return value ? JSON.parse(value) as StoredPlayer : null } catch { return null }
}

export function PlayerProvider({ children }: { children: ReactNode }) {
  const navigate = useNavigate()
  const location = useLocation()
  const initial = useRef(readStoredPlayer()).current
  const [currentTrack, setCurrentTrack] = useState<PlayableHymn | null>(initial?.track ?? null)
  const [isPlaying, setIsPlaying] = useState(false)
  const [currentTime, setCurrentTime] = useState(initial?.currentTime ?? 0)
  const [duration, setDuration] = useState(0)
  const [volume, setVolumeState] = useState(initial?.volume ?? 1)
  const [isMuted, setIsMuted] = useState(false)
  const [playbackSpeed, setPlaybackSpeed] = useState(initial?.playbackSpeed ?? 1)
  const [queue, setQueue] = useState<PlayableHymn[]>(initial?.queue ?? [])
  const [queueIndex, setQueueIndex] = useState(initial?.queueIndex ?? 0)
  const [history, setHistory] = useState<PlayableHymn[]>([])
  const [queueContext, setQueueContext] = useState<QueueContext | null>(initial?.queueContext ?? null)
  const [repeatMode, setRepeatMode] = useState<RepeatMode>(initial?.repeatMode ?? 'none')
  const [shuffle, setShuffle] = useState(initial?.shuffle ?? false)
  const [autoplayNext, setAutoplayNext] = useState(initial?.autoplayNext ?? true)
  const [error, setError] = useState('')
  const [sleepTimer, setSleepTimerState] = useState<SleepTimerOption>(null)
  const [sleepEndsAt, setSleepEndsAt] = useState<number | null>(null)
  const audioRef = useRef<HTMLAudioElement | null>(null)
  const generationRef = useRef(0)
  const sleepTimeoutRef = useRef<number | null>(null)
  const queueLoaderRef = useRef<QueueContext['loadMore']>(undefined)
  const loadingMoreRef = useRef(false)
  const stateRef = useRef({ currentTrack, queue, queueIndex, repeatMode, shuffle, autoplayNext, sleepTimer })
  stateRef.current = { currentTrack, queue, queueIndex, repeatMode, shuffle, autoplayNext, sleepTimer }

  const persist = useCallback(() => {
    const state = stateRef.current
    const snapshot: StoredPlayer = { track: state.currentTrack, queue: state.queue, queueIndex: state.queueIndex,
      currentTime: audioRef.current?.currentTime ?? 0, volume, playbackSpeed, repeatMode: state.repeatMode,
      shuffle: state.shuffle, autoplayNext: state.autoplayNext, queueContext }
    try { localStorage.setItem(STORAGE_KEY, JSON.stringify(snapshot)) } catch { /* Storage can be unavailable in private browsing. */ }
  }, [playbackSpeed, queueContext, volume])

  const loadTrack = useCallback(async (track: PlayableHymn, shouldPlay = true, resumeAt = 0) => {
    const audio = audioRef.current
    if (!audio) return
    const request = ++generationRef.current
    setError(''); setCurrentTrack(track); setCurrentTime(resumeAt)
    try {
      if (!track.audioUrl?.trim()) throw new Error('No audio is available for this Mezmur.')
      const source = await publicMedia(track.audioUrl)
      if (request !== generationRef.current) return
      audio.src = source; audio.load()
      if (resumeAt > 0) audio.addEventListener('loadedmetadata', () => { audio.currentTime = Math.min(resumeAt, Number.isFinite(audio.duration) ? audio.duration : resumeAt) }, { once: true })
      if (shouldPlay) await audio.play()
    } catch (reason) {
      if (request !== generationRef.current) return
      audio.pause(); setIsPlaying(false)
      setError(reason instanceof Error && reason.message ? reason.message : 'Audio could not load. Please retry or choose another Mezmur.')
    }
  }, [])

  const playIndex = useCallback((index: number, suppliedQueue?: PlayableHymn[], navigation: 'none' | 'push' | 'replace' = 'none') => {
    const activeQueue = suppliedQueue ?? stateRef.current.queue
    const track = activeQueue[index]
    if (!track) return
    const previous = stateRef.current.currentTrack
    if (previous && !sameTrack(previous, track)) setHistory((items) => [previous, ...items.filter((item) => !sameTrack(item, previous))].slice(0, 20))
    setQueueIndex(index); void loadTrack(track)
    if (navigation !== 'none') {
      const target = `/hymns/mezmur/${track.slug}`
      if (location.pathname !== target) navigate(target, { replace: navigation === 'replace' })
    }
  }, [loadTrack, location.pathname, navigate])

  const advance = useCallback(async (automatic = false) => {
    const state = stateRef.current
    const audio = audioRef.current
    if (automatic && state.sleepTimer === 'end') {
      setSleepTimerState(null)
      setSleepEndsAt(null)
      setAutoplayNext(false)
      setIsPlaying(false)
      return
    }
    if (automatic && !state.autoplayNext) { setIsPlaying(false); return }
    if (state.repeatMode === 'one' && automatic && audio) { audio.currentTime = 0; void audio.play(); return }
    if (state.queueIndex < state.queue.length - 1) { playIndex(state.queueIndex + 1, undefined, automatic ? 'replace' : 'push'); return }
    if (queueLoaderRef.current && !loadingMoreRef.current) {
      loadingMoreRef.current = true
      try {
        const loaded = await queueLoaderRef.current()
        const expanded = playableQueue([...state.queue, ...loaded])
        if (expanded.length > state.queue.length) {
          setQueue(expanded)
          playIndex(state.queueIndex + 1, expanded, automatic ? 'replace' : 'push')
          return
        }
      } finally {
        loadingMoreRef.current = false
      }
    }
    if (state.repeatMode === 'all' && state.queue.length) {
      if (state.shuffle) { const cycle = shuffledCycle(state.queue, state.currentTrack); setQueue(cycle); playIndex(0, cycle) }
      else playIndex(0)
      return
    }
    setIsPlaying(false)
  }, [playIndex])

  useEffect(() => {
    const audio = new Audio(); audio.preload = 'metadata'; audio.volume = volume; audio.playbackRate = playbackSpeed
    audio.preservesPitch = true
    audioRef.current = audio
    const onTime = () => setCurrentTime(audio.currentTime)
    const onDuration = () => setDuration(Number.isFinite(audio.duration) ? audio.duration : 0)
    const onPlay = () => { setIsPlaying(true); setError(''); window.dispatchEvent(new Event(AUDIO_PLAY_EVENT)) }
    const onPause = () => setIsPlaying(false)
    const onEnded = () => advance(true)
    const onError = () => setError('This recording is unavailable. Try another Mezmur or retry later.')
    audio.addEventListener('timeupdate', onTime); audio.addEventListener('durationchange', onDuration)
    audio.addEventListener('play', onPlay); audio.addEventListener('pause', onPause)
    audio.addEventListener('ended', onEnded); audio.addEventListener('error', onError)
    if (initial?.track) void loadTrack(initial.track, false, initial.currentTime)
    return () => { audio.pause(); persist(); audioRef.current = null }
    // The app owns exactly one audio element for its entire lifetime.
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [])

  useEffect(() => {
    const interval = window.setInterval(persist, 5000)
    window.addEventListener('pagehide', persist)
    return () => { window.clearInterval(interval); window.removeEventListener('pagehide', persist) }
  }, [persist])

  useEffect(() => {
    if (!('mediaSession' in navigator) || !currentTrack) return
    navigator.mediaSession.metadata = new MediaMetadata({ title: currentTrack.titleAmharic || currentTrack.title,
      artist: currentTrack.singerName || 'TewahedoDaily Zemari', album: 'Ethiopian Orthodox Mezmur',
      artwork: currentTrack.thumbnailUrl ? [{ src: currentTrack.thumbnailUrl }] : [] })
    const audio = audioRef.current
    navigator.mediaSession.setActionHandler('play', () => { if (audio) void audio.play() })
    navigator.mediaSession.setActionHandler('pause', () => audio?.pause())
    navigator.mediaSession.setActionHandler('nexttrack', () => advance(false))
    navigator.mediaSession.setActionHandler('previoustrack', () => { if (audio && audio.currentTime > 3) audio.currentTime = 0; else playIndex(Math.max(0, stateRef.current.queueIndex - 1)) })
    navigator.mediaSession.setActionHandler('seekto', ({ seekTime }) => { if (audio && seekTime != null) audio.currentTime = seekTime })
  }, [advance, currentTrack, playIndex])

  const play = useCallback((track: PlayableHymn, candidates: PlayableHymn[] = [track], context?: QueueContext) => {
    let nextQueue = playableQueue(candidates)
    if (!nextQueue.some((item) => sameTrack(item, track)) && track.audioUrl) nextQueue.unshift(track)
    if (shuffle) nextQueue = shuffledAfterCurrent(nextQueue, track)
    const index = Math.max(0, nextQueue.findIndex((item) => sameTrack(item, track)))
    setQueue(nextQueue); setQueueIndex(index)
    if (context) { setQueueContext(context); queueLoaderRef.current = context.loadMore }
    playIndex(index, nextQueue)
  }, [playIndex, shuffle])
  const pause = useCallback(() => audioRef.current?.pause(), [])
  const resume = useCallback(() => { if (audioRef.current) void audioRef.current.play().catch(() => setError('Press play again to start listening.')) }, [])
  const retry = useCallback(() => { if (currentTrack) void loadTrack(currentTrack, true, currentTime) }, [currentTime, currentTrack, loadTrack])
  const togglePlay = useCallback(() => { if (audioRef.current?.paused) resume(); else pause() }, [pause, resume])
  const seek = useCallback((seconds: number) => { if (audioRef.current) audioRef.current.currentTime = Math.max(0, Math.min(seconds, duration || seconds)) }, [duration])
  const next = useCallback(() => { void advance(false) }, [advance])
  const previous = useCallback(() => { const audio = audioRef.current; if (audio && audio.currentTime > 3) audio.currentTime = 0; else playIndex(Math.max(0, stateRef.current.queueIndex - 1)) }, [playIndex])
  const setVolume = useCallback((value: number) => { const safe = Math.max(0, Math.min(1, value)); setVolumeState(safe); if (audioRef.current) audioRef.current.volume = isMuted ? 0 : safe }, [isMuted])
  const toggleMute = useCallback(() => setIsMuted((muted) => { const next = !muted; if (audioRef.current) audioRef.current.volume = next ? 0 : volume; return next }), [volume])
  const setSpeed = useCallback((speed: number) => { const safe = [0.75, 1, 1.25, 1.5, 2].includes(speed) ? speed : 1; setPlaybackSpeed(safe); if (audioRef.current) audioRef.current.playbackRate = safe }, [])
  const enqueue = useCallback((track: PlayableHymn) => setQueue((items) => playableQueue([...items, track])), [])
  const playNext = useCallback((track: PlayableHymn) => setQueue((items) => { const next = items.filter((item) => !sameTrack(item, track)); next.splice(stateRef.current.queueIndex + 1, 0, track); return playableQueue(next) }), [])
  const selectQueueItem = useCallback((index: number) => playIndex(index, undefined, 'push'), [playIndex])
  const reorderQueue = useCallback((from: number, to: number) => setQueue((items) => { const next = moveQueueItem(items, from, to); setQueueIndex(Math.max(0, next.findIndex((item) => sameTrack(item, stateRef.current.currentTrack)))); return next }), [])
  const removeFromQueue = useCallback((index: number) => setQueue((items) => { if (index === stateRef.current.queueIndex) return items; const next = items.filter((_, position) => position !== index); if (index < stateRef.current.queueIndex) setQueueIndex((value) => value - 1); return next }), [])
  const clearQueue = useCallback(() => { generationRef.current++; audioRef.current?.pause(); if (audioRef.current) audioRef.current.src = ''; setCurrentTrack(null); setQueue([]); setHistory([]); setQueueIndex(0); setError(''); localStorage.removeItem(STORAGE_KEY) }, [])
  const toggleShuffle = useCallback(() => setShuffle((enabled) => { if (!enabled && stateRef.current.currentTrack) { const next = shuffledAfterCurrent(stateRef.current.queue, stateRef.current.currentTrack); setQueue(next); setQueueIndex(0) }; return !enabled }), [])
  const setSleepTimer = useCallback((option: SleepTimerOption) => {
    if (sleepTimeoutRef.current) window.clearTimeout(sleepTimeoutRef.current)
    sleepTimeoutRef.current = null; setSleepTimerState(option); setSleepEndsAt(typeof option === 'number' ? Date.now() + option * 60_000 : null)
    if (typeof option === 'number') sleepTimeoutRef.current = window.setTimeout(() => { audioRef.current?.pause(); setAutoplayNext(false); setSleepTimerState(null); setSleepEndsAt(null) }, option * 60_000)
  }, [])
  useEffect(() => () => { if (sleepTimeoutRef.current) window.clearTimeout(sleepTimeoutRef.current) }, [])
  useEffect(() => { if (sleepTimer === 'end' && !isPlaying) { setSleepTimerState(null); setSleepEndsAt(null) } }, [isPlaying, sleepTimer])

  const value = useMemo<PlayerContextValue>(() => ({ currentTrack, isPlaying, currentTime, duration, volume, isMuted,
    playbackSpeed, queue, queueIndex, history, queueContext, repeatMode, shuffle, autoplayNext, error, sleepTimer,
    sleepEndsAt, play, pause, resume, retry, togglePlay, seek, next, previous, setVolume, toggleMute, setSpeed,
    enqueue, playNext, selectQueueItem, moveQueueItem: reorderQueue, removeFromQueue, clearQueue, setRepeatMode,
    toggleShuffle, setAutoplayNext, setSleepTimer }), [autoplayNext, clearQueue, currentTime, currentTrack, duration,
    enqueue, error, history, isMuted, isPlaying, next, pause, play, playNext, playbackSpeed, previous, queue,
    queueContext, queueIndex, removeFromQueue, reorderQueue, repeatMode, resume, retry, seek, selectQueueItem,
    setSleepTimer, setSpeed, setVolume, shuffle, sleepEndsAt, sleepTimer, toggleMute, togglePlay, toggleShuffle, volume])
  return <PlayerContext.Provider value={value}>{children}</PlayerContext.Provider>
}

/** The player when one is mounted (null outside PlayerProvider). */
export function useOptionalPlayer(): PlayerContextValue | null {
  return useContext(PlayerContext)
}

/** Fired when the persistent audio player starts, so an embedded video can pause. */
export const AUDIO_PLAY_EVENT = 'tewahedo:mezmur-audio-play'

export function usePlayer(): PlayerContextValue {
  const context = useContext(PlayerContext)
  if (!context) throw new Error('usePlayer must be used within a PlayerProvider')
  return context
}
