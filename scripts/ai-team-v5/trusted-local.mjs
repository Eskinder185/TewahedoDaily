import { existsSync, readdirSync, realpathSync } from 'node:fs'
import { tmpdir } from 'node:os'
import { basename, dirname, join, resolve } from 'node:path'
import { assessResume, readTask } from './state.mjs'
import { budgetStatus } from './budget.mjs'
import { probeLiveCapabilities } from './capabilities.mjs'
import { assessPlanningIsolation } from './isolation.mjs'
import { runPreflight } from './preflight.mjs'
import { assertSafeEntry, inventory, isInside, verifyWorkspace } from './workspace.mjs'

function checkFixtureTree(root, expectedPaths) {
  const found = new Set()
  const walk = (directory) => {
    for (const name of readdirSync(directory)) {
      const path = join(directory, name)
      const entry = assertSafeEntry(path)
      if (entry.isDirectory()) walk(path)
      else found.add(path.slice(root.length + 1).replaceAll('\\', '/'))
    }
  }
  walk(root)
  return found.size === expectedPaths.size && [...found].every((path) => expectedPaths.has(path))
}

/** A fail-closed readiness gate. No process is spawned and no budget is reserved here. */
export function assessTrustedLocal(stateRoot, taskId, { acknowledgedTaskId = null, probeClis = false } = {}) {
  const checks = []
  const add = (id, passed, code) => checks.push({ id, status: passed ? 'verified' : 'blocked', code })
  const resume = assessResume(stateRoot, taskId)
  add('checkpoint', resume.overall === 'reusable' && resume.lock?.status === 'none',
    resume.overall === 'reusable' && resume.lock?.status === 'none' ? 'CHECKPOINT_VERIFIED' : 'CHECKPOINT_INVALID')
  if (checks.at(-1).status === 'blocked') return { status: 'blocked', code: 'TRUSTED_LOCAL_BLOCKED', checks, agentsExecuted: false }
  const { manifest, paths } = readTask(stateRoot, taskId)
  add('acknowledgment', acknowledgedTaskId === taskId, acknowledgedTaskId === taskId ? 'TASK_TRUST_ACKNOWLEDGED' : 'TASK_TRUST_REQUIRED')
  add('scope', Array.isArray(manifest.allowedPaths) && manifest.allowedPaths.length > 0,
    manifest.allowedPaths?.length ? 'TASK_SCOPE_VERIFIED' : 'TASK_SCOPE_MISSING')
  let fixture = false
  try {
    const base = resolve(tmpdir())
    const repo = realpathSync(manifest.repository)
    const root = realpathSync(stateRoot)
    fixture = isInside(base, repo) && isInside(base, root) && !isInside(repo, root) &&
      !isInside(root, repo) && basename(dirname(repo)).startsWith('tewahedo-v5-pilot-') &&
      !existsSync(join(repo, '.git')) && !existsSync(join(repo, '.env')) &&
      !existsSync(join(repo, '.env.local')) && repo === resolve(manifest.repository) && root === resolve(stateRoot)
    if (fixture) {
      verifyWorkspace(manifest.repository, stateRoot, taskId, manifest.workspace, manifest.sourceInventoryHash)
      const expected = new Set(inventory(repo).files.map((file) => file.path))
      fixture = checkFixtureTree(repo, expected) && checkFixtureTree(paths.snapshot, expected) &&
        checkFixtureTree(paths.workspace, expected)
    }
  } catch { fixture = false }
  add('fixture', fixture, fixture ? 'DISPOSABLE_FIXTURE_VERIFIED' : 'DISPOSABLE_FIXTURE_UNVERIFIED')
  const preflight = runPreflight({ repository: manifest.repository, workspace: manifest.workspace,
    requiredEnvNames: manifest.requiredEnvNames ?? [] })
  add('preflight', preflight.overall === 'ready', preflight.overall === 'ready' ? 'PREFLIGHT_VERIFIED' : 'PREFLIGHT_BLOCKED')
  const budget = budgetStatus(stateRoot, taskId)
  add('budget', budget.status === 'ready', budget.status === 'ready' ? 'BUDGET_AVAILABLE' : budget.code)
  const capabilities = manifest.agentConfig ? probeLiveCapabilities(manifest.agentConfig, { executeReadOnly: probeClis }) : null
  add('agent-capabilities', capabilities?.overall === 'verified',
    capabilities?.overall === 'verified' ? 'AGENT_CAPABILITIES_VERIFIED' : 'AGENT_CAPABILITIES_UNVERIFIED')
  const isolation = assessPlanningIsolation(stateRoot, taskId)
  add('planning-isolation', isolation.overall === 'verified', isolation.code)
  // Gemini and optional Copilot require pinned configurations and independently verified capabilities.
  add('review-adapters', false, 'REVIEW_AGENT_CAPABILITIES_UNVERIFIED')
  return { status: 'blocked', code: 'TRUSTED_LOCAL_BLOCKED', checks, agentsExecuted: false,
    budget: { status: budget.status, code: budget.code },
    preflight: { overall: preflight.overall, blocked: preflight.checks.filter((item) => item.status !== 'pass').map((item) => item.code) } }
}
