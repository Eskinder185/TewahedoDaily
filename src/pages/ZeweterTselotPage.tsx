import { useEffect, useMemo } from 'react'
import { Link, useSearchParams } from 'react-router-dom'
import { PageSection } from '../components/ui/PageSection'
import { SanctuaryHero } from '../components/prayers/SanctuaryHero'
import { PrayerTextTabs } from '../components/prayers/PrayerTextTabs'
import { ZEWETER_PRAYERS } from '../lib/prayers/zeweterData'
import { useUiLabel } from '../lib/i18n/uiLabels'
import { scrollToReaderOnMobile } from '../lib/scrollUtils'
import styles from './ZeweterTselotPage.module.css'

export function ZeweterTselotPage() {
  const t = useUiLabel()
  const [params, setParams] = useSearchParams()
  const paramId = params.get('id') ?? ''

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

  // Scroll to reader on mobile when prayer selection changes
  useEffect(() => {
    if (paramId && paramId !== defaultId) {
      scrollToReaderOnMobile('#zeweter-reader')
    }
  }, [paramId, defaultId])

  return (
    <PageSection variant="tint">
      <nav className={styles.nav} aria-label="Breadcrumb">
        <Link className={styles.crumb} to="/prayers">
          {t('navPrayers')}
        </Link>
        <span className={styles.crumbSep} aria-hidden>
          /
        </span>
        <span className={styles.crumbCurrent}>{t('prayerZeweterTitle')}</span>
      </nav>

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

      <div className={styles.grid}>
        <aside
          className={styles.rail}
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
                  onClick={() => setParams({ id: p.id })}
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

        <article className={styles.reader} id="zeweter-reader" key={activeId}>
          <header className={styles.readerHead}>
            <div className={styles.readerTitles}>
              <h2 className={styles.readerH2}>{active?.title}</h2>
              {active?.transliterationTitle?.trim() ? (
                <p className={styles.readerSub}>{active.transliterationTitle}</p>
              ) : null}
            </div>
          </header>

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
