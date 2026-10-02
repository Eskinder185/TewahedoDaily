import styles from './prayerLearning.module.css'

export function LearnHowToPrayHeader() {
  return (
    <header className={styles.hero}>
      <p className={styles.eyebrow}>Learn How to Pray</p>
      <h1 className={styles.heroTitle}>Learn How to Pray</h1>
      <p className={styles.heroDeck}>
        A practical guide to prayer in the Ethiopian Orthodox Tewahedo tradition.
      </p>
    </header>
  )
}

/** @deprecated Prefer LearnHowToPrayHeader + LearnHowToPrayControls */
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
    <>
      <LearnHowToPrayHeader />
      <div className={styles.controlBar} role="tablist" aria-label="Learning mode">
        <button
          type="button"
          role="tab"
          aria-selected={active === 'guided'}
          className={active === 'guided' ? styles.modeOn : styles.modeBtn}
          onClick={onGuided}
        >
          Guided Practice
        </button>
        <button
          type="button"
          role="tab"
          aria-selected={active === 'learn'}
          className={active === 'learn' ? styles.modeOn : styles.modeBtn}
          onClick={onLearn}
        >
          Learn About Prayer
        </button>
      </div>
    </>
  )
}
