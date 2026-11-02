import { spawn, spawnSync } from 'node:child_process'
import { createHash } from 'node:crypto'
import { createServer, get } from 'node:http'
import { createRequire } from 'node:module'
import { existsSync, lstatSync, mkdirSync, mkdtempSync, readdirSync, readFileSync, statSync, writeFileSync } from 'node:fs'
import { tmpdir } from 'node:os'
import { dirname, join, relative, resolve, sep } from 'node:path'
import { createServer as createTcpServer } from 'node:net'

const require = createRequire(import.meta.url)
const root = resolve(process.cwd())
const argv = process.argv.slice(2)
const action = argv[0]
const dryRun = argv.includes('--dry-run')
const trial = argv.includes('--trial')
const task = argv.slice(1).filter((value) => !value.startsWith('--')).join(' ').trim()
const stateRoot = join(tmpdir(), 'tewahedo-ai-team-v4')
const diagnosticRecorded = Symbol('diagnosticRecorded')

const allowedRoots = new Set(['src', 'scripts', 'functions', 'backend', 'supabase', 'public', 'docs'])
const allowedFiles = /^(package\.json|package-lock\.json|index\.html|vite\.config\.[cm]?[jt]s|eslint\.config\.[cm]?[jt]s|playwright\.config\.[cm]?[jt]s|tsconfig(?:\.[^.]+)?\.json)$/
const sensitiveName = /(^|[._-])(?:credentials?|secrets?|passwords?|private[-_]?keys?|service[-_]?role)(?:[._-]|$)/i
const sensitiveSuffix = /\.(?:pem|key|p12|pfx|crt|cer|jks|secret)$/i
const generatedDirectory = /^(?:node_modules|dist|build|coverage|artifacts|test-results|tmp|reports|audit|backup|scratch|research|migration-reports|archive|\.git|\.serena|\.vscode|\.wrangler)$/i
const secretPatterns = [
  /-----BEGIN [A-Z0-9 ]*PRIVATE KEY-----/,
  /\b(?:ghp|gho|github_pat)_[A-Za-z0-9_]{20,}\b/,
  /\bsk-[A-Za-z0-9]{20,}\b/,
  /\bxox[baprs]-[A-Za-z0-9-]{20,}\b/,
  /\bAKIA[0-9A-Z]{16}\b/,
  /\b(?:Bearer|Basic)\s+[A-Za-z0-9][A-Za-z0-9._~+/=-]{19,}\b/i,
  /\b(?:api[_-]?key|access[_-]?token|client[_-]?secret|secret[_-]?key|password)\s*[:=]\s*['"](?!(?:test|wrong|example|placeholder|dummy)\b)[^'"]{12,}['"]/i,
  /\b(?:SUPABASE_SERVICE_ROLE_KEY|DATABASE_URL|AWS_SECRET_ACCESS_KEY)\s*=\s*[A-Za-z0-9][A-Za-z0-9+/=_-]{19,}/i,
]
const clip = (value, limit = 5000) => String(value ?? '').slice(0, limit)
const digest = (value) => createHash('sha256').update(value).digest('hex')

function fail(message) {
  throw new Error(`BLOCKED: ${message}`)
}

function inside(base, candidate) {
  const basePath = resolve(base)
  const candidatePath = resolve(candidate)
  return candidatePath === basePath || candidatePath.startsWith(`${basePath}${sep}`)
}

function relativePath(base, candidate) {
  if (!inside(base, candidate)) fail(`Path escapes permitted root: ${candidate}`)
  const value = relative(resolve(base), resolve(candidate)).replaceAll('\\', '/')
  if (!value || value === '.' || value.startsWith('../') || value.includes('/../')) {
    fail(`Invalid relative path: ${candidate}`)
  }
  return value
}

function classify(relativeValue, isDirectory) {
  const parts = relativeValue.split('/')
  const top = parts[0]
  if (!allowedRoots.has(top) && !(allowedFiles.test(relativeValue) && parts.length === 1)) return 'ignore'
  const name = parts.at(-1) ?? ''
  if (isDirectory && (generatedDirectory.test(name) || name.startsWith('.'))) return 'ignore'
  if (!isDirectory && (/^\.env(?:\..*)?$/i.test(name) || /^\.dev\.vars(?:\..*)?$/i.test(name) || name === '.npmrc')) return 'ignore'
  if (!isDirectory && (sensitiveName.test(name) || sensitiveSuffix.test(name))) fail(`Suspicious file in approved tree: ${relativeValue}`)
  if (parts.some((part) => part === '.git' || part === 'node_modules')) return 'ignore'
  if (allowedRoots.has(top)) return 'include'
  return 'include'
}

function rejectUnsafeEntry(info, path) {
  if (info.isSymbolicLink() || info.reparsePoint === true) {
    fail(`Symbolic link, junction, or reparse point rejected: ${path}`)
  }
  if (!info.isDirectory() && !info.isFile()) fail(`Ambiguous filesystem entry rejected: ${path}`)
}

function scanSecretContent(path, content) {
  const suspicious = secretPatterns.some((pattern) => {
    const match = content.match(pattern)
    return match && !/(?:test|example|placeholder|dummy|wrong)/i.test(match[0])
  })
  if (suspicious) {
    fail(`Suspicious secret content rejected in ${path}; values are not displayed`)
  }
}

function scanFile(path, relativeValue) {
  const content = readFileSync(path)
  scanSecretContent(relativeValue, content.toString('utf8'))
}

function verifyPathComponents(base, candidate) {
  if (!inside(base, candidate)) fail(`Path escapes permitted root: ${candidate}`)
  let current = resolve(base)
  const remainder = relative(current, resolve(candidate)).split(sep).filter(Boolean)
  for (const part of remainder) {
    current = join(current, part)
    if (!existsSync(current)) continue
    rejectUnsafeEntry(lstatSync(current), relativePath(base, current))
  }
}

function walk(base, directory = base, output = []) {
  if (!inside(base, directory)) fail(`Scan escaped root: ${directory}`)
  for (const entry of readdirSync(directory, { withFileTypes: true })) {
    const absolute = join(directory, entry.name)
    const relativeValue = relativePath(base, absolute)
    const info = lstatSync(absolute)
    rejectUnsafeEntry(info, relativeValue)
    const decision = classify(relativeValue, info.isDirectory())
    if (decision === 'ignore') continue
    if (info.isDirectory()) walk(base, absolute, output)
    else {
      scanFile(absolute, relativeValue)
      output.push(relativeValue)
    }
  }
  return output.sort()
}

function inventory(base) {
  return walk(base).map((path) => ({
    path,
    hash: digest(readFileSync(join(base, path))),
    bytes: statSync(join(base, path)).size,
  }))
}

function safeEnvironment(extra = {}) {
  const environment = { ...process.env }
  for (const key of Object.keys(environment)) {
    if (/(secret|token|password|credential|private|service|supabase|aws|azure|google)/i.test(key)) delete environment[key]
  }
  return { ...environment, CI: '1', ...extra }
}

function run(name, command, args, cwd, options = {}) {
  const result = spawnSync(command, args, {
    cwd, encoding: 'utf8', windowsHide: true, shell: false, timeout: options.timeout ?? 300000,
    maxBuffer: 16 * 1024 * 1024, env: options.env ?? safeEnvironment(),
  })
  const output = `${result.stdout ?? ''}${result.stderr ?? ''}`.trim()
  if (result.error || result.status !== 0) fail(`${name} failed: ${clip(output || result.error?.message, 2400)}`)
  return output
}

function npmCliPath() {
  const candidates = [
    process.env.npm_execpath,
    join(dirname(process.execPath), 'node_modules', 'npm', 'bin', 'npm-cli.js'),
    join(dirname(dirname(process.execPath)), 'node_modules', 'npm', 'bin', 'npm-cli.js'),
  ].filter(Boolean)
  const candidate = candidates.find((path) =>
    /\.js$/i.test(path) && existsSync(path) && lstatSync(path).isFile(),
  )
  if (!candidate) fail('Windows npm CLI is unavailable')
  return resolve(candidate)
}

function npmInvocation(args, platform = process.platform, cliPath = null) {
  if (!Array.isArray(args) || args.some((arg) => typeof arg !== 'string')) {
    fail('Invalid npm argument vector')
  }
  if (platform === 'win32') {
    const script = cliPath ?? npmCliPath()
    return { command: process.execPath, args: [script, ...args] }
  }
  return { command: 'npm', args: [...args] }
}

function localToolInvocation(tool, args, cwd) {
  if (!Array.isArray(args) || args.some((arg) => typeof arg !== 'string')) {
    fail(`Invalid ${tool} argument vector`)
  }
  const candidates = tool === 'tsc'
    ? [join(cwd, 'node_modules', 'typescript', 'bin', 'tsc')]
    : [join(cwd, 'node_modules', 'eslint', 'bin', 'eslint.js')]
  const script = candidates.find((path) => existsSync(path) && lstatSync(path).isFile())
  if (!script) fail(`Local ${tool} CLI is unavailable in isolated workspace`)
  return { command: process.execPath, args: [resolve(script), ...args] }
}

function git(args) {
  return run('Git', 'git', args, root, { timeout: 120000 })
}

function changesFromGit() {
  const tracked = git(['diff', '--name-status', 'HEAD', '--']).split(/\r?\n/).filter(Boolean)
  const untracked = git(['ls-files', '--others', '--exclude-standard']).split(/\r?\n/).filter(Boolean)
  const result = []
  for (const line of tracked) {
    const [status, ...paths] = line.split('\t')
    if ((status[0] === 'R' || status[0] === 'C') && paths.length > 1) {
      result.push({ status: 'D', path: paths[0] })
      result.push({ status: 'A', path: paths.at(-1) })
    } else result.push({ status: status[0], path: paths.at(-1) })
  }
  for (const path of untracked) if (path) result.push({ status: 'A', path })
  return result
}

function createBaseline(taskText, directory) {
  const current = inventory(root)
  const changes = changesFromGit()
  const id = digest(`${root}:${taskText}:${digest(JSON.stringify(current))}`).slice(0, 20)
  const snapshot = join(directory, 'baseline-snapshot')
  mkdirSync(snapshot, { recursive: true })
  copySnapshot(root, snapshot)
  const baseline = {
    version: 4, createdAt: new Date().toISOString(), root, task: taskText, changes,
    inventory: current, inventoryHash: digest(JSON.stringify(current)),
  }
  writeFileSync(join(directory, 'baseline.json'), JSON.stringify(baseline, null, 2))
  verifyInventory(snapshot, current, 'Baseline snapshot')
  return { ...baseline, id, directory, snapshot, diagnosticKeys: new Set() }
}

function copySnapshot(source, destination) {
  verifyPathComponents(destination, destination)
  for (const path of walk(source)) {
    const sourcePath = join(source, path)
    const target = join(destination, path)
    verifyPathComponents(destination, target)
    mkdirSync(dirname(target), { recursive: true })
    writeFileSync(target, readFileSync(sourcePath))
  }
}

function verifyInventory(directory, expected, label) {
  const actual = inventory(directory)
  if (JSON.stringify(actual) !== JSON.stringify(expected)) fail(`${label} content or inventory differs from baseline`)
}

function verifyMain(baseline) {
  verifyInventory(root, baseline.inventory, 'Main repository')
}

function createWorkspace(baseline) {
  const parent = mkdtempSync(join(tmpdir(), 'tewahedo-ai-team-v4-'))
  const workspace = join(parent, 'workspace')
  mkdirSync(workspace, { recursive: true })
  copySnapshot(baseline.snapshot, workspace)
  verifyInventory(workspace, baseline.inventory, 'Isolated snapshot')
  return { parent, workspace }
}

function checkCli(command) {
  const located = spawnSync('where.exe', [command], { encoding: 'utf8', windowsHide: true })
  if (located.status !== 0) fail(`${command} CLI is unavailable`)
  return run(`${command} help`, command, ['--help'], root, { timeout: 30000 })
}

function cliCompatibility() {
  const claude = checkCli('claude')
  const codex = checkCli('codex')
  const gemini = checkCli('agy')
  const copilot = checkCli('copilot')
  if (!/model|effort/i.test(claude)) fail('Claude CLI does not advertise required model/effort options')
  if (!/sandbox|reasoning|model/i.test(codex)) fail('Codex CLI does not advertise required execution options')
  if (!/model|effort/i.test(gemini)) fail('Gemini CLI does not advertise required model/effort options')
  if (!/model|silent/i.test(copilot)) fail('Copilot CLI does not advertise required model options')
}

function loadPlan(baseline) {
  const path = join(baseline.directory, 'plan.json')
  return existsSync(path) ? JSON.parse(readFileSync(path, 'utf8')) : null
}

function claudeArguments(prompt) {
  return ['-p', prompt, '--model', 'sonnet', '--effort', 'medium', '--tools', '']
}

function diagnosticCategory(error) {
  const message = String(error?.message ?? error)
  if (/secret|credential|password|token|private key|suspicious/i.test(message)) return 'sensitive-input-rejected'
  if (/cli|where\.exe|advertise|required.*option/i.test(message)) return 'cli-compatibility-failed'
  if (/snapshot|inventory|baseline|path|root|workspace|reparse|symbolic|junction/i.test(message)) return 'snapshot-or-path-verification-failed'
  if (/plan|tool call|invoke|heading|actionable/i.test(message)) return 'planning-response-invalid'
  if (/implementation|codex|no changes/i.test(message)) return 'implementation-failed'
  if (/test|build|typecheck|playwright/i.test(message)) return 'mandatory-test-failed'
  return 'stage-failed'
}

function stageDiagnostic(baseline, stage, exitCode, reason) {
  if (reason && typeof reason === 'object' && reason[diagnosticRecorded]) return
  if (reason && typeof reason === 'object') reason[diagnosticRecorded] = true
  const directory = baseline.directory
  const key = `${stage}:${exitCode}`
  if (!baseline.diagnosticKeys) baseline.diagnosticKeys = new Set()
  if (baseline.diagnosticKeys.has(key)) return
  baseline.diagnosticKeys.add(key)
  const path = join(directory, 'stage-diagnostics.json')
  const current = existsSync(path) ? JSON.parse(readFileSync(path, 'utf8')) : []
  current.push({ stage, exitCode, category: diagnosticCategory(reason) })
  writeFileSync(path, JSON.stringify(current, null, 2))
}

function planningFiles(baseline, taskText = task) {
  const candidates = []
  if (/who\s*am\s*i|whoamigame/i.test(taskText)) {
    candidates.push('src/components/play/WhoAmIGame.tsx', 'src/i18n/index.ts', 'src/lib/i18n/locale.tsx')
  } else {
    const explicitPaths = taskText.match(/\b(?:src|scripts|docs)\/[A-Za-z0-9_./-]+\b/g) ?? []
    candidates.push(...explicitPaths)
  }
  const files = candidates.filter((path, index) =>
    candidates.indexOf(path) === index &&
    baseline.inventory.some((entry) => entry.path === path),
  )
  if (!files.length) fail('No verified planning source files found')
  return files
}

function planningPrompt(baseline, taskText = task) {
  const files = planningFiles(baseline, taskText)
  let total = 0
  const context = files.map((path) => {
    const remaining = Math.max(0, 12000 - total)
    const content = clip(readFileSync(join(baseline.snapshot, path), 'utf8'), Math.min(5000, remaining))
    total += content.length
    return `\n--- ${path} ---\n${content}`
  }).join('')
  return `You are Claude Sonnet planning only. Do not use tools, emit tool calls, run commands, edit files, or discuss unrelated work.
Return a concise actionable read-only implementation plan in plain text with exactly these headings:
SCOPE
CHANGES
TESTS
RISKS
Include specific file paths from the supplied context. Do not include XML/JSON tool invocations.

Task: ${clip(taskText, 1800)}
Verified isolated snapshot: ${baseline.snapshot}
${context}`
}

function validatePlan(value) {
  const text = String(value ?? '').trim()
  if (text.length < 120) fail('Claude planning response is empty or incomplete')
  if (/<invoke\b|<tool\b|tool_use|function_call|(?:^|\n)\s*(?:cat|type|grep|rg|find|node|npm|git)\b/i.test(text)) {
    fail('Claude planning response attempted a tool call or command')
  }
  for (const heading of ['SCOPE', 'CHANGES', 'TESTS', 'RISKS']) {
    if (!new RegExp(`(?:^|\\n)${heading}\\b`, 'i').test(text)) fail(`Claude plan is missing ${heading}`)
  }
  if (!/src\/[A-Za-z0-9_./-]+/.test(text)) fail('Claude plan contains no actionable source path')
  return text
}

function plan(baseline) {
  try {
    const saved = loadPlan(baseline)
    if (saved && saved.sourceHash === baseline.inventoryHash && saved.task === task) {
      validatePlan(saved.plan)
      return saved
    }
    if (!task || !argv.includes('--approve-local-edits')) fail('Implementation requires --approve-local-edits and a task')
    verifyMain(baseline)
    try {
      cliCompatibility()
    } catch (error) {
      stageDiagnostic(baseline, 'cli-compatibility', 1, error)
      throw error
    }
    const output = run('Claude Sonnet Medium', 'claude', claudeArguments(planningPrompt(baseline)), baseline.directory)
    const validated = validatePlan(output)
    const result = { task, plan: validated, sourceHash: baseline.inventoryHash }
    writeFileSync(join(baseline.directory, 'plan.json'), JSON.stringify(result, null, 2))
    stageDiagnostic(baseline, 'planning', 0, 'validated')
    return result
  } catch (error) {
    stageDiagnostic(baseline, 'planning', 1, error)
    throw error
  }
}

function codexArguments(workspace, prompt) {
  return [
    'exec', '-m', 'gpt-6-sol', '-c', 'model_reasoning_effort="medium"',
    '--sandbox', 'workspace-write', '-C', workspace, prompt,
  ]
}

function implement(workspace, planData, baseline) {
  try {
    verifyMain(baseline)
    run('Codex gpt-6-sol implementation', 'codex', codexArguments(workspace, `Implement this approved task in the isolated workspace only.
Do not access the main repository, secrets, environment files, dependencies, Git metadata, or generated files.
Do not stage, commit, reset, clean, push, merge, deploy, or modify dependency manifests.
Task: ${clip(task, 1800)}
Plan: ${clip(planData.plan, 6000)}`), workspace, { timeout: 900000 })
  } catch (error) {
    stageDiagnostic(baseline, 'implementation', 1, error)
    throw error
  }
}

function changedFiles(baseline, workspace) {
  const before = new Map(baseline.inventory.map((file) => [file.path, file.hash]))
  const after = new Map(inventory(workspace).map((file) => [file.path, file.hash]))
  return [...new Set([...before.keys(), ...after.keys()])].filter((path) => before.get(path) !== after.get(path)).sort()
}

function allowedImplementationPath(path) {
  const top = path.split('/')[0]
  if (path === 'package.json' || path === 'package-lock.json') return false
  return allowedRoots.has(top) && classify(path, false) === 'include'
}

function validateChangedScope(files) {
  const prohibited = files.filter((path) => !allowedImplementationPath(path))
  if (prohibited.length) fail(`Agent changed prohibited path: ${prohibited.join(', ')}`)
}

function mandatoryTests(workspace, files) {
  const packageData = JSON.parse(readFileSync(join(workspace, 'package.json'), 'utf8'))
  const scripts = packageData.scripts ?? {}
  const lower = files.map((file) => file.toLowerCase())
  const required = new Map([['typecheck', ['tsc']], ['build', ['build']]])
  const has = (pattern) => lower.some((file) => pattern.test(file))
  const ui = has(/^(src|public|index\.html)\//)
  const play = has(/^src\/(?:components|pages|lib)\/play\//)
  const calendar = has(/^src\/(?:components|pages|lib)\/calendar|^src\/content\/(?:calendar|nextobservances)/)
  const sharedUi = has(/^(src\/(?:components\/layout|styles|lib\/(?:i18n|locale|routing))|index\.html)/)

  if (ui || sharedUi) required.set('test:journeys', ['scripts/playwright-journeys.mjs'])
  if (play) {
    for (const name of ['test:play-foundation', 'test:play-milestones', 'test:play-complete']) {
      required.set(name, ['play'])
    }
    if (scripts['test:play-image-catalog']) required.set('test:play-image-catalog', ['play'])
  }
  if (calendar) required.set('test:calendar-cards', ['calendar'])

  const explicitBrowserMappings = {
    'test:journeys': 'scripts/playwright-journeys.mjs',
  }
  for (const [name, marker] of Object.entries(explicitBrowserMappings)) {
    if (required.has(name) && !existsSync(join(workspace, marker))) {
      fail(`Mapped browser test is missing: ${marker}`)
    }
  }
  for (const [name, markers] of required) {
    if (name === 'typecheck') continue
    if (name === 'build' && !scripts.build) fail('Production build script is missing')
    if (name !== 'build' && !scripts[name]) fail(`Mandatory test script is missing: ${name}`)
  }
  if (required.size === 2 && ui) fail('No reliable applicable UI test mapping exists')
  return [...required.keys()]
}

function freePort() {
  return new Promise((resolvePort, reject) => {
    const server = createTcpServer()
    server.once('error', reject)
    server.listen(0, '127.0.0.1', () => {
      const port = server.address().port
      server.close(() => resolvePort(port))
    })
  })
}

function typecheckCommand(workspace) {
  return localToolInvocation('tsc', ['-b', '--pretty', 'false'], workspace)
}

async function waitForVite(port, child) {
  const deadline = Date.now() + 60000
  while (Date.now() < deadline) {
    if (child.exitCode !== null) fail('Vite server exited before readiness')
    try {
      const response = await new Promise((resolveResponse, reject) => {
        const request = get(`http://127.0.0.1:${port}/`, resolveResponse)
        request.setTimeout(2000, () => request.destroy(new Error('timeout')))
        request.on('error', reject)
      })
      response.resume()
      if (response.statusCode >= 200 && response.statusCode < 500) return
    } catch {}
    await new Promise((resolveWait) => setTimeout(resolveWait, 300))
  }
  fail('Owned Vite server did not become ready')
}

async function waitForProcessExit(child, timeout = 30000) {
  if (child.exitCode !== null) return
  await new Promise((resolveExit, rejectExit) => {
    const timer = setTimeout(() => rejectExit(new Error('Vite process tree did not exit')), timeout)
    child.once('close', () => {
      clearTimeout(timer)
      resolveExit()
    })
    child.once('error', (error) => {
      clearTimeout(timer)
      rejectExit(error)
    })
  })
}

async function waitForPortClosed(port, timeout = 30000) {
  const deadline = Date.now() + timeout
  while (Date.now() < deadline) {
    const serving = await new Promise((resolveServing) => {
      const request = get(`http://127.0.0.1:${port}/`, () => resolveServing(true))
      request.setTimeout(500, () => {
        request.destroy()
        resolveServing(false)
      })
      request.on('error', () => resolveServing(false))
    })
    if (!serving) return
    await new Promise((resolveWait) => setTimeout(resolveWait, 250))
  }
  fail(`Vite port ${port} remained available after shutdown`)
}

async function stopTree(child, port) {
  if (child.exitCode === null && process.platform === 'win32') {
    const result = spawnSync('taskkill.exe', ['/PID', String(child.pid), '/T', '/F'], { windowsHide: true, timeout: 30000 })
    if (result.error || result.status !== 0) fail('Unable to terminate the Vite process tree')
  } else if (child.exitCode === null) child.kill('SIGTERM')
  if (child.exitCode === null) await waitForProcessExit(child)
  await waitForPortClosed(port)
}

async function runTests(workspace, files, baseline) {
  const names = mandatoryTests(workspace, files)
  let server = null
  let port = null
  const results = []
  try {
    if (!existsSync(join(workspace, 'node_modules'))) {
      try {
        const npm = npmInvocation(['ci', '--ignore-scripts', '--no-audit', '--no-fund'])
        run('Install isolated dependencies', npm.command, npm.args, workspace, { timeout: 900000 })
      } catch (error) {
        if (baseline) stageDiagnostic(baseline, 'dependency-installation', 1, error)
        throw error
      }
    }
    if (names.includes('test:journeys')) {
      port = await freePort()
      const vite = join(workspace, 'node_modules', 'vite', 'bin', 'vite.js')
      if (!existsSync(vite)) fail('Vite executable is unavailable in isolated dependencies')
      server = spawn(process.execPath, [vite, '--host', '127.0.0.1', '--port', String(port), '--strictPort'], {
        cwd: workspace, env: safeEnvironment(), windowsHide: true, stdio: 'ignore',
      })
      await waitForVite(port, server)
    }
    for (const name of names) {
      let output
      try {
        const check = name === 'typecheck'
          ? typecheckCommand(workspace)
          : npmInvocation(['run', name])
        output = run(name, check.command, check.args, workspace, {
          timeout: name === 'build' || name === 'typecheck' ? 600000 : 300000,
          env: safeEnvironment(port ? { BASE_URL: `http://127.0.0.1:${port}` } : {}),
        })
      } catch (error) {
        if (baseline) stageDiagnostic(baseline, 'testing', 1, error)
        throw error
      }
      results.push({ name, status: 'PASS', output: clip(output, 2400) })
    }
    if (results.length !== names.length) fail('A mandatory test was skipped')
    return results
  } finally {
    if (server) await stopTree(server, port)
  }
}

function createReviewPackage(baseline, workspace, files, tests) {
  const directory = join(baseline.directory, 'review-package')
  mkdirSync(join(directory, 'files'), { recursive: true })
  const before = new Map(baseline.inventory.map((file) => [file.path, file]))
  const packageFiles = []
  for (const path of files) {
    if (!allowedImplementationPath(path)) fail(`Agent changed prohibited path: ${path}`)
    const source = join(workspace, path)
    if (existsSync(source)) {
      const target = join(directory, 'files', path)
      if (!inside(directory, target)) fail(`Review package path escaped root: ${path}`)
      mkdirSync(dirname(target), { recursive: true })
      scanFile(source, path)
      writeFileSync(target, readFileSync(source))
      packageFiles.push({ path, content: true, before: before.get(path)?.hash ?? null })
    } else packageFiles.push({ path, deleted: true, before: before.get(path)?.hash ?? null })
  }
  const diff = files.map((path) => {
    const oldPath = join(baseline.snapshot, path)
    const newPath = join(workspace, path)
    const oldText = existsSync(oldPath) ? readFileSync(oldPath, 'utf8') : ''
    const newText = existsSync(newPath) ? readFileSync(newPath, 'utf8') : ''
    return `--- ${existsSync(oldPath) ? `a/${path}` : '/dev/null'}\n+++ ${existsSync(newPath) ? `b/${path}` : '/dev/null'}\n${newText || oldText}`
  }).join('\n\n')
  writeFileSync(join(directory, 'diff.patch'), diff)
  writeFileSync(join(directory, 'review-package.json'), JSON.stringify({ task, baselineHash: baseline.inventoryHash, files: packageFiles, tests }, null, 2))
  scanSecretContent('review-package', readFileSync(join(directory, 'review-package.json'), 'utf8'))
  scanSecretContent('diff.patch', diff)
  return directory
}

function reviewWithGemini(directory) {
  const manifest = readFileSync(join(directory, 'review-package.json'), 'utf8')
  const files = JSON.parse(manifest).files.filter((file) => file.content).map((file) => `\n--- ${file.path} ---\n${readFileSync(join(directory, 'files', file.path), 'utf8')}`).join('')
  return run('Gemini 3.8 Flash Low review', 'agy', [
    '--print', `Review this complete package read-only. Do not run tools or edit files.
Return PASS, REVISE, or BLOCK. Missing tests are not passing.
${manifest}
${readFileSync(join(directory, 'diff.patch'), 'utf8')}
${files}`, '--model', 'gemini-3.8-flash-low', '--effort', 'low', '--mode', 'plan',
  ], directory)
}

function copilotApproval(directory, gemini, tests) {
  return run('Copilot Auto approval', 'copilot', [
    '-p', `Use only the supplied complete package. Approve only when all tests passed and Gemini returned PASS.
Gemini: ${clip(gemini, 5000)}
Tests: ${JSON.stringify(tests)}`, '--model', 'auto', '--allow-all-tools', '--deny-tool=shell', '--deny-tool=write', '--silent',
  ], directory)
}

function configuredAgents() {
  return {
    claude: { model: 'sonnet', effort: 'medium', invocation: claudeArguments('<prompt>') },
    codex: { model: 'gpt-6-sol', reasoning: 'medium', sandbox: 'workspace-write', invocation: codexArguments('<workspace>', '<prompt>') },
    gemini: { model: 'gemini-3.8-flash-low', effort: 'low' },
    copilot: { model: 'auto' },
  }
}

function trialTaskFiles(baseline) {
  const normalized = task.toLowerCase()
  if (normalized.includes('whoamigame') || normalized.includes('who am i')) {
    const path = 'src/components/play/WhoAmIGame.tsx'
    if (!baseline.inventory.some((file) => file.path === path)) fail(`Trial scope file is missing: ${path}`)
    return [path]
  }
  if (normalized.includes('calendar')) {
    const paths = baseline.inventory
      .map((file) => file.path)
      .filter((path) => /^src\/(?:components|pages|lib)\/calendar\//.test(path))
    if (paths.length) return paths
  }
  fail('Trial requires an explicit anticipated file scope; no reliable mapping exists for this task')
}

function trialMandatoryTests(workspace, files) {
  const names = mandatoryTests(workspace, files)
  return names.map((name) => ({ name, status: 'SIMULATED', detail: 'Would run in implementation workflow' }))
}

function trialReports(baseline, workspace, files, tests) {
  const directory = baseline.directory
  const report = {
    mode: 'TRIAL',
    status: 'SIMULATED',
    task,
    baseline: {
      status: 'SIMULATED',
      inventoryHash: baseline.inventoryHash,
      sourceFiles: baseline.inventory.length,
      gitChanges: baseline.changes.length,
      snapshotVerified: true,
    },
    isolatedWorkspace: workspace,
    agents: configuredAgents(),
    stages: [
      { name: 'implementation', status: 'SIMULATED', detail: 'No Codex process invoked; no workspace edits made' },
      { name: 'testing', status: 'SIMULATED', detail: 'Mandatory tests discovered but not executed' },
      { name: 'Gemini review', status: 'SIMULATED', detail: 'No Gemini process invoked' },
      { name: 'Copilot approval', status: 'SIMULATED', detail: 'No Copilot process invoked' },
    ],
    applicableFiles: files,
    mandatoryTests: tests,
    approvalGates: {
      testFailure: 'BLOCK',
      missingMandatoryTest: 'BLOCK',
      agentReview: 'BLOCK unless real review returns the required approval',
      automaticIntegration: 'DISABLED',
    },
    limitations: [
      'SIMULATED results are not PASS or APPROVED and do not certify implementation.',
      'No application files were edited and no changes were integrated.',
      'This trial verifies configuration and policy, not external CLI availability or test outcomes.',
    ],
  }
  const jsonPath = join(directory, 'trial-report.json')
  const markdownPath = join(directory, 'TRIAL-REPORT.md')
  writeFileSync(jsonPath, JSON.stringify(report, null, 2))
  writeFileSync(markdownPath, `# AI Team V4 Trial Report

Status: **SIMULATED**

Task: ${task}

## Baseline and isolation
- Baseline inventory hash: \`${baseline.inventoryHash}\`
- Source files: ${baseline.inventory.length}
- Git changes recorded: ${baseline.changes.length}
- Snapshot verified: SIMULATED
- Isolated workspace: \`${workspace}\`

## Agent configuration
- Claude: Sonnet, Medium effort
- Codex: gpt-6-sol, Medium reasoning, workspace-write
- Gemini: 3.8 Flash, Low effort
- Copilot: Auto

## Applicable files
${files.map((file) => `- ${file}`).join('\n')}

## Mandatory tests
${tests.map((test) => `- ${test.name}: SIMULATED (not executed)`).join('\n')}

## Approval gates
- Test failure: BLOCK
- Missing mandatory test: BLOCK
- Agent review: BLOCK unless real review approves
- Automatic integration: DISABLED

No AI agents were invoked. No application files were edited. No Git integration occurred.
`)
  return { jsonPath, markdownPath }
}

function trialMode(baseline) {
  const { workspace } = createWorkspace(baseline)
  const files = trialTaskFiles(baseline)
  const tests = trialMandatoryTests(workspace, files)
  stageDiagnostic(baseline, 'implementation', 0, 'SIMULATED; Codex not invoked')
  stageDiagnostic(baseline, 'testing', 0, 'SIMULATED; tests not executed')
  stageDiagnostic(baseline, 'review', 0, 'SIMULATED; Gemini and Copilot not invoked')
  const reports = trialReports(baseline, workspace, files, tests)
  console.log(`Trial reports: ${reports.jsonPath}`)
  console.log(reports.markdownPath)
}

function report(baseline, workspace, files, tests, gemini, approval, packageDirectory) {
  writeFileSync(join(baseline.directory, 'REPORT.md'), `# AI Team V4 Report

Task: ${task}

## Files changed
${files.map((file) => `- ${file}`).join('\n')}

## Test outcomes
${tests.map((test) => `- ${test.name}: ${test.status}`).join('\n')}

## Review decisions
- Gemini 3.8 Flash Low: ${clip(gemini, 1200)}
- Copilot Auto: ${clip(approval, 1200)}

## Manual integration
Changes remain isolated. Inspect ${workspace} and ${packageDirectory}, then manually integrate only after explicit approval.

## Safety limitations
Automated secret scanning uses high-confidence patterns and cannot guarantee detection of every secret.
Working-directory selection and CLI sandbox settings are not a complete security boundary; stronger isolation requires a separate restricted Windows account, VM, or container.
`)
}

async function selfTest() {
  const base = mkdtempSync(join(tmpdir(), 'tewahedo-v4-self-test-'))
  const source = join(base, 'source')
  const destination = join(base, 'destination')
  const codexWorkspace = join(base, 'implementation-workspace')
  mkdirSync(join(codexWorkspace, 'node_modules', 'typescript', 'bin'), { recursive: true })
  mkdirSync(join(codexWorkspace, 'node_modules', 'eslint', 'bin'), { recursive: true })
  const tscScript = join(codexWorkspace, 'node_modules', 'typescript', 'bin', 'tsc')
  const eslintScript = join(codexWorkspace, 'node_modules', 'eslint', 'bin', 'eslint.js')
  writeFileSync(tscScript, '')
  writeFileSync(eslintScript, '')
  const typecheck = typecheckCommand(codexWorkspace)
  const fakeNpmCli = 'C:\\node\\node_modules\\npm\\bin\\npm-cli.js'
  const windowsNpm = npmInvocation(['ci', '--ignore-scripts', '--no-fund'], 'win32', fakeNpmCli)
  if (
    windowsNpm.command !== process.execPath ||
    JSON.stringify(windowsNpm.args) !== JSON.stringify([fakeNpmCli, 'ci', '--ignore-scripts', '--no-fund'])
  ) fail('Windows npm launcher self-test failed')
  const nativeNpm = npmInvocation(['run', 'build'], 'linux')
  if (nativeNpm.command !== 'npm' || JSON.stringify(nativeNpm.args) !== JSON.stringify(['run', 'build'])) {
    fail('Non-Windows npm launcher self-test failed')
  }
  try {
    npmInvocation(['run', 'test with spaces'], 'win32', fakeNpmCli)
    const invalidArgs = /** @type {string[]} */ (['run', 7])
    npmInvocation(invalidArgs, 'win32', fakeNpmCli)
    fail('npm argument-boundary self-test failed')
  } catch (error) {
    if (!String(error.message).includes('Invalid npm argument vector')) throw error
  }
  if (
    typecheck.command !== process.execPath ||
    JSON.stringify(typecheck.args) !== JSON.stringify([resolve(tscScript), '-b', '--pretty', 'false'])
  ) fail('TypeScript command self-test failed')
  const eslint = localToolInvocation('eslint', ['src path with spaces'], codexWorkspace)
  if (
    eslint.command !== process.execPath ||
    JSON.stringify(eslint.args) !== JSON.stringify([resolve(eslintScript), 'src path with spaces'])
  ) fail('ESLint launcher self-test failed')
  const codexArgs = codexArguments(codexWorkspace, 'self-test prompt')
  const claudeArgs = claudeArguments('self-test prompt')
  if (
    claudeArgs[0] !== '-p' ||
    claudeArgs[2] !== '--model' ||
    claudeArgs[3] !== 'sonnet' ||
    claudeArgs[4] !== '--effort' ||
    claudeArgs[5] !== 'medium'
  ) fail('Claude argument self-test failed')
  if (
    codexArgs[0] !== 'exec' ||
    codexArgs[1] !== '-m' ||
    codexArgs[2] !== 'gpt-6-sol' ||
    codexArgs[3] !== '-c' ||
    codexArgs[4] !== 'model_reasoning_effort="medium"' ||
    codexArgs[5] !== '--sandbox' ||
    codexArgs[codexArgs.indexOf('--sandbox') + 1] !== 'workspace-write' ||
    codexArgs[codexArgs.indexOf('-C') + 1] !== codexWorkspace
  ) fail('Codex argument self-test failed')
  const validPlan = `SCOPE
src/components/play/WhoAmIGame.tsx
CHANGES
Update the bilingual labels in the component.
TESTS
Run the focused Play checks.
RISKS
Preserve existing fallback text.`
  if (validatePlan(validPlan) !== validPlan) fail('valid planner response self-test failed')
  for (const invalid of [
    '<invoke name="Read">',
    'SCOPE\nsrc/components/play/WhoAmIGame.tsx\nCHANGES\nonly',
    'SCOPE\nsrc/components/play/WhoAmIGame.tsx\nCHANGES\nx\nTESTS\nrun node test\nRISKS\nx',
  ]) {
    try { validatePlan(invalid); fail('invalid planner response self-test failed') }
    catch (error) { if (!String(error.message).includes('Claude plan') && !String(error.message).includes('tool call')) throw error }
  }
  const planningBaseline = {
    snapshot: source,
    inventory: [{ path: 'src/components/play/WhoAmIGame.tsx' }, { path: 'src/i18n/index.ts' }, { path: 'src/lib/i18n/locale.tsx' }],
  }
  mkdirSync(join(source, 'src/components/play'), { recursive: true })
  mkdirSync(join(source, 'src/i18n'), { recursive: true })
  mkdirSync(join(source, 'src/lib/i18n'), { recursive: true })
  writeFileSync(join(source, 'src/components/play/WhoAmIGame.tsx'), 'export const WhoAmIGame = true')
  writeFileSync(join(source, 'src/i18n/index.ts'), 'export const labels = {}')
  writeFileSync(join(source, 'src/lib/i18n/locale.tsx'), 'export const locale = {}')
  const prompt = planningPrompt(planningBaseline, 'Fix English and Amharic consistency in WhoAmIGame')
  if (!prompt.includes('--- src/components/play/WhoAmIGame.tsx ---') || prompt.length > 14000) fail('planner path/size self-test failed')
  mkdirSync(join(source, 'src'), { recursive: true })
  writeFileSync(join(source, 'src', 'changed.ts'), 'before')
  copySnapshot(source, destination)
  if (relativePath(source, join(source, 'src', 'changed.ts')) !== 'src/changed.ts') fail('relative path self-test failed')
  writeFileSync(join(source, 'src', 'changed.ts'), 'after')
  writeFileSync(join(source, 'src', 'added.ts'), 'added')
  const baseline = { inventory: inventory(destination), snapshot: destination, directory: base }
  if (!changedFiles(baseline, source).includes('src/added.ts')) fail('added-file self-test failed')
  if (!changedFiles(baseline, source).includes('src/changed.ts')) fail('modified-file self-test failed')
  writeFileSync(join(source, 'src', 'deleted.ts'), 'delete')
  const deletionBaseline = { inventory: inventory(source), snapshot: source, directory: base }
  const deletionWorkspace = join(base, 'deleted-workspace')
  copySnapshot(source, deletionWorkspace)
  require('node:fs').rmSync(join(deletionWorkspace, 'src', 'deleted.ts'))
  if (!changedFiles(deletionBaseline, deletionWorkspace).includes('src/deleted.ts')) fail('deleted-file self-test failed')
  const suspicious = join(source, 'src', 'password.txt')
  writeFileSync(suspicious, 'secret')
  try { inventory(source); fail('suspicious-file self-test failed') } catch (error) { if (!String(error.message).includes('Suspicious')) throw error }
  require('node:fs').rmSync(suspicious)
  try { scanSecretContent('self-test', 'client_secret="live-not-printable-value"'); fail('content-scan self-test failed') }
  catch (error) { if (!String(error.message).includes('Suspicious secret content')) throw error }
  try { rejectUnsafeEntry({ isSymbolicLink: () => true, isDirectory: () => false, isFile: () => false }, 'src/linked.txt'); fail('symlink self-test failed') }
  catch (error) { if (!String(error.message).includes('Symbolic link')) throw error }
  try { rejectUnsafeEntry({ isSymbolicLink: () => false, reparsePoint: true, isDirectory: () => true, isFile: () => false }, 'src/junction'); fail('reparse-point self-test failed') }
  catch (error) { if (!String(error.message).includes('reparse point')) throw error }
  writeFileSync(join(source, 'package.json'), JSON.stringify({
    scripts: {
      build: 'vite build',
      'test:journeys': 'node scripts/playwright-journeys.mjs',
      'test:play-foundation': 'node scripts/test-play-foundation.mjs',
      'test:play-milestones': 'node scripts/test-play-milestones.mjs',
      'test:play-complete': 'node scripts/test-play-complete.mjs',
      'test:play-image-catalog': 'node scripts/test-play-image-catalog.mjs',
    },
  }))
  mkdirSync(join(source, 'scripts'), { recursive: true })
  writeFileSync(join(source, 'scripts', 'playwright-journeys.mjs'), '')
  const whoAmITests = mandatoryTests(source, ['src/components/play/WhoAmIGame.tsx'])
  if (!whoAmITests.includes('test:play-foundation') || !whoAmITests.includes('test:journeys')) fail('focused Play test self-test failed')
  if (whoAmITests.some((name) => /search|mezmur|church-library|bible-cms/i.test(name))) fail('unrelated Play test self-test failed')
  const sharedTests = mandatoryTests(source, ['src/components/layout/AppShell.tsx'])
  if (!sharedTests.includes('test:journeys') || sharedTests.includes('test:play-complete')) fail('shared infrastructure test self-test failed')
  const postTestBaseline = { inventory: inventory(source) }
  writeFileSync(join(source, 'src', 'post-test.ts'), 'post-test')
  if (!changedFiles(postTestBaseline, source).includes('src/post-test.ts')) fail('post-test inventory self-test failed')
  require('node:fs').rmSync(join(source, 'src', 'post-test.ts'))
  writeFileSync(join(source, 'package.json'), JSON.stringify({ scripts: { build: 'vite build' } }))
  try { mandatoryTests(source, ['src/changed.ts']); fail('missing-test self-test failed') }
  catch (error) { if (!String(error.message).includes('Mandatory test script is missing')) throw error }
  const port = await freePort()
  const child = spawn(process.execPath, ['-e', 'require("node:http").createServer((_, response) => response.end("self-test")).listen(Number(process.argv[1]), "127.0.0.1")', String(port)], { windowsHide: true, stdio: 'ignore' })
  await waitForVite(port, child)
  await stopTree(child, port)
  const diagnosticDirectory = join(base, 'diagnostics')
  mkdirSync(diagnosticDirectory, { recursive: true })
  const diagnosticContext = { directory: diagnosticDirectory, diagnosticKeys: new Set() }
  stageDiagnostic(diagnosticContext, 'snapshot', 1, new Error('snapshot inventory verification failed'))
  stageDiagnostic(diagnosticContext, 'snapshot', 1, new Error('same failure must not duplicate'))
  const diagnosticReport = JSON.parse(readFileSync(join(diagnosticDirectory, 'stage-diagnostics.json'), 'utf8'))
  if (diagnosticReport.length !== 1 || diagnosticReport[0].stage !== 'snapshot' || diagnosticReport[0].category !== 'snapshot-or-path-verification-failed') {
    fail('diagnostic file self-test failed')
  }
  console.log('Self-tests passed: secret scan, reparse-point policy, browser mapping, post-test inventory, process-tree cleanup, relative paths, suspicious files, symlinks, added/modified/deleted comparison, missing mandatory tests.')
}

async function main() {
  if (action === '--self-test') return selfTest()
  if (action === '--check') return cliCompatibility()
  if (!task) {
    console.log('Usage: node ai-team-v4.mjs [--dry-run] [--approve-local-edits] "task"')
    return
  }
  const runDirectory = mkdtempSync(join(stateRoot, 'run-'))
  let baseline
  try {
    baseline = createBaseline(task, runDirectory)
  } catch (error) {
    const context = { directory: runDirectory, diagnosticKeys: new Set() }
    stageDiagnostic(context, 'snapshot', 1, error)
    throw error
  }
  console.log(`Baseline: ${join(baseline.directory, 'baseline.json')}`)
  if (trial) return trialMode(baseline)
  if (dryRun) {
    console.log('DRY RUN: no paid AI calls, application edits, installs, or Git mutations.')
    return
  }
  let workspace
  try {
    workspace = createWorkspace(baseline).workspace
  } catch (error) {
    stageDiagnostic(baseline, 'workspace-creation', 1, error)
    throw error
  }
  const planData = plan(baseline)
  implement(workspace, planData, baseline)
  const files = changedFiles(baseline, workspace)
  if (!files.length) fail('Implementation produced no changes')
  validateChangedScope(files)
  const tests = await runTests(workspace, files, baseline)
  const finalFiles = changedFiles(baseline, workspace)
  validateChangedScope(finalFiles)
  if (JSON.stringify(finalFiles) !== JSON.stringify(files)) fail('Workspace changed after tests; review package would not match tested contents')
  const packageDirectory = createReviewPackage(baseline, workspace, finalFiles, tests)
  const gemini = reviewWithGemini(packageDirectory)
  if (!/^\s*PASS\b/i.test(gemini)) fail('Gemini did not return PASS')
  const approval = copilotApproval(packageDirectory, gemini, tests)
  if (!/^\s*APPROVE\b/i.test(approval)) fail('Copilot Auto did not return APPROVE')
  report(baseline, workspace, files, tests, gemini, approval, packageDirectory)
}

main().catch((error) => {
  console.error(error.message)
  process.exitCode = 1
})
