import { useState, type FormEvent } from 'react'
import { Link, Navigate, Outlet } from 'react-router-dom'
import { AuthProvider } from '../../lib/auth/AuthProvider'
import { hasCmsRole, useAuth } from '../../lib/auth/useAuth'
import { isSupabaseConfigured } from '../../lib/supabase/client'
import styles from './AdminAuth.module.css'

export function AdminAuthLayout() {
  return <AuthProvider><Outlet /></AuthProvider>
}

function SignOutButton() {
  const { signOut } = useAuth()
  const [error, setError] = useState('')
  return (
    <>
      <button
        type="button"
        onClick={() => {
          void signOut()
            .then(() => {
              window.location.assign('/admin/login')
            })
            .catch((cause: Error) => setError(cause.message))
        }}
      >
        Sign out
      </button>
      {error && <p role="alert">{error}</p>}
    </>
  )
}

export function AdminLoginPage() {
  const { session, profile, loading, error, signIn, refreshProfile } = useAuth()
  const [email, setEmail] = useState('')
  const [password, setPassword] = useState('')
  const [submitting, setSubmitting] = useState(false)
  const [message, setMessage] = useState('')
  async function submit(event: FormEvent<HTMLFormElement>) {
    event.preventDefault()
    setSubmitting(true)
    setMessage('')
    try { await signIn(email.trim(), password) }
    catch (cause) { setMessage(cause instanceof Error ? cause.message : 'Unable to sign in.') }
    finally { setPassword(''); setSubmitting(false) }
  }
  if (loading) return <p role="status">Checking access…</p>
  if (session && hasCmsRole(profile)) return <Navigate to="/admin" replace />
  return <main className={styles.panel}>
    <Link to="/">← Tewahedo Daily</Link>
    <h1>CMS sign in</h1>
    {!isSupabaseConfigured ? <p role="status">CMS authentication has not been configured yet.</p> : session ? <>
      <p role="alert">{error || 'Your account has not been assigned CMS access. Contact an administrator.'}</p>
      {error && <button type="button" onClick={() => void refreshProfile()}>Check access again</button>}
      <SignOutButton />
    </> : <form onSubmit={submit} className={styles.form}>
      <label htmlFor="cms-email">Email</label>
      <input id="cms-email" type="email" autoComplete="username" required value={email} onChange={e => setEmail(e.target.value)} />
      <label htmlFor="cms-password">Password</label>
      <input id="cms-password" type="password" autoComplete="current-password" required value={password} onChange={e => setPassword(e.target.value)} />
      <button type="submit" disabled={submitting}>{submitting ? 'Signing in…' : 'Sign in'}</button>
      {message && <p role="alert">{message}</p>}
    </form>}
  </main>
}
