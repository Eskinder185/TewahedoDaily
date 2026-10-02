/**
 * Public Legal page — factual notices only.
 * Wording draws from existing About guidance and site attribution practices.
 * Does not invent warranties, GDPR claims, or removal SLAs.
 */
import { useEffect } from 'react'
import { Link, useLocation } from 'react-router-dom'
import { PageSection } from '../components/ui/PageSection'
import { usePageMeta } from '../lib/publicContent/usePageMeta'
import styles from './LegalPage.module.css'

const SECTIONS = [
  { id: 'copyright', label: 'Copyright' },
  { id: 'privacy', label: 'Privacy' },
  { id: 'removal', label: 'Removal requests' },
  { id: 'sources', label: 'Sources' },
] as const

export function LegalPage() {
  const location = useLocation()
  usePageMeta(
    'Legal',
    'Copyright, privacy, removal requests, and source notes for Tewahedo Daily.',
  )

  useEffect(() => {
    const hash = (location.hash || '').replace(/^#/, '')
    if (!hash) return
    const el = document.getElementById(hash)
    if (el) {
      window.requestAnimationFrame(() => {
        el.scrollIntoView({ behavior: 'smooth', block: 'start' })
      })
    }
  }, [location.hash])

  return (
    <PageSection>
      <article className={styles.page}>
        <header className={styles.header}>
          <p className={styles.eyebrow}>Tewahedo Daily</p>
          <h1 className={styles.title}>Legal</h1>
          <p className={styles.lede}>
            Short notices about copyright, privacy, content removal, and sources. This page is
            informational and does not replace pastoral guidance or professional legal advice.
          </p>
          <nav className={styles.toc} aria-label="Legal sections">
            {SECTIONS.map((section) => (
              <a key={section.id} href={`#${section.id}`}>
                {section.label}
              </a>
            ))}
          </nav>
        </header>

        <section id="copyright" className={styles.section} aria-labelledby="copyright-heading">
          <h2 id="copyright-heading">Copyright</h2>
          <p>
            © {new Date().getFullYear()} Tewahedo Daily. Site design, original explanatory notes,
            and original presentation materials on this website are provided for learning and
            practice.
          </p>
          <p>
            Traditional liturgical, prayer, hymn, and Synaxarium materials belong to the Ethiopian
            Orthodox Tewahedo Church and her received tradition. Presenting them here does not claim
            ownership of the Church&apos;s texts, rites, or teachings.
          </p>
          <p>
            Third-party media (for example YouTube videos linked from hymn pages) remain under their
            respective owners&apos; rights. Links and embeds are offered for study and practice;
            they are not republished as our own works.
          </p>
        </section>

        <section id="privacy" className={styles.section} aria-labelledby="privacy-heading">
          <h2 id="privacy-heading">Privacy</h2>
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
            This notice describes how the live site is built today. It is not a comprehensive privacy
            policy and does not make certification claims about third-party processors.
          </p>
        </section>

        <section id="removal" className={styles.section} aria-labelledby="removal-heading">
          <h2 id="removal-heading">Removal requests</h2>
          <p>
            If you believe content hosted or linked here should be corrected or removed — for
            example a hymn record, media credit, or inaccurate note — please send a correction
            through the existing request form:
          </p>
          <p>
            <Link to="/suggest-correction">Suggest a correction</Link>
          </p>
          <p>
            Include the page URL, what should change, and any source that helps editors verify the
            request. Editorial review is required before public content changes. There is no
            automated guarantee of timing or outcome.
          </p>
        </section>

        <section id="sources" className={styles.section} aria-labelledby="sources-heading">
          <h2 id="sources-heading">Sources</h2>
          <p>
            Tewahedo Daily aims to point readers toward the Church: parish life, liturgical books,
            and received practice. Calendar observances, prayer texts, and hymn materials are drawn
            from structured Church-facing sources and editorial review inside the site&apos;s
            content systems.
          </p>
          <p>
            Where a page shows a source video or reference, follow that credit. If something here
            disagrees with your bishop, books, or father of confession, trust them — not a website.
          </p>
          <p>
            For product background and intent, see <Link to="/about">About</Link>.
          </p>
        </section>
      </article>
    </PageSection>
  )
}
