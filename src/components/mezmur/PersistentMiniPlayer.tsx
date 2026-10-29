import { useState } from 'react'
import { Link } from 'react-router-dom'
import { useAuth } from '../../lib/auth/useAuth'
import { usePlayer, type SleepTimerOption } from '../../lib/mezmur/playerContext'
import type { PlayableHymn } from '../../lib/mezmur/playlistService'
import { detail } from '../../lib/publicContent/service'
import { listFavorites } from '../../lib/userContent/favoritesService'
import styles from './PersistentMiniPlayer.module.css'

function formatSeconds(secs: number): string {
  if (!Number.isFinite(secs) || secs < 0) return '0:00'
  const minutes = Math.floor(secs / 60)
  const seconds = Math.floor(secs % 60)
  return `${minutes}:${seconds < 10 ? '0' : ''}${seconds}`
}

export function PersistentMiniPlayer() {
  const player = usePlayer()
  const { user } = useAuth()
  const [expanded, setExpanded] = useState(false)
  const [favoritesMessage, setFavoritesMessage] = useState('')
  const { currentTrack, isPlaying, currentTime, duration, queue, queueIndex } = player
  if (!currentTrack || !currentTrack.audioUrl) return null

  const cycleRepeat = () => player.setRepeatMode(
    player.repeatMode === 'none' ? 'all' : player.repeatMode === 'all' ? 'one' : 'none',
  )
  const cycleSpeed = () => {
    const speeds = [0.75, 1, 1.25, 1.5, 2]
    player.setSpeed(speeds[(speeds.indexOf(player.playbackSpeed) + 1) % speeds.length])
  }
  async function playFavorites() {
    setFavoritesMessage('Loading favorites…')
    const result = await listFavorites(user?.id)
    const favorites = result.items.filter((item) => item.contentType === 'mezmur' && item.contentSlug)
    const records = await Promise.all(favorites.map((item) => detail(item.contentSlug!)))
    const tracks: PlayableHymn[] = records.filter((item) => item?.audio_url).map((item) => ({
      id: item!.id, slug: item!.slug, title: item!.title, titleAmharic: item!.title_amharic,
      singerName: item!.singer_name, audioUrl: item!.audio_url, youtubeUrl: item!.youtube_url,
      thumbnailUrl: item!.thumbnail_url, category: item!.category_name || item!.category,
      occasion: item!.occasion,
    }))
    if (!tracks.length) { setFavoritesMessage(result.error || 'No playable Mezmurs are saved in Favorites.'); return }
    player.play(tracks[0], tracks, { key: 'favorites', label: 'Favorites', href: '/account/favorites' })
    setFavoritesMessage(`${tracks.length} favorite${tracks.length === 1 ? '' : 's'} queued.`)
  }

  return (
    <aside className={styles.miniPlayerDock} aria-label="Persistent Mezmur player">
      {expanded && (
        <section id="mezmur-player-queue" className={styles.expandedPanel} aria-label="Queue and playback settings">
          <div className={styles.queueHeader}>
            <div><strong>Up Next</strong><small>{player.queueContext?.label || 'Current queue'} · {queue.length} tracks</small></div>
            <button type="button" className={styles.textButton} onClick={() => void playFavorites()}>Play Favorites</button>
          </div>
          {favoritesMessage && <p className={styles.status} role="status">{favoritesMessage}</p>}
          <div className={styles.settingsRow}>
            <button type="button" className={player.shuffle ? styles.activeControl : styles.textButton} onClick={player.toggleShuffle} aria-pressed={player.shuffle}>Shuffle</button>
            <button type="button" className={styles.textButton} onClick={cycleRepeat}>Repeat: {player.repeatMode}</button>
            <label className={styles.checkLabel}><input type="checkbox" checked={player.autoplayNext} onChange={(event) => player.setAutoplayNext(event.target.checked)} /> Auto-play next</label>
            <label>Sleep <select value={player.sleepTimer ?? ''} onChange={(event) => player.setSleepTimer((event.target.value === 'end' ? 'end' : event.target.value ? Number(event.target.value) : null) as SleepTimerOption)}><option value="">Off</option><option value="15">15 min</option><option value="30">30 min</option><option value="45">45 min</option><option value="60">60 min</option><option value="end">End of track</option></select></label>
            <button type="button" className={styles.textButton} onClick={player.clearQueue}>Close player</button>
          </div>
          <ol className={styles.queueList}>
            {queue.map((track, index) => (
              <li key={`${track.id}-${index}`} className={index === queueIndex ? styles.currentQueueItem : undefined}>
                <button type="button" className={styles.queueTrack} onClick={() => player.selectQueueItem(index)} aria-current={index === queueIndex ? 'true' : undefined}>
                  <span>{index === queueIndex ? (isPlaying ? '▶' : '❚❚') : index + 1}</span><span><strong>{track.titleAmharic || track.title}</strong><small>{track.singerName || 'Mezmur'}</small></span>
                </button>
                {index !== queueIndex && <span className={styles.queueActions}><button type="button" onClick={() => player.playNext(track)} aria-label={`Play ${track.title} next`}>Next</button><button type="button" onClick={() => player.moveQueueItem(index, Math.max(queueIndex + 1, index - 1))} aria-label={`Move ${track.title} up`}>↑</button><button type="button" onClick={() => player.moveQueueItem(index, Math.min(queue.length - 1, index + 1))} aria-label={`Move ${track.title} down`}>↓</button><button type="button" onClick={() => player.removeFromQueue(index)} aria-label={`Remove ${track.title}`}>×</button></span>}
              </li>
            ))}
          </ol>
          {!!player.history.length && <details className={styles.history}><summary>Recently played ({player.history.length})</summary>{player.history.map((track) => <Link key={`${track.id}-${track.slug}`} to={`/hymns/mezmur/${track.slug}`}>{track.titleAmharic || track.title}</Link>)}</details>}
        </section>
      )}
      <div className={styles.inner}>
        <Link to={`/hymns/mezmur/${currentTrack.slug}`} className={styles.trackInfo}>
          {currentTrack.thumbnailUrl ? <img src={currentTrack.thumbnailUrl} alt="" className={styles.thumbnail} /> : <div className={styles.thumbnail} />}
          <div className={styles.textMeta}><p className={styles.title}>{currentTrack.title}</p><p className={styles.subtitle}>{currentTrack.titleAmharic ? `${currentTrack.titleAmharic} · ` : ''}{currentTrack.singerName || 'Tewahedo Zemari'}</p></div>
        </Link>
        <div className={styles.centerControls}>
          <div className={styles.buttons}>
            <button type="button" className={styles.iconBtn} onClick={cycleRepeat} aria-label={`Repeat mode: ${player.repeatMode}`}>{player.repeatMode === 'one' ? '🔂' : player.repeatMode === 'all' ? '🔁' : '➡️'}</button>
            <button type="button" className={styles.iconBtn} onClick={player.previous} aria-label="Previous Mezmur" disabled={queue.length <= 1}>⏮</button>
            <button type="button" className={`${styles.iconBtn} ${styles.playBtn}`} onClick={player.togglePlay} aria-label={isPlaying ? 'Pause' : 'Play'}>{isPlaying ? '⏸' : '▶'}</button>
            <button type="button" className={styles.iconBtn} onClick={player.next} aria-label="Next Mezmur" disabled={queue.length <= 1}>⏭</button>
          </div>
          <div className={styles.progressRow}><span>{formatSeconds(currentTime)}</span><input type="range" min="0" max={duration || 100} step="0.5" value={currentTime} onChange={(event) => player.seek(Number(event.target.value))} className={styles.seekSlider} aria-label="Seek playback position" /><span>{formatSeconds(duration)}</span></div>
          {player.error && <span className={styles.error} role="status">{player.error} <button type="button" onClick={player.retry}>Retry</button></span>}
        </div>
        <div className={styles.rightControls}>
          <button type="button" className={styles.speedBadge} onClick={cycleSpeed} aria-label={`Playback speed: ${player.playbackSpeed}x`}>{player.playbackSpeed}x</button>
          <button type="button" className={styles.iconBtn} onClick={player.toggleMute} aria-label={player.isMuted ? 'Unmute' : 'Mute'}>{player.isMuted ? '🔇' : '🔊'}</button>
          <input type="range" min="0" max="1" step="0.05" value={player.isMuted ? 0 : player.volume} onChange={(event) => player.setVolume(Number(event.target.value))} className={styles.volumeSlider} aria-label="Volume" />
        </div>
        <button type="button" className={styles.expandButton} onClick={() => setExpanded((value) => !value)} aria-expanded={expanded} aria-controls="mezmur-player-queue">{expanded ? 'Hide' : `Queue ${queue.length}`}</button>
      </div>
    </aside>
  )
}
