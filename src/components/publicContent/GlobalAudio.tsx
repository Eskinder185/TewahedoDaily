import { useEffect, useRef, useState, type ReactNode } from 'react'
import { Link } from 'react-router-dom'
import { AudioContext } from '../../lib/publicContent/audio'
import { publicMedia, type MezmurCard } from '../../lib/publicContent/service'
import { Artwork } from './PublicUi'
import s from './PublicContent.module.css'
export function GlobalAudio({ children }: { children: ReactNode }) {
  const [track, setTrack] = useState<MezmurCard | null>(null)
  const [playlist, setPlaylist] = useState<MezmurCard[]>([])
  const [source, setSource] = useState('')
  const [error, setError] = useState('')
  const [volume, setVolume] = useState(1)
  const audio = useRef<HTMLAudioElement>(null)
  const generation = useRef(0)
  function stop() {
    generation.current++
    audio.current?.pause()
    setTrack(null)
    setSource('')
    setError('')
  }
  function play(next: MezmurCard, queue: MezmurCard[] = []) {
    const request = ++generation.current
    audio.current?.pause()
    setSource('')
    setTrack(next)
    setPlaylist(queue.filter((item) => item.audio_url))
    setError('')
    void publicMedia(next.audio_url)
      .then((url) => {
        if (request === generation.current) setSource(url)
      })
      .catch(() => {
        if (request === generation.current)
          setError('Audio could not load. Please retry.')
      })
  }
  useEffect(() => {
    if (!source || !audio.current) return
    void audio.current
      .play()
      .catch(() => setError('Press play to start listening.'))
  }, [source])
  const index = track ? playlist.findIndex((item) => item.id === track.id) : -1
  function move(offset: number) {
    const next = playlist[index + offset]
    if (next) play(next, playlist)
  }
  return (
    <AudioContext.Provider value={{ play, stop }}>
      {children}
      {track && (
        <aside className={s.player} aria-label="Persistent audio player">
          <Artwork reference={track.thumbnail_url} />
          <Link to={`/practice/mezmur/${track.slug}`}>
            <strong>{track.title}</strong>
            <br />
            {track.singer_name || 'Mezmur'}
          </Link>
          {playlist.length > 1 && (
            <>
              <button disabled={index <= 0} onClick={() => move(-1)}>
                Previous
              </button>
              <button
                disabled={index < 0 || index >= playlist.length - 1}
                onClick={() => move(1)}
              >
                Next
              </button>
            </>
          )}
          <audio
            ref={audio}
            controls
            preload="metadata"
            src={source || undefined}
            onEnded={() => move(1)}
            onError={() =>
              setError('Audio unavailable. Retry to refresh the link.')
            }
            onPlay={() => setError('')}
            onVolumeChange={() => setVolume(audio.current?.volume ?? 1)}
            aria-label={`Audio: ${track.title}`}
          />
          <label>
            Volume{' '}
            <input
              type="range"
              min="0"
              max="1"
              step="0.05"
              value={volume}
              onChange={(event) => {
                const value = Number(event.target.value)
                setVolume(value)
                if (audio.current) audio.current.volume = value
              }}
            />
          </label>
          {error && (
            <span role="status">
              {error}{' '}
              <button onClick={() => play(track, playlist)}>Retry audio</button>
            </span>
          )}
          <button onClick={stop} aria-label="Close audio player">
            Close
          </button>
        </aside>
      )}
    </AudioContext.Provider>
  )
}
