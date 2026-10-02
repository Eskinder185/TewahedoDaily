import styles from './prayerGuideUi.module.css'

export function PrayerGuideHero({
  title,
  titleAmharic,
  subtitle,
  onStartPractice,
  onExploreGuide,
}: {
  title: string
  titleAmharic: string
  subtitle: string
  onStartPractice: () => void
  onExploreGuide: () => void
}) {
  return (
    <header className={styles.hero}>
      <p className={styles.eyebrow}>Learn about prayer</p>
      <h1 className={styles.heroTitle}>{title}</h1>
      {titleAmharic ? (
        <p className={styles.heroAm} lang="am">
          {titleAmharic}
        </p>
      ) : null}
      <p className={styles.heroDeck}>{subtitle}</p>
      <div className={styles.heroActions}>
        <button type="button" className={styles.heroLink} onClick={onStartPractice}>
          Guided Practice
        </button>
        <span className={styles.heroSep} aria-hidden="true">
          ·
        </span>
        <button type="button" className={styles.heroLink} onClick={onExploreGuide}>
          Full Guide
        </button>
      </div>
    </header>
  )
}
