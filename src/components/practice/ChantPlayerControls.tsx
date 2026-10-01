import { useId, useRef, useState } from 'react'
import { PRACTICE_SPEEDS } from '../../lib/practice/practicePrefs'
import { formatChantTime } from './chantPracticeModel'
import styles from './ChantPlayerControls.module.css'

type ChantPlayerControlsProps = {
  disabled: boolean
  isPlaying: boolean
  currentTimeSec: number
  durationSec: number
  onTogglePlay: () => void
  volume: number
  onVolumeChange: (value: number) => void
  muted?: boolean
  onToggleMute?: () => void
  rate: number
  onRateChange: (value: number) => void
  onSkipBack: () => void
  onSkipForward: () => void
  onRestart?: () => void
  onSeek: (value: number) => void
  onPrevSection?: () => void
  onNextSection?: () => void
  loopStart?: number | null
  loopEnd?: number | null
  sectionMarks?: { start: number; end: number }[]
  compact?: boolean
}

export function ChantPlayerControls({
  disabled,
  isPlaying,
  currentTimeSec,
  durationSec,
  onTogglePlay,
  volume,
  onVolumeChange,
  muted = false,
  onToggleMute,
  rate,
  onRateChange,
  onSkipBack,
  onSkipForward,
  onRestart,
  onSeek,
  onPrevSection,
  onNextSection,
  loopStart = null,
  loopEnd = null,
  sectionMarks = [],
  compact = false,
}: ChantPlayerControlsProps) {
  const timelineId = useId()
  const volId = useId()
  const speedId = useId()
  const trackRef = useRef<HTMLDivElement>(null)
  const [hoverRatio, setHoverRatio] = useState<number | null>(null)
  const hasDuration = Number.isFinite(durationSec) && durationSec > 0
  const clampedNow = hasDuration
    ? Math.max(0, Math.min(durationSec, currentTimeSec))
    : 0
  const progress = hasDuration ? (clampedNow / durationSec) * 100 : 0
  const loopLeft =
    hasDuration && loopStart != null ? (loopStart / durationSec) * 100 : null
  const loopWidth =
    hasDuration && loopStart != null && loopEnd != null && loopEnd > loopStart
      ? ((loopEnd - loopStart) / durationSec) * 100
      : null

  const seekFromClientX = (clientX: number) => {
    if (!hasDuration || !trackRef.current) return
    const rect = trackRef.current.getBoundingClientRect()
    const ratio = Math.max(0, Math.min(1, (clientX - rect.left) / rect.width))
    onSeek(ratio * durationSec)
  }

  return (
    <div className={`${styles.root} ${compact ? styles.compact : ''}`}>
      <div className={styles.times}>
        <span>{formatChantTime(clampedNow)}</span>
        <span>{formatChantTime(hasDuration ? durationSec : null)}</span>
      </div>

      <div
        ref={trackRef}
        className={styles.track}
        role="slider"
        tabIndex={disabled || !hasDuration ? -1 : 0}
        aria-label="Playback timeline"
        aria-valuemin={0}
        aria-valuemax={hasDuration ? Math.floor(durationSec) : 0}
        aria-valuenow={Math.floor(clampedNow)}
        aria-disabled={disabled || !hasDuration}
        id={timelineId}
        onPointerDown={(event) => {
          if (disabled || !hasDuration) return
          trackRef.current?.setPointerCapture(event.pointerId)
          seekFromClientX(event.clientX)
        }}
        onPointerMove={(event) => {
          if (!trackRef.current || !hasDuration) return
          const rect = trackRef.current.getBoundingClientRect()
          setHoverRatio(Math.max(0, Math.min(1, (event.clientX - rect.left) / rect.width)))
          if (trackRef.current.hasPointerCapture(event.pointerId)) {
            seekFromClientX(event.clientX)
          }
        }}
        onPointerUp={(event) => {
          trackRef.current?.releasePointerCapture(event.pointerId)
        }}
        onPointerLeave={() => setHoverRatio(null)}
        onKeyDown={(event) => {
          if (disabled || !hasDuration) return
          if (event.key === 'ArrowLeft') {
            event.preventDefault()
            onSeek(Math.max(0, clampedNow - 5))
          }
          if (event.key === 'ArrowRight') {
            event.preventDefault()
            onSeek(Math.min(durationSec, clampedNow + 5))
          }
        }}
      >
        <div className={styles.trackBg} />
        {sectionMarks.map((mark, index) =>
          hasDuration ? (
            <span
              key={`${mark.start}-${index}`}
              className={styles.sectionMark}
              style={{ left: `${(mark.start / durationSec) * 100}%` }}
            />
          ) : null,
        )}
        {loopLeft != null && loopWidth != null ? (
          <div
            className={styles.loopRegion}
            style={{ left: `${loopLeft}%`, width: `${loopWidth}%` }}
          />
        ) : null}
        <div className={styles.trackFill} style={{ width: `${progress}%` }} />
        <div className={styles.thumb} style={{ left: `${progress}%` }} />
        {hoverRatio != null && hasDuration ? (
          <span
            className={styles.hoverTip}
            style={{ left: `${hoverRatio * 100}%` }}
          >
            {formatChantTime(hoverRatio * durationSec)}
          </span>
        ) : null}
      </div>

      <div className={styles.transport} role="group" aria-label="Primary playback controls">
        <div className={styles.transportMain}>
          {onPrevSection ? (
            <button
              type="button"
              className={styles.iconBtn}
              disabled={disabled}
              onClick={onPrevSection}
              aria-label="Previous section"
            >
              <span aria-hidden="true">‹‹</span>
              <span className={styles.btnCaption}>Prev</span>
            </button>
          ) : (
            <span className={styles.transportSpacer} aria-hidden="true" />
          )}
          <button
            type="button"
            className={styles.play}
            disabled={disabled}
            onClick={onTogglePlay}
            aria-label={isPlaying ? 'Pause mezmur' : 'Play mezmur'}
          >
            {isPlaying ? '❚❚' : '▶'}
          </button>
          {onNextSection ? (
            <button
              type="button"
              className={styles.iconBtn}
              disabled={disabled}
              onClick={onNextSection}
              aria-label="Next section"
            >
              <span aria-hidden="true">››</span>
              <span className={styles.btnCaption}>Next</span>
            </button>
          ) : (
            <span className={styles.transportSpacer} aria-hidden="true" />
          )}
        </div>

        <div className={styles.transportSecondary}>
          <button
            type="button"
            className={styles.iconBtn}
            disabled={disabled}
            onClick={onSkipBack}
            aria-label="Back 10 seconds"
          >
            −10s
          </button>
          {onRestart ? (
            <button
              type="button"
              className={styles.iconBtn}
              disabled={disabled}
              onClick={onRestart}
              aria-label="Restart mezmur"
            >
              Restart
            </button>
          ) : null}
          <button
            type="button"
            className={styles.iconBtn}
            disabled={disabled}
            onClick={onSkipForward}
            aria-label="Forward 10 seconds"
          >
            +10s
          </button>
        </div>
      </div>

      <details className={styles.moreControls}>
        <summary className={styles.moreSummary}>Speed &amp; volume</summary>
        <div className={styles.secondary}>
          <div className={styles.rates} role="group" aria-label="Playback speed">
            <label className={styles.speedSelect} htmlFor={speedId}>
              <span className={styles.speedLabel}>Speed</span>
              <select
                id={speedId}
                value={String(rate)}
                disabled={disabled}
                onChange={(event) => onRateChange(Number(event.target.value))}
                aria-label="Playback speed"
              >
                {PRACTICE_SPEEDS.map((value) => (
                  <option key={value} value={value}>
                    {value === 1 ? '1×' : `${value}×`}
                  </option>
                ))}
              </select>
            </label>
            <div className={styles.rateButtons}>
              {PRACTICE_SPEEDS.map((value) => (
                <button
                  key={value}
                  type="button"
                  className={`${styles.rateBtn} ${Math.abs(rate - value) < 0.01 ? styles.rateOn : ''}`}
                  disabled={disabled}
                  aria-pressed={Math.abs(rate - value) < 0.01}
                  onClick={() => onRateChange(value)}
                >
                  {value === 1 ? '1×' : `${value}×`}
                </button>
              ))}
            </div>
          </div>
          <div className={styles.volume}>
            {onToggleMute ? (
              <button
                type="button"
                className={styles.muteBtn}
                disabled={disabled}
                onClick={onToggleMute}
                aria-label={muted || volume === 0 ? 'Unmute' : 'Mute'}
              >
                {muted || volume === 0 ? 'Unmute' : 'Mute'}
              </button>
            ) : null}
            <label className={styles.volLabel} htmlFor={volId}>
              <span className={styles.srOnly}>Volume</span>
              <input
                id={volId}
                type="range"
                min={0}
                max={100}
                value={muted ? 0 : volume}
                disabled={disabled}
                onChange={(event) => onVolumeChange(Number(event.target.value))}
              />
            </label>
          </div>
        </div>
      </details>
    </div>
  )
}
