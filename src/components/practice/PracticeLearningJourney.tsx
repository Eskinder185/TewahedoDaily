import { useMemo } from 'react'
import { Link } from 'react-router-dom'
import { TabPanel } from '../ui/TabPanel'
import { useUiLabel } from '../../lib/i18n/uiLabels'
import styles from './PracticeLearningJourney.module.css'

const STEP_KEYS = [
  {
    id: 'step-words',
    title: 'practiceJourneyStep1Title' as const,
    body: 'practiceJourneyStep1Body' as const,
  },
  {
    id: 'step-rhythm',
    title: 'practiceJourneyStep2Title' as const,
    body: 'practiceJourneyStep2Body' as const,
  },
  {
    id: 'step-move',
    title: 'practiceJourneyStep3Title' as const,
    body: 'practiceJourneyStep3Body' as const,
  },
  {
    id: 'step-return',
    title: 'practiceJourneyStep4Title' as const,
    body: 'practiceJourneyStep4Body' as const,
  },
]

export function PracticeLearningJourney() {
  const t = useUiLabel()

  const tabs = useMemo(
    () =>
      STEP_KEYS.map((s) => ({
        id: s.id,
        label: t(s.title),
        content: (
          <div className={styles.panel}>
            <p className={styles.stepText}>{t(s.body)}</p>
          </div>
        ),
      })),
    [t],
  )

  return (
    <section className={styles.root} aria-labelledby="learn-journey-h">
      <div className={styles.header}>
        <p className={styles.eyebrow}>{t('practiceJourneyEyebrow')}</p>
        <h2 id="learn-journey-h" className={styles.h}>
          {t('practiceJourneyTitle')}
        </h2>
        <p className={styles.sub}>{t('practiceJourneySubtitle')}</p>
      </div>

      <TabPanel
        className={styles.tabPanel}
        variant="compact"
        tablistAriaLabel={t('practiceJourneyTitle')}
        tabs={tabs}
        initialId={STEP_KEYS[0].id}
      />

      <p className={styles.foot}>
        <Link className={styles.link} to="/prayers">
          {t('practiceGoToPrayers')}
        </Link>
        <span className={styles.footNote}>{t('practiceJourneyFoot')}</span>
      </p>
    </section>
  )
}
