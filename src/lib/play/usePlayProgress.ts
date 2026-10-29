import { useEffect, useState } from 'react'
import { useAuth } from '../auth/useAuth'
import { PLAY_PROGRESS_EVENT, readPlayProgress, savePlayProgress, type PlayProgress } from './progress'
import { loadSavedPlayProgress } from './progressSync'

export function usePlayProgress() {
  const { user } = useAuth()
  const [progress, setProgress] = useState<PlayProgress>(() => readPlayProgress())

  useEffect(() => {
    const refresh = () => setProgress(readPlayProgress())
    window.addEventListener(PLAY_PROGRESS_EVENT, refresh)
    window.addEventListener('storage', refresh)
    return () => {
      window.removeEventListener(PLAY_PROGRESS_EVENT, refresh)
      window.removeEventListener('storage', refresh)
    }
  }, [])

  useEffect(() => {
    let active = true
    void loadSavedPlayProgress(user).then((remote) => {
      if (!active || !remote) return
      const local = readPlayProgress()
      if (remote.xp > local.xp || remote.history.length > local.history.length) savePlayProgress(remote)
    }).catch(() => undefined)
    return () => { active = false }
  }, [user])

  return progress
}
