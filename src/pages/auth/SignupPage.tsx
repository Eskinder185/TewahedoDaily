import { useState, type FormEvent } from 'react'
import { Link, useNavigate } from 'react-router-dom'
import { useTranslation } from '../../i18n'
import { useAuth } from '../../lib/auth/useAuth'
import { RedirectIfAuthenticated } from '../../lib/auth/RequireAuth'
import { friendlyAuthError } from '../../lib/auth/authErrors'
import styles from './AuthPages.module.css'

function SignupForm() {
  const t = useTranslation()
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
      setError(t('auth.passwordMismatch'))
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
        setInfo(t('auth.signupConfirmEmail'))
      } else {
        navigate('/account', { replace: true })
      }
    } catch (cause) {
      setError(friendlyAuthError(cause, t('auth.signupFailed')))
    } finally {
      setBusy(false)
    }
  }

  return (
    <section className={styles.shell}>
      <h1 className={styles.title}>{t('auth.signupTitle')}</h1>
      <p className={styles.lead}>{t('auth.signupLead')}</p>

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
            <span>{t('auth.displayName')}</span>
            <input name="displayName" type="text" autoComplete="nickname" required maxLength={80} />
          </label>
          <label className={styles.field}>
            <span>{t('auth.email')}</span>
            <input name="email" type="email" autoComplete="email" required />
          </label>
          <label className={styles.field}>
            <span>{t('auth.password')}</span>
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
                {showPassword ? t('auth.hidePassword') : t('auth.showPassword')}
              </button>
            </div>
          </label>
          <label className={styles.field}>
            <span>{t('auth.confirmPassword')}</span>
            <input
              name="confirm"
              type={showPassword ? 'text' : 'password'}
              autoComplete="new-password"
              required
              minLength={6}
            />
          </label>
          <button type="submit" className={styles.primaryBtn} disabled={busy}>
            {busy ? t('auth.creating') : t('auth.create')}
          </button>
        </form>

        <p className={styles.note}>{t('auth.memberNote')}</p>

        <div className={styles.links}>
          <Link to="/login">{t('auth.haveAccount')}</Link>
        </div>
      </div>

      <p className={styles.actions} style={{ marginTop: '1.25rem' }}>
        <Link className={styles.secondary} to="/">
          {t('auth.continueGuest')}
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
