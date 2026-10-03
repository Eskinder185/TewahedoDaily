import { useLocale, type AppLocale } from '../../lib/i18n/locale'
import { useUiLabel } from '../../lib/i18n/uiLabels'
import { useTranslation } from '../../i18n'
import styles from './LanguageToggle.module.css'

const OPTIONS: Array<{ id: AppLocale; short: string; labelKey: 'langEnglishButton' | 'langAmharicButton' | 'langBothButton'; langAttr?: string }> =
  [
    { id: 'en', short: 'EN', labelKey: 'langEnglishButton', langAttr: 'en' },
    { id: 'am', short: 'አማ', labelKey: 'langAmharicButton', langAttr: 'am' },
    { id: 'both', short: 'Both', labelKey: 'langBothButton' },
  ]

type Props = {
  /** Use fuller labels (drawer / desktop). */
  variant?: 'compact' | 'full'
  className?: string
}

export function LanguageToggle({ variant = 'compact', className }: Props) {
  const { locale, setLocale } = useLocale()
  const t = useUiLabel()
  const tt = useTranslation()
  const selectedLabel =
    locale === 'am' ? t('langAmharicButton') : locale === 'both' ? t('langBothButton') : t('langEnglishButton')

  return (
    <div
      className={`${styles.group} ${variant === 'full' ? styles.groupFull : ''} ${className || ''}`.trim()}
      role="radiogroup"
      aria-label={t('langToggleGroup')}
      aria-describedby={undefined}
    >
      <span className={styles.srOnly} aria-live="polite">
        {tt('language.selected', { language: selectedLabel })}
      </span>
      {OPTIONS.map((opt) => {
        const selected = locale === opt.id
        const label = t(opt.labelKey)
        return (
          <button
            key={opt.id}
            type="button"
            role="radio"
            className={`${styles.seg} ${selected ? styles.segOn : ''}`}
            onClick={() => setLocale(opt.id)}
            aria-checked={selected}
            aria-label={label}
            title={label}
            lang={opt.langAttr}
          >
            <span className={styles.segShort} aria-hidden>
              {opt.short}
            </span>
            <span className={styles.segFull}>{label}</span>
          </button>
        )
      })}
    </div>
  )
}
