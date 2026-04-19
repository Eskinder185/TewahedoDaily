/**
 * Strips `[` … `]` when the file is a pseudo-array: `[{...}{...}]` without commas
 * (invalid JSON). Inner text is then parsed as concatenated objects.
 */
function unwrapBracketConcatenatedArray(s: string): string {
  let t = s.trim()
  if (!t.startsWith('[')) return t
  t = t.slice(1).trimStart()
  t = t.trimEnd()
  if (t.endsWith(']')) {
    t = t.slice(0, -1).trimEnd()
  }
  return t
}

function tryParseStructured(s: string): unknown[] | null {
  try {
    const one = JSON.parse(s) as unknown
    if (Array.isArray(one)) return one
    if (one && typeof one === 'object' && !Array.isArray(one)) {
      const o = one as Record<string, unknown>
      if (Array.isArray(o.entries)) return o.entries
      if (o.type === 'chant' && o.form === 'mezmur') return [one]
    }
    return null
  } catch {
    return null
  }
}

/**
 * English chant data may be shipped as:
 * - A single JSON object with `entries: [...]`
 * - A valid top-level JSON array `[{...},{...}]`
 * - One workshop chant object
 * - Multiple JSON objects concatenated `{...}{...}` (invalid JSON)
 * - `[{...}{...}]` pseudo-array without commas between elements
 */
export function parseEnglishChantPackText(raw: string): unknown[] {
  let t = raw.trim()
  if (!t) return []
  if (t.charCodeAt(0) === 0xfeff) t = t.slice(1)

  const direct = tryParseStructured(t)
  if (direct !== null) return direct

  const unwrapped = unwrapBracketConcatenatedArray(t)
  const afterUnwrap = tryParseStructured(unwrapped)
  if (afterUnwrap !== null) return afterUnwrap

  const chunks = extractTopLevelJsonObjects(unwrapped)
  const out: unknown[] = []
  for (const chunk of chunks) {
    try {
      out.push(JSON.parse(chunk) as unknown)
    } catch {
      console.warn(
        '[TewahedoDaily] Skipping invalid JSON object in english-mezmur-chants.json',
      )
    }
  }
  return out
}

function extractTopLevelJsonObjects(s: string): string[] {
  const out: string[] = []
  let i = 0
  const len = s.length
  while (i < len) {
    while (i < len && /\s/.test(s[i])) i++
    if (i >= len) break
    if (s[i] !== '{') {
      throw new Error(
        `english-mezmur-chants.json: expected '{' at position ${i}`,
      )
    }
    const start = i
    let depth = 0
    let inString = false
    let escape = false
    let matched = false
    for (let j = i; j < len; j++) {
      const c = s[j]
      if (inString) {
        if (escape) {
          escape = false
        } else if (c === '\\') {
          escape = true
        } else if (c === '"') {
          inString = false
        }
        continue
      }
      if (c === '"') {
        inString = true
        continue
      }
      if (c === '{') depth++
      else if (c === '}') {
        depth--
        if (depth === 0) {
          out.push(s.slice(start, j + 1))
          i = j + 1
          matched = true
          break
        }
      }
    }
    if (!matched) {
      throw new Error('english-mezmur-chants.json: unclosed object')
    }
  }
  return out
}
