import { assessResume, readTask } from './state.mjs'
import { budgetStatus } from './budget.mjs'
import { recordAgentProcessFinish, recordAgentProcessStart } from './agents.mjs'
import { executeFakeProcess, validateProcessSpec } from './process.mjs'
import { assertSafeEntry, inventory, isInside } from './workspace.mjs'
import { join, resolve } from 'node:path'

export function assessLaunchSafety(stateRoot, taskId, { spec, callId, capabilities, isolation }) {
  try { validateProcessSpec(spec) } catch { return { status: 'blocked', code: 'LAUNCH_SPEC_INVALID' } }
  const resume = assessResume(stateRoot, taskId)
  if (resume.overall !== 'reusable' || resume.lock?.status !== 'none') return { status: 'blocked', code: 'LAUNCH_CHECKPOINT_STALE' }
  const { manifest, paths } = readTask(stateRoot, taskId)
  if (spec.modelId !== manifest.agentConfig?.[spec.agent]?.modelId ||
      spec.effort !== manifest.agentConfig?.[spec.agent]?.effort) return { status: 'blocked', code: 'LAUNCH_MODEL_MISMATCH' }
  if (spec.agent === 'claude' && (spec.cwd !== manifest.snapshot || spec.snapshot !== manifest.snapshot)) {
    return { status: 'blocked', code: 'LAUNCH_WORKSPACE_INVALID' }
  }
  if (spec.agent === 'codex') {
    const attemptsRoot = join(paths.taskDirectory, 'attempts')
    try {
      if (!isInside(attemptsRoot, spec.cwd) || resolve(spec.cwd, '..') !== resolve(attemptsRoot) ||
          !assertSafeEntry(spec.cwd).isDirectory() || inventory(spec.cwd).hash !== manifest.sourceInventoryHash) {
        return { status: 'blocked', code: 'LAUNCH_WORKSPACE_INVALID' }
      }
    } catch { return { status: 'blocked', code: 'LAUNCH_WORKSPACE_INVALID' } }
  }
  const agent = capabilities?.agents?.[spec.agent]
  if (!agent || agent.model?.requestedId !== spec.modelId || agent.effort?.requested !== spec.effort ||
      Object.values(agent).some((item) => item.status !== 'verified')) {
    return { status: 'blocked', code: 'LAUNCH_CAPABILITY_UNVERIFIED' }
  }
  if (isolation?.overall !== 'verified' || isolation?.osBoundary !== 'verified') {
    return { status: 'blocked', code: 'LAUNCH_ISOLATION_UNVERIFIED' }
  }
  const call = budgetStatus(stateRoot, taskId).calls.find((item) => item.callId === callId)
  if (!call || call.agent !== spec.agent || call.status !== 'pending') {
    return { status: 'blocked', code: 'LAUNCH_BUDGET_RESERVATION_REQUIRED' }
  }
  return { status: 'ready', code: 'LAUNCH_GATES_VERIFIED' }
}

// Test-only entry point. There is deliberately no production process factory.
export async function launchGuardedFakeProcess(stateRoot, taskId, { attemptId, callId, spec,
  capabilities, isolation, spawnProcess, signal = null, onStdout = null }) {
  const gate = assessLaunchSafety(stateRoot, taskId, { spec, callId, capabilities, isolation })
  if (gate.status !== 'ready') return { status: 'blocked', code: gate.code }
  if (typeof spawnProcess !== 'function') return { status: 'blocked', code: 'REAL_AGENTS_DISABLED' }
  recordAgentProcessStart(stateRoot, taskId, { attemptId, agent: spec.agent, callId,
    inputHash: readTask(stateRoot, taskId).manifest.inputHash })
  const result = await executeFakeProcess(spec, { spawnProcess, signal, onStdout })
  // No process outcome implies reliable usage in this phase. All results remain charge-uncertain.
  recordAgentProcessFinish(stateRoot, taskId, { attemptId, status: result.status, code: result.code,
    outputHash: result.stdoutHash ?? null, actualUsd: null })
  return { status: result.status, code: result.code, stdoutBytes: result.stdoutBytes,
    stderrBytes: result.stderrBytes, usage: 'unknown', rawOutputLogged: false }
}
