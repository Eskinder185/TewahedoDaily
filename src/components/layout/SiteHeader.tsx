import { createPortal } from 'react-dom'
import {
  useCallback,
  useEffect,
  useId,
  useRef,
  useState,
  type KeyboardEvent as ReactKeyboardEvent,
} from 'react'
import { Link, NavLink, useLocation } from 'react-router-dom'
import { useUiLabel } from '../../lib/i18n/uiLabels'
import { LanguageToggle } from './LanguageToggle'
import { ThemeToggle } from './ThemeToggle'
import styles from './SiteHeader.module.css'

const DRAWER_FOCUSABLE =
  'a[href], button:not([disabled]), [tabindex]:not([tabindex="-1"])'

function getFocusableIn(container: HTMLElement | null): HTMLElement[] {
  if (!container) return []
  return Array.from(container.querySelectorAll<HTMLElement>(DRAWER_FOCUSABLE)).filter(
    (el) => !el.hasAttribute('disabled'),
  )
}

export function SiteHeader() {
  const t = useUiLabel()
  const location = useLocation()
  const [menuOpen, setMenuOpen] = useState(false)
  const menuButtonRef = useRef<HTMLButtonElement>(null)
  const drawerCloseRef = useRef<HTMLButtonElement>(null)
  const drawerPanelRef = useRef<HTMLDivElement>(null)
  const drawerTitleId = useId()
  const drawerId = useId()

  const closeMenu = useCallback(() => setMenuOpen(false), [])

  const modes = [
    {
      to: '/practice',
      label: t('navPractice'),
      desc: t('navModeLearnDesc'),
    },
    {
      to: '/prayers',
      label: t('navPray'),
      desc: t('navModePrayDesc'),
    },
    {
      to: '/calendar',
      label: t('navKeepDay'),
      desc: t('navModeKeepDayDesc'),
    },
  ]

  useEffect(() => {
    setMenuOpen(false)
  }, [location.pathname])

  useEffect(() => {
    if (!menuOpen) return

    drawerCloseRef.current?.focus()

    const onKeyDown = (e: KeyboardEvent) => {
      if (e.key === 'Escape') {
        e.preventDefault()
        setMenuOpen(false)
      }
    }

    const prevOverflow = document.body.style.overflow
    document.body.style.overflow = 'hidden'
    document.addEventListener('keydown', onKeyDown)

    return () => {
      document.removeEventListener('keydown', onKeyDown)
      document.body.style.overflow = prevOverflow
      menuButtonRef.current?.focus()
    }
  }, [menuOpen])

  const handleDrawerKeyDown = (e: ReactKeyboardEvent<HTMLDivElement>) => {
    if (e.key !== 'Tab' || !drawerPanelRef.current) return

    const nodes = getFocusableIn(drawerPanelRef.current)
    if (nodes.length === 0) return

    const first = nodes[0]
    const last = nodes[nodes.length - 1]

    if (e.shiftKey) {
      if (document.activeElement === first) {
        e.preventDefault()
        last.focus()
      }
    } else if (document.activeElement === last) {
      e.preventDefault()
      first.focus()
    }
  }

  const primaryNavLabel = t('navPrimaryNav')

  const drawer =
    menuOpen &&
    createPortal(
      <div className={styles.drawerRoot}>
        <div
          className={styles.drawerBackdrop}
          aria-hidden
          onClick={closeMenu}
        />
        <div
          ref={drawerPanelRef}
          id={drawerId}
          className={styles.drawer}
          role="dialog"
          aria-modal="true"
          aria-labelledby={drawerTitleId}
          onKeyDown={handleDrawerKeyDown}
        >
          <div className={styles.drawerTop}>
            <h2 id={drawerTitleId} className={styles.drawerTitle}>
              {t('navDrawerTitle')}
            </h2>
            <button
              ref={drawerCloseRef}
              type="button"
              className={styles.drawerClose}
              aria-label={t('navMenuClose')}
              onClick={closeMenu}
            >
              <span className={styles.drawerCloseIcon} aria-hidden />
            </button>
          </div>
          <nav className={styles.drawerNav} aria-label={primaryNavLabel}>
            <NavLink
              to="/"
              end
              onClick={closeMenu}
              className={({ isActive }) =>
                `${styles.drawerLink} ${isActive ? styles.drawerLinkOn : ''}`.trim()
              }
            >
              {t('navHome')}
            </NavLink>
            {modes.map((item) => (
              <NavLink
                key={item.to}
                to={item.to}
                title={`${item.label} — ${item.desc}`}
                onClick={closeMenu}
                className={({ isActive }) =>
                  `${styles.drawerLink} ${isActive ? styles.drawerLinkOn : ''}`.trim()
                }
              >
                {item.label}
              </NavLink>
            ))}
            <NavLink
              to="/about"
              onClick={closeMenu}
              className={({ isActive }) =>
                `${styles.drawerLink} ${isActive ? styles.drawerLinkOn : ''}`.trim()
              }
            >
              {t('navAbout')}
            </NavLink>
          </nav>
        </div>
      </div>,
      document.body,
    )

  return (
    <>
      <header className={styles.header} data-header>
        <div className={styles.bar}>
          <div className={styles.topRow}>
            <Link to="/" className={styles.brand}>
              <span className={styles.mark} aria-hidden />
              <span className={styles.brandText}>
                <span className={styles.wordmark}>Tewahedo Daily</span>
                <span className={styles.brandSub}>Quiet liturgical studio</span>
              </span>
            </Link>
            <div className={styles.headerTools}>
              <div className={styles.toggleGroup}>
                <ThemeToggle />
                <LanguageToggle />
              </div>
              <button
                ref={menuButtonRef}
                type="button"
                className={styles.menuTrigger}
                aria-expanded={menuOpen}
                aria-controls={drawerId}
                aria-label={menuOpen ? t('navMenuClose') : t('navMenuOpen')}
                onClick={() => setMenuOpen((o) => !o)}
              >
                <span className={styles.menuTriggerBars} aria-hidden>
                  <span className={styles.menuTriggerBar} />
                  <span className={styles.menuTriggerBar} />
                  <span className={styles.menuTriggerBar} />
                </span>
              </button>
            </div>
          </div>
          <nav className={styles.nav} aria-label={primaryNavLabel}>
            <NavLink
              to="/"
              end
              className={({ isActive }) =>
                `${styles.homeLink} ${isActive ? styles.homeLinkOn : ''}`.trim()
              }
            >
              {t('navHome')}
            </NavLink>
            {modes.map((item) => (
              <NavLink
                key={item.to}
                to={item.to}
                title={`${item.label} — ${item.desc}`}
                className={({ isActive }) =>
                  `${styles.modeLink} ${isActive ? styles.modeLinkOn : ''}`.trim()
                }
              >
                <span className={styles.modeLabel}>{item.label}</span>
                <span className={styles.modeDesc}>{item.desc}</span>
              </NavLink>
            ))}
            <NavLink
              to="/about"
              className={({ isActive }) =>
                `${styles.homeLink} ${isActive ? styles.homeLinkOn : ''}`.trim()
              }
            >
              {t('navAbout')}
            </NavLink>
          </nav>
        </div>
      </header>
      {drawer}
    </>
  )
}
