import styles from './prayerLearning.module.css'

export function LearnHowToPrayControls({
  mode,
  onModeChange,
}: {
  mode: 'guided' | 'learn'
  onModeChange: (mode: 'guided' | 'learn') => void
}) {
  return (
    <div className={styles.controlBar}>
      <div className={styles.modeSeg} role="tablist" aria-label="Learning mode">
        <button
          id="pray-mode-guided"
          type="button"
          role="tab"
          aria-selected={mode === 'guided'}
          aria-controls="guided-practice"
          tabIndex={mode === 'guided' ? 0 : -1}
          className={mode === 'guided' ? styles.modeOn : styles.modeBtn}
          onClick={() => onModeChange('guided')}
        >
          Guided Practice
        </button>
        <button
          id="pray-mode-learn"
          type="button"
          role="tab"
          aria-selected={mode === 'learn'}
          aria-controls="learn-about-prayer"
          tabIndex={mode === 'learn' ? 0 : -1}
          className={mode === 'learn' ? styles.modeOn : styles.modeBtn}
          onClick={() => onModeChange('learn')}
        >
          Learn About Prayer
        </button>
      </div>
    </div>
  )
}
