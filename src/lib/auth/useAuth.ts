import type { Session, User } from '@supabase/supabase-js'
import { createContext, useContext } from 'react'
import type { Database } from '../supabase/database.types'

/** Staff / CMS roles that may access /admin (contributor = limited CMS). */
export type CmsRole = 'super_admin' | 'admin' | 'editor' | 'contributor'

/** All profile roles including regular visitors. */
export type AppRole = CmsRole | 'user'

export type Profile = Database['public']['Tables']['profiles']['Row'] & {
  role: AppRole | null
}

export const cmsRoles: readonly CmsRole[] = ['super_admin', 'admin', 'editor', 'contributor']
export const staffRoles: readonly CmsRole[] = ['super_admin', 'admin', 'editor']

export function isStaffRole(role: string | null | undefined): boolean {
  return role === 'editor' || role === 'admin' || role === 'super_admin'
}

export function hasCmsRole(profile: Profile | null, allowed: readonly CmsRole[] = cmsRoles) {
  const role = profile?.role
  if (!role || role === 'user') return false
  return allowed.includes(role as CmsRole)
}

export type AuthState = {
  session: Session | null
  user: User | null
  profile: Profile | null
  role: AppRole | null
  loading: boolean
  error: string | null
  isAuthenticated: boolean
  isStaff: boolean
  signIn: (email: string, password: string) => Promise<void>
  signUp: (input: {
    email: string
    password: string
    displayName: string
  }) => Promise<{ needsEmailConfirmation: boolean }>
  signOut: () => Promise<void>
  refreshProfile: () => Promise<void>
  requestPasswordReset: (email: string) => Promise<void>
}

export const AuthContext = createContext<AuthState | null>(null)

export function useAuth() {
  const auth = useContext(AuthContext)
  if (!auth) throw new Error('useAuth requires AuthProvider')
  return auth
}
