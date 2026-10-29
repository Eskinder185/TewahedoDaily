import type { AppLocale } from '../../lib/i18n/locale'
import styles from './PlayComponents.module.css'

export type GameDifficulty = 'beginner' | 'growing' | 'challenge'

const labels: Record<GameDifficulty, Record<AppLocale, string>> = {
  beginner: { en: 'Beginner', am: 'ጀማሪ' },
  growing: { en: 'Growing', am: 'መካከለኛ' },
  challenge: { en: 'Challenge', am: 'ፈታኝ' },
}

export function GameDifficultyPicker({
  locale,
  value,
  onChange,
}: {
  locale: AppLocale
  value: GameDifficulty
  onChange: (difficulty: GameDifficulty) => void
}) {
  const legend = locale === 'am' ? 'የጨዋታ ደረጃ ይምረጡ' : 'Choose a game level'

  return (
    <fieldset className={styles.difficulty}>
      <legend>{legend}</legend>
      <div className={styles.difficultyOptions}>
        {(Object.keys(labels) as GameDifficulty[]).map((difficulty) => (
          <button
            key={difficulty}
            type="button"
            className={`${styles.difficultyButton} ${value === difficulty ? styles.difficultyButtonActive : ''}`}
            aria-pressed={value === difficulty}
            onClick={() => onChange(difficulty)}
          >
            {labels[difficulty][locale]}
          </button>
        ))}
      </div>
    </fieldset>
  )
}
