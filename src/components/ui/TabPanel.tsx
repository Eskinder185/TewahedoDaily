import { useId, useState, type ReactNode } from 'react'
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
  /** Accessible name for the tab list (screen readers). */
  tablistAriaLabel?: string
  /** Split tab list and panel across the DOM (e.g. sticky language bar). Use the same `ariaIdPrefix` for both parts. */
  renderMode?: 'full' | 'tablist' | 'panel'
  /** Shared id stem when `renderMode` splits markup — pass the same value from `useId()` on both mounts. */
  ariaIdPrefix?: string
}

export function TabPanel({
  tabs,
  initialId,
  selectedId: selectedIdProp,
  onSelectedIdChange,
  className = '',
  variant = 'default',
  tablistAriaLabel = 'Sections',
  renderMode = 'full',
  ariaIdPrefix,
}: TabPanelProps) {
  const generatedId = useId()
  const baseId = ariaIdPrefix ?? generatedId
  const [uncontrolled, setUncontrolled] = useState(
    initialId ?? tabs[0]?.id ?? '',
  )

  const controlled = selectedIdProp !== undefined
  const active = controlled ? selectedIdProp! : uncontrolled

  const setActive = (id: string) => {
    if (controlled) onSelectedIdChange?.(id)
    else setUncontrolled(id)
  }

  const activeTab = tabs.find((t) => t.id === active) ?? tabs[0]

  if (!activeTab) return null

  const tablistClass =
    variant === 'practice'
      ? `${styles.tablist} ${styles.tablistPractice}`
      : variant === 'compact'
        ? `${styles.tablist} ${styles.tablistCompact}`
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
      className={tablistClass}
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

  const tabpanel = (
    <div
      role="tabpanel"
      id={panelId}
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
