import { randomUUID } from 'node:crypto'
import { closeSync, existsSync, fsyncSync, lstatSync, mkdirSync, openSync, readFileSync, readdirSync, renameSync, unlinkSync, writeSync } from 'node:fs'
import { join, resolve } from 'node:path'
import { assertNoSecretContent, assertSafeEntry, assertSeparateStateRoot, hash, inventory, isInside, taskPaths, validateWorkspacePath, verifyWorkspace } from './workspace.mjs'

export const STATE_VERSION = 1
export const TRANSITIONS = Object.freeze({
  created: ['snapshotted'],
  snapshotted: ['planned'],
  planned: ['implemented'],
  implemented: ['testing'],
  testing: ['testing', 'tested'],
  tested: ['reviewed'],
  reviewed: ['awaiting_manual_approval'],
  awaiting_manual_approval: ['approval_recorded'],
  approval_recorded: [],
})
const STAGES = ['created', 'snapshotted', 'planned', 'implemented', 'testing', 'tested', 'reviewed', 'awaiting_manual_approval', 'approval_recorded']
const BUDGET_KINDS = new Set(['budget-reserved', 'budget-settled', 'budget-reconciled'])
const PROCESS_KINDS = new Set(['agent-process-started', 'agent-process-finished'])
const WORKFLOW_KINDS = new Set(['copilot-review-verified', 'workflow-report-blocked'])

function fail(code) {
  throw new Error(code)
}

function atomicJson(path, value) {
  const temporary = `${path}.${randomUUID()}.tmp`
  const bytes = Buffer.from(`${JSON.stringify(value)}\n`)
  let fd
  try {
    fd = openSync(temporary, 'wx')
    writeSync(fd, bytes)
    fsyncSync(fd)
    closeSync(fd)
    fd = undefined
    if (existsSync(path)) fail('ATOMIC_TARGET_EXISTS')
    renameSync(temporary, path)
  } finally {
    if (fd !== undefined) closeSync(fd)
    // A failed write leaves its temporary file for inspection; never repair automatically.
  }
  return hash(bytes)
}

function readJson(path) {
  if (!existsSync(path) || !assertSafeEntry(path).isFile()) fail('STATE_FILE_MISSING')
  try {
    return JSON.parse(readFileSync(path, 'utf8'))
  } catch {
    fail('STATE_JSON_CORRUPTED')
  }
}

function filesIn(directory) {
  if (!existsSync(directory) || !assertSafeEntry(directory).isDirectory()) fail('STATE_DIRECTORY_MISSING')
  return readdirSync(directory).sort()
}

function checksum(value) {
  const { hash: ignored, ...content } = value
  void ignored
  return hash(JSON.stringify(content))
}

function journalName(seq) {
  return `${String(seq).padStart(6, '0')}.json`
}

export function inspectLock(taskDirectory) {
  const path = join(taskDirectory, 'lock.json')
  if (!existsSync(path)) return { status: 'none' }
  let lock
  try {
    lock = readJson(path)
  } catch {
    return { status: 'corrupt' }
  }
  if (lock.version !== STATE_VERSION || !Number.isInteger(lock.pid) || lock.pid <= 0 || typeof lock.token !== 'string') {
    return { status: 'corrupt' }
  }
  try {
    process.kill(lock.pid, 0)
    return { status: 'active', pid: lock.pid, createdAt: lock.createdAt }
  } catch (error) {
    if (error?.code === 'ESRCH') return { status: 'stale', pid: lock.pid, createdAt: lock.createdAt }
    return { status: 'unknown', pid: lock.pid, createdAt: lock.createdAt }
  }
}

export function withTaskLock(taskDirectory, work) {
  const path = join(taskDirectory, 'lock.json')
  const token = randomUUID()
  let fd
  try {
    fd = openSync(path, 'wx')
  } catch (error) {
    if (error?.code === 'EEXIST') fail(`TASK_LOCK_${inspectLock(taskDirectory).status.toUpperCase()}`)
    throw error
  }
  try {
    writeSync(fd, Buffer.from(`${JSON.stringify({ version: STATE_VERSION, pid: process.pid, token, createdAt: new Date().toISOString() })}\n`))
    fsyncSync(fd)
  } finally {
    closeSync(fd)
  }
  try {
    return work()
  } finally {
    // Never remove another process's lock, even if the lock file was replaced.
    if (readJson(path).token !== token) fail('TASK_LOCK_CHANGED')
    unlinkSync(path)
  }
}

function inputHashFor(manifest, sourceInventoryHash) {
  const input = { objective: manifest.objective, sourceInventoryHash, version: STATE_VERSION }
  if (manifest.budget || manifest.requiredEnvNames) {
    input.budget = manifest.budget
    input.requiredEnvNames = manifest.requiredEnvNames
  }
  if (manifest.allowedPaths) input.allowedPaths = manifest.allowedPaths
  if (manifest.agentConfig) input.agentConfig = manifest.agentConfig
  return hash(JSON.stringify(input))
}

export function createTask(stateRoot, repository, objective, sourceInventory, options = {}) {
  if (typeof objective !== 'string' || !objective.trim() || objective.length > 4000) fail('INVALID_OBJECTIVE')
  assertNoSecretContent(objective)
  const budget = options.budget ?? { maxAiCalls: 0, maxEstimatedMicroUsd: 0 }
  const requiredEnvNames = options.requiredEnvNames ?? []
  const allowedPaths = options.allowedPaths ?? []
  const agentConfig = options.agentConfig ?? null
  if (!Number.isSafeInteger(budget.maxAiCalls) || budget.maxAiCalls < 0 ||
      !Number.isSafeInteger(budget.maxEstimatedMicroUsd) || budget.maxEstimatedMicroUsd < 0) fail('INVALID_BUDGET_LIMITS')
  if (!Array.isArray(requiredEnvNames) || requiredEnvNames.some((name) => typeof name !== 'string' || !/^[A-Z_][A-Z0-9_]*$/.test(name)) ||
      new Set(requiredEnvNames).size !== requiredEnvNames.length) fail('INVALID_ENV_NAMES')
  if (!Array.isArray(allowedPaths) || allowedPaths.some((path) => typeof path !== 'string' ||
      !/^(?:src|scripts|functions|backend|supabase|public|docs)\/[A-Za-z0-9_./-]+$/.test(path) ||
      path.split('/').some((part) => part === '.' || part === '..') || path.endsWith('/')) ||
      new Set(allowedPaths).size !== allowedPaths.length) fail('INVALID_ALLOWED_PATHS')
  if (agentConfig !== null && (typeof agentConfig !== 'object' || Array.isArray(agentConfig) ||
      !['claude', 'codex'].every((agent) => typeof agentConfig[agent]?.modelId === 'string' &&
        typeof agentConfig[agent]?.effort === 'string'))) fail('INVALID_AGENT_CONFIG')
  assertSeparateStateRoot(repository, stateRoot)
  if (sourceInventory.hash !== inventory(repository).hash) fail('SOURCE_INVENTORY_STALE')
  const root = resolve(stateRoot)
  mkdirSync(join(root, 'tasks'), { recursive: true })
  const id = randomUUID()
  const paths = taskPaths(root, id)
  mkdirSync(paths.taskDirectory)
  mkdirSync(join(paths.taskDirectory, 'journal'))
  mkdirSync(join(paths.taskDirectory, 'checkpoints'))
  const manifest = {
    version: STATE_VERSION,
    id,
    objective: objective.trim(),
    repository: resolve(repository),
    createdAt: new Date().toISOString(),
    sourceInventoryHash: sourceInventory.hash,
    budget,
    requiredEnvNames,
    allowedPaths,
    ...(agentConfig ? { agentConfig } : {}),
    snapshot: paths.snapshot,
    workspace: paths.workspace,
  }
  manifest.inputHash = inputHashFor(manifest, sourceInventory.hash)
  const manifestHash = atomicJson(join(paths.taskDirectory, 'manifest.json'), manifest)
  withTaskLock(paths.taskDirectory, () => {
    appendCheckpoint(paths.taskDirectory, {
      from: null, to: 'created', kind: 'task-created',
      inputHash: manifest.inputHash, workspaceHash: null,
      payload: { manifestHash },
    })
  })
  return manifest
}

export function appendCheckpoint(taskDirectory, { from, to, kind, inputHash, workspaceHash, payload = {}, artifacts = {} }) {
  const lock = inspectLock(taskDirectory)
  if (lock.status !== 'active' || lock.pid !== process.pid) fail('TASK_LOCK_REQUIRED')
  if (typeof kind !== 'string' || !/^[a-z0-9-]{1,60}$/.test(kind)) fail('INVALID_CHECKPOINT_KIND')
  const current = readJournal(taskDirectory)
  const previous = current.at(-1)
  if (previous ? previous.state !== from : from !== null || to !== 'created') fail('INVALID_TRANSITION_SOURCE')
  const sameStateEvent = (BUDGET_KINDS.has(kind) || PROCESS_KINDS.has(kind) || WORKFLOW_KINDS.has(kind)) && previous && from === to
  if (previous && !sameStateEvent && !TRANSITIONS[from]?.includes(to)) fail('INVALID_TRANSITION_TARGET')
  if (sameStateEvent && from === 'approval_recorded') fail('INVALID_BUDGET_STATE')
  if (!STAGES.includes(to)) fail('INVALID_STATE')
  if (typeof inputHash !== 'string' || !/^[a-f0-9]{64}$/.test(inputHash)) fail('INVALID_INPUT_HASH')
  if (workspaceHash !== null && !/^[a-f0-9]{64}$/.test(workspaceHash)) fail('INVALID_WORKSPACE_HASH')
  if (!artifacts || typeof artifacts !== 'object' || Array.isArray(artifacts)) fail('INVALID_ARTIFACTS')
  for (const [name, value] of Object.entries(artifacts)) {
    const path = resolve(taskDirectory, name)
    if (!isInside(taskDirectory, path) || path === taskDirectory || !/^[a-f0-9]{64}$/.test(value)) fail('INVALID_ARTIFACT_PATH_OR_HASH')
  }
  const seq = current.length + 1
  const checkpoint = {
    version: STATE_VERSION, seq, from, to, kind,
    inputHash, workspaceHash, previousHash: previous?.hash ?? null,
    artifacts, payload, createdAt: new Date().toISOString(),
  }
  const checkpointName = journalName(seq)
  const checkpointHash = atomicJson(join(taskDirectory, 'checkpoints', checkpointName), checkpoint)
  const entry = {
    version: STATE_VERSION, seq, state: to, kind,
    checkpoint: checkpointName, checkpointHash,
    previousHash: previous?.hash ?? null,
    createdAt: checkpoint.createdAt,
  }
  entry.hash = checksum(entry)
  atomicJson(join(taskDirectory, 'journal', journalName(seq)), entry)
  return entry
}

export function readJournal(taskDirectory) {
  const journalDir = join(taskDirectory, 'journal')
  const checkpointDir = join(taskDirectory, 'checkpoints')
  const names = filesIn(journalDir)
  const checkpoints = filesIn(checkpointDir)
  if (names.length !== checkpoints.length) fail('CHECKPOINT_JOURNAL_MISMATCH')
  const entries = []
  for (let index = 0; index < names.length; index += 1) {
    const expected = journalName(index + 1)
    if (names[index] !== expected || checkpoints[index] !== expected) fail('JOURNAL_SEQUENCE_CORRUPTED')
    const entry = readJson(join(journalDir, expected))
    const checkpointPath = join(checkpointDir, expected)
    const checkpoint = readJson(checkpointPath)
    const checkpointBytes = readFileSync(checkpointPath)
    if (entry.version !== STATE_VERSION || checkpoint.version !== STATE_VERSION || entry.seq !== index + 1 || checkpoint.seq !== entry.seq) fail('CHECKPOINT_VERSION_OR_SEQUENCE')
    if (entry.hash !== checksum(entry) || entry.checkpointHash !== hash(checkpointBytes)) fail('CHECKPOINT_INTEGRITY')
    if (entry.checkpoint !== expected || checkpoint.to !== entry.state || checkpoint.kind !== entry.kind) fail('CHECKPOINT_IDENTITY')
    if (entry.previousHash !== (entries.at(-1)?.hash ?? null) || checkpoint.previousHash !== entry.previousHash) fail('JOURNAL_CHAIN_CORRUPTED')
    if (index === 0) {
      if (checkpoint.from !== null || checkpoint.to !== 'created') fail('INVALID_INITIAL_STATE')
    } else if (checkpoint.from !== entries.at(-1).state ||
      !((BUDGET_KINDS.has(checkpoint.kind) || PROCESS_KINDS.has(checkpoint.kind) || WORKFLOW_KINDS.has(checkpoint.kind)) && checkpoint.to === checkpoint.from) &&
      !TRANSITIONS[checkpoint.from]?.includes(checkpoint.to)) {
      fail('INVALID_JOURNAL_TRANSITION')
    }
    entries.push({ ...entry, detail: checkpoint })
  }
  return entries
}

export function readTask(stateRoot, taskId) {
  const paths = taskPaths(stateRoot, taskId)
  if (!existsSync(paths.taskDirectory) || !assertSafeEntry(paths.taskDirectory).isDirectory()) fail('TASK_MISSING')
  const manifestPath = join(paths.taskDirectory, 'manifest.json')
  const manifest = readJson(manifestPath)
  const entries = readJournal(paths.taskDirectory)
  if (!entries.length || manifest.version !== STATE_VERSION || manifest.id !== taskId) fail('TASK_IDENTITY_CORRUPTED')
  if (entries[0].detail.payload.manifestHash !== hash(readFileSync(manifestPath))) fail('MANIFEST_INTEGRITY')
  if (manifest.snapshot !== paths.snapshot || manifest.workspace !== paths.workspace) fail('WORKSPACE_IDENTITY_CORRUPTED')
  if (entries.some((entry) => entry.detail.inputHash !== manifest.inputHash)) fail('TASK_INPUT_CHAIN_CORRUPTED')
  return { manifest, entries, paths }
}

function artifactState(taskDirectory, entry) {
  const artifacts = entry.detail.artifacts
  if (!artifacts || typeof artifacts !== 'object' || Array.isArray(artifacts)) return 'corrupted'
  for (const [name, expectedHash] of Object.entries(artifacts)) {
    const path = resolve(taskDirectory, name)
    if (!isInside(taskDirectory, path) || path === taskDirectory || !/^[a-f0-9]{64}$/.test(expectedHash)) return 'corrupted'
    let cursor = path
    while (isInside(taskDirectory, cursor)) {
      if (existsSync(cursor)) assertSafeEntry(cursor)
      if (cursor === taskDirectory) break
      cursor = resolve(cursor, '..')
    }
    if (!existsSync(path) || !assertSafeEntry(path).isFile()) return 'missing'
    if (hash(readFileSync(path)) !== expectedHash) return 'stale'
  }
  return 'reusable'
}

export function assessResume(stateRoot, taskId, { checkLiveInputs = true } = {}) {
  let task
  try {
    task = readTask(stateRoot, taskId)
  } catch (error) {
    return { taskId, overall: 'corrupted', reason: error.message, checkpoints: [] }
  }
  const { manifest, entries, paths } = task
  const lock = inspectLock(paths.taskDirectory)
  const checkpoints = []
  let downstream = 'reusable'
  for (const entry of entries) {
    let status = downstream
    if (downstream === 'reusable') {
      try {
        status = artifactState(paths.taskDirectory, entry)
      } catch {
        status = 'corrupted'
      }
    }
    if (status !== 'reusable') downstream = status
    checkpoints.push({ seq: entry.seq, state: entry.state, kind: entry.kind, status })
  }
  if (checkLiveInputs && downstream === 'reusable') {
    try {
      const current = inventory(manifest.repository)
      const currentInputHash = inputHashFor(manifest, current.hash)
      if (currentInputHash !== manifest.inputHash) downstream = 'stale'
      else if (entries.length > 1) {
        verifyWorkspace(manifest.repository, stateRoot, taskId, manifest.workspace, manifest.sourceInventoryHash)
        validateWorkspacePath(stateRoot, taskId, manifest.workspace)
        for (const entry of entries.filter((item) => item.kind === 'implementation-verified')) {
          const attempt = entry.detail.payload?.attempt
          const attemptsRoot = join(paths.taskDirectory, 'attempts')
          if (!existsSync(attemptsRoot) || !assertSafeEntry(attemptsRoot).isDirectory() ||
              typeof attempt !== 'string' || !/^implementation-[1-9]\d*$/.test(attempt.split(/[\\/]/).at(-1)) ||
              resolve(attempt, '..') !== resolve(attemptsRoot) || !isInside(attemptsRoot, attempt) ||
              !existsSync(attempt) ||
              !assertSafeEntry(attempt).isDirectory()) throw new Error('IMPLEMENTATION_ATTEMPT_INVALID')
          if (inventory(attempt).hash !== entry.detail.workspaceHash) throw new Error('IMPLEMENTATION_ATTEMPT_CHANGED')
        }
      }
    } catch (error) {
      if (/SNAPSHOT_MISSING|WORKSPACE_MISSING/.test(error.message)) downstream = 'missing'
      else downstream = /SNAPSHOT_CHANGED|UNSAFE|JUNCTION|PATH|ALIAS|ATTEMPT_INVALID/.test(error.message) ? 'corrupted' : 'stale'
    }
    if (downstream !== 'reusable') {
      for (const checkpoint of checkpoints) checkpoint.status = downstream
    }
  }
  const reached = new Set(entries.map((entry) => entry.state))
  for (const state of STAGES) {
    if (!reached.has(state)) checkpoints.push({ state, status: 'missing' })
  }
  return {
    taskId,
    state: entries.at(-1).state,
    overall: downstream,
    lock,
    repository: manifest.repository,
    workspace: manifest.workspace,
    checkpoints,
    next: downstream === 'reusable' ? STAGES.find((stage) => !reached.has(stage)) ?? null : null,
  }
}
