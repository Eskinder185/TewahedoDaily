import { useCallback, useEffect, useMemo, useRef, useState, type ReactNode } from 'react'
import type { AuthChangeEvent, Session } from '@supabase/supabase-js'
import { supabase } from '../supabase/client'
import { AuthContext, isStaffRole, type Profile } from './useAuth'
import { friendlyAuthError } from './authErrors'
import {
  clearGuestFavorites,
  clearGuestProgress,
  clearMergeOffered,
  hasGuestDataToMerge,
  markMergeOffered,
} from '../userContent/guestStorage'
import { importGuestFavorites } from '../userContent/favoritesService'
import { importGuestProgress } from '../userContent/readingProgressService'

function profileFetchError(error: { message?: string; code?: string; status?: number } | null): string {
  if (!error) return 'Unable to load your account. Try again.'
  const code = error.code || ''
  const text = `${error.message || ''}`.toLowerCase()
  if (code === 'PGRST301' || error.status === 401 || text.includes('jwt') || text.includes('session')) {
    return 'Your session expired. Please sign in again.'
  }
  if (code === '42501' || error.status === 403 || text.includes('permission denied') || text.includes('403')) {
    return 'Signed in, but profile access was denied. Apply supabase/FIX_REGULAR_USER_ACCOUNTS.sql, then try again.'
  }
  return friendlyAuthError(error, 'Unable to load your account. Try again.')
}

async function mergeGuestContent(userId: string) {
  if (!hasGuestDataToMerge()) return
  try {
    await importGuestFavorites(userId)
    await importGuestProgress(userId)
    clearGuestFavorites()
    clearGuestProgress()
    markMergeOffered()
  } catch (cause) {
    if (import.meta.env.DEV) console.error('[auth] guest merge', cause)
  }
}

export function AuthProvider({ children }: { children: ReactNode }) {
  const [session, setSession] = useState<Session | null>(null)
  const [profile, setProfile] = useState<Profile | null>(null)
  const [loading, setLoading] = useState(!!supabase)
  const [error, setError] = useState<string | null>(null)
  const generation = useRef(0)
  const currentSession = useRef<Session | null>(null)
  const profileUserId = useRef<string | null>(null)
  const hardFailUserId = useRef<string | null>(null)
  const mergedForUser = useRef<string | null>(null)

  const clearAuth = useCallback(() => {
    currentSession.current = null
    profileUserId.current = null
    hardFailUserId.current = null
    setSession(null)
    setProfile(null)
    setError(null)
    setLoading(false)
  }, [])

  const fetchProfile = useCallback(async (userId: string, force = false) => {
    if (!supabase) return null
    if (!force && hardFailUserId.current === userId) {
      return {
        profile: null as Profile | null,
        error: profileFetchError({ code: '42501', message: 'permission denied' }),
        sticky: true,
      }
    }

    const { data: sessionData, error: sessionError } = await supabase.auth.getSession()
    if (sessionError) return { profile: null, error: profileFetchError(sessionError), sticky: false }
    const active = sessionData.session
    if (!active?.access_token || active.user.id !== userId) {
      return {
        profile: null,
        error: 'Your session expired. Please sign in again.',
        sticky: false,
        expired: true as const,
      }
    }

    const profileQuery = await supabase
      .from('profiles')
      .select('*')
      .eq('id', userId)
      .maybeSingle()
    let data = profileQuery.data
    const profileError = profileQuery.error

    // Ensure a regular-user profile exists (pre-trigger signups / race).
    if (!profileError && !data) {
      const ensured = await supabase.rpc('ensure_user_profile' as never)
      const ensuredData = (ensured as { data?: Profile | null; error?: { message?: string } | null }).data
      const ensuredError = (ensured as { error?: { message?: string } | null }).error
      if (!ensuredError && ensuredData) {
        data = ensuredData
      } else if (ensuredError) {
        if (import.meta.env.DEV) console.warn('[auth] ensure_user_profile', ensuredError)
      }
    }

    if (profileError) {
      const sticky =
        profileError.code === '42501' ||
        /permission denied|403/i.test(profileError.message || '')
      if (sticky) hardFailUserId.current = userId
      return { profile: null, error: profileFetchError(profileError), sticky }
    }

    hardFailUserId.current = null
    // Regular users may briefly have no profile row; do not treat as fatal for public browsing.
    return { profile: (data as Profile | null) ?? null, error: null as string | null, sticky: false }
  }, [])

  const restore = useCallback(
    async (
      next: Session | null,
      options?: { forceProfile?: boolean; reason?: AuthChangeEvent | 'manual' | 'signout'; mergeGuest?: boolean },
    ) => {
      const request = ++generation.current
      const force = options?.forceProfile === true
      const nextId = next?.user.id ?? null
      const previousId = currentSession.current?.user.id ?? null
      const identityChanged = nextId !== previousId

      currentSession.current = next
      setSession(next)

      if (!next) {
        if (request === generation.current) clearAuth()
        return
      }

      if (identityChanged) {
        profileUserId.current = null
        setProfile(null)
        setError(null)
        setLoading(true)
      } else if (force) {
        hardFailUserId.current = null
        setError(null)
        setLoading(true)
      }

      const alreadyLoaded = profileUserId.current === nextId && !force
      const blockedWithoutRetry = !force && hardFailUserId.current === nextId
      if (alreadyLoaded || blockedWithoutRetry) {
        if (request === generation.current) {
          if (blockedWithoutRetry) setError(profileFetchError({ code: '42501' }))
          setLoading(false)
        }
        return
      }

      try {
        const result = await fetchProfile(next.user.id, force)
        if (request !== generation.current) return
        if (result?.expired) {
          await supabase?.auth.signOut()
          clearAuth()
          setError(result.error)
          return
        }
        if (result?.error && !result.profile) {
          // Keep session for public use; surface soft error only.
          setProfile(null)
          profileUserId.current = next.user.id
          setError(result.error)
        } else {
          profileUserId.current = next.user.id
          setProfile(result?.profile ?? null)
          setError(null)
        }

        const shouldMerge =
          options?.mergeGuest === true ||
          options?.reason === 'SIGNED_IN' ||
          (identityChanged && !!nextId)
        if (shouldMerge && nextId && mergedForUser.current !== nextId) {
          mergedForUser.current = nextId
          void mergeGuestContent(nextId)
        }
      } catch (cause) {
        if (request === generation.current) {
          setProfile(null)
          profileUserId.current = next.user.id
          setError(friendlyAuthError(cause, 'Unable to load your account. Try again.'))
        }
      } finally {
        if (request === generation.current) setLoading(false)
      }
    },
    [clearAuth, fetchProfile],
  )

  useEffect(() => {
    if (!supabase) {
      setLoading(false)
      return
    }
    let active = true
    const {
      data: { subscription },
    } = supabase.auth.onAuthStateChange((event, next) => {
      queueMicrotask(() => {
        if (!active) return
        if (event === 'TOKEN_REFRESHED' && next && currentSession.current?.user.id === next.user.id) {
          currentSession.current = next
          setSession(next)
          return
        }
        void restore(next, {
          reason: event,
          mergeGuest: event === 'SIGNED_IN',
        })
      })
    })
    return () => {
      active = false
      generation.current += 1
      subscription.unsubscribe()
    }
  }, [restore])

  async function signIn(email: string, password: string) {
    if (!supabase) throw new Error('Authentication is not configured.')
    hardFailUserId.current = null
    profileUserId.current = null
    mergedForUser.current = null
    const { error: authError } = await supabase.auth.signInWithPassword({ email, password })
    if (authError) throw new Error(friendlyAuthError(authError, 'The email or password is incorrect.'))
  }

  async function signUp(input: { email: string; password: string; displayName: string }) {
    if (!supabase) throw new Error('Authentication is not configured.')
    const displayName = input.displayName.trim()
    if (!displayName) throw new Error('Please enter a display name.')
    if (input.password.length < 6) throw new Error('Choose a stronger password (at least 6 characters).')

    const { data, error: authError } = await supabase.auth.signUp({
      email: input.email.trim(),
      password: input.password,
      options: {
        data: { display_name: displayName },
        // Role must never be chosen by the client — DB trigger sets role=user.
      },
    })
    if (authError) throw new Error(friendlyAuthError(authError, 'Unable to create your account. Please try again.'))

    const needsEmailConfirmation = !data.session
    if (data.session?.user.id) {
      mergedForUser.current = null
      try {
        await supabase.rpc('ensure_user_profile' as never)
      } catch {
        /* trigger may have created it */
      }
      // Update display name if profile already existed.
      await supabase
        .from('profiles')
        .update({ display_name: displayName })
        .eq('id', data.session.user.id)
    }
    return { needsEmailConfirmation }
  }

  async function signOut() {
    if (!supabase) {
      clearAuth()
      return
    }
    generation.current++
    mergedForUser.current = null
    clearMergeOffered()
    const { error: authError } = await supabase.auth.signOut()
    clearAuth()
    if (authError) throw new Error(friendlyAuthError(authError, 'Sign-out failed. Please try again.'))
  }

  async function requestPasswordReset(email: string) {
    if (!supabase) throw new Error('Authentication is not configured.')
    const redirectTo = `${window.location.origin}/login`
    const { error: resetError } = await supabase.auth.resetPasswordForEmail(email.trim(), { redirectTo })
    if (resetError) throw new Error(friendlyAuthError(resetError, 'Unable to send a reset email. Please try again.'))
  }

  const value = useMemo(
    () => ({
      session,
      user: session?.user ?? null,
      profile,
      role: (profile?.role as Profile['role']) ?? null,
      loading,
      error,
      isAuthenticated: Boolean(session?.user),
      isStaff: isStaffRole(profile?.role),
      signIn,
      signUp,
      signOut,
      refreshProfile: () => restore(currentSession.current, { forceProfile: true, reason: 'manual' }),
      requestPasswordReset,
    }),
    [session, profile, loading, error, restore],
  )

  return <AuthContext.Provider value={value}>{children}</AuthContext.Provider>
}
