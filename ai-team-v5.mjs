#!/usr/bin/env node
import { homedir } from 'node:os'
import { join, resolve } from 'node:path'
import { appendCheckpoint, assessResume, createTask, withTaskLock } from './scripts/ai-team-v5/state.mjs'
import { readTask } from './scripts/ai-team-v5/state.mjs'
import { assertSeparateStateRoot, createVerifiedWorkspace, inventory, taskPaths } from './scripts/ai-team-v5/workspace.mjs'
import { budgetStatus, parseBudgetLimits } from './scripts/ai-team-v5/budget.mjs'
import { normalizeRequiredEnvNames, runPreflight } from './scripts/ai-team-v5/preflight.mjs'
import { runSimulated } from './scripts/ai-team-v5/runner.mjs'
import { runWorkflow } from './scripts/ai-team-v5/workflow.mjs'
import { agentProcessStatus, validateAgentConfig } from './scripts/ai-team-v5/agents.mjs'
import { probeLiveCapabilities } from './scripts/ai-team-v5/capabilities.mjs'
import { assessPlanningIsolation } from './scripts/ai-team-v5/isolation.mjs'
import { assessTrustedLocal } from './scripts/ai-team-v5/trusted-local.mjs'
import { runPlanningPilot } from './scripts/ai-team-v5/planning-pilot.mjs'

const COMMANDS = new Set(['start', 'status', 'resume', 'simulate', 'run'])
const OPTIONS = new Set(['--task', '--task-id', '--repo', '--state-root', '--dry-run', '--simulate', '--simulate-workflow', '--skip-copilot', '--trusted-local', '--planning-only', '--acknowledge-task-id', '--probe-clis', '--real-agents', '--allow-path', '--max-ai-calls', '--max-estimated-usd', '--required-env', '--claude-model', '--codex-model', '--claude-effort', '--codex-effort'])

function usage() {
  return [
    'AI Team V5.1B-2C (real agents hard-disabled)',
    '  node ai-team-v5.mjs start --task "objective" [--allow-path src/file.ts] [--repo PATH] [--state-root PATH] [--max-ai-calls N] [--max-estimated-usd USD] [--required-env NAME,NAME]',
    '    [--claude-model EXACT_ID --claude-effort LEVEL --codex-model EXACT_ID --codex-effort LEVEL]',
    '  node ai-team-v5.mjs status --task-id UUID [--state-root PATH] [--probe-clis]',
    '  node ai-team-v5.mjs resume --dry-run --task-id UUID [--state-root PATH] [--probe-clis]',
    '  node ai-team-v5.mjs simulate --task-id UUID [--state-root PATH]',
    '  node ai-team-v5.mjs resume --simulate --task-id UUID [--state-root PATH]',
    '  node ai-team-v5.mjs run --task-id UUID --simulate-workflow [--skip-copilot] [--state-root PATH]',
    '  node ai-team-v5.mjs run --task-id UUID --trusted-local --acknowledge-task-id UUID [--probe-clis] [--state-root PATH]',
    '  node ai-team-v5.mjs run --task-id UUID --planning-only --acknowledge-task-id UUID [--state-root PATH]',
    '    Planning-only blocks until an enforceable read-only process boundary is supplied.',
    '    Trusted-local performs a fail-closed readiness assessment; real launches remain blocked until every gate is verified.',
    '  --probe-clis runs only version, help, and local auth-status commands; model access remains unknown',
    '  --real-agents is hard-disabled in this phase',
  ].join('\n')
}

function parse(args) {
  const [command, ...rest] = args
  if (!COMMANDS.has(command)) throw new Error('INVALID_COMMAND')
  const options = {}
  for (let index = 0; index < rest.length; index += 1) {
    const key = rest[index]
    if (!OPTIONS.has(key) || Object.hasOwn(options, key)) throw new Error('INVALID_OPTION')
    if (key === '--dry-run' || key === '--simulate' || key === '--simulate-workflow' || key === '--skip-copilot' || key === '--trusted-local' || key === '--planning-only' || key === '--probe-clis' || key === '--real-agents') options[key] = true
    else {
      const value = rest[++index]
      if (!value || value.startsWith('--')) throw new Error('MISSING_OPTION_VALUE')
      options[key] = value
    }
  }
  if (options['--real-agents']) throw new Error('REAL_AGENTS_DISABLED')
  if (command === 'start') {
    if (!options['--task'] || options['--task-id'] || options['--dry-run'] || options['--simulate'] || options['--simulate-workflow'] || options['--skip-copilot'] || options['--trusted-local'] || options['--planning-only'] || options['--acknowledge-task-id'] || options['--probe-clis']) throw new Error('INVALID_START_OPTIONS')
  } else if (!options['--task-id'] || options['--task'] || options['--repo'] ||
    options['--max-ai-calls'] || options['--max-estimated-usd'] || options['--required-env'] || options['--allow-path'] ||
    options['--claude-model'] || options['--codex-model'] || options['--claude-effort'] || options['--codex-effort']) {
    throw new Error('INVALID_TASK_OPTIONS')
  }
  if (command === 'resume' && Number(Boolean(options['--dry-run'])) + Number(Boolean(options['--simulate'])) !== 1) throw new Error('INVALID_RESUME_MODE')
  if (command === 'run' && (Number(Boolean(options['--simulate-workflow'])) + Number(Boolean(options['--trusted-local'])) + Number(Boolean(options['--planning-only'])) !== 1 ||
    options['--dry-run'] || options['--simulate'] || (options['--probe-clis'] && !options['--trusted-local']) ||
    (options['--acknowledge-task-id'] && !options['--trusted-local'] && !options['--planning-only']) ||
    (options['--skip-copilot'] && (options['--trusted-local'] || options['--planning-only'])))) throw new Error('INVALID_RUN_MODE')
  if (command === 'run' && (options['--trusted-local'] || options['--planning-only']) && options['--acknowledge-task-id'] !== options['--task-id']) throw new Error('TASK_TRUST_REQUIRED')
  if (command !== 'run' && (options['--trusted-local'] || options['--planning-only'] || options['--acknowledge-task-id'])) throw new Error('INVALID_TRUSTED_LOCAL_OPTIONS')
  if (command !== 'run' && (options['--simulate-workflow'] || options['--skip-copilot'])) throw new Error('INVALID_WORKFLOW_OPTIONS')
  if (command === 'status' && (options['--dry-run'] || options['--simulate'])) throw new Error('INVALID_STATUS_OPTIONS')
  if (command === 'simulate' && (options['--dry-run'] || options['--simulate'] || options['--probe-clis'])) throw new Error('INVALID_SIMULATE_OPTIONS')
  if (command === 'resume' && options['--simulate'] && options['--probe-clis']) throw new Error('INVALID_RESUME_MODE')
  return { command, options }
}

function errorCode(error) {
  return /^[A-Z][A-Z0-9_]{2,80}$/.test(error?.message ?? '') ? error.message : 'UNEXPECTED_ERROR'
}

async function main() {
  if (process.argv.length === 2 || (process.argv.length === 3 && process.argv[2] === '--help')) {
    console.log(usage())
    return
  }
  const { command, options } = parse(process.argv.slice(2))
  const stateRoot = resolve(options['--state-root'] ?? process.env.TEWAHEDO_AI_TEAM_V5_STATE_ROOT ?? join(homedir(), '.tewahedo-ai-team-v5'))
  if (command === 'start') {
    const repository = resolve(options['--repo'] ?? process.cwd())
    assertSeparateStateRoot(repository, stateRoot)
    const requiredEnvNames = normalizeRequiredEnvNames(options['--required-env'])
    const budget = parseBudgetLimits(options['--max-ai-calls'] ?? '0', options['--max-estimated-usd'] ?? '0')
    const allowedPaths = options['--allow-path']?.split(',') ?? []
    const configFlags = ['--claude-model', '--claude-effort', '--codex-model', '--codex-effort']
    const configured = configFlags.filter((flag) => options[flag]).length
    if (configured !== 0 && configured !== 4) throw new Error('AGENT_CONFIG_INCOMPLETE')
    const agentConfig = configured ? validateAgentConfig({
      claude: { modelId: options['--claude-model'], effort: options['--claude-effort'] },
      codex: { modelId: options['--codex-model'], effort: options['--codex-effort'] },
    }) : null
    const sourceInventory = inventory(repository)
    const manifest = createTask(stateRoot, repository, options['--task'], sourceInventory, { budget, requiredEnvNames, allowedPaths, agentConfig })
    const paths = taskPaths(stateRoot, manifest.id)
    withTaskLock(paths.taskDirectory, () => {
      const workspace = createVerifiedWorkspace(repository, stateRoot, manifest.id, sourceInventory)
      appendCheckpoint(paths.taskDirectory, {
        from: 'created', to: 'snapshotted', kind: 'snapshot-verified',
        inputHash: manifest.inputHash, workspaceHash: workspace.inventoryHash,
        payload: { snapshotHash: sourceInventory.hash, workspace: workspace.workspace },
      })
    })
    const preflight = runPreflight({ repository, workspace: manifest.workspace, requiredEnvNames })
    console.log(JSON.stringify({ taskId: manifest.id, state: 'snapshotted', stateRoot, workspace: manifest.workspace,
      preflight, budget: budgetStatus(stateRoot, manifest.id),
      realAgentReadiness: agentConfig ? probeLiveCapabilities(agentConfig) : { overall: 'blocked', code: 'AGENT_CONFIG_MISSING' },
      planningIsolation: assessPlanningIsolation(stateRoot, manifest.id),
      agentsEnabled: false }, null, 2))
    return
  }
  if (command === 'simulate' || options['--simulate']) {
    const result = runSimulated(stateRoot, options['--task-id'])
    console.log(JSON.stringify({ ...result, command, agentsEnabled: false }, null, 2))
    if (result.status !== 'complete') process.exitCode = 2
    return
  }
  if (command === 'run') {
    if (options['--planning-only']) {
      const result = await runPlanningPilot(stateRoot, options['--task-id'], {
        acknowledgedTaskId: options['--acknowledge-task-id'],
      })
      console.log(JSON.stringify({ ...result, command, mode: 'planning-only' }, null, 2))
      if (result.status !== 'planned') process.exitCode = 2
      return
    }
    if (options['--trusted-local']) {
      const result = assessTrustedLocal(stateRoot, options['--task-id'], {
        acknowledgedTaskId: options['--acknowledge-task-id'], probeClis: Boolean(options['--probe-clis']),
      })
      console.log(JSON.stringify({ ...result, command, mode: 'trusted-local' }, null, 2))
      process.exitCode = 2
      return
    }
    const result = runWorkflow(stateRoot, options['--task-id'], { includeCopilot: !options['--skip-copilot'] })
    console.log(JSON.stringify({ ...result, command, agentsEnabled: false }, null, 2))
    if (result.status !== 'awaiting_manual_approval') process.exitCode = 2
    return
  }
  const result = assessResume(stateRoot, options['--task-id'])
  let preflight = { overall: 'unavailable', checks: [], agentsExecuted: false }
  let budget = { status: 'unavailable', code: 'TASK_STATE_INVALID' }
  let realAgentReadiness = { overall: 'blocked', code: 'AGENT_CONFIG_MISSING' }
  let planningIsolation = { overall: 'blocked', code: 'TASK_STATE_INVALID' }
  let processAttempts = []
  if (result.overall !== 'corrupted') {
    const { manifest } = readTask(stateRoot, options['--task-id'])
    preflight = runPreflight({ repository: manifest.repository, workspace: manifest.workspace,
      requiredEnvNames: manifest.requiredEnvNames ?? [] })
    budget = budgetStatus(stateRoot, options['--task-id'])
    if (manifest.agentConfig) realAgentReadiness = probeLiveCapabilities(manifest.agentConfig, { executeReadOnly: Boolean(options['--probe-clis']) })
    planningIsolation = assessPlanningIsolation(stateRoot, options['--task-id'])
    processAttempts = agentProcessStatus(stateRoot, options['--task-id'])
  }
  console.log(JSON.stringify({ ...result, command, dryRun: command === 'resume', preflight, budget,
    realAgentReadiness, planningIsolation, processAttempts, agentsEnabled: false }, null, 2))
  if (result.overall !== 'reusable' || ['stale', 'corrupt', 'unknown', 'active'].includes(result.lock?.status)) {
    process.exitCode = 2
  }
}

main().catch((error) => {
  console.error(JSON.stringify({ status: 'blocked', code: errorCode(error), agentsEnabled: false }))
  process.exitCode = 2
})
