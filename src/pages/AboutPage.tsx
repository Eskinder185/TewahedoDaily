import { Link } from 'react-router-dom'
import { imageManifest } from '../content/imageManifest'
import { PageSection } from '../components/ui/PageSection'
import { ButtonLink } from '../components/ui/ButtonLink'
import { useTranslation } from '../i18n'
import styles from './AboutPage.module.css'

export function AboutPage() {
  const tr = useTranslation()
  const helps = [
    {
      id: 'day',
      label: tr('about.features.churchDay.title'),
      line: tr('about.features.churchDay.description'),
    },
    {
      id: 'chants',
      label: tr('about.features.chants.title'),
      line: tr('about.features.chants.description'),
    },
    {
      id: 'prayers',
      label: tr('about.features.prayers.title'),
      line: tr('about.features.prayers.description'),
    },
    {
      id: 'calendar',
      label: tr('about.features.calendar.title'),
      line: tr('about.features.calendar.description'),
    },
  ] as const
  return (
    <>
      <PageSection>
        <header className={styles.heroBand}>
          <div className={styles.heroBackdrop} aria-hidden>
            <img
              src={imageManifest.about.hero}
              alt=""
              className={styles.heroBackdropImg}
              width={imageManifest.about.heroWidth}
              height={imageManifest.about.heroHeight}
              sizes="(max-width: 768px) 100vw, min(44rem, 90vw)"
              fetchPriority="high"
              decoding="async"
            />
            <div className={styles.heroBackdropScrim} />
          </div>
          <div className={styles.heroFront}>
            <p className={styles.eyebrow}>{tr('about.title')}</p>
            <h1 className={styles.title}>{tr('about.hero.title')}</h1>
            <p className={styles.lede}>{tr('about.hero.description')}</p>
          </div>
        </header>
      </PageSection>

      <PageSection variant="tint">
        <section className={styles.section} aria-labelledby="about-what">
          <div className={styles.sectionAccent} aria-hidden />
          <div className={styles.sectionInner}>
            <h2 id="about-what" className={styles.h2}>
              {tr('about.whatThisSiteIs.title')}
            </h2>
            <p className={styles.p}>{tr('about.whatThisSiteIs.paragraph1')}</p>
            <p className={styles.pMuted}>{tr('about.whatThisSiteIs.paragraph2')}</p>
          </div>
        </section>
      </PageSection>

      <PageSection>
        <section className={styles.section} aria-labelledby="about-who">
          <div className={styles.sectionAccent} aria-hidden />
          <div className={styles.sectionInner}>
            <h2 id="about-who" className={styles.h2}>
              {tr('about.audience.title')}
            </h2>
            <ul className={styles.bullets}>
              <li>
                <span className={styles.bulletMark} aria-hidden />
                {tr('about.audience.item1')}
              </li>
              <li>
                <span className={styles.bulletMark} aria-hidden />
                {tr('about.audience.item2')}
              </li>
              <li>
                <span className={styles.bulletMark} aria-hidden />
                {tr('about.audience.item3')}
              </li>
            </ul>
          </div>
        </section>
      </PageSection>

      <PageSection variant="tint">
        <section className={styles.helps} aria-labelledby="about-helps">
          <h2 id="about-helps" className={styles.helpsTitle}>
            {tr('about.features.title')}
          </h2>
          <p className={styles.helpsIntro}>
            {tr('about.features.intro')}
          </p>
          <ul className={styles.helpGrid}>
            {helps.map((h) => (
              <li key={h.id} className={styles.helpCard}>
                <span className={styles.helpIcon} aria-hidden />
                <h3 className={styles.helpLabel}>{h.label}</h3>
                <p className={styles.helpLine}>{h.line}</p>
              </li>
            ))}
          </ul>
        </section>
      </PageSection>

      <PageSection>
        <section className={styles.section} aria-labelledby="about-how">
          <div className={styles.sectionAccent} aria-hidden />
          <div className={styles.sectionInner}>
            <h2 id="about-how" className={styles.h2}>
              {tr('about.howToUse.title')}
            </h2>
            <ol className={styles.steps}>
              <li>
                <span className={styles.stepNum} aria-hidden>
                  1
                </span>
                <div>
                  <strong className={styles.stepHead}>{tr('about.howToUse.step1.title')}</strong>
                  <p className={styles.stepText}>
                    {tr('about.howToUse.step1.description')}
                  </p>
                </div>
              </li>
              <li>
                <span className={styles.stepNum} aria-hidden>
                  2
                </span>
                <div>
                  <strong className={styles.stepHead}>{tr('about.howToUse.step2.title')}</strong>
                  <p className={styles.stepText}>
                    {tr('about.howToUse.step2.description')}
                  </p>
                </div>
              </li>
              <li>
                <span className={styles.stepNum} aria-hidden>
                  3
                </span>
                <div>
                  <strong className={styles.stepHead}>{tr('about.howToUse.step3.title')}</strong>
                  <p className={styles.stepText}>
                    {tr('about.howToUse.step3.description')}
                  </p>
                </div>
              </li>
            </ol>
            <div className={styles.ctaRow}>
              <ButtonLink to="/" hash="today-preview" end>
                {tr('about.cta.home')}
              </ButtonLink>
              <ButtonLink to="/practice" variant="ghost">
                {tr('about.cta.practice')}
              </ButtonLink>
            </div>
          </div>
        </section>
      </PageSection>

      <PageSection variant="tint">
        <aside className={styles.guidance} aria-labelledby="about-respect">
          <div className={styles.guidanceBar} aria-hidden />
          <div>
            <h2 id="about-respect" className={styles.guidanceTitle}>
              {tr('about.guidance.title')}
            </h2>
            <p className={styles.guidanceLead}>
              {tr('about.guidance.paragraph1')}
            </p>
            <p className={styles.guidanceBody}>
              {tr('about.guidance.paragraph2')}
            </p>
            <p className={styles.guidanceFoot}>
              {tr('about.guidance.paragraph3')}
            </p>
          </div>
        </aside>
      </PageSection>

      <PageSection>
        <section className={styles.vision} aria-labelledby="about-future">
          <h2 id="about-future" className={styles.visionTitle}>
            {tr('about.futureVision.title')}
          </h2>
          <p className={styles.visionText}>
            {tr('about.futureVision.description')}
          </p>
          <p className={styles.visionSignoff}>
            {tr('about.closing')}
          </p>
          <p className={styles.visionLink}>
            <Link to="/" className={styles.backLink}>
              {tr('about.backHome')}
            </Link>
          </p>
        </section>
      </PageSection>
    </>
  )
}
