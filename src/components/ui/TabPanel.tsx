import {
  useId,
  useLayoutEffect,
  useRef,
  useState,
  type KeyboardEvent,
  type ReactNode,
} from 'react'
import { scrollElementNodeIntoView } from '../../lib/scrollUtils'
import styles from './TabPanel.module.css'

export type TabItem = {
  id: string
  label: string
  content: ReactNode
}

type TabPanelProps = {
  tabs: TabItem[]
  initialId?: string
  /** Controlled selection (e.g. sync with URL hash). */
  selectedId?: string
  onSelectedIdChange?: (id: string) => void
  className?: string
  /** Larger segmented control for practice hub. */
  variant?: 'default' | 'practice' | 'compact'
  /**
   * With `variant="compact"`, use a wrapped grid on narrow viewports instead of a horizontal
   * scrolling tab row (better for prayer language tabs on phones).
   */
  compactWrap?: boolean
  /** Accessible name for the tab list (screen readers). */
  tablistAriaLabel?: string
  /** Split tab list and panel across the DOM (e.g. sticky language bar). Use the same `ariaIdPrefix` for both parts. */
  renderMode?: 'full' | 'tablist' | 'panel'
  /** Shared id stem when `renderMode` splits markup — pass the same value from `useId()` on both mounts. */
  ariaIdPrefix?: string
  /**
   * When true (default for `compact` and `practice`), scroll the active tabpanel to the top
   * of the viewport (respecting `scroll-margin` on the panel) after the selection changes.
   */
  scrollPanelIntoViewOnTabChange?: boolean
}

export function TabPanel({
  tabs,
  initialId,
  selectedId: selectedIdProp,
  onSelectedIdChange,
  className = '',
  variant = 'default',
  compactWrap = false,
  tablistAriaLabel = 'Sections',
  renderMode = 'full',
  ariaIdPrefix,
  scrollPanelIntoViewOnTabChange,
}: TabPanelProps) {
  const generatedId = useId()
  const baseId = ariaIdPrefix ?? generatedId
  const panelRef = useRef<HTMLDivElement>(null)
  const prevActiveRef = useRef<string | null>(null)

  const shouldScrollPanel =
    scrollPanelIntoViewOnTabChange ??
    (variant === 'compact' || variant === 'practice')
  const [uncontrolled, setUncontrolled] = useState(
    initialId ?? tabs[0]?.id ?? '',
  )

  const controlled = selectedIdProp !== undefined
  const active = controlled ? selectedIdProp! : uncontrolled

  const setActive = (id: string) => {
    if (controlled) onSelectedIdChange?.(id)
    else setUncontrolled(id)
  }

  useLayoutEffect(() => {
    if (!shouldScrollPanel) return
    if (renderMode === 'tablist') return

    if (prevActiveRef.current === null) {
      prevActiveRef.current = active
      return
    }
    if (prevActiveRef.current === active) return
    prevActiveRef.current = active

    scrollElementNodeIntoView(panelRef.current, { smooth: false, block: 'start' })
  }, [active, renderMode, shouldScrollPanel])

  const focusTabByIndex = (index: number) => {
    const tab = tabs[index]
    if (!tab) return
    const id = `${baseId}-tab-${tab.id}`
    requestAnimationFrame(() => {
      document.getElementById(id)?.focus()
    })
  }

  const handleTabListKeyDown = (e: KeyboardEvent<HTMLDivElement>) => {
    const t = e.target as HTMLElement | null
    if (!t || t.getAttribute('role') !== 'tab') return

    const currentId = t.id
    const fromIndex = tabs.findIndex(
      (tab) => `${baseId}-tab-${tab.id}` === currentId,
    )
    if (fromIndex < 0) return

    if (e.key === 'ArrowRight' || e.key === 'ArrowDown') {
      e.preventDefault()
      const next = (fromIndex + 1) % tabs.length
      setActive(tabs[next]!.id)
      focusTabByIndex(next)
    } else if (e.key === 'ArrowLeft' || e.key === 'ArrowUp') {
      e.preventDefault()
      const next = (fromIndex - 1 + tabs.length) % tabs.length
      setActive(tabs[next]!.id)
      focusTabByIndex(next)
    } else if (e.key === 'Home') {
      e.preventDefault()
      setActive(tabs[0]!.id)
      focusTabByIndex(0)
    } else if (e.key === 'End') {
      e.preventDefault()
      const last = tabs.length - 1
      setActive(tabs[last]!.id)
      focusTabByIndex(last)
    }
  }

  const activeTab = tabs.find((t) => t.id === active) ?? tabs[0]

  if (!activeTab) return null

  const tablistClass =
    variant === 'practice'
      ? `${styles.tablist} ${styles.tablistPractice}`
      : variant === 'compact'
        ? `${styles.tablist} ${styles.tablistCompact}${compactWrap ? ` ${styles.tablistCompactWrap}` : ''}`
        : styles.tablist

  const tabClass =
    variant === 'practice'
      ? `${styles.tab} ${styles.tabPractice}`
      : variant === 'compact'
        ? `${styles.tab} ${styles.tabCompact}`
        : styles.tab

  const panelId = `${baseId}-panel`

  const tablist = (
    <div
      role="tablist"
      aria-label={tablistAriaLabel}
      aria-orientation="horizontal"
      className={tablistClass}
      onKeyDown={handleTabListKeyDown}
    >
      {tabs.map((tab) => {
        const selected = tab.id === activeTab.id
        const tabId = `${baseId}-tab-${tab.id}`
        return (
          <button
            key={tab.id}
            type="button"
            role="tab"
            id={tabId}
            aria-selected={selected}
            aria-controls={panelId}
            tabIndex={selected ? 0 : -1}
            className={`${tabClass} ${selected ? styles.tabSelected : ''}`}
            onClick={() => setActive(tab.id)}
          >
            {tab.label}
          </button>
        )
      })}
    </div>
  )

  const panelTabStop = variant === 'compact'

  const tabpanel = (
    <div
      ref={panelRef}
      role="tabpanel"
      id={panelId}
      tabIndex={panelTabStop ? 0 : undefined}
      aria-labelledby={`${baseId}-tab-${activeTab.id}`}
      className={styles.panel}
    >
      <div id={activeTab.id} className={styles.anchor}>
        {activeTab.content}
      </div>
    </div>
  )

  if (renderMode === 'tablist') {
    return <div className={className.trim()}>{tablist}</div>
  }

  if (renderMode === 'panel') {
    return (
      <div
        className={`${styles.root} ${variant === 'practice' ? styles.rootPractice : variant === 'compact' ? styles.rootCompact : ''} ${className}`.trim()}
      >
        {tabpanel}
      </div>
    )
  }

  return (
    <div
      className={`${styles.root} ${variant === 'practice' ? styles.rootPractice : variant === 'compact' ? styles.rootCompact : ''} ${className}`.trim()}
    >
      {tablist}
      {tabpanel}
    </div>
  )
}
