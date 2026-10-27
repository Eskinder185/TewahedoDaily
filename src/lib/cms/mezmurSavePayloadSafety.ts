export const PROTECTED_MEZMUR_APPROVAL_FIELDS = [
  'review_status',
  'rights_status',
  'publication_approved_at',
  'publication_approved_by',
] as const

export function protectedMezmurSaveFields(payload: Record<string, unknown>): string[] {
  return PROTECTED_MEZMUR_APPROVAL_FIELDS.filter((field) =>
    Object.prototype.hasOwnProperty.call(payload, field),
  )
}

/** Ordinary content saves must never mutate protected audit or rights fields. */
export function assertOrdinaryMezmurPayloadSafe(payload: Record<string, unknown>): void {
  const protectedFields = protectedMezmurSaveFields(payload)
  if (protectedFields.length) {
    throw new Error(
      `Ordinary Mezmur save was blocked locally because it included protected field(s): ${protectedFields.join(', ')}.`,
    )
  }
}
