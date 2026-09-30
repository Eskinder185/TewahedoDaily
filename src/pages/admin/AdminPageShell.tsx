import { NavLink, Outlet, useLocation } from 'react-router-dom'
import s from './Admin.module.css'

export type AdminPageTab = {
  to: string
  label: string
  end?: boolean
}

type Props = {
  eyebrow: string
  title: string
  description: string
  tabs: AdminPageTab[]
  /** When false, only render the shell chrome (for overview that owns its own content). */
  withOutlet?: boolean
  children?: React.ReactNode
}

/**
 * Shared page-based CMS chrome: public-page context + secondary tabs.
 */
export function AdminPageShell({
  eyebrow,
  title,
  description,
  tabs,
  withOutlet = true,
  children,
}: Props) {
  const location = useLocation()

  return (
    <div className={s.pageShell}>
      <div className={s.pageShellHead}>
        <p className={s.eyebrow}>{eyebrow}</p>
        <h1 className={s.pageShellTitle}>{title}</h1>
        <p className={s.muted}>{description}</p>
      </div>

      <nav className={s.pageTabs} aria-label={`${title} sections`}>
        {tabs.map((tab) => (
          <NavLink
            key={tab.to}
            to={tab.to}
            end={tab.end}
            className={({ isActive }) => {
              // Keep parent tab active for nested edit routes (e.g. /mezmur/:id/edit)
              const nestedActive =
                !tab.end &&
                location.pathname.startsWith(tab.to.replace(/\/$/, '') + '/') &&
                tab.to !== location.pathname
              return isActive || nestedActive ? s.pageTabActive : undefined
            }}
          >
            {tab.label}
          </NavLink>
        ))}
      </nav>

      <div className={s.pageShellBody}>
        {children}
        {withOutlet ? <Outlet /> : null}
      </div>
    </div>
  )
}

export type OverviewTile = {
  to: string
  label: string
  detail: string
  count?: string | number | null
}

export function AdminOverviewGrid({ tiles }: { tiles: OverviewTile[] }) {
  return (
    <div className={s.overviewGrid}>
      {tiles.map((tile) => (
        <NavLink key={tile.to} to={tile.to} className={s.overviewTile}>
          <strong>{tile.label}</strong>
          {tile.count != null && tile.count !== '' ? (
            <span className={s.overviewCount}>{tile.count}</span>
          ) : null}
          <span className={s.muted}>{tile.detail}</span>
        </NavLink>
      ))}
    </div>
  )
}
