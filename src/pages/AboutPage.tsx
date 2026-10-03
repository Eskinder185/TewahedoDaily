import { Link } from 'react-router-dom'
import { useTranslation } from '../i18n'
import { usePageMeta } from '../lib/publicContent/usePageMeta'
import styles from './AboutPage.module.css'

function EthCross({ className }: { className?: string }) {
  return (
    <svg className={className} viewBox="0 0 48 48" aria-hidden focusable="false">
      <g fill="none" stroke="currentColor" strokeWidth="1.35">
        <rect x="21.5" y="4" width="5" height="40" />
        <rect x="8" y="14.5" width="32" height="5" />
        <rect x="14" y="8" width="3.5" height="3.5" />
        <rect x="30.5" y="8" width="3.5" height="3.5" />
        <rect x="14" y="22.5" width="3.5" height="3.5" />
        <rect x="30.5" y="22.5" width="3.5" height="3.5" />
        <rect x="21.5" y="33" width="5" height="3.5" />
      </g>
    </svg>
  )
}

export function AboutPage() {
  const t = useTranslation()

  usePageMeta(t('about.title'), t('about.metaDescription'))

  const threads = [
    {
      n: 'I',
      title: t('about.features.churchDay.title'),
      body: t('about.features.churchDay.description'),
    },
    {
      n: 'II',
      title: t('about.features.chants.title'),
      body: t('about.features.chants.description'),
    },
    {
      n: 'III',
      title: t('about.features.prayers.title'),
      body: t('about.features.prayers.description'),
    },
    {
      n: 'IV',
      title: t('about.features.calendar.title'),
      body: t('about.features.calendar.description'),
    },
  ]

  return (
    <div className={styles.page}>
      <section className={styles.hero} aria-labelledby="about-hero-title">
        <div className={styles.heroInner}>
          <div className={styles.heroCopy}>
            <p className={styles.eyebrow}>{t('about.hero.eyebrow')}</p>
            <h1 id="about-hero-title" className={styles.heroTitle}>
              {t('about.hero.title')}
            </h1>
            <p className={styles.heroLede}>{t('about.hero.description')}</p>
            <div className={styles.ornamentRule} aria-hidden>
              <span className={styles.ruleLine} />
              <EthCross className={styles.ruleCross} />
              <span className={styles.ruleLine} />
            </div>
          </div>
          <div className={styles.heroArt} aria-hidden>
            <div className={styles.arch}>
              <div className={styles.archInner}>
                <div className={styles.archHalo} />
                <EthCross className={styles.archCross} />
                <p className={styles.archCaption}>{t('about.hero.archCaption')}</p>
              </div>
            </div>
          </div>
        </div>
      </section>

      <section className={styles.narrowSection} aria-labelledby="about-what">
        <h2 id="about-what" className={styles.h2}>
          {t('about.whatThisSiteIs.title')}
        </h2>
        <p className={styles.body}>{t('about.whatThisSiteIs.paragraph1')}</p>
        <blockquote className={styles.pullQuote}>
          <span className={styles.pullBar} aria-hidden />
          <div className={styles.pullMark} aria-hidden>
            <span className={styles.ruleLineShort} />
            <EthCross className={styles.ruleCrossSm} />
          </div>
          <p>“{t('about.whatThisSiteIs.paragraph2')}”</p>
        </blockquote>
      </section>

      <section className={styles.audienceBand} aria-labelledby="about-who">
        <div className={styles.audienceInner}>
          <p className={styles.eyebrowCenter}>{t('about.audience.eyebrow')}</p>
          <h2 id="about-who" className={styles.h2Center}>
            {t('about.audience.title')}
          </h2>
          <ul className={styles.audienceGrid}>
            <li className={styles.audienceCard}>
              <span className={styles.cardNum}>01</span>
              <h3>{t('about.audience.card1Title')}</h3>
              <p>{t('about.audience.card1Body')}</p>
            </li>
            <li className={styles.audienceCard}>
              <span className={styles.cardNum}>02</span>
              <h3>{t('about.audience.card2Title')}</h3>
              <p>{t('about.audience.card2Body')}</p>
            </li>
            <li className={styles.audienceCard}>
              <span className={styles.cardNum}>03</span>
              <h3>{t('about.audience.card3Title')}</h3>
              <p>{t('about.audience.card3Body')}</p>
            </li>
          </ul>
        </div>
      </section>

      <section className={styles.threadsSection} aria-labelledby="about-threads">
        <div className={styles.threadsIntro}>
          <p className={styles.eyebrowCenter}>{t('about.features.eyebrow')}</p>
          <h2 id="about-threads" className={styles.h2Center}>
            {t('about.features.title')}
          </h2>
          <p className={styles.subCenter}>{t('about.features.intro')}</p>
        </div>
        <ul className={styles.threadGrid}>
          {threads.map((item) => (
            <li key={item.n} className={styles.threadCard}>
              <div className={styles.threadArt} aria-hidden>
                <span className={styles.threadGridPattern} />
                <div className={styles.threadArch}>
                  <EthCross className={styles.threadCross} />
                </div>
                <span className={styles.roman}>{item.n}</span>
              </div>
              <div className={styles.threadBody}>
                <h3>{item.title}</h3>
                <p>{item.body}</p>
              </div>
            </li>
          ))}
        </ul>
      </section>

      <section className={styles.howBand} aria-labelledby="about-how">
        <div className={styles.howInner}>
          <div className={styles.howCopy}>
            <p className={styles.eyebrowOnDark}>{t('about.howToUse.eyebrow')}</p>
            <h2 id="about-how" className={styles.h2OnDark}>
              {t('about.howToUse.title')}
            </h2>
            <p className={styles.bodyOnDark}>{t('about.howToUse.lede')}</p>
            <div className={styles.howActions}>
              <Link to="/" className={styles.btnGhost}>
                {t('about.cta.home')}
              </Link>
              <Link to="/practice" className={styles.btnSolid}>
                {t('about.cta.practice')}
              </Link>
            </div>
          </div>
          <ol className={styles.timeline}>
            <li>
              <span className={styles.tlNum} aria-hidden>
                1
              </span>
              <div>
                <h3>{t('about.howToUse.step1.title')}</h3>
                <p>{t('about.howToUse.step1.description')}</p>
              </div>
            </li>
            <li>
              <span className={styles.tlNum} aria-hidden>
                2
              </span>
              <div>
                <h3>{t('about.howToUse.step2.title')}</h3>
                <p>{t('about.howToUse.step2.description')}</p>
              </div>
            </li>
            <li>
              <span className={styles.tlNum} aria-hidden>
                3
              </span>
              <div>
                <h3>{t('about.howToUse.step3.title')}</h3>
                <p>{t('about.howToUse.step3.description')}</p>
              </div>
            </li>
          </ol>
        </div>
      </section>

      <section className={styles.guidanceWrap} aria-labelledby="about-respect">
        <div className={styles.guidanceCard}>
          <div className={styles.guidanceMotif} aria-hidden>
            <div className={styles.guidanceCircle}>
              <EthCross className={styles.guidanceCross} />
            </div>
          </div>
          <div className={styles.guidanceText}>
            <p className={styles.eyebrow}>{t('about.guidance.eyebrow')}</p>
            <h2 id="about-respect" className={styles.h2}>
              {t('about.guidance.title')}
            </h2>
            <p className={styles.body}>{t('about.guidance.paragraph1')}</p>
            <p className={styles.body}>{t('about.guidance.paragraph2')}</p>
            <hr className={styles.softRule} />
            <p className={styles.guidanceQuote}>“{t('about.guidance.paragraph3')}”</p>
          </div>
        </div>
      </section>

      <section className={styles.visionSection} aria-labelledby="about-future">
        <h2 id="about-future" className={styles.h2}>
          {t('about.futureVision.title')}
        </h2>
        <p className={styles.body}>{t('about.futureVision.description')}</p>
        <p className={styles.closing}>“{t('about.closing')}”</p>
      </section>
    </div>
  )
}
