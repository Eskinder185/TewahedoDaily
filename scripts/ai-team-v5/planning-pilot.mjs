import { existsSync, readdirSync, realpathSync } from 'node:fs'
import { tmpdir } from 'node:os'
import { basename, dirname, join, relative, resolve } from 'node:path'
import { prepareClaudePlanning, buildAgentProcessSpec, recordAgentProcessStart, recordAgentProcessFinish, recordValidatedClaudePlan, validateClaudePlan } from './agents.mjs'
import { budgetStatus, reserveAiCall } from './budget.mjs'
import { prepareContainerPlanning, runFakeContainerPlanning } from './container-runtime.mjs'
import { assessPlanningIsolation } from './isolation.mjs'
import { executePlanningProcess, validateProcessSpec } from './process.mjs'
import { assessResume, readTask } from './state.mjs'
import { assertSafeEntry, inventory, isInside, verifyWorkspace } from './workspace.mjs'

const CALL_ID = 'pilot-claude-planning-1'
const MAX_RESPONSE_BYTES = 65_536

function exactFixtureFiles(root, expected) {
  const found = []
  const walk = (directory) => {
    for (const name of readdirSync(directory)) {
      const path = join(directory, name)
      const entry = assertSafeEntry(path)
      if (entry.isDirectory()) walk(path)
      else found.push(relative(root, path).replaceAll('\\', '/'))
    }
  }
  walk(root)
  return JSON.stringify(found.sort()) === JSON.stringify(expected.map((file) => file.path).sort())
}

function fixtureVerified(stateRoot, taskId) {
  try {
    const { manifest, paths } = readTask(stateRoot, taskId)
    const temp = realpathSync(tmpdir())
    const repo = realpathSync(manifest.repository)
    const root = realpathSync(stateRoot)
    if (!isInside(temp, repo) || !isInside(temp, root) || isInside(repo, root) || isInside(root, repo) ||
        !basename(dirname(repo)).startsWith('tewahedo-v5-pilot-') ||
        resolve(manifest.repository) !== repo || resolve(stateRoot) !== root ||
        ['.git', '.env', '.env.local', '.npmrc'].some((name) => existsSync(join(repo, name)))) return false
    verifyWorkspace(repo, root, taskId, manifest.workspace, manifest.sourceInventoryHash)
    const source = inventory(repo)
    return source.hash === manifest.sourceInventoryHash &&
      [repo, paths.snapshot, paths.workspace].every((path) => exactFixtureFiles(path, source.files))
  } catch { return false }
}

export function assessPlanningPilot(stateRoot, taskId, { acknowledgedTaskId = null, boundaryProbe = null } = {}) {
  const resume = assessResume(stateRoot, taskId)
  if (resume.overall !== 'reusable' || resume.lock?.status !== 'none' || resume.state !== 'snapshotted') {
    return { status: 'blocked', code: 'PILOT_CHECKPOINT_INVALID' }
  }
  const { manifest } = readTask(stateRoot, taskId)
  if (acknowledgedTaskId !== taskId) return { status: 'blocked', code: 'PILOT_TRUST_REQUIRED' }
  if (!fixtureVerified(stateRoot, taskId)) return { status: 'blocked', code: 'PILOT_FIXTURE_UNVERIFIED' }
  if (!manifest.agentConfig || !manifest.allowedPaths?.length) return { status: 'blocked', code: 'PILOT_CONFIG_INVALID' }
  if (manifest.budget?.maxAiCalls !== 1 || budgetStatus(stateRoot, taskId).usedCalls !== 0) {
    return { status: 'blocked', code: 'PILOT_ONE_CALL_BUDGET_REQUIRED' }
  }
  const isolation = assessPlanningIsolation(stateRoot, taskId, { boundaryProbe })
  if (isolation.overall !== 'verified') return { status: 'blocked', code: isolation.code }
  return { status: 'ready', code: 'PILOT_READY' }
}

function decodeClaudeResult(stdout, manifest, config) {
  if (Buffer.byteLength(stdout) > MAX_RESPONSE_BYTES) throw new Error('PILOT_OUTPUT_TOO_LARGE')
  let envelope, plan
  try {
    envelope = JSON.parse(stdout)
    if (envelope?.type !== 'result' || envelope?.is_error !== false || typeof envelope.result !== 'string') {
      throw new Error('invalid envelope')
    }
    plan = JSON.parse(envelope.result)
  } catch { throw new Error('PILOT_OUTPUT_INVALID') }
  const validated = validateClaudePlan(plan, manifest, config)
  const cost = envelope.total_cost_usd
  const reliable = typeof cost === 'number' && Number.isFinite(cost) && cost >= 0 && cost <= 1_000_000 &&
    Number.isSafeInteger(envelope.usage?.input_tokens) && envelope.usage.input_tokens >= 0 &&
    Number.isSafeInteger(envelope.usage?.output_tokens) && envelope.usage.output_tokens >= 0
  return { ...validated, actualUsd: reliable ? cost.toFixed(6) : null,
    usage: reliable ? { inputTokens: envelope.usage.input_tokens, outputTokens: envelope.usage.output_tokens } : null }
}

/** Only injected, testable transports are accepted. No production process factory exists yet. */
export async function runPlanningPilot(stateRoot, taskId, {
  acknowledgedTaskId = null, boundaryProbe = null, entrypoint = null, capability = null,
  spawnProcess = null, terminateTree = null, container = null, signal = null,
  estimatedUsd = '0.10', timeoutMs = 60_000,
} = {}) {
  const gate = assessPlanningPilot(stateRoot, taskId, { acknowledgedTaskId, boundaryProbe })
  if (gate.status !== 'ready') return { ...gate, agentsExecuted: false }
  if (container === null && (typeof spawnProcess !== 'function' || typeof terminateTree !== 'function')) {
    return { status: 'blocked', code: 'PILOT_PROCESS_BOUNDARY_UNAVAILABLE', agentsExecuted: false }
  }
  if (container !== null && (container.transport?.kind !== 'fake' || !container.image)) {
    return { status: 'blocked', code: 'PILOT_CONTAINER_LIVE_DISABLED', agentsExecuted: false }
  }
  const { manifest } = readTask(stateRoot, taskId)
  const context = prepareClaudePlanning(stateRoot, taskId, manifest.agentConfig, manifest.allowedPaths)
  const input = JSON.stringify({
    instruction: 'Read the supplied fixture only. Return a JSON object with exactly version, inputHash, objectiveHash, modelId, effort, allowedPaths, and steps. Each step has path and action. Do not use tools or write files.',
    context, allowedPaths: manifest.allowedPaths,
    version: 1, modelId: context.modelId, effort: context.effort,
  })
  if (container !== null && Buffer.byteLength(input) > 65_536) {
    return { status: 'blocked', code: 'PILOT_INPUT_TOO_LARGE', agentsExecuted: false }
  }
  let spec, prepared
  if (container !== null) {
    prepared = prepareContainerPlanning(stateRoot, taskId, {
      image: container.image, attemptId: CALL_ID, modelId: context.modelId, effort: context.effort,
    })
  } else {
    spec = buildAgentProcessSpec(context, entrypoint, capability, timeoutMs)
    spec.args.push('--output-format', 'json', '--permission-mode', 'plan')
    spec.stdin = input
    validateProcessSpec(spec)
  }
  reserveAiCall(stateRoot, taskId, { callId: CALL_ID, agent: 'claude', estimatedUsd })
  recordAgentProcessStart(stateRoot, taskId, {
    attemptId: CALL_ID, agent: 'claude', callId: CALL_ID, inputHash: manifest.inputHash,
  })
  let result
  try {
    result = container !== null
      ? await runFakeContainerPlanning(prepared, { transport: container.transport, stdin: input, signal, timeoutMs })
      : await executePlanningProcess(spec, { spawnProcess, terminateTree, signal })
  } catch {
    recordAgentProcessFinish(stateRoot, taskId, { attemptId: CALL_ID, status: 'failed',
      code: 'AGENT_CONTAINER_UNCERTAIN', actualUsd: null })
    return { status: 'blocked', code: 'PILOT_CONTAINER_UNCERTAIN', agentsExecuted: true, usage: 'unknown' }
  }
  if (!['succeeded', 'completed'].includes(result.status)) {
    const code = result.status === 'timed_out' ? 'AGENT_TIMEOUT' : result.status === 'cancelled'
      ? 'AGENT_CANCELLED' : 'AGENT_PROCESS_FAILED'
    recordAgentProcessFinish(stateRoot, taskId, { attemptId: CALL_ID,
      status: ['timed_out', 'cancelled'].includes(result.status) ? result.status : 'failed',
      code, actualUsd: null })
    return { status: 'blocked', code: result.code, agentsExecuted: true, usage: 'unknown' }
  }
  let decoded
  try { decoded = decodeClaudeResult(result.stdout, manifest, manifest.agentConfig) } catch {
    recordAgentProcessFinish(stateRoot, taskId, { attemptId: CALL_ID, status: 'failed', code: 'AGENT_PLAN_INVALID', actualUsd: null })
    return { status: 'blocked', code: 'PILOT_OUTPUT_INVALID', agentsExecuted: true, usage: 'unknown' }
  }
  recordAgentProcessFinish(stateRoot, taskId, { attemptId: CALL_ID, status: 'succeeded',
    code: 'AGENT_EXIT_OK', outputHash: decoded.planHash, actualUsd: decoded.actualUsd })
  if (decoded.actualUsd === null) return { status: 'blocked', code: 'PILOT_USAGE_UNKNOWN', agentsExecuted: true, usage: 'unknown' }
  const checkpoint = recordValidatedClaudePlan(stateRoot, taskId, { attemptId: CALL_ID,
    plan: decoded.plan, config: manifest.agentConfig })
  return { status: 'planned', code: 'PILOT_PLAN_VERIFIED', planHash: checkpoint.planHash,
    usage: { ...decoded.usage, actualUsd: decoded.actualUsd }, agentsExecuted: true,
    ...(container !== null ? { execution: 'fake-container' } : {}) }
}

