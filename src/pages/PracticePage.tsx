import { lazy, Suspense, useEffect, useMemo } from 'react'
import { useUiLabel } from '../lib/i18n/uiLabels'
import { useLocation, useNavigate } from 'react-router-dom'
import { PageSection } from '../components/ui/PageSection'
import { Disclosure } from '../components/ui/Disclosure'
import { TabPanel } from '../components/ui/TabPanel'
import type { TabItem } from '../components/ui/TabPanel'
import styles from './PracticePage.module.css'

// Lazy load heavy practice components
const ChantsSection = lazy(() => import('../components/practice/ChantsSection').then(m => ({ default: m.ChantsSection })))
const InstrumentsSection = lazy(() => import('../components/practice/InstrumentsSection').then(m => ({ default: m.InstrumentsSection })))

// Simple loading fallback for practice components
function PracticeSectionFallback() {
  return (
    <div style={{ padding: '2rem', textAlign: 'center', color: 'var(--color-text-dim)' }}>
      Loading practice content...
    </div>
  )
}

const TAB_IDS = ['chants', 'movement'] as const
const LEGACY_CHANT_HASHES = new Set(['mezmur', 'werb'])

export function PracticePage() {
  const t = useUiLabel()
  const { hash } = useLocation()
  const navigate = useNavigate()

  useEffect(() => {
    const id = hash.replace(/^#/, '')
    if (LEGACY_CHANT_HASHES.has(id)) {
      navigate({ pathname: '/practice', hash: 'chants' }, { replace: true })
    } else if (id === 'instruments') {
      navigate({ pathname: '/practice', hash: 'movement' }, { replace: true })
    } else if (id === 'overview') {
      navigate({ pathname: '/practice', hash: 'chants' }, { replace: true })
    } else if (id === 'tselot') {
      navigate('/prayers', { replace: true })
    }
  }, [hash, navigate])

  const selectedId = useMemo(() => {
    const id = hash.replace(/^#/, '')
    if (!id || id === 'overview') return TAB_IDS[0]
    const normalized = LEGACY_CHANT_HASHES.has(id) ? 'chants' : id
    return TAB_IDS.includes(normalized as (typeof TAB_IDS)[number])
      ? normalized
      : TAB_IDS[0]
  }, [hash])

  const setSelectedId = (id: string) => {
    navigate({ pathname: '/practice', hash: id }, { replace: true })
  }

  const tabs: TabItem[] = useMemo(
    () => [
      {
        id: 'chants',
        label: t('tabChants'),
        content: (
          <div className={styles.panelInner}>
            <Suspense fallback={<PracticeSectionFallback />}>
              <ChantsSection />
            </Suspense>
          </div>
        ),
      },
      {
        id: 'movement',
        label: t('tabMovement'),
        content: (
          <div className={styles.panelInner}>
            <Suspense fallback={<PracticeSectionFallback />}>
              <InstrumentsSection />
            </Suspense>
          </div>
        ),
      },
    ],
    [t],
  )

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
                <li>{t('practiceChantsHelper')}</li>
                <li>{t('practiceMovementLead')}</li>
                <li>{t('practiceGoToPrayers')}</li>
              </ul>
            </Disclosure>
          </div>
          <div className={styles.miniGuide}>
            <div className={styles.miniGuideItem}>
              <span className={styles.miniGuideLabel}>{t('navPractice')}</span>
              <span className={styles.miniGuideText}>Open the chant library and start with one piece.</span>
            </div>
            <div className={styles.miniGuideItem}>
              <span className={styles.miniGuideLabel}>Memorize</span>
              <span className={styles.miniGuideText}>Use shorter lyric and rhythm passes before full repetition.</span>
            </div>
            <div className={styles.miniGuideItem}>
              <span className={styles.miniGuideLabel}>Move</span>
              <span className={styles.miniGuideText}>Pair mezmur with movement so practice feels embodied, not abstract.</span>
            </div>
          </div>
        </header>

        <div className={styles.tabRegion}>
          <p className={styles.tabRegionLabel} id="practice-tabs-intro">
            {t('practiceTabRegionLabel')}
          </p>
          <TabPanel
            variant="practice"
            tablistAriaLabel={t('practiceHubTabsAria')}
            tabs={tabs}
            selectedId={selectedId}
            onSelectedIdChange={setSelectedId}
          />
        </div>
      </div>
    </PageSection>
  )
}
