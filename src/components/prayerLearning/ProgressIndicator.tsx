import styles from './prayerLearning.module.css'

export function ProgressIndicator({
  currentIndex,
  total,
}: {
  currentIndex: number
  total: number
}) {
  const percent = total > 0 ? Math.round(((currentIndex + 1) / total) * 100) : 0

  return (
    <div className={styles.stepper} aria-label={`Step ${currentIndex + 1} of ${total}`}>
      <p className={styles.stepperMeta}>
        Step {currentIndex + 1} of {total}
      </p>
      <div
        className={styles.progressBar}
        role="progressbar"
        aria-valuemin={1}
        aria-valuemax={total}
        aria-valuenow={currentIndex + 1}
        aria-label={`Guided practice progress, step ${currentIndex + 1} of ${total}`}
      >
        <span style={{ width: `${percent}%` }} />
      </div>
    </div>
  )
}
