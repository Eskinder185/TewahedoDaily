import { useCallback, useEffect, useRef, useState, type ReactNode } from 'react'
import type { Session } from '@supabase/supabase-js'
import { supabase } from '../supabase/client'
import { AuthContext, type Profile } from './useAuth'

export function AuthProvider({ children }: { children: ReactNode }) {
  const [session, setSession] = useState<Session | null>(null)
  const [profile, setProfile] = useState<Profile | null>(null)
  const [loading, setLoading] = useState(!!supabase)
  const [error, setError] = useState<string | null>(null)
  const generation = useRef(0)
  const currentSession = useRef<Session | null>(null)

  const restore = useCallback(async (next: Session | null) => {
    const request = ++generation.current
    const identityChanged = next?.user.id !== currentSession.current?.user.id || !currentSession.current
    currentSession.current = next
    setSession(next)
    if (identityChanged) setProfile(null)
    setError(null)
    if (identityChanged) setLoading(true)
    try {
      if (next && supabase) {
        const { data, error: profileError } = await supabase.from('profiles').select('*').eq('id', next.user.id).maybeSingle()
        if (profileError) throw profileError
        if (request === generation.current) setProfile(data)
      }
    } catch {
      if (request === generation.current) setError('Unable to verify CMS access. Try again.')
    } finally {
      if (request === generation.current) setLoading(false)
    }
  }, [])

  useEffect(() => {
    if (!supabase) return
    let active = true
    const requests = generation
    // INITIAL_SESSION restores persisted auth. Defer database calls outside the Auth lock.
    const { data: { subscription } } = supabase.auth.onAuthStateChange((_event, next) => {
      queueMicrotask(() => { if (active) void restore(next) })
    })
    const refresh = () => { if (document.visibilityState === 'visible') void restore(currentSession.current) }
    window.addEventListener('focus', refresh)
    document.addEventListener('visibilitychange', refresh)
    return () => {
      active = false
      requests.current++
      subscription.unsubscribe()
      window.removeEventListener('focus', refresh)
      document.removeEventListener('visibilitychange', refresh)
    }
  }, [restore])

  async function signIn(email: string, password: string) {
    if (!supabase) throw new Error('CMS authentication is not configured.')
    const { error: authError } = await supabase.auth.signInWithPassword({ email, password })
    if (authError) throw new Error('Sign-in failed. Check your credentials and try again.')
  }
  async function signOut() {
    if (!supabase) return
    const { error: authError } = await supabase.auth.signOut()
    if (authError) throw new Error('Sign-out failed. Please try again.')
    await restore(null)
  }
  return <AuthContext.Provider value={{ session, profile, loading, error, signIn, signOut, refreshProfile: () => restore(currentSession.current) }}>{children}</AuthContext.Provider>
}
