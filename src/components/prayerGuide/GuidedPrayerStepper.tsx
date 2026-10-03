import styles from './prayerGuideUi.module.css'

/**
 * Single progress system for guided practice.
 * Desktop: 01 ─ 02 ─ …  Mobile: compact dots.
 */
export function GuidedPrayerStepper({
  currentIndex,
  total,
  completedCount,
  completedSlugs,
  stepSlugs,
  stepTitles,
  onSelect,
  onReset,
}: {
  currentIndex: number
  total: number
  completedCount: number
  completedSlugs: readonly string[]
  stepSlugs: readonly string[]
  stepTitles: readonly string[]
  onSelect: (index: number) => void
  onReset: () => void
}) {
  const done = new Set(completedSlugs)

  return (
    <div className={styles.stepper} aria-label={`Step ${currentIndex + 1} of ${total}`}>
      <div className={styles.stepperHead}>
        <p className={styles.stepperMeta}>
          Step {currentIndex + 1} of {total}
          <span className={styles.stepperDone}> · {completedCount} completed</span>
        </p>
        <button type="button" className={styles.resetQuiet} onClick={onReset}>
          Reset
        </button>
      </div>

      {/* Desktop / tablet numbered timeline */}
      <ol className={styles.stepLine}>
        {stepSlugs.map((slug, index) => {
          const isCurrent = index === currentIndex
          const isDone = done.has(slug)
          return (
            <li key={slug} className={styles.stepLineItem}>
              {index > 0 ? <span className={styles.stepLineRule} aria-hidden="true" /> : null}
              <button
                type="button"
                className={[
                  styles.stepNode,
                  isCurrent ? styles.stepNodeCurrent : '',
                  isDone ? styles.stepNodeDone : '',
                ]
                  .filter(Boolean)
                  .join(' ')}
                aria-current={isCurrent ? 'step' : undefined}
                aria-label={`${isDone ? 'Completed' : 'Step'} ${index + 1}: ${stepTitles[index] || slug}`}
                onClick={() => onSelect(index)}
              >
                {isDone && !isCurrent ? '✓' : String(index + 1).padStart(2, '0')}
              </button>
            </li>
          )
        })}
      </ol>

      {/* Compact mobile numbered steps (single-row scroll) */}
      <ol className={styles.stepDots} aria-label={`Step ${currentIndex + 1} of ${total}`}>
        {stepSlugs.map((slug, index) => {
          const isCurrent = index === currentIndex
          const isDone = done.has(slug)
          return (
            <li key={`d-${slug}`}>
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
                aria-label={`${isDone ? 'Completed' : 'Step'} ${index + 1}: ${stepTitles[index] || slug}`}
                onClick={() => onSelect(index)}
              >
                {isDone && !isCurrent ? '✓' : String(index + 1)}
              </button>
            </li>
          )
        })}
      </ol>
    </div>
  )
}
