import { spawnSync } from 'node:child_process'
import { existsSync, realpathSync } from 'node:fs'
import { isAbsolute, resolve } from 'node:path'
import { assertSafeEntry } from './workspace.mjs'
import { validateAgentConfig } from './agents.mjs'

const COMMANDS = { claude: { auth: ['auth', 'status'], flags: ['-p', '--model', '--effort', '--tools'] },
  codex: { auth: ['login', 'status'], flags: ['exec', '--sandbox', '-C', '-m', '-c'] } }
const MAX_PROBE_BYTES = 16_384

function defaultProbe() {
  return {
    locate(agent) {
      const command = process.platform === 'win32' ? 'where.exe' : 'which'
      const name = process.platform === 'win32' ? `${agent}.exe` : agent
      const result = spawnSync(command, [name], { shell: false, windowsHide: true,
        encoding: 'utf8', timeout: 3000, maxBuffer: MAX_PROBE_BYTES })
      return result.status === 0 ? result.stdout.split(/\r?\n/).find(Boolean) ?? null : null
    },
    run(entrypoint, args) {
      const script = /\.js$/i.test(entrypoint)
      const result = spawnSync(script ? process.execPath : entrypoint,
        script ? [entrypoint, ...args] : args, { shell: false, windowsHide: true,
          encoding: 'utf8', timeout: 5000, maxBuffer: MAX_PROBE_BYTES, input: '' })
      return { status: result.status, output: `${result.stdout ?? ''}${result.stderr ?? ''}`.slice(0, MAX_PROBE_BYTES),
        timedOut: result.error?.code === 'ETIMEDOUT' }
    },
  }
}

function safeEntrypoint(path) {
  if (typeof path !== 'string' || !isAbsolute(path) || !/\.(?:exe|js)$/i.test(path) ||
      resolve(path) !== path || !existsSync(path)) return false
  try { return realpathSync(path) === path && assertSafeEntry(path).isFile() } catch { return false }
}

function versionResult(result) {
  if (result?.timedOut) return { status: 'blocked', code: 'CLI_PROBE_TIMEOUT' }
  if (result?.status !== 0) return { status: 'unknown', code: 'CLI_VERSION_UNKNOWN' }
  const version = String(result.output ?? '').match(/\b\d+\.\d+\.\d+\b/)?.[0]
  return version ? { status: 'verified', code: 'CLI_VERSION_VERIFIED', version }
    : { status: 'unknown', code: 'CLI_VERSION_UNKNOWN' }
}

function authResult(result) {
  if (result?.timedOut) return { status: 'unknown', code: 'CLI_AUTH_TIMEOUT' }
  const output = String(result?.output ?? '')
  if (result?.status === 0 && /\b(?:logged in|authenticated)\b/i.test(output) &&
      !/\b(?:not logged in|unauthenticated)\b/i.test(output)) return { status: 'verified', code: 'CLI_AUTH_VERIFIED' }
  if (/\b(?:not logged in|unauthenticated|login required)\b/i.test(output)) {
    return { status: 'blocked', code: 'CLI_AUTH_MISSING' }
  }
  return { status: 'unknown', code: 'CLI_AUTH_UNKNOWN' }
}

function flagsResult(agent, result) {
  if (result?.timedOut) return { status: 'unknown', code: 'CLI_ARGUMENTS_TIMEOUT' }
  if (result?.status !== 0) return { status: 'unknown', code: 'CLI_ARGUMENTS_UNKNOWN' }
  const output = String(result.output ?? '')
  const flags = COMMANDS[agent].flags
  return flags.every((flag) => output.includes(flag))
    ? { status: 'verified', code: 'CLI_ARGUMENTS_VERIFIED' }
    : { status: 'blocked', code: 'CLI_ARGUMENTS_UNSUPPORTED' }
}

export function probeLiveCapabilities(config, { probe = defaultProbe(), env = process.env, executeReadOnly = false } = {}) {
  validateAgentConfig(config)
  const agents = {}
  for (const agent of ['claude', 'codex']) {
    const configuredPath = env[`TEWAHEDO_V5_${agent.toUpperCase()}_ENTRYPOINT`]
    let located = null
    try { located = configuredPath ?? probe.locate(agent) } catch { /* unavailable */ }
    if (!located) {
      agents[agent] = { executable: { status: 'blocked', code: 'CLI_UNAVAILABLE' },
        version: { status: 'unknown', code: 'CLI_VERSION_UNKNOWN' },
        authentication: { status: 'unknown', code: 'CLI_AUTH_UNKNOWN' },
        arguments: { status: 'unknown', code: 'CLI_ARGUMENTS_UNKNOWN' },
        model: { status: 'unknown', code: 'MODEL_ACCESS_UNKNOWN', requestedId: config[agent].modelId },
        effort: { status: 'unknown', code: 'EFFORT_ACCESS_UNKNOWN', requested: config[agent].effort } }
      continue
    }
    if (!safeEntrypoint(located)) {
      agents[agent] = { executable: { status: 'blocked', code: 'CLI_ENTRYPOINT_UNSAFE' },
        version: { status: 'unknown', code: 'CLI_VERSION_UNKNOWN' },
        authentication: { status: 'unknown', code: 'CLI_AUTH_UNKNOWN' },
        arguments: { status: 'unknown', code: 'CLI_ARGUMENTS_UNKNOWN' },
        model: { status: 'unknown', code: 'MODEL_ACCESS_UNKNOWN', requestedId: config[agent].modelId },
        effort: { status: 'unknown', code: 'EFFORT_ACCESS_UNKNOWN', requested: config[agent].effort } }
      continue
    }
    if (!executeReadOnly) {
      agents[agent] = { executable: { status: 'verified', code: 'CLI_EXECUTABLE_VERIFIED' },
        version: { status: 'unknown', code: 'CLI_VERSION_NOT_PROBED' },
        authentication: { status: 'unknown', code: 'CLI_AUTH_NOT_PROBED' },
        arguments: { status: 'unknown', code: 'CLI_ARGUMENTS_NOT_PROBED' },
        model: { status: 'unknown', code: 'MODEL_ACCESS_UNKNOWN', requestedId: config[agent].modelId },
        effort: { status: 'unknown', code: 'EFFORT_ACCESS_UNKNOWN', requested: config[agent].effort } }
      continue
    }
    let version, help, auth
    try { version = probe.run(located, ['--version']) } catch { version = null }
    try { help = probe.run(located, ['--help']) } catch { help = null }
    try { auth = probe.run(located, COMMANDS[agent].auth) } catch { auth = null }
    agents[agent] = {
      executable: { status: 'verified', code: 'CLI_EXECUTABLE_VERIFIED' },
      version: versionResult(version), authentication: authResult(auth), arguments: flagsResult(agent, help),
      model: { status: 'unknown', code: 'MODEL_ACCESS_UNKNOWN', requestedId: config[agent].modelId },
      effort: { status: 'unknown', code: 'EFFORT_ACCESS_UNKNOWN', requested: config[agent].effort },
    }
  }
  const checks = Object.values(agents).flatMap((item) => Object.values(item))
  const overall = checks.some((item) => item.status === 'blocked') ? 'blocked' : 'unknown'
  return { overall, agents, probesOnly: true, inferenceExecuted: false, credentialsLogged: false }
}
