import { useEffect, useState } from 'react'
import { useTranslation } from '../../i18n'
import {
  ensureNotificationPermission,
  getCalendarReminderPrefs,
  setCalendarReminderPrefs,
  type CalendarReminderPrefs,
} from '../../lib/calendar/calendarReminders'
import styles from './CalendarReminderToggle.module.css'

export function CalendarReminderToggle() {
  const t = useTranslation()
  const [prefs, setPrefs] = useState<CalendarReminderPrefs>(() => getCalendarReminderPrefs())
  const [supported, setSupported] = useState(true)
  const [busy, setBusy] = useState(false)
  const [status, setStatus] = useState<string | null>(null)

  useEffect(() => {
    setSupported(typeof Notification !== 'undefined')
  }, [])

  if (!supported) return null

  const toggle = async () => {
    setBusy(true)
    setStatus(null)
    try {
      if (!prefs.enabled) {
        const permission = await ensureNotificationPermission()
        if (permission !== 'granted') {
          setStatus(t('calendar.reminders.denied'))
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
      <button
        type="button"
        className={prefs.enabled ? styles.on : styles.off}
        aria-pressed={prefs.enabled}
        disabled={busy}
        onClick={() => void toggle()}
      >
        {prefs.enabled ? t('calendar.reminders.on') : t('calendar.reminders.off')}
      </button>
      {status ? (
        <p className={styles.status} role="status">
          {status}
        </p>
      ) : (
        <p className={styles.hint}>{t('calendar.reminders.hint')}</p>
      )}
    </div>
  )
}
