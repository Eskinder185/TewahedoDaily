import type { AppLocale } from '../../lib/i18n/locale'
import styles from './PlayComponents.module.css'

export function GameProgress({
  locale,
  current,
  total,
  label,
}: {
  locale: AppLocale
  current: number
  total: number
  label?: string
}) {
  const safeTotal = Math.max(1, total)
  const safeCurrent = Math.min(Math.max(current, 0), safeTotal)
  const percent = Math.round((Math.min(Math.max(current, 0), safeTotal) / safeTotal) * 100)
  const text = label ?? (locale === 'am' ? 'የጨዋታ እድገት' : 'Game progress')

  return (
    <div className={styles.gameProgress}>
      <div className={styles.gameProgressMeta}>
        <span>{text}</span>
        <strong>{current}/{total}</strong>
      </div>
      <div
        className={styles.gameProgressTrack}
        role="progressbar"
        aria-label={text}
        aria-valuetext={`${current} / ${total}`}
        aria-valuemin={0}
        aria-valuemax={safeTotal}
        aria-valuenow={safeCurrent}
      >
        <span style={{ width: `${percent}%` }} />
      </div>
    </div>
  )
}
