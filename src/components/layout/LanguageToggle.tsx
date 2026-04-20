import { useLocale } from '../../lib/i18n/locale'
import { useUiLabel } from '../../lib/i18n/uiLabels'
import styles from './LanguageToggle.module.css'

/**
 * EN / አማርኛ switch. Wires to `LocaleProvider`; add translations keyed by `useLocale().locale` when ready.
 */
export function LanguageToggle() {
  const { locale, setLocale } = useLocale()
  const t = useUiLabel()

  return (
    <div
      className={styles.group}
      role="group"
      aria-label={t('langToggleGroup')}
    >
      <button
        type="button"
        className={`${styles.seg} ${locale === 'en' ? styles.segOn : ''}`}
        onClick={() => setLocale('en')}
        aria-pressed={locale === 'en'}
        aria-label={t('langEnglishButton')}
        lang="en"
      >
        EN
      </button>
      <button
        type="button"
        className={`${styles.seg} ${locale === 'am' ? styles.segOn : ''}`}
        onClick={() => setLocale('am')}
        aria-pressed={locale === 'am'}
        aria-label={t('langAmharicButton')}
        lang="am"
      >
        አማርኛ
      </button>
    </div>
  )
}
