/**
 * Static SECURITY DEFINER audit for a review-only SQL migration.
 *
 * Rules (any violation is returned, never thrown, so tests can assert on mutated SQL):
 *  1. The set of SECURITY DEFINER functions equals the allowlist EXACTLY (name and argument types). Extra, missing, or
 *     re-signed functions all fail. There is no wildcard and no per-schema allowance.
 *  2. Every allowlisted definer function fixes `search_path` to the empty string, contains no dynamic SQL (EXECUTE) and
 *     only references schema-qualified relations.
 *  3. Every allowlisted definer function revokes EXECUTE from PUBLIC, anon and authenticated, and grants it only to the
 *     listed roles. No other grant or revoke-less exposure for it is permitted.
 *  4. No function anywhere in the migration is granted to PUBLIC.
 *
 * This is structural. It cannot prove function ownership or live grants; see the staging checklist and the catalog
 * assertions in supabase/tests/faith_challenges_rollback_security.sql for those.
 */

const stripComments = (sql) => sql.replace(/\r\n/g, '\n').replace(/^\s*--.*$/gm, '')

const splitArgs = (raw) => {
  const out = []
  let depth = 0
  let current = ''
  for (const ch of raw) {
    if (ch === '(') depth += 1
    if (ch === ')') depth -= 1
    if (ch === ',' && depth === 0) { out.push(current); current = '' } else current += ch
  }
  if (current.trim()) out.push(current)
  return out
}

/** `p_id uuid`, `p_notes text default null`, `in x int` -> the type, lower-cased. */
const argType = (arg) => {
  const noDefault = arg.replace(/\s+default\s[\s\S]*$/i, '').replace(/:=[\s\S]*$/, '').trim()
  const tokens = noDefault.replace(/^(in|inout|out|variadic)\s+/i, '').split(/\s+/)
  return (tokens.length > 1 ? tokens.slice(1).join(' ') : tokens[0]).toLowerCase()
}

export function parseFunctions(sql) {
  const text = stripComments(sql)
  const header = /create\s+(?:or\s+replace\s+)?function\s+([\w."]+)\s*\(([\s\S]*?)\)\s*returns[\s\S]*?\bas\s+\$\$/gi
  const functions = []
  let match
  while ((match = header.exec(text))) {
    const bodyStart = header.lastIndex
    const bodyEnd = text.indexOf('$$', bodyStart)
    const name = match[1].replace(/"/g, '').toLowerCase()
    const types = splitArgs(match[2]).map(argType).filter(Boolean)
    functions.push({
      name,
      signature: `${name}(${types.join(',')})`,
      header: match[0],
      body: bodyEnd === -1 ? text.slice(bodyStart) : text.slice(bodyStart, bodyEnd),
      definer: /security\s+definer/i.test(match[0]),
    })
  }
  return { text, functions }
}

const escapeRegExp = (value) => value.replace(/[.*+?^${}()|[\]\\]/g, '\\$&')
/** Signature as written in GRANT/REVOKE: whitespace-insensitive around commas. */
const signaturePattern = (signature) => {
  const open = signature.indexOf('(')
  const name = signature.slice(0, open)
  const types = signature.slice(open + 1, -1).split(',').filter(Boolean).map((type) => escapeRegExp(type).replace(/\s+/g, '\\s+'))
  return `${escapeRegExp(name)}\\s*\\(\\s*${types.join('\\s*,\\s*')}\\s*\\)`
}

export function auditDefinerSurface(sql, { allowlist, grantedTo = ['service_role'] }) {
  const { text, functions } = parseFunctions(sql)
  const violations = []
  const definers = functions.filter((fn) => fn.definer).map((fn) => fn.signature)
  const unique = [...new Set(definers)]
  for (const signature of unique) if (!allowlist.includes(signature)) violations.push(`unexpected SECURITY DEFINER function ${signature}`)
  for (const signature of allowlist) if (!unique.includes(signature)) violations.push(`allowlisted SECURITY DEFINER function ${signature} is missing or not SECURITY DEFINER`)

  for (const signature of allowlist) {
    const fns = functions.filter((fn) => fn.signature === signature && fn.definer)
    if (!fns.length) continue
    for (const fn of fns) {
      if (!/set\s+search_path\s*=\s*''/i.test(fn.header)) violations.push(`${signature}: search_path must be fixed to the empty string`)
      if (/\bexecute\b/i.test(fn.body)) violations.push(`${signature}: dynamic SQL (EXECUTE) is not allowed in a definer function`)
      const unqualified = fn.body.match(/\b(?:from|join|(?<!for\s)update|delete\s+from|insert\s+into)\s+(?!public\.|pg_catalog\.|pg_temp\.)[a-z_][\w]*/gi) ?? []
      // `from` inside EXTRACT/SUBSTRING and plpgsql loop headers is followed by an expression, not a bare table name.
      const bare = unqualified.filter((hit) => !/^from\s+(?:jsonb?_|unnest|generate_series)/i.test(hit))
      if (bare.length) violations.push(`${signature}: unqualified relation reference (${bare[0].trim()})`)
    }
    const sig = signaturePattern(signature)
    const revokeOk = new RegExp(`revoke\\s+all\\s+on\\s+function\\s+${sig}\\s+from\\s+([^;]+);`, 'i').exec(text)
    if (!revokeOk) violations.push(`${signature}: missing REVOKE ALL ... FROM PUBLIC, anon, authenticated`)
    else {
      const revoked = revokeOk[1].toLowerCase().split(',').map((r) => r.trim())
      for (const role of ['public', 'anon', 'authenticated']) if (!revoked.includes(role)) violations.push(`${signature}: EXECUTE is not revoked from ${role}`)
    }
    const grants = [...text.matchAll(new RegExp(`grant\\s+execute\\s+on\\s+function\\s+${sig}\\s+to\\s+([^;]+);`, 'gi'))]
    if (!grants.length) violations.push(`${signature}: no explicit EXECUTE grant to ${grantedTo.join(', ')}`)
    for (const grant of grants) {
      const roles = grant[1].toLowerCase().split(',').map((r) => r.trim())
      for (const role of roles) if (!grantedTo.includes(role)) violations.push(`${signature}: EXECUTE must not be granted to ${role}`)
    }
  }
  if (/grant\s+[^;]*\bon\s+function\b[^;]*\bto\s+[^;]*\bpublic\b/i.test(text)) violations.push('a function is granted to PUBLIC')
  return violations
}
