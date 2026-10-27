/**
 * TEWAHEDODAILY — PERSISTENT MINI PLAYER
 *
 * Bottom-docked player that persists hymn audio across route navigation.
 */

import { Link } from 'react-router-dom'
import { usePlayer } from '../../lib/mezmur/playerContext'
import styles from './PersistentMiniPlayer.module.css'

function formatSeconds(secs: number): string {
  if (!Number.isFinite(secs) || secs < 0) return '0:00'
  const m = Math.floor(secs / 60)
  const s = Math.floor(secs % 60)
  return `${m}:${s < 10 ? '0' : ''}${s}`
}

export function PersistentMiniPlayer() {
  const {
    currentTrack,
    isPlaying,
    currentTime,
    duration,
    togglePlay,
    seek,
    previous,
    next,
    queue,
    volume,
    setVolume,
    isMuted,
    toggleMute,
    playbackSpeed,
    setSpeed,
    repeatMode,
    setRepeatMode,
  } = usePlayer()

  if (!currentTrack || !currentTrack.audioUrl) {
    return null
  }

  const cycleSpeed = () => {
    const speeds = [0.75, 1, 1.25, 1.5]
    const nextIdx = (speeds.indexOf(playbackSpeed) + 1) % speeds.length
    setSpeed(speeds[nextIdx])
  }

  const cycleRepeat = () => {
    if (repeatMode === 'none') setRepeatMode('all')
    else if (repeatMode === 'all') setRepeatMode('one')
    else setRepeatMode('none')
  }

  return (
    <aside className={styles.miniPlayerDock} aria-label="Persistent Hymn Player">
      <div className={styles.inner}>
        {/* Track info and link */}
        <Link to={`/practice/mezmur/${currentTrack.slug}`} className={styles.trackInfo}>
          {currentTrack.thumbnailUrl ? (
            <img
              src={currentTrack.thumbnailUrl}
              alt=""
              className={styles.thumbnail}
            />
          ) : (
            <div className={styles.thumbnail} />
          )}
          <div className={styles.textMeta}>
            <p className={styles.title}>{currentTrack.title}</p>
            <p className={styles.subtitle}>
              {currentTrack.titleAmharic ? `${currentTrack.titleAmharic} · ` : ''}
              {currentTrack.singerName || 'Tewahedo Zemari'}
            </p>
          </div>
        </Link>

        {/* Center player controls */}
        <div className={styles.centerControls}>
          <div className={styles.buttons}>
            <button
              type="button"
              className={styles.iconBtn}
              onClick={cycleRepeat}
              title={`Repeat: ${repeatMode}`}
              aria-label={`Repeat mode: ${repeatMode}`}
            >
              {repeatMode === 'one' ? '🔂' : repeatMode === 'all' ? '🔁' : '➡️'}
            </button>
            <button
              type="button"
              className={styles.iconBtn}
              onClick={previous}
              aria-label="Previous Hymn"
              disabled={queue.length <= 1}
            >
              ⏮
            </button>
            <button
              type="button"
              className={`${styles.iconBtn} ${styles.playBtn}`}
              onClick={togglePlay}
              aria-label={isPlaying ? 'Pause' : 'Play'}
            >
              {isPlaying ? '⏸' : '▶'}
            </button>
            <button
              type="button"
              className={styles.iconBtn}
              onClick={next}
              aria-label="Next Hymn"
              disabled={queue.length <= 1}
            >
              ⏭
            </button>
          </div>

          <div className={styles.progressRow}>
            <span>{formatSeconds(currentTime)}</span>
            <input
              type="range"
              min="0"
              max={duration || 100}
              step="0.5"
              value={currentTime}
              onChange={(e) => seek(parseFloat(e.target.value))}
              className={styles.seekSlider}
              aria-label="Seek playback position"
            />
            <span>{formatSeconds(duration)}</span>
          </div>
        </div>

        {/* Right audio controls */}
        <div className={styles.rightControls}>
          <button
            type="button"
            className={styles.speedBadge}
            onClick={cycleSpeed}
            title="Playback speed"
            aria-label={`Playback speed: ${playbackSpeed}x`}
          >
            {playbackSpeed}x
          </button>
          <button
            type="button"
            className={styles.iconBtn}
            onClick={toggleMute}
            aria-label={isMuted ? 'Unmute' : 'Mute'}
          >
            {isMuted ? '🔇' : '🔊'}
          </button>
          <input
            type="range"
            min="0"
            max="1"
            step="0.05"
            value={isMuted ? 0 : volume}
            onChange={(e) => setVolume(parseFloat(e.target.value))}
            className={styles.volumeSlider}
            aria-label="Volume slider"
          />
        </div>
      </div>
    </aside>
  )
}
