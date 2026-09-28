import { Link } from 'react-router-dom'
import { useTranslation } from '../../i18n'
import { hasCmsRole, useAuth } from '../../lib/auth/useAuth'
import styles from './SiteFooter.module.css'

const PORTFOLIO_URL = 'https://eskinder.dev/'

function IconShield({ className }: { className?: string }) {
  return (
    <svg
      className={className}
      viewBox="0 0 24 24"
      fill="none"
      stroke="currentColor"
      strokeWidth="1.5"
      strokeLinecap="round"
      strokeLinejoin="round"
      aria-hidden
    >
      <path d="M12 3l7 3v5c0 5-3.5 8.5-7 10-3.5-1.5-7-5-7-10V6l7-3z" />
    </svg>
  )
}

/**
 * Subtle footer entry to the CMS. Visibility uses the shared Supabase session
 * + profiles.role via hasCmsRole (contributor | editor | admin | super_admin).
 */
function AdminAccessLink() {
  const { session, profile, loading } = useAuth()

  if (loading) return null

  // Signed-in visitors without a CMS role (e.g. role "user") never see this link.
  if (session && !hasCmsRole(profile)) return null

  const to = session ? '/admin' : '/admin/login'
  const label = session ? 'Admin Dashboard' : 'Admin Login'

  return (
    <Link to={to} className={styles.adminLink} aria-label={label}>
      <IconShield className={styles.adminIcon} />
      <span>{label}</span>
    </Link>
  )
}

export function SiteFooter() {
  const t = useTranslation()
  const year = new Date().getFullYear()

  return (
    <footer className={styles.footer}>
      <div className={styles.inner}>
        <div className={styles.brand}>
          <p className={styles.name}>{t('brand.name')}</p>
        </div>
        <p className={styles.portfolioWrap}>
          <a
            href={PORTFOLIO_URL}
            className={styles.portfolio}
            target="_blank"
            rel="noopener noreferrer"
          >
            {t('footer.portfolio')}
          </a>
        </p>
        <p className={styles.copy}>{t('footer.copyright', { year })}</p>
        <nav className={styles.utilityNav} aria-label="Site utilities">
          <Link to="/submit-mezmur" className={styles.utilityLink}>
            Submit a Mezmur
          </Link>
          <Link to="/saved" className={styles.utilityLink}>
            Saved
          </Link>
          <AdminAccessLink />
        </nav>
      </div>
    </footer>
  )
}
