import { spawnSync } from 'node:child_process'
import { existsSync, mkdirSync, readFileSync, writeFileSync } from 'node:fs'
import { dirname, join, resolve } from 'node:path'
import { assessResume, appendCheckpoint, readTask, withTaskLock } from './state.mjs'
import { budgetStatus, reserveAiCall } from './budget.mjs'
import { runPreflight } from './preflight.mjs'
import { runSimulated } from './runner.mjs'
import { agentProcessStatus, prepareReview, recordAgentProcessFinish, recordAgentProcessStart, validateReviewOutput } from './agents.mjs'
import { assertNoSecretContent, assertSafeEntry, hash, inventory, isInside, verifyWorkspace } from './workspace.mjs'

const ESTIMATE = '0.010000'
const MAX_REPORT = 65_536
const TEST_NAMES = ['test:workflow', 'test:calendar-cards', 'test:play-foundation', 'test:journeys', 'build']

function fail(code) { throw new Error(code) }
function codeOf(error) { return /^[A-Z][A-Z0-9_]{2,80}$/.test(error?.message ?? '') ? error.message : 'WORKFLOW_STAGE_FAILED' }
function current(stateRoot, taskId) {
  const resume = assessResume(stateRoot, taskId)
  if (resume.overall !== 'reusable') fail('WORKFLOW_CHECKPOINT_INVALID')
  if (resume.lock?.status !== 'none') fail('WORKFLOW_TASK_LOCKED')
  return readTask(stateRoot, taskId)
}
function base(manifest, stateRoot, taskId) {
  verifyWorkspace(manifest.repository, stateRoot, taskId, manifest.workspace, manifest.sourceInventoryHash)
}
function artifact(paths, relativePath, value) {
  const path = resolve(paths.taskDirectory, relativePath)
  if (!isInside(paths.taskDirectory, path)) fail('WORKFLOW_ARTIFACT_PATH_INVALID')
  mkdirSync(dirname(path), { recursive: true })
  const bytes = Buffer.from(`${JSON.stringify(value)}\n`)
  if (bytes.length > MAX_REPORT) fail('WORKFLOW_OUTPUT_TOO_LARGE')
  assertNoSecretContent(bytes)
  writeFileSync(path, bytes, { flag: 'wx' })
  return hash(bytes)
}
function verifiedArtifact(task, entry, name) {
  const expected = entry?.detail.artifacts?.[name]
  if (!/^[a-f0-9]{64}$/.test(expected ?? '')) fail('WORKFLOW_ARTIFACT_MISSING')
  const path = resolve(task.paths.taskDirectory, name)
  if (!isInside(task.paths.taskDirectory, path) || !assertSafeEntry(path).isFile()) fail('WORKFLOW_ARTIFACT_PATH_INVALID')
  const bytes = readFileSync(path)
  if (hash(bytes) !== expected) fail('WORKFLOW_ARTIFACT_STALE')
  return JSON.parse(bytes)
}
function checkpoint(task, from, to, kind, payload, artifacts, workspaceHash) {
  withTaskLock(task.paths.taskDirectory, () => appendCheckpoint(task.paths.taskDirectory, {
    from, to, kind, inputHash: task.manifest.inputHash, workspaceHash,
    payload, artifacts,
  }))
}
function implementation(task) {
  const entry = task.entries.findLast((item) => item.kind === 'implementation-verified')
  if (!entry) fail('WORKFLOW_IMPLEMENTATION_MISSING')
  const attempt = entry.detail.payload.attempt
  const root = join(task.paths.taskDirectory, 'attempts')
  if (!isInside(root, attempt) || !assertSafeEntry(attempt).isDirectory()) fail('WORKFLOW_ATTEMPT_INVALID')
  if (inventory(attempt).hash !== entry.detail.workspaceHash) fail('WORKFLOW_ATTEMPT_STALE')
  return { attempt, hash: entry.detail.workspaceHash, changedPaths: entry.detail.payload.changedPaths }
}
export function mappedTests(changedPaths, scripts) {
  if (!Array.isArray(changedPaths) || !scripts || typeof scripts !== 'object') fail('WORKFLOW_TEST_MAP_INVALID')
  const selected = []
  if (Object.hasOwn(scripts, 'test:workflow')) selected.push('test:workflow')
  else {
    if (changedPaths.some((path) => /calendar/i.test(path)) && Object.hasOwn(scripts, 'test:calendar-cards')) selected.push('test:calendar-cards')
    if (changedPaths.some((path) => /play/i.test(path)) && Object.hasOwn(scripts, 'test:play-foundation')) selected.push('test:play-foundation')
    if (changedPaths.some((path) => path.startsWith('src/')) && Object.hasOwn(scripts, 'test:journeys')) selected.push('test:journeys')
    if (Object.hasOwn(scripts, 'build')) selected.push('build')
  }
  if (!selected.length || selected.some((name) => !TEST_NAMES.includes(name) || typeof scripts[name] !== 'string')) fail('WORKFLOW_TEST_MAP_EMPTY')
  return selected
}
function npmCli() {
  const candidates = [process.env.npm_execpath, join(dirname(process.execPath), 'node_modules/npm/bin/npm-cli.js'),
    join(dirname(dirname(process.execPath)), 'node_modules/npm/bin/npm-cli.js')]
  for (const path of candidates) {
    if (typeof path === 'string' && /npm-cli\.js$/i.test(path) && existsSync(path) && assertSafeEntry(path).isFile()) return path
  }
  fail('WORKFLOW_NPM_UNAVAILABLE')
}
function actualTest(name, cwd) {
  const scripts = JSON.parse(readFileSync(join(cwd, 'package.json'), 'utf8')).scripts ?? {}
  const direct = /^node (scripts\/[A-Za-z0-9_./-]+\.mjs)$/.exec(scripts[name] ?? '')
  if (!direct && !(name === 'build' && scripts[name] === 'tsc -b && vite build')) fail('WORKFLOW_TEST_COMMAND_UNSUPPORTED')
  if (direct) {
    const path = resolve(cwd, direct[1])
    if (!isInside(cwd, path) || direct[1].split('/').includes('..') || !assertSafeEntry(path).isFile()) {
      fail('WORKFLOW_TEST_COMMAND_UNSAFE')
    }
  }
  const args = direct ? [direct[1]] : [npmCli(), 'run', name]
  const env = { [process.platform === 'win32' ? 'Path' : 'PATH']: process.env.Path ?? process.env.PATH,
    SystemRoot: process.env.SystemRoot, TEMP: process.env.TEMP, TMP: process.env.TMP, CI: '1' }
  const result = spawnSync(process.execPath, args, {
    cwd, env, shell: false, windowsHide: true, encoding: 'utf8', timeout: 120_000, maxBuffer: 65_536,
  })
  return { passed: result.status === 0, code: result.error?.code === 'ETIMEDOUT' ? 'TEST_TIMEOUT' :
    result.status === 0 ? 'TEST_PASSED' : 'TEST_FAILED' }
}
function fakeReview(prepared, testsPassed) {
  return { ...prepared, decision: testsPassed ? 'pass' : 'block', findings: testsPassed ? [] :
    [{ code: 'TEST_FAILURE', message: 'Mapped test stage reported a failure.' }] }
}
function reportFiles(task, report) {
  const dir = join(task.paths.taskDirectory, 'reports')
  mkdirSync(dir, { recursive: true })
  const json = Buffer.from(`${JSON.stringify(report, null, 2)}\n`)
  const markdown = Buffer.from(`# AI Team V5 task ${task.manifest.id}\n\nState: ${report.status}\n\n` +
    `Tests: ${report.tests.map((test) => `${test.name} ${test.passed ? 'passed' : 'failed'}`).join(', ')}\n\n` +
    `Candidate paths: ${report.candidateChanges.join(', ')}\n\n` +
    `Gemini: ${report.reviews.gemini?.decision ?? 'not run'}; Copilot: ${report.reviews.copilot?.decision ?? 'skipped'}\n`)
  if (json.length > MAX_REPORT || markdown.length > MAX_REPORT) fail('WORKFLOW_OUTPUT_TOO_LARGE')
  assertNoSecretContent(json)
  assertNoSecretContent(markdown)
  const jsonName = report.status === 'awaiting_manual_approval' ? 'reports/final.json' : 'reports/blocked.json'
  const mdName = report.status === 'awaiting_manual_approval' ? 'reports/final.md' : 'reports/blocked.md'
  for (const [name, bytes] of [[jsonName, json], [mdName, markdown]]) {
    const path = join(task.paths.taskDirectory, name)
    if (existsSync(path)) {
      if (hash(readFileSync(path)) !== hash(bytes)) fail('WORKFLOW_REPORT_CONFLICT')
    } else writeFileSync(path, bytes, { flag: 'wx' })
  }
  return { [jsonName]: hash(json), [mdName]: hash(markdown) }
}
function reviewStage(stateRoot, taskId, agent, tests, impl, reviewExecutor) {
  const task = current(stateRoot, taskId)
  const prepared = prepareReview(agent, { inputHash: task.manifest.inputHash, implementationHash: impl.hash,
    testsHash: hash(JSON.stringify(tests)), findingsHash: agent === 'copilot' ?
      task.entries.findLast((item) => item.kind === 'gemini-review-verified')?.detail.payload.outputHash : null })
  const attempts = agentProcessStatus(stateRoot, taskId).filter((item) => item.agent === agent &&
    item.attemptId.startsWith(`workflow-${agent}-`))
  for (const attempt of attempts.filter((item) => item.status === 'uncertain')) {
    recordAgentProcessFinish(stateRoot, taskId, { attemptId: attempt.attemptId, status: 'cancelled',
      code: 'AGENT_SIMULATED_INTERRUPTED', actualUsd: '0' })
  }
  const succeeded = attempts.findLast((item) => item.status === 'succeeded')
  if (succeeded) {
    const name = `reviews/${succeeded.attemptId}.json`
    const path = join(task.paths.taskDirectory, name)
    if (!existsSync(path) || !assertSafeEntry(path).isFile()) fail('WORKFLOW_REVIEW_OUTPUT_MISSING')
    const bytes = readFileSync(path)
    if (hash(bytes) !== succeeded.outputHash) fail('WORKFLOW_REVIEW_OUTPUT_STALE')
    const output = validateReviewOutput(JSON.parse(bytes), prepared)
    return { output: output.output, outputHash: succeeded.outputHash, name }
  }
  const number = attempts.length + 1
  const attemptId = `workflow-${agent}-${number}`
  const callId = attemptId
  reserveAiCall(stateRoot, taskId, { callId, agent, estimatedUsd: ESTIMATE })
  recordAgentProcessStart(stateRoot, taskId, { attemptId, agent, callId, inputHash: task.manifest.inputHash })
  let output
  try { output = validateReviewOutput(reviewExecutor(prepared, tests.every((item) => item.passed)), prepared) }
  catch (error) {
    recordAgentProcessFinish(stateRoot, taskId, { attemptId, status: 'failed',
      code: 'AGENT_REVIEW_OUTPUT_INVALID', actualUsd: '0' })
    throw error
  }
  const taskAfter = current(stateRoot, taskId)
  const name = `reviews/${attemptId}.json`
  const outputHash = artifact(taskAfter.paths, name, output.output)
  base(taskAfter.manifest, stateRoot, taskId)
  if (inventory(impl.attempt).hash !== impl.hash) fail('WORKFLOW_ATTEMPT_STALE')
  recordAgentProcessFinish(stateRoot, taskId, { attemptId, status: 'succeeded',
    code: 'AGENT_SIMULATED_SUCCESS', outputHash, actualUsd: '0' })
  return { output: output.output, outputHash, name }
}

export function runWorkflow(stateRoot, taskId, {
  includeCopilot = true, testExecutor = actualTest, reviewExecutor = fakeReview,
  simulationOptions = {}, faultAt = null,
} = {}) {
  try {
    let task = current(stateRoot, taskId)
    if (!task.manifest.allowedPaths?.length) fail('WORKFLOW_SCOPE_REQUIRED')
    if (typeof testExecutor !== 'function' || typeof reviewExecutor !== 'function') fail('WORKFLOW_ADAPTER_UNAVAILABLE')
    if (task.entries.at(-1).state === 'awaiting_manual_approval') {
      const final = task.entries.findLast((entry) => entry.kind === 'workflow-report-verified')
      const report = verifiedArtifact(task, final, 'reports/final.json')
      return { status: 'awaiting_manual_approval', stage: 'awaiting_manual_approval',
        report: { 'reports/final.json': final.detail.artifacts['reports/final.json'],
          'reports/final.md': final.detail.artifacts['reports/final.md'] },
        tests: report.tests.map(({ name, passed }) => ({ name, passed })),
        budget: budgetStatus(stateRoot, taskId), agentsExecuted: false, simulated: true }
    }
    const preflight = runPreflight({ repository: task.manifest.repository, workspace: task.manifest.workspace,
      requiredEnvNames: task.manifest.requiredEnvNames ?? [], mode: 'simulated',
      ...(simulationOptions.preflightProbe ? { probe: simulationOptions.preflightProbe } : {}),
      ...(simulationOptions.preflightEnv ? { env: simulationOptions.preflightEnv } : {}),
      ...(simulationOptions.preflightNodeVersion ? { nodeVersion: simulationOptions.preflightNodeVersion } : {}) })
    if (preflight.overall !== 'ready') fail('WORKFLOW_PREFLIGHT_BLOCKED')
    base(task.manifest, stateRoot, taskId)
    if (['snapshotted', 'planned'].includes(task.entries.at(-1).state)) {
      const result = runSimulated(stateRoot, taskId, simulationOptions)
      if (result.status !== 'complete') return { status: 'blocked', diagnostic: result.diagnostic,
        stage: result.stage ?? current(stateRoot, taskId).entries.at(-1).state, agentsExecuted: false }
    }
    task = current(stateRoot, taskId)
    let state = task.entries.at(-1).state
    const impl = implementation(task)
    const scripts = JSON.parse(readFileSync(join(impl.attempt, 'package.json'), 'utf8')).scripts ?? {}
    const names = mappedTests(impl.changedPaths, scripts)
    if (state === 'implemented') {
      checkpoint(task, 'implemented', 'testing', 'tests-started', { implementationHash: impl.hash, names }, {}, impl.hash)
      task = current(stateRoot, taskId)
      state = 'testing'
    }
    if (state === 'testing') {
      for (let index = 0; index < names.length; index += 1) {
        task = current(stateRoot, taskId)
        const prior = task.entries.findLast((entry) => entry.kind === 'test-result' && entry.detail.payload.name === names[index])
        if (prior?.detail.payload.passed === true) continue
        base(task.manifest, stateRoot, taskId)
        if (inventory(impl.attempt).hash !== impl.hash) fail('WORKFLOW_ATTEMPT_STALE')
        const result = testExecutor(names[index], impl.attempt)
        if (!result || typeof result.passed !== 'boolean' || !/^TEST_[A-Z_]{2,40}$/.test(result.code)) fail('WORKFLOW_TEST_RESULT_INVALID')
        const run = task.entries.filter((entry) => entry.kind === 'test-result' && entry.detail.payload.name === names[index]).length + 1
        const name = `tests/${index + 1}-${run}.json`
        const data = { name: names[index], passed: result.passed, code: result.code, implementationHash: impl.hash }
        const outputHash = artifact(task.paths, name, data)
        base(task.manifest, stateRoot, taskId)
        if (inventory(impl.attempt).hash !== impl.hash) fail('WORKFLOW_ATTEMPT_STALE')
        checkpoint(task, 'testing', 'testing', 'test-result', { name: names[index], passed: result.passed,
          outputHash }, { [name]: outputHash }, impl.hash)
        if (faultAt === 'after-first-test') fail('WORKFLOW_INTERRUPTED')
      }
      task = current(stateRoot, taskId)
      const tests = names.map((name) => task.entries.findLast((entry) => entry.kind === 'test-result' && entry.detail.payload.name === name))
      if (tests.every(Boolean)) {
        checkpoint(task, 'testing', 'tested', 'tests-verified', { passed: tests.every((entry) => entry.detail.payload.passed),
          names, implementationHash: impl.hash }, {}, impl.hash)
      } else return { status: 'blocked', stage: 'testing', diagnostic: { category: 'tests', code: 'WORKFLOW_TEST_FAILED' },
        tests: tests.filter(Boolean).map((entry) => ({ name: entry.detail.payload.name, passed: entry.detail.payload.passed })), agentsExecuted: false }
    }
    task = current(stateRoot, taskId)
    state = task.entries.at(-1).state
    const tests = names.map((name) => {
      const entry = task.entries.findLast((item) => item.kind === 'test-result' && item.detail.payload.name === name)
      if (!entry) fail('WORKFLOW_TEST_RESULT_MISSING')
      const artifactName = Object.keys(entry.detail.artifacts)[0]
      return verifiedArtifact(task, entry, artifactName)
    })
    const allPassed = tests.every((item) => item.passed)
    if (state === 'tested') {
      const review = reviewStage(stateRoot, taskId, 'gemini', tests, impl, reviewExecutor)
      task = current(stateRoot, taskId)
      checkpoint(task, 'tested', 'reviewed', 'gemini-review-verified', { outputHash: review.outputHash,
        decision: review.output.decision }, { [review.name]: review.outputHash }, impl.hash)
      if (faultAt === 'after-gemini') fail('WORKFLOW_INTERRUPTED')
    }
    task = current(stateRoot, taskId)
    const geminiEntry = task.entries.findLast((entry) => entry.kind === 'gemini-review-verified')
    const gemini = verifiedArtifact(task, geminiEntry, Object.keys(geminiEntry.detail.artifacts)[0])
    let copilot = null
    if (includeCopilot && allPassed && gemini.decision === 'pass') {
      const prior = task.entries.findLast((entry) => entry.kind === 'copilot-review-verified')
      if (prior) copilot = verifiedArtifact(task, prior, Object.keys(prior.detail.artifacts)[0])
      else {
        const review = reviewStage(stateRoot, taskId, 'copilot', tests, impl, reviewExecutor)
        task = current(stateRoot, taskId)
        checkpoint(task, 'reviewed', 'reviewed', 'copilot-review-verified',
          { outputHash: review.outputHash, decision: review.output.decision },
          { [review.name]: review.outputHash }, impl.hash)
        copilot = review.output
      }
    }
    task = current(stateRoot, taskId)
    const approved = allPassed && gemini.decision === 'pass' && (!copilot || copilot.decision === 'pass')
    const report = { version: 1, taskId, status: approved ? 'awaiting_manual_approval' : 'blocked',
      stages: task.entries.filter((entry) => ['planning-verified', 'implementation-verified', 'tests-verified',
        'gemini-review-verified'].includes(entry.kind)).map((entry) => ({ kind: entry.kind, hash: entry.checkpointHash })),
      tests, candidateChanges: impl.changedPaths, implementationHash: impl.hash,
      reviews: { gemini, copilot }, budget: budgetStatus(stateRoot, taskId) }
    const files = reportFiles(task, report)
    if (approved && task.entries.at(-1).state === 'reviewed') {
      checkpoint(task, 'reviewed', 'awaiting_manual_approval', 'workflow-report-verified',
        { reportHash: files['reports/final.json'], copilot: Boolean(copilot) },
        files, impl.hash)
    } else if (!approved && !task.entries.some((entry) => entry.kind === 'workflow-report-blocked')) {
      checkpoint(task, 'reviewed', 'reviewed', 'workflow-report-blocked',
        { reportHash: files['reports/blocked.json'] }, files, impl.hash)
    }
    return { status: report.status, stage: approved ? 'awaiting_manual_approval' : 'reviewed', report: files,
      tests: tests.map(({ name, passed }) => ({ name, passed })), budget: report.budget,
      agentsExecuted: false, simulated: true }
  } catch (error) {
    return { status: 'blocked', diagnostic: { category: codeOf(error).includes('INTERRUPTED') ? 'interruption' : 'stage_failure',
      code: codeOf(error) }, agentsExecuted: false, simulated: true }
  }
}

export function runTrustedLocal() { fail('REAL_AGENTS_DISABLED') }
