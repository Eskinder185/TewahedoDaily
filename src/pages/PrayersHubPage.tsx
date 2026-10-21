import { useCallback, useRef } from 'react'
import { Link } from 'react-router-dom'
import { PageSection } from '../components/ui/PageSection'
import { usePrayerHubSnapshot } from '../hooks/usePrayerHubSnapshot'
import type { UiLabelKey } from '../lib/i18n/uiLabels'
import { useUiLabel } from '../lib/i18n/uiLabels'
import type { PrayerHubRoute } from '../lib/prayers/prayerHubActivity'
import { recordPrayerHubVisit } from '../lib/prayers/prayerHubActivity'
import { scrollElementNodeIntoView } from '../lib/scrollUtils'
import styles from './PrayersHubPage.module.css'

const ROUTE_TITLE: Record<PrayerHubRoute, UiLabelKey> = {
  '/prayers/zeweter': 'prayerHubZeweterTitle',
  '/prayers/wudase-mariam': 'prayerHubWudaseTitle',
  '/prayers/mezmure-dawit': 'prayerHubMezmurTitle',
  '/prayers/yekidane-tselot': 'prayerHubYekidaneTitle',
  '/prayers/meharene-ab': 'prayerHubMehareneTitle',
}

function routeTitle(t: (k: UiLabelKey) => string, path: PrayerHubRoute) {
  return t(ROUTE_TITLE[path])
}

function scrollToEl(el: HTMLElement | null) {
  scrollElementNodeIntoView(el, { block: 'start' })
}

export function PrayersHubPage() {
  const t = useUiLabel()
  const { lastVisit, recent, saved } = usePrayerHubSnapshot()
  const libraryRef = useRef<HTMLDivElement>(null)
  const savedRef = useRef<HTMLDivElement>(null)

  const visit =
    (path: PrayerHubRoute) =>
    () => {
      recordPrayerHubVisit(path)
    }

  const browse = useCallback(() => scrollToEl(libraryRef.current), [])
  const goSaved = useCallback(() => scrollToEl(savedRef.current), [])

  return (
    <PageSection variant="tint">
      <div className={styles.pageStack}>
        <header className={`${styles.hero} td-rise`}>
          <div className={styles.heroGlow} aria-hidden />
          <div className={styles.heroInner}>
            <p className={styles.heroEyebrow}>{t('prayerHubEyebrow')}</p>
            <h1 className={styles.heroTitle}>{t('navPrayers')}</h1>
            <p className={styles.heroSubtitle}>{t('prayerHubTitle')}</p>
            <p className={styles.heroDeck}>{t('prayerHubHeroDeck')}</p>
          </div>
        </header>

        <div className={`${styles.entryBand} td-fade-in`}>
          <div className={styles.entryInner}>
            <Link
              className={styles.primaryCta}
              to="/prayers/zeweter"
              onClick={visit('/prayers/zeweter')}
            >
              {t('prayerHubPrimaryStart')}
            </Link>
            <p className={styles.dailyPath}>
              <span className={styles.dailyPathLabel}>{t('prayerHubDailyPath')}</span>
              <span className={styles.dailyPathSep} aria-hidden>
                ·
              </span>
              <span>{t('prayerHubZeweterTitle')}</span>
            </p>
            <div className={styles.quickRow}>
              {lastVisit ? (
                <Link
                  className={styles.quickLink}
                  to={lastVisit.path}
                  onClick={visit(lastVisit.path)}
                >
                  {t('prayerHubQuickContinue')}
                </Link>
              ) : null}
              <button type="button" className={styles.quickBtn} onClick={browse}>
                {t('prayerHubQuickBrowse')}
              </button>
              <button type="button" className={styles.quickBtn} onClick={goSaved}>
                {t('prayerHubQuickSaved')}
              </button>
            </div>
            {lastVisit ? (
              <p className={styles.continueHint}>{t('prayerHubContinueHint')}</p>
            ) : null}
          </div>
        </div>

        {recent.length > 0 ? (
          <div className={styles.recentStrip}>
            <p className={styles.recentLabel} id="recent-prayers-label">
              {t('prayerHubRecentLabel')}
            </p>
            <ul className={styles.recentList} aria-labelledby="recent-prayers-label">
              {recent.map((path) => (
                <li key={path}>
                  <Link
                    className={styles.recentChip}
                    to={path}
                    onClick={visit(path)}
                  >
                    {routeTitle(t, path)}
                  </Link>
                </li>
              ))}
            </ul>
          </div>
        ) : null}
      </div>

      <div
        ref={libraryRef}
        id="prayer-library"
        className={`${styles.library} td-stagger`}
      >
        <section className={styles.group} aria-labelledby="hub-section-start">
          <div className={styles.groupHeader}>
            <h2 className={styles.groupTitle} id="hub-section-start">
              {t('prayerHubSectionStart')}
            </h2>
            <p className={styles.groupLead}>{t('prayerHubSectionStartLead')}</p>
          </div>
          <Link
            className={styles.featured}
            to="/prayers/zeweter"
            onClick={visit('/prayers/zeweter')}
          >
            <div className={styles.featuredTop}>
              <span className={styles.featuredKicker}>{t('prayerHubZeweterTitle')}</span>
              <p className={styles.featuredWhy}>{t('prayerHubFeaturedFoundation')}</p>
            </div>
            <p className={styles.featuredDesc}>{t('prayerHubZeweterDesc')}</p>
            <div className={styles.featuredFoot}>
              <div className={styles.featuredMeta}>
                <span className={styles.metaPill}>{t('prayerHubMetaText')}</span>
                <span className={styles.metaEst}>{t('prayerHubEstZeweter')}</span>
              </div>
              <span className={styles.featuredCta}>{t('prayerHubCtaZeweter')}</span>
            </div>
          </Link>
        </section>

        <section className={styles.group} aria-labelledby="hub-section-devotional">
          <div className={styles.groupHeader}>
            <h2 className={styles.groupTitle} id="hub-section-devotional">
              {t('prayerHubSectionDevotional')}
            </h2>
            <p className={styles.groupLead}>{t('prayerHubSectionDevotionalLead')}</p>
          </div>
          <div className={styles.pairGrid}>
            <Link
              className={styles.card}
              to="/prayers/wudase-mariam"
              onClick={visit('/prayers/wudase-mariam')}
            >
              <div className={styles.cardHead}>
                <h3 className={styles.cardTitle}>{t('prayerHubWudaseTitle')}</h3>
                <div className={styles.cardMetaRow}>
                  <span className={styles.metaPill}>{t('prayerHubMetaText')}</span>
                  <span className={styles.metaEst}>{t('prayerHubEstWudase')}</span>
                </div>
              </div>
              <p className={styles.cardDesc}>{t('prayerHubWudaseDesc')}</p>
              <div className={styles.cardFoot}>
                <span className={styles.cardCta}>
                  {t('prayerHubCtaWudase')}
                  <span className={styles.cardArrow} aria-hidden>
                    →
                  </span>
                </span>
              </div>
            </Link>
            <Link
              className={styles.card}
              to="/prayers/mezmure-dawit"
              onClick={visit('/prayers/mezmure-dawit')}
            >
              <div className={styles.cardHead}>
                <h3 className={styles.cardTitle}>{t('prayerHubMezmurTitle')}</h3>
                <div className={styles.cardMetaRow}>
                  <span className={styles.metaPill}>{t('prayerHubMetaText')}</span>
                  <span className={styles.metaEst}>{t('prayerHubEstMezmur')}</span>
                </div>
              </div>
              <p className={styles.cardDesc}>{t('prayerHubMezmurDesc')}</p>
              <div className={styles.cardFoot}>
                <span className={styles.cardCta}>
                  {t('prayerHubCtaMezmur')}
                  <span className={styles.cardArrow} aria-hidden>
                    →
                  </span>
                </span>
              </div>
            </Link>
          </div>
        </section>

        <section className={styles.group} aria-labelledby="hub-section-zema">
          <div className={styles.groupHeader}>
            <h2 className={styles.groupTitle} id="hub-section-zema">
              {t('prayerHubSectionZema')}
            </h2>
            <p className={styles.groupLead}>{t('prayerHubSectionZemaLead')}</p>
          </div>
          <div className={styles.pairGrid}>
            <Link
              className={styles.card}
              to="/prayers/yekidane-tselot"
              onClick={visit('/prayers/yekidane-tselot')}
            >
              <div className={styles.cardHead}>
                <span className={styles.zemaBadge} lang="am">
                  ዜማ + ጽሑፍ
                </span>
                <h3 className={styles.cardTitle}>{t('prayerHubYekidaneTitle')}</h3>
                <div className={styles.cardMetaRow}>
                  <span className={styles.metaPill}>{t('prayerHubMetaTextAudio')}</span>
                  <span className={styles.metaEst}>{t('prayerHubEstZema')}</span>
                </div>
              </div>
              <p className={styles.cardDesc}>{t('prayerHubYekidaneDesc')}</p>
              <div className={styles.cardFoot}>
                <span className={styles.cardCta}>
                  {t('prayerHubCtaYekidane')}
                  <span className={styles.cardArrow} aria-hidden>
                    →
                  </span>
                </span>
              </div>
            </Link>
            <Link
              className={styles.card}
              to="/prayers/meharene-ab"
              onClick={visit('/prayers/meharene-ab')}
            >
              <div className={styles.cardHead}>
                <span className={styles.zemaBadge} lang="am">
                  ዜማ + ጽሑፍ
                </span>
                <h3 className={styles.cardTitle}>{t('prayerHubMehareneTitle')}</h3>
                <div className={styles.cardMetaRow}>
                  <span className={styles.metaPill}>{t('prayerHubMetaTextAudio')}</span>
                  <span className={styles.metaEst}>{t('prayerHubEstZema')}</span>
                </div>
              </div>
              <p className={styles.cardDesc}>{t('prayerHubMehareneDesc')}</p>
              <div className={styles.cardFoot}>
                <span className={styles.cardCta}>
                  {t('prayerHubCtaMeharene')}
                  <span className={styles.cardArrow} aria-hidden>
                    →
                  </span>
                </span>
              </div>
            </Link>
          </div>
        </section>
      </div>

      <section
        ref={savedRef}
        id="saved-prayers"
        className={styles.savedSection}
        aria-labelledby="hub-saved-heading"
      >
        <h2 className={styles.savedHeading} id="hub-saved-heading">
          {t('prayerHubSavedHeading')}
        </h2>
        {saved.length > 0 ? (
          <ul className={styles.savedList} aria-labelledby="hub-saved-heading">
            {saved.map((path) => (
              <li key={path}>
                <Link
                  className={styles.savedLink}
                  to={path}
                  onClick={visit(path)}
                >
                  {routeTitle(t, path)}
                </Link>
              </li>
            ))}
          </ul>
        ) : (
          <p className={styles.savedEmpty}>{t('prayerHubSavedEmpty')}</p>
        )}
      </section>
    </PageSection>
  )
}
