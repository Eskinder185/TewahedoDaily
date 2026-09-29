import { useCallback, useEffect, useRef, useState, type ReactNode } from 'react'
import type { AuthChangeEvent, Session } from '@supabase/supabase-js'
import { supabase } from '../supabase/client'
import { AuthContext, type Profile } from './useAuth'

function profileErrorMessage(error: { message?: string; code?: string; status?: number } | null): string {
  if (!error) return 'Unable to verify CMS access. Try again.'
  const code = error.code || ''
  const text = `${error.message || ''}`.toLowerCase()
  if (code === 'PGRST301' || error.status === 401 || text.includes('jwt') || text.includes('session')) {
    return 'Your session expired. Please sign in again.'
  }
  if (code === '42501' || error.status === 403 || text.includes('permission denied') || text.includes('403')) {
    return 'Signed in, but profile access was denied (403). Apply supabase/FIX_NOW.sql in the Supabase SQL Editor, then use Check access again.'
  }
  if (error.message && !/stack|exception|sqlstate/i.test(error.message)) return error.message
  return 'Unable to verify CMS access. Try again.'
}

const DENIED_403 =
  'Signed in, but profile access was denied (403). Apply supabase/FIX_NOW.sql in the Supabase SQL Editor, then use Check access again.'

export function AuthProvider({ children }: { children: ReactNode }) {
  const [session, setSession] = useState<Session | null>(null)
  const [profile, setProfile] = useState<Profile | null>(null)
  const [loading, setLoading] = useState(!!supabase)
  const [error, setError] = useState<string | null>(null)
  const generation = useRef(0)
  const currentSession = useRef<Session | null>(null)
  const profileUserId = useRef<string | null>(null)
  /** Sticky failure key so auth events cannot spam the same failing GET. */
  const hardFailUserId = useRef<string | null>(null)

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
      return { profile: null as Profile | null, error: DENIED_403, sticky: true }
    }

    const { data: sessionData, error: sessionError } = await supabase.auth.getSession()
    if (sessionError) return { profile: null, error: profileErrorMessage(sessionError), sticky: false }
    const active = sessionData.session
    if (!active?.access_token || active.user.id !== userId) {
      return { profile: null, error: 'Your session expired. Please sign in again.', sticky: false, expired: true as const }
    }

    const { data, error: profileError } = await supabase
      .from('profiles')
      .select('*')
      .eq('id', userId)
      .maybeSingle()

    if (profileError) {
      const sticky =
        profileError.code === '42501' ||
        /permission denied|403/i.test(profileError.message || '')
      if (sticky) hardFailUserId.current = userId
      return { profile: null, error: profileErrorMessage(profileError), sticky }
    }

    hardFailUserId.current = null
    if (!data) {
      return {
        profile: null,
        error:
          'No CMS profile is assigned to this account. Ask a super admin to grant access, or run bootstrap_first_super_admin in SQL.',
        sticky: false,
      }
    }
    return { profile: data, error: null as string | null, sticky: false }
  }, [])

  const restore = useCallback(
    async (next: Session | null, options?: { forceProfile?: boolean; reason?: AuthChangeEvent | 'manual' | 'signout' }) => {
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

      // Skip duplicate profile GETs for the same user (TOKEN_REFRESHED spam).
      const alreadyLoaded = profileUserId.current === nextId && !force
      const blockedWithoutRetry = !force && hardFailUserId.current === nextId
      if (alreadyLoaded || blockedWithoutRetry) {
        if (request === generation.current) {
          if (blockedWithoutRetry) setError(DENIED_403)
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
        if (result?.error) {
          setProfile(null)
          profileUserId.current = null
          setError(result.error)
          return
        }
        profileUserId.current = next.user.id
        setProfile(result?.profile ?? null)
        setError(null)
      } catch (cause) {
        if (request === generation.current) {
          setProfile(null)
          profileUserId.current = null
          setError(cause instanceof Error ? cause.message : 'Unable to verify CMS access. Try again.')
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
      // Defer out of the Auth lock. Only load profile when identity changes or on explicit sign-in.
      queueMicrotask(() => {
        if (!active) return
        if (event === 'TOKEN_REFRESHED' && next && currentSession.current?.user.id === next.user.id) {
          currentSession.current = next
          setSession(next)
          return
        }
        void restore(next, { reason: event })
      })
    })
    return () => {
      active = false
      generation.current += 1
      subscription.unsubscribe()
    }
  }, [restore])

  async function signIn(email: string, password: string) {
    if (!supabase) throw new Error('CMS authentication is not configured.')
    hardFailUserId.current = null
    profileUserId.current = null
    const { error: authError } = await supabase.auth.signInWithPassword({ email, password })
    if (authError) throw new Error('Sign-in failed. Check your credentials and try again.')
    // SIGNED_IN listener loads the profile; avoid a second parallel fetch here.
  }

  async function signOut() {
    if (!supabase) {
      clearAuth()
      return
    }
    generation.current++
    const { error: authError } = await supabase.auth.signOut()
    clearAuth()
    if (authError) throw new Error('Sign-out failed. Please try again.')
  }

  return (
    <AuthContext.Provider
      value={{
        session,
        profile,
        loading,
        error,
        signIn,
        signOut,
        refreshProfile: () => restore(currentSession.current, { forceProfile: true, reason: 'manual' }),
      }}
    >
      {children}
    </AuthContext.Provider>
  )
}
