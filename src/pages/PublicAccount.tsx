import { useCallback, useState, type FormEvent } from 'react'
import { Link } from 'react-router-dom'
import { useAuth } from '../lib/auth/useAuth'
import { useAsync } from '../lib/cms/useAsync'
import { database, type MezmurCard } from '../lib/publicContent/service'
import { MezmurCards, Notice } from '../components/publicContent/PublicUi'
import s from '../components/publicContent/PublicContent.module.css'
export function PublicAccount() {
  const { session, loading, signIn, signOut } = useAuth()
  const [error, setError] = useState('')
  const [busy, setBusy] = useState(false)
  async function submit(event: FormEvent<HTMLFormElement>) {
    event.preventDefault()
    const data = new FormData(event.currentTarget)
    setBusy(true)
    setError('')
    try {
      await signIn(String(data.get('email')), String(data.get('password')))
    } catch {
      setError('Sign-in failed. Check your email and password.')
    } finally {
      setBusy(false)
    }
  }
  return (
    <section className={s.shell}>
      <h1>Your account</h1>
      <p>
        Reading and listening are free without signing in. Use your existing
        account to save favorites.
      </p>
      {error && <p role="alert">{error}</p>}
      {loading ? (
        <p>Restoring session…</p>
      ) : session ? (
        <>
          <p>Signed in as {session.user.email}</p>
          <Link to="/saved">Your favorites</Link>
          <p>
            <button
              onClick={() =>
                void signOut().catch(() =>
                  setError('Could not sign out. Try again.'),
                )
              }
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
          <button disabled={busy}>Sign in</button>
        </form>
      )}
    </section>
  )
}
export function Favorites() {
  const { session, loading } = useAuth()
  const [page, setPage] = useState(1)
  const userId = session?.user.id
  const result = useAsync(
    useCallback(async () => {
      if (!userId) return { items: [] as MezmurCard[], more: false }
      const { data, error } = await database().rpc('public_favorites', {
        page_number: page,
      })
      if (error) throw error
      const result = data as unknown as { items: MezmurCard[]; total: number }
      return { items: result.items, more: page * 24 < result.total }
    }, [userId, page]),
  )
  return (
    <section className={s.shell}>
      <h1>Saved</h1>
      {!loading && !session ? (
        <Link to="/account">Sign in to view favorites</Link>
      ) : (
        <>
          <Notice {...result} retry={result.reload} />
          {result.data && (
            <>
              <MezmurCards items={result.data.items} />
              {!result.data.items.length && (
                <p>No published favorites on this page.</p>
              )}
              <div className={s.actions}>
                <button disabled={page === 1} onClick={() => setPage(page - 1)}>
                  Previous
                </button>
                <span>Page {page}</span>
                <button
                  disabled={!result.data.more}
                  onClick={() => setPage(page + 1)}
                >
                  Next
                </button>
              </div>
            </>
          )}
        </>
      )}
    </section>
  )
}
