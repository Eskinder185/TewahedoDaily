import { useLocale } from '../../lib/i18n/locale'
import styles from './LanguageToggle.module.css'

/**
 * EN / አማርኛ switch. Wires to `LocaleProvider`; add translations keyed by `useLocale().locale` when ready.
 */
export function LanguageToggle() {
  const { locale, setLocale } = useLocale()

  return (
    <div
      className={styles.group}
      role="group"
      aria-label="Language"
    >
      <button
        type="button"
        className={`${styles.seg} ${locale === 'en' ? styles.segOn : ''}`}
        onClick={() => setLocale('en')}
        aria-pressed={locale === 'en'}
      >
        EN
      </button>
      <button
        type="button"
        className={`${styles.seg} ${locale === 'am' ? styles.segOn : ''}`}
        onClick={() => setLocale('am')}
        aria-pressed={locale === 'am'}
        lang="am"
      >
        አማርኛ
      </button>
    </div>
  )
}
