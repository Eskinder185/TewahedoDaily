import { Navigate, Outlet, useLocation } from 'react-router-dom'
import { hasCmsRole, useAuth, type CmsRole } from './useAuth'

export function RequireCmsRole({ allowed }: { allowed?: readonly CmsRole[] }) {
  const { session, profile, loading, error, refreshProfile } = useAuth()
  const location = useLocation()
  if (loading) return <p role="status">Checking access…</p>
  if (!session) {
    return <Navigate to="/admin/login" replace state={{ from: location.pathname }} />
  }
  const problem = error && (
    <div role="alert">
      {error} <button onClick={() => void refreshProfile()}>Retry</button>
    </div>
  )
  if (error && !profile) return problem
  // Signed-in visitors without a CMS role should not loop on the login form.
  if (!hasCmsRole(profile, allowed)) return <Navigate to="/" replace />
  // Background verification failures should not destroy an unsaved editor.
  // Current RLS permissions still authorize every write independently.
  return (
    <>
      {problem}
      <Outlet />
    </>
  )
}
