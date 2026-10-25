export const CMS_STAFF_ROLES = ['editor', 'admin', 'super_admin'] as const

export type CmsStaffRole = (typeof CMS_STAFF_ROLES)[number]

export type CmsStaffIdentityInput = {
  sessionUserId: string
  verifiedUserId: string | null
  profileId: string | null
  profileRole: string | null
  isStaff: boolean
}

export type CmsStaffIdentity = {
  userId: string
  profileRole: CmsStaffRole
  isStaff: true
}

/** Pure validation used by the browser preflight and regression tests. */
export function evaluateCmsStaffIdentity(input: CmsStaffIdentityInput): CmsStaffIdentity {
  if (!input.verifiedUserId) {
    throw new Error('The access token could not be validated. Sign out and sign in again.')
  }
  if (input.verifiedUserId !== input.sessionUserId) {
    throw new Error(
      `Stale session: cached user ${input.sessionUserId} does not match validated JWT user ${input.verifiedUserId}. Sign out and sign in again.`,
    )
  }
  if (!input.profileId) {
    throw new Error(`No public.profiles row exists for authenticated user ${input.verifiedUserId}.`)
  }
  if (input.profileId !== input.verifiedUserId) {
    throw new Error(
      `Profile mismatch: authenticated user ${input.verifiedUserId} resolved to profile ${input.profileId}.`,
    )
  }
  if (!CMS_STAFF_ROLES.includes(input.profileRole as CmsStaffRole)) {
    throw new Error(
      `Authenticated profile ${input.profileId} has role ${input.profileRole || 'none'}; editor, admin, or super_admin is required.`,
    )
  }
  if (!input.isStaff) {
    throw new Error(
      `Authorization mismatch for ${input.profileId}: profiles.role is ${input.profileRole}, but public.is_staff() returned false for this JWT.`,
    )
  }
  return {
    userId: input.verifiedUserId,
    profileRole: input.profileRole as CmsStaffRole,
    isStaff: true,
  }
}
