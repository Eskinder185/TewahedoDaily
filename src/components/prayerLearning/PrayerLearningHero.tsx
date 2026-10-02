import styles from './prayerLearning.module.css'

export function PrayerLearningHero({
  onGuided,
  onLearn,
  active,
}: {
  onGuided: () => void
  onLearn: () => void
  active: 'guided' | 'learn'
}) {
  return (
    <header className={styles.hero}>
      <p className={styles.eyebrow}>Learn How to Pray</p>
      <h1 className={styles.heroTitle}>Learn How to Pray</h1>
      <p className={styles.heroDeck}>
        A practical guide to prayer in the Ethiopian Orthodox Tewahedo tradition.
      </p>
      <div className={styles.heroTabs} role="tablist" aria-label="Learning mode">
        <button
          type="button"
          role="tab"
          aria-selected={active === 'guided'}
          className={active === 'guided' ? styles.heroModeOn : styles.heroMode}
          onClick={onGuided}
        >
          Guided Practice
        </button>
        <button
          type="button"
          role="tab"
          aria-selected={active === 'learn'}
          className={active === 'learn' ? styles.heroModeOn : styles.heroMode}
          onClick={onLearn}
        >
          Learn About Prayer
        </button>
      </div>
    </header>
  )
}
