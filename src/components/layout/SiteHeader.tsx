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
import { useTranslation } from '../../i18n'
import { useUiLabel } from '../../lib/i18n/uiLabels'
import { useAuth, hasCmsRole } from '../../lib/auth/useAuth'
import { EthiopianCross } from './EthiopianCross'
import { LanguageMenuButton } from './LanguageMenuButton'
import { LanguageToggle } from './LanguageToggle'
import { ThemeToggle } from './ThemeToggle'
import { prefetchPrimaryNav, prefetchRoute } from '../../lib/routePrefetch'
import styles from './SiteHeader.module.css'

const DRAWER_FOCUSABLE =
  'a[href], button:not([disabled]), [tabindex]:not([tabindex="-1"])'

function getFocusableIn(container: HTMLElement | null): HTMLElement[] {
  if (!container) return []
  return Array.from(container.querySelectorAll<HTMLElement>(DRAWER_FOCUSABLE)).filter(
    (el) => !el.hasAttribute('disabled'),
  )
}


function useIsDesktop() {
  const [isDesktop, setIsDesktop] = useState(() => {
    if (typeof window === 'undefined' || !window.matchMedia) return true
    return window.matchMedia('(min-width: 768px)').matches
  })

  useEffect(() => {
    if (typeof window === 'undefined' || !window.matchMedia) return
    const mq = window.matchMedia('(min-width: 768px)')
    const onChange = () => setIsDesktop(mq.matches)
    mq.addEventListener('change', onChange)
    return () => mq.removeEventListener('change', onChange)
  }, [])

  return isDesktop
}

export function SiteHeader() {
  const t = useUiLabel()
  const tt = useTranslation()
  const location = useLocation()
  const { session, loading: authLoading, isStaff, profile } = useAuth()
  // Guest-first: show Sign in immediately; swap to Account once session is known.
  const signedIn = Boolean(session)
  const showAccount = signedIn
  const showSignIn = !signedIn
  const showAdmin = !authLoading && signedIn && (isStaff || hasCmsRole(profile))
  const [menuOpen, setMenuOpen] = useState(false)
  const isDesktop = useIsDesktop()
  const menuButtonRef = useRef<HTMLButtonElement>(null)
  const drawerCloseRef = useRef<HTMLButtonElement>(null)
  const drawerPanelRef = useRef<HTMLDivElement>(null)
  const drawerTitleId = useId()
  const drawerId = useId()

  const closeMenu = useCallback(() => setMenuOpen(false), [])

  const isHome = location.pathname === '/'
  const modes = [
    {
      to: '/bible',
      label: t('navBible'),
      desc: t('navModeBibleDesc'),
    },
    {
      to: '/pray',
      label: t('navPray'),
      desc: t('navModePrayDesc'),
    },
    {
      to: '/hymns',
      label: t('navPractice'),
      desc: t('navModeLearnDesc'),
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
    prefetchPrimaryNav()
  }, [menuOpen])

  useEffect(() => {
    if (!menuOpen) return

    drawerCloseRef.current?.focus()

    const onKeyDown = (e: KeyboardEvent) => {
      if (e.key === 'Escape') {
        e.preventDefault()
        setMenuOpen(false)
      }
    }

    const mainEl = document.getElementById('main')
    const headerEl = document.querySelector('header[data-header]') as HTMLElement | null
    const inertTargets = [mainEl, headerEl].filter(Boolean) as HTMLElement[]
    for (const el of inertTargets) el.setAttribute('inert', '')

    const prevOverflow = document.body.style.overflow
    document.body.style.overflow = 'hidden'
    document.addEventListener('keydown', onKeyDown)
    const menuButton = menuButtonRef.current

    return () => {
      document.removeEventListener('keydown', onKeyDown)
      document.body.style.overflow = prevOverflow
      for (const el of inertTargets) el.removeAttribute('inert')
      menuButton?.focus()
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
                title={`${item.label} - ${item.desc}`}
                onClick={closeMenu}
                onPointerDown={() => prefetchRoute(item.to)}
                className={({ isActive }) =>
                  `${styles.drawerLink} ${isActive ? styles.drawerLinkOn : ''}`.trim()
                }
              >
                {item.label}
              </NavLink>
            ))}
            <div className={styles.drawerDivider} role="separator" />
            <div className={styles.drawerSecondary}>
              <NavLink
                to="/about"
                onClick={closeMenu}
                className={({ isActive }) =>
                  `${styles.drawerLink} ${styles.drawerSecondaryLink} ${isActive ? styles.drawerLinkOn : ''}`.trim()
                }
              >
                {t('navAbout')}
              </NavLink>
              <NavLink
                to="/legal"
                onClick={closeMenu}
                className={({ isActive }) =>
                  `${styles.drawerLink} ${styles.drawerSecondaryLink} ${isActive ? styles.drawerLinkOn : ''}`.trim()
                }
              >
                {tt('legal.title')}
              </NavLink>
            </div>
            <NavLink
              to="/account"
              onClick={closeMenu}
              className={({ isActive }) =>
                `${styles.drawerLink} ${isActive ? styles.drawerLinkOn : ''}`.trim()
              }
            >
              {tt('account.account')}
            </NavLink>
            {showAdmin ? (
              <NavLink
                to="/admin"
                onClick={closeMenu}
                className={({ isActive }) =>
                  `${styles.drawerLink} ${isActive ? styles.drawerLinkOn : ''}`.trim()
                }
              >
                {tt('account.admin')}
              </NavLink>
            ) : null}
            {showSignIn ? (
              <>
                <NavLink
                  to="/login"
                  onClick={closeMenu}
                  className={({ isActive }) =>
                    `${styles.drawerLink} ${isActive ? styles.drawerLinkOn : ''}`.trim()
                  }
                >
                  {tt('account.signIn')}
                </NavLink>
                <NavLink
                  to="/signup"
                  onClick={closeMenu}
                  className={({ isActive }) =>
                    `${styles.drawerLink} ${isActive ? styles.drawerLinkOn : ''}`.trim()
                  }
                >
                  {tt('auth.createAccount')}
                </NavLink>
              </>
            ) : null}
          </nav>
          <div className={styles.drawerTools}>
            <ThemeToggle />
            <LanguageToggle variant="full" />
          </div>
        </div>
      </div>,
      document.body,
    )

  return (
    <>
      <header className={`${styles.header} ${isHome ? styles.headerHome : ''}`.trim()} data-header>
        <div className={styles.bar}>
          <Link to="/" className={styles.brand}>
            <EthiopianCross className={styles.mark} />
            <span className={styles.brandText}>
              <span className={styles.wordmark}>{tt('brand.name')}</span>
              <span className={styles.brandSub}>{tt('brand.subtitle')}</span>
            </span>
          </Link>

          <nav className={styles.nav} aria-label={primaryNavLabel} aria-hidden={!isDesktop}>
            <NavLink
              to="/"
              end
              onPointerEnter={() => prefetchRoute('/')}
              onFocus={() => prefetchRoute('/')}
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
                title={item.desc}
                aria-label={item.label}
                onPointerEnter={() => prefetchRoute(item.to)}
                onFocus={() => prefetchRoute(item.to)}
                onPointerDown={() => prefetchRoute(item.to)}
                className={({ isActive }) =>
                  `${styles.modeLink} ${isActive ? styles.modeLinkOn : ''}`.trim()
                }
              >
                <span className={styles.modeLabel}>{item.label}</span>
                <span className={styles.modeDesc} aria-hidden="true">
                  {item.desc}
                </span>
              </NavLink>
            ))}
          </nav>

          <div className={styles.headerTools}>
            <div className={styles.toggleGroup}>
              <NavLink
                to="/about"
                className={({ isActive }) =>
                  `${styles.utilityLink} ${styles.desktopOnlyAbout} ${isActive ? styles.utilityLinkOn : ''}`.trim()
                }
              >
                {t('navAbout')}
              </NavLink>
              <NavLink
                to="/legal"
                className={({ isActive }) =>
                  `${styles.utilityLink} ${styles.desktopOnlyAbout} ${isActive ? styles.utilityLinkOn : ''}`.trim()
                }
              >
                {tt('legal.title')}
              </NavLink>
              {showAccount ? (
                <Link
                  to="/account"
                  className={styles.utilityLink}
                  aria-label={tt('account.account')}
                  title={tt('account.account')}
                >
                  {tt('account.account')}
                </Link>
              ) : null}
              {showSignIn ? (
                <Link
                  to="/login"
                  className={styles.utilityLink}
                  aria-label={tt('account.signIn')}
                  title={tt('account.signIn')}
                >
                  {tt('account.signIn')}
                </Link>
              ) : null}
              <span className={styles.compactChrome}>
                <ThemeToggle />
              </span>
              {/* Always visible on mobile — one-tap EN ↔ አማ (not in hamburger). */}
              <LanguageMenuButton className={styles.languageAlways} />
              <span className={styles.desktopLanguage}>
                <LanguageToggle />
              </span>
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
      </header>
      {drawer}
    </>
  )
}
