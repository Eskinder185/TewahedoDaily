import { useMemo } from 'react'
import { TabPanel } from '../ui/TabPanel'
import { PrayerReadingText } from './PrayerReadingText'
import { useUiLabel } from '../../lib/i18n/uiLabels'
import type { PrayerLang } from './prayerLang'
import { PRAYER_LANGS } from './prayerLang'
import {
  hasPrayerText,
  htmlLangForPrayerLang,
  prayerBodyForLang,
  type PrayerTriText,
  type PrayerTriTitle,
} from '../../lib/prayers/prayerLanguage'
import { useReaderLanguage } from '../../lib/prayers/useReaderLanguage'
import styles from './PrayerReader.module.css'

export type PrayerReaderProps = {
  text: PrayerTriText
  titles?: PrayerTriTitle
  /** Optional heading shown above the body for the active language. */
  showTitle?: boolean
  className?: string
  /**
   * Split tab list / panel across the DOM (e.g. sticky language bar).
   * When set, pass `selectedId`, `onTabChange`, and `ariaIdPrefix`.
   */
  split?: 'none' | 'tablist' | 'panel'
  selectedId?: string
  onTabChange?: (id: string) => void
  ariaIdPrefix?: string
}

const LANG_LABEL_KEYS: Record<PrayerLang, 'prayerLangAmharic' | 'prayerLangGeez' | 'prayerLangEnglish'> = {
  amharic: 'prayerLangAmharic',
  geez: 'prayerLangGeez',
  english: 'prayerLangEnglish',
}

export function PrayerReader({
  text,
  titles,
  showTitle = false,
  className = '',
  split = 'none',
  selectedId,
  onTabChange,
  ariaIdPrefix,
}: PrayerReaderProps) {
  const t = useUiLabel()
  const managed = useReaderLanguage(text)
  const controlled = selectedId !== undefined
  const activeId = controlled ? selectedId : managed.readerLanguage

  const setActive = (id: string) => {
    if (!isPrayerLang(id)) return
    if (controlled) onTabChange?.(id)
    else managed.setReaderLanguage(id)
  }

  const tabs = useMemo(() => {
    return PRAYER_LANGS.map((lang) => {
      const body = prayerBodyForLang(text, lang)
      const available = hasPrayerText(body)
      const ownTitle = titles
        ? (lang === 'amharic' ? titles.amharic : lang === 'geez' ? titles.geez : titles.english).trim()
        : ''
      const title = showTitle && available ? ownTitle : ''
      const label = available
        ? t(LANG_LABEL_KEYS[lang])
        : `${t(LANG_LABEL_KEYS[lang])} — ${t('prayerLangUnavailableShort')}`
      return {
        id: lang,
        label,
        content: (
          <div className={styles.panel}>
            {title ? (
              <h2 className={styles.langTitle} lang={htmlLangForPrayerLang(lang)}>
                {title}
              </h2>
            ) : null}
            {available ? (
              <PrayerReadingText text={body} lang={lang} />
            ) : (
              <p className={styles.muted} role="status">
                {lang === 'geez' ? t('prayerGeezUnavailable') : t('prayerTranslationUnavailable')}
              </p>
            )}
          </div>
        ),
      }
    })
  }, [text, titles, showTitle, t])

  if (!tabs.length) {
    return (
      <div className={`${styles.root} ${className}`.trim()}>
        <p className={styles.muted}>{t('prayerReaderEmpty')}</p>
      </div>
    )
  }

  const renderMode = split === 'tablist' ? 'tablist' : split === 'panel' ? 'panel' : 'full'

  return (
    <div className={`${styles.root} ${className}`.trim()}>
      <TabPanel
        variant="compact"
        compactWrap
        tablistAriaLabel={t('prayerReaderTabsAria')}
        tabs={tabs}
        initialId={activeId}
        selectedId={activeId}
        onSelectedIdChange={setActive}
        renderMode={renderMode}
        ariaIdPrefix={split !== 'none' ? ariaIdPrefix : undefined}
      />
    </div>
  )
}

function isPrayerLang(value: string): value is PrayerLang {
  return value === 'amharic' || value === 'geez' || value === 'english'
}

/** Back-compat wrapper used by existing call sites. */
export function PrayerTextTabs(props: {
  text: PrayerTriText
  split?: 'none' | 'tablist' | 'panel'
  selectedId?: string
  onTabChange?: (id: string) => void
  ariaIdPrefix?: string
}) {
  return <PrayerReader {...props} />
}
