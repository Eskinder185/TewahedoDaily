import { useEffect, useState } from 'react'
import { useTranslation } from '../../i18n'
import {
  ensureNotificationPermission,
  getCalendarReminderPrefs,
  setCalendarReminderPrefs,
  type CalendarReminderPrefs,
} from '../../lib/calendar/calendarReminders'
import styles from './CalendarReminderToggle.module.css'

type PermissionState = NotificationPermission | 'checking' | 'unsupported'

function BellIcon() {
  return (
    <svg viewBox="0 0 24 24" aria-hidden="true" focusable="false">
      <path d="M18 8a6 6 0 0 0-12 0c0 7-3 7-3 9h18c0-2-3-2-3-9" />
      <path d="M10 21h4" />
    </svg>
  )
}

export function CalendarReminderToggle() {
  const t = useTranslation()
  const [prefs, setPrefs] = useState<CalendarReminderPrefs>(() => getCalendarReminderPrefs())
  const [permission, setPermission] = useState<PermissionState>('checking')
  const [busy, setBusy] = useState(false)
  const [status, setStatus] = useState<string | null>(null)

  useEffect(() => {
    const updatePermission = () => {
      setPermission(typeof Notification === 'undefined' ? 'unsupported' : Notification.permission)
    }
    updatePermission()
    document.addEventListener('visibilitychange', updatePermission)
    return () => document.removeEventListener('visibilitychange', updatePermission)
  }, [])

  if (permission === 'unsupported' || permission === 'checking') return null

  const active = prefs.enabled && permission === 'granted'

  const toggle = async () => {
    setBusy(true)
    setStatus(null)
    try {
      if (!active) {
        const nextPermission = await ensureNotificationPermission()
        setPermission(nextPermission)
        if (nextPermission !== 'granted') {
          return
        }
        const next = { ...prefs, enabled: true }
        setCalendarReminderPrefs(next)
        setPrefs(next)
        setStatus(t('calendar.reminders.enabled'))
        return
      }
      const next = { ...prefs, enabled: false }
      setCalendarReminderPrefs(next)
      setPrefs(next)
      setStatus(t('calendar.reminders.disabled'))
    } finally {
      setBusy(false)
    }
  }

  return (
    <div className={styles.wrap}>
      <div className={styles.controlRow}>
        {permission === 'denied' ? (
          <span className={styles.blocked} role="status">
            <BellIcon />
            {t('calendar.reminders.blocked')}
          </span>
        ) : (
          <button
            type="button"
            className={active ? styles.on : styles.off}
            aria-pressed={active}
            disabled={busy}
            onClick={() => void toggle()}
          >
            <BellIcon />
            <span>{active ? t('calendar.reminders.on') : t('calendar.reminders.off')}</span>
          </button>
        )}
        <details className={styles.help}>
          <summary aria-label={t('calendar.reminders.help')}>?</summary>
          <p>{t('calendar.reminders.helpText')}</p>
        </details>
      </div>
      {status ? (
        <p className={styles.status} role="status">
          {status}
        </p>
      ) : null}
    </div>
  )
}
