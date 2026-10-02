import { useState, type FormEvent } from 'react'
import { Link, useNavigate, useSearchParams } from 'react-router-dom'
import { useAuth } from '../../lib/auth/useAuth'
import { RedirectIfAuthenticated } from '../../lib/auth/RequireAuth'
import { friendlyAuthError } from '../../lib/auth/authErrors'
import styles from './AuthPages.module.css'

function LoginForm() {
  const { signIn, requestPasswordReset } = useAuth()
  const navigate = useNavigate()
  const [params] = useSearchParams()
  const next = params.get('next') || '/account'
  const [busy, setBusy] = useState(false)
  const [error, setError] = useState('')
  const [info, setInfo] = useState('')
  const [showPassword, setShowPassword] = useState(false)

  async function onSubmit(event: FormEvent<HTMLFormElement>) {
    event.preventDefault()
    const data = new FormData(event.currentTarget)
    setBusy(true)
    setError('')
    setInfo('')
    try {
      await signIn(String(data.get('email')), String(data.get('password')))
      navigate(next.startsWith('/') ? next : '/account', { replace: true })
    } catch (cause) {
      setError(friendlyAuthError(cause, 'The email or password is incorrect.'))
    } finally {
      setBusy(false)
    }
  }

  async function onForgot() {
    const emailInput = document.querySelector<HTMLInputElement>('input[name="email"]')
    const email = emailInput?.value?.trim() || ''
    if (!email) {
      setError('Enter your email above, then tap Forgot password.')
      return
    }
    setBusy(true)
    setError('')
    setInfo('')
    try {
      await requestPasswordReset(email)
      setInfo('If an account exists for that email, a reset link is on the way.')
    } catch (cause) {
      setError(friendlyAuthError(cause, 'Unable to send a reset email. Please try again.'))
    } finally {
      setBusy(false)
    }
  }

  return (
    <section className={styles.shell}>
      <h1 className={styles.title}>Sign in</h1>
      <p className={styles.lead}>
        Optional. Browse and pray freely without an account — sign in only to sync favorites and
        progress across devices.
      </p>

      <div className={styles.panel}>
        {error ? (
          <p className={styles.error} role="alert">
            {error}
          </p>
        ) : null}
        {info ? (
          <p className={styles.success} role="status">
            {info}
          </p>
        ) : null}

        <form className={styles.form} onSubmit={(e) => void onSubmit(e)}>
          <label className={styles.field}>
            <span>Email</span>
            <input name="email" type="email" autoComplete="email" required />
          </label>
          <label className={styles.field}>
            <span>Password</span>
            <div className={styles.passwordRow}>
              <input
                name="password"
                type={showPassword ? 'text' : 'password'}
                autoComplete="current-password"
                required
              />
              <button
                type="button"
                className={styles.togglePw}
                onClick={() => setShowPassword((v) => !v)}
                aria-pressed={showPassword}
              >
                {showPassword ? 'Hide' : 'Show'}
              </button>
            </div>
          </label>
          <button type="submit" className={styles.primaryBtn} disabled={busy}>
            {busy ? 'Signing in…' : 'Sign in'}
          </button>
        </form>

        <div className={styles.links}>
          <Link to="/signup">Create an account</Link>
          <button type="button" className={styles.linkBtn} onClick={() => void onForgot()} disabled={busy}>
            Forgot password
          </button>
        </div>
      </div>

      <p className={styles.actions} style={{ marginTop: '1.25rem' }}>
        <Link className={styles.secondary} to="/">
          Continue without signing in
        </Link>
      </p>
    </section>
  )
}

export function LoginPage() {
  return (
    <RedirectIfAuthenticated>
      <LoginForm />
    </RedirectIfAuthenticated>
  )
}
