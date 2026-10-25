/**
 * Shared CMS staff gate for Hymns / Zemari writes.
 * Always uses the browser Supabase client (session JWT), never a public-only fetch.
 */
import { supabase } from '../supabase/client'
import { evaluateCmsStaffIdentity, type CmsStaffRole } from './cmsStaffIdentity'
import { staffWriteError, type SupabaseWriteError } from './cmsWriteError'

export type CmsStaffSession = {
  userId: string
  email: string | null
  profileRole: CmsStaffRole
  isStaff: true
}

let lastStaffProbe: { at: number; value: CmsStaffSession | null; error: string | null } | null =
  null

function logOnceDev(scope: string, detail: unknown) {
  if (!import.meta.env.DEV) return
  console.error(`[cmsStaff] ${scope}`, detail)
}

/**
 * Verifies an authenticated staff session before mutating Zemari / mezmur_data_import.
 * Throws with a clear message for anonymous / non-staff / expired sessions.
 */
export async function requireCmsStaffSession(scope = 'cms write'): Promise<CmsStaffSession> {
  if (!supabase) {
    throw new Error('Supabase is not configured. Set VITE_SUPABASE_URL and the publishable key.')
  }

  const { data: sessionData, error: sessionError } = await supabase.auth.getSession()
  if (sessionError) {
    logOnceDev(`${scope} session`, sessionError)
    throw new Error(sessionError.message || 'Could not verify session. Sign in again.')
  }

  const session = sessionData.session
  const user = session?.user
  if (!session?.access_token || !user?.id) {
    throw new Error('You must be signed in as staff to save Zemari / Mezmur changes.')
  }

  // Ensure the client is using this JWT for subsequent PostgREST calls.
  const { error: setError } = await supabase.auth.setSession({
    access_token: session.access_token,
    refresh_token: session.refresh_token,
  })
  if (setError && import.meta.env.DEV) {
    console.warn('[cmsStaff] setSession', setError)
  }

  const { data: verifiedData, error: verifiedError } = await supabase.auth.getUser()
  if (verifiedError || !verifiedData.user?.id) {
    logOnceDev(`${scope} validated user`, verifiedError)
    throw new Error(
      `Could not validate the current JWT${verifiedError?.message ? `: ${verifiedError.message}` : '.'} Sign out and sign in again.`,
    )
  }

  const { data: profileRaw, error: profileError } = await supabase
    .from('profiles')
    .select('id, role')
    .eq('id', verifiedData.user.id)
    .maybeSingle()
  if (profileError) {
    logOnceDev(`${scope} profile`, profileError)
    throw staffWriteError('SELECT public.profiles for authenticated user', profileError)
  }

  const { data: isStaffRaw, error: staffError } = await supabase.rpc('is_staff' as never)
  if (staffError) {
    logOnceDev(`${scope} is_staff`, staffError)
    // Do not retry-spam permanent permission/schema errors.
    if (
      staffError.code === '42501' ||
      staffError.code === 'PGRST205' ||
      /permission denied|Could not find/i.test(staffError.message || '')
    ) {
      throw staffWriteError('RPC public.is_staff()', staffError)
    }
    throw new Error(staffError.message || 'Could not verify staff access.')
  }

  const profile = profileRaw as { id?: string; role?: string | null } | null
  const identity = evaluateCmsStaffIdentity({
    sessionUserId: user.id,
    verifiedUserId: verifiedData.user.id,
    profileId: profile?.id || null,
    profileRole: profile?.role || null,
    isStaff: Boolean(isStaffRaw),
  })
  const result: CmsStaffSession = {
    userId: identity.userId,
    email: verifiedData.user.email ?? user.email ?? null,
    profileRole: identity.profileRole,
    isStaff: true,
  }
  lastStaffProbe = { at: Date.now(), value: result, error: null }

  if (import.meta.env.DEV) {
    console.info('[cmsStaff] session', {
      scope,
      userId: result.userId,
      email: result.email,
      profileRole: result.profileRole,
      isStaff: result.isStaff,
    })
  }

  return result
}

export function getLastCmsStaffProbe() {
  return lastStaffProbe
}

export function mapStaffWriteError(
  scope: string,
  error: SupabaseWriteError | null,
): Error {
  if (import.meta.env.DEV) console.error(`[cmsStaff] ${scope}`, error)
  return staffWriteError(scope, error)
}
