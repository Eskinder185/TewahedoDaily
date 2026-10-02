import { useState } from 'react'
import { Link, NavLink, Outlet, useLocation, useNavigate } from 'react-router-dom'
import { useAuth } from '../../lib/auth/useAuth'
import { errorMessage } from '../../lib/cms/mezmurService'
import s from './Admin.module.css'

type NavItem = {
  label: string
  to: string
  end?: boolean
  roles?: string[]
}

const NAV: NavItem[] = [
  { label: 'Dashboard', to: '/admin', end: true },
  { label: 'Home', to: '/admin/home' },
  { label: 'Hymns Practice', to: '/admin/hymns' },
  { label: 'Pray', to: '/admin/pray' },
  { label: 'Calendar', to: '/admin/calendar' },
  { label: 'About', to: '/admin/about' },
  { label: 'Content Health', to: '/admin/content-health', roles: ['editor', 'admin', 'super_admin'] },
  { label: 'Submissions', to: '/admin/submissions', roles: ['editor', 'admin', 'super_admin'] },
  { label: 'Media', to: '/admin/media', roles: ['admin', 'super_admin'] },
  { label: 'Users', to: '/admin/users', roles: ['admin', 'super_admin'] },
  { label: 'Settings', to: '/admin/settings', roles: ['admin', 'super_admin'] },
]

function roleLabel(role: string | null | undefined) {
  if (!role) return 'No role'
  return role.replaceAll('_', ' ')
}

function sectionLabel(pathname: string): string {
  const part = pathname.split('/')[2] || 'dashboard'
  const map: Record<string, string> = {
    home: 'Home',
    hymns: 'Hymns Practice',
    pray: 'Pray',
    calendar: 'Calendar',
    about: 'About',
    'content-health': 'Content Health',
    submissions: 'Submissions',
    media: 'Media',
    users: 'Users',
    settings: 'Settings',
    mezmur: 'Hymns Practice',
    prayers: 'Pray',
    liturgy: 'Pray',
    synaxarium: 'Calendar',
    saints: 'Calendar',
    feasts: 'Calendar',
    daily: 'Calendar',
    categories: 'Hymns Practice',
    singers: 'Hymns Practice',
    tags: 'Hymns Practice',
  }
  return map[part] || part
}

export function AdminLayout() {
  const { profile, signOut } = useAuth()
  const navigate = useNavigate()
  const [menu, setMenu] = useState(false)
  const [logoutError, setLogoutError] = useState('')
  const [signingOut, setSigningOut] = useState(false)
  const location = useLocation()
  const role = profile?.role || ''
  const displayName =
    profile?.display_name?.trim() ||
    profile?.email?.trim() ||
    'CMS user'
  const visible = NAV.filter((item) => !item.roles || item.roles.includes(role))

  async function logout() {
    if (!window.confirm('Sign out? Any unsaved changes will be lost.')) return
    setSigningOut(true)
    setLogoutError('')
    try {
      await signOut()
      setMenu(false)
      navigate('/admin/login', { replace: true })
    } catch (cause) {
      setLogoutError(errorMessage(cause))
    } finally {
      setSigningOut(false)
    }
  }

  const account = (
    <div className={s.account}>
      <div className={s.userBlock}>
        <strong>{displayName}</strong>
        <small>{roleLabel(profile?.role)}</small>
      </div>
      <button type="button" className={s.signOut} onClick={() => void logout()} disabled={signingOut}>
        {signingOut ? 'Signing out…' : 'Sign out'}
      </button>
      {logoutError && (
        <p role="alert" className={s.accountError}>
          {logoutError}
        </p>
      )}
    </div>
  )

  return (
    <div className={s.root}>
      <aside id="admin-sidebar" className={`${s.sidebar} ${menu ? s.open : ''}`}>
        <Link to="/admin" className={s.brand} onClick={() => setMenu(false)}>
          ✣ Tewahedo Daily
          <small>CONTENT ADMINISTRATION</small>
        </Link>
        <nav aria-label="Admin navigation">
          {visible.map((item) => (
            <NavLink
              key={item.to}
              end={item.end}
              to={item.to}
              onClick={() => setMenu(false)}
              className={({ isActive }) => {
                const nested =
                  !item.end &&
                  item.to !== '/admin' &&
                  location.pathname.startsWith(item.to + '/')
                return isActive || nested ? s.active : ''
              }}
            >
              {item.label}
            </NavLink>
          ))}
        </nav>
        <Link className={s.siteLink} to="/" onClick={() => setMenu(false)}>
          ← Open public site
        </Link>
        {account}
      </aside>
      <div className={s.workspace}>
        <header className={s.topbar}>
          <button
            type="button"
            className={s.menu}
            aria-expanded={menu}
            aria-controls="admin-sidebar"
            onClick={() => setMenu(!menu)}
          >
            Menu
          </button>
          <span className={s.breadcrumb}>
            Admin <span>/</span> {sectionLabel(location.pathname)}
          </span>
          <div className={s.topUser}>
            <strong>{displayName}</strong>
            <small>{roleLabel(profile?.role)}</small>
          </div>
          <button type="button" className={s.topSignOut} onClick={() => void logout()} disabled={signingOut}>
            {signingOut ? 'Signing out…' : 'Sign out'}
          </button>
        </header>
        <main className={s.main}>
          <Outlet />
        </main>
      </div>
    </div>
  )
}

export function AdminPlaceholder() {
  const location = useLocation()
  const name = location.pathname.split('/')[2] || 'Section'
  return (
    <>
      <h1 className={s.capitalize}>{name}</h1>
      <div className={s.card}>
        <p>This section is reserved for a later phase.</p>
        <Link to="/admin/hymns/mezmur">Manage Hymns Practice →</Link>
      </div>
    </>
  )
}
