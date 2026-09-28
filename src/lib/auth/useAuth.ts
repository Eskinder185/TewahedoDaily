import type { Session } from '@supabase/supabase-js'
import { createContext, useContext } from 'react'
import type { Database } from '../supabase/database.types'

export type CmsRole = 'super_admin' | 'admin' | 'editor' | 'contributor'
export type Profile = Database['public']['Tables']['profiles']['Row']
export const cmsRoles: readonly CmsRole[] = ['super_admin', 'admin', 'editor', 'contributor']
export type AuthState = {
  session: Session | null
  profile: Profile | null
  loading: boolean
  error: string | null
  signIn: (email: string, password: string) => Promise<void>
  signOut: () => Promise<void>
  refreshProfile: () => Promise<void>
}
export const AuthContext = createContext<AuthState | null>(null)
export function useAuth() {
  const auth = useContext(AuthContext)
  if (!auth) throw new Error('useAuth requires AuthProvider')
  return auth
}
export function hasCmsRole(profile: Profile | null, allowed: readonly CmsRole[] = cmsRoles) {
  return !!profile?.role && allowed.includes(profile.role)
}
