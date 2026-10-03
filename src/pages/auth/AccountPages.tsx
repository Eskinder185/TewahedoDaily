import { useCallback, useEffect, useMemo, useState, type FormEvent } from 'react'
import { Link } from 'react-router-dom'
import { useAuth, hasCmsRole } from '../../lib/auth/useAuth'
import { useAsync } from '../../lib/cms/useAsync'
import { listFavorites } from '../../lib/userContent/favoritesService'
import { listReadingProgress } from '../../lib/userContent/readingProgressService'
import { getGuestRecentMezmur } from '../../lib/userContent/guestStorage'
import { supabase } from '../../lib/supabase/client'
import { useLocale, type AppLocale } from '../../lib/i18n/locale'
import styles from './AuthPages.module.css'

const PREFS_KEY = 'tewahedo:prefs:v1'

type Prefs = {
  textSize: 'regular' | 'large'
}

function readPrefs(): Prefs {
  try {
    const raw = localStorage.getItem(PREFS_KEY)
    if (!raw) return { textSize: 'regular' }
    const parsed = JSON.parse(raw) as Prefs
    return { textSize: parsed.textSize === 'large' ? 'large' : 'regular' }
  } catch {
    return { textSize: 'regular' }
  }
}

function writePrefs(prefs: Prefs & { language?: AppLocale }) {
  try {
    const raw = localStorage.getItem(PREFS_KEY)
    const prev = raw ? (JSON.parse(raw) as Record<string, unknown>) : {}
    localStorage.setItem(PREFS_KEY, JSON.stringify({ ...prev, ...prefs }))
  } catch {
    /* ignore */
  }
}

export function AccountHomePage() {
  const { session, profile, role, loading, isStaff, signOut, refreshProfile } = useAuth()
  const { locale, setLocale } = useLocale()
  const [error, setError] = useState('')
  const [prefs, setPrefs] = useState<Prefs>(() => readPrefs())
  const [nameBusy, setNameBusy] = useState(false)
  const [nameMsg, setNameMsg] = useState('')

  if (loading) {
    return (
      <section className={styles.shell}>
        <p className={styles.status}>Loading account…</p>
      </section>
    )
  }
  if (!session) {
    return (
      <section className={styles.shell}>
        <h1 className={styles.title}>Your account</h1>
        <p className={styles.lead}>Sign in to access your synced account.</p>
        <div className={styles.actions}>
          <Link className={styles.primary} to="/login?next=/account">
            Sign in
          </Link>
          <Link className={styles.secondary} to="/">
            Continue browsing
          </Link>
        </div>
        <p className={styles.note} style={{ marginTop: '1rem' }}>
          Guests can still favorite and practice on this device without an account.
        </p>
      </section>
    )
  }

  async function saveDisplayName(event: FormEvent<HTMLFormElement>) {
    event.preventDefault()
    if (!supabase || !session?.user.id) return
    const data = new FormData(event.currentTarget)
    const displayName = String(data.get('displayName') || '').trim()
    if (!displayName) return
    setNameBusy(true)
    setNameMsg('')
    setError('')
    try {
      const { error: updateError } = await supabase
        .from('profiles')
        .update({ display_name: displayName })
        .eq('id', session.user.id)
      if (updateError) throw updateError
      await refreshProfile()
      setNameMsg('Display name updated.')
    } catch {
      setError('Could not update display name.')
    } finally {
      setNameBusy(false)
    }
  }

  return (
    <section className={styles.shell}>
      <h1 className={styles.title}>Account</h1>
      <p className={styles.meta}>
        Signed in as {session.user.email}
        {profile?.display_name ? ` · ${profile.display_name}` : ''}
      </p>
      {role === 'user' || !role ? (
        <p className={styles.note}>Regular member — favorites and progress sync to this account.</p>
      ) : null}
      {error ? (
        <p className={styles.error} role="alert">
          {error}
        </p>
      ) : null}
      {nameMsg ? (
        <p className={styles.success} role="status">
          {nameMsg}
        </p>
      ) : null}

      <nav className={styles.accountNav} aria-label="Account sections">
        <Link className={styles.accountCard} to="/account/favorites">
          <strong>Favorites</strong>
          <span>Synced saved hymns and prayers.</span>
        </Link>
        <Link className={styles.accountCard} to="/account/prayer-progress">
          <strong>Prayer Progress</strong>
          <span>Continue where you left off.</span>
        </Link>
        <Link className={styles.accountCard} to="/account/activity">
          <strong>Recently Played</strong>
          <span>Recent Mezmur and reading activity.</span>
        </Link>
        {isStaff || hasCmsRole(profile) ? (
          <Link className={styles.accountCard} to="/admin">
            <strong>Admin</strong>
            <span>Content management for staff.</span>
          </Link>
        ) : null}
      </nav>

      <div className={styles.panel}>
        <h2 className={styles.sectionTitle}>Profile</h2>
        <form className={styles.form} onSubmit={(e) => void saveDisplayName(e)}>
          <label className={styles.field}>
            <span>Display name</span>
            <input
              name="displayName"
              defaultValue={profile?.display_name || ''}
              maxLength={80}
              required
            />
          </label>
          <button type="submit" className={styles.primaryBtn} disabled={nameBusy}>
            {nameBusy ? 'Saving…' : 'Save name'}
          </button>
        </form>
      </div>

      <div className={styles.panel} style={{ marginTop: '1rem' }}>
        <h2 className={styles.sectionTitle}>Preferences</h2>
        <p className={styles.note}>Stored on this device. Practice and theme settings stay local.</p>
        <label className={styles.field}>
          <span>Text size (reading)</span>
          <select
            className={styles.control}
            value={prefs.textSize}
            onChange={(e) => {
              const next = { ...prefs, textSize: e.target.value as Prefs['textSize'] }
              setPrefs(next)
              writePrefs({ ...next, language: locale })
            }}
          >
            <option value="regular">Regular</option>
            <option value="large">Large</option>
          </select>
        </label>
        <label className={styles.field}>
          <span>Language</span>
          <select
            className={styles.control}
            value={locale}
            onChange={(e) => {
              const next = e.target.value as AppLocale
              setLocale(next)
              writePrefs({ ...prefs, language: next })
            }}
          >
            <option value="en">English</option>
            <option value="am">Amharic</option>
            <option value="both">Both (Amharic & English)</option>
          </select>
        </label>
      </div>

      <p className={styles.actions} style={{ marginTop: '1.5rem' }}>
        <button
          type="button"
          className={styles.secondary}
          onClick={() => {
            void signOut()
              .then(() => {
                window.location.assign('/')
              })
              .catch(() => setError('Could not sign out. Try again.'))
          }}
        >
          Sign out
        </button>
        <Link className={styles.ghost} to="/">
          Back to Home
        </Link>
      </p>
    </section>
  )
}

export function AccountFavoritesPage() {
  const { session, loading } = useAuth()
  const userId = session?.user.id
  const result = useAsync(useCallback(() => listFavorites(userId), [userId]))

  if (loading) return <section className={styles.shell}><p className={styles.status}>Loading…</p></section>

  return (
    <section className={styles.shell}>
      <p className={styles.meta}>
        <Link to="/account">← Account</Link>
      </p>
      <h1 className={styles.title}>Favorites</h1>
      <p className={styles.lead}>
        {session
          ? 'Synced to your account across devices.'
          : 'Saved on this device.'}
      </p>
      {!session ? (
        <p className={styles.note}>Sign in to sync your favorites across devices.</p>
      ) : null}
      {result.error ? (
        <p className={styles.error} role="alert">
          {result.error}
        </p>
      ) : null}
      {(result.data?.items || []).length === 0 ? <p className={styles.status}>No favorites yet.</p> : null}
      <ul className={styles.list}>
        {(result.data?.items || []).map((item) => (
          <li key={item.id}>
            <Link to={item.route || '/prayers'}>
              <span>{item.title || item.contentSlug || item.contentType}</span>
              <span className={styles.listMeta}>{item.contentType}</span>
            </Link>
          </li>
        ))}
      </ul>
      <p className={styles.actions}>
        <Link className={styles.secondary} to="/saved">
          Open full Saved view
        </Link>
      </p>
    </section>
  )
}

export function AccountPrayerProgressPage() {
  const { session, loading } = useAuth()
  const userId = session?.user.id
  const result = useAsync(useCallback(() => listReadingProgress(userId), [userId]))

  if (loading) return <section className={styles.shell}><p className={styles.status}>Loading…</p></section>

  const items = (result.data?.items || []).filter((item) =>
    ['prayer', 'psalm', 'liturgy', 'collection'].includes(item.contentType),
  )

  return (
    <section className={styles.shell}>
      <p className={styles.meta}>
        <Link to="/account">← Account</Link>
      </p>
      <h1 className={styles.title}>Prayer Progress</h1>
      <p className={styles.lead}>
        {session
          ? 'Synced reading progress from prayers and guided practice.'
          : 'Progress on this device only.'}
      </p>
      {!session ? (
        <p className={styles.note}>Sign in to sync your prayer progress across devices.</p>
      ) : null}
      {items.length === 0 ? <p className={styles.status}>No prayer progress yet.</p> : null}
      <ul className={styles.list}>
        {items.map((item) => (
          <li key={item.id}>
            <Link to={item.route || '/prayers'}>
              <span>{item.title || item.contentSlug || 'Prayer'}</span>
              <span className={styles.listMeta}>
                {item.positionPercent != null ? `${Math.round(item.positionPercent)}%` : item.contentType}
              </span>
            </Link>
          </li>
        ))}
      </ul>
    </section>
  )
}

export function AccountActivityPage() {
  const { session, loading } = useAuth()
  const userId = session?.user.id
  const [recent, setRecent] = useState(() => getGuestRecentMezmur())
  const progress = useAsync(useCallback(() => listReadingProgress(userId), [userId]))

  useEffect(() => {
    setRecent(getGuestRecentMezmur())
  }, [session?.user.id])

  const recentReading = useMemo(
    () => (progress.data?.items || []).slice(0, 12),
    [progress.data],
  )

  if (loading) return <section className={styles.shell}><p className={styles.status}>Loading…</p></section>

  return (
    <section className={styles.shell}>
      <p className={styles.meta}>
        <Link to="/account">← Account</Link>
      </p>
      <h1 className={styles.title}>Activity</h1>
      <p className={styles.lead}>Recently played Mezmurs and opened prayers on this device.</p>

      <h2 className={styles.title} style={{ fontSize: '1.25rem', marginTop: '1.5rem' }}>
        Recently played
      </h2>
      {recent.length === 0 ? <p className={styles.status}>No recent Mezmur yet.</p> : null}
      <ul className={styles.list}>
        {recent.map((item) => (
          <li key={item.slug}>
            <Link to={`/practice/mezmur/${item.slug}`}>
              <span>{item.title || item.slug}</span>
              <span className={styles.listMeta}>Mezmur</span>
            </Link>
          </li>
        ))}
      </ul>

      <h2 className={styles.title} style={{ fontSize: '1.25rem', marginTop: '1.75rem' }}>
        Recent reading
      </h2>
      {recentReading.length === 0 ? <p className={styles.status}>No recent reading yet.</p> : null}
      <ul className={styles.list}>
        {recentReading.map((item) => (
          <li key={item.id}>
            <Link to={item.route || '/prayers'}>
              <span>{item.title || item.contentSlug || item.contentType}</span>
              <span className={styles.listMeta}>{item.contentType}</span>
            </Link>
          </li>
        ))}
      </ul>
    </section>
  )
}
