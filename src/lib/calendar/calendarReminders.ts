const PREF_KEY = 'td-calendar-reminders-v1'
const LAST_FIRE_KEY = 'td-calendar-reminders-last-fire'

export type CalendarReminderPrefs = {
  enabled: boolean
  /** Local hour 0–23 */
  hour: number
  minute: number
}

const DEFAULT_PREFS: CalendarReminderPrefs = {
  enabled: false,
  hour: 7,
  minute: 0,
}

export function getCalendarReminderPrefs(): CalendarReminderPrefs {
  try {
    const raw = localStorage.getItem(PREF_KEY)
    if (!raw) return { ...DEFAULT_PREFS }
    const parsed = JSON.parse(raw) as Partial<CalendarReminderPrefs>
    return {
      enabled: Boolean(parsed.enabled),
      hour: clampHour(parsed.hour ?? DEFAULT_PREFS.hour),
      minute: clampMinute(parsed.minute ?? DEFAULT_PREFS.minute),
    }
  } catch {
    return { ...DEFAULT_PREFS }
  }
}

export function setCalendarReminderPrefs(prefs: CalendarReminderPrefs) {
  localStorage.setItem(
    PREF_KEY,
    JSON.stringify({
      enabled: prefs.enabled,
      hour: clampHour(prefs.hour),
      minute: clampMinute(prefs.minute),
    }),
  )
}

function clampHour(n: number) {
  return Math.min(23, Math.max(0, Math.floor(Number(n) || 0)))
}

function clampMinute(n: number) {
  return Math.min(59, Math.max(0, Math.floor(Number(n) || 0)))
}

export async function ensureNotificationPermission(): Promise<NotificationPermission> {
  if (typeof Notification === 'undefined') return 'denied'
  if (Notification.permission === 'granted' || Notification.permission === 'denied') {
    return Notification.permission
  }
  return Notification.requestPermission()
}

/** Fire at most once per local calendar day when prefs allow. */
export function maybeFireDailyCalendarReminder(body: string, title = 'Tewahedo Daily') {
  const prefs = getCalendarReminderPrefs()
  if (!prefs.enabled || typeof Notification === 'undefined') return
  if (Notification.permission !== 'granted') return

  const now = new Date()
  if (now.getHours() < prefs.hour) return
  if (now.getHours() === prefs.hour && now.getMinutes() < prefs.minute) return

  const dayKey = `${now.getFullYear()}-${now.getMonth() + 1}-${now.getDate()}`
  try {
    if (localStorage.getItem(LAST_FIRE_KEY) === dayKey) return
    localStorage.setItem(LAST_FIRE_KEY, dayKey)
  } catch {
    return
  }

  try {
    new Notification(title, {
      body,
      tag: `td-calendar-${dayKey}`,
      lang: document.documentElement.lang || 'en',
    })
  } catch {
    /* ignore */
  }
}
