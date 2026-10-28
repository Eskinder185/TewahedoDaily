import { useCallback, useState } from 'react'
import { Link } from 'react-router-dom'
import { useAuth } from '../../lib/auth/useAuth'
import { useAsync } from '../../lib/cms/useAsync'
import { isFavorited, toggleFavorite } from '../../lib/userContent/favoritesService'
import type { UserContentType } from '../../lib/userContent/types'

type Props = {
  id?: string
  contentType?: UserContentType
  contentSlug?: string
  collectionSlug?: string
  title?: string
  route?: string
  /** Icon-only button for compact toolbars (label kept for screen readers). */
  compact?: boolean
  className?: string
}

export function FavoriteButton({
  id,
  contentType = 'mezmur',
  contentSlug,
  collectionSlug,
  title,
  route,
  compact = false,
  className,
}: Props) {
  const { session, loading } = useAuth()
  const [busy, setBusy] = useState(false)
  const [error, setError] = useState('')
  const [syncNote, setSyncNote] = useState('')
  const userId = session?.user.id
  const identity = {
    contentType,
    contentId: id || null,
    contentSlug: contentSlug || null,
    collectionSlug: collectionSlug || null,
    title: title || null,
    route: route || null,
  }

  const result = useAsync(
    useCallback(async () => {
      const state = await isFavorited(userId, identity)
      if (state.error && userId && import.meta.env.DEV) {
        console.error('[FavoriteButton] load', state.error)
      }
      // Authenticated table failure: still allow local state; show retry only when auth + hard fail with no local fallback path
      if (state.error && userId && state.source === 'none') {
        throw new Error(state.error)
      }
      return { favorited: state.favorited, softError: state.error && userId ? state.error : '' }
    }, [id, contentType, contentSlug, collectionSlug, userId]),
  )

  async function toggle() {
    setBusy(true)
    setError('')
    setSyncNote('')
    try {
      const currently = !!result.data?.favorited
      const next = await toggleFavorite(userId, identity, currently)
      if (next.error) {
        if (userId) setSyncNote(next.error)
        else setSyncNote('')
      }
      result.reload()
    } catch {
      setError('Could not update favorite. Try again.')
    } finally {
      setBusy(false)
    }
  }

  if (loading) return null

  const favorited = !!result.data?.favorited
  const loadError = result.error || result.data?.softError || error

  if (compact) {
    const label = favorited ? 'Remove from favorites' : 'Add to favorites'
    const note = loadError || syncNote || (!session && favorited ? 'Saved on this device' : '')
    return (
      <>
        <button
          type="button"
          className={className}
          disabled={busy || result.loading}
          aria-pressed={favorited}
          aria-label={label}
          title={!session ? `${label} · sign in to sync` : label}
          onClick={() => void toggle()}
          data-testid="favorite-compact"
        >
          <span aria-hidden="true">{favorited ? '♥' : '♡'}</span>
        </button>
        <span role="status" style={{ position: 'absolute', width: 1, height: 1, overflow: 'hidden', clip: 'rect(0 0 0 0)' }}>
          {note}
        </span>
      </>
    )
  }

  return (
    <div>
      <button
        type="button"
        disabled={busy || result.loading}
        aria-pressed={favorited}
        onClick={() => void toggle()}
      >
        {favorited ? '♥ Favorited' : '♡ Add to favorites'}
      </button>
      {!session ? (
        <p>
          <Link to="/login">Sign in to sync favorites</Link>
          {favorited ? ' · Saved on this device' : null}
        </p>
      ) : null}
      {session && loadError ? (
        <span role="alert">
          {loadError}{' '}
          <button type="button" onClick={result.reload}>
            Retry
          </button>
        </span>
      ) : null}
      {syncNote && !loadError ? <span role="status">{syncNote}</span> : null}
    </div>
  )
}
