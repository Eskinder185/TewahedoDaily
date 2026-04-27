import { useMemo } from 'react'
import { TabPanel } from '../ui/TabPanel'
import { PrayerReadingText } from './PrayerReadingText'
import { useUiLabel } from '../../lib/i18n/uiLabels'
import styles from './PrayerTextTabs.module.css'

type TriText = { amharic: string; geez: string; english: string }

type Props = {
  text: TriText
  /**
   * Split tab list / panel across the DOM (e.g. Mezmure Dawit sticky language bar).
   * When set, pass `selectedId`, `onTabChange`, and `ariaIdPrefix` (same `useId()` for both mounts).
   */
  split?: 'none' | 'tablist' | 'panel'
  selectedId?: string
  onTabChange?: (id: string) => void
  ariaIdPrefix?: string
}

export function PrayerTextTabs({
  text,
  split = 'none',
  selectedId,
  onTabChange,
  ariaIdPrefix,
}: Props) {
  const t = useUiLabel()

  const tabs = useMemo(() => {
    return [
      {
        id: 'amharic',
        label: t('prayerLangAmharic'),
        content: (
          <div className={styles.panel}>
            {text.amharic.trim() ? (
              <PrayerReadingText text={text.amharic.trim()} lang="amharic" />
            ) : (
              <p className={styles.muted}>Text is not available for this language yet.</p>
            )}
          </div>
        ),
      },
      {
        id: 'geez',
        label: t('prayerLangGeez'),
        content: (
          <div className={styles.panel}>
            {text.geez.trim() ? (
              <PrayerReadingText text={text.geez.trim()} lang="geez" />
            ) : (
              <p className={styles.muted}>Text is not available for this language yet.</p>
            )}
          </div>
        ),
      },
      {
        id: 'english',
        label: t('prayerLangEnglish'),
        content: (
          <div className={styles.panel}>
            {text.english.trim() ? (
              <PrayerReadingText text={text.english.trim()} lang="english" />
            ) : (
              <p className={styles.muted}>Text is not available for this language yet.</p>
            )}
          </div>
        ),
      },
    ]
  }, [text, t])

  const renderMode = split === 'tablist' ? 'tablist' : split === 'panel' ? 'panel' : 'full'

  return (
    <div className={styles.root}>
      <TabPanel
        variant="compact"
        compactWrap
        tablistAriaLabel={t('prayerReaderTabsAria')}
        tabs={tabs}
        initialId="amharic"
        selectedId={split !== 'none' ? selectedId : undefined}
        onSelectedIdChange={split !== 'none' ? onTabChange : undefined}
        renderMode={renderMode}
        ariaIdPrefix={split !== 'none' ? ariaIdPrefix : undefined}
      />
    </div>
  )
}
