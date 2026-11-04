/** Shared Studio/public-card source path safety, without importing game banks. */
export function internalSource(route: unknown): route is string {
  const unsafe = (text: string) => [...text].some(character => character === '\\' || character.charCodeAt(0) <= 32)
  if (typeof route !== 'string' || unsafe(route)) return false
  try {
    const decoded = decodeURIComponent(route)
    return /^\/(bible|library|hymns|practice|calendar)(?:[/?#]|$)/.test(decoded) && !unsafe(decoded)
  } catch { return false }
}
