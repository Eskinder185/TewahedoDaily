import styles from './prayerLearning.module.css'

export function GuidedPracticeProgress({
  currentIndex,
  total,
  completedSlugs,
  stepSlugs,
  stepTitles,
  onSelect,
}: {
  currentIndex: number
  total: number
  completedSlugs?: readonly string[]
  stepSlugs?: readonly string[]
  stepTitles?: readonly string[]
  onSelect?: (index: number) => void
}) {
  const percent = total > 0 ? Math.round(((currentIndex + 1) / total) * 100) : 0
  const done = new Set(completedSlugs || [])
  const slugs = stepSlugs || Array.from({ length: total }, (_, i) => String(i))

  return (
    <div className={styles.stepper} aria-label={`Step ${currentIndex + 1} of ${total}`}>
      <div className={styles.stepperHead}>
        <p className={styles.stepperMeta}>
          Step {currentIndex + 1} of {total}
        </p>
        <span className={styles.stepperPercent} aria-hidden="true">
          {percent}%
        </span>
      </div>

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

      {total > 0 ? (
        <ol className={styles.stepDots} aria-label="Jump to step">
          {slugs.map((slug, index) => {
            const isCurrent = index === currentIndex
            const isDone = done.has(slug)
            return (
              <li key={slug}>
                <button
                  type="button"
                  className={[
                    styles.stepDot,
                    isCurrent ? styles.stepDotCurrent : '',
                    isDone ? styles.stepDotDone : '',
                  ]
                    .filter(Boolean)
                    .join(' ')}
                  aria-current={isCurrent ? 'step' : undefined}
                  aria-label={`${isDone ? 'Completed' : 'Go to'} step ${index + 1}${
                    stepTitles?.[index] ? `: ${stepTitles[index]}` : ''
                  }`}
                  onClick={() => onSelect?.(index)}
                  disabled={!onSelect}
                >
                  <span className={styles.stepDotNum}>{index + 1}</span>
                </button>
              </li>
            )
          })}
        </ol>
      ) : null}
    </div>
  )
}

/** @deprecated Prefer GuidedPracticeProgress */
export function ProgressIndicator({
  currentIndex,
  total,
}: {
  currentIndex: number
  total: number
}) {
  return <GuidedPracticeProgress currentIndex={currentIndex} total={total} />
}
