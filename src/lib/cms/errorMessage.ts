export function errorMessage(error: unknown) {
  if (typeof error === 'object' && error && 'code' in error) {
    const code = String((error as { code?: unknown }).code || '')
    const message = 'message' in error ? String((error as { message?: unknown }).message || '') : ''
    const details = 'details' in error ? String((error as { details?: unknown }).details || '') : ''
    const hint = 'hint' in error ? String((error as { hint?: unknown }).hint || '') : ''
    if (code === 'PGRST116') return 'This item was not found, or you do not have permission to view it.'
    if (/mezmur not found/i.test(message) || /mezmur no longer available/i.test(message)) {
      return 'This Mezmur no longer exists. Return to the library or create a new draft.'
    }
    if (code === '23505') return 'This slug already exists. Choose a unique slug.'
    if (code === '23503') {
      return 'This item is in use, or a selected category, singer, or tag no longer exists.'
    }
    if (code === '42501') {
      return 'You do not have permission to make this change. Your role or the content status may have changed.'
    }
    if (code === '42703' || /column .* does not exist/i.test(message)) {
      return import.meta.env.DEV
        ? `Database column mismatch: ${message}`
        : 'This form asked for a field that is not in the database yet.'
    }
    if (code === 'PGRST205' || /Could not find the table|relation .* does not exist/i.test(message)) {
      return import.meta.env.DEV
        ? `Missing table: ${message}`
        : 'This content source is unavailable. Try again later.'
    }
    if (import.meta.env.DEV && (message || details || hint)) {
      return [message, details, hint].filter(Boolean).join(' — ')
    }
    if (message && !/stack|exception|sqlstate/i.test(message)) return message
  }
  return error && typeof error === 'object' && 'message' in error
    ? String((error as { message?: unknown }).message)
    : 'Something went wrong. Please try again.'
}
