import { useEffect, useLayoutEffect, useMemo, useState } from 'react'
import { Link, useSearchParams } from 'react-router-dom'
import { PageSection } from '../components/ui/PageSection'
import { SanctuaryHero } from '../components/prayers/SanctuaryHero'
import { PrayerTextTabs } from '../components/prayers/PrayerTextTabs'
import { ZEWETER_PRAYERS } from '../lib/prayers/zeweterData'
import { useUiLabel } from '../lib/i18n/uiLabels'
import { isMobileViewport, scrollTargetIntoView } from '../lib/scrollUtils'
import styles from './ZeweterTselotPage.module.css'

export function ZeweterTselotPage() {
  const t = useUiLabel()
  const [params, setParams] = useSearchParams()
  const paramId = params.get('id') ?? ''
  const [showPrayerListOnMobile, setShowPrayerListOnMobile] = useState(true)

  const defaultId = ZEWETER_PRAYERS[0]?.id ?? ''
  const activeId = ZEWETER_PRAYERS.some((p) => p.id === paramId)
    ? paramId
    : defaultId

  useEffect(() => {
    if (!paramId && defaultId) {
      setParams({ id: defaultId }, { replace: true })
    }
  }, [paramId, defaultId, setParams])

  const active = useMemo(
    () => ZEWETER_PRAYERS.find((p) => p.id === activeId) ?? ZEWETER_PRAYERS[0],
    [activeId],
  )

  useLayoutEffect(() => {
    if (isMobileViewport() && showPrayerListOnMobile) return
    scrollTargetIntoView('#zeweter-reader', { smooth: false, flush: true })
    requestAnimationFrame(() => {
      if (isMobileViewport() && !showPrayerListOnMobile) {
        document.getElementById('zeweter-reader')?.focus({ preventScroll: true })
      }
    })
  }, [activeId, showPrayerListOnMobile])

  // Handle prayer selection - immediate opening on mobile
  const handlePrayerSelect = (prayerId: string) => {
    setParams({ id: prayerId })

    if (isMobileViewport()) {
      setShowPrayerListOnMobile(false)
    }
  }

  // Show prayer list again when needed
  const showPrayerList = () => {
    setShowPrayerListOnMobile(true)
  }

  const readingMode =
    isMobileViewport() && !showPrayerListOnMobile ? styles.readingModeSection : ''

  return (
    <PageSection variant="tint" className={readingMode}>
      <nav className={styles.nav} aria-label="Breadcrumb">
        <Link className={styles.crumb} to="/prayers">
          {t('navPrayers')}
        </Link>
        <span className={styles.crumbSep} aria-hidden>
          /
        </span>
        <span className={styles.crumbCurrent}>{t('prayerZeweterTitle')}</span>
      </nav>

      <div className={styles.preReader}>
        <SanctuaryHero eyebrow={t('prayerZeweterEyebrow')} title={t('prayerZeweterTitle')}>
          <p>{t('prayerZeweterIntro')}</p>
        </SanctuaryHero>

        <div className={styles.jumpRow}>
          <a href="#zeweter-index" className={styles.jumpChip}>
            Prayer list
          </a>
          <a href="#zeweter-reader" className={styles.jumpChip}>
            Reading panel
          </a>
        </div>
      </div>

      <div className={`${styles.grid} ${!showPrayerListOnMobile ? styles.gridReaderOnly : ''}`}>
        <aside
          className={`${styles.rail} ${!showPrayerListOnMobile ? styles.railHidden : ''}`}
          id="zeweter-index"
          aria-label={t('prayerZeweterNav')}
        >
          <p className={styles.railLabel}>{t('prayerZeweterNav')}</p>
          <ul className={styles.railList}>
            {ZEWETER_PRAYERS.map((p) => (
              <li key={p.id}>
                <button
                  type="button"
                  className={`${styles.railBtn} ${p.id === activeId ? styles.railBtnOn : ''}`}
                  aria-current={p.id === activeId ? 'true' : undefined}
                  onClick={() => handlePrayerSelect(p.id)}
                >
                  <span className={styles.railTitle}>{p.title}</span>
                  {p.transliterationTitle?.trim() ? (
                    <span className={styles.railSub}>{p.transliterationTitle}</span>
                  ) : null}
                </button>
              </li>
            ))}
          </ul>
        </aside>

        <article
          className={`${styles.reader} ${!showPrayerListOnMobile ? styles.readerFullMobile : ''}`}
          id="zeweter-reader"
          key={activeId}
          tabIndex={-1}
        >
          {!showPrayerListOnMobile && (
            <button 
              className={styles.backButton}
              onClick={showPrayerList}
              type="button"
            >
              ← Back to prayers
            </button>
          )}
          <header className={styles.readerHead}>
            <div className={styles.readerTitles}>
              <h2 className={styles.readerH2}>{active?.title}</h2>
              {active?.transliterationTitle?.trim() ? (
                <p className={styles.readerSub}>{active.transliterationTitle}</p>
              ) : null}
            </div>
          </header>

          <div
            id="zeweter-reading-start"
            tabIndex={-1}
            className={styles.readingLandmark}
            aria-label={active?.title ?? 'Prayer reading'}
          />

          {active ? (
            <PrayerTextTabs
              text={active.text}
              summary={active.summary}
              transliteration={active.transliteration}
            />
          ) : null}
        </article>
      </div>
    </PageSection>
  )
}
