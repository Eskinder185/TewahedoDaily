/** Opt-in fixture IO. Importing or plan mode never performs network/SQL work. */
import { spawn } from 'node:child_process'
import { fileURLToPath, pathToFileURL } from 'node:url'
import path from 'node:path'
import { requireSafe, StagingError, validateTarget, readApplicationTargets, validateExecutionEnvironment, validateStateDirectory } from './security-staging-environment.mjs'
import { newFixture, fixtureStore, runFixtures } from './security-staging-fixtures.mjs'
import { runStagingChecks } from './security-staging-checks.mjs'

const repoRoot = path.resolve(path.dirname(fileURLToPath(import.meta.url)), '..')
export function parseArguments(args) {
  const command = args[0]
  requireSafe(['plan','setup','verify','test','cleanup'].includes(command), 'COMMAND_REQUIRED')
  const result = { command }
  const flags = { '--staging-project-id':'projectId', '--production-project-id':'productionProjectId', '--state-dir':'directory' }
  for (let i=1; i<args.length; i++) {
    const flag = args[i]
    if (flag === '--execute' || flag === '--disposable-staging') {
      requireSafe(!result[flag], 'DUPLICATE_ARGUMENT'); result[flag] = true
    } else {
      requireSafe(flags[flag] && args[i+1] && !args[i+1].startsWith('--') && !result[flags[flag]], 'INVALID_ARGUMENT')
      result[flags[flag]] = args[++i]
    }
  }
  return result
}

export function runPsql(sql, env, spawnProcess = spawn, { discardOutput = false } = {}) {
  // Whitelist environment. Never pass URLs/passwords/SQL in argument arrays,
  // inherit PGSERVICE/PGOPTIONS, load psqlrc, invoke a shell or echo diagnostics.
  const childEnv = Object.fromEntries(['SystemRoot','WINDIR','PATH','PATHEXT','TEMP','TMP','HOME','USERPROFILE',
    'PGHOST','PGPORT','PGDATABASE','PGUSER','PGPASSWORD','PGSSLMODE','PGSSLROOTCERT']
    .filter(k => env[k] !== undefined).map(k => [k, env[k]]))
  childEnv.PGAPPNAME = 'tewahedo-disposable-security-fixtures'
  childEnv.PGCONNECT_TIMEOUT = '10'
  return new Promise((resolve, reject) => {
    const child = spawnProcess(process.platform === 'win32' ? 'psql.exe' : 'psql',
      ['-X','--no-password','--quiet','--tuples-only','--no-align','--set','ON_ERROR_STOP=1'],
      { shell: false, windowsHide: true, env: childEnv, stdio: ['pipe','pipe','pipe'] })
    let output = '', overflow = false, timedOut = false, stdinFailed = false
    let terminationTimer
    const timer = setTimeout(() => {
      timedOut = true; child.kill()
      terminationTimer = setTimeout(() => reject(new StagingError('PSQL_TERMINATION_UNCONFIRMED')), 5000)
    }, 30000)
    child.stdout.on('data', chunk => {
      if (discardOutput) return // Reviewed migration/catalog calls never log rows.
      if (Buffer.byteLength(output) + chunk.length > 16384) { overflow = true; child.kill() }
      else output += chunk.toString()
    })
    child.stderr.on('data', () => {}) // Never forward SQL/credentials/driver output.
    child.stdin.on('error', () => { stdinFailed = true })
    child.on('error', () => { clearTimeout(timer); clearTimeout(terminationTimer); reject(new StagingError('PSQL_UNAVAILABLE')) })
    child.on('close', code => {
      clearTimeout(timer)
      clearTimeout(terminationTimer)
      if (timedOut || overflow || stdinFailed || code !== 0) { reject(new StagingError('PSQL_FAILED_OR_INTERRUPTED')); return }
      try {
        const lines = output.trim().split(/\r?\n/).filter(l => l.startsWith('{'))
        resolve(lines.length ? JSON.parse(lines.at(-1)) : {})
      } catch { reject(new StagingError('PSQL_RESULT_INVALID')) }
    })
    child.stdin.end(sql)
  })
}

export function liveIo(target, env, { fetchRequest = fetch, sql = text => runPsql(text, env) } = {}) {
  const http = async (pathname, method, body, key, token, extra = {}) => {
    try {
      const response = await fetchRequest(target.url + pathname, { method, redirect: 'error', signal: AbortSignal.timeout(15000),
        headers: { apikey: key, 'Content-Type':'application/json', ...(token ? { Authorization: `Bearer ${token}` } : {}), ...extra },
        body: body === undefined ? undefined : JSON.stringify(body) })
      let size=0, text=''
      if (response.body) {
        const reader = response.body.getReader(), decoder = new TextDecoder()
        while (true) { const r=await reader.read(); if (r.done) break; size+=r.value.length
          if (size>65536) { await reader.cancel(); throw new Error('bound') }
          text+=decoder.decode(r.value, { stream:true })
        }
        text+=decoder.decode()
      }
      return { status: response.status, body: text ? JSON.parse(text) : null }
    } catch { throw new StagingError('STAGING_HTTP_FAILED_OR_INTERRUPTED') }
  }
  return {
    auth(method, route, body, admin=true) {
      const key = admin ? env.SECURITY_STAGING_SERVICE_KEY : env.SECURITY_STAGING_PUBLISHABLE_KEY
      return http(`/auth/v1${route}`, method, body, key, admin ? key : undefined)
    },
    sql(_kind, text) { return sql(text) },
    test(manifest, credentials, joinToken) {
      return runStagingChecks(manifest, (role, route, args, extra) => {
        const body = args && { ...args }
        if (body?.p_join_token === 'FROM_ENV') body.p_join_token = joinToken
        return http(route === '@auth/user' ? '/auth/v1/user' : `/rest/v1/${route}`, body ? 'POST' : 'GET', body,
          env.SECURITY_STAGING_PUBLISHABLE_KEY, role === 'anon' ? undefined : credentials[role], extra)
      })
    },
  }
}

export async function fixtureCommand(options, env, { root = repoRoot, applicationUrls = readApplicationTargets(root), ioFactory = liveIo } = {}) {
  const target = validateTarget(options, env, applicationUrls)
  validateStateDirectory(options.directory, root)
  if (options.command === 'plan') return { status:'PLAN_ONLY', operations:'5 Auth users, 5 private questions, 2 rooms; no requests or SQL' }
  requireSafe(options['--execute'] && options['--disposable-staging'], 'EXECUTION_OPT_IN_REQUIRED')
  validateExecutionEnvironment(target, env, { service: ['setup','cleanup'].includes(options.command) })
  const store = fixtureStore(options.directory, root, env.SECURITY_STAGING_STATE_KEY)
  const release = store.lock()
  let retainLock = false
  try {
    let s = store.load()
    if (!s) { requireSafe(options.command === 'setup', 'FIXTURE_STATE_MISSING'); s = newFixture(target); store.save(s) }
    const result = await runFixtures(options.command, s, target, ioFactory(target, env), state => store.save(state))
    if (['setup','verify'].includes(options.command)) store.manifest(s)
    return result
  } catch (error) {
    retainLock = error instanceof StagingError && error.code === 'PSQL_TERMINATION_UNCONFIRMED'
    throw error
  } finally { if (!retainLock) release() }
}

if (process.argv[1] && import.meta.url === pathToFileURL(process.argv[1]).href) {
  Promise.resolve().then(() => parseArguments(process.argv.slice(2)))
    .then(options => fixtureCommand(options, process.env))
    .then(result => console.log(JSON.stringify(result)))
    .catch(error => { console.error(JSON.stringify({ status:'BLOCKED', code: error instanceof StagingError ? error.code : 'STAGING_FIXTURE_OPERATION_FAILED' })); process.exitCode=1 })
}
