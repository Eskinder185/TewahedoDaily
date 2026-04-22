import {
  useCallback,
  useEffect,
  useLayoutEffect,
  useMemo,
  useRef,
  useState,
} from 'react'
import { ensureYoutubeIframeApi } from '../../lib/youtube/ensureYoutubeIframeApi'
import {
  loadSavedLoopSections,
  persistSavedLoopSections,
  type SavedChantLoopSection,
} from '../../lib/practice/chantLoopStorage'
import {
  ChantLoopControls,
  type AutoSplitSectionRange,
} from './ChantLoopControls'
import { ChantLyricsLearningPanel } from './ChantLyricsLearningPanel'
import { ChantPlayerControls } from './ChantPlayerControls'
import { VoiceRecorder, type RecordingMode } from './VoiceRecorder'
import { TabPanel } from '../ui/TabPanel'
import {
  type ChantPracticePayload,
  formatChantTime,
} from './chantPracticeModel'
import { useUiLabel } from '../../lib/i18n/uiLabels'
import { scrollTargetIntoView } from '../../lib/scrollUtils'
import styles from './ChantPracticePlayer.module.css'

const SPEEDS = [0.5, 0.75, 1, 1.25] as const
const AUTO_SPLIT_END_BUFFER_SEC = 3
const MIN_LOOP_SPAN_SEC = 0.35

function snapPlaybackRate(n: number): number {
  return SPEEDS.reduce((best, r) =>
    Math.abs(r - n) < Math.abs(best - n) ? r : best,
  )
}

function buildDefaultAutoSplitSections(
  durationSec: number,
): AutoSplitSectionRange[] | null {
  if (!Number.isFinite(durationSec) || durationSec <= 0) return null
  const usableEnd = durationSec - AUTO_SPLIT_END_BUFFER_SEC
  if (usableEnd <= MIN_LOOP_SPAN_SEC * 3) return null
  const third = usableEnd / 3
  const sections: AutoSplitSectionRange[] = [
    { start: 0, end: third },
    { start: third, end: third * 2 },
    { start: third * 2, end: usableEnd },
  ]
  const valid = sections.every((s) => s.end > s.start + MIN_LOOP_SPAN_SEC)
  return valid ? sections : null
}

type ChantPracticePlayerProps = {
  payload: ChantPracticePayload
  formLabel: string
  onBack: () => void
  /** Overrides first learning tab (default: i18n memorize label). */
  learnTabLabel?: string
  /** Overrides second tab (default: “Record”). */
  voiceTabLabel?: string
}

export function ChantPracticePlayer({
  payload,
  formLabel,
  onBack,
  learnTabLabel,
  voiceTabLabel,
}: ChantPracticePlayerProps) {
  const t = useUiLabel()
  const mountRef = useRef<HTMLDivElement>(null)
  const playerRef = useRef<YT.Player | null>(null)
  const didScrollAfterPlayerReadyRef = useRef(false)

  const [apiReady, setApiReady] = useState(false)
  const [playerReady, setPlayerReady] = useState(false)
  const [isPlaying, setIsPlaying] = useState(false)
  const [currentTimeSec, setCurrentTimeSec] = useState(0)
  const [durationSec, setDurationSec] = useState(0)
  const [volume, setVolume] = useState(80)
  const [rate, setRate] = useState(1)
  const [loopStart, setLoopStart] = useState<number | null>(null)
  const [loopEnd, setLoopEnd] = useState<number | null>(null)
  const [loopPlaying, setLoopPlaying] = useState(false)
  const [loopError, setLoopError] = useState<string | null>(null)
  const [autoSplitSections, setAutoSplitSections] = useState<
    AutoSplitSectionRange[] | null
  >(null)
  const [splitHighlight, setSplitHighlight] = useState<
    'full' | 1 | 2 | 3 | 'neutral'
  >('full')
  const [savedLoopSections, setSavedLoopSections] = useState<
    SavedChantLoopSection[]
  >([])
  const [recordingMode, setRecordingMode] = useState<RecordingMode>('with-lyrics')

  const videoId = payload.videoId
  const controlsDisabled = !videoId || !playerReady

  useEffect(() => {
    let cancelled = false
    ensureYoutubeIframeApi().then(() => {
      if (!cancelled) setApiReady(true)
    })
    return () => {
      cancelled = true
    }
  }, [])

  useEffect(() => {
    setLoopStart(null)
    setLoopEnd(null)
    setLoopPlaying(false)
    setLoopError(null)
    setAutoSplitSections(null)
    setSplitHighlight('full')
    setPlayerReady(false)
    setIsPlaying(false)
    setCurrentTimeSec(0)
    setDurationSec(0)
    didScrollAfterPlayerReadyRef.current = false
  }, [payload.entryId, videoId])

  useEffect(() => {
    setSavedLoopSections(
      loadSavedLoopSections(payload.form, payload.entryId),
    )
  }, [payload.form, payload.entryId])

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
            const r = snapPlaybackRate(p.getPlaybackRate())
            setRate(r)
            p.setPlaybackRate(r)
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

  const onVolumeChange = useCallback((v: number) => {
    setVolume(v)
    getPlayer()?.setVolume(v)
  }, [getPlayer])

  const onRateChange = useCallback(
    (r: number) => {
      setRate(r)
      getPlayer()?.setPlaybackRate(r)
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
      if (dur && Number.isFinite(dur)) {
        next = Math.max(0, Math.min(dur, next))
      } else {
        next = Math.max(0, next)
      }
      p.seekTo(next, true)
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
      p.seekTo(target, true)
      setCurrentTimeSec(target)
    },
    [getPlayer],
  )

  const markStart = useCallback(() => {
    setLoopError(null)
    setLoopPlaying(false)
    setSplitHighlight('neutral')
    const p = getPlayer()
    if (!p) return
    setLoopStart(p.getCurrentTime())
  }, [getPlayer])

  const markEnd = useCallback(() => {
    setLoopError(null)
    setLoopPlaying(false)
    setSplitHighlight('neutral')
    const p = getPlayer()
    if (!p) return
    setLoopEnd(p.getCurrentTime())
  }, [getPlayer])

  const playLoop = useCallback(() => {
    if (loopStart === null || loopEnd === null) {
      setLoopError('Mark both start and end first.')
      return
    }
    if (loopEnd <= loopStart + 0.35) {
      setLoopError('End must be after start by at least a moment.')
      return
    }
    setLoopError(null)
    setSplitHighlight('neutral')
    const p = getPlayer()
    if (!p) return
    setLoopPlaying(true)
    p.seekTo(loopStart, true)
    p.playVideo()
  }, [getPlayer, loopStart, loopEnd])

  const stopLoop = useCallback(() => {
    setLoopPlaying(false)
  }, [])

  const clearLoop = useCallback(() => {
    setLoopPlaying(false)
    setLoopStart(null)
    setLoopEnd(null)
    setLoopError(null)
    setSplitHighlight('full')
  }, [])

  const handleAutoSplit = useCallback(() => {
    setLoopError(null)
    const p = getPlayer()
    if (!p || typeof p.getDuration !== 'function') return
    const d = p.getDuration()
    const sections = buildDefaultAutoSplitSections(d)
    if (!sections) {
      setAutoSplitSections(null)
      setSplitHighlight('neutral')
      if (d == null || !Number.isFinite(d) || d <= 0) {
        setLoopError('Video length not ready yet. Try again in a moment.')
      } else {
        setLoopError(
          'Auto split is unavailable for very short videos. Use Advanced Loop Practice.',
        )
      }
      return
    }
    setAutoSplitSections(sections)
    setSplitHighlight(1)
    setLoopPlaying(false)
    setLoopStart(null)
    setLoopEnd(null)
  }, [getPlayer])

  const handleSelectAutoSection = useCallback(
    (n: 1 | 2 | 3) => {
      if (!autoSplitSections || autoSplitSections.length < 3) return
      const seg = autoSplitSections[n - 1]
      if (seg.end <= seg.start + 0.2) return
      setLoopError(null)
      setSplitHighlight(n)
      setLoopStart(seg.start)
      setLoopEnd(seg.end)
      setLoopPlaying(true)
      const p = getPlayer()
      if (!p) return
      p.seekTo(seg.start, true)
      p.playVideo()
    },
    [getPlayer, autoSplitSections],
  )

  const saveLoopSection = useCallback(() => {
    if (loopStart === null || loopEnd === null) {
      setLoopError('Mark both start and end before saving.')
      return
    }
    if (loopEnd <= loopStart + 0.35) {
      setLoopError('End must be after start before saving.')
      return
    }
    if (savedLoopSections.length >= 30) {
      setLoopError('You can save up to 30 loops per chant.')
      return
    }
    setLoopError(null)
    const nextLabel = `Loop ${savedLoopSections.length + 1}`
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
  }, [
    loopStart,
    loopEnd,
    savedLoopSections.length,
    payload.form,
    payload.entryId,
  ])

  const playSavedLoopSection = useCallback(
    (section: SavedChantLoopSection) => {
      if (section.endSec <= section.startSec + 0.35) return
      setLoopError(null)
      setSplitHighlight('neutral')
      setLoopStart(section.startSec)
      setLoopEnd(section.endSec)
      const p = getPlayer()
      if (!p) return
      setLoopPlaying(true)
      p.seekTo(section.startSec, true)
      p.playVideo()
    },
    [getPlayer],
  )

  const loadSavedLoopSectionIntoMarks = useCallback(
    (section: SavedChantLoopSection) => {
      setLoopStart(section.startSec)
      setLoopEnd(section.endSec)
      setLoopError(null)
      setLoopPlaying(false)
      setSplitHighlight('neutral')
    },
    [],
  )

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
        const next = prev.map((s) =>
          s.id === id ? { ...s, label: trimmed || s.label } : s,
        )
        persistSavedLoopSections(payload.form, payload.entryId, next)
        return next
      })
    },
    [payload.form, payload.entryId],
  )

  useEffect(() => {
    if (!loopPlaying || loopStart === null || loopEnd === null) return
    const iv = window.setInterval(() => {
      const p = playerRef.current
      if (!p || typeof p.getCurrentTime !== 'function') return
      const t = p.getCurrentTime()
      if (t >= loopEnd - 0.1) {
        p.seekTo(loopStart, true)
        const PS = window.YT?.PlayerState
        if (PS && p.getPlayerState() !== PS.PLAYING) p.playVideo()
      }
    }, 90)
    return () => window.clearInterval(iv)
  }, [loopPlaying, loopStart, loopEnd])

  useEffect(() => {
    if (!playerReady) return
    const iv = window.setInterval(() => {
      const p = playerRef.current
      if (!p || typeof p.getCurrentTime !== 'function') return
      const t = p.getCurrentTime()
      if (typeof t === 'number' && Number.isFinite(t)) {
        setCurrentTimeSec(Math.max(0, t))
      }
      const d = p.getDuration()
      if (typeof d === 'number' && Number.isFinite(d)) {
        setDurationSec(Math.max(0, d))
      }
    }, 220)
    return () => window.clearInterval(iv)
  }, [playerReady])

  useEffect(() => {
    if (!playerReady || !videoId) return
    handleAutoSplit()
  }, [playerReady, videoId, payload.entryId, handleAutoSplit])

  const memorizeLabel = learnTabLabel ?? t('practiceChantTabMemorize')
  const recordLabel = voiceTabLabel ?? 'Record'

  const learningTabs = useMemo(
    () => [
      {
        id: 'memorize',
        label: memorizeLabel,
        content: (
          <ChantLyricsLearningPanel
            entryId={payload.entryId}
            lyricsGez={payload.lyricsGez}
            transliterationLyrics={payload.transliterationLyrics}
            showMemorizationTipsCallout={false}
          />
        ),
      },
      {
        id: 'record',
        label: recordLabel,
        content: (
          <div>
            <VoiceRecorder
              mode={recordingMode}
              onModeChange={setRecordingMode}
              disabled={controlsDisabled}
            />
            {recordingMode === 'with-lyrics' && (
              <ChantLyricsLearningPanel
                entryId={payload.entryId}
                lyricsGez={payload.lyricsGez}
                transliterationLyrics={payload.transliterationLyrics}
                showMemorizationTipsCallout={false}
              />
            )}
            {recordingMode === 'from-memory' && (
              <div className={styles.memoryMode}>
                <h4 className={styles.memoryTitle}>Practice from Memory</h4>
                <p className={styles.memoryDescription}>
                  Practice reciting {payload.title} from memory. The lyrics are hidden so you can listen and recall
                  without reading.
                </p>
                <p className={styles.memoryHint}>
                  Switch to "With Lyrics" mode if you need to review the text.
                </p>
              </div>
            )}
          </div>
        ),
      },
    ],
    [payload, memorizeLabel, recordLabel, recordingMode, controlsDisabled],
  )

  return (
    <div className={styles.shell}>
      <header className={styles.topBar}>
        <button type="button" className={styles.back} onClick={onBack}>
          {t('playerBack')}
        </button>
        <div className={styles.titleBlock}>
          <p className={styles.nowPlaying}>{t('practiceChantNowPlaying')}</p>
          <span className={styles.badge}>{formLabel}</span>
          <h1 className={styles.title}>{payload.title}</h1>
          {payload.transliterationTitle ? (
            <p className={styles.sub}>{payload.transliterationTitle}</p>
          ) : null}
        </div>
      </header>

      <div className={styles.layout}>
        <div className={styles.videoColumn}>
          <div
            id="chant-practice-scroll-target"
            tabIndex={-1}
            className={styles.scrollLandmark}
            aria-label={t('practiceChantVideoLandmark')}
          />
          <section
            className={styles.playerBlock}
            role="region"
            aria-label={t('practicePlayerRegionAria')}
          >
            <div className={styles.videoShell}>
              {videoId ? (
                <div ref={mountRef} className={styles.playerMount} />
              ) : (
                <div className={styles.noVideo}>
                  <p className={styles.noVideoText}>
                    No YouTube link is set for this chant. Lyrics are still available
                    beside this panel.
                  </p>
                  {payload.watchUrl ? (
                    <a
                      className={styles.watchLink}
                      href={payload.watchUrl}
                      target="_blank"
                      rel="noreferrer"
                    >
                      Open video on YouTube
                    </a>
                  ) : null}
                </div>
              )}
            </div>

            <ChantPlayerControls
              disabled={controlsDisabled}
              isPlaying={isPlaying}
              currentTimeSec={currentTimeSec}
              durationSec={durationSec}
              onTogglePlay={togglePlay}
              volume={volume}
              onVolumeChange={onVolumeChange}
              rate={rate}
              onRateChange={onRateChange}
              onSkipBack={() => skipBy(-5)}
              onSkipForward={() => skipBy(5)}
              onSeek={seekTo}
            />
          </section>

          <div className={styles.loopAside}>
            <ChantLoopControls
              disabled={controlsDisabled}
              loopStart={loopStart}
              loopEnd={loopEnd}
              loopPlaying={loopPlaying}
              loopError={loopError}
              formatTime={formatChantTime}
              onMarkStart={markStart}
              onMarkEnd={markEnd}
              onPlayLoop={playLoop}
              onStopLoop={stopLoop}
              onClearLoop={clearLoop}
              savedSections={savedLoopSections}
              onSaveSection={saveLoopSection}
              onPlaySavedSection={playSavedLoopSection}
              onLoadSavedSection={loadSavedLoopSectionIntoMarks}
              onDeleteSavedSection={deleteSavedLoopSection}
              onRenameSavedSection={renameSavedLoopSection}
              autoSplitSections={autoSplitSections}
              splitHighlight={splitHighlight}
              onSelectAutoSection={handleSelectAutoSection}
            />
          </div>
        </div>

        <div className={styles.readColumn}>
          {payload.entryId.startsWith('custom:') && payload.learning?.meaning ? (
            <div className={styles.practiceNotes}>
              <p className={styles.practiceNotesLabel}>Your notes</p>
              <p className={styles.practiceNotesText}>{payload.learning.meaning}</p>
            </div>
          ) : null}
          <TabPanel
            variant="compact"
            tablistAriaLabel={t('practiceChantPlayerTabsAria')}
            tabs={learningTabs}
            initialId="memorize"
            scrollPanelIntoViewOnTabChange={false}
          />
        </div>
      </div>
    </div>
  )
}
