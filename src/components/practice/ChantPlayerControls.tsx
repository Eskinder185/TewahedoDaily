import { useId } from 'react'
import { useUiLabel } from '../../lib/i18n/uiLabels'
import styles from './ChantPlayerControls.module.css'

const RATES = [0.5, 0.75, 1, 1.25] as const

type ChantPlayerControlsProps = {
  disabled: boolean
  isPlaying: boolean
  currentTimeSec: number
  durationSec: number
  onTogglePlay: () => void
  volume: number
  onVolumeChange: (value: number) => void
  rate: number
  onRateChange: (value: number) => void
  onSkipBack: () => void
  onSkipForward: () => void
  onSeek: (value: number) => void
}

export function ChantPlayerControls({
  disabled,
  isPlaying,
  currentTimeSec,
  durationSec,
  onTogglePlay,
  volume,
  onVolumeChange,
  rate,
  onRateChange,
  onSkipBack,
  onSkipForward,
  onSeek,
}: ChantPlayerControlsProps) {
  const t = useUiLabel()
  const volId = useId()
  const timelineId = useId()
  const speedLabelId = useId()
  const hasDuration = Number.isFinite(durationSec) && durationSec > 0
  const clampedNow = hasDuration
    ? Math.max(0, Math.min(durationSec, currentTimeSec))
    : 0
  const remaining = hasDuration ? Math.max(0, durationSec - clampedNow) : 0
  const fmt = (sec: number) => {
    const s = Math.max(0, Math.floor(sec))
    const m = Math.floor(s / 60)
    const r = s % 60
    return `${m}:${String(r).padStart(2, '0')}`
  }

  return (
    <div className={styles.root}>
      <div className={styles.row}>
        <label className={styles.timelineLabel} htmlFor={timelineId}>
          <span className={styles.timelineText}>Timeline</span>
          <input
            id={timelineId}
            type="range"
            className={styles.timelineRange}
            min={0}
            max={hasDuration ? Math.floor(durationSec) : 100}
            value={hasDuration ? Math.floor(clampedNow) : 0}
            disabled={disabled || !hasDuration}
            onChange={(e) => onSeek(Number(e.target.value))}
            aria-label="Playback timeline"
          />
          <span className={styles.timelineTimes}>
            <span>{fmt(clampedNow)}</span>
            <span>−{fmt(remaining)}</span>
          </span>
        </label>
      </div>

      <div className={styles.rowPrimary}>
        <button
          type="button"
          className={styles.skip}
          disabled={disabled}
          onClick={onSkipBack}
          aria-label={t('chantSkipBack')}
        >
          −5s
        </button>
        <button
          type="button"
          className={styles.play}
          disabled={disabled}
          onClick={onTogglePlay}
          aria-label={isPlaying ? t('pause') : t('play')}
        >
          {isPlaying ? t('pause') : t('play')}
        </button>
        <button
          type="button"
          className={styles.skip}
          disabled={disabled}
          onClick={onSkipForward}
          aria-label={t('chantSkipForward')}
        >
          +5s
        </button>
      </div>

      <div className={styles.row}>
        <label className={styles.volLabel} htmlFor={volId}>
          <span className={styles.volText}>{t('volume')}</span>
          <input
            id={volId}
            type="range"
            className={styles.volRange}
            min={0}
            max={100}
            value={volume}
            disabled={disabled}
            onChange={(e) => onVolumeChange(Number(e.target.value))}
            aria-label={t('volume')}
            aria-valuemin={0}
            aria-valuemax={100}
            aria-valuenow={volume}
          />
        </label>
      </div>

      <div className={styles.row}>
        <span className={styles.rateLegend} id={speedLabelId}>
          {t('speed')}
        </span>
        <div
          className={styles.rates}
          role="group"
          aria-labelledby={speedLabelId}
        >
          {RATES.map((r) => (
            <button
              key={r}
              type="button"
              className={`${styles.rateBtn} ${Math.abs(rate - r) < 0.01 ? styles.rateOn : ''}`}
              disabled={disabled}
              onClick={() => onRateChange(r)}
              aria-pressed={Math.abs(rate - r) < 0.01}
              aria-label={`${r === 1 ? '1×' : `${r}×`} ${t('speed')}`}
            >
              {r === 1 ? '1×' : `${r}×`}
            </button>
          ))}
        </div>
      </div>
    </div>
  )
}
