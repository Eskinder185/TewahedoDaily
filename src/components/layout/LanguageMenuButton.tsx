import { useLocale } from '../../lib/i18n/locale'
import { useUiLabel } from '../../lib/i18n/uiLabels'
import { useTranslation } from '../../i18n'
import styles from './LanguageMenuButton.module.css'

function GlobeIcon({ className }: { className?: string }) {
  return (
    <svg
      className={className}
      viewBox="0 0 24 24"
      fill="none"
      stroke="currentColor"
      strokeWidth="1.6"
      strokeLinecap="round"
      strokeLinejoin="round"
      aria-hidden
    >
      <circle cx="12" cy="12" r="9" />
      <path d="M3 12h18" />
      <path d="M12 3a14 14 0 0 1 0 18" />
      <path d="M12 3a14 14 0 0 0 0 18" />
    </svg>
  )
}

type Props = {
  className?: string
}

/**
 * Mobile-first one-tap EN ↔ አማ language switcher.
 * No Oromo / Both options — interface languages are English and Amharic only.
 */
export function LanguageMenuButton({ className }: Props) {
  const { locale, setLocale } = useLocale()
  const t = useUiLabel()
  const tt = useTranslation()
  const isAmharic = locale === 'am'
  const abbr = isAmharic ? 'አማ' : 'EN'
  const selectedLabel = isAmharic ? t('langAmharicButton') : t('langEnglishButton')
  const nextLabel = isAmharic ? t('langEnglishButton') : t('langAmharicButton')

  return (
    <div className={`${styles.root} ${className || ''}`.trim()}>
      <button
        type="button"
        className={styles.trigger}
        aria-label={`${t('langToggleGroup')}: ${selectedLabel}. ${tt('language.switchTo', { language: nextLabel })}`}
        title={`${selectedLabel} → ${nextLabel}`}
        lang={isAmharic ? 'am' : 'en'}
        onClick={() => setLocale(isAmharic ? 'en' : 'am')}
      >
        <GlobeIcon className={styles.globe} />
        <span className={styles.abbr} aria-hidden>
          {abbr}
        </span>
      </button>
      <span className={styles.srOnly} aria-live="polite">
        {tt('language.selected', { language: selectedLabel })}
      </span>
    </div>
  )
}
