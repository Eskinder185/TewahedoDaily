/** Local target checks, NOT a substitute for independent project ownership review. */
import { readFileSync, existsSync, lstatSync, realpathSync } from 'node:fs'
import path from 'node:path'

export class StagingError extends Error { constructor(code) { super(code); this.code = code } }
export function requireSafe(ok, code) { if (!ok) throw new StagingError(code) }
const REF = /^[a-z]{20}$/
export function readApplicationTargets(repoRoot) {
  const values = process.env.VITE_SUPABASE_URL ? [process.env.VITE_SUPABASE_URL] : []
  for (const name of ['.env', '.env.local']) {
    const file = path.join(repoRoot, name)
    if (!existsSync(file)) continue
    // Only inspect the URL. Never return credentials or echo file contents.
    const match = readFileSync(file, 'utf8').match(/^\s*VITE_SUPABASE_URL\s*=\s*([^\r\n]+)$/m)
    if (match) values.push(match[1].trim().replace(/^['"]|['"]$/g, ''))
  }
  return values
}

export function validateTarget({ projectId, productionProjectId }, env, applicationUrls = []) {
  requireSafe(REF.test(projectId || '') && REF.test(productionProjectId || ''), 'EXPLICIT_PROJECT_IDS_REQUIRED')
  requireSafe(projectId !== productionProjectId, 'PRODUCTION_TARGET_REJECTED')
  requireSafe(env.SECURITY_STAGING_PROJECT_REF === projectId, 'STAGING_REFERENCE_MISMATCH')
  if (env.SECURITY_PRODUCTION_PROJECT_REF) requireSafe(env.SECURITY_PRODUCTION_PROJECT_REF === productionProjectId, 'PRODUCTION_REFERENCE_MISMATCH')
  const refs = applicationUrls.map(url => {
    try {
      const parsed = new URL(url), ref = parsed.hostname.match(/^([a-z]{20})\.supabase\.co$/)?.[1]
      requireSafe(parsed.protocol === 'https:' && ref, 'APPLICATION_TARGET_INVALID')
      return ref
    }
    catch { throw new Error('APPLICATION_TARGET_INVALID') }
  }).filter(Boolean)
  requireSafe(!refs.includes(projectId), 'APPLICATION_TARGET_REJECTED')
  requireSafe(!refs.length || refs.includes(productionProjectId), 'PRODUCTION_REFERENCE_MISMATCH')
  return { projectId, productionProjectId, url: `https://${projectId}.supabase.co` }
}

export function validateExecutionEnvironment(target, env, { service = false } = {}) {
  requireSafe(env.SECURITY_STAGING_PUBLISHABLE_KEY?.startsWith('sb_publishable_')
    || legacyKeyMatches(env.SECURITY_STAGING_PUBLISHABLE_KEY, target.projectId, 'anon'), 'STAGING_PUBLIC_KEY_REQUIRED')
  if (service) requireSafe(env.SECURITY_STAGING_SERVICE_KEY?.startsWith('sb_secret_')
    || legacyKeyMatches(env.SECURITY_STAGING_SERVICE_KEY, target.projectId, 'service_role'), 'STAGING_SERVICE_KEY_REQUIRED')
  // First version deliberately accepts only an unambiguous direct connection.
  requireSafe(env.PGHOST === `db.${target.projectId}.supabase.co` && env.PGPORT === '5432'
    && env.PGUSER === 'postgres' && env.PGDATABASE === 'postgres', 'STAGING_DATABASE_TARGET_REQUIRED')
  requireSafe(env.PGSSLMODE === 'verify-full' && Boolean(env.PGPASSWORD), 'STAGING_DATABASE_TLS_REQUIRED')
  requireSafe(/^[a-f0-9]{64}$/i.test(env.SECURITY_STAGING_STATE_KEY || ''), 'STATE_ENCRYPTION_KEY_REQUIRED')
}

function legacyKeyMatches(key, project, role) {
  try { const p = JSON.parse(Buffer.from(key.split('.')[1], 'base64url')); return p.ref === project && p.role === role }
  catch { return false }
}

export function validateUserToken(token, userId, target) {
  try {
    const p = JSON.parse(Buffer.from(token.split('.')[1], 'base64url'))
    requireSafe(p.sub === userId && p.role === 'authenticated' && p.iss === `${target.url}/auth/v1`
      && p.exp > Date.now() / 1000 + 60, 'USER_TOKEN_TARGET_MISMATCH')
  } catch { throw new Error('USER_TOKEN_TARGET_MISMATCH') }
  // These claim checks are NOT signature validation; HTTP /auth/v1/user is also required.
}

const contains = (base, candidate) => { const r = path.relative(base, candidate); return r === '' || (!r.startsWith(`..${path.sep}`) && r !== '..' && !path.isAbsolute(r)) }
export function validateStateDirectory(directory, repoRoot) {
  requireSafe(path.isAbsolute(directory || ''), 'ABSOLUTE_STATE_PATH_REQUIRED')
  const root = realpathSync(repoRoot)
  const resolved = path.resolve(directory)
  requireSafe(!contains(root, resolved) && !contains(resolved, root), 'STATE_OUTSIDE_REPOSITORY_REQUIRED')
  let current = resolved
  while (true) {
    try { requireSafe(!lstatSync(current).isSymbolicLink(), 'STATE_LINK_REJECTED') }
    catch (e) { if (e.code !== 'ENOENT') throw e }
    const parent = path.dirname(current)
    if (parent === current) break
    current = parent
  }
  return resolved
}

/** Run identity validation BEFORE fetching/sending credentials for the old harness. */
export function assertHarnessTarget(projectId, productionProjectId, env, repoRoot) {
  return validateTarget({ projectId, productionProjectId }, env, readApplicationTargets(repoRoot))
}
