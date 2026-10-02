import type { GuideLangMode } from '../../lib/prayers/prayerLearning'
import styles from './prayerLearning.module.css'

const OPTIONS: { value: GuideLangMode; label: string }[] = [
  { value: 'am', label: 'Amharic' },
  { value: 'en', label: 'English' },
  { value: 'both', label: 'Both' },
]

export function LanguageSwitcher({
  value,
  onChange,
}: {
  value: GuideLangMode
  onChange: (mode: GuideLangMode) => void
}) {
  return (
    <div className={styles.langSeg} role="group" aria-label="Guide language">
      {OPTIONS.map((option) => (
        <button
          key={option.value}
          type="button"
          className={value === option.value ? styles.langSegOn : styles.langSegBtn}
          aria-pressed={value === option.value}
          onClick={() => onChange(option.value)}
        >
          {option.label}
        </button>
      ))}
    </div>
  )
}
