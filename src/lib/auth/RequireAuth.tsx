import { Navigate, Outlet, useLocation } from 'react-router-dom'
import { Link } from 'react-router-dom'
import { useAuth } from './useAuth'
import styles from '../../pages/auth/AuthPages.module.css'

/** Soft gate for /account/* synced features — never used on public content routes. */
export function RequireAuth() {
  const { isAuthenticated, loading } = useAuth()
  const location = useLocation()

  if (loading) {
    return (
      <section className={styles.shell}>
        <p className={styles.status} role="status">
          Checking your session…
        </p>
      </section>
    )
  }

  if (!isAuthenticated) {
    const next = encodeURIComponent(location.pathname + location.search)
    return (
      <section className={styles.shell}>
        <h1 className={styles.title}>Your account</h1>
        <p className={styles.lead}>Sign in to access your synced account.</p>
        <div className={styles.actions}>
          <Link className={styles.primary} to={`/login?next=${next}`}>
            Sign in
          </Link>
          <Link className={styles.secondary} to="/">
            Continue browsing
          </Link>
        </div>
      </section>
    )
  }

  return <Outlet />
}

/** Redirect authenticated users away from login/signup. */
export function RedirectIfAuthenticated({ children }: { children: React.ReactNode }) {
  const { isAuthenticated, loading } = useAuth()
  const location = useLocation()
  const params = new URLSearchParams(location.search)
  const next = params.get('next') || '/account'

  if (loading) {
    return (
      <section className={styles.shell}>
        <p className={styles.status} role="status">
          Restoring session…
        </p>
      </section>
    )
  }
  if (isAuthenticated) return <Navigate to={next} replace />
  return <>{children}</>
}
