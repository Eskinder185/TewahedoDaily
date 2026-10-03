/**
 * Public Legal page — editorial document layout.
 * Full legal notices remain in English (reviewed source language);
 * chrome and section titles follow the global UI locale.
 */
import { useEffect, useState } from 'react'
import { Link, useLocation } from 'react-router-dom'
import { useTranslation } from '../i18n'
import { useLocale } from '../lib/i18n/locale'
import { usePageMeta } from '../lib/publicContent/usePageMeta'
import styles from './LegalPage.module.css'

const SECTION_IDS = ['copyright', 'privacy', 'removal', 'sources'] as const

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

export function LegalPage() {
  const t = useTranslation()
  const { uiLocale: locale } = useLocale()
  const location = useLocation()
  const [activeId, setActiveId] = useState<string>(SECTION_IDS[0])

  const sections = SECTION_IDS.map((id, index) => ({
    id,
    num: String(index + 1).padStart(2, '0'),
    label: t(`legal.sections.${id}`),
    short: t(`legal.short.${id}`),
  }))

  usePageMeta(t('legal.title'), t('legal.metaDescription'))

  useEffect(() => {
    const hash = (location.hash || '').replace(/^#/, '')
    if (!hash) return
    const el = document.getElementById(hash)
    if (!el) return
    window.requestAnimationFrame(() => {
      el.scrollIntoView({ behavior: 'smooth', block: 'start' })
      setActiveId(hash)
    })
  }, [location.hash])

  useEffect(() => {
    const nodes = SECTION_IDS.map((id) => document.getElementById(id)).filter(
      (el): el is HTMLElement => Boolean(el),
    )
    if (!nodes.length) return

    const observer = new IntersectionObserver(
      (entries) => {
        const visible = entries
          .filter((e) => e.isIntersecting)
          .sort((a, b) => b.intersectionRatio - a.intersectionRatio)
        if (visible[0]?.target?.id) setActiveId(visible[0].target.id)
      },
      { rootMargin: '-20% 0px -55% 0px', threshold: [0.15, 0.35, 0.55] },
    )

    nodes.forEach((n) => observer.observe(n))
    return () => observer.disconnect()
  }, [])

  return (
    <div className={styles.page}>
      <section className={styles.hero} aria-labelledby="legal-hero-title">
        <div className={styles.heroInner}>
          <div className={styles.heroLeft}>
            <p className={styles.eyebrow}>{t('legal.eyebrow')}</p>
            <h1 id="legal-hero-title" className={styles.heroTitle}>
              {t('legal.title')}
            </h1>
          </div>
          <div className={styles.heroRight}>
            <p className={styles.heroLede}>{t('legal.lede')}</p>
          </div>
        </div>
      </section>

      <div className={styles.mobileNavWrap}>
        <nav className={styles.mobileNav} aria-label={t('legal.onThisPage')}>
          {sections.map((section) => (
            <a
              key={section.id}
              href={`#${section.id}`}
              className={activeId === section.id ? styles.mobileNavActive : undefined}
            >
              <span>{section.num}</span> {section.short}
            </a>
          ))}
        </nav>
      </div>

      <div className={styles.layout}>
        <nav className={styles.sideNav} aria-label={t('legal.onThisPage')}>
          <p className={styles.sideNavLabel}>{t('legal.onThisPage')}</p>
          <div className={styles.sideNavRule} aria-hidden />
          <ul>
            {sections.map((section) => (
              <li key={section.id}>
                <a
                  href={`#${section.id}`}
                  className={activeId === section.id ? styles.sideNavActive : undefined}
                  aria-current={activeId === section.id ? 'location' : undefined}
                >
                  <span className={styles.sideNum}>{section.num}</span>
                  {section.label}
                </a>
              </li>
            ))}
          </ul>
        </nav>

        <div className={styles.content}>
          {locale === 'am' ? (
            <p className={styles.languageNote} lang="am">
              {t('legal.originalLanguageNote')}
            </p>
          ) : null}

          <div lang="en">
            <section id="copyright" className={styles.section} aria-labelledby="copyright-heading">
              <span className={styles.secNum}>01</span>
              <h2 id="copyright-heading">{t('legal.sections.copyright')}</h2>
              <p>
                © 2026 Tewahedo Daily. Site design, original explanatory notes, and original
                presentation materials on this website are provided for learning and practice.
              </p>
              <p>
                Traditional liturgical, prayer, hymn, and Synaxarium materials belong to the Ethiopian
                Orthodox Tewahedo Church and her received tradition. Presenting them here does not
                claim ownership of the Church&apos;s texts, rites, or teachings.
              </p>
              <p>
                Third-party media (for example YouTube videos linked from hymn pages) remain under
                their respective owners&apos; rights. Links and embeds are offered for study and
                practice; they are not republished as our own works.
              </p>
            </section>

            <section id="privacy" className={styles.section} aria-labelledby="privacy-heading">
              <span className={styles.secNum}>02</span>
              <h2 id="privacy-heading">{t('legal.sections.privacy')}</h2>
              <p>
                Basic account features (such as signing in and saving favorites) use the authentication
                and storage services configured for this site. Practice recordings made in the browser
                stay on your device unless you choose otherwise.
              </p>
              <p>
                Community submissions may ask for contact details so editors can follow up. Submitted
                contact information is handled as private editorial correspondence and is not shown on
                public content pages. See also the public About page note that this website supports
                learning and does not replace your priest, parish, or father of confession.
              </p>
              <p>
                This notice describes how the live site is built today. It is not a comprehensive
                privacy policy and does not make certification claims about third-party processors.
              </p>
            </section>

            <section id="removal" className={styles.section} aria-labelledby="removal-heading">
              <span className={styles.secNum}>03</span>
              <h2 id="removal-heading">{t('legal.sections.removal')}</h2>
              <p>
                If you believe content hosted or linked here should be corrected or removed — for
                example a hymn record, media credit, or inaccurate note — please send a correction
                through the existing request form.
              </p>
              <p className={styles.actionRow}>
                <Link to="/suggest-correction" className={styles.btnPrimary}>
                  {t('legal.suggestCorrection')}
                </Link>
              </p>
              <div className={styles.helperNote}>
                <span className={styles.helperBar} aria-hidden />
                <p>
                  Include the page URL, what should change, and any source that helps editors verify
                  the request. Editorial review is required before public content changes. There is no
                  automated guarantee of timing or outcome.
                </p>
              </div>
            </section>

            <section id="sources" className={styles.section} aria-labelledby="sources-heading">
              <span className={styles.secNum}>04</span>
              <h2 id="sources-heading">{t('legal.sections.sources')}</h2>
              <p>
                Tewahedo Daily aims to point readers toward the Church: parish life, liturgical books,
                and received practice. Calendar observances, prayer texts, and hymn materials are drawn
                from structured Church-facing sources and editorial review inside the site&apos;s
                content systems.
              </p>
              <p>Where a page shows a source video or reference, follow that credit.</p>

              <blockquote className={styles.pullQuote}>
                <span className={styles.pullBar} aria-hidden />
                <div className={styles.pullMark} aria-hidden>
                  <span className={styles.ruleLineShort} />
                  <EthCross className={styles.ruleCross} />
                </div>
                <p>
                  “If something here disagrees with your bishop, books, or father of confession, trust
                  them — not a website.”
                </p>
              </blockquote>

              <p className={styles.aboutLink}>
                {t('legal.aboutLinkLead')} <Link to="/about">{t('legal.aboutLink')}</Link>
              </p>
            </section>
          </div>
        </div>
      </div>
    </div>
  )
}
