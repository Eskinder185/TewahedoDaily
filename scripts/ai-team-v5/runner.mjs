import { existsSync, mkdirSync, readFileSync, readdirSync, writeFileSync } from 'node:fs'
import { dirname, join, relative, resolve } from 'node:path'
import { assessResume, appendCheckpoint, readTask, withTaskLock } from './state.mjs'
import { budgetStatus, reserveAiCall, settleAiCall } from './budget.mjs'
import { runPreflight } from './preflight.mjs'
import { assertNoSecretContent, assertSafeEntry, hash, inventory, isInside, verifyWorkspace } from './workspace.mjs'

const PLAN_ESTIMATE = '0.010000'
const IMPLEMENT_ESTIMATE = '0.010000'

function fail(code) { throw new Error(code) }
function diagnostic(error) {
  const code = /^[A-Z][A-Z0-9_]{2,80}$/.test(error?.message ?? '') ? error.message : 'SIM_STAGE_FAILURE'
  return { category: code.includes('INTERRUPTED') ? 'interruption' : code.includes('OUTPUT') ? 'invalid_output'
    : code.includes('STALE') || code.includes('CHECKPOINT') ? 'stale_checkpoint' : 'stage_failure', code }
}

function verifyBase(manifest, stateRoot) {
  verifyWorkspace(manifest.repository, stateRoot, manifest.id, manifest.workspace, manifest.sourceInventoryHash)
}

function nextNumber(taskDirectory, directory, prefix, suffix, calls = []) {
  const root = join(taskDirectory, directory)
  if (!existsSync(root)) mkdirSync(root)
  if (!assertSafeEntry(root).isDirectory()) fail('SIM_ATTEMPT_PATH_INVALID')
  let maximum = 0
  for (const name of readdirSync(root)) {
    const match = name.match(new RegExp(`^${prefix}-(\\d+)${suffix.replace('.', '\\.')}$`))
    if (!match) fail('SIM_ATTEMPT_PATH_INVALID')
    maximum = Math.max(maximum, Number(match[1]))
  }
  for (const call of calls) {
    const match = call.callId.match(new RegExp(`^sim-${prefix}-(\\d+)$`))
    if (match) maximum = Math.max(maximum, Number(match[1]))
  }
  return maximum + 1
}

function planFrom(manifest) {
  return { version: 1, inputHash: manifest.inputHash, objectiveHash: hash(manifest.objective),
    allowedPaths: manifest.allowedPaths, action: 'append-simulated-marker' }
}

function validatePlan(value, manifest) {
  if (!value || typeof value !== 'object' || Array.isArray(value) ||
      JSON.stringify(value) !== JSON.stringify(planFrom(manifest))) fail('SIM_PLAN_OUTPUT_INVALID')
  if (value.allowedPaths.length !== 1 || !/\.[cm]?[jt]sx?$/.test(value.allowedPaths[0])) fail('SIM_SCOPE_INVALID')
  const source = inventory(manifest.workspace)
  if (!source.files.some((file) => file.path === value.allowedPaths[0])) fail('SIM_SCOPE_PATH_MISSING')
  return value
}

function fullFileList(root) {
  const files = []
  const walk = (directory) => {
    for (const name of readdirSync(directory)) {
      const path = join(directory, name)
      if (!isInside(root, path)) fail('SIM_WORKSPACE_ESCAPE')
      const entry = assertSafeEntry(path)
      if (entry.isDirectory()) walk(path)
      else files.push(relative(root, path).replaceAll('\\', '/'))
    }
  }
  walk(root)
  return files.sort()
}

function copyAttempt(snapshot, attempt, expected) {
  if (existsSync(attempt)) fail('SIM_ATTEMPT_EXISTS')
  mkdirSync(attempt)
  for (const file of expected.files) {
    const source = join(snapshot, file.path)
    const destination = join(attempt, file.path)
    if (!isInside(attempt, destination) || !assertSafeEntry(source).isFile()) fail('SIM_WORKSPACE_ESCAPE')
    const bytes = readFileSync(source)
    if (hash(bytes) !== file.hash) fail('SIM_SNAPSHOT_STALE')
    mkdirSync(dirname(destination), { recursive: true })
    writeFileSync(destination, bytes, { flag: 'wx' })
  }
  if (inventory(attempt).hash !== expected.hash ||
      JSON.stringify(fullFileList(attempt)) !== JSON.stringify(expected.files.map((file) => file.path).sort())) {
    fail('SIM_ATTEMPT_COPY_INVALID')
  }
}

function validateImplementation(attempt, before, allowedPath) {
  const after = inventory(attempt)
  const expectedFiles = before.files.map((file) => file.path).sort()
  if (JSON.stringify(fullFileList(attempt)) !== JSON.stringify(expectedFiles)) fail('SIM_OUTPUT_UNAUTHORIZED_PATH')
  if (JSON.stringify(after.files.map((file) => file.path)) !== JSON.stringify(before.files.map((file) => file.path))) {
    fail('SIM_OUTPUT_UNAUTHORIZED_PATH')
  }
  const changed = after.files.filter((file, index) => file.hash !== before.files[index].hash).map((file) => file.path)
  if (changed.length !== 1 || changed[0] !== allowedPath) fail('SIM_OUTPUT_OUT_OF_SCOPE')
  assertNoSecretContent(readFileSync(join(attempt, allowedPath)))
  return after.hash
}

function fakePlan(manifest) { return planFrom(manifest) }
function fakeImplement(attempt, allowedPath) {
  const path = join(attempt, allowedPath)
  writeFileSync(path, Buffer.concat([readFileSync(path), Buffer.from('\n// V5 simulated implementation\n')]))
}

function settlePendingFakeCalls(stateRoot, taskId) {
  for (const call of budgetStatus(stateRoot, taskId).calls) {
    if (call.status === 'unknown') fail('SIM_BUDGET_USAGE_UNKNOWN')
    if (call.status === 'pending' && !/^sim-(?:planning|implementation)-[1-9]\d*$/.test(call.callId)) {
      fail('SIM_BUDGET_USAGE_UNKNOWN')
    }
    if (call.status === 'pending') settleAiCall(stateRoot, taskId, {
      callId: call.callId, actualUsd: '0', reliable: true,
    })
  }
}

export function runSimulated(stateRoot, taskId, { planAgent = fakePlan, implementAgent = fakeImplement, faultAt = null, preflightProbe = undefined, preflightEnv = undefined, preflightNodeVersion = undefined } = {}) {
  try {
    let report = assessResume(stateRoot, taskId)
    if (report.overall !== 'reusable') fail('SIM_CHECKPOINT_STALE')
    const { manifest, paths } = readTask(stateRoot, taskId)
    if (report.lock?.status !== 'none') fail('SIM_TASK_LOCKED')
    if (!manifest.allowedPaths?.length) fail('SIM_SCOPE_REQUIRED')
    const preflight = runPreflight({ repository: manifest.repository, workspace: manifest.workspace,
      requiredEnvNames: manifest.requiredEnvNames ?? [], mode: 'simulated',
      ...(preflightProbe ? { probe: preflightProbe } : {}),
      ...(preflightEnv ? { env: preflightEnv } : {}),
      ...(preflightNodeVersion ? { nodeVersion: preflightNodeVersion } : {}) })
    if (preflight.overall !== 'ready') return { status: 'blocked', diagnostic: { category: 'preflight', code: 'SIM_PREFLIGHT_BLOCKED' }, preflight }
    verifyBase(manifest, stateRoot)
    settlePendingFakeCalls(stateRoot, taskId)
    report = assessResume(stateRoot, taskId)
    if (report.state === 'snapshotted') {
      const number = nextNumber(paths.taskDirectory, 'plans', 'planning', '.json', budgetStatus(stateRoot, taskId).calls)
      const callId = `sim-planning-${number}`
      reserveAiCall(stateRoot, taskId, { callId, agent: 'claude', estimatedUsd: PLAN_ESTIMATE })
      if (faultAt === 'planning-after-reservation') fail('SIM_PLANNING_INTERRUPTED')
      const output = validatePlan(planAgent(manifest), manifest)
      const planPath = join(paths.taskDirectory, 'plans', `planning-${number}.json`)
      const bytes = Buffer.from(`${JSON.stringify(output)}\n`)
      assertNoSecretContent(bytes)
      if (bytes.length > 16_384) fail('SIM_PLAN_OUTPUT_INVALID')
      writeFileSync(planPath, bytes, { flag: 'wx' })
      if (faultAt === 'planning-after-output') fail('SIM_PLANNING_INTERRUPTED')
      verifyBase(manifest, stateRoot)
      withTaskLock(paths.taskDirectory, () => appendCheckpoint(paths.taskDirectory, {
        from: 'snapshotted', to: 'planned', kind: 'planning-verified',
        inputHash: manifest.inputHash, workspaceHash: manifest.sourceInventoryHash,
        payload: { callId, inputHash: manifest.inputHash, outputHash: hash(bytes) },
        artifacts: { [`plans/planning-${number}.json`]: hash(bytes) },
      }))
      settleAiCall(stateRoot, taskId, { callId, actualUsd: '0', reliable: true })
    }
    report = assessResume(stateRoot, taskId)
    if (report.overall !== 'reusable') fail('SIM_CHECKPOINT_STALE')
    if (report.state === 'planned') {
      const planning = readTask(stateRoot, taskId).entries.findLast((entry) => entry.kind === 'planning-verified')
      if (!planning) fail('SIM_PLAN_CHECKPOINT_MISSING')
      const [planFile] = Object.keys(planning.detail.artifacts)
      const planPath = resolve(paths.taskDirectory, planFile)
      if (!isInside(join(paths.taskDirectory, 'plans'), planPath)) fail('SIM_PLAN_OUTPUT_INVALID')
      const planBytes = readFileSync(planPath)
      if (hash(planBytes) !== planning.detail.payload.outputHash) fail('SIM_PLAN_OUTPUT_STALE')
      const plan = validatePlan(JSON.parse(planBytes), manifest)
      const number = nextNumber(paths.taskDirectory, 'attempts', 'implementation', '', budgetStatus(stateRoot, taskId).calls)
      const callId = `sim-implementation-${number}`
      reserveAiCall(stateRoot, taskId, { callId, agent: 'codex', estimatedUsd: IMPLEMENT_ESTIMATE })
      if (faultAt === 'implementation-after-reservation') fail('SIM_IMPLEMENTATION_INTERRUPTED')
      verifyBase(manifest, stateRoot)
      const attempt = join(paths.taskDirectory, 'attempts', `implementation-${number}`)
      const before = inventory(paths.snapshot)
      copyAttempt(paths.snapshot, attempt, before)
      if (faultAt === 'implementation-after-copy') fail('SIM_IMPLEMENTATION_INTERRUPTED')
      implementAgent(attempt, plan.allowedPaths[0])
      if (faultAt === 'implementation-after-edit') fail('SIM_IMPLEMENTATION_INTERRUPTED')
      const outputHash = validateImplementation(attempt, before, plan.allowedPaths[0])
      verifyBase(manifest, stateRoot)
      withTaskLock(paths.taskDirectory, () => appendCheckpoint(paths.taskDirectory, {
        from: 'planned', to: 'implemented', kind: 'implementation-verified',
        inputHash: manifest.inputHash, workspaceHash: outputHash,
        payload: { callId, attempt, inputHash: before.hash, outputHash, changedPaths: [plan.allowedPaths[0]] },
      }))
      settleAiCall(stateRoot, taskId, { callId, actualUsd: '0', reliable: true })
    }
    const final = assessResume(stateRoot, taskId)
    return { status: final.overall === 'reusable' ? 'complete' : 'blocked', stage: final.state,
      diagnostic: final.overall === 'reusable' ? null : { category: 'stale_checkpoint', code: 'SIM_CHECKPOINT_STALE' },
      budget: budgetStatus(stateRoot, taskId), simulated: true, agentsExecuted: false }
  } catch (error) {
    return { status: 'blocked', diagnostic: diagnostic(error), simulated: true, agentsExecuted: false }
  }
}
