import { NavLink } from 'react-router-dom'
import type { ReactNode } from 'react'
import styles from './ButtonLink.module.css'

type ButtonLinkProps = {
  to: string
  /** Fragment without `#`, e.g. `today` for `/#today`. */
  hash?: string
  children: ReactNode
  variant?: 'primary' | 'ghost' | 'soft'
  className?: string
  /** Use for home (`/`) so `/practice` does not mark Home active. */
  end?: boolean
}

export function ButtonLink({
  to,
  hash,
  children,
  variant = 'primary',
  className = '',
  end,
}: ButtonLinkProps) {
  const dest = hash ? { pathname: to, hash } : to

  return (
    <NavLink
      to={dest}
      end={end}
      className={({ isActive }) =>
        `${styles.btn} ${styles[variant]} ${isActive ? styles.active : ''} ${className}`.trim()
      }
    >
      {children}
    </NavLink>
  )
}
