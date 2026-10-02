import { useCallback, useEffect, useState, type FormEvent } from 'react'
import { Link } from 'react-router-dom'
import { useAuth } from '../lib/auth/useAuth'
import { useAsync } from '../lib/cms/useAsync'
import { database, type MezmurCard } from '../lib/publicContent/service'
import { MezmurCards, Notice } from '../components/publicContent/PublicUi'
import {
  clearGuestFavorites,
  clearGuestProgress,
  clearMergeOffered,
  hasGuestDataToMerge,
  markMergeOffered,
  wasMergeOffered,
} from '../lib/userContent/guestStorage'
import { importGuestFavorites, listFavorites } from '../lib/userContent/favoritesService'
import { importGuestProgress } from '../lib/userContent/readingProgressService'
import s from '../components/publicContent/PublicContent.module.css'
import { useMemo } from 'react'

export function PublicAccount() {
  const { session, loading, signIn, signOut } = useAuth()
  const [error, setError] = useState('')
  const [busy, setBusy] = useState(false)
  const [mergeBusy, setMergeBusy] = useState(false)
  const [mergeMessage, setMergeMessage] = useState('')
  const [showMerge, setShowMerge] = useState(false)

  useEffect(() => {
    if (session && hasGuestDataToMerge() && !wasMergeOffered()) {
      setShowMerge(true)
    }
  }, [session])

  async function submit(event: FormEvent<HTMLFormElement>) {
    event.preventDefault()
    const data = new FormData(event.currentTarget)
    setBusy(true)
    setError('')
    try {
      await signIn(String(data.get('email')), String(data.get('password')))
      if (hasGuestDataToMerge()) setShowMerge(true)
    } catch {
      setError('Sign-in failed. Check your email and password.')
    } finally {
      setBusy(false)
    }
  }

  async function mergeGuest() {
    if (!session?.user.id) return
    setMergeBusy(true)
    setMergeMessage('')
    try {
      const fav = await importGuestFavorites(session.user.id)
      const prog = await importGuestProgress(session.user.id)
      clearGuestFavorites()
      clearGuestProgress()
      markMergeOffered()
      setShowMerge(false)
      setMergeMessage(
        `Imported ${fav.imported} favorite(s) and ${prog.imported} reading progress item(s).`,
      )
    } catch {
      setMergeMessage('Could not import device progress. Try again.')
    } finally {
      setMergeBusy(false)
    }
  }

  function dismissMerge() {
    markMergeOffered()
    setShowMerge(false)
  }

  return (
    <section className={s.shell}>
      <h1>Your account</h1>
      <p>
        Browse and pray freely without signing in. Sign in only if you want favorites and reading
        progress synced across devices.
      </p>
      {error && <p role="alert">{error}</p>}
      {mergeMessage ? <p role="status">{mergeMessage}</p> : null}
      {loading ? (
        <p>Restoring session…</p>
      ) : session ? (
        <>
          <p>Signed in as {session.user.email}</p>
          <Link to="/saved">Your favorites</Link>
          {showMerge ? (
            <div className={s.card} style={{ marginTop: '1rem' }}>
              <p>
                This device has guest favorites or reading progress. Import them into your account?
              </p>
              <p>
                <button type="button" disabled={mergeBusy} onClick={() => void mergeGuest()}>
                  {mergeBusy ? 'Importing…' : 'Import device progress'}
                </button>{' '}
                <button type="button" disabled={mergeBusy} onClick={dismissMerge}>
                  Keep separate
                </button>
              </p>
            </div>
          ) : null}
          <p>
            <button
              type="button"
              onClick={() => {
                clearMergeOffered()
                void signOut().catch(() => setError('Could not sign out. Try again.'))
              }}
            >
              Sign out
            </button>
          </p>
        </>
      ) : (
        <form className={s.filters} onSubmit={submit}>
          <label>
            Email
            <input name="email" type="email" autoComplete="email" required />
          </label>
          <label>
            Password
            <input
              name="password"
              type="password"
              autoComplete="current-password"
              required
            />
          </label>
          <button type="submit" disabled={busy}>
            Sign in
          </button>
        </form>
      )}
    </section>
  )
}

export function Favorites() {
  const { session, loading } = useAuth()
  const [page, setPage] = useState(1)
  const userId = session?.user.id

  const unified = useAsync(
    useCallback(async () => listFavorites(userId), [userId]),
  )

  const mezmurPage = useAsync(
    useCallback(async () => {
      if (!userId) return { items: [] as MezmurCard[], more: false }
      try {
        const { data, error } = await database().rpc('public_favorites', {
          page_number: page,
        })
        if (error) throw error
        const result = data as unknown as { items: MezmurCard[]; total: number }
        return { items: result.items || [], more: page * 24 < (result.total || 0) }
      } catch (error) {
        if (import.meta.env.DEV) console.error('[favorites] public_favorites', error)
        return { items: [] as MezmurCard[], more: false }
      }
    }, [userId, page]),
  )

  const nonMezmur = useMemo(
    () => (unified.data?.items || []).filter((item) => item.contentType !== 'mezmur'),
    [unified.data],
  )

  return (
    <section className={s.shell}>
      <h1>Saved</h1>
      <p>
        {session
          ? 'Favorites sync to your account. Device-only items appear until imported.'
          : 'Favorites on this device. Sign in to sync across devices.'}
      </p>
      {!loading && !session ? (
        <p>
          <Link to="/account">Sign in to sync favorites</Link>
        </p>
      ) : null}

      {session && unified.error ? (
        <Notice error={unified.error} loading={false} retry={unified.reload} />
      ) : null}

      {nonMezmur.length > 0 ? (
        <ul>
          {nonMezmur.map((item) => (
            <li key={item.id}>
              <Link to={item.route || '/pray'}>
                <strong>{item.title || item.contentSlug || item.contentType}</strong>
                <small> · {item.contentType}</small>
              </Link>
            </li>
          ))}
        </ul>
      ) : null}

      {session ? (
        <>
          <Notice {...mezmurPage} retry={mezmurPage.reload} />
          {mezmurPage.data ? (
            <>
              <h2>Mezmur</h2>
              <MezmurCards items={mezmurPage.data.items} />
              {!mezmurPage.data.items.length && !nonMezmur.length ? (
                <p>No favorites yet.</p>
              ) : null}
              <div className={s.actions}>
                <button type="button" disabled={page === 1} onClick={() => setPage(page - 1)}>
                  Previous
                </button>
                <span>Page {page}</span>
                <button
                  type="button"
                  disabled={!mezmurPage.data.more}
                  onClick={() => setPage(page + 1)}
                >
                  Next
                </button>
              </div>
            </>
          ) : null}
        </>
      ) : (
        <>
          {(unified.data?.items || []).length === 0 ? (
            <p>No favorites saved on this device yet.</p>
          ) : null}
          <ul>
            {(unified.data?.items || []).map((item) => (
              <li key={item.id}>
                <Link to={item.route || '/pray'}>
                  <strong>{item.title || item.contentSlug || item.contentType}</strong>
                </Link>
              </li>
            ))}
          </ul>
        </>
      )}
    </section>
  )
}
