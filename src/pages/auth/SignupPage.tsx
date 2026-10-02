import { useState, type FormEvent } from 'react'
import { Link, useNavigate } from 'react-router-dom'
import { useAuth } from '../../lib/auth/useAuth'
import { RedirectIfAuthenticated } from '../../lib/auth/RequireAuth'
import { friendlyAuthError } from '../../lib/auth/authErrors'
import styles from './AuthPages.module.css'

function SignupForm() {
  const { signUp } = useAuth()
  const navigate = useNavigate()
  const [busy, setBusy] = useState(false)
  const [error, setError] = useState('')
  const [info, setInfo] = useState('')
  const [showPassword, setShowPassword] = useState(false)

  async function onSubmit(event: FormEvent<HTMLFormElement>) {
    event.preventDefault()
    const data = new FormData(event.currentTarget)
    const password = String(data.get('password'))
    const confirm = String(data.get('confirm'))
    if (password !== confirm) {
      setError('Passwords do not match.')
      return
    }
    setBusy(true)
    setError('')
    setInfo('')
    try {
      const result = await signUp({
        email: String(data.get('email')),
        password,
        displayName: String(data.get('displayName')),
      })
      if (result.needsEmailConfirmation) {
        setInfo('Account created. Check your email to confirm, then sign in.')
      } else {
        navigate('/account', { replace: true })
      }
    } catch (cause) {
      setError(friendlyAuthError(cause, 'Unable to create your account. Please try again.'))
    } finally {
      setBusy(false)
    }
  }

  return (
    <section className={styles.shell}>
      <h1 className={styles.title}>Create an account</h1>
      <p className={styles.lead}>
        Optional convenience for syncing favorites and prayer progress. You can keep using the site
        as a guest anytime.
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
            <span>Display name</span>
            <input name="displayName" type="text" autoComplete="nickname" required maxLength={80} />
          </label>
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
                autoComplete="new-password"
                required
                minLength={6}
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
          <label className={styles.field}>
            <span>Confirm password</span>
            <input
              name="confirm"
              type={showPassword ? 'text' : 'password'}
              autoComplete="new-password"
              required
              minLength={6}
            />
          </label>
          <button type="submit" className={styles.primaryBtn} disabled={busy}>
            {busy ? 'Creating…' : 'Create account'}
          </button>
        </form>

        <p className={styles.note}>Your account is created as a regular member. Staff access is granted separately.</p>

        <div className={styles.links}>
          <Link to="/login">Already have an account? Sign in</Link>
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

export function SignupPage() {
  return (
    <RedirectIfAuthenticated>
      <SignupForm />
    </RedirectIfAuthenticated>
  )
}
