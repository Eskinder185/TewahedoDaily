import { useEffect, useState } from 'react'
import { errorMessage } from './mezmurService'

export function useAsync<T>(load: () => Promise<T>) {
  const [revision, setRevision] = useState(0)
  const [state, setState] = useState<{ load: typeof load; revision: number; data?: T; error?: string }>()
  useEffect(() => {
    let active = true
    void load().then(data => { if (active) setState({ load, revision, data }) }, error => { if (active) setState({ load, revision, error: errorMessage(error) }) })
    return () => { active = false }
  }, [load, revision])
  const current = state?.load === load && state.revision === revision
  return { data: current ? state.data : undefined, error: current ? state.error : undefined, loading: !current, reload: () => setRevision(n => n + 1) }
}
