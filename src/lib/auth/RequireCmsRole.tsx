import { Navigate, Outlet, useLocation } from 'react-router-dom'
import { hasCmsRole, useAuth, type CmsRole } from './useAuth'

export function RequireCmsRole({ allowed }: { allowed?: readonly CmsRole[] }) {
  const { session, profile, loading, error, refreshProfile, signOut } = useAuth()
  const location = useLocation()

  if (loading) return <p role="status">Checking access…</p>

  if (!session) {
    return <Navigate to="/admin/login" replace state={{ from: location.pathname }} />
  }

  if (error && !profile) {
    return (
      <main style={{ maxWidth: 480, margin: '48px auto', padding: 24 }}>
        <p role="alert">{error}</p>
        <div style={{ display: 'flex', gap: 12, marginTop: 16, flexWrap: 'wrap' }}>
          <button type="button" onClick={() => void refreshProfile()}>
            Check access again
          </button>
          <button
            type="button"
            onClick={() => {
              void signOut().then(() => {
                window.location.assign('/admin/login')
              })
            }}
          >
            Sign out
          </button>
        </div>
      </main>
    )
  }

  // Null role or plain visitor — no CMS access (including any non-staff role).
  if (!hasCmsRole(profile, allowed)) {
    return <Navigate to="/admin/login" replace />
  }

  return <Outlet />
}
