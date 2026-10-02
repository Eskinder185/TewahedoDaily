/** Friendly auth error messages for regular users (never show raw DB errors). */

export function friendlyAuthError(error: unknown, fallback = 'Something went wrong. Please try again.'): string {
  if (!error) return fallback
  const message =
    typeof error === 'string'
      ? error
      : error && typeof error === 'object' && 'message' in error
        ? String((error as { message?: unknown }).message || '')
        : ''
  const text = message.toLowerCase()

  if (!text) return fallback
  if (/invalid login credentials|invalid credentials|wrong password|email not confirmed/i.test(text)) {
    if (/email not confirmed/i.test(text)) {
      return 'Please confirm your email before signing in. Check your inbox for a confirmation link.'
    }
    return 'The email or password is incorrect.'
  }
  if (/user already registered|already been registered|already exists/i.test(text)) {
    return 'An account already exists with this email.'
  }
  if (/password.*(weak|short|least|characters)/i.test(text)) {
    return 'Choose a stronger password (at least 6 characters).'
  }
  if (/rate limit|too many requests|over_email_send/i.test(text)) {
    return 'Too many attempts. Please wait a moment and try again.'
  }
  if (/network|fetch failed|failed to fetch|timeout/i.test(text)) {
    return 'Unable to sign in right now. Please try again.'
  }
  if (/signup.*disabled|signups not allowed/i.test(text)) {
    return 'New account creation is temporarily unavailable.'
  }
  // Never surface SQL / PostgREST internals.
  if (/permission denied|42501|row-level security|pgrst|postgres|sqlstate/i.test(text)) {
    return fallback
  }
  if (message.length < 160 && !/stack|exception/i.test(message)) return message
  return fallback
}
