/**
 * Shared CMS staff gate for Hymns / Zemari writes.
 * Always uses the browser Supabase client (session JWT), never a public-only fetch.
 */
import { supabase } from '../supabase/client'

export type CmsStaffSession = {
  userId: string
  email: string | null
  isStaff: boolean
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

  const { data: isStaffRaw, error: staffError } = await supabase.rpc('is_staff' as never)
  if (staffError) {
    logOnceDev(`${scope} is_staff`, staffError)
    // Do not retry-spam permanent permission/schema errors.
    if (
      staffError.code === '42501' ||
      staffError.code === 'PGRST205' ||
      /permission denied|Could not find/i.test(staffError.message || '')
    ) {
      throw new Error(
        `Could not verify staff access (${staffError.code || 'error'}). Confirm public.is_staff() exists and your role is editor/admin.`,
      )
    }
    throw new Error(staffError.message || 'Could not verify staff access.')
  }

  const isStaff = Boolean(isStaffRaw)
  const result: CmsStaffSession = {
    userId: user.id,
    email: user.email ?? null,
    isStaff,
  }
  lastStaffProbe = { at: Date.now(), value: result, error: null }

  if (import.meta.env.DEV) {
    console.info('[cmsStaff] session', {
      scope,
      userId: result.userId,
      email: result.email,
      isStaff: result.isStaff,
    })
  }

  if (!isStaff) {
    throw new Error(
      'Signed in, but public.is_staff() is false. Your profiles.role must be editor, admin, or super_admin. Then apply supabase/mezmur-import/FIX_ZEMARI_STAFF_WRITE.sql if writes still return 403.',
    )
  }

  return result
}

export function getLastCmsStaffProbe() {
  return lastStaffProbe
}

export function mapStaffWriteError(
  scope: string,
  error: { code?: string; message?: string; details?: string; hint?: string } | null,
): Error {
  if (import.meta.env.DEV) console.error(`[cmsStaff] ${scope}`, error)
  if (!error) return new Error('Save failed.')
  const code = error.code || ''
  const message = error.message || ''
  if (code === '42501' || /permission denied|row-level security|rls/i.test(message)) {
    return new Error(
      `Permission denied (${code || 'RLS'}). Confirm you are signed in as staff (is_staff() = true), then apply supabase/mezmur-import/FIX_ZEMARI_STAFF_WRITE.sql.`,
    )
  }
  if (code === 'PGRST116' || /0 rows|cannot coerce/i.test(message)) {
    return new Error(`No matching row was updated (${scope}). Refresh and try again.`)
  }
  if (code === '23505') return new Error('This slug already exists. Choose a unique slug.')
  return new Error(message || 'Save failed.')
}
