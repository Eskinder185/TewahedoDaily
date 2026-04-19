import { useEffect, useId, useMemo, useRef, useState } from 'react'
import styles from './PrayerMediaPlayer.module.css'

type PrayerMark = {
  id: string
  seconds: number
}

type PrayerPlayerSettings = {
  volume: number
  loop: boolean
}

type YoutubePlayer = YT.Player & {
  isMuted(): boolean
  mute(): void
  unMute(): void
}

type Props = {
  title: string
  youtubeId: string
  marksStorageKey: string
  settingsStorageKey: string
}

const DEFAULT_VOLUME = 80
const DEFAULT_SPEED = 1
const SPEED_OPTIONS = [0.75, 1, 1.25, 1.5]

let youtubeApiPromise: Promise<void> | null = null

function loadYouTubeIframeApi() {
  if (typeof window === 'undefined') return Promise.resolve()
  if (window.YT?.Player) return Promise.resolve()

  if (!youtubeApiPromise) {
    youtubeApiPromise = new Promise<void>((resolve) => {
      const prior = window.onYouTubeIframeAPIReady
      window.onYouTubeIframeAPIReady = () => {
        prior?.()
        resolve()
      }

      const existing = document.querySelector<HTMLScriptElement>(
        'script[src="https://www.youtube.com/iframe_api"]',
      )
      if (existing) return

      const script = document.createElement('script')
      script.src = 'https://www.youtube.com/iframe_api'
      script.async = true
      document.head.appendChild(script)
    })
  }

  return youtubeApiPromise
}

function readMarks(storageKey: string) {
  if (typeof window === 'undefined') return [] as PrayerMark[]
  try {
    const raw = window.localStorage.getItem(storageKey)
    if (!raw) return []
    const parsed = JSON.parse(raw) as PrayerMark[]
    return parsed
      .filter((mark) => Number.isFinite(mark.seconds))
      .sort((a, b) => a.seconds - b.seconds)
  } catch {
    return []
  }
}

function readSettings(storageKey: string): PrayerPlayerSettings {
  if (typeof window === 'undefined') {
    return { volume: DEFAULT_VOLUME, loop: false }
  }

  try {
    const raw = window.localStorage.getItem(storageKey)
    if (!raw) return { volume: DEFAULT_VOLUME, loop: false }
    const parsed = JSON.parse(raw) as Partial<PrayerPlayerSettings>
    return {
      volume:
        typeof parsed.volume === 'number'
          ? Math.max(0, Math.min(100, Math.round(parsed.volume)))
          : DEFAULT_VOLUME,
      loop: Boolean(parsed.loop),
    }
  } catch {
    return { volume: DEFAULT_VOLUME, loop: false }
  }
}

function formatTime(totalSeconds: number) {
  const safe = Math.max(0, Math.floor(totalSeconds))
  const hours = Math.floor(safe / 3600)
  const minutes = Math.floor((safe % 3600) / 60)
  const seconds = safe % 60

  if (hours > 0) {
    return `${String(hours).padStart(2, '0')}:${String(minutes).padStart(
      2,
      '0',
    )}:${String(seconds).padStart(2, '0')}`
  }

  return `${String(minutes).padStart(2, '0')}:${String(seconds).padStart(2, '0')}`
}

export function PrayerMediaPlayer({
  title,
  youtubeId,
  marksStorageKey,
  settingsStorageKey,
}: Props) {
  const playerHostId = useId()
  const playerRef = useRef<YoutubePlayer | null>(null)
  const intervalRef = useRef<number | null>(null)
  const settings = useMemo(() => readSettings(settingsStorageKey), [settingsStorageKey])
  const [marks, setMarks] = useState<PrayerMark[]>(() => readMarks(marksStorageKey))
  const [volume, setVolume] = useState(settings.volume)
  const [loop, setLoop] = useState(settings.loop)
  const [speed, setSpeed] = useState(DEFAULT_SPEED)
  const [ready, setReady] = useState(false)
  const [playing, setPlaying] = useState(false)
  const [muted, setMuted] = useState(false)
  const [duration, setDuration] = useState(0)
  const [currentTime, setCurrentTime] = useState(0)
  const [copied, setCopied] = useState(false)
  const [error, setError] = useState<string | null>(null)

  useEffect(() => {
    if (typeof window === 'undefined') return
    window.localStorage.setItem(marksStorageKey, JSON.stringify(marks))
  }, [marks, marksStorageKey])

  useEffect(() => {
    if (typeof window === 'undefined') return
    window.localStorage.setItem(
      settingsStorageKey,
      JSON.stringify({
        volume,
        loop,
      } satisfies PrayerPlayerSettings),
    )
  }, [loop, settingsStorageKey, volume])

  useEffect(() => {
    let mounted = true

    loadYouTubeIframeApi()
      .then(() => {
        if (!mounted || !window.YT?.Player) return
        const node = document.getElementById(playerHostId)
        if (!node) return

        playerRef.current?.destroy()
        playerRef.current = new window.YT.Player(playerHostId, {
          videoId: youtubeId,
          playerVars: {
            playsinline: 1,
            rel: 0,
            modestbranding: 1,
          },
          events: {
            onReady: (event) => {
              if (!mounted) return
              const player = event.target as YoutubePlayer
              player.setVolume(volume)
              player.setPlaybackRate(speed)
              setMuted(player.isMuted())
              setDuration(player.getDuration())
              setReady(true)
              setError(null)
            },
            onStateChange: (event) => {
              if (!mounted || !window.YT?.PlayerState) return
              const player = event.target as YoutubePlayer
              const state = event.data
              setPlaying(state === window.YT.PlayerState.PLAYING)
              if (state === window.YT.PlayerState.ENDED) {
                if (loop) {
                  player.seekTo(0, true)
                  player.playVideo()
                } else {
                  setCurrentTime(player.getDuration())
                }
              }
            },
            onError: () => {
              if (!mounted) return
              setError('The video could not be loaded right now.')
            },
          },
        }) as YoutubePlayer
      })
      .catch(() => {
        if (mounted) setError('The video player could not be initialized.')
      })

    return () => {
      mounted = false
      if (intervalRef.current !== null) {
        window.clearInterval(intervalRef.current)
      }
      playerRef.current?.destroy()
      playerRef.current = null
    }
  }, [playerHostId, youtubeId])

  useEffect(() => {
    if (!ready) return
    playerRef.current?.setVolume(volume)
  }, [ready, volume])

  useEffect(() => {
    if (!ready) return
    playerRef.current?.setPlaybackRate(speed)
  }, [ready, speed])

  useEffect(() => {
    if (typeof window === 'undefined') return

    intervalRef.current = window.setInterval(() => {
      const player = playerRef.current
      if (!player || !ready) return

      const nextTime = player.getCurrentTime()
      const nextDuration = player.getDuration()
      if (Number.isFinite(nextTime)) setCurrentTime(nextTime)
      if (Number.isFinite(nextDuration) && nextDuration > 0) {
        setDuration(nextDuration)
      }
      setMuted(player.isMuted())
    }, 400)

    return () => {
      if (intervalRef.current !== null) {
        window.clearInterval(intervalRef.current)
        intervalRef.current = null
      }
    }
  }, [ready])

  const seekTo = (seconds: number) => {
    const player = playerRef.current
    if (!player) return
    player.seekTo(seconds, true)
    setCurrentTime(seconds)
  }

  const handleTogglePlay = () => {
    const player = playerRef.current
    if (!player) return
    if (playing) player.pauseVideo()
    else player.playVideo()
  }

  const handleVolumeChange = (nextVolume: number) => {
    const player = playerRef.current
    setVolume(nextVolume)
    if (!player) return
    player.setVolume(nextVolume)
    if (nextVolume <= 0) {
      player.mute()
      setMuted(true)
    } else if (player.isMuted()) {
      player.unMute()
      setMuted(false)
    }
  }

  const handleMuteToggle = () => {
    const player = playerRef.current
    if (!player) return
    if (player.isMuted()) {
      player.unMute()
      setMuted(false)
      if (volume === 0) {
        handleVolumeChange(DEFAULT_VOLUME)
      }
    } else {
      player.mute()
      setMuted(true)
    }
  }

  const handleLoopToggle = () => {
    setLoop((current) => !current)
  }

  const handleSpeedChange = (nextSpeed: number) => {
    setSpeed(nextSpeed)
    playerRef.current?.setPlaybackRate(nextSpeed)
  }

  const handleMarkCurrent = () => {
    const seconds = Math.floor(playerRef.current?.getCurrentTime() ?? currentTime)
    const nextMark: PrayerMark = {
      id: `${seconds}-${Date.now()}`,
      seconds,
    }

    setMarks((current) =>
      [...current, nextMark].sort((a, b) => a.seconds - b.seconds),
    )
  }

  const handleDeleteMark = (id: string) => {
    setMarks((current) => current.filter((mark) => mark.id !== id))
  }

  const handleRestart = () => {
    seekTo(0)
    playerRef.current?.pauseVideo()
    setPlaying(false)
  }

  const handleCopyLink = async () => {
    if (typeof window === 'undefined' || !navigator.clipboard) return
    try {
      await navigator.clipboard.writeText(window.location.href)
      setCopied(true)
      window.setTimeout(() => setCopied(false), 1600)
    } catch {
      setCopied(false)
    }
  }

  const progressPercent = duration > 0 ? (currentTime / duration) * 100 : 0

  return (
    <div className={styles.root}>
      <div className={styles.videoCard}>
        <div className={styles.videoShell}>
          <div id={playerHostId} className={styles.playerHost} />
        </div>

        <div className={styles.controls}>
          <div className={styles.primaryControls}>
            <button
              type="button"
              className={styles.controlBtn}
              onClick={handleTogglePlay}
              disabled={!ready}
            >
              {playing ? 'Pause' : 'Play'}
            </button>
            <button
              type="button"
              className={styles.controlBtn}
              onClick={handleMuteToggle}
              disabled={!ready}
            >
              {muted ? 'Unmute' : 'Mute'}
            </button>
            <button
              type="button"
              className={`${styles.controlBtn} ${loop ? styles.controlBtnActive : ''}`}
              onClick={handleLoopToggle}
            >
              {loop ? 'Loop on' : 'Loop off'}
            </button>
            <button
              type="button"
              className={styles.controlBtn}
              onClick={handleRestart}
              disabled={!ready}
            >
              Restart
            </button>
            <button
              type="button"
              className={styles.controlBtn}
              onClick={handleMarkCurrent}
              disabled={!ready}
            >
              Mark current spot
            </button>
            <button
              type="button"
              className={styles.controlBtn}
              onClick={handleCopyLink}
            >
              {copied ? 'Link copied' : 'Copy link'}
            </button>
          </div>

          <label className={styles.progressBlock}>
            <span className={styles.controlLabel}>Progress</span>
            <input
              className={styles.range}
              type="range"
              min={0}
              max={Math.max(duration, 0)}
              step={1}
              value={Math.min(currentTime, duration || 0)}
              onChange={(event) => seekTo(Number(event.target.value))}
              disabled={!ready || duration <= 0}
              aria-label={`Seek ${title}`}
            />
            <span className={styles.timeRow}>
              <span>{formatTime(currentTime)}</span>
              <span>{formatTime(duration)}</span>
            </span>
            <span className={styles.progressBar} aria-hidden>
              <span
                className={styles.progressFill}
                style={{ width: `${Math.min(progressPercent, 100)}%` }}
              />
            </span>
          </label>

          <div className={styles.secondaryControls}>
            <label className={styles.sliderBlock}>
              <span className={styles.controlLabel}>Volume</span>
              <input
                className={styles.range}
                type="range"
                min={0}
                max={100}
                step={1}
                value={volume}
                onChange={(event) => handleVolumeChange(Number(event.target.value))}
                aria-label={`Volume for ${title}`}
              />
            </label>

            <label className={styles.speedBlock}>
              <span className={styles.controlLabel}>Speed</span>
              <select
                className={styles.select}
                value={String(speed)}
                onChange={(event) => handleSpeedChange(Number(event.target.value))}
                disabled={!ready}
                aria-label={`Playback speed for ${title}`}
              >
                {SPEED_OPTIONS.map((option) => (
                  <option key={option} value={option}>
                    {option}x
                  </option>
                ))}
              </select>
            </label>
          </div>
        </div>

        {error ? <p className={styles.error}>{error}</p> : null}
        {!ready && !error ? (
          <p className={styles.meta}>
            Loading the zema player for <span lang="am">{title}</span>.
          </p>
        ) : null}
      </div>

      <section className={styles.marksCard} aria-labelledby={`${playerHostId}-marks`}>
        <div className={styles.sectionHead}>
          <div>
            <h2 id={`${playerHostId}-marks`} className={styles.sectionTitle}>
              Saved marks
            </h2>
            <p className={styles.sectionBody}>
              Save a timestamp when you want to return to a phrase, cadence, or repeated
              practice point.
            </p>
          </div>
        </div>

        {marks.length === 0 ? (
          <p className={styles.empty}>
            No marks saved yet. Use <strong>Mark current spot</strong> while listening.
          </p>
        ) : (
          <ul className={styles.markList}>
            {marks.map((mark, index) => (
              <li key={mark.id} className={styles.markItem}>
                <button
                  type="button"
                  className={styles.markJump}
                  onClick={() => seekTo(mark.seconds)}
                >
                  Mark {index + 1} - {formatTime(mark.seconds)}
                </button>
                <button
                  type="button"
                  className={styles.markDelete}
                  onClick={() => handleDeleteMark(mark.id)}
                  aria-label={`Remove mark ${index + 1}`}
                >
                  Remove
                </button>
              </li>
            ))}
          </ul>
        )}
      </section>
    </div>
  )
}
