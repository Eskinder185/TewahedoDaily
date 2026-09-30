import type { PrayerLang } from './prayerLang'
import styles from './LanguageTriToggle.module.css'

type Props = {
  value: PrayerLang
  onChange: (lang: PrayerLang) => void
  labels: { amharic: string; geez: string; english: string }
  /** When provided, only these languages are shown. */
  available?: PrayerLang[]
  className?: string
  idPrefix?: string
}

export function LanguageTriToggle({
  value,
  onChange,
  labels,
  available,
  className = '',
  idPrefix = 'lang',
}: Props) {
  const all: { id: PrayerLang; label: string }[] = [
    { id: 'amharic', label: labels.amharic },
    { id: 'geez', label: labels.geez },
    { id: 'english', label: labels.english },
  ]
  const opts = available?.length ? all.filter((o) => available.includes(o.id)) : all
  return (
    <div
      className={`${styles.group} ${className}`.trim()}
      role="group"
      aria-label="Reading language"
    >
      {opts.map((o) => (
        <button
          key={o.id}
          type="button"
          id={`${idPrefix}-${o.id}`}
          className={`${styles.btn} ${value === o.id ? styles.btnOn : ''}`}
          onClick={() => onChange(o.id)}
          aria-pressed={value === o.id}
        >
          {o.label}
        </button>
      ))}
    </div>
  )
}
