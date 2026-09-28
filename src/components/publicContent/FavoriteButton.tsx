import { useCallback, useState } from 'react'
import { Link } from 'react-router-dom'
import { useAuth } from '../../lib/auth/useAuth'
import { useAsync } from '../../lib/cms/useAsync'
import { database } from '../../lib/publicContent/service'
export function FavoriteButton({ id }: { id: string }) {
  const { session, loading } = useAuth()
  const [busy, setBusy] = useState(false)
  const [error, setError] = useState('')
  const userId = session?.user.id
  const result = useAsync(
    useCallback(async () => {
      if (!userId) return false
      const { data, error } = await database()
        .from('mezmur_favorites')
        .select('mezmur_id')
        .eq('user_id', userId)
        .eq('mezmur_id', id)
        .maybeSingle()
      if (error) throw error
      return !!data
    }, [id, userId]),
  )
  async function toggle() {
    if (!userId) return
    setBusy(true)
    setError('')
    try {
      const request = result.data
        ? database()
            .from('mezmur_favorites')
            .delete()
            .eq('user_id', userId)
            .eq('mezmur_id', id)
        : database()
            .from('mezmur_favorites')
            .insert({ user_id: userId, mezmur_id: id })
      const { error } = await request
      if (error) throw error
      result.reload()
    } catch {
      setError('Could not update favorite. Try again.')
    } finally {
      setBusy(false)
    }
  }
  if (loading) return null
  if (!session) return <Link to="/account">Sign in to save favorites</Link>
  return (
    <>
      <button
        disabled={busy || result.loading || !!result.error}
        aria-pressed={!!result.data}
        onClick={() => void toggle()}
      >
        {result.data ? 'Remove favorite' : 'Add favorite'}
      </button>
      {(error || result.error) && (
        <span role="alert">
          {error || 'Could not load favorites.'}{' '}
          <button onClick={result.reload}>Retry</button>
        </span>
      )}
    </>
  )
}
