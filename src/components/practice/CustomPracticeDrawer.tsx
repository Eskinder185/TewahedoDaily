import { useEffect, useId, useRef } from 'react'
import { useUiLabel } from '../../lib/i18n/uiLabels'
import type { ChantPracticePayload } from './chantPracticeModel'
import { CustomChantPractice } from './CustomChantPractice'
import styles from './CustomPracticeDrawer.module.css'

type Props = {
  open: boolean
  onClose: () => void
  onLoad: (payload: ChantPracticePayload) => void
}

export function CustomPracticeDrawer({ open, onClose, onLoad }: Props) {
  const t = useUiLabel()
  const panelRef = useRef<HTMLDivElement>(null)
  const titleId = useId()

  useEffect(() => {
    if (!open) return
    const onKey = (e: KeyboardEvent) => {
      if (e.key === 'Escape') onClose()
    }
    window.addEventListener('keydown', onKey)
    return () => window.removeEventListener('keydown', onKey)
  }, [open, onClose])

  useEffect(() => {
    if (open) panelRef.current?.focus()
  }, [open])

  useEffect(() => {
    if (!open) return
    const prev = document.body.style.overflow
    document.body.style.overflow = 'hidden'
    return () => {
      document.body.style.overflow = prev
    }
  }, [open])

  if (!open) return null

  return (
    <div className={styles.backdrop} role="presentation" onClick={onClose}>
      <div
        className={styles.panel}
        role="dialog"
        aria-modal="true"
        aria-labelledby={titleId}
        tabIndex={-1}
        ref={panelRef}
        onClick={(e) => e.stopPropagation()}
      >
        <header className={styles.head}>
          <div className={styles.headText}>
            <p className={styles.eyebrow}>{t('practiceCustomDrawerEyebrow')}</p>
            <h2 id={titleId} className={styles.title}>
              {t('practiceCustomDrawerTitle')}
            </h2>
            <p className={styles.deck}>{t('practiceCustomDrawerDeck')}</p>
          </div>
          <button type="button" className={styles.close} onClick={onClose}>
            {t('practiceCustomDrawerClose')}
          </button>
        </header>
        <div className={styles.body}>
          <CustomChantPractice
            onLoad={(payload) => {
              onLoad(payload)
              onClose()
            }}
          />
        </div>
      </div>
    </div>
  )
}
