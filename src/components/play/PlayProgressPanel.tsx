import type { AppLocale } from '../../lib/i18n/locale'
import styles from './PlayComponents.module.css'

export function PlayProgressPanel({ locale, signedIn }: { locale: AppLocale; signedIn: boolean }) {
  const copy = locale === 'am'
    ? {
        heading: 'የእርስዎ ጉዞ',
        mode: signedIn ? 'የተመዘገበ ተጫዋች' : 'እንግዳ ተጫዋች',
        xp: 'ኤክስፒ',
        streak: 'ተከታታይ ቀናት',
        badges: 'ምልክቶች',
        empty: 'የመጀመሪያውን ጨዋታ ሲጨርሱ ጉዞዎ እዚህ ይጀምራል።',
      }
    : {
        heading: 'Your learning journey',
        mode: signedIn ? 'Signed-in player' : 'Guest player',
        xp: 'XP',
        streak: 'day streak',
        badges: 'badges',
        empty: 'Your journey starts here when the first playable game arrives.',
      }

  return (
    <aside className={styles.progressPanel} aria-labelledby="play-progress-title">
      <div className={styles.progressHeading}>
        <div>
          <p>{copy.mode}</p>
          <h2 id="play-progress-title">{copy.heading}</h2>
        </div>
        <span className={styles.levelBadge} aria-label={locale === 'am' ? 'ደረጃ 1' : 'Level 1'}>1</span>
      </div>
      <div className={styles.progressTrack} role="progressbar" aria-valuemin={0} aria-valuemax={100} aria-valuenow={0} aria-label={copy.xp}>
        <span />
      </div>
      <div className={styles.stats}>
        <span><strong>0</strong> {copy.xp}</span>
        <span><strong>0</strong> {copy.streak}</span>
        <span><strong>0</strong> {copy.badges}</span>
      </div>
      <p className={styles.progressEmpty}>{copy.empty}</p>
    </aside>
  )
}
