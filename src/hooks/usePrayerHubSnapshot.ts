import { useMemo, useSyncExternalStore } from 'react'
import {
  PRAYER_HUB_UPDATE,
  getLastPrayerHubVisit,
  getRecentPrayerHubPaths,
  getSavedPrayerPaths,
} from '../lib/prayers/prayerHubActivity'

function subscribe(onChange: () => void) {
  const bump = () => onChange()
  window.addEventListener('storage', bump)
  window.addEventListener('focus', bump)
  window.addEventListener(PRAYER_HUB_UPDATE, bump)
  return () => {
    window.removeEventListener('storage', bump)
    window.removeEventListener('focus', bump)
    window.removeEventListener(PRAYER_HUB_UPDATE, bump)
  }
}

function snapshotJson() {
  return JSON.stringify({
    lastVisit: getLastPrayerHubVisit(),
    recent: getRecentPrayerHubPaths(),
    saved: getSavedPrayerPaths(),
  })
}

export function usePrayerHubSnapshot() {
  const json = useSyncExternalStore(subscribe, snapshotJson, snapshotJson)
  return useMemo(
    () =>
      JSON.parse(json) as {
        lastVisit: ReturnType<typeof getLastPrayerHubVisit>
        recent: ReturnType<typeof getRecentPrayerHubPaths>
        saved: ReturnType<typeof getSavedPrayerPaths>
      },
    [json],
  )
}
