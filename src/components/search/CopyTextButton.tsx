import { useEffect, useId, useRef, useState } from 'react'
import { useTranslation } from '../../i18n'
import { copyTextToClipboard } from '../../lib/searchBuddy/copySearchBuddyText.ts'
import styles from './CopyTextButton.module.css'

type Props = {
  text: string
  /** Optional compact placement inside result cards. */
  compact?: boolean
  className?: string
}

export function CopyTextButton({ text, compact, className }: Props) {
  const t = useTranslation()
  const [copied, setCopied] = useState(false)
  const timerRef = useRef<ReturnType<typeof setTimeout> | null>(null)
  const statusId = useId()
  const value = text.trim()

  useEffect(() => {
    return () => {
      if (timerRef.current) clearTimeout(timerRef.current)
    }
  }, [])

  if (!value) return null

  async function onCopy() {
    const ok = await copyTextToClipboard(value)
    if (!ok) return
    setCopied(true)
    if (timerRef.current) clearTimeout(timerRef.current)
    timerRef.current = setTimeout(() => setCopied(false), 1600)
  }

  return (
    <div className={`${styles.wrap} ${compact ? styles.compact : ''} ${className || ''}`.trim()}>
      <button
        type="button"
        className={styles.button}
        onClick={() => void onCopy()}
        aria-label={t('searchBuddy.copyAria')}
        aria-describedby={copied ? statusId : undefined}
      >
        {copied ? t('searchBuddy.copied') : t('searchBuddy.copy')}
      </button>
      {copied ? (
        <span id={statusId} className={styles.srOnly} role="status">
          {t('searchBuddy.copied')}
        </span>
      ) : null}
    </div>
  )
}
