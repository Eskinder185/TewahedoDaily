import type { GuideLangMode } from '../../lib/prayers/learnHowToPrayModel'
import styles from './prayerGuideUi.module.css'

const OPTIONS: { value: GuideLangMode; label: string }[] = [
  { value: 'am', label: 'Amharic' },
  { value: 'en', label: 'English' },
  { value: 'both', label: 'Both' },
]

export function GuideLanguageSwitcher({
  value,
  onChange,
  idPrefix = 'guide-lang',
}: {
  value: GuideLangMode
  onChange: (mode: GuideLangMode) => void
  idPrefix?: string
}) {
  return (
    <div className={styles.langSeg} role="group" aria-label="Guide language">
      {OPTIONS.map((option) => (
        <button
          key={option.value}
          type="button"
          id={`${idPrefix}-${option.value}`}
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
