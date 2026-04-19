import { Outlet } from 'react-router-dom'
import { SiteHeader } from './SiteHeader'
import { SiteFooter } from './SiteFooter'
import styles from './AppShell.module.css'

export function AppShell() {
  return (
    <div className={styles.shell}>
      <SiteHeader />
      <main className={styles.main} id="main">
        <Outlet />
      </main>
      <SiteFooter />
    </div>
  )
}
