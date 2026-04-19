import { useUiLabel } from '../../lib/i18n/uiLabels'
import styles from './ChantPlayerControls.module.css'

const RATES = [0.5, 0.75, 1, 1.25] as const

type ChantPlayerControlsProps = {
  disabled: boolean
  isPlaying: boolean
  onTogglePlay: () => void
  volume: number
  onVolumeChange: (value: number) => void
  rate: number
  onRateChange: (value: number) => void
  onSkipBack: () => void
  onSkipForward: () => void
}

export function ChantPlayerControls({
  disabled,
  isPlaying,
  onTogglePlay,
  volume,
  onVolumeChange,
  rate,
  onRateChange,
  onSkipBack,
  onSkipForward,
}: ChantPlayerControlsProps) {
  const t = useUiLabel()
  return (
    <div className={styles.root}>
      <div className={styles.rowPrimary}>
        <button
          type="button"
          className={styles.skip}
          disabled={disabled}
          onClick={onSkipBack}
          aria-label="Back 5 seconds"
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
          aria-label="Forward 5 seconds"
        >
          +5s
        </button>
      </div>

      <div className={styles.row}>
        <label className={styles.volLabel}>
          <span className={styles.volText}>{t('volume')}</span>
          <input
            type="range"
            className={styles.volRange}
            min={0}
            max={100}
            value={volume}
            disabled={disabled}
            onChange={(e) => onVolumeChange(Number(e.target.value))}
            aria-valuemin={0}
            aria-valuemax={100}
            aria-valuenow={volume}
          />
        </label>
      </div>

      <div className={styles.row}>
        <span className={styles.rateLegend} id="speed-label">
          {t('speed')}
        </span>
        <div
          className={styles.rates}
          role="group"
          aria-labelledby="speed-label"
        >
          {RATES.map((r) => (
            <button
              key={r}
              type="button"
              className={`${styles.rateBtn} ${Math.abs(rate - r) < 0.01 ? styles.rateOn : ''}`}
              disabled={disabled}
              onClick={() => onRateChange(r)}
            >
              {r === 1 ? '1×' : `${r}×`}
            </button>
          ))}
        </div>
      </div>
    </div>
  )
}
