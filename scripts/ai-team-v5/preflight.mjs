import { spawnSync } from 'node:child_process'
import { createRequire } from 'node:module'
import { existsSync, lstatSync, readFileSync } from 'node:fs'
import { dirname, join, resolve } from 'node:path'
import { assertSafeEntry } from './workspace.mjs'

const AGENTS = ['claude', 'codex', 'gemini', 'copilot']

function defaultProbe() {
  return {
    exists: (path) => existsSync(path),
    find(command) {
      const locator = process.platform === 'win32' ? 'where.exe' : 'which'
      const result = spawnSync(locator, [command], {
        encoding: 'utf8', windowsHide: true, shell: false, timeout: 5000,
      })
      return result.status === 0 ? result.stdout.split(/\r?\n/).find(Boolean) ?? null : null
    },
    run(command, args) {
      const result = spawnSync(command, args, {
        encoding: 'utf8', windowsHide: true, shell: false, timeout: 5000,
      })
      return { status: result.status, output: `${result.stdout ?? ''}${result.stderr ?? ''}`.slice(0, 200) }
    },
    browserExecutable(repository) {
      const require = createRequire(join(repository, 'package.json'))
      const playwright = require('playwright')
      return playwright.chromium.executablePath()
    },
  }
}

function check(id, status, category, code, extra = {}) {
  return { id, status, category, code, ...extra }
}

function parseVersion(text) {
  const match = String(text ?? '').match(/\b(\d+)\.(\d+)(?:\.(\d+))?\b/)
  return match ? [Number(match[1]), Number(match[2]), Number(match[3] ?? 0)] : null
}

function atLeast(version, minimum) {
  if (!version) return false
  for (let index = 0; index < 3; index += 1) {
    if (version[index] > minimum[index]) return true
    if (version[index] < minimum[index]) return false
  }
  return true
}

function npmCliPath(env, probe) {
  if (env.npm_execpath && (typeof env.npm_execpath !== 'string' || !/\.js$/i.test(env.npm_execpath))) {
    return { path: null, invalid: true }
  }
  if (env.npm_execpath && !probe.exists(env.npm_execpath)) return { path: null, invalid: true }
  const candidates = [
    env.npm_execpath,
    join(dirname(process.execPath), 'node_modules', 'npm', 'bin', 'npm-cli.js'),
    join(dirname(dirname(process.execPath)), 'node_modules', 'npm', 'bin', 'npm-cli.js'),
  ].filter((path) => typeof path === 'string' && /\.js$/i.test(path))
  for (const path of candidates) {
    if (!probe.exists(path)) continue
    try {
      if (lstatSync(path).isFile() && !lstatSync(path).isSymbolicLink()) return { path, invalid: false }
    } catch {
      return { path: null, invalid: true }
    }
    return { path: null, invalid: true }
  }
  return { path: null, invalid: false }
}

export function normalizeRequiredEnvNames(value) {
  if (value == null || value === '') return []
  if (typeof value !== 'string') throw new Error('INVALID_ENV_NAMES')
  const names = value.split(',').map((name) => name.trim())
  if (names.some((name) => !/^[A-Z_][A-Z0-9_]*$/.test(name)) || new Set(names).size !== names.length) {
    throw new Error('INVALID_ENV_NAMES')
  }
  return names
}

export function runPreflight({ repository, workspace = null, requiredEnvNames = [], env = process.env, probe = defaultProbe(), nodeVersion = process.versions.node, mode = 'full' }) {
  if (!['full', 'simulated'].includes(mode)) throw new Error('PREFLIGHT_MODE_INVALID')
  const checks = []
  const repo = resolve(repository)
  try {
    if (!probe.exists(repo) || !assertSafeEntry(repo).isDirectory()) throw new Error('INVALID_REPOSITORY_PATH')
    checks.push(check('repository', 'pass', null, 'REPOSITORY_OK'))
  } catch {
    checks.push(check('repository', 'blocked', 'invalid_path', 'INVALID_REPOSITORY_PATH'))
  }

  const node = parseVersion(nodeVersion)
  checks.push(atLeast(node, [22, 0, 0])
    ? check('node', 'pass', null, 'NODE_SUPPORTED')
    : check('node', 'blocked', 'unsupported_version', 'NODE_VERSION_UNSUPPORTED'))

  const npm = npmCliPath(env, probe)
  if (npm.invalid) checks.push(check('npm', 'blocked', 'invalid_path', 'NPM_CLI_PATH_INVALID'))
  else if (!npm.path) checks.push(check('npm', 'blocked', 'unavailable_tool', 'NPM_CLI_UNAVAILABLE'))
  else {
    let result
    try { result = probe.run(process.execPath, [npm.path, '--version']) }
    catch { result = { status: null, output: '' } }
    checks.push(result.status === 0 && atLeast(parseVersion(result.output), [10, 0, 0])
      ? check('npm', 'pass', null, 'NPM_SUPPORTED')
      : check('npm', 'blocked', result.status === 0 ? 'unsupported_version' : 'unavailable_tool',
        result.status === 0 ? 'NPM_VERSION_UNSUPPORTED' : 'NPM_CLI_UNAVAILABLE'))
  }

  let gitPath
  try { gitPath = probe.find(process.platform === 'win32' ? 'git.exe' : 'git') }
  catch { gitPath = null }
  if (!gitPath) checks.push(check('git', 'blocked', 'unavailable_tool', 'GIT_UNAVAILABLE'))
  else {
    let result
    try { result = probe.run(gitPath, ['--version']) }
    catch { result = { status: null, output: '' } }
    checks.push(result.status === 0 && atLeast(parseVersion(result.output), [2, 30, 0])
      ? check('git', 'pass', null, 'GIT_SUPPORTED')
      : check('git', 'blocked', result.status === 0 ? 'unsupported_version' : 'unavailable_tool',
        result.status === 0 ? 'GIT_VERSION_UNSUPPORTED' : 'GIT_UNAVAILABLE'))
  }

  let packageData = null
  const packagePath = join(repo, 'package.json')
  if (!probe.exists(packagePath)) checks.push(check('package', 'blocked', 'missing_configuration', 'PACKAGE_JSON_MISSING'))
  else {
    try {
      if (!assertSafeEntry(packagePath).isFile()) throw new Error('INVALID_PACKAGE_JSON')
      packageData = JSON.parse(readFileSync(packagePath, 'utf8'))
      if (!packageData || typeof packageData !== 'object' || Array.isArray(packageData)) throw new Error('INVALID_PACKAGE_JSON')
      checks.push(check('package', 'pass', null, 'PACKAGE_JSON_VALID'))
    } catch {
      checks.push(check('package', 'blocked', 'invalid_configuration', 'PACKAGE_JSON_INVALID'))
    }
  }

  const lockPath = join(repo, 'package-lock.json')
  if (!probe.exists(lockPath)) checks.push(check('lockfile', 'blocked', 'missing_configuration', 'LOCKFILE_MISSING'))
  else {
    try {
      if (!assertSafeEntry(lockPath).isFile()) throw new Error('INVALID_LOCKFILE')
      const lock = JSON.parse(readFileSync(lockPath, 'utf8'))
      checks.push(Number.isInteger(lock.lockfileVersion) && lock.lockfileVersion >= 2
        ? check('lockfile', 'pass', null, 'LOCKFILE_SUPPORTED')
        : check('lockfile', 'blocked', 'unsupported_version', 'LOCKFILE_VERSION_UNSUPPORTED'))
    } catch {
      checks.push(check('lockfile', 'blocked', 'invalid_configuration', 'LOCKFILE_INVALID'))
    }
  }

  if (mode === 'full') {
  const dependencies = join(repo, 'node_modules')
  if (!probe.exists(dependencies)) checks.push(check('dependencies', 'blocked', 'missing_dependency', 'LOCAL_DEPENDENCIES_MISSING'))
  else {
    try {
      checks.push(assertSafeEntry(dependencies).isDirectory()
        ? check('dependencies', 'pass', null, 'LOCAL_DEPENDENCIES_PRESENT')
        : check('dependencies', 'blocked', 'invalid_path', 'LOCAL_DEPENDENCIES_PATH_INVALID'))
    } catch {
      checks.push(check('dependencies', 'blocked', 'invalid_path', 'LOCAL_DEPENDENCIES_PATH_INVALID'))
    }
  }
  for (const [id, relativePath] of [
    ['vite', ['vite', 'bin', 'vite.js']],
    ['typescript', ['typescript', 'bin', 'tsc']],
    ['playwright', ['playwright', 'package.json']],
  ]) {
    const path = join(dependencies, ...relativePath)
    if (!probe.exists(path)) checks.push(check(id, 'blocked', 'missing_dependency', `${id.toUpperCase()}_MISSING`))
    else {
      try {
        checks.push(assertSafeEntry(path).isFile()
          ? check(id, 'pass', null, `${id.toUpperCase()}_PRESENT`)
          : check(id, 'blocked', 'invalid_path', `${id.toUpperCase()}_PATH_INVALID`))
      } catch {
        checks.push(check(id, 'blocked', 'invalid_path', `${id.toUpperCase()}_PATH_INVALID`))
      }
    }
  }
  if (workspace) {
    const isolatedDependencies = join(resolve(workspace), 'node_modules')
    if (!probe.exists(isolatedDependencies)) checks.push(check('workspace-dependencies', 'blocked', 'missing_dependency', 'WORKSPACE_DEPENDENCIES_MISSING'))
    else {
      try {
        const needed = [
          join(isolatedDependencies, 'vite', 'bin', 'vite.js'),
          join(isolatedDependencies, 'typescript', 'bin', 'tsc'),
          join(isolatedDependencies, 'playwright', 'package.json'),
        ]
        checks.push(assertSafeEntry(isolatedDependencies).isDirectory() && needed.every((path) => probe.exists(path) && assertSafeEntry(path).isFile())
          ? check('workspace-dependencies', 'pass', null, 'WORKSPACE_DEPENDENCIES_PRESENT')
          : check('workspace-dependencies', 'blocked', 'missing_dependency', 'WORKSPACE_DEPENDENCIES_MISSING'))
      } catch {
        checks.push(check('workspace-dependencies', 'blocked', 'invalid_path', 'WORKSPACE_DEPENDENCIES_PATH_INVALID'))
      }
    }
  }

  const journeyScript = join(repo, 'scripts', 'playwright-journeys.mjs')
  if (!packageData?.scripts?.['test:journeys'] || !probe.exists(journeyScript)) {
    checks.push(check('journey-script', 'blocked', 'missing_configuration', 'JOURNEY_SCRIPT_MISSING'))
  } else {
    try {
      checks.push(assertSafeEntry(journeyScript).isFile()
        ? check('journey-script', 'pass', null, 'JOURNEY_SCRIPT_PRESENT')
        : check('journey-script', 'blocked', 'invalid_path', 'JOURNEY_SCRIPT_PATH_INVALID'))
    } catch {
      checks.push(check('journey-script', 'blocked', 'invalid_path', 'JOURNEY_SCRIPT_PATH_INVALID'))
    }
  }
  try {
    const browser = probe.browserExecutable(repo)
    if (!browser || !probe.exists(browser)) checks.push(check('chromium', 'blocked', 'missing_dependency', 'CHROMIUM_MISSING'))
    else {
      try {
        checks.push(assertSafeEntry(browser).isFile()
          ? check('chromium', 'pass', null, 'CHROMIUM_PRESENT')
          : check('chromium', 'blocked', 'invalid_path', 'CHROMIUM_PATH_INVALID'))
      } catch {
        checks.push(check('chromium', 'blocked', 'invalid_path', 'CHROMIUM_PATH_INVALID'))
      }
    }
  } catch {
    checks.push(check('chromium', 'blocked', 'missing_dependency', 'CHROMIUM_MISSING'))
  }
  }

  if (!Array.isArray(requiredEnvNames) || requiredEnvNames.some((name) => typeof name !== 'string' || !/^[A-Z_][A-Z0-9_]*$/.test(name)) ||
      new Set(requiredEnvNames).size !== requiredEnvNames.length) {
    checks.push(check('required-env', 'blocked', 'invalid_configuration', 'ENV_NAMES_INVALID'))
  } else {
    for (const name of requiredEnvNames) {
      checks.push(env[name]
        ? check(`env:${name}`, 'pass', null, 'ENV_PRESENT')
        : check(`env:${name}`, 'blocked', 'missing_configuration', 'ENV_MISSING'))
    }
  }

  for (const agent of mode === 'full' ? AGENTS : []) {
    let found
    try { found = probe.find(agent) }
    catch { found = null }
    checks.push(found
      ? check(`agent:${agent}`, 'unverified', 'unverified_capability', 'AGENT_CAPABILITY_NOT_EXECUTED')
      : check(`agent:${agent}`, 'blocked', 'unavailable_tool', 'AGENT_CLI_UNAVAILABLE'))
  }
  const overall = checks.some((item) => item.status === 'blocked') ? 'blocked'
    : checks.some((item) => item.status === 'unverified') ? 'unverified' : 'ready'
  return { version: 1, overall, checks, agentsExecuted: false, dependenciesInstalled: false }
}
