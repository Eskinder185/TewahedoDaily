import { useCallback, useMemo, useState } from 'react'
import { Link, Navigate } from 'react-router-dom'
import { useAuth } from '../lib/auth/useAuth'
import { useAsync } from '../lib/cms/useAsync'
import { database, type MezmurCard } from '../lib/publicContent/service'
import { MezmurCards, Notice } from '../components/publicContent/PublicUi'
import { listFavorites } from '../lib/userContent/favoritesService'
import s from '../components/publicContent/PublicContent.module.css'

/** @deprecated Login moved to /login; keep redirect for bookmarks. */
export function PublicAccount() {
  return <Navigate to="/account" replace />
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
          ? 'Favorites sync to your account.'
          : 'Favorites on this device. Sign in to sync across devices.'}
      </p>
      {!loading && !session ? (
        <p>
          <Link to="/login?next=/saved">Sign in to sync favorites</Link>
        </p>
      ) : null}

      {session && unified.error ? (
        <Notice error={unified.error} loading={false} retry={unified.reload} />
      ) : null}

      {nonMezmur.length > 0 ? (
        <ul className={s.savedList}>
          {nonMezmur.map((item) => (
            <li key={item.id} className={s.savedRow}>
              <Link to={item.route || '/pray'} className={s.savedLink}>
                <span className={s.savedMark} aria-hidden>
                  ✣
                </span>
                <span>
                  <span className={s.savedTitle}>
                    {item.title || item.contentSlug || item.contentType}
                  </span>
                  <span className={s.savedMeta}>{item.contentType}</span>
                </span>
                <span className={s.savedArrow} aria-hidden>
                  →
                </span>
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
          <ul className={s.savedList}>
            {(unified.data?.items || []).map((item) => (
              <li key={item.id} className={s.savedRow}>
                <Link to={item.route || '/pray'} className={s.savedLink}>
                  <span className={s.savedMark} aria-hidden>
                    ✣
                  </span>
                  <span>
                    <span className={s.savedTitle}>
                      {item.title || item.contentSlug || item.contentType}
                    </span>
                    {item.contentType ? (
                      <span className={s.savedMeta}>{item.contentType}</span>
                    ) : null}
                  </span>
                  <span className={s.savedArrow} aria-hidden>
                    →
                  </span>
                </Link>
              </li>
            ))}
          </ul>
        </>
      )}
    </section>
  )
}
