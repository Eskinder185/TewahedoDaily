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
          type="button"
          role="tab"
          aria-selected={mode === 'guided'}
          className={mode === 'guided' ? styles.modeOn : styles.modeBtn}
          onClick={() => onModeChange('guided')}
        >
          Guided Practice
        </button>
        <button
          type="button"
          role="tab"
          aria-selected={mode === 'learn'}
          className={mode === 'learn' ? styles.modeOn : styles.modeBtn}
          onClick={() => onModeChange('learn')}
        >
          Learn About Prayer
        </button>
      </div>
    </div>
  )
}
