/** Expected join rejections are data so the database attempt counter commits. */
export function assertGameNightResult(value: unknown): void {
  if (!value || typeof value !== 'object' || !('error' in value)) return
  const code = String(value.error)
  const messages: Record<string, string> = {
    rate_limited: 'Too many join attempts. Please try again in a minute.',
    room_unavailable: 'Room not found or expired.',
    invalid_join: 'Enter a six-character room code and a display name of at least two characters.',
    name_unavailable: 'That display name is already in the room.',
  }
  throw new Error(messages[code] || 'The Game Night request could not be completed.')
}

export type GameNightRpcError = { message?: string; code?: string; details?: string; hint?: string }

const SETUP_HELP = 'An administrator must finish the Game Night database setup (see docs/ai/GAME-NIGHT-HOSTING-2026-11-03.md).'

/**
 * Turns a Supabase RPC error into a message a host or guest can act on.
 * Only a PostgREST "function/table not found" response means the migration is missing; any other
 * error (including a Postgres "function ... does not exist" raised INSIDE an installed room
 * function, e.g. pgcrypto not on its search_path) is reported as what it really is.
 */
export function describeGameNightRpcError(rpcName: string, error: GameNightRpcError): string {
  const message = String(error.message || '').trim()
  const code = String(error.code || '')
  const text = `${message} ${error.details || ''}`
  // PostgREST: PGRST202 = function not in the schema cache, PGRST205 = table not in the schema cache.
  if (code === 'PGRST202' || code === 'PGRST205' || /could not find the function .* in the schema cache/i.test(message)) {
    return `Game Night is not installed on this database yet (missing ${rpcName}). ${SETUP_HELP}`
  }
  // SQLSTATE 42883/42P01 raised inside the function body: the function exists but a dependency is unreachable.
  if (code === '42883' || code === '42P01' || /(function|relation) .* does not exist/i.test(message)) {
    if (/gen_random_bytes|digest\(|pgcrypto/i.test(text)) {
      return `Game Night is installed, but its room functions cannot reach the pgcrypto extension (${rpcName}). ${SETUP_HELP}`
    }
    return `Game Night is installed, but a database object it needs is missing (${rpcName}: ${message}). ${SETUP_HELP}`
  }
  if (code === '23505' && /play_room_submissions|answer already/i.test(text)) return 'You already answered this question.'
  if (code === '23505') return 'That display name is already in the room.'
  if (/authentication required/i.test(message)) return 'Sign in to host a room. Guests can join with a room code without signing in.'
  if (/no reviewed private questions available/i.test(message)) {
    return 'No reviewed Game Night questions are available for these settings yet. Try another category or difficulty, or ask an administrator to add reviewed questions.'
  }
  if (code === '42501' || /permission denied/i.test(message)) {
    return /host permission/i.test(message) ? 'Only the host of this room can do that.' : `Game Night permission problem (${rpcName}): ${message || 'access denied'}. ${SETUP_HELP}`
  }
  return message || 'The Game Night request could not be completed.'
}
