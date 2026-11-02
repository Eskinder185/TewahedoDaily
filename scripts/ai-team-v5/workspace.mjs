import { createHash } from 'node:crypto'
import { existsSync, lstatSync, mkdirSync, readFileSync, readdirSync, realpathSync, statSync, writeFileSync } from 'node:fs'
import { dirname, join, relative, resolve, sep } from 'node:path'

const allowedRoots = new Set(['src', 'scripts', 'functions', 'backend', 'supabase', 'public', 'docs'])
const allowedFiles = /^(package\.json|package-lock\.json|index\.html|vite\.config\.[cm]?[jt]s|eslint\.config\.[cm]?[jt]s|playwright\.config\.[cm]?[jt]s|tsconfig(?:\.[^.]+)?\.json)$/
const generatedDirectory = /^(?:node_modules|dist|build|coverage|artifacts|test-results|tmp|reports|audit|backup|scratch|research|migration-reports|archive|\.git|\.serena|\.vscode|\.wrangler)$/i
const sensitiveName = /(^|[._-])(?:credentials?|secrets?|passwords?|private[-_]?keys?|service[-_]?role)(?:[._-]|$)/i
const sensitiveSuffix = /\.(?:pem|key|p12|pfx|crt|cer|jks|secret)$/i
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

export function hash(value) {
  return createHash('sha256').update(value).digest('hex')
}

function comparable(path) {
  const result = resolve(path)
  return process.platform === 'win32' ? result.toLowerCase() : result
}

export function isInside(base, candidate) {
  const parent = comparable(base)
  const child = comparable(candidate)
  return child === parent || child.startsWith(`${parent}${sep}`)
}

export function assertSeparateStateRoot(repository, stateRoot) {
  if (isInside(repository, stateRoot) || isInside(stateRoot, repository)) {
    throw new Error('STATE_ROOT_OVERLAP')
  }
  if (existsSync(repository) && comparable(realpathSync(repository)) !== comparable(repository)) {
    throw new Error('REPOSITORY_ALIAS')
  }
  if (existsSync(stateRoot) && comparable(realpathSync(stateRoot)) !== comparable(stateRoot)) {
    throw new Error('STATE_ROOT_ALIAS')
  }
  for (const target of [repository, stateRoot]) {
    let cursor = resolve(target)
    while (true) {
      if (existsSync(cursor)) assertSafeEntry(cursor)
      const parent = dirname(cursor)
      if (parent === cursor) break
      cursor = parent
    }
  }
}

export function assertSafeEntry(path) {
  const entry = lstatSync(path)
  return rejectUnsafeEntry(entry)
}

export function rejectUnsafeEntry(entry) {
  if (entry.isSymbolicLink() || entry.reparsePoint === true) throw new Error('UNSAFE_LINK_OR_JUNCTION')
  if (!entry.isDirectory() && !entry.isFile()) throw new Error('UNSAFE_ENTRY_TYPE')
  return entry
}

function classify(path, directory) {
  const parts = path.split('/')
  const name = parts.at(-1)
  if (!allowedRoots.has(parts[0]) && !(parts.length === 1 && allowedFiles.test(path))) return 'ignore'
  if (directory && (generatedDirectory.test(name) || name.startsWith('.'))) return 'ignore'
  if (!directory && (/^\.env(?:\..*)?$/i.test(name) || /^\.dev\.vars(?:\..*)?$/i.test(name) || name === '.npmrc')) return 'ignore'
  if (!directory && (sensitiveName.test(name) || sensitiveSuffix.test(name))) throw new Error('SENSITIVE_FILE_NAME')
  return 'include'
}

export function assertNoSecretContent(bytes) {
  const content = Buffer.isBuffer(bytes) ? bytes.toString('utf8') : String(bytes)
  for (const pattern of secretPatterns) {
    const match = content.match(pattern)
    if (match && !/(?:test|example|placeholder|dummy|wrong)/i.test(match[0])) {
      throw new Error('SENSITIVE_FILE_CONTENT')
    }
  }
}

export function inventory(root) {
  const base = resolve(root)
  if (!existsSync(base) || !assertSafeEntry(base).isDirectory()) throw new Error('REPOSITORY_MISSING')
  const files = []
  const walk = (directory) => {
    for (const item of readdirSync(directory, { withFileTypes: true })) {
      const absolute = join(directory, item.name)
      if (!isInside(base, absolute)) throw new Error('PATH_ESCAPE')
      const info = assertSafeEntry(absolute)
      const path = relative(base, absolute).replaceAll('\\', '/')
      if (classify(path, info.isDirectory()) === 'ignore') continue
      if (info.isDirectory()) walk(absolute)
      else {
        const bytes = readFileSync(absolute)
        assertNoSecretContent(bytes)
        files.push({ path, hash: hash(bytes), bytes: statSync(absolute).size })
      }
    }
  }
  walk(base)
  files.sort((a, b) => (a.path < b.path ? -1 : a.path > b.path ? 1 : 0))
  return { files, hash: hash(JSON.stringify(files)) }
}

export function taskPaths(stateRoot, taskId) {
  if (!/^[0-9a-f]{8}-[0-9a-f]{4}-4[0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$/i.test(taskId)) {
    throw new Error('INVALID_TASK_ID')
  }
  const taskDirectory = join(resolve(stateRoot), 'tasks', taskId)
  return {
    taskDirectory,
    snapshot: join(taskDirectory, 'baseline-snapshot'),
    workspace: join(taskDirectory, 'workspace'),
  }
}

export function validateWorkspacePath(stateRoot, taskId, workspace) {
  const expected = taskPaths(stateRoot, taskId).workspace
  if (comparable(workspace) !== comparable(expected)) throw new Error('WORKSPACE_PATH_MISMATCH')
  if (!existsSync(expected) || !assertSafeEntry(expected).isDirectory()) throw new Error('WORKSPACE_MISSING')
  const root = resolve(stateRoot)
  for (const path of [root, join(root, 'tasks'), taskPaths(root, taskId).taskDirectory]) {
    if (!existsSync(path) || !assertSafeEntry(path).isDirectory()) throw new Error('UNSAFE_STATE_PATH')
  }
  return expected
}

function copyInventory(source, destination, expected) {
  if (existsSync(destination)) throw new Error('DESTINATION_EXISTS')
  mkdirSync(destination)
  for (const file of expected.files) {
    const from = join(source, file.path)
    const to = join(destination, file.path)
    if (!isInside(destination, to)) throw new Error('PATH_ESCAPE')
    if (!assertSafeEntry(from).isFile()) throw new Error('SOURCE_ENTRY_CHANGED')
    const bytes = readFileSync(from)
    if (hash(bytes) !== file.hash) throw new Error('SOURCE_CHANGED_DURING_COPY')
    mkdirSync(dirname(to), { recursive: true })
    let cursor = dirname(to)
    while (isInside(destination, cursor)) {
      assertSafeEntry(cursor)
      if (cursor === destination) break
      cursor = dirname(cursor)
    }
    writeFileSync(to, bytes, { flag: 'wx' })
  }
  if (inventory(destination).hash !== expected.hash) throw new Error('SNAPSHOT_VERIFICATION_FAILED')
}

export function createVerifiedWorkspace(repository, stateRoot, taskId, expected) {
  assertSeparateStateRoot(repository, stateRoot)
  const paths = taskPaths(stateRoot, taskId)
  if (!existsSync(paths.taskDirectory) || !assertSafeEntry(paths.taskDirectory).isDirectory()) {
    throw new Error('TASK_DIRECTORY_MISSING')
  }
  if (inventory(repository).hash !== expected.hash) throw new Error('ROOT_CHANGED_BEFORE_COPY')
  copyInventory(repository, paths.snapshot, expected)
  copyInventory(paths.snapshot, paths.workspace, expected)
  if (inventory(repository).hash !== expected.hash) throw new Error('ROOT_CHANGED_DURING_COPY')
  validateWorkspacePath(stateRoot, taskId, paths.workspace)
  return { ...paths, inventoryHash: expected.hash }
}

export function verifyWorkspace(repository, stateRoot, taskId, recordedWorkspace, expectedHash) {
  assertSeparateStateRoot(repository, stateRoot)
  const paths = taskPaths(stateRoot, taskId)
  validateWorkspacePath(stateRoot, taskId, recordedWorkspace)
  if (!existsSync(paths.snapshot) || !assertSafeEntry(paths.snapshot).isDirectory()) {
    throw new Error('SNAPSHOT_MISSING')
  }
  if (inventory(paths.snapshot).hash !== expectedHash) throw new Error('SNAPSHOT_CHANGED')
  if (inventory(paths.workspace).hash !== expectedHash) throw new Error('WORKSPACE_CHANGED')
  return true
}
