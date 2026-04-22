import { lazy, Suspense } from 'react'
import { useUiLabel } from '../lib/i18n/uiLabels'
import { PageSection } from '../components/ui/PageSection'
import { Disclosure } from '../components/ui/Disclosure'
import styles from './PracticePage.module.css'

// Lazy load heavy practice components
const ChantsSection = lazy(() => import('../components/practice/ChantsSection').then(m => ({ default: m.ChantsSection })))

// Reserves vertical space so the tab panel does not jump when lazy chunks mount.
function PracticeSectionFallback() {
  return (
    <div className={styles.lazyPanelFallback} role="status" aria-live="polite">
      Loading practice content...
    </div>
  )
}

export function PracticePage() {
  const t = useUiLabel()

  return (
    <PageSection variant="tint">
      <div className={styles.pageShell}>
        <header className={styles.pageHead}>
          <span className={styles.headRule} aria-hidden />
          <p className={styles.eyebrow}>{t('navPractice')}</p>
          <h1 className={styles.title}>{t('practiceHeadTitle')}</h1>
          <p className={styles.deck}>{t('practiceHeadDeck')}</p>
          <div className={styles.mobileGuide}>
            <Disclosure summary={t('practiceMobileGuideSummary')}>
              <ul className={styles.mobileGuideList}>
                <li>{t('practiceHymnsHelper')}</li>
                <li>{t('practiceGoToPrayers')}</li>
              </ul>
            </Disclosure>
          </div>
          <div className={styles.miniGuide}>
            <div className={styles.miniGuideItem}>
              <span className={styles.miniGuideLabel}>{t('navPractice')}</span>
              <span className={styles.miniGuideText}>Open the hymn library and start with one piece.</span>
            </div>
            <div className={styles.miniGuideItem}>
              <span className={styles.miniGuideLabel}>Memorize</span>
              <span className={styles.miniGuideText}>Use shorter lyric and rhythm passes before full repetition.</span>
            </div>
            <div className={styles.miniGuideItem}>
              <span className={styles.miniGuideLabel}>Practice</span>
              <span className={styles.miniGuideText}>Return to the same hymn through the week for deeper learning.</span>
            </div>
          </div>
        </header>

        <div className={styles.tabRegion} id="practice-hub-anchor">
          <p className={styles.tabRegionLabel} id="practice-tabs-intro">
            {t('practiceTabRegionLabel')}
          </p>
          <div className={styles.panelInner}>
            <Suspense fallback={<PracticeSectionFallback />}>
              <ChantsSection />
            </Suspense>
          </div>
        </div>
      </div>
    </PageSection>
  )
}
