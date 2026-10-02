import {
  useCallback,
  useEffect,
  useLayoutEffect,
  useMemo,
  useRef,
  useState,
  type ReactNode,
} from 'react'
import { ensureYoutubeIframeApi } from '../../lib/youtube/ensureYoutubeIframeApi'
import {
  loadSavedLoopSections,
  persistSavedLoopSections,
  type SavedChantLoopSection,
} from '../../lib/practice/chantLoopStorage'
import {
  emptyQuickLoops,
  loadQuickLoops,
  persistQuickLoops,
  quickLoopKey,
  sanitizeQuickLoops,
  slotIsConfigured,
  validateQuickLoopRange,
  type QuickLoopId,
  type QuickLoopsState,
} from '../../lib/practice/practiceQuickLoops'
import { buildPracticeSections } from '../../lib/practice/autoSplit'
import {
  loadPlaybackSpeed,
  PRACTICE_SPEEDS,
  savePlaybackSpeed,
  type PracticeSpeed,
} from '../../lib/practice/practicePrefs'
import { ChantLoopControls } from './ChantLoopControls'
import { ChantLyricsLearningPanel } from './ChantLyricsLearningPanel'
import { VoiceRecorder, type RecordingMode } from './VoiceRecorder'
import {
  type ChantPracticePayload,
  formatChantTime,
} from './chantPracticeModel'
import { useTranslation } from '../../i18n'
import { useUiLabel } from '../../lib/i18n/uiLabels'
import { scrollTargetIntoView } from '../../lib/scrollUtils'
import styles from './ChantPracticePlayer.module.css'

const MIN_LOOP_SPAN_SEC = 0.35

function snapPlaybackRate(n: number): PracticeSpeed {
  return PRACTICE_SPEEDS.reduce((best, r) =>
    Math.abs(r - n) < Math.abs(best - n) ? r : best,
  )
}

type ChantPracticePlayerProps = {
  payload: ChantPracticePayload
  formLabel: string
  onBack: () => void
  backLabel?: string
  badges?: string[]
  /** Secondary actions rendered in the bottom “More Actions” section (favorites, copy link, etc.). */
  footerActions?: ReactNode
  /** @deprecated Prefer `footerActions` — kept for callers mid-migration. */
  headerActions?: ReactNode
  learnTabLabel?: string
  voiceTabLabel?: string
}

export function ChantPracticePlayer({
  payload,
  formLabel,
  onBack,
  backLabel,
  badges = [],
  footerActions,
  headerActions,
}: ChantPracticePlayerProps) {
  const moreActions = footerActions ?? headerActions
  const t = useUiLabel()
  const tt = useTranslation()
  const mountRef = useRef<HTMLDivElement>(null)
  const playerRef = useRef<YT.Player | null>(null)
  const shellRef = useRef<HTMLDivElement>(null)
  const didScrollAfterPlayerReadyRef = useRef(false)
  const volumeBeforeMute = useRef(80)
  const loopRepeatRef = useRef(0)
  const gapTimeoutRef = useRef<number | null>(null)

  const [apiReady, setApiReady] = useState(false)
  const [playerReady, setPlayerReady] = useState(false)
  const [isPlaying, setIsPlaying] = useState(false)
  const [currentTimeSec, setCurrentTimeSec] = useState(0)
  const [durationSec, setDurationSec] = useState(0)
  const [volume, setVolume] = useState(80)
  const [muted, setMuted] = useState(false)
  const [rate, setRate] = useState(() => loadPlaybackSpeed())
  const [loopStart, setLoopStart] = useState<number | null>(null)
  const [loopEnd, setLoopEnd] = useState<number | null>(null)
  const [loopPlaying, setLoopPlaying] = useState(false)
  const [loopLimit, setLoopLimit] = useState<number | 'infinite'>('infinite')
  const [loopGapSec, setLoopGapSec] = useState(0)
  const [loopRepeatIndex, setLoopRepeatIndex] = useState(0)
  const [loopError, setLoopError] = useState<string | null>(null)
  const [activeSectionIndex, setActiveSectionIndex] = useState<number | null>(null)
  const [savedLoopSections, setSavedLoopSections] = useState<SavedChantLoopSection[]>([])
  const [quickLoops, setQuickLoops] = useState<QuickLoopsState>(() => emptyQuickLoops())
  const [activeQuickLoop, setActiveQuickLoop] = useState<QuickLoopId | null>(null)
  const [quickLoopErrors, setQuickLoopErrors] = useState<Partial<Record<QuickLoopId, string>>>({})
  const [recordingMode, setRecordingMode] = useState<RecordingMode>('with-lyrics')
  const quickLoopsRef = useRef(quickLoops)
  const activeQuickLoopRef = useRef<QuickLoopId | null>(null)
  const [stickyVisible, setStickyVisible] = useState(true)
  const [practiceOpen, setPracticeOpen] = useState(false)
  const [stickyExpanded, setStickyExpanded] = useState(false)
  const [isNarrow, setIsNarrow] = useState(
    () => typeof window !== 'undefined' && window.matchMedia('(max-width: 959.98px)').matches,
  )

  const videoId = payload.videoId
  const audioUrl = payload.audioUrl?.trim() || undefined
  const controlsDisabled = !videoId || !playerReady

  const autoSplitSections = useMemo(
    () => (durationSec > 0 ? buildPracticeSections(durationSec) : null),
    [durationSec],
  )

  useEffect(() => {
    if (!videoId) {
      setApiReady(false)
      return
    }
    let cancelled = false
    ensureYoutubeIframeApi().then(() => {
      if (!cancelled) setApiReady(true)
    })
    return () => {
      cancelled = true
    }
  }, [videoId])

  useEffect(() => {
    quickLoopsRef.current = quickLoops
  }, [quickLoops])

  useEffect(() => {
    activeQuickLoopRef.current = activeQuickLoop
  }, [activeQuickLoop])

  useEffect(() => {
    setLoopStart(null)
    setLoopEnd(null)
    setLoopPlaying(false)
    setLoopError(null)
    setActiveSectionIndex(null)
    setPlayerReady(false)
    setIsPlaying(false)
    setCurrentTimeSec(0)
    setDurationSec(0)
    setLoopRepeatIndex(0)
    loopRepeatRef.current = 0
    didScrollAfterPlayerReadyRef.current = false
    setActiveQuickLoop(null)
    setQuickLoopErrors({})
    setQuickLoops(loadQuickLoops(payload.entryId))
  }, [payload.entryId, videoId])

  useEffect(() => {
    setSavedLoopSections(loadSavedLoopSections(payload.form, payload.entryId))
  }, [payload.form, payload.entryId])

  useEffect(() => {
    if (durationSec <= 0) return
    setQuickLoops((prev) => sanitizeQuickLoops(prev, durationSec))
  }, [durationSec, payload.entryId])

  useEffect(() => {
    persistQuickLoops(payload.entryId, quickLoops)
  }, [payload.entryId, quickLoops])

  const scrollToPlayerLandmark = useCallback(() => {
    scrollTargetIntoView('#chant-practice-scroll-target', { smooth: false })
    queueMicrotask(() => {
      document
        .getElementById('chant-practice-scroll-target')
        ?.focus({ preventScroll: true })
    })
  }, [])

  useLayoutEffect(() => {
    scrollToPlayerLandmark()
  }, [payload.entryId, videoId, scrollToPlayerLandmark])

  useEffect(() => {
    if (!playerReady || didScrollAfterPlayerReadyRef.current) return
    didScrollAfterPlayerReadyRef.current = true
    scrollToPlayerLandmark()
  }, [playerReady, scrollToPlayerLandmark])

  useEffect(() => {
    if (!apiReady || !videoId || !mountRef.current) {
      playerRef.current?.destroy()
      playerRef.current = null
      return
    }

    const mountEl = mountRef.current
    let player: YT.Player | null = null

    const create = () => {
      if (!window.YT?.Player) return
      player = new window.YT.Player(mountEl, {
        videoId,
        width: '100%',
        height: '100%',
        playerVars: {
          playsinline: 1,
          rel: 0,
          modestbranding: 1,
          origin: window.location.origin,
        },
        events: {
          onReady: (e) => {
            const p = e.target
            playerRef.current = p
            const v = p.getVolume()
            if (typeof v === 'number' && !Number.isNaN(v)) {
              setVolume(v)
              p.setVolume(v)
            } else {
              p.setVolume(80)
              setVolume(80)
            }
            const preferred = loadPlaybackSpeed()
            setRate(preferred)
            try {
              p.setPlaybackRate(preferred)
            } catch {
              /* some videos reject rates */
            }
            const dur = p.getDuration()
            if (typeof dur === 'number' && Number.isFinite(dur)) {
              setDurationSec(Math.max(0, dur))
            }
            setPlayerReady(true)
          },
          onStateChange: (e) => {
            const PS = window.YT?.PlayerState
            if (!PS) return
            setIsPlaying(e.data === PS.PLAYING)
          },
          onError: () => {
            setLoopError('This video cannot be controlled in the embedded player. Try Open on YouTube.')
          },
        },
      })
      playerRef.current = player
    }

    create()

    return () => {
      try {
        player?.destroy()
      } catch {
        /* ignore */
      }
      playerRef.current = null
      setPlayerReady(false)
      if (gapTimeoutRef.current) window.clearTimeout(gapTimeoutRef.current)
    }
  }, [apiReady, videoId, payload.entryId])

  const getPlayer = useCallback(() => playerRef.current, [])

  const togglePlay = useCallback(() => {
    const p = getPlayer()
    if (!p) return
    const PS = window.YT?.PlayerState
    if (!PS) return
    const st = p.getPlayerState()
    if (st === PS.PLAYING) p.pauseVideo()
    else p.playVideo()
  }, [getPlayer])

  const onVolumeChange = useCallback(
    (v: number) => {
      setVolume(v)
      setMuted(v === 0)
      getPlayer()?.setVolume(v)
    },
    [getPlayer],
  )

  const onToggleMute = useCallback(() => {
    const p = getPlayer()
    if (!p) return
    if (muted || volume === 0) {
      const restore = volumeBeforeMute.current || 80
      setMuted(false)
      setVolume(restore)
      p.unMute()
      p.setVolume(restore)
    } else {
      volumeBeforeMute.current = volume || 80
      setMuted(true)
      p.mute()
      p.setVolume(0)
    }
  }, [getPlayer, muted, volume])

  const onRateChange = useCallback(
    (r: number) => {
      const snapped = snapPlaybackRate(r)
      setRate(snapped)
      savePlaybackSpeed(snapped)
      try {
        getPlayer()?.setPlaybackRate(snapped)
      } catch {
        setLoopError('This recording does not support that playback speed.')
      }
    },
    [getPlayer],
  )

  const skipBy = useCallback(
    (delta: number) => {
      const p = getPlayer()
      if (!p) return
      const cur = p.getCurrentTime()
      const dur = p.getDuration()
      let next = cur + delta
      if (dur && Number.isFinite(dur)) next = Math.max(0, Math.min(dur, next))
      else next = Math.max(0, next)
      p.seekTo(next, true)
      setCurrentTimeSec(next)
    },
    [getPlayer],
  )

  const seekTo = useCallback(
    (value: number) => {
      const p = getPlayer()
      if (!p) return
      const dur = p.getDuration()
      const target =
        Number.isFinite(dur) && dur > 0
          ? Math.max(0, Math.min(dur, value))
          : Math.max(0, value)

      const activeId = activeQuickLoopRef.current
      if (activeId != null) {
        const slot = quickLoopsRef.current[quickLoopKey(activeId)]
        if (
          slot.startTime != null &&
          slot.endTime != null &&
          (target < slot.startTime - 0.35 || target > slot.endTime + 0.35)
        ) {
          setActiveQuickLoop(null)
        }
      }

      p.seekTo(target, true)
      setCurrentTimeSec(target)
    },
    [getPlayer],
  )

  const stopQuickLoop = useCallback(() => {
    setActiveQuickLoop(null)
  }, [])

  const setQuickStart = useCallback(
    (id: QuickLoopId) => {
      const p = getPlayer()
      if (!p) return
      const now = p.getCurrentTime()
      setQuickLoopErrors((prev) => {
        const next = { ...prev }
        delete next[id]
        return next
      })
      setQuickLoops((prev) => {
        const key = quickLoopKey(id)
        const nextSlot = { ...prev[key], startTime: now }
        const err = validateQuickLoopRange(nextSlot.startTime, nextSlot.endTime)
        if (err) {
          queueMicrotask(() =>
            setQuickLoopErrors((e) => ({ ...e, [id]: err })),
          )
        }
        return { ...prev, [key]: nextSlot }
      })
    },
    [getPlayer],
  )

  const setQuickEnd = useCallback(
    (id: QuickLoopId) => {
      const p = getPlayer()
      if (!p) return
      const now = p.getCurrentTime()
      setQuickLoops((prev) => {
        const key = quickLoopKey(id)
        const nextSlot = { ...prev[key], endTime: now }
        const err = validateQuickLoopRange(nextSlot.startTime, nextSlot.endTime)
        queueMicrotask(() => {
          setQuickLoopErrors((e) => {
            const copy = { ...e }
            if (err) copy[id] = err
            else delete copy[id]
            return copy
          })
        })
        return { ...prev, [key]: nextSlot }
      })
    },
    [getPlayer],
  )

  const practiceQuickLoop = useCallback(
    (id: QuickLoopId) => {
      const slot = quickLoopsRef.current[quickLoopKey(id)]
      if (!slotIsConfigured(slot) || slot.startTime == null || slot.endTime == null) {
        setQuickLoopErrors((e) => ({
          ...e,
          [id]: 'Set both start and end before practicing.',
        }))
        return
      }
      const err = validateQuickLoopRange(slot.startTime, slot.endTime)
      if (err) {
        setQuickLoopErrors((e) => ({ ...e, [id]: err }))
        return
      }
      setQuickLoopErrors((e) => {
        const copy = { ...e }
        delete copy[id]
        return copy
      })
      setLoopPlaying(false)
      setActiveSectionIndex(null)
      if (gapTimeoutRef.current) {
        window.clearTimeout(gapTimeoutRef.current)
        gapTimeoutRef.current = null
      }
      const p = getPlayer()
      if (!p) return
      setActiveQuickLoop(id)
      p.seekTo(slot.startTime, true)
      p.playVideo()
    },
    [getPlayer],
  )

  const clearQuickLoop = useCallback(
    (id: QuickLoopId) => {
      if (activeQuickLoopRef.current === id) setActiveQuickLoop(null)
      setQuickLoopErrors((e) => {
        const copy = { ...e }
        delete copy[id]
        return copy
      })
      setQuickLoops((prev) => ({
        ...prev,
        [quickLoopKey(id)]: { startTime: null, endTime: null },
      }))
    },
    [],
  )

  const clearAllQuickLoops = useCallback(() => {
    setActiveQuickLoop(null)
    setQuickLoopErrors({})
    setQuickLoops(emptyQuickLoops())
  }, [])

  const markStart = useCallback(() => {
    setLoopError(null)
    setLoopPlaying(false)
    setActiveQuickLoop(null)
    const p = getPlayer()
    if (!p) return
    setLoopStart(p.getCurrentTime())
  }, [getPlayer])

  const markEnd = useCallback(() => {
    setLoopError(null)
    setLoopPlaying(false)
    setActiveQuickLoop(null)
    const p = getPlayer()
    if (!p) return
    setLoopEnd(p.getCurrentTime())
  }, [getPlayer])

  const nudgeStart = useCallback((delta: number) => {
    setLoopStart((prev) => (prev == null ? prev : Math.max(0, prev + delta)))
  }, [])

  const nudgeEnd = useCallback(
    (delta: number) => {
      setLoopEnd((prev) => {
        if (prev == null) return prev
        const next = prev + delta
        const max = durationSec > 0 ? durationSec : next
        return Math.min(max, Math.max(0, next))
      })
    },
    [durationSec],
  )

  const playLoop = useCallback(() => {
    if (loopStart === null || loopEnd === null) {
      setLoopError(tt('mezmurPractice.loop.errorMarkBoth'))
      return
    }
    if (loopEnd <= loopStart + MIN_LOOP_SPAN_SEC) {
      setLoopError(tt('mezmurPractice.loop.errorEndAfterStart'))
      return
    }
    setLoopError(null)
    loopRepeatRef.current = 0
    setLoopRepeatIndex(0)
    setActiveQuickLoop(null)
    const p = getPlayer()
    if (!p) return
    setLoopPlaying(true)
    p.seekTo(loopStart, true)
    p.playVideo()
  }, [getPlayer, loopStart, loopEnd, tt])

  const stopLoop = useCallback(() => {
    setLoopPlaying(false)
    if (gapTimeoutRef.current) {
      window.clearTimeout(gapTimeoutRef.current)
      gapTimeoutRef.current = null
    }
  }, [])

  const clearLoop = useCallback(() => {
    stopLoop()
    setLoopStart(null)
    setLoopEnd(null)
    setLoopError(null)
    setActiveSectionIndex(null)
    setLoopRepeatIndex(0)
    loopRepeatRef.current = 0
  }, [stopLoop])

  const playSection = useCallback(
    (index: number, loop: boolean) => {
      const seg = autoSplitSections?.[index]
      if (!seg || seg.end <= seg.start + 0.2) return
      setLoopError(null)
      setActiveSectionIndex(index)
      setLoopStart(seg.start)
      setLoopEnd(seg.end)
      loopRepeatRef.current = 0
      setLoopRepeatIndex(0)
      setActiveQuickLoop(null)
      const p = getPlayer()
      if (!p) return
      setLoopPlaying(loop)
      p.seekTo(seg.start, true)
      p.playVideo()
    },
    [autoSplitSections, getPlayer],
  )

  const goSection = useCallback(
    (dir: -1 | 1) => {
      if (!autoSplitSections?.length) return
      const current = activeSectionIndex ?? 0
      const next = Math.max(0, Math.min(autoSplitSections.length - 1, current + dir))
      playSection(next, loopPlaying)
    },
    [activeSectionIndex, autoSplitSections, loopPlaying, playSection],
  )

  const saveLoopSection = useCallback(() => {
    if (loopStart === null || loopEnd === null) {
      setLoopError(tt('mezmurPractice.loop.errorMarkBothSave'))
      return
    }
    if (loopEnd <= loopStart + MIN_LOOP_SPAN_SEC) {
      setLoopError(tt('mezmurPractice.loop.errorEndAfterStartSave'))
      return
    }
    if (savedLoopSections.length >= 30) {
      setLoopError(tt('mezmurPractice.loop.errorMaxSaved'))
      return
    }
    setLoopError(null)
    const nextLabel = tt('mezmurPractice.loop.defaultSavedName', {
      n: savedLoopSections.length + 1,
    })
    const section: SavedChantLoopSection = {
      id:
        typeof crypto !== 'undefined' && crypto.randomUUID
          ? crypto.randomUUID()
          : `loop-${Date.now()}-${Math.random().toString(36).slice(2, 9)}`,
      label: nextLabel,
      startSec: loopStart,
      endSec: loopEnd,
    }
    setSavedLoopSections((prev) => {
      const next = [...prev, section]
      persistSavedLoopSections(payload.form, payload.entryId, next)
      return next
    })
  }, [loopStart, loopEnd, savedLoopSections.length, payload.form, payload.entryId, tt])

  const playSavedLoopSection = useCallback(
    (section: SavedChantLoopSection) => {
      if (section.endSec <= section.startSec + MIN_LOOP_SPAN_SEC) return
      setLoopError(null)
      setActiveSectionIndex(null)
      setLoopStart(section.startSec)
      setLoopEnd(section.endSec)
      loopRepeatRef.current = 0
      setLoopRepeatIndex(0)
      setActiveQuickLoop(null)
      const p = getPlayer()
      if (!p) return
      setLoopPlaying(true)
      p.seekTo(section.startSec, true)
      p.playVideo()
    },
    [getPlayer],
  )

  const loadSavedLoopSectionIntoMarks = useCallback((section: SavedChantLoopSection) => {
    setLoopStart(section.startSec)
    setLoopEnd(section.endSec)
    setLoopError(null)
    setLoopPlaying(false)
    setActiveSectionIndex(null)
  }, [])

  const deleteSavedLoopSection = useCallback(
    (id: string) => {
      setSavedLoopSections((prev) => {
        const next = prev.filter((s) => s.id !== id)
        persistSavedLoopSections(payload.form, payload.entryId, next)
        return next
      })
    },
    [payload.form, payload.entryId],
  )

  const renameSavedLoopSection = useCallback(
    (id: string, label: string) => {
      const trimmed = label.trim()
      setSavedLoopSections((prev) => {
        const next = prev.map((s) => (s.id === id ? { ...s, label: trimmed || s.label } : s))
        persistSavedLoopSections(payload.form, payload.entryId, next)
        return next
      })
    },
    [payload.form, payload.entryId],
  )

  // Quick loops + advanced loop + one-shot section end
  useEffect(() => {
    const iv = window.setInterval(() => {
      const p = playerRef.current
      if (!p || typeof p.getCurrentTime !== 'function') return
      const now = p.getCurrentTime()

      const quickId = activeQuickLoopRef.current
      if (quickId != null) {
        const slot = quickLoopsRef.current[quickLoopKey(quickId)]
        if (
          slot.startTime == null ||
          slot.endTime == null ||
          slot.endTime <= slot.startTime + MIN_LOOP_SPAN_SEC
        ) {
          setActiveQuickLoop(null)
          return
        }
        if (now >= slot.endTime - 0.12) {
          p.seekTo(slot.startTime, true)
          const PS = window.YT?.PlayerState
          if (PS && p.getPlayerState() !== PS.PLAYING) p.playVideo()
        }
        return
      }

      if (loopStart === null || loopEnd === null) return
      if (now < loopEnd - 0.12) return

      if (!loopPlaying) {
        p.pauseVideo()
        p.seekTo(loopEnd, true)
        return
      }

      const nextCount = loopRepeatRef.current + 1
      if (loopLimit !== 'infinite' && nextCount >= loopLimit) {
        setLoopPlaying(false)
        p.pauseVideo()
        loopRepeatRef.current = nextCount
        setLoopRepeatIndex(nextCount)
        return
      }

      const restart = () => {
        loopRepeatRef.current = nextCount
        setLoopRepeatIndex(nextCount)
        p.seekTo(loopStart, true)
        const PS = window.YT?.PlayerState
        if (PS && p.getPlayerState() !== PS.PLAYING) p.playVideo()
      }

      if (loopGapSec > 0) {
        p.pauseVideo()
        if (gapTimeoutRef.current) window.clearTimeout(gapTimeoutRef.current)
        gapTimeoutRef.current = window.setTimeout(restart, loopGapSec * 1000)
      } else {
        restart()
      }
    }, 90)
    return () => window.clearInterval(iv)
  }, [loopPlaying, loopStart, loopEnd, loopLimit, loopGapSec, activeQuickLoop])

  useEffect(() => {
    if (!playerReady) return
    const iv = window.setInterval(() => {
      const p = playerRef.current
      if (!p || typeof p.getCurrentTime !== 'function') return
      const time = p.getCurrentTime()
      if (typeof time === 'number' && Number.isFinite(time)) {
        setCurrentTimeSec(Math.max(0, time))
      }
      const d = p.getDuration()
      if (typeof d === 'number' && Number.isFinite(d)) {
        setDurationSec(Math.max(0, d))
      }
    }, 220)
    return () => window.clearInterval(iv)
  }, [playerReady])

  // Keyboard shortcuts when interacting with the practice player shell
  useEffect(() => {
    const shell = shellRef.current
    if (!shell) return
    const onKey = (event: KeyboardEvent) => {
      const target = event.target as HTMLElement | null
      if (
        target?.closest(
          'input, textarea, select, [contenteditable="true"], [contenteditable=""]',
        )
      ) {
        return
      }
      if (event.code === 'Space') {
        event.preventDefault()
        togglePlay()
      } else if (event.key === 'ArrowLeft') {
        event.preventDefault()
        skipBy(-5)
      } else if (event.key === 'ArrowRight') {
        event.preventDefault()
        skipBy(5)
      }
    }
    shell.addEventListener('keydown', onKey)
    return () => shell.removeEventListener('keydown', onKey)
  }, [togglePlay, skipBy])

  useEffect(() => {
    const mq = window.matchMedia('(max-width: 959.98px)')
    const sync = () => setIsNarrow(mq.matches)
    sync()
    mq.addEventListener('change', sync)
    return () => mq.removeEventListener('change', sync)
  }, [])

  useEffect(() => {
    const onScroll = () => {
      const landmark = document.getElementById('chant-practice-scroll-target')
      if (!landmark) {
        setStickyVisible(true)
        return
      }
      const rect = landmark.getBoundingClientRect()
      setStickyVisible(rect.bottom < 72 || window.scrollY > 80)
    }
    window.addEventListener('scroll', onScroll, { passive: true })
    onScroll()
    return () => window.removeEventListener('scroll', onScroll)
  }, [])

  const metaLine = useMemo(() => {
    const parts = [formLabel, ...badges].filter(Boolean)
    return parts.slice(0, 4).join(' · ')
  }, [formLabel, badges])

  const displayAmharic = payload.titleAmharic?.trim() || ''
  const displayTranslit =
    payload.transliterationTitle?.trim() ||
    (displayAmharic && payload.title !== displayAmharic ? payload.title : '') ||
    (!displayAmharic ? payload.title : '')
  const progressPct =
    durationSec > 0 ? Math.max(0, Math.min(100, (currentTimeSec / durationSec) * 100)) : 0
  const supportUrl = (payload.watchUrl || '').trim()

  return (
    <div className={`${styles.shell} ${styles.shellReading}`} ref={shellRef} tabIndex={-1}>
      {/* 1. Hymn title / identity */}
      <header className={styles.topBar}>
        <button type="button" className={styles.back} onClick={onBack}>
          {backLabel ?? t('playerBack')}
        </button>
        <div className={styles.titleBlock}>
          {metaLine ? <p className={styles.metaPills}>{metaLine}</p> : null}
          {displayAmharic ? (
            <h1 className={styles.titleAmharic} lang="am">
              {displayAmharic}
            </h1>
          ) : (
            <h1 className={styles.title}>{payload.title}</h1>
          )}
          {displayTranslit ? (
            <p className={displayAmharic ? styles.sub : styles.title}>{displayTranslit}</p>
          ) : null}
        </div>
      </header>

      <div
        id="chant-practice-scroll-target"
        tabIndex={-1}
        className={styles.scrollLandmark}
        aria-label={t('practiceChantVideoLandmark')}
      />

      <div className={styles.layoutReading}>
        {/* 2. Support the Zemari */}
        {supportUrl ? (
          <a
            className={styles.supportZemari}
            href={supportUrl}
            target="_blank"
            rel="noopener noreferrer"
          >
            ❤️ Support the Zemari
          </a>
        ) : null}

        {/* 3. Lyrics */}
        <div className={styles.readColumn}>
          {payload.entryId.startsWith('custom:') && payload.learning?.meaning ? (
            <div className={styles.practiceNotes}>
              <p className={styles.practiceNotesLabel}>{tt('mezmurPractice.player.yourNotes')}</p>
              <p className={styles.practiceNotesText}>{payload.learning.meaning}</p>
            </div>
          ) : null}
          <ChantLyricsLearningPanel
            entryId={payload.entryId}
            lyricsGez={payload.lyricsGez}
            transliterationLyrics={payload.transliterationLyrics}
            lyricsEnglish={payload.lyricsEnglish}
            currentTimeSec={currentTimeSec}
            durationSec={durationSec}
            isPlaying={isPlaying}
            showMemorizationTipsCallout={false}
          />
        </div>

        <div className={styles.secondaryStack}>
          {/* 5. Loop Practice */}
          <details
            className={styles.collapsible}
            open={practiceOpen}
            onToggle={(event) => setPracticeOpen((event.target as HTMLDetailsElement).open)}
          >
            <summary className={styles.collapsibleSummary}>Loop Practice</summary>
            <div className={styles.collapsibleBody}>
              <ChantLoopControls
                disabled={controlsDisabled}
                formatTime={formatChantTime}
                quickLoops={quickLoops}
                activeQuickLoop={activeQuickLoop}
                quickLoopErrors={quickLoopErrors}
                onSetQuickStart={setQuickStart}
                onSetQuickEnd={setQuickEnd}
                onPracticeQuickLoop={practiceQuickLoop}
                onStopQuickLoop={stopQuickLoop}
                onClearQuickLoop={clearQuickLoop}
                onClearAllQuickLoops={clearAllQuickLoops}
                loopStart={loopStart}
                loopEnd={loopEnd}
                loopPlaying={loopPlaying}
                loopError={loopError}
                onMarkStart={markStart}
                onMarkEnd={markEnd}
                onNudgeStart={nudgeStart}
                onNudgeEnd={nudgeEnd}
                onPlayLoop={playLoop}
                onStopLoop={stopLoop}
                onClearLoop={clearLoop}
                loopLimit={loopLimit}
                onLoopLimitChange={setLoopLimit}
                loopGapSec={loopGapSec}
                onLoopGapChange={setLoopGapSec}
                loopRepeatIndex={loopRepeatIndex}
                savedSections={savedLoopSections}
                onSaveSection={saveLoopSection}
                onPlaySavedSection={playSavedLoopSection}
                onLoadSavedSection={loadSavedLoopSectionIntoMarks}
                onDeleteSavedSection={deleteSavedLoopSection}
                onRenameSavedSection={renameSavedLoopSection}
                autoSplitSections={autoSplitSections}
                activeSectionIndex={activeSectionIndex}
                onPlaySection={playSection}
              />
            </div>
          </details>

          {/* 6. Record Yourself */}
          <details className={styles.collapsible}>
            <summary className={styles.collapsibleSummary}>Record Yourself</summary>
            <div className={styles.collapsibleBody}>
              <section className={styles.recordBlock} aria-label="Record yourself">
                <p className={styles.privacyNote}>
                  Your recording stays on this device unless you choose otherwise.
                </p>
                <VoiceRecorder
                  mode={recordingMode}
                  onModeChange={setRecordingMode}
                  disabled={false}
                />
              </section>
            </div>
          </details>

          {/* 7. Source Video — official embed always visible when present */}
          <section className={styles.youtubeSource} aria-label="Source Video">
            <h2 className={styles.sectionHeading}>Source Video</h2>
            {videoId ? (
              <div id="chant-youtube-frame" className={styles.videoShell}>
                <div ref={mountRef} className={styles.playerMount} />
              </div>
            ) : (
              <div className={styles.noVideoInline}>
                {audioUrl ? (
                  <audio className={styles.fallbackAudio} controls preload="metadata" src={audioUrl}>
                    <track kind="captions" />
                  </audio>
                ) : (
                  <p className={styles.noVideoInlineText}>{tt('mezmurPractice.player.noVideo')}</p>
                )}
              </div>
            )}
            {supportUrl ? (
              <a
                className={styles.watchQuiet}
                href={supportUrl}
                target="_blank"
                rel="noopener noreferrer"
              >
                Open original on YouTube
              </a>
            ) : null}
          </section>

          {/* 8. More Actions — favorites, copy link, etc. */}
          {moreActions ? (
            <section className={styles.moreActions} aria-label="More Actions">
              <h2 className={styles.moreActionsHeading}>More Actions</h2>
              <div className={styles.moreActionsRow}>{moreActions}</div>
            </section>
          ) : null}
        </div>
      </div>

      {/* 4. Sticky playback controls */}
      <div
        className={`${styles.stickyBar} ${stickyVisible ? styles.stickyBarRaised : ''} ${stickyExpanded ? styles.stickyBarExpanded : ''}`.trim()}
        role="region"
        aria-label="Playback controls"
      >
        <div className={styles.stickyControls}>
          <button
            type="button"
            className={styles.stickyBtn}
            onClick={() => goSection(-1)}
            disabled={controlsDisabled}
            aria-label="Previous section"
          >
            ‹‹
          </button>
          <button
            type="button"
            className={styles.stickyBtn}
            onClick={() => skipBy(-10)}
            disabled={controlsDisabled}
            aria-label="Seek back 10 seconds"
          >
            −10
          </button>
          <button
            type="button"
            className={styles.stickyPlay}
            onClick={togglePlay}
            disabled={controlsDisabled}
            aria-label={isPlaying ? 'Pause' : 'Play'}
          >
            {isPlaying ? '❚❚' : '▶'}
          </button>
          <button
            type="button"
            className={styles.stickyBtn}
            onClick={() => skipBy(10)}
            disabled={controlsDisabled}
            aria-label="Seek forward 10 seconds"
          >
            +10
          </button>
          <button
            type="button"
            className={styles.stickyBtn}
            onClick={() => goSection(1)}
            disabled={controlsDisabled}
            aria-label="Next section"
          >
            ››
          </button>
        </div>

        <div className={styles.stickyProgressRow}>
          <span className={styles.stickyTime}>{formatChantTime(currentTimeSec)}</span>
          <label className={styles.stickySeekLabel}>
            <span className={styles.srOnly}>Seek</span>
            <input
              type="range"
              className={styles.stickySeek}
              min={0}
              max={Math.max(1, durationSec)}
              step={0.1}
              value={Math.min(currentTimeSec, durationSec || 0)}
              disabled={controlsDisabled || durationSec <= 0}
              aria-valuemin={0}
              aria-valuemax={Math.max(0, durationSec)}
              aria-valuenow={currentTimeSec}
              aria-valuetext={`${formatChantTime(currentTimeSec)} of ${formatChantTime(durationSec)}`}
              onChange={(e) => seekTo(Number(e.target.value))}
              style={{ ['--progress' as string]: `${progressPct}%` }}
            />
          </label>
          <span className={styles.stickyTime}>{formatChantTime(durationSec)}</span>
        </div>

        {isNarrow ? (
          <button
            type="button"
            className={styles.stickyMore}
            aria-expanded={stickyExpanded}
            onClick={() => setStickyExpanded((v) => !v)}
          >
            {stickyExpanded ? 'Less' : 'Volume & speed'}
          </button>
        ) : null}

        {(!isNarrow || stickyExpanded) && videoId ? (
          <div className={styles.stickyExtras}>
            <label className={styles.stickyExtraLabel}>
              Volume
              <input
                type="range"
                min={0}
                max={100}
                value={muted ? 0 : volume}
                disabled={controlsDisabled}
                aria-label="Volume"
                onChange={(e) => onVolumeChange(Number(e.target.value))}
              />
            </label>
            <button
              type="button"
              className={styles.stickyLoop}
              onClick={onToggleMute}
              disabled={controlsDisabled}
              aria-pressed={muted}
              aria-label={muted ? 'Unmute' : 'Mute'}
            >
              {muted ? 'Unmute' : 'Mute'}
            </button>
            <label className={styles.stickyExtraLabel}>
              Speed
              <select
                value={rate}
                disabled={controlsDisabled}
                aria-label="Playback speed"
                onChange={(e) => onRateChange(Number(e.target.value))}
              >
                {PRACTICE_SPEEDS.map((r) => (
                  <option key={r} value={r}>
                    {r}×
                  </option>
                ))}
              </select>
            </label>
            {loopPlaying || activeQuickLoop != null ? (
              <button
                type="button"
                className={styles.stickyLoop}
                onClick={() => {
                  if (activeQuickLoop != null) stopQuickLoop()
                  else stopLoop()
                }}
                aria-label="Stop loop"
              >
                Stop loop
              </button>
            ) : null}
          </div>
        ) : null}
      </div>
    </div>
  )
}
