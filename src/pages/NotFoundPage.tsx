import { Link } from 'react-router-dom'
import { PageSection } from '../components/ui/PageSection'
import { useTranslation } from '../i18n'
import { usePageMeta } from '../lib/publicContent/usePageMeta'
import styles from './NotFoundPage.module.css'

/**
 * Accessible public 404 for unknown routes.
 */
export function NotFoundPage() {
  const t = useTranslation()

  usePageMeta(t('notFound.title'), t('notFound.metaDescription'))

  const destinations = [
    { to: '/', label: t('notFound.home'), desc: t('notFound.homeDesc') },
    { to: '/today', label: t('notFound.today'), desc: t('notFound.todayDesc') },
    { to: '/practice', label: t('notFound.practice'), desc: t('notFound.practiceDesc') },
    { to: '/pray', label: t('notFound.pray'), desc: t('notFound.prayDesc') },
    { to: '/calendar', label: t('notFound.calendar'), desc: t('notFound.calendarDesc') },
    { to: '/about', label: t('notFound.about'), desc: t('notFound.aboutDesc') },
  ] as const

  return (
    <PageSection id="not-found" variant="tint" className={styles.page}>
      <header className={styles.head}>
        <p className={styles.eyebrow}>404</p>
        <h1 className={styles.title}>{t('notFound.title')}</h1>
        <p className={styles.lede}>{t('notFound.lede')}</p>
      </header>

      <nav className={styles.nav} aria-label={t('notFound.navAria')}>
        <ul className={styles.list}>
          {destinations.map((item) => (
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
