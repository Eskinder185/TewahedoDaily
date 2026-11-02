import { appendCheckpoint, assessResume, readTask, withTaskLock } from './state.mjs'
import { taskPaths } from './workspace.mjs'

const AGENT_STATES = {
  claude: 'snapshotted',
  codex: 'planned',
  gemini: 'tested',
  copilot: 'reviewed',
}

function fail(code) {
  throw new Error(code)
}

export function parseUsd(value) {
  const text = String(value)
  if (!/^(?:0|[1-9]\d*)(?:\.\d{1,6})?$/.test(text)) fail('BUDGET_AMOUNT_INVALID')
  const [whole, fraction = ''] = text.split('.')
  const micro = Number(whole) * 1_000_000 + Number(fraction.padEnd(6, '0'))
  if (!Number.isSafeInteger(micro)) fail('BUDGET_AMOUNT_INVALID')
  return micro
}

function formatUsd(micro) {
  return (micro / 1_000_000).toFixed(6)
}

export function parseBudgetLimits(maxAiCalls = '0', maxEstimatedUsd = '0') {
  const calls = Number(maxAiCalls)
  if (!/^(?:0|[1-9]\d*)$/.test(String(maxAiCalls)) || !Number.isSafeInteger(calls)) fail('BUDGET_CALL_LIMIT_INVALID')
  return { maxAiCalls: calls, maxEstimatedMicroUsd: parseUsd(maxEstimatedUsd) }
}

function reservationMap(entries) {
  const calls = new Map()
  for (const entry of entries) {
    const { kind, payload } = entry.detail
    if (kind === 'budget-reserved') {
      if (calls.has(payload.callId) || !AGENT_STATES[payload.agent] ||
          !Number.isSafeInteger(payload.estimatedMicroUsd) || payload.estimatedMicroUsd <= 0) fail('BUDGET_JOURNAL_INVALID')
      calls.set(payload.callId, {
        callId: payload.callId, agent: payload.agent,
        estimatedMicroUsd: payload.estimatedMicroUsd,
        status: 'pending', actualMicroUsd: null,
      })
    } else if (kind === 'budget-settled') {
      const call = calls.get(payload.callId)
      if (!call || call.status !== 'pending') fail('BUDGET_JOURNAL_INVALID')
      if (payload.actualMicroUsd !== null && (!Number.isSafeInteger(payload.actualMicroUsd) || payload.actualMicroUsd < 0)) fail('BUDGET_JOURNAL_INVALID')
      call.status = payload.actualMicroUsd === null ? 'unknown' : 'settled'
      call.actualMicroUsd = payload.actualMicroUsd
    } else if (kind === 'budget-reconciled') {
      const call = calls.get(payload.callId)
      if (!call || call.status !== 'unknown' || !Number.isSafeInteger(payload.actualMicroUsd) || payload.actualMicroUsd < 0) {
        fail('BUDGET_JOURNAL_INVALID')
      }
      call.status = 'settled'
      call.actualMicroUsd = payload.actualMicroUsd
    }
  }
  return calls
}

export function budgetStatus(stateRoot, taskId) {
  const { manifest, entries } = readTask(stateRoot, taskId)
  const limits = manifest.budget ?? { maxAiCalls: 0, maxEstimatedMicroUsd: 0 }
  if (!Number.isSafeInteger(limits.maxAiCalls) || limits.maxAiCalls < 0 ||
      !Number.isSafeInteger(limits.maxEstimatedMicroUsd) || limits.maxEstimatedMicroUsd < 0) fail('BUDGET_LIMITS_CORRUPTED')
  const calls = [...reservationMap(entries).values()]
  const charged = calls.reduce((sum, call) => sum + Math.max(call.estimatedMicroUsd, call.actualMicroUsd ?? 0), 0)
  if (!Number.isSafeInteger(charged)) fail('BUDGET_TOTAL_INVALID')
  const uncertain = calls.some((call) => call.status !== 'settled')
  const exhausted = calls.length >= limits.maxAiCalls || charged >= limits.maxEstimatedMicroUsd
  return {
    status: uncertain || exhausted ? 'blocked' : 'ready',
    category: uncertain ? 'usage_unreconciled' : exhausted ? 'budget_exhausted' : null,
    code: uncertain ? 'BUDGET_USAGE_UNRECONCILED' : exhausted ? 'BUDGET_EXHAUSTED' : 'BUDGET_AVAILABLE',
    limits: { maxAiCalls: limits.maxAiCalls, maxEstimatedUsd: formatUsd(limits.maxEstimatedMicroUsd) },
    usedCalls: calls.length,
    remainingCalls: Math.max(0, limits.maxAiCalls - calls.length),
    chargedUsd: formatUsd(charged),
    remainingEstimatedUsd: formatUsd(Math.max(0, limits.maxEstimatedMicroUsd - charged)),
    calls: calls.map((call) => ({
      callId: call.callId, agent: call.agent, status: call.status,
      estimatedUsd: formatUsd(call.estimatedMicroUsd),
      actualUsd: call.actualMicroUsd === null ? null : formatUsd(call.actualMicroUsd),
    })),
  }
}

function validateCallId(callId) {
  if (typeof callId !== 'string' || !/^[a-z][a-z0-9-]{2,80}$/.test(callId)) fail('BUDGET_CALL_ID_INVALID')
}

export function reserveAiCall(stateRoot, taskId, { callId, agent, estimatedUsd }) {
  validateCallId(callId)
  if (!Object.hasOwn(AGENT_STATES, agent)) fail('BUDGET_AGENT_INVALID')
  const estimatedMicroUsd = parseUsd(estimatedUsd)
  if (estimatedMicroUsd <= 0) fail('BUDGET_ESTIMATE_REQUIRED')
  const paths = taskPaths(stateRoot, taskId)
  return withTaskLock(paths.taskDirectory, () => {
    if (assessResume(stateRoot, taskId).overall !== 'reusable') fail('BUDGET_CHECKPOINT_INVALID')
    const { manifest, entries } = readTask(stateRoot, taskId)
    const calls = reservationMap(entries)
    const existing = calls.get(callId)
    if (existing) {
      if (existing.agent !== agent || existing.estimatedMicroUsd !== estimatedMicroUsd) fail('BUDGET_DUPLICATE_CONFLICT')
      return { status: 'duplicate', code: 'BUDGET_RESERVATION_REUSED', callId, budget: budgetStatus(stateRoot, taskId) }
    }
    const latest = entries.at(-1)
    if (latest.state !== AGENT_STATES[agent]) fail('BUDGET_AGENT_STAGE_MISMATCH')
    const current = budgetStatus(stateRoot, taskId)
    if (current.calls.some((call) => call.status !== 'settled')) fail('BUDGET_USAGE_UNRECONCILED')
    if (current.usedCalls >= current.limits.maxAiCalls) fail('BUDGET_CALL_LIMIT_EXCEEDED')
    if (estimatedMicroUsd > parseUsd(current.remainingEstimatedUsd)) fail('BUDGET_COST_LIMIT_EXCEEDED')
    appendCheckpoint(paths.taskDirectory, {
      from: latest.state, to: latest.state, kind: 'budget-reserved',
      inputHash: manifest.inputHash,
      workspaceHash: latest.detail.workspaceHash ?? manifest.sourceInventoryHash,
      payload: { callId, agent, estimatedMicroUsd },
    })
    return { status: 'reserved', code: 'BUDGET_RESERVED', callId, budget: budgetStatus(stateRoot, taskId) }
  })
}

export function settleAiCall(stateRoot, taskId, { callId, actualUsd = null, reliable = false }) {
  validateCallId(callId)
  if (typeof reliable !== 'boolean') fail('BUDGET_USAGE_INVALID')
  if (reliable && actualUsd === null) fail('BUDGET_USAGE_INVALID')
  const actualMicroUsd = reliable ? parseUsd(actualUsd) : null
  const paths = taskPaths(stateRoot, taskId)
  return withTaskLock(paths.taskDirectory, () => {
    if (assessResume(stateRoot, taskId).overall !== 'reusable') fail('BUDGET_CHECKPOINT_INVALID')
    const { manifest, entries } = readTask(stateRoot, taskId)
    const existing = reservationMap(entries).get(callId)
    if (!existing) fail('BUDGET_RESERVATION_MISSING')
    if (existing.status !== 'pending') {
      if (existing.actualMicroUsd !== actualMicroUsd) fail('BUDGET_SETTLEMENT_CONFLICT')
      return { status: 'duplicate', code: 'BUDGET_SETTLEMENT_REUSED', callId, budget: budgetStatus(stateRoot, taskId) }
    }
    const latest = entries.at(-1)
    appendCheckpoint(paths.taskDirectory, {
      from: latest.state, to: latest.state, kind: 'budget-settled',
      inputHash: manifest.inputHash,
      workspaceHash: latest.detail.workspaceHash ?? manifest.sourceInventoryHash,
      payload: { callId, actualMicroUsd },
    })
    return { status: actualMicroUsd === null ? 'unknown' : 'settled',
      code: actualMicroUsd === null ? 'BUDGET_USAGE_UNKNOWN' : 'BUDGET_USAGE_RECORDED',
      callId, budget: budgetStatus(stateRoot, taskId) }
  })
}

export function reconcileAiCall(stateRoot, taskId, { callId, actualUsd }) {
  validateCallId(callId)
  if (actualUsd === null || actualUsd === undefined) fail('BUDGET_USAGE_INVALID')
  const actualMicroUsd = parseUsd(actualUsd)
  const paths = taskPaths(stateRoot, taskId)
  return withTaskLock(paths.taskDirectory, () => {
    if (assessResume(stateRoot, taskId).overall !== 'reusable') fail('BUDGET_CHECKPOINT_INVALID')
    const { manifest, entries } = readTask(stateRoot, taskId)
    const existing = reservationMap(entries).get(callId)
    if (!existing) fail('BUDGET_RESERVATION_MISSING')
    if (existing.status === 'settled') {
      if (existing.actualMicroUsd !== actualMicroUsd) fail('BUDGET_SETTLEMENT_CONFLICT')
      return { status: 'duplicate', code: 'BUDGET_RECONCILIATION_REUSED', callId, budget: budgetStatus(stateRoot, taskId) }
    }
    if (existing.status !== 'unknown') fail('BUDGET_USAGE_STILL_PENDING')
    const latest = entries.at(-1)
    appendCheckpoint(paths.taskDirectory, {
      from: latest.state, to: latest.state, kind: 'budget-reconciled',
      inputHash: manifest.inputHash,
      workspaceHash: latest.detail.workspaceHash ?? manifest.sourceInventoryHash,
      payload: { callId, actualMicroUsd },
    })
    return { status: 'settled', code: 'BUDGET_USAGE_RECONCILED', callId, budget: budgetStatus(stateRoot, taskId) }
  })
}
