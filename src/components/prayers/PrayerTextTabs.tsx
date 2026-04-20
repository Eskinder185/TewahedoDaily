import { useMemo, type ReactNode } from 'react'
import { TabPanel } from '../ui/TabPanel'
import { PrayerLangNote } from './PrayerLangNote'
import { PrayerReadingText } from './PrayerReadingText'
import { useUiLabel } from '../../lib/i18n/uiLabels'
import styles from './PrayerTextTabs.module.css'

type TriText = { amharic: string; geez: string; english: string }

type Props = {
  text: TriText
  summary?: { amharic?: string; english?: string }
  transliteration?: TriText
  /** Extra prose below the standard UI language note (e.g. psalm-specific). */
  extraNotes?: ReactNode
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
  summary,
  transliteration,
  extraNotes,
  split = 'none',
  selectedId,
  onTabChange,
  ariaIdPrefix,
}: Props) {
  const t = useUiLabel()

  const tabs = useMemo(() => {
    const sumAm = summary?.amharic?.trim() ?? ''
    const sumEn = summary?.english?.trim() ?? ''
    const tr = transliteration
    const hasTrans = Boolean(
      tr &&
        (tr.amharic.trim() || tr.geez.trim() || tr.english.trim()),
    )

    const summaryBody =
      sumAm || sumEn ? (
        <div className={styles.summary}>
          {sumAm ? (
            <section className={styles.summaryBlock}>
              <h3 className={styles.summaryH} lang="am">
                {t('prayerLangAmharic')}
              </h3>
              <p className={styles.summaryP} lang="am">
                {sumAm}
              </p>
            </section>
          ) : null}
          {sumEn ? (
            <section className={styles.summaryBlock}>
              <h3 className={styles.summaryH}>{t('prayerLangEnglish')}</h3>
              <p className={styles.summaryP}>{sumEn}</p>
            </section>
          ) : null}
        </div>
      ) : (
        <p className={styles.muted}>{t('prayerTabSummaryEmpty')}</p>
      )

    const notesBody = (
      <div className={styles.notes}>
        <PrayerLangNote />
        {extraNotes}
        {hasTrans && tr ? (
          <dl className={styles.transList}>
            {tr.amharic.trim() ? (
              <>
                <dt className={styles.transDt} lang="am">
                  {t('prayerLangAmharic')} · {t('prayerTabNotesTransliteration')}
                </dt>
                <dd className={styles.transDd} lang="am">
                  {tr.amharic.trim()}
                </dd>
              </>
            ) : null}
            {tr.geez.trim() ? (
              <>
                <dt className={styles.transDt} lang="am">
                  {t('prayerLangGeez')} · {t('prayerTabNotesTransliteration')}
                </dt>
                <dd className={styles.transDd}>{tr.geez.trim()}</dd>
              </>
            ) : null}
            {tr.english.trim() ? (
              <>
                <dt className={styles.transDt}>
                  {t('prayerLangEnglish')} · {t('prayerTabNotesTransliteration')}
                </dt>
                <dd className={styles.transDd}>{tr.english.trim()}</dd>
              </>
            ) : null}
          </dl>
        ) : null}
      </div>
    )

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
      {
        id: 'summary',
        label: t('prayerTabSummary'),
        content: <div className={styles.panel}>{summaryBody}</div>,
      },
      {
        id: 'notes',
        label: t('prayerTabNotes'),
        content: <div className={styles.panel}>{notesBody}</div>,
      },
    ]
  }, [text, summary, transliteration, extraNotes, t])

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
