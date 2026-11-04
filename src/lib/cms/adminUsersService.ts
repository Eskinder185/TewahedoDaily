import { db } from './mezmurService'
import { requireCmsStaffSession } from './cmsStaffAuth'

export type AdminUserProfile = {
  id: string
  display_name: string
  email: string | null
  role: string | null
  created_at: string
  updated_at: string
}

async function requireUserAdministrator() {
  const session = await requireCmsStaffSession('CMS user directory')
  if (session.profileRole !== 'admin' && session.profileRole !== 'super_admin') {
    throw new Error('CMS administrator access required.')
  }
}

/** Reads only RLS-visible profile columns. auth.users and service credentials are never exposed. */
export async function listAdminUsers(options: { search: string; role: string; page: number; pageSize?: number }) {
  await requireUserAdministrator()
  const pageSize = Math.min(100, Math.max(1, options.pageSize || 25))
  const page = Math.max(1, options.page)
  let query = db().from('profiles')
    .select('id,display_name,email,role,created_at,updated_at', { count: 'exact' })
    .order('created_at', { ascending: false })
    .range((page - 1) * pageSize, page * pageSize - 1)
  if (options.role && options.role !== 'all') query = query.eq('role', options.role as 'user')
  const search = options.search.trim().replace(/[,%()\\]/g, '').slice(0, 80)
  if (search) query = query.or(`display_name.ilike.%${search}%,email.ilike.%${search}%`)
  const { data, error, count } = await query
  if (error) throw error
  return { items: (data || []) as AdminUserProfile[], total: count ?? 0, page, pageSize }
}

export async function getAdminUser(id: string): Promise<AdminUserProfile> {
  await requireUserAdministrator()
  if (!/^[0-9a-f-]{36}$/i.test(id)) throw new Error('Invalid profile ID.')
  const { data, error } = await db().from('profiles')
    .select('id,display_name,email,role,created_at,updated_at').eq('id', id).maybeSingle()
  if (error) throw error
  if (!data) throw new Error('Profile not found or not visible to your role.')
  return data as AdminUserProfile
}
