import { useState } from 'react'
import { Link, NavLink, Outlet, useLocation } from 'react-router-dom'
import { useAuth } from '../../lib/auth/useAuth'
import { errorMessage } from '../../lib/cms/mezmurService'
import s from './Admin.module.css'
  const links = ['Dashboard', 'Mezmur', 'Submissions', 'Saints', 'Feasts', 'Prayers', 'Articles', 'Categories', 'Singers', 'Tags', 'Media', 'Daily', 'Users', 'Settings']
export function AdminLayout() {
  const { profile, signOut } = useAuth()
  const [error, setError] = useState('')
  const [menu, setMenu] = useState(false)
  const location = useLocation()
  const section = location.pathname.split('/')[2] || 'Dashboard'
  const role = profile?.role || ''
  const visible = links.filter((name) => {
    if (name === 'Submissions') return ['editor', 'admin', 'super_admin'].includes(role)
    if (['Media', 'Daily', 'Users', 'Settings'].includes(name)) {
      return ['admin', 'super_admin'].includes(role)
    }
    return true
  })
  async function logout() {
    if (!window.confirm('Sign out? Any unsaved changes will be lost.')) return
    try { await signOut() } catch (cause) { setError(errorMessage(cause)) }
  }
  return <div className={s.root}>
    <aside className={`${s.sidebar} ${menu ? s.open : ''}`}>
      <Link to="/admin" className={s.brand}>✣ Tewahedo Daily<small>CONTENT ADMINISTRATION</small></Link>
      <nav aria-label="Admin navigation">{visible.map(name => <NavLink key={name} end={name === 'Dashboard'} to={name === 'Dashboard' ? '/admin' : `/admin/${name.toLowerCase()}`} onClick={() => setMenu(false)} className={({ isActive }) => isActive ? s.active : ''}>{name}</NavLink>)}</nav>
      <Link className={s.siteLink} to="/">← Open public site</Link>
    </aside>
    <div className={s.workspace}>
      <header className={s.topbar}>
        <button className={s.menu} aria-expanded={menu} onClick={() => setMenu(!menu)}>Menu</button>
        <span className={s.breadcrumb}>Admin <span>/</span> {section}</span>
        <div className={s.user}><strong>{profile?.display_name || profile?.email}</strong><small>{profile?.role?.replaceAll('_', ' ')}</small></div>
        <button onClick={() => void logout()}>Sign out</button>
      </header>
      <main className={s.main}>{error && <p role="alert" className={s.error}>{error}</p>}<Outlet /></main>
    </div>
  </div>
}
export function AdminPlaceholder() {
  const location = useLocation()
  const name = location.pathname.split('/')[2] || 'Section'
  return <><h1 className={s.capitalize}>{name}</h1><div className={s.card}><p>This section is reserved for a later phase.</p><Link to="/admin/mezmur">Manage Mezmur →</Link></div></>
}
