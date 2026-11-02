import { existsSync, mkdirSync, readFileSync, realpathSync, writeFileSync } from 'node:fs'
import { dirname, isAbsolute, join, resolve } from 'node:path'
import { appendCheckpoint, assessResume, readTask, withTaskLock } from './state.mjs'
import { budgetStatus, settleAiCall } from './budget.mjs'
import { assertNoSecretContent, assertSafeEntry, hash, inventory, isInside, verifyWorkspace } from './workspace.mjs'

const STAGE = { claude: 'snapshotted', codex: 'planned', gemini: 'tested', copilot: 'reviewed' }
const MAX_CONTEXT_BYTES = 65_536
const MAX_PLAN_BYTES = 16_384

function fail(code) { throw new Error(code) }
function exactKeys(value, keys) {
  return value && typeof value === 'object' && !Array.isArray(value) &&
    JSON.stringify(Object.keys(value).sort()) === JSON.stringify([...keys].sort())
}

export function validateAgentConfig(config) {
  if (!exactKeys(config, ['claude', 'codex'])) fail('AGENT_CONFIG_INVALID')
  for (const agent of ['claude', 'codex']) {
    const entry = config[agent]
    if (!exactKeys(entry, ['modelId', 'effort']) ||
        !/^[A-Za-z0-9][A-Za-z0-9._-]{2,99}$/.test(entry.modelId) ||
        !/^(?:low|medium|high|max|xhigh)$/.test(entry.effort)) fail('AGENT_CONFIG_INVALID')
  }
  return config
}

// The default never probes a real CLI or authentication service in this phase.
export function assessAgentCapabilities(config, probe = null) {
  validateAgentConfig(config)
  const checks = []
  for (const agent of ['claude', 'codex']) {
    let capability = null
    if (probe) {
      try { capability = probe(agent, { ...config[agent] }) } catch { capability = null }
    }
    const exact = capability?.modelId === config[agent].modelId && capability?.effort === config[agent].effort
    const ready = capability?.available === true && capability?.authenticated === true && exact &&
      capability?.modelAvailable === true && capability?.effortSupported === true
    const code = !capability ? 'AGENT_CAPABILITY_UNVERIFIED'
      : capability.authenticated !== true ? 'AGENT_AUTH_UNVERIFIED'
        : capability.available !== true ? 'AGENT_CLI_UNAVAILABLE'
          : !exact || capability.modelAvailable !== true ? 'AGENT_MODEL_UNAVAILABLE'
            : capability.effortSupported !== true ? 'AGENT_EFFORT_UNSUPPORTED' : 'AGENT_CAPABILITY_READY'
    checks.push({ agent, status: ready ? 'ready' : 'blocked', code })
  }
  return { overall: checks.every((item) => item.status === 'ready') ? 'ready' : 'blocked', checks,
    agentsExecuted: false }
}

function verifiedTask(stateRoot, taskId) {
  const resume = assessResume(stateRoot, taskId)
  if (resume.overall !== 'reusable' || resume.lock?.status !== 'none') fail('AGENT_CHECKPOINT_STALE')
  const task = readTask(stateRoot, taskId)
  verifyWorkspace(task.manifest.repository, stateRoot, taskId, task.manifest.workspace, task.manifest.sourceInventoryHash)
  return task
}

export function prepareClaudePlanning(stateRoot, taskId, config, paths) {
  validateAgentConfig(config)
  const { manifest } = verifiedTask(stateRoot, taskId)
  if (manifest.agentConfig && JSON.stringify(manifest.agentConfig) !== JSON.stringify(config)) fail('AGENT_CONFIG_MISMATCH')
  if (!Array.isArray(paths) || !paths.length || paths.length > 20 ||
      paths.some((path) => !manifest.allowedPaths?.includes(path))) fail('AGENT_CONTEXT_SCOPE_INVALID')
  const files = []
  let bytes = 0
  const snapshotInventory = inventory(manifest.snapshot)
  for (const path of paths) {
    const expected = snapshotInventory.files.find((file) => file.path === path)
    if (!expected) fail('AGENT_CONTEXT_PATH_MISSING')
    const absolute = resolve(manifest.snapshot, path)
    if (!isInside(manifest.snapshot, absolute) || !assertSafeEntry(absolute).isFile()) fail('AGENT_CONTEXT_PATH_INVALID')
    const content = readFileSync(absolute)
    if (hash(content) !== expected.hash) fail('AGENT_CONTEXT_STALE')
    bytes += content.length
    if (bytes > MAX_CONTEXT_BYTES) fail('AGENT_CONTEXT_TOO_LARGE')
    assertNoSecretContent(content)
    files.push({ path, content: content.toString('utf8'), hash: expected.hash })
  }
  return { agent: 'claude', stage: 'planning', snapshot: manifest.snapshot, writeRoot: null,
    modelId: config.claude.modelId, effort: config.claude.effort,
    inputHash: manifest.inputHash, objectiveHash: hash(manifest.objective), objective: manifest.objective, files }
}

export function validateClaudePlan(plan, manifest, config) {
  validateAgentConfig(config)
  if (!exactKeys(plan, ['version', 'inputHash', 'objectiveHash', 'modelId', 'effort', 'allowedPaths', 'steps']) ||
      plan.version !== 1 || plan.inputHash !== manifest.inputHash ||
      plan.objectiveHash !== hash(manifest.objective) || plan.modelId !== config.claude.modelId ||
      plan.effort !== config.claude.effort || !Array.isArray(plan.allowedPaths) ||
      JSON.stringify(plan.allowedPaths) !== JSON.stringify(manifest.allowedPaths) ||
      !Array.isArray(plan.steps) || plan.steps.length < 1 || plan.steps.length > 12 ||
      plan.steps.some((step) => !exactKeys(step, ['path', 'action']) ||
        !manifest.allowedPaths.includes(step.path) || typeof step.action !== 'string' ||
        step.action.length < 1 || step.action.length > 300)) fail('AGENT_PLAN_INVALID')
  const bytes = Buffer.from(JSON.stringify(plan))
  if (bytes.length > MAX_PLAN_BYTES) fail('AGENT_PLAN_TOO_LARGE')
  assertNoSecretContent(bytes)
  return { planHash: hash(bytes), plan }
}

export function recordValidatedClaudePlan(stateRoot, taskId, { attemptId, plan, config }) {
  validateAgentConfig(config)
  const { manifest, paths, entries } = verifiedTask(stateRoot, taskId)
  if (!manifest.agentConfig || JSON.stringify(manifest.agentConfig) !== JSON.stringify(config)) fail('AGENT_CONFIG_MISMATCH')
  const { planHash } = validateClaudePlan(plan, manifest, config)
  const completed = entries.findLast((entry) => entry.kind === 'claude-plan-verified')
  if (completed) {
    if (completed.detail.payload.attemptId !== attemptId || completed.detail.payload.outputHash !== planHash) fail('AGENT_PLAN_CONFLICT')
    return { status: 'duplicate', planHash, attemptId }
  }
  if (entries.at(-1).state !== 'snapshotted') fail('AGENT_STAGE_MISMATCH')
  const process = records(entries).get(attemptId)
  if (!process || process.agent !== 'claude' || process.status !== 'succeeded' || process.outputHash !== planHash) {
    fail('AGENT_PLAN_PROCESS_UNVERIFIED')
  }
  const usage = budgetStatus(stateRoot, taskId).calls.find((call) => call.callId === process.callId)
  if (!usage || usage.status !== 'settled') fail('AGENT_BUDGET_USAGE_UNRECONCILED')
  const directory = join(paths.taskDirectory, 'plans')
  if (!existsSync(directory)) mkdirSync(directory)
  if (!assertSafeEntry(directory).isDirectory()) fail('AGENT_PLAN_PATH_INVALID')
  const name = `real-${attemptId}.json`
  const bytes = Buffer.from(JSON.stringify(plan))
  const path = join(directory, name)
  writeFileSync(path, bytes, { flag: 'wx' })
  withTaskLock(paths.taskDirectory, () => appendCheckpoint(paths.taskDirectory, {
    from: 'snapshotted', to: 'planned', kind: 'claude-plan-verified',
    inputHash: manifest.inputHash, workspaceHash: manifest.sourceInventoryHash,
    payload: { attemptId, inputHash: manifest.inputHash, outputHash: planHash },
    artifacts: { [`plans/${name}`]: planHash },
  }))
  return { status: 'planned', planHash, attemptId }
}

export function prepareCodexImplementation(stateRoot, taskId, config, plan, attemptPath) {
  const { manifest, paths, entries } = verifiedTask(stateRoot, taskId)
  if (manifest.agentConfig && JSON.stringify(manifest.agentConfig) !== JSON.stringify(config)) fail('AGENT_CONFIG_MISMATCH')
  const validated = validateClaudePlan(plan, manifest, config)
  if (entries.at(-1).state !== 'planned') fail('AGENT_PLAN_CHECKPOINT_MISSING')
  const checkpoint = entries.findLast((entry) => entry.kind === 'claude-plan-verified')
  if (!checkpoint || checkpoint.detail.payload.outputHash !== validated.planHash) fail('AGENT_PLAN_CHECKPOINT_MISSING')
  const attemptsRoot = join(paths.taskDirectory, 'attempts')
  if (!isAbsolute(attemptPath) || !existsSync(attemptsRoot) || !assertSafeEntry(attemptsRoot).isDirectory() ||
      resolve(attemptPath, '..') !== resolve(attemptsRoot) ||
      !/^implementation-[1-9]\d*$/.test(attemptPath.split(/[\\/]/).at(-1)) ||
      !existsSync(attemptPath) || !assertSafeEntry(attemptPath).isDirectory() ||
      inventory(attemptPath).hash !== manifest.sourceInventoryHash) fail('AGENT_WORKSPACE_STALE')
  return { agent: 'codex', stage: 'implementation', modelId: config.codex.modelId,
    effort: config.codex.effort, cwd: attemptPath, writeRoot: attemptPath,
    inputHash: manifest.inputHash, planHash: validated.planHash,
    allowedPaths: [...manifest.allowedPaths], plan: validated.plan }
}

export function buildAgentProcessSpec(prepared, entrypoint, capability, timeoutMs) {
  if (!prepared || !['claude', 'codex'].includes(prepared.agent) ||
      !capability || capability.available !== true || capability.authenticated !== true ||
      capability.modelAvailable !== true || capability.effortSupported !== true ||
      capability.modelId !== prepared.modelId || capability.effort !== prepared.effort) fail('AGENT_CAPABILITY_UNVERIFIED')
  if (typeof entrypoint !== 'string' || !/\.js$/i.test(entrypoint) ||
      resolve(entrypoint) !== entrypoint || !existsSync(entrypoint) ||
      realpathSync(entrypoint) !== entrypoint || !assertSafeEntry(entrypoint).isFile()) fail('AGENT_ENTRYPOINT_INVALID')
  let cursor = dirname(entrypoint)
  while (dirname(cursor) !== cursor) {
    if (!assertSafeEntry(cursor).isDirectory()) fail('AGENT_ENTRYPOINT_INVALID')
    cursor = dirname(cursor)
  }
  const args = prepared.agent === 'claude'
    ? [entrypoint, '-p', '--model', prepared.modelId, '--effort', prepared.effort, '--tools', '']
    : [entrypoint, 'exec', '-m', prepared.modelId, '-c', `model_reasoning_effort="${prepared.effort}"`,
      '--sandbox', 'workspace-write', '-C', prepared.cwd, '-']
  const stdin = prepared.agent === 'claude'
    ? JSON.stringify({ inputHash: prepared.inputHash, objectiveHash: prepared.objectiveHash,
      objective: prepared.objective, files: prepared.files })
    : JSON.stringify({ inputHash: prepared.inputHash, planHash: prepared.planHash,
      allowedPaths: prepared.allowedPaths, plan: prepared.plan })
  return { agent: prepared.agent, executable: process.execPath, args,
    modelId: prepared.modelId, effort: prepared.effort,
    cwd: prepared.agent === 'claude' ? prepared.snapshot : prepared.cwd,
    snapshot: prepared.agent === 'claude' ? prepared.snapshot : null,
    writeRoot: prepared.writeRoot, stdin, env: {}, timeoutMs }
}

function records(entries) {
  const attempts = new Map()
  for (const entry of entries) {
    const { kind, payload } = entry.detail
    if (kind === 'agent-process-started') {
      if (attempts.has(payload.attemptId)) fail('AGENT_PROCESS_JOURNAL_INVALID')
      attempts.set(payload.attemptId, { ...payload, status: 'uncertain' })
    } else if (kind === 'agent-process-finished') {
      const attempt = attempts.get(payload.attemptId)
      if (!attempt || attempt.status !== 'uncertain') fail('AGENT_PROCESS_JOURNAL_INVALID')
      attempt.status = payload.status
      attempt.code = payload.code
      attempt.outputHash = payload.outputHash
    }
  }
  return attempts
}

export function agentProcessStatus(stateRoot, taskId) {
  const { entries } = readTask(stateRoot, taskId)
  return [...records(entries).values()].map(({ attemptId, agent, callId, status, code, inputHash, outputHash }) =>
    ({ attemptId, agent, callId, status, code: code ?? 'AGENT_OUTCOME_UNCERTAIN', inputHash, outputHash: outputHash ?? null }))
}

export function recordAgentProcessStart(stateRoot, taskId, { attemptId, agent, callId, inputHash }) {
  if (!/^[a-z][a-z0-9-]{2,80}$/.test(attemptId) || !Object.hasOwn(STAGE, agent) ||
      !/^[a-z][a-z0-9-]{2,80}$/.test(callId) || !/^[a-f0-9]{64}$/.test(inputHash)) fail('AGENT_PROCESS_RECORD_INVALID')
  const { manifest, paths } = verifiedTask(stateRoot, taskId)
  if (manifest.inputHash !== inputHash) fail('AGENT_CHECKPOINT_STALE')
  const existing = records(readTask(stateRoot, taskId).entries).get(attemptId)
  if (existing) {
    if (existing.agent !== agent || existing.callId !== callId || existing.inputHash !== inputHash) fail('AGENT_ATTEMPT_CONFLICT')
    return { status: 'duplicate', code: 'AGENT_ATTEMPT_REUSED', attemptId }
  }
  const call = budgetStatus(stateRoot, taskId).calls.find((item) => item.callId === callId)
  if (!call || call.agent !== agent || call.status !== 'pending') fail('AGENT_BUDGET_RESERVATION_REQUIRED')
  const state = readTask(stateRoot, taskId).entries.at(-1).state
  if (state !== STAGE[agent]) fail('AGENT_STAGE_MISMATCH')
  withTaskLock(paths.taskDirectory, () => appendCheckpoint(paths.taskDirectory, {
    from: state, to: state, kind: 'agent-process-started', inputHash,
    workspaceHash: manifest.sourceInventoryHash,
    payload: { attemptId, agent, callId, inputHash,
      modelId: manifest.agentConfig?.[agent]?.modelId ?? null,
      effort: manifest.agentConfig?.[agent]?.effort ?? null },
  }))
  return { status: 'started', code: 'AGENT_ATTEMPT_STARTED', attemptId }
}

export function recordAgentProcessFinish(stateRoot, taskId, { attemptId, status, code, outputHash = null, actualUsd = null }) {
  if (!/^[a-z][a-z0-9-]{2,80}$/.test(attemptId) ||
      !['succeeded', 'failed', 'timed_out', 'cancelled'].includes(status) ||
      !/^AGENT_[A-Z0-9_]{2,80}$/.test(code) ||
      (outputHash !== null && !/^[a-f0-9]{64}$/.test(outputHash))) fail('AGENT_PROCESS_RECORD_INVALID')
  const { manifest, paths } = verifiedTask(stateRoot, taskId)
  const attempt = records(readTask(stateRoot, taskId).entries).get(attemptId)
  if (!attempt) fail('AGENT_ATTEMPT_MISSING')
  if (attempt.status !== 'uncertain') {
    if (attempt.status !== status || attempt.code !== code || attempt.outputHash !== outputHash) fail('AGENT_ATTEMPT_CONFLICT')
  } else {
    const state = readTask(stateRoot, taskId).entries.at(-1).state
    withTaskLock(paths.taskDirectory, () => appendCheckpoint(paths.taskDirectory, {
      from: state, to: state, kind: 'agent-process-finished', inputHash: manifest.inputHash,
      workspaceHash: manifest.sourceInventoryHash,
      payload: { attemptId, status, code, outputHash },
    }))
  }
  settleAiCall(stateRoot, taskId, { callId: attempt.callId, reliable: actualUsd !== null, actualUsd })
  return { status: attempt.status === 'uncertain' ? 'recorded' : 'duplicate', code: 'AGENT_OUTCOME_RECORDED', attemptId }
}

export function runRealAgent() { fail('REAL_AGENTS_DISABLED') }

// Review contracts are deliberately data-only. They do not launch a CLI.
export function prepareReview(agent, { inputHash, implementationHash, testsHash, findingsHash = null }) {
  if (!['gemini', 'copilot'].includes(agent) ||
      [inputHash, implementationHash, testsHash].some((value) => !/^[a-f0-9]{64}$/.test(value)) ||
      (findingsHash !== null && !/^[a-f0-9]{64}$/.test(findingsHash))) fail('AGENT_REVIEW_INPUT_INVALID')
  return { version: 1, agent, inputHash, implementationHash, testsHash, findingsHash }
}

export function validateReviewOutput(output, prepared) {
  if (!exactKeys(output, ['version', 'agent', 'inputHash', 'implementationHash', 'testsHash', 'findingsHash', 'decision', 'findings']) ||
      output.version !== 1 || output.agent !== prepared.agent ||
      output.inputHash !== prepared.inputHash || output.implementationHash !== prepared.implementationHash ||
      output.testsHash !== prepared.testsHash || output.findingsHash !== prepared.findingsHash ||
      !['pass', 'block'].includes(output.decision) || !Array.isArray(output.findings) || output.findings.length > 20 ||
      output.findings.some((item) => !exactKeys(item, ['code', 'message']) ||
        !/^[A-Z][A-Z0-9_]{2,60}$/.test(item.code) || typeof item.message !== 'string' || item.message.length > 300)) {
    fail('AGENT_REVIEW_OUTPUT_INVALID')
  }
  const bytes = Buffer.from(JSON.stringify(output))
  if (bytes.length > 16_384) fail('AGENT_REVIEW_OUTPUT_INVALID')
  assertNoSecretContent(bytes)
  return { output, outputHash: hash(bytes) }
}
