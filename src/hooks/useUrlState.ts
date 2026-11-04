import { useEffect, useState } from 'react'
import { useLocation, useSearchParams } from 'react-router-dom'

/** User selections push entries; malformed values fall back without redirects. */
export function useUrlChoice<T extends string>(name: string, fallback: T, choices?: readonly T[]) {
  const [params, setParams] = useSearchParams()
  const raw = params.get(name)
  const value = raw !== null && (!choices || choices.includes(raw as T)) ? raw as T : fallback
  const select = (next: T) => {
    if (next === value) return
    const query = new URLSearchParams(params)
    if (next === fallback) query.delete(name)
    else query.set(name, next)
    query.delete('page')
    setParams(query)
  }
  return [value, select] as const
}

/** Debounce typing, never a URL change. POP cancels pending edits instead of
 * writing an obsolete draft back over the restored history entry. */
export function useUrlSearchInput(name = 'q') {
  const location = useLocation()
  const [params, setParams] = useSearchParams()
  const committed = params.get(name) || ''
  const [draft, setDraft] = useState({ key: location.key, value: committed })
  const current = draft.key === location.key ? draft : { key: location.key, value: committed }
  if (draft.key !== location.key) setDraft(current)

  useEffect(() => {
    if (current.value === committed) return
    const timer = window.setTimeout(() => {
      const next = new URLSearchParams(params)
      if (current.value) next.set(name, current.value)
      else next.delete(name)
      next.delete('page')
      // Clear the edit before changing browser history. A rapid Back can arrive
      // before React renders the newly pushed key (including the default key).
      setDraft({ key: '', value: '' })
      setParams(next)
    }, 280)
    return () => window.clearTimeout(timer)
  }, [current.value, committed, location.key, name, params, setParams])

  return [current.value, (value: string) => setDraft({ key: location.key, value })] as const
}
