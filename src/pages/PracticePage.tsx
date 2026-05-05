import { lazy, Suspense } from 'react'
import { useTranslation } from '../i18n'
import { useUiLabel } from '../lib/i18n/uiLabels'
import { PageSection } from '../components/ui/PageSection'
import { Disclosure } from '../components/ui/Disclosure'
import styles from './PracticePage.module.css'

// Lazy load heavy practice components
const ChantsSection = lazy(() => import('../components/practice/ChantsSection').then(m => ({ default: m.ChantsSection })))

// Reserves vertical space so the tab panel does not jump when lazy chunks mount.
function PracticeSectionFallback() {
  const t = useTranslation()

  return (
    <div className={styles.lazyPanelFallback} role="status" aria-live="polite">
      {t('practice.loading')}
    </div>
  )
}

export function PracticePage() {
  const t = useUiLabel()
  const tt = useTranslation()

  return (
    <PageSection variant="tint">
      <div className={styles.pageShell}>
        <header className={styles.pageHead}>
          <span className={styles.headRule} aria-hidden />
          <p className={styles.eyebrow}>{tt('mezmurPractice.title')}</p>
          <h1 className={styles.title}>{tt('mezmurPractice.title')}</h1>
          <p className={styles.deck}>{tt('mezmurPractice.hero.description')}</p>
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
              <span className={styles.miniGuideLabel}>{tt('mezmurPractice.intro.openLabel')}</span>
              <span className={styles.miniGuideText}>{tt('mezmurPractice.intro.openText')}</span>
            </div>
            <div className={styles.miniGuideItem}>
              <span className={styles.miniGuideLabel}>{tt('mezmurPractice.intro.memorizeLabel')}</span>
              <span className={styles.miniGuideText}>{tt('mezmurPractice.intro.memorizeText')}</span>
            </div>
            <div className={styles.miniGuideItem}>
              <span className={styles.miniGuideLabel}>{tt('mezmurPractice.intro.practiceLabel')}</span>
              <span className={styles.miniGuideText}>{tt('mezmurPractice.intro.practiceText')}</span>
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
