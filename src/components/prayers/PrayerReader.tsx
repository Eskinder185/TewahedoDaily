import { useEffect, useMemo, useState } from 'react'
import { TabPanel } from '../ui/TabPanel'
import { PrayerReadingText } from './PrayerReadingText'
import { useUiLabel } from '../../lib/i18n/uiLabels'
import { useLocale } from '../../lib/i18n/locale'
import type { PrayerLang } from './prayerLang'
import {
  availablePrayerLangs,
  htmlLangForPrayerLang,
  preferredPrayerLangFromLocale,
  prayerBodyForLang,
  prayerTitleForLang,
  resolvePrayerLang,
  type PrayerTriText,
  type PrayerTriTitle,
} from '../../lib/prayers/prayerLanguage'
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
  const { locale } = useLocale()
  const available = useMemo(() => availablePrayerLangs(text), [text])
  const preferred = preferredPrayerLangFromLocale(locale)
  const defaultLang = resolvePrayerLang(text, preferred) || available[0] || 'amharic'

  const controlled = selectedId !== undefined
  const [internalLang, setInternalLang] = useState<string>(defaultLang)

  useEffect(() => {
    if (controlled) return
    setInternalLang(defaultLang)
  }, [controlled, defaultLang, text.amharic, text.geez, text.english])

  const activeId = controlled ? selectedId! : internalLang
  const activeLang = (available.includes(activeId as PrayerLang)
    ? activeId
    : defaultLang) as PrayerLang

  const setActive = (id: string) => {
    if (controlled) onTabChange?.(id)
    else setInternalLang(id)
  }

  const tabs = useMemo(() => {
    return available.map((lang) => {
      const body = prayerBodyForLang(text, lang)
      const title =
        showTitle && titles ? prayerTitleForLang(titles, lang) : ''
      return {
        id: lang,
        label: t(LANG_LABEL_KEYS[lang]),
        content: (
          <div className={styles.panel}>
            {title ? (
              <h2 className={styles.langTitle} lang={htmlLangForPrayerLang(lang)}>
                {title}
              </h2>
            ) : null}
            <PrayerReadingText text={body} lang={lang} />
          </div>
        ),
      }
    })
  }, [available, text, titles, showTitle, t])

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
        initialId={activeLang}
        selectedId={activeId}
        onSelectedIdChange={setActive}
        renderMode={renderMode}
        ariaIdPrefix={split !== 'none' ? ariaIdPrefix : undefined}
      />
    </div>
  )
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
