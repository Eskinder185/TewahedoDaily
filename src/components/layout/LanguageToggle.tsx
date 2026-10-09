import { useLocale, type AppLocale } from '../../lib/i18n/locale'
import { useUiLabel } from '../../lib/i18n/uiLabels'
import { useTranslation } from '../../i18n'
import styles from './LanguageToggle.module.css'

const OPTIONS: Array<{
  id: AppLocale
  short: { en: string; am: string }
  labelKey: 'langEnglishButton' | 'langAmharicButton'
  langAttr: string
}> = [
  { id: 'en', short: { en: 'EN', am: 'EN' }, labelKey: 'langEnglishButton', langAttr: 'en' },
  { id: 'am', short: { en: 'አማ', am: 'አማ' }, labelKey: 'langAmharicButton', langAttr: 'am' },
]

type Props = {
  /** Use fuller labels (drawer / desktop). */
  variant?: 'compact' | 'full'
  className?: string
}

export function LanguageToggle({ variant = 'compact', className }: Props) {
  const { locale, setLocale, uiLocale } = useLocale()
  const t = useUiLabel()
  const tt = useTranslation()
  const selectedLabel = locale === 'am' ? t('langAmharicButton') : t('langEnglishButton')
  const shortLocale = uiLocale === 'am' ? 'am' : 'en'

  return (
    <div
      className={`${styles.group} ${variant === 'full' ? styles.groupFull : ''} ${className || ''}`.trim()}
      role="radiogroup"
      aria-label={t('langToggleGroup')}
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
              {opt.short[shortLocale]}
            </span>
            <span className={styles.segFull}>{label}</span>
          </button>
        )
      })}
    </div>
  )
}
