import { Link } from 'react-router-dom'
import { PageSection } from '../components/ui/PageSection'
import { usePageMeta } from '../lib/publicContent/usePageMeta'
import styles from './NotFoundPage.module.css'

const DESTINATIONS = [
  { to: '/', label: 'Home', desc: 'Start from the main page' },
  { to: '/today', label: 'Today in Church', desc: 'Today’s commemorations and readings' },
  { to: '/practice', label: 'Hymns Practice', desc: 'Browse and practice Mezmur' },
  { to: '/pray', label: 'Pray', desc: 'Prayers, Psalms, and liturgy' },
  { to: '/calendar', label: 'Calendar', desc: 'Church calendar and holy days' },
  { to: '/about', label: 'About', desc: 'About Tewahedo Daily' },
] as const

/**
 * Accessible public 404 for unknown routes.
 */
export function NotFoundPage() {
  usePageMeta('Page not found', 'This page does not exist on Tewahedo Daily.')

  return (
    <PageSection id="not-found" variant="tint" className={styles.page}>
      <header className={styles.head}>
        <p className={styles.eyebrow}>404</p>
        <h1 className={styles.title}>Page not found</h1>
        <p className={styles.lede}>
          That address is not part of Tewahedo Daily. Choose a main area below, or go home.
        </p>
      </header>

      <nav className={styles.nav} aria-label="Main areas">
        <ul className={styles.list}>
          {DESTINATIONS.map((item) => (
            <li key={item.to}>
              <Link to={item.to} className={styles.link}>
                <span className={styles.linkLabel}>{item.label}</span>
                <span className={styles.linkDesc}>{item.desc}</span>
              </Link>
            </li>
          ))}
        </ul>
      </nav>
    </PageSection>
  )
}
