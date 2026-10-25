export type SupabaseWriteError = {
  code?: string
  message?: string
  details?: string
  hint?: string
}

function context(error: SupabaseWriteError): string {
  return [error.message, error.details, error.hint]
    .map((value) => value?.trim())
    .filter(Boolean)
    .filter((value, index, values) => values.indexOf(value) === index)
    .join(' | ')
}

/** Preserve the operation and PostgreSQL diagnostic instead of hiding every 42501. */
export function staffWriteError(scope: string, error: SupabaseWriteError | null): Error {
  if (!error) return new Error(`${scope} failed without a database error response.`)

  const code = error.code?.trim() || 'database error'
  const diagnostic = context(error) || 'No database diagnostic was returned.'
  const message = error.message || ''

  if (/Editorial approval is required|review_status must be approved/i.test(message)) {
    return new Error(
      `${scope} was rejected because this Supabase project still has the obsolete approval-gated publication function. Apply migration 20261024180000_mezmur_two_state_publication_final.sql and retry.`,
    )
  }

  if (code === '42501' || /permission denied|row-level security|\brls\b/i.test(message)) {
    if (/An editor, admin, or super admin role is required|Admin approval is required/i.test(message)) {
      return new Error(
        `You do not have permission to perform this action (${scope}). An editor, admin, or super admin role is required. Database: ${diagnostic}`,
      )
    }
    if (/Use publish_mezmur_import/i.test(message)) {
      return new Error(
        `${scope} failed (42501): trigger public.mezmur_data_import_publication_guard rejected a direct publication transition. Save content without changing status, then call RPC public.publish_mezmur_import. Database: ${diagnostic}`,
      )
    }
    if (/Lyrics rights metadata can only be changed through the protected rights-verification workflow/i.test(message)) {
      return new Error(
        `${scope} failed (42501): trigger public.mezmur_data_import_publication_guard rejected a direct change to protected lyrics-rights fields. Use the dedicated rights-verification workflow. Database: ${diagnostic}`,
      )
    }

    const table = message.match(/(?:table|relation)\s+["']?([\w.]+)["']?/i)?.[1]
    const sequence = message.match(/sequence\s+["']?([\w.]+)["']?/i)?.[1]
    const target = table
      ? `table ${table}`
      : sequence
        ? `sequence ${sequence}`
        : 'the database target'
    return new Error(
      `Permission denied (${code}): your account does not have permission for ${scope} on ${target}. Database: ${diagnostic}`,
    )
  }
  if (code === 'PGRST116' || /0 rows|cannot coerce/i.test(message)) {
    return new Error(`${scope} matched no row. Refresh and try again. Database: ${diagnostic}`)
  }
  if (code === '23505') return new Error(`${scope} failed (23505): duplicate value. Database: ${diagnostic}`)
  return new Error(`${scope} failed (${code}). Database: ${diagnostic}`)
}
