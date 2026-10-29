import type { AppLocale } from '../../lib/i18n/locale'
import { levelFor, type PlayAchievement } from '../../lib/play/progress'
import { usePlayProgress } from '../../lib/play/usePlayProgress'
import styles from './PlayComponents.module.css'

const BADGES: Record<PlayAchievement, { en: string; am: string; icon: string }> = {
  'first-steps': { en: 'First Steps', am: 'የመጀመሪያ እርምጃ', icon: '✦' },
  'perfect-round': { en: 'Perfect Round', am: 'ፍጹም ዙር', icon: '★' },
  'curious-explorer': { en: 'Curious Explorer', am: 'ጉጉ አሳሽ', icon: '◇' },
  'three-day-streak': { en: 'Three-Day Rhythm', am: 'የሦስት ቀን ተከታታይ', icon: '☼' },
  'icon-reader': { en: 'Icon Reader', am: 'ሥዕል አንባቢ', icon: '✠' },
  'feast-keeper': { en: 'Feast Keeper', am: 'በዓል ጠባቂ', icon: '✧' },
}

export function PlayProgressPanel({ locale, signedIn }: { locale: AppLocale; signedIn: boolean }) {
  const progress = usePlayProgress()
  const am = locale === 'am'
  const lvl = levelFor(progress.xp)
  const played = progress.history.length

  return (
    <aside className={styles.progressPanel} aria-labelledby="play-progress-title">
      <div className={styles.levelRing} style={{ ['--pct' as string]: lvl.pct }} role="img" aria-label={am ? `ደረጃ ${lvl.level}፣ ${lvl.pct}% ወደ ቀጣዩ` : `Level ${lvl.level}, ${lvl.pct}% to the next level`}>
        <span><small>{am ? 'ደረጃ' : 'Level'}</small><strong>{lvl.level}</strong></span>
      </div>
      <div className={styles.progressHeading}>
        <p>{signedIn ? (am ? 'የተመዘገበ ተጫዋች' : 'Signed-in player') : (am ? 'እንግዳ ተጫዋች · በዚህ መሣሪያ ይቀመጣል' : 'Guest player · saved on this device')}</p>
        <h2 id="play-progress-title">{am ? 'የእርስዎ ጉዞ' : 'Your learning journey'}</h2>
        <p className={styles.progressNext}>{am ? `ወደ ደረጃ ${lvl.level + 1} ${lvl.toNext} ኤክስፒ ቀርቷል` : `${lvl.toNext} XP to level ${lvl.level + 1}`}</p>
      </div>
      <div className={styles.stats}>
        <span><strong>{progress.xp}</strong>XP</span>
        <span><strong>{progress.streak}</strong>{am ? 'ተከታታይ ቀናት' : 'day streak'}</span>
        <span><strong>{played}</strong>{am ? 'ጨዋታዎች' : played === 1 ? 'game played' : 'games played'}</span>
      </div>
      {progress.achievements.length ? (
        <ul className={styles.badges} aria-label={am ? 'ያገኟቸው ምልክቶች' : 'Badges earned'}>
          {progress.achievements.map((badge) => BADGES[badge] ? <li key={badge}><span aria-hidden="true">{BADGES[badge].icon}</span>{BADGES[badge][locale]}</li> : null)}
        </ul>
      ) : (
        <p className={styles.progressEmpty}>{am ? 'የመጀመሪያውን ጨዋታ ሲጨርሱ ኤክስፒና ምልክቶች እዚህ ይታያሉ።' : 'Finish your first game to start earning XP and badges.'}</p>
      )}
    </aside>
  )
}
