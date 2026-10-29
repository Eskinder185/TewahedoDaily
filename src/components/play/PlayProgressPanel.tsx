import type { AppLocale } from '../../lib/i18n/locale'
import { usePlayProgress } from '../../lib/play/usePlayProgress'
import styles from './PlayComponents.module.css'

export function PlayProgressPanel({ locale, signedIn }: { locale: AppLocale; signedIn: boolean }) {
  const progress = usePlayProgress()
  const badgeNames = locale === 'am'
    ? { 'first-steps': 'የመጀመሪያ እርምጃ', 'perfect-round': 'ፍጹም ዙር', 'curious-explorer': 'ጉጉ አሳሽ', 'three-day-streak': 'የሦስት ቀን ተከታታይ' }
    : { 'first-steps': 'First Steps', 'perfect-round': 'Perfect Round', 'curious-explorer': 'Curious Explorer', 'three-day-streak': 'Three-Day Rhythm' }
  const copy = locale === 'am'
    ? {
        heading: 'የእርስዎ ጉዞ',
        mode: signedIn ? 'የተመዘገበ ተጫዋች' : 'እንግዳ ተጫዋች',
        xp: 'ኤክስፒ',
        streak: 'ተከታታይ ቀናት',
        badges: 'ምልክቶች',
        empty: progress.history.length ? `የተጠናቀቁ ጨዋታዎች፦ ${progress.history.length}` : 'የመጀመሪያውን ጨዋታ ሲጨርሱ ጉዞዎ እዚህ ይጀምራል።',
      }
    : {
        heading: 'Your learning journey',
        mode: signedIn ? 'Signed-in player' : 'Guest player',
        xp: 'XP',
        streak: 'day streak',
        badges: 'badges',
        empty: progress.history.length ? `${progress.history.length} completed game${progress.history.length === 1 ? '' : 's'}` : 'Your journey starts when you complete your first game.',
      }

  return (
    <aside className={styles.progressPanel} aria-labelledby="play-progress-title">
      <div className={styles.progressHeading}>
        <div>
          <p>{copy.mode}</p>
          <h2 id="play-progress-title">{copy.heading}</h2>
        </div>
        <span className={styles.levelBadge} aria-label={`${locale === 'am' ? 'ደረጃ' : 'Level'} ${Math.floor(progress.xp / 500) + 1}`}>{Math.floor(progress.xp / 500) + 1}</span>
      </div>
      <div className={styles.progressTrack} role="progressbar" aria-valuemin={0} aria-valuemax={500} aria-valuenow={progress.xp % 500} aria-label={copy.xp}>
        <span style={{ width: `${(progress.xp % 500) / 5}%` }} />
      </div>
      <div className={styles.stats}>
        <span><strong>{progress.xp}</strong> {copy.xp}</span>
        <span><strong>{progress.streak}</strong> {copy.streak}</span>
        <span><strong>{progress.achievements.length}</strong> {copy.badges}</span>
      </div>
      <p className={styles.progressEmpty}>{copy.empty}</p>
      {progress.achievements.length ? <p className={styles.progressEmpty}>{progress.achievements.map((badge) => `✦ ${badgeNames[badge]}`).join(' · ')}</p> : null}
    </aside>
  )
}
