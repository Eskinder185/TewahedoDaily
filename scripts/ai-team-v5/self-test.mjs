import assert from 'node:assert/strict'
import { EventEmitter } from 'node:events'
import { existsSync, mkdirSync, mkdtempSync, readFileSync, realpathSync, rmSync, symlinkSync, unlinkSync, writeFileSync } from 'node:fs'
import { PassThrough } from 'node:stream'
import { tmpdir } from 'node:os'
import { basename, join, resolve } from 'node:path'
import { appendCheckpoint, assessResume, createTask, inspectLock, readJournal, readTask, withTaskLock } from './state.mjs'
import { assertSeparateStateRoot, createVerifiedWorkspace, hash, inventory, isInside, rejectUnsafeEntry, taskPaths, validateWorkspacePath } from './workspace.mjs'
import { normalizeRequiredEnvNames, runPreflight } from './preflight.mjs'
import { budgetStatus, parseBudgetLimits, parseUsd, reconcileAiCall, reserveAiCall, settleAiCall } from './budget.mjs'
import { runSimulated } from './runner.mjs'
import { runWorkflow } from './workflow.mjs'
import { assessTrustedLocal } from './trusted-local.mjs'
import { agentProcessStatus, assessAgentCapabilities, buildAgentProcessSpec, prepareClaudePlanning, prepareCodexImplementation, recordAgentProcessFinish, recordAgentProcessStart, recordValidatedClaudePlan, validateAgentConfig, validateClaudePlan } from './agents.mjs'
import { executeFakeProcess, validateProcessSpec } from './process.mjs'
import { probeLiveCapabilities } from './capabilities.mjs'
import { assessPlanningIsolation, validateCodexOutput } from './isolation.mjs'
import { assessLaunchSafety, launchGuardedFakeProcess } from './live-gate.mjs'
import { createDockerTransport, defaultDockerExecutable, dockerCreateArguments, prepareOfflineFixture, probeLocalDocker, readContainerRecord, runOfflineFixture, validateImageDigest } from './container-runtime.mjs'

const temporaryRoots = []
let passed = 0
const offlineDockerRequested = process.argv.includes('--offline-docker')
if (offlineDockerRequested && (!process.argv.includes('--i-authorize-local-container-execution') ||
    process.env.TEWAHEDO_V5_ALLOW_OFFLINE_DOCKER !== '1')) {
  throw new Error('LOCAL_CONTAINER_EXECUTION_DISABLED')
}

function fixture() {
  if (isInside(realpathSync(process.cwd()), realpathSync(tmpdir()))) throw new Error('OFFLINE_FIXTURE_ROOT_UNSAFE')
  const base = mkdtempSync(join(tmpdir(), 'tewahedo-v5-selftest-'))
  temporaryRoots.push(base)
  const repository = join(base, 'repository')
  const stateRoot = join(base, 'state')
  mkdirSync(join(repository, 'src'), { recursive: true })
  writeFileSync(join(repository, 'src', 'example.ts'), 'export const value = 1\n')
  writeFileSync(join(repository, 'package.json'), '{"name":"fixture","private":true}\n')
  writeFileSync(join(base, 'secret-sentinel'), 'unmounted fixture sentinel\n')
  return { base, repository, stateRoot }
}

function started(options = {}) {
  const item = fixture()
  const source = inventory(item.repository)
  const manifest = createTask(item.stateRoot, item.repository, 'Update src/example.ts', source, options)
  const paths = taskPaths(item.stateRoot, manifest.id)
  withTaskLock(paths.taskDirectory, () => {
    createVerifiedWorkspace(item.repository, item.stateRoot, manifest.id, source)
    appendCheckpoint(paths.taskDirectory, {
      from: 'created', to: 'snapshotted', kind: 'snapshot-verified',
      inputHash: manifest.inputHash, workspaceHash: source.hash,
      payload: { snapshotHash: source.hash, workspace: paths.workspace },
    })
  })
  return { ...item, manifest, paths, source }
}

function preflightFixture() {
  const item = fixture()
  writeFileSync(join(item.repository, 'package.json'), JSON.stringify({ scripts: { 'test:journeys': 'node scripts/playwright-journeys.mjs' } }))
  writeFileSync(join(item.repository, 'package-lock.json'), JSON.stringify({ lockfileVersion: 3 }))
  mkdirSync(join(item.repository, 'scripts'))
  writeFileSync(join(item.repository, 'scripts', 'playwright-journeys.mjs'), '')
  mkdirSync(join(item.repository, 'node_modules'))
  for (const path of [
    join(item.repository, 'node_modules', 'vite', 'bin', 'vite.js'),
    join(item.repository, 'node_modules', 'typescript', 'bin', 'tsc'),
    join(item.repository, 'node_modules', 'playwright', 'package.json'),
  ]) {
    mkdirSync(join(path, '..'), { recursive: true })
    writeFileSync(path, '')
  }
  const npmCli = join(item.base, 'npm-cli.js')
  const browser = join(item.base, 'chromium.exe')
  writeFileSync(npmCli, '')
  writeFileSync(browser, '')
  const invocations = []
  const probe = {
    exists: existsSync,
    find(command) { return command === 'git.exe' || command === 'git' ? 'git.exe' : `agent-${command}` },
    run(command, args) {
      invocations.push({ command, args })
      return { status: 0, output: command === 'git.exe' ? 'git version 2.45.0' : '10.9.0' }
    },
    browserExecutable() { return browser },
  }
  return { ...item, npmCli, browser, probe, invocations }
}

function simulated(config = null, budget = parseBudgetLimits('6', '1.00')) {
  const item = preflightFixture()
  const source = inventory(item.repository)
  const manifest = createTask(item.stateRoot, item.repository, 'Update src/example.ts', source, {
    budget, allowedPaths: ['src/example.ts'], requiredEnvNames: ['TEST_REQUIRED'],
    agentConfig: config,
  })
  const paths = taskPaths(item.stateRoot, manifest.id)
  withTaskLock(paths.taskDirectory, () => {
    createVerifiedWorkspace(item.repository, item.stateRoot, manifest.id, source)
    appendCheckpoint(paths.taskDirectory, {
      from: 'created', to: 'snapshotted', kind: 'snapshot-verified',
      inputHash: manifest.inputHash, workspaceHash: source.hash,
      payload: { snapshotHash: source.hash, workspace: paths.workspace },
    })
  })
  const options = { preflightProbe: item.probe, preflightEnv: { npm_execpath: item.npmCli, TEST_REQUIRED: 'present' }, preflightNodeVersion: '22.18.0' }
  return { ...item, manifest, paths, options }
}

function test(name, fn) {
  try {
    fn()
    passed += 1
    console.log(`ok ${name}`)
  } catch (error) {
    console.error(`FAIL ${name}: ${error.message}`)
    throw error
  }
}

async function testAsync(name, fn) {
  try {
    await fn()
    passed += 1
    console.log(`ok ${name}`)
  } catch (error) {
    console.error(`FAIL ${name}: ${error.message}`)
    throw error
  }
}

const agentConfig = { claude: { modelId: 'claude-exact-test', effort: 'high' },
  codex: { modelId: 'codex-exact-test', effort: 'medium' } }

function fakeChild({ output = '{}', exitCode = 0, neverClose = false } = {}) {
  const child = new EventEmitter()
  child.stdout = new PassThrough()
  child.stderr = new PassThrough()
  child.kill = () => { if (!neverClose) queueMicrotask(() => child.emit('close', null)); return true }
  if (!neverClose) queueMicrotask(() => {
    child.stdout.write(output)
    child.emit('close', exitCode)
  })
  return child
}

const fakeImage = `example/v5-fixture@sha256:${'a'.repeat(64)}`
const fakeImageId = `sha256:${'b'.repeat(64)}`
const fakeContainerId = 'c'.repeat(64)

function fakeDocker(prepared, { mismatch = null, start = 'complete', stop = 'confirmed', cleanup = 'confirmed', create = 'complete' } = {}) {
  const calls = []
  let created = false
  let running = false
  const createArgs = dockerCreateArguments(prepared, fakeImageId)
  const evidence = ['privileges', 'resources', 'sentinel_denied', 'network_denied', 'root_readonly',
    ...(prepared.kind === 'planning' ? ['snapshot_readonly'] : ['plan_readonly', 'work_write'])]
    .map((key) => `${key}=ok`).concat(`fixture=V5_OFFLINE_V1:${prepared.kind}`).join('\n') + '\n'
  const inspected = () => {
    const value = {
      Id: fakeContainerId, Image: fakeImageId, Name: `/${prepared.name}`,
      State: { Running: running },
      HostConfig: { NetworkMode: 'none', ReadonlyRootfs: true, Privileged: false, PidMode: '',
        IpcMode: 'none', CgroupnsMode: 'private', UTSMode: '', UsernsMode: '',
        PidsLimit: 64, Memory: 1073741824, MemorySwap: 1073741824,
        NanoCpus: 2_000_000_000, CapDrop: ['ALL'], SecurityOpt: ['no-new-privileges:true'],
        Init: true, StopTimeout: 5, PortBindings: null, Devices: [], Binds: [],
        Tmpfs: { '/tmp': 'rw,nosuid,noexec,size=64m,mode=1777,uid=10001,gid=10001',
          '/home/agent': 'rw,nosuid,noexec,size=32m,mode=0700,uid=10001,gid=10001' } },
      Config: { User: '10001:10001', WorkingDir: prepared.kind === 'planning' ? '/task/source' : '/task/work',
        Entrypoint: ['/bin/sh'], Cmd: createArgs.slice(createArgs.indexOf(fakeImageId) + 1),
        Labels: { 'tewahedo.v5.policy': prepared.policyHash, 'tewahedo.v5.attempt': prepared.attemptId },
        Env: ['HOME=/home/agent', 'PATH=/usr/bin'] },
      Mounts: prepared.mounts.map((mount) => ({ Type: 'bind', Source: mount.source,
        Destination: mount.target, RW: !mount.readOnly })),
    }
    if (mismatch === 'network') value.HostConfig.NetworkMode = 'bridge'
    if (mismatch === 'mount') value.Mounts[0].Source = prepared.repository
    if (mismatch === 'writable-root') value.HostConfig.ReadonlyRootfs = false
    if (mismatch === 'unexpected-mount') value.Mounts.push({ Type: 'volume', Source: '/var/lib/docker/volumes/extra', Destination: '/data', RW: true })
    if (mismatch === 'entrypoint') value.Config.Entrypoint = ['docker-entrypoint.sh']
    if (mismatch === 'label') value.Config.Labels['tewahedo.v5.policy'] = 'unrelated'
    return value
  }
  return { kind: 'fake', calls, inspected,
    async run(args) {
      calls.push(args)
      if (args[0] === 'context') return { status: 0, stdout: JSON.stringify({
        Endpoints: { docker: { Host: 'npipe:////./pipe/docker_engine' } },
      }) }
      if (args[0] === 'info') return { status: 0, stdout: JSON.stringify({ OSType: 'linux' }) }
      if (args[0] === 'image') return { status: 0, stdout: JSON.stringify({ Os: 'linux', Id: fakeImageId,
        RepoDigests: [fakeImage], Config: { Volumes: mismatch === 'image-volume' ? { '/data': {} } : null,
          Shell: mismatch === 'missing-shell' ? null : ['/bin/sh', '-c'] } }) }
      if (args[0] === 'container' && args[1] === 'inspect') {
        if (!created) return { status: 1, stdout: '' }
        return { status: 0, stdout: JSON.stringify(inspected()) }
      }
      if (args[0] === 'create') { created = true; return create === 'uncertain'
        ? { status: null, timedOut: true, stdout: '' }
        : { status: 0, stdout: `${fakeContainerId}\n` } }
      if (args[0] === 'start') {
        if (prepared.kind === 'implementation' && start === 'complete') {
          writeFileSync(join(prepared.attemptPath, 'src/example.ts'), 'export const value = 2\n')
        }
        running = start === 'timeout' || start === 'cancel'
        if (start === 'timeout') return { status: null, timedOut: true, stdout: '' }
        if (start === 'cancel') return { status: null, cancelled: true, stdout: '' }
        if (start === 'missing-fixture') return { status: 127, stdout: '' }
        return { status: 0, stdout: start === 'invalid-output' ? 'fixture passed' : evidence }
      }
      if (args[0] === 'stop') {
        if (stop === 'confirmed') running = false
        return { status: stop === 'confirmed' ? 0 : 1, stdout: '' }
      }
      if (args[0] === 'kill') {
        if (stop === 'kill-confirmed') running = false
        return { status: stop === 'unconfirmed' ? 1 : 0, stdout: '' }
      }
      if (args[0] === 'rm') {
        if (cleanup === 'confirmed') created = false
        return { status: cleanup === 'confirmed' ? 0 : 1, stdout: '' }
      }
      throw new Error('UNEXPECTED_FAKE_DOCKER_COMMAND')
    },
  }
}

async function offlineOptIn(work) {
  const previous = process.env.TEWAHEDO_V5_ALLOW_OFFLINE_DOCKER
  process.env.TEWAHEDO_V5_ALLOW_OFFLINE_DOCKER = '1'
  try { return await work() } finally {
    if (previous === undefined) delete process.env.TEWAHEDO_V5_ALLOW_OFFLINE_DOCKER
    else process.env.TEWAHEDO_V5_ALLOW_OFFLINE_DOCKER = previous
  }
}

function offlineImplementation() {
  const item = started({ allowedPaths: ['src/example.ts'] })
  const plans = join(item.paths.taskDirectory, 'plans')
  mkdirSync(plans)
  const planPath = join(plans, 'fixture-plan.json')
  writeFileSync(planPath, '{"version":1}\n')
  withTaskLock(item.paths.taskDirectory, () => appendCheckpoint(item.paths.taskDirectory, {
    from: 'snapshotted', to: 'planned', kind: 'fixture-plan-verified',
    inputHash: item.manifest.inputHash, workspaceHash: item.source.hash,
    artifacts: { 'plans/fixture-plan.json': hash(readFileSync(planPath)) },
  }))
  const attemptPath = join(item.paths.taskDirectory, 'attempts', 'implementation-1')
  mkdirSync(attemptPath, { recursive: true })
  for (const file of inventory(item.paths.snapshot).files) {
    const destination = join(attemptPath, file.path)
    mkdirSync(join(destination, '..'), { recursive: true })
    writeFileSync(destination, readFileSync(join(item.paths.snapshot, file.path)))
  }
  return { ...item, attemptPath, planPath }
}

try {
  test('verified snapshot and durable task identity', () => {
    const item = started()
    assert.equal(readJournal(item.paths.taskDirectory).length, 2)
    assert.equal(assessResume(item.stateRoot, item.manifest.id).overall, 'reusable')
    assert.equal(inventory(item.paths.snapshot).hash, item.source.hash)
    assert.equal(inventory(item.paths.workspace).hash, item.source.hash)
  })

  test('repeated dry-run resume does not append records', () => {
    const item = started()
    const first = assessResume(item.stateRoot, item.manifest.id)
    const second = assessResume(item.stateRoot, item.manifest.id)
    assert.deepEqual(second, first)
    assert.equal(readJournal(item.paths.taskDirectory).length, 2)
    assert.equal(first.checkpoints.find((entry) => entry.state === 'planned').status, 'missing')
  })

  test('crash before snapshot leaves a resumable created checkpoint', () => {
    const item = fixture()
    const source = inventory(item.repository)
    const manifest = createTask(item.stateRoot, item.repository, 'Update src/example.ts', source)
    const report = assessResume(item.stateRoot, manifest.id)
    assert.equal(report.state, 'created')
    assert.equal(report.overall, 'reusable')
    assert.equal(report.checkpoints.find((entry) => entry.state === 'snapshotted').status, 'missing')
    assert.equal(report.next, 'snapshotted')
  })

  test('invalid transition is rejected under the task lock', () => {
    const item = started()
    assert.throws(() => withTaskLock(item.paths.taskDirectory, () => appendCheckpoint(item.paths.taskDirectory, {
      from: 'snapshotted', to: 'implemented', kind: 'invalid',
      inputHash: item.manifest.inputHash, workspaceHash: item.source.hash,
    })), /INVALID_TRANSITION_TARGET/)
    assert.equal(readJournal(item.paths.taskDirectory).length, 2)
  })

  test('checkpoint writes require the exclusive lock', () => {
    const item = started()
    assert.throws(() => appendCheckpoint(item.paths.taskDirectory, {
      from: 'snapshotted', to: 'planned', kind: 'plan-validated',
      inputHash: item.manifest.inputHash, workspaceHash: item.source.hash,
    }), /TASK_LOCK_REQUIRED/)
  })

  test('active lock excludes a second writer', () => {
    const item = started()
    withTaskLock(item.paths.taskDirectory, () => {
      assert.equal(inspectLock(item.paths.taskDirectory).status, 'active')
      assert.throws(() => withTaskLock(item.paths.taskDirectory, () => {}), /TASK_LOCK_ACTIVE/)
    })
    assert.equal(inspectLock(item.paths.taskDirectory).status, 'none')
  })

  test('stale lock is detected but never stolen', () => {
    const item = started()
    const path = join(item.paths.taskDirectory, 'lock.json')
    writeFileSync(path, JSON.stringify({ version: 1, pid: 999999, token: 'stale', createdAt: new Date().toISOString() }))
    assert.equal(inspectLock(item.paths.taskDirectory).status, 'stale')
    assert.throws(() => withTaskLock(item.paths.taskDirectory, () => {}), /TASK_LOCK_STALE/)
    assert.equal(existsSync(path), true)
  })

  test('changed repository inputs invalidate existing checkpoints', () => {
    const item = started()
    writeFileSync(join(item.repository, 'src', 'example.ts'), 'export const value = 2\n')
    const report = assessResume(item.stateRoot, item.manifest.id)
    assert.equal(report.overall, 'stale')
    assert.equal(report.checkpoints.find((entry) => entry.state === 'snapshotted').status, 'stale')
  })

  test('changed plan artifact invalidates later review approval', () => {
    const item = started()
    const plan = join(item.paths.taskDirectory, 'plan.txt')
    writeFileSync(plan, 'validated plan\n')
    const stages = [
      ['snapshotted', 'planned'], ['planned', 'implemented'], ['implemented', 'testing'],
      ['testing', 'tested'], ['tested', 'reviewed'],
      ['reviewed', 'awaiting_manual_approval'], ['awaiting_manual_approval', 'approval_recorded'],
    ]
    withTaskLock(item.paths.taskDirectory, () => {
      for (const [from, to] of stages) {
        appendCheckpoint(item.paths.taskDirectory, {
          from, to, kind: `fake-${to.replaceAll('_', '-')}`,
          inputHash: item.manifest.inputHash, workspaceHash: item.source.hash,
          artifacts: to === 'planned' ? { 'plan.txt': hash(readFileSync(plan)) } : {},
        })
      }
    })
    assert.equal(assessResume(item.stateRoot, item.manifest.id).overall, 'reusable')
    writeFileSync(plan, 'changed plan\n')
    const report = assessResume(item.stateRoot, item.manifest.id)
    assert.equal(report.overall, 'stale')
    assert.equal(report.checkpoints.find((entry) => entry.state === 'approval_recorded').status, 'stale')
  })

  test('missing checkpoint artifact is reported without repair', () => {
    const item = started()
    const plan = join(item.paths.taskDirectory, 'plan.txt')
    writeFileSync(plan, 'validated plan\n')
    withTaskLock(item.paths.taskDirectory, () => appendCheckpoint(item.paths.taskDirectory, {
      from: 'snapshotted', to: 'planned', kind: 'plan-validated',
      inputHash: item.manifest.inputHash, workspaceHash: item.source.hash,
      artifacts: { 'plan.txt': hash(readFileSync(plan)) },
    }))
    unlinkSync(plan)
    const report = assessResume(item.stateRoot, item.manifest.id)
    assert.equal(report.overall, 'missing')
    assert.equal(report.checkpoints.find((entry) => entry.state === 'planned').status, 'missing')
  })

  test('corrupt checkpoint hash fails closed', () => {
    const item = started()
    writeFileSync(join(item.paths.taskDirectory, 'checkpoints', '000002.json'), '{"tampered":true}\n')
    assert.equal(assessResume(item.stateRoot, item.manifest.id).overall, 'corrupted')
  })

  test('corrupt journal hash chain fails closed', () => {
    const item = started()
    const path = join(item.paths.taskDirectory, 'journal', '000002.json')
    const entry = JSON.parse(readFileSync(path, 'utf8'))
    entry.previousHash = '0'.repeat(64)
    writeFileSync(path, `${JSON.stringify(entry)}\n`)
    assert.equal(assessResume(item.stateRoot, item.manifest.id).overall, 'corrupted')
  })

  test('completed checkpoint without a journal entry is rejected', () => {
    const item = started()
    writeFileSync(join(item.paths.taskDirectory, 'checkpoints', '000003.json'), '{}\n')
    assert.equal(assessResume(item.stateRoot, item.manifest.id).overall, 'corrupted')
  })

  test('interrupted checkpoint write is retained and rejected', () => {
    const item = started()
    const partial = join(item.paths.taskDirectory, 'checkpoints', '000003.json.interrupted.tmp')
    writeFileSync(partial, '{')
    assert.equal(assessResume(item.stateRoot, item.manifest.id).overall, 'corrupted')
    assert.equal(existsSync(partial), true)
  })

  test('interrupted journal write is retained and rejected', () => {
    const item = started()
    const partial = join(item.paths.taskDirectory, 'journal', '000003.json.interrupted.tmp')
    writeFileSync(partial, '{')
    assert.equal(assessResume(item.stateRoot, item.manifest.id).overall, 'corrupted')
    assert.equal(existsSync(partial), true)
  })

  test('modified workspace and snapshot are not reused', () => {
    const workspaceItem = started()
    writeFileSync(join(workspaceItem.paths.workspace, 'src', 'example.ts'), 'changed\n')
    assert.equal(assessResume(workspaceItem.stateRoot, workspaceItem.manifest.id).overall, 'stale')
    const snapshotItem = started()
    writeFileSync(join(snapshotItem.paths.snapshot, 'src', 'example.ts'), 'changed\n')
    assert.equal(assessResume(snapshotItem.stateRoot, snapshotItem.manifest.id).overall, 'corrupted')
  })

  test('workspace escape and state-root overlap are rejected', () => {
    const item = started()
    assert.throws(() => validateWorkspacePath(item.stateRoot, item.manifest.id, item.repository), /WORKSPACE_PATH_MISMATCH/)
    assert.throws(() => taskPaths(item.stateRoot, '..\\escape'), /INVALID_TASK_ID/)
    assert.throws(() => assertSeparateStateRoot(item.repository, join(item.repository, 'state')), /STATE_ROOT_OVERLAP/)
  })

  test('symlinked source file is rejected', () => {
    const item = fixture()
    const target = join(item.base, 'outside.txt')
    writeFileSync(target, 'outside\n')
    try {
      symlinkSync(target, join(item.repository, 'src', 'linked.txt'), 'file')
      assert.throws(() => inventory(item.repository), /UNSAFE_LINK_OR_JUNCTION/)
    } catch (error) {
      if (error?.code !== 'EPERM') throw error
      assert.throws(() => rejectUnsafeEntry({
        isSymbolicLink: () => true, isDirectory: () => false, isFile: () => false,
      }), /UNSAFE_LINK_OR_JUNCTION/)
      console.log('  Windows denied symlink creation; rejection policy exercised with a synthetic entry')
    }
  })

  test('junctioned source directory is rejected', () => {
    const item = fixture()
    const target = join(item.base, 'outside')
    mkdirSync(target)
    try {
      symlinkSync(target, join(item.repository, 'src', 'junction'), 'junction')
      assert.throws(() => inventory(item.repository), /UNSAFE_LINK_OR_JUNCTION/)
    } catch (error) {
      if (error?.code !== 'EPERM') throw error
      assert.throws(() => rejectUnsafeEntry({
        isSymbolicLink: () => false, reparsePoint: true, isDirectory: () => true, isFile: () => false,
      }), /UNSAFE_LINK_OR_JUNCTION/)
      console.log('  Windows denied junction creation; rejection policy exercised with a synthetic entry')
    }
  })

  test('sensitive names and content fail closed', () => {
    const named = fixture()
    writeFileSync(join(named.repository, 'src', 'password.txt'), 'redacted')
    assert.throws(() => inventory(named.repository), /SENSITIVE_FILE_NAME/)
    const content = fixture()
    writeFileSync(join(content.repository, 'src', 'example.ts'), 'client_secret="live-not-printable-value"\n')
    assert.throws(() => inventory(content.repository), /SENSITIVE_FILE_CONTENT/)
  })

  test('preflight reports supported tools without running agent CLIs', () => {
    const item = preflightFixture()
    const report = runPreflight({
      repository: item.repository, probe: item.probe,
      env: { npm_execpath: item.npmCli, PUBLIC_NAME: 'not-to-be-printed' },
      requiredEnvNames: ['PUBLIC_NAME'], nodeVersion: '22.18.0',
    })
    assert.equal(report.overall, 'unverified')
    assert.equal(report.checks.find((check) => check.id === 'npm').status, 'pass')
    assert.equal(report.checks.find((check) => check.id === 'chromium').status, 'pass')
    assert.equal(report.checks.find((check) => check.id === 'env:PUBLIC_NAME').status, 'pass')
    assert.equal(report.checks.filter((check) => check.id.startsWith('agent:')).length, 4)
    assert.equal(item.invocations.every(({ command }) => command === process.execPath || command === 'git.exe'), true)
    assert.equal(JSON.stringify(report).includes('not-to-be-printed'), false)
  })

  test('preflight distinguishes unavailable tools and missing configuration', () => {
    const item = fixture()
    const probe = {
      exists: (path) => path.startsWith(item.repository) && existsSync(path),
      find: () => null,
      run: () => { throw new Error('tool must not run') },
      browserExecutable: () => { throw new Error('browser missing') },
    }
    const report = runPreflight({ repository: item.repository, probe, env: {}, requiredEnvNames: ['PUBLIC_NAME'] })
    assert.equal(report.overall, 'blocked')
    assert.equal(report.checks.find((check) => check.id === 'npm').category, 'unavailable_tool')
    assert.equal(report.checks.find((check) => check.id === 'lockfile').category, 'missing_configuration')
    assert.equal(report.checks.find((check) => check.id === 'env:PUBLIC_NAME').code, 'ENV_MISSING')
  })

  test('preflight rejects malformed configuration and unsupported versions', () => {
    assert.throws(() => normalizeRequiredEnvNames('BAD-NAME'), /INVALID_ENV_NAMES/)
    assert.throws(() => normalizeRequiredEnvNames('VALID,VALID'), /INVALID_ENV_NAMES/)
    const item = preflightFixture()
    const oldProbe = { ...item.probe, run: (command) => ({ status: 0, output: command === 'git.exe' ? 'git version 2.10.0' : '9.0.0' }) }
    const report = runPreflight({ repository: item.repository, probe: oldProbe,
      env: { npm_execpath: item.npmCli }, requiredEnvNames: ['bad-name'], nodeVersion: '18.0.0' })
    assert.equal(report.checks.find((check) => check.id === 'node').category, 'unsupported_version')
    assert.equal(report.checks.find((check) => check.id === 'npm').category, 'unsupported_version')
    assert.equal(report.checks.find((check) => check.id === 'git').category, 'unsupported_version')
    assert.equal(report.checks.find((check) => check.id === 'required-env').category, 'invalid_configuration')
    const invalidPath = runPreflight({ repository: item.repository, probe: item.probe,
      env: { npm_execpath: join(item.base, 'missing-npm-cli.js') }, nodeVersion: '22.18.0' })
    assert.equal(invalidPath.checks.find((check) => check.id === 'npm').category, 'invalid_path')
  })

  test('budget limits are parsed without floating-point drift', () => {
    assert.deepEqual(parseBudgetLimits('2', '1.250001'), { maxAiCalls: 2, maxEstimatedMicroUsd: 1_250_001 })
    assert.equal(parseUsd('0.000001'), 1)
    assert.throws(() => parseBudgetLimits('-1', '1'), /BUDGET_CALL_LIMIT_INVALID/)
    assert.throws(() => parseBudgetLimits('1', '1.1234567'), /BUDGET_AMOUNT_INVALID/)
  })

  test('default zero budget blocks paid reservations', () => {
    const item = started()
    assert.equal(budgetStatus(item.stateRoot, item.manifest.id).code, 'BUDGET_EXHAUSTED')
    assert.throws(() => reserveAiCall(item.stateRoot, item.manifest.id, {
      callId: 'planning-1', agent: 'claude', estimatedUsd: '0.10',
    }), /BUDGET_CALL_LIMIT_EXCEEDED/)
  })

  test('duplicate reservation and settlement do not double charge', () => {
    const item = started({ budget: parseBudgetLimits('2', '1.00') })
    const request = { callId: 'planning-1', agent: 'claude', estimatedUsd: '0.40' }
    assert.equal(reserveAiCall(item.stateRoot, item.manifest.id, request).status, 'reserved')
    const count = readJournal(item.paths.taskDirectory).length
    assert.equal(reserveAiCall(item.stateRoot, item.manifest.id, request).status, 'duplicate')
    assert.equal(readJournal(item.paths.taskDirectory).length, count)
    assert.equal(settleAiCall(item.stateRoot, item.manifest.id, { callId: 'planning-1', actualUsd: '0.35', reliable: true }).status, 'settled')
    const settledCount = readJournal(item.paths.taskDirectory).length
    assert.equal(settleAiCall(item.stateRoot, item.manifest.id, { callId: 'planning-1', actualUsd: '0.35', reliable: true }).status, 'duplicate')
    assert.equal(readJournal(item.paths.taskDirectory).length, settledCount)
    assert.equal(budgetStatus(item.stateRoot, item.manifest.id).chargedUsd, '0.400000')
  })

  test('pending and unknown usage block later paid calls after interruption', () => {
    const item = started({ budget: parseBudgetLimits('3', '2.00') })
    reserveAiCall(item.stateRoot, item.manifest.id, { callId: 'planning-1', agent: 'claude', estimatedUsd: '0.40' })
    assert.equal(assessResume(item.stateRoot, item.manifest.id).overall, 'reusable')
    assert.equal(budgetStatus(item.stateRoot, item.manifest.id).code, 'BUDGET_USAGE_UNRECONCILED')
    assert.throws(() => reserveAiCall(item.stateRoot, item.manifest.id, {
      callId: 'planning-2', agent: 'claude', estimatedUsd: '0.20',
    }), /BUDGET_USAGE_UNRECONCILED/)
    settleAiCall(item.stateRoot, item.manifest.id, { callId: 'planning-1', reliable: false })
    assert.equal(budgetStatus(item.stateRoot, item.manifest.id).calls[0].status, 'unknown')
    assert.throws(() => reserveAiCall(item.stateRoot, item.manifest.id, {
      callId: 'planning-2', agent: 'claude', estimatedUsd: '0.20',
    }), /BUDGET_USAGE_UNRECONCILED/)
    assert.equal(reconcileAiCall(item.stateRoot, item.manifest.id, { callId: 'planning-1', actualUsd: '0.55' }).status, 'settled')
    const count = readJournal(item.paths.taskDirectory).length
    assert.equal(reconcileAiCall(item.stateRoot, item.manifest.id, { callId: 'planning-1', actualUsd: '0.55' }).status, 'duplicate')
    assert.equal(readJournal(item.paths.taskDirectory).length, count)
    assert.equal(reserveAiCall(item.stateRoot, item.manifest.id, {
      callId: 'planning-2', agent: 'claude', estimatedUsd: '0.20',
    }).status, 'reserved')
  })

  test('cost and call caps reject over-budget reservations', () => {
    const item = started({ budget: parseBudgetLimits('1', '0.50') })
    assert.throws(() => reserveAiCall(item.stateRoot, item.manifest.id, {
      callId: 'planning-1', agent: 'claude', estimatedUsd: '0.51',
    }), /BUDGET_COST_LIMIT_EXCEEDED/)
    reserveAiCall(item.stateRoot, item.manifest.id, { callId: 'planning-1', agent: 'claude', estimatedUsd: '0.40' })
    settleAiCall(item.stateRoot, item.manifest.id, { callId: 'planning-1', actualUsd: '0.45', reliable: true })
    assert.throws(() => reserveAiCall(item.stateRoot, item.manifest.id, {
      callId: 'planning-2', agent: 'claude', estimatedUsd: '0.01',
    }), /BUDGET_CALL_LIMIT_EXCEEDED/)
    assert.equal(budgetStatus(item.stateRoot, item.manifest.id).chargedUsd, '0.450000')
  })

  test('stale inputs block budget reservations on resume', () => {
    const item = started({ budget: parseBudgetLimits('2', '1.00') })
    writeFileSync(join(item.repository, 'src', 'example.ts'), 'changed\n')
    assert.throws(() => reserveAiCall(item.stateRoot, item.manifest.id, {
      callId: 'planning-1', agent: 'claude', estimatedUsd: '0.10',
    }), /BUDGET_CHECKPOINT_INVALID/)
  })

  test('simulated planning and implementation complete with verified checkpoints', () => {
    const item = simulated()
    const result = runSimulated(item.stateRoot, item.manifest.id, item.options)
    assert.equal(result.status, 'complete')
    assert.equal(result.stage, 'implemented')
    assert.equal(result.agentsExecuted, false)
    assert.equal(assessResume(item.stateRoot, item.manifest.id).overall, 'reusable')
    assert.equal(budgetStatus(item.stateRoot, item.manifest.id).usedCalls, 2)
    assert.equal(readJournal(item.paths.taskDirectory).filter((entry) => entry.kind === 'planning-verified').length, 1)
    assert.equal(readJournal(item.paths.taskDirectory).filter((entry) => entry.kind === 'implementation-verified').length, 1)
    assert.equal(readFileSync(join(item.repository, 'src/example.ts'), 'utf8'), 'export const value = 1\n')
  })

  test('repeated simulated resume reuses planning and implementation without charges', () => {
    const item = simulated()
    runSimulated(item.stateRoot, item.manifest.id, item.options)
    const count = readJournal(item.paths.taskDirectory).length
    assert.equal(runSimulated(item.stateRoot, item.manifest.id, item.options).status, 'complete')
    assert.equal(readJournal(item.paths.taskDirectory).length, count)
  })

  test('interrupted planning resumes with a new idempotent reservation', () => {
    const item = simulated()
    const first = runSimulated(item.stateRoot, item.manifest.id, { ...item.options, faultAt: 'planning-after-output' })
    assert.equal(first.diagnostic.code, 'SIM_PLANNING_INTERRUPTED')
    assert.equal(budgetStatus(item.stateRoot, item.manifest.id).calls[0].status, 'pending')
    assert.equal(runSimulated(item.stateRoot, item.manifest.id, item.options).status, 'complete')
    assert.equal(budgetStatus(item.stateRoot, item.manifest.id).usedCalls, 3)
    assert.equal(readJournal(item.paths.taskDirectory).filter((entry) => entry.kind === 'planning-verified').length, 1)
  })

  test('interrupted implementation preserves partial attempt and resumes from a new one', () => {
    const item = simulated()
    const first = runSimulated(item.stateRoot, item.manifest.id, { ...item.options, faultAt: 'implementation-after-edit' })
    assert.equal(first.diagnostic.code, 'SIM_IMPLEMENTATION_INTERRUPTED')
    const partial = join(item.paths.taskDirectory, 'attempts', 'implementation-1', 'src/example.ts')
    assert.equal(existsSync(partial), true)
    assert.equal(runSimulated(item.stateRoot, item.manifest.id, item.options).status, 'complete')
    const completed = join(item.paths.taskDirectory, 'attempts', 'implementation-2', 'src/example.ts')
    assert.equal(existsSync(completed), true)
    assert.equal(existsSync(partial), true)
    assert.equal(budgetStatus(item.stateRoot, item.manifest.id).usedCalls, 3)
  })

  test('invalid planning output and unauthorized implementation are rejected', () => {
    const planItem = simulated()
    const invalid = runSimulated(planItem.stateRoot, planItem.manifest.id, {
      ...planItem.options, planAgent: () => ({ allowedPaths: ['src/other.ts'] }),
    })
    assert.equal(invalid.diagnostic.code, 'SIM_PLAN_OUTPUT_INVALID')
    const item = simulated()
    const result = runSimulated(item.stateRoot, item.manifest.id, {
      ...item.options, implementAgent: (attempt, path) => {
        writeFileSync(join(attempt, path), 'changed\n')
        writeFileSync(join(attempt, '.env'), 'suspicious\n')
      },
    })
    assert.equal(result.diagnostic.code, 'SIM_OUTPUT_UNAUTHORIZED_PATH')
    assert.equal(assessResume(item.stateRoot, item.manifest.id).state, 'planned')
  })

  test('workspace escape and corrupt implementation output are rejected', () => {
    const invalidScope = fixture()
    assert.throws(() => createTask(invalidScope.stateRoot, invalidScope.repository, 'Escape workspace',
      inventory(invalidScope.repository), { allowedPaths: ['src/../outside.ts'] }), /INVALID_ALLOWED_PATHS/)
    const item = simulated()
    const result = runSimulated(item.stateRoot, item.manifest.id, {
      ...item.options, implementAgent: (attempt) => {
        writeFileSync(join(attempt, 'src/example.ts'), 'changed\n')
        writeFileSync(join(attempt, 'src/other.ts'), 'outside scope\n')
      },
    })
    assert.equal(result.diagnostic.code, 'SIM_OUTPUT_UNAUTHORIZED_PATH')
    const complete = simulated()
    assert.equal(runSimulated(complete.stateRoot, complete.manifest.id, complete.options).status, 'complete')
    writeFileSync(join(complete.paths.taskDirectory, 'attempts/implementation-1/src/example.ts'), 'corrupt\n')
    assert.equal(assessResume(complete.stateRoot, complete.manifest.id).overall, 'stale')
  })

  test('simulated execution requires preflight and budget', () => {
    const item = simulated()
    const blocked = runSimulated(item.stateRoot, item.manifest.id, { ...item.options, preflightEnv: {} })
    assert.equal(blocked.diagnostic.code, 'SIM_PREFLIGHT_BLOCKED')
    assert.equal(readJournal(item.paths.taskDirectory).length, 2)
    const noBudget = started({ allowedPaths: ['src/example.ts'] })
    const report = runSimulated(noBudget.stateRoot, noBudget.manifest.id, item.options)
    assert.equal(report.status, 'blocked')
  })

  test('exact model configuration and authenticated capabilities fail closed', () => {
    assert.equal(validateAgentConfig(agentConfig), agentConfig)
    assert.throws(() => validateAgentConfig({ ...agentConfig, claude: { modelId: '', effort: 'high' } }), /AGENT_CONFIG_INVALID/)
    assert.equal(assessAgentCapabilities(agentConfig).overall, 'blocked')
    const available = assessAgentCapabilities(agentConfig, (agent, requested) => ({
      ...requested, available: true, authenticated: true, modelAvailable: true, effortSupported: true,
      ...(agent === 'codex' ? { modelId: 'different-model' } : {}),
    }))
    assert.equal(available.checks.find((item) => item.agent === 'codex').code, 'AGENT_MODEL_UNAVAILABLE')
    assert.equal(assessAgentCapabilities(agentConfig, (_agent, requested) => ({
      ...requested, available: true, authenticated: true, modelAvailable: true, effortSupported: true,
    })).overall, 'ready')
  })

  test('Claude context is snapshot-only and plans require exact scope and model', () => {
    const item = simulated()
    const context = prepareClaudePlanning(item.stateRoot, item.manifest.id, agentConfig, ['src/example.ts'])
    assert.equal(context.writeRoot, null)
    assert.equal(context.snapshot, item.paths.snapshot)
    assert.equal(context.files[0].content, 'export const value = 1\n')
    const plan = { version: 1, inputHash: item.manifest.inputHash, objectiveHash: context.objectiveHash,
      modelId: agentConfig.claude.modelId, effort: agentConfig.claude.effort,
      allowedPaths: ['src/example.ts'], steps: [{ path: 'src/example.ts', action: 'Update example' }] }
    assert.match(validateClaudePlan(plan, item.manifest, agentConfig).planHash, /^[a-f0-9]{64}$/)
    assert.throws(() => validateClaudePlan({ ...plan, modelId: 'substitute' }, item.manifest, agentConfig), /AGENT_PLAN_INVALID/)
    assert.throws(() => prepareClaudePlanning(item.stateRoot, item.manifest.id, agentConfig, ['src/other.ts']), /AGENT_CONTEXT_SCOPE_INVALID/)
    mkdirSync(join(item.paths.taskDirectory, 'attempts/implementation-1'), { recursive: true })
    assert.throws(() => prepareCodexImplementation(item.stateRoot, item.manifest.id, agentConfig, plan,
      join(item.paths.taskDirectory, 'attempts/implementation-1')), /AGENT_PLAN_CHECKPOINT_MISSING/)
    writeFileSync(join(item.paths.workspace, 'src/example.ts'), 'stale\n')
    assert.throws(() => prepareClaudePlanning(item.stateRoot, item.manifest.id, agentConfig, ['src/example.ts']), /AGENT_CHECKPOINT_STALE/)
  })

  test('validated Claude plan gates Codex workspace and preserves exact invocation settings', () => {
    const item = simulated(agentConfig)
    const context = prepareClaudePlanning(item.stateRoot, item.manifest.id, agentConfig, ['src/example.ts'])
    const plan = { version: 1, inputHash: item.manifest.inputHash, objectiveHash: context.objectiveHash,
      modelId: agentConfig.claude.modelId, effort: agentConfig.claude.effort,
      allowedPaths: ['src/example.ts'], steps: [{ path: 'src/example.ts', action: 'Update example' }] }
    const planHash = validateClaudePlan(plan, item.manifest, agentConfig).planHash
    const callId = 'real-planning-1'
    reserveAiCall(item.stateRoot, item.manifest.id, { callId, agent: 'claude', estimatedUsd: '0.10' })
    recordAgentProcessStart(item.stateRoot, item.manifest.id, {
      attemptId: callId, agent: 'claude', callId, inputHash: item.manifest.inputHash,
    })
    recordAgentProcessFinish(item.stateRoot, item.manifest.id, {
      attemptId: callId, status: 'succeeded', code: 'AGENT_EXIT_OK', outputHash: planHash, actualUsd: '0.08',
    })
    assert.equal(recordValidatedClaudePlan(item.stateRoot, item.manifest.id, { attemptId: callId, plan, config: agentConfig }).status, 'planned')
    assert.equal(recordValidatedClaudePlan(item.stateRoot, item.manifest.id, { attemptId: callId, plan, config: agentConfig }).status, 'duplicate')
    const attempt = join(item.paths.taskDirectory, 'attempts/implementation-1')
    mkdirSync(attempt, { recursive: true })
    for (const file of inventory(item.paths.snapshot).files) {
      const target = join(attempt, file.path)
      mkdirSync(join(target, '..'), { recursive: true })
      writeFileSync(target, readFileSync(join(item.paths.snapshot, file.path)))
    }
    const prepared = prepareCodexImplementation(item.stateRoot, item.manifest.id, agentConfig, plan, attempt)
    assert.equal(prepared.writeRoot, attempt)
    const entrypoint = join(item.base, 'fake-cli.js')
    writeFileSync(entrypoint, '')
    const capability = { ...agentConfig.codex, available: true, authenticated: true,
      modelAvailable: true, effortSupported: true }
    const spec = buildAgentProcessSpec(prepared, entrypoint, capability, 1000)
    assert.equal(spec.cwd, attempt)
    assert.deepEqual(spec.args.slice(1, 4), ['exec', '-m', agentConfig.codex.modelId])
    assert.equal(spec.args[spec.args.indexOf('--sandbox') + 1], 'workspace-write')
    assert.equal(spec.args[spec.args.indexOf('-C') + 1], attempt)
    assert.equal(spec.args.includes('Update example'), false)
    const claudeSpec = buildAgentProcessSpec(context, entrypoint, {
      ...agentConfig.claude, available: true, authenticated: true, modelAvailable: true, effortSupported: true,
    }, 1000)
    assert.equal(claudeSpec.writeRoot, null)
    assert.equal(claudeSpec.cwd, item.paths.snapshot)
    assert.equal(claudeSpec.args.includes('export const value = 1\n'), false)
    assert.equal(JSON.parse(claudeSpec.stdin).objective, 'Update src/example.ts')
    assert.throws(() => buildAgentProcessSpec(prepared, entrypoint,
      { ...capability, authenticated: false }, 1000), /AGENT_CAPABILITY_UNVERIFIED/)
  })

  test('process records require budget and are idempotent across resume', () => {
    const item = simulated()
    const request = { attemptId: 'real-planning-1', agent: 'claude', callId: 'real-planning-1', inputHash: item.manifest.inputHash }
    assert.throws(() => recordAgentProcessStart(item.stateRoot, item.manifest.id, request), /AGENT_BUDGET_RESERVATION_REQUIRED/)
    reserveAiCall(item.stateRoot, item.manifest.id, { callId: request.callId, agent: 'claude', estimatedUsd: '0.10' })
    assert.equal(recordAgentProcessStart(item.stateRoot, item.manifest.id, request).status, 'started')
    const count = readJournal(item.paths.taskDirectory).length
    assert.equal(recordAgentProcessStart(item.stateRoot, item.manifest.id, request).status, 'duplicate')
    assert.equal(readJournal(item.paths.taskDirectory).length, count)
    assert.equal(agentProcessStatus(item.stateRoot, item.manifest.id)[0].status, 'uncertain')
    assert.throws(() => withTaskLock(item.paths.taskDirectory, () => recordAgentProcessStart(item.stateRoot, item.manifest.id,
      { ...request, attemptId: 'real-planning-2' })), /AGENT_CHECKPOINT_STALE/)
    assert.equal(recordAgentProcessFinish(item.stateRoot, item.manifest.id, {
      attemptId: request.attemptId, status: 'failed', code: 'AGENT_EXIT_NONZERO', actualUsd: null,
    }).status, 'recorded')
    const finishedCount = readJournal(item.paths.taskDirectory).length
    assert.equal(recordAgentProcessFinish(item.stateRoot, item.manifest.id, {
      attemptId: request.attemptId, status: 'failed', code: 'AGENT_EXIT_NONZERO', actualUsd: null,
    }).status, 'duplicate')
    assert.equal(readJournal(item.paths.taskDirectory).length, finishedCount)
    assert.equal(budgetStatus(item.stateRoot, item.manifest.id).code, 'BUDGET_USAGE_UNRECONCILED')
  })

  await testAsync('fake process contract handles success, failure, timeout and cancellation', async () => {
    const item = simulated()
    const spec = { agent: 'claude', executable: process.execPath, args: ['--model', 'exact'], cwd: item.paths.snapshot,
      snapshot: item.paths.snapshot, writeRoot: null, env: {}, stdin: '', timeoutMs: 20 }
    validateProcessSpec(spec)
    assert.throws(() => validateProcessSpec({ ...spec, executable: 'claude.cmd' }), /AGENT_PROCESS_SPEC_INVALID/)
    let invocation
    const success = await executeFakeProcess(spec, { spawnProcess: (command, args, options) => {
      invocation = { command, args, options }
      return fakeChild({ output: 'private-output' })
    } })
    assert.equal(success.status, 'succeeded')
    assert.equal(JSON.stringify(success).includes('private-output'), false)
    assert.equal(invocation.options.shell, false)
    assert.deepEqual(invocation.args, ['--model', 'exact'])
    let invalidOutput = ''
    const invalidResult = await executeFakeProcess(spec, {
      spawnProcess: () => fakeChild({ output: 'not-json' }),
      onStdout: (bytes) => { invalidOutput += bytes.toString('utf8') },
    })
    assert.equal(invalidResult.status, 'succeeded')
    assert.throws(() => JSON.parse(invalidOutput), SyntaxError)
    assert.equal((await executeFakeProcess(spec, { spawnProcess: () => fakeChild({ exitCode: 7 }) })).code, 'AGENT_EXIT_NONZERO')
    const timed = await executeFakeProcess({ ...spec, timeoutMs: 1 }, { spawnProcess: () => fakeChild({ neverClose: true }) })
    assert.equal(timed.code, 'AGENT_TIMEOUT')
    const controller = new AbortController()
    const cancelledPromise = executeFakeProcess(spec, { spawnProcess: () => fakeChild({ neverClose: true }), signal: controller.signal })
    controller.abort()
    assert.equal((await cancelledPromise).code, 'AGENT_CANCELLED')
    assert.throws(() => executeFakeProcess(spec), /REAL_AGENTS_DISABLED/)
  })

  test('fake CLI probes separate verified flags from unknown model access', () => {
    const item = simulated(agentConfig)
    const entrypoint = join(item.base, 'fake-agent.js')
    writeFileSync(entrypoint, '')
    const calls = []
    const probe = {
      locate: () => entrypoint,
      run: (_path, args) => {
        calls.push(args.join(' '))
        if (args[0] === '--version') return { status: 0, output: 'agent 1.2.3' }
        if (args[0] === '--help') return { status: 0, output: '-p --model --effort --tools exec --sandbox -C -m -c' }
        return { status: 0, output: 'Logged in' }
      },
    }
    const defaultReport = probeLiveCapabilities(agentConfig, { probe, env: {} })
    assert.equal(defaultReport.agents.claude.version.code, 'CLI_VERSION_NOT_PROBED')
    assert.equal(calls.length, 0)
    const result = probeLiveCapabilities(agentConfig, { probe, env: {}, executeReadOnly: true })
    assert.equal(result.agents.claude.version.status, 'verified')
    assert.equal(result.agents.codex.authentication.status, 'verified')
    assert.equal(result.agents.claude.arguments.status, 'verified')
    assert.equal(result.agents.claude.model.status, 'unknown')
    assert.equal(result.agents.codex.effort.status, 'unknown')
    assert.equal(result.overall, 'unknown')
    assert.equal(calls.every((call) => !call.includes(agentConfig.claude.modelId) && !call.includes(agentConfig.codex.modelId)), true)
    assert.equal(JSON.stringify(result).includes(entrypoint), false)
  })

  test('fake CLI probes classify missing auth, unsupported flags and unavailable entrypoints', () => {
    const item = simulated(agentConfig)
    const entrypoint = join(item.base, 'fake-agent.js')
    writeFileSync(entrypoint, '')
    const result = probeLiveCapabilities(agentConfig, { env: {}, executeReadOnly: true, probe: {
      locate: () => entrypoint,
      run: (_path, args) => args[0] === '--version' ? { status: 0, output: 'agent 1.2.3' }
        : args[0] === '--help' ? { status: 0, output: '--model' }
          : { status: 1, output: 'Not logged in' },
    } })
    assert.equal(result.agents.claude.authentication.code, 'CLI_AUTH_MISSING')
    assert.equal(result.agents.codex.arguments.code, 'CLI_ARGUMENTS_UNSUPPORTED')
    assert.equal(result.overall, 'blocked')
    const missing = probeLiveCapabilities(agentConfig, { env: {}, probe: { locate: () => null, run: () => { throw new Error('must not run') } } })
    assert.equal(missing.agents.claude.executable.code, 'CLI_UNAVAILABLE')
  })

  test('planning isolation blocks without an OS boundary and accepts only exact fake evidence', () => {
    const item = simulated(agentConfig)
    assert.equal(assessPlanningIsolation(item.stateRoot, item.manifest.id).code, 'PLANNING_OS_BOUNDARY_UNVERIFIED')
    const proven = assessPlanningIsolation(item.stateRoot, item.manifest.id, { boundaryProbe: ({ snapshot, repository }) => ({
      enforced: true, snapshotReadOnly: true, repositoryDenied: true, otherPathsDenied: true, snapshot, repository,
    }) })
    assert.equal(proven.overall, 'verified')
    const falseClaim = assessPlanningIsolation(item.stateRoot, item.manifest.id, { boundaryProbe: ({ snapshot, repository }) => ({
      enforced: true, snapshotReadOnly: true, repositoryDenied: false, otherPathsDenied: true, snapshot, repository,
    }) })
    assert.equal(falseClaim.overall, 'blocked')
  })

  test('Codex output verification rejects main-repository and workspace escape writes', () => {
    const item = simulated(agentConfig)
    const attempt = join(item.paths.taskDirectory, 'attempts/implementation-1')
    mkdirSync(join(attempt, 'src'), { recursive: true })
    for (const file of inventory(item.paths.snapshot).files) {
      const target = join(attempt, file.path)
      mkdirSync(join(target, '..'), { recursive: true })
      writeFileSync(target, readFileSync(join(item.paths.snapshot, file.path)))
    }
    const repoHash = inventory(item.repository).hash
    writeFileSync(join(attempt, 'src/example.ts'), 'changed\n')
    assert.equal(validateCodexOutput(item.stateRoot, item.manifest.id, attempt, repoHash).status, 'verified')
    writeFileSync(join(attempt, '.env'), 'suspicious\n')
    assert.throws(() => validateCodexOutput(item.stateRoot, item.manifest.id, attempt, repoHash), /CODEX_OUTPUT_UNAUTHORIZED_PATH/)
    unlinkSync(join(attempt, '.env'))
    writeFileSync(join(item.repository, 'src/example.ts'), 'main changed\n')
    assert.throws(() => validateCodexOutput(item.stateRoot, item.manifest.id, attempt, repoHash), /CODEX_MAIN_REPOSITORY_CHANGED/)
    assert.throws(() => validateCodexOutput(item.stateRoot, item.manifest.id, item.repository, repoHash), /CODEX_WORKSPACE_ESCAPE/)
  })

  await testAsync('capability-aware fake launch blocks unknown models and records uncertain timeout usage', async () => {
    const item = simulated(agentConfig)
    const callId = 'real-planning-gate-1'
    reserveAiCall(item.stateRoot, item.manifest.id, { callId, agent: 'claude', estimatedUsd: '0.10' })
    const spec = { agent: 'claude', modelId: agentConfig.claude.modelId, effort: agentConfig.claude.effort,
      executable: process.execPath, args: ['--help'], cwd: item.paths.snapshot,
      snapshot: item.paths.snapshot, writeRoot: null, env: {}, stdin: '', timeoutMs: 1 }
    const isolation = { overall: 'verified', osBoundary: 'verified' }
    const unknown = probeLiveCapabilities(agentConfig, { env: {}, probe: { locate: () => null, run: () => null } })
    assert.equal(assessLaunchSafety(item.stateRoot, item.manifest.id, { spec, callId, capabilities: unknown, isolation }).code,
      'LAUNCH_CAPABILITY_UNVERIFIED')
    const verified = { agents: { claude: Object.fromEntries(
      ['executable', 'version', 'authentication', 'arguments', 'model', 'effort'].map((name) => [name, { status: 'verified' }])) } }
    verified.agents.claude.model.requestedId = agentConfig.claude.modelId
    verified.agents.claude.effort.requested = agentConfig.claude.effort
    assert.equal(assessLaunchSafety(item.stateRoot, item.manifest.id, {
      spec: { ...spec, modelId: 'substitute-model' }, callId, capabilities: verified, isolation,
    }).code, 'LAUNCH_MODEL_MISMATCH')
    const result = await launchGuardedFakeProcess(item.stateRoot, item.manifest.id, {
      attemptId: 'real-planning-gate-1', callId, spec, capabilities: verified, isolation,
      spawnProcess: () => fakeChild({ neverClose: true }),
    })
    assert.equal(result.code, 'AGENT_TIMEOUT')
    assert.equal(result.usage, 'unknown')
    assert.equal(budgetStatus(item.stateRoot, item.manifest.id).code, 'BUDGET_USAGE_UNRECONCILED')
  })

  test('offline Docker policy rejects invalid digests, mounts, and path escapes', () => {
    const item = started()
    assert.throws(() => validateImageDigest('example:latest'), /DOCKER_IMAGE_DIGEST_INVALID/)
    const prepared = prepareOfflineFixture(item.stateRoot, item.manifest.id, {
      image: fakeImage, kind: 'planning', attemptId: 'offline-planning-1',
    })
    const args = dockerCreateArguments(prepared, fakeImageId)
    assert.equal(args[args.indexOf('--network') + 1], 'none')
    assert.equal(args.includes('--read-only'), true)
    assert.equal(args.some((arg) => arg.includes('target=/task/source,readonly')), true)
    assert.equal(args.some((arg) => arg.includes(item.repository)), false)
    assert.equal(args[args.indexOf('--entrypoint') + 1], '/bin/sh')
    assert.equal(args.includes(fakeImageId), true)
    assert.equal(args.includes('--pull'), false)
    assert.throws(() => dockerCreateArguments({ ...prepared, mounts: [{ source: item.paths.taskDirectory,
      target: '/task/source', readOnly: true }] }, fakeImageId), /DOCKER_MOUNT_SCOPE_INVALID/)
    assert.throws(() => prepareOfflineFixture(item.stateRoot, item.manifest.id, {
      image: fakeImage, kind: 'planning', attemptId: 'offline-planning-2', planPath: item.repository,
    }), /DOCKER_MOUNT_SCOPE_INVALID/)
    const implementation = offlineImplementation()
    assert.throws(() => prepareOfflineFixture(implementation.stateRoot, implementation.manifest.id, {
      image: fakeImage, kind: 'implementation', attemptId: 'offline-impl-1',
      attemptPath: implementation.repository, planPath: implementation.planPath,
    }), /DOCKER_MOUNT_SCOPE_INVALID/)
  })

  await testAsync('fake Docker preflight distinguishes unavailable daemon and wrong image identity', async () => {
    const item = started()
    const prepared = prepareOfflineFixture(item.stateRoot, item.manifest.id, {
      image: fakeImage, kind: 'planning', attemptId: 'offline-planning-1',
    })
    assert.equal((await probeLocalDocker(fakeImage, fakeDocker(prepared))).status, 'verified')
    const volumeImage = fakeDocker(prepared, { mismatch: 'image-volume' })
    await assert.rejects(() => probeLocalDocker(fakeImage, volumeImage),
      /DOCKER_IMAGE_DECLARED_VOLUMES/)
    await assert.rejects(() => offlineOptIn(() => runOfflineFixture(prepared, {
      transport: volumeImage, allowLocalContainerExecution: true,
    })), /DOCKER_IMAGE_DECLARED_VOLUMES/)
    assert.equal(volumeImage.calls.some((args) => args[0] === 'create'), false)
    const missingShell = fakeDocker(prepared, { mismatch: 'missing-shell' })
    await assert.rejects(() => offlineOptIn(() => runOfflineFixture(prepared, {
      transport: missingShell, allowLocalContainerExecution: true,
    })), /DOCKER_FIXTURE_SHELL_UNVERIFIED/)
    assert.equal(missingShell.calls.some((args) => args[0] === 'create'), false)
    await assert.rejects(() => probeLocalDocker(fakeImage, { run: async (args) => args[0] === 'context'
      ? { status: 0, stdout: JSON.stringify({ Endpoints: { docker: { Host: 'npipe:////./pipe/docker_engine' } } }) }
      : { status: 1 } }), /DOCKER_DAEMON_UNAVAILABLE/)
    await assert.rejects(() => probeLocalDocker(fakeImage, { run: async (args) => ({ status: 0,
      stdout: args[0] === 'context' ? JSON.stringify({ Endpoints: { docker: { Host: 'npipe:////./pipe/docker_engine' } } })
        : args[0] === 'info' ? JSON.stringify({ OSType: 'windows' }) : '{}',
    }) }), /DOCKER_LINUX_REQUIRED/)
    await assert.rejects(() => probeLocalDocker(fakeImage, { run: async (args) => ({ status: 0,
      stdout: args[0] === 'context' ? JSON.stringify({ Endpoints: { docker: { Host: 'npipe:////./pipe/docker_engine' } } })
        : args[0] === 'info' ? JSON.stringify({ OSType: 'linux' }) :
        JSON.stringify({ Os: 'linux', Id: fakeImageId, RepoDigests: [] }),
    }) }), /DOCKER_IMAGE_IDENTITY_MISMATCH/)
    await assert.rejects(() => probeLocalDocker(fakeImage, { run: async (args) => ({ status: 0,
      stdout: args[0] === 'context' ? JSON.stringify({ Endpoints: { docker: { Host: 'tcp://remote:2375' } } }) : '{}',
    }) }), /DOCKER_REMOTE_CONTEXT_FORBIDDEN/)
  })

  await testAsync('fake Docker planning and implementation verify create-inspect-start lifecycle', async () => {
    const planItem = started()
    const planning = prepareOfflineFixture(planItem.stateRoot, planItem.manifest.id, {
      image: fakeImage, kind: 'planning', attemptId: 'offline-planning-1',
    })
    const fake = fakeDocker(planning)
    await assert.rejects(() => runOfflineFixture(planning, { transport: fake }), /LOCAL_CONTAINER_EXECUTION_DISABLED/)
    assert.equal(fake.calls.length, 0)
    const result = await offlineOptIn(() => runOfflineFixture(planning, { transport: fake, allowLocalContainerExecution: true }))
    assert.equal(result.status, 'completed')
    assert.equal(result.outputVerification, 'verified')
    assert.deepEqual(fake.calls.map((args) => args[0]).slice(-7), ['create', 'container', 'start', 'container', 'container', 'rm', 'container'])
    assert.equal(existsSync(join(planning.taskDirectory, 'container-attempts', planning.attemptId, 'created.json')), true)
    assert.equal(readContainerRecord(planning).containerId, fakeContainerId)
    await assert.rejects(() => offlineOptIn(() => runOfflineFixture(planning, {
      transport: fakeDocker(planning), allowLocalContainerExecution: true,
    })), /DOCKER_ATTEMPT_EXISTS/)
    const implItem = offlineImplementation()
    const implementation = prepareOfflineFixture(implItem.stateRoot, implItem.manifest.id, {
      image: fakeImage, kind: 'implementation', attemptId: 'offline-impl-1',
      attemptPath: implItem.attemptPath, planPath: implItem.planPath,
    })
    const result2 = await offlineOptIn(() => runOfflineFixture(implementation, {
      transport: fakeDocker(implementation), allowLocalContainerExecution: true,
    }))
    assert.equal(result2.status, 'completed')
    assert.equal(result2.outputVerification, 'verified')
    assert.equal(readFileSync(join(implItem.repository, 'src/example.ts'), 'utf8'), 'export const value = 1\n')
  })

  await testAsync('fake Docker inspection mismatch blocks start and preserves evidence', async () => {
    for (const mismatch of ['network', 'mount', 'writable-root', 'unexpected-mount', 'entrypoint']) {
      const item = started()
      const prepared = prepareOfflineFixture(item.stateRoot, item.manifest.id, {
        image: fakeImage, kind: 'planning', attemptId: `offline-${mismatch}-1`,
      })
      const fake = fakeDocker(prepared, { mismatch })
      await assert.rejects(() => offlineOptIn(() => runOfflineFixture(prepared, {
        transport: fake, allowLocalContainerExecution: true,
      })), /DOCKER_INSPECTION_MISMATCH/)
      assert.equal(fake.calls.some((args) => args[0] === 'start'), false)
      assert.equal(fake.calls.some((args) => args[0] === 'rm'), true)
    }
  })

  await testAsync('fake Docker rejects missing fixture and incomplete security evidence', async () => {
    for (const [start, code] of [['missing-fixture', 'DOCKER_FIXTURE_COMMAND_UNAVAILABLE'],
      ['invalid-output', 'DOCKER_FIXTURE_EVIDENCE_INVALID']]) {
      const item = started()
      const prepared = prepareOfflineFixture(item.stateRoot, item.manifest.id, {
        image: fakeImage, kind: 'planning', attemptId: `offline-${start}-1`,
      })
      const fake = fakeDocker(prepared, { start })
      await assert.rejects(() => offlineOptIn(() => runOfflineFixture(prepared, {
        transport: fake, allowLocalContainerExecution: true,
      })), new RegExp(code))
      assert.equal(fake.calls.some((args) => args[0] === 'rm'), true)
      assert.equal(existsSync(join(prepared.taskDirectory, 'container-attempts', prepared.attemptId, 'created.json')), true)
    }
  })

  await testAsync('fake Docker records uncertain creation and fails closed on cleanup failure', async () => {
    const item = started()
    const prepared = prepareOfflineFixture(item.stateRoot, item.manifest.id, {
      image: fakeImage, kind: 'planning', attemptId: 'offline-uncertain-create-1',
    })
    const fake = fakeDocker(prepared, { create: 'uncertain' })
    await assert.rejects(() => offlineOptIn(() => runOfflineFixture(prepared, {
      transport: fake, allowLocalContainerExecution: true,
    })), /DOCKER_CREATE_UNCERTAIN/)
    assert.equal(readContainerRecord(prepared).containerId, fakeContainerId)
    assert.equal(fake.calls.some((args) => args[0] === 'rm'), true)

    const failed = started()
    const next = prepareOfflineFixture(failed.stateRoot, failed.manifest.id, {
      image: fakeImage, kind: 'planning', attemptId: 'offline-cleanup-fail-1',
    })
    const noCleanup = fakeDocker(next, { mismatch: 'network', cleanup: 'failed' })
    await assert.rejects(() => offlineOptIn(() => runOfflineFixture(next, {
      transport: noCleanup, allowLocalContainerExecution: true,
    })), /DOCKER_CLEANUP_UNCONFIRMED/)
    assert.equal(readContainerRecord(next).containerId, fakeContainerId)

    const unrelated = started()
    const labelled = prepareOfflineFixture(unrelated.stateRoot, unrelated.manifest.id, {
      image: fakeImage, kind: 'planning', attemptId: 'offline-unrelated-label-1',
    })
    const wrongLabel = fakeDocker(labelled, { mismatch: 'label' })
    await assert.rejects(() => offlineOptIn(() => runOfflineFixture(labelled, {
      transport: wrongLabel, allowLocalContainerExecution: true,
    })), /DOCKER_CLEANUP_UNCONFIRMED/)
    assert.equal(wrongLabel.calls.some((args) => args[0] === 'rm'), false)
  })

  await testAsync('fake Docker cancellation preserves attempt and requires confirmed termination', async () => {
    const item = started()
    const prepared = prepareOfflineFixture(item.stateRoot, item.manifest.id, {
      image: fakeImage, kind: 'planning', attemptId: 'offline-cancel-1',
    })
    const fake = fakeDocker(prepared, { start: 'cancel' })
    const result = await offlineOptIn(() => runOfflineFixture(prepared, {
      transport: fake, allowLocalContainerExecution: true,
    }))
    assert.equal(result.status, 'cancelled')
    assert.equal(fake.calls.some((args) => args[0] === 'stop'), true)
    assert.equal(existsSync(join(prepared.taskDirectory, 'container-attempts', prepared.attemptId, 'created.json')), true)
    const killed = started()
    const killPrepared = prepareOfflineFixture(killed.stateRoot, killed.manifest.id, {
      image: fakeImage, kind: 'planning', attemptId: 'offline-kill-1',
    })
    const killFake = fakeDocker(killPrepared, { start: 'timeout', stop: 'kill-confirmed' })
    assert.equal((await offlineOptIn(() => runOfflineFixture(killPrepared, {
      transport: killFake, allowLocalContainerExecution: true,
    }))).status, 'timed_out')
    assert.equal(killFake.calls.some((args) => args[0] === 'kill'), true)
    const uncertain = started()
    const next = prepareOfflineFixture(uncertain.stateRoot, uncertain.manifest.id, {
      image: fakeImage, kind: 'planning', attemptId: 'offline-timeout-1',
    })
    await assert.rejects(() => offlineOptIn(() => runOfflineFixture(next, {
      transport: fakeDocker(next, { start: 'timeout', stop: 'unconfirmed' }), allowLocalContainerExecution: true,
    })), /DOCKER_TERMINATION_UNCONFIRMED/)
    assert.equal(existsSync(join(next.taskDirectory, 'container-attempts', next.attemptId, 'created.json')), true)
    const nested = started()
    const nestedPrepared = prepareOfflineFixture(nested.stateRoot, nested.manifest.id, {
      image: fakeImage, kind: 'planning', attemptId: 'offline-nested-cancel-1', scenario: 'nested-cancel',
    })
    const nestedFake = fakeDocker(nestedPrepared, { start: 'cancel' })
    assert.equal((await offlineOptIn(() => runOfflineFixture(nestedPrepared, {
      transport: nestedFake, allowLocalContainerExecution: true,
    }))).status, 'cancelled')
    assert.equal(nestedFake.calls.find((args) => args[0] === 'create').includes('nested-cancel'), true)
    assert.equal(nestedFake.calls.some((args) => args[0] === 'rm'), true)
  })

  test('workflow completes all simulated stages and reuses checkpoints', () => {
    const item = simulated()
    let runs = 0
    const options = { simulationOptions: item.options,
      testExecutor: () => { runs += 1; return { passed: true, code: 'TEST_PASSED' } } }
    const first = runWorkflow(item.stateRoot, item.manifest.id, options)
    assert.equal(first.status, 'awaiting_manual_approval')
    assert.equal(first.tests.length, 1)
    assert.equal(first.budget.usedCalls, 4)
    assert.equal(readTask(item.stateRoot, item.manifest.id).entries.at(-1).state, 'awaiting_manual_approval')
    assert.equal(runWorkflow(item.stateRoot, item.manifest.id, options).status, 'awaiting_manual_approval')
    assert.equal(runs, 1)
    assert.equal(budgetStatus(item.stateRoot, item.manifest.id).usedCalls, 4)
  })
  test('workflow can skip optional Copilot', () => {
    const item = simulated()
    const result = runWorkflow(item.stateRoot, item.manifest.id, { includeCopilot: false,
      simulationOptions: item.options, testExecutor: () => ({ passed: true, code: 'TEST_PASSED' }) })
    assert.equal(result.status, 'awaiting_manual_approval')
    assert.equal(result.budget.usedCalls, 3)
  })
  test('workflow failed test reaches Gemini and blocks approval', () => {
    const item = simulated()
    const result = runWorkflow(item.stateRoot, item.manifest.id, { simulationOptions: item.options,
      testExecutor: () => ({ passed: false, code: 'TEST_FAILED' }) })
    assert.equal(result.status, 'blocked')
    assert.equal(result.stage, 'reviewed')
    assert.equal(result.tests[0].passed, false)
    assert.equal(result.budget.usedCalls, 3)
  })
  test('workflow resumes after test interruption without repeating planning or implementation', () => {
    const item = simulated()
    let runs = 0
    const options = { simulationOptions: item.options, includeCopilot: false,
      testExecutor: () => { runs += 1; return { passed: true, code: 'TEST_PASSED' } } }
    assert.equal(runWorkflow(item.stateRoot, item.manifest.id, { ...options, faultAt: 'after-first-test' }).diagnostic.code,
      'WORKFLOW_INTERRUPTED')
    assert.equal(runWorkflow(item.stateRoot, item.manifest.id, options).status, 'awaiting_manual_approval')
    assert.equal(runs, 1)
    assert.equal(budgetStatus(item.stateRoot, item.manifest.id).usedCalls, 3)
  })
  test('workflow resumes after Gemini without repeating its call', () => {
    const item = simulated()
    const options = { simulationOptions: item.options,
      testExecutor: () => ({ passed: true, code: 'TEST_PASSED' }) }
    assert.equal(runWorkflow(item.stateRoot, item.manifest.id, { ...options, faultAt: 'after-gemini' }).diagnostic.code,
      'WORKFLOW_INTERRUPTED')
    assert.equal(budgetStatus(item.stateRoot, item.manifest.id).usedCalls, 3)
    assert.equal(runWorkflow(item.stateRoot, item.manifest.id, options).status, 'awaiting_manual_approval')
    assert.equal(budgetStatus(item.stateRoot, item.manifest.id).usedCalls, 4)
  })
  test('workflow rejects malformed Gemini review and records its failed attempt', () => {
    const item = simulated()
    const result = runWorkflow(item.stateRoot, item.manifest.id, { simulationOptions: item.options,
      testExecutor: () => ({ passed: true, code: 'TEST_PASSED' }), reviewExecutor: () => ({}) })
    assert.equal(result.diagnostic.code, 'AGENT_REVIEW_OUTPUT_INVALID')
    assert.equal(agentProcessStatus(item.stateRoot, item.manifest.id).at(-1).status, 'failed')
  })
  test('workflow rejects corrupt checkpoint and exhausted budget', () => {
    const item = simulated()
    const options = { simulationOptions: item.options, includeCopilot: false,
      testExecutor: () => ({ passed: true, code: 'TEST_PASSED' }) }
    assert.equal(runWorkflow(item.stateRoot, item.manifest.id, options).status, 'awaiting_manual_approval')
    writeFileSync(join(item.paths.taskDirectory, 'reviews', 'workflow-gemini-1.json'), '{}')
    assert.equal(runWorkflow(item.stateRoot, item.manifest.id, options).diagnostic.code, 'WORKFLOW_CHECKPOINT_INVALID')
    const low = simulated(null, parseBudgetLimits('2', '1.00'))
    const exhausted = runWorkflow(low.stateRoot, low.manifest.id, { ...options, simulationOptions: low.options })
    assert.equal(exhausted.diagnostic?.code, 'BUDGET_CALL_LIMIT_EXCEEDED', JSON.stringify(exhausted))
  })
  test('workflow rejects unauthorized implementation output', () => {
    const item = simulated()
    const result = runWorkflow(item.stateRoot, item.manifest.id, { simulationOptions: {
      ...item.options, implementAgent: (attempt, allowed) => {
        writeFileSync(join(attempt, allowed), 'changed\n')
        writeFileSync(join(attempt, 'src', 'unauthorized.ts'), 'changed\n')
      },
    }, testExecutor: () => ({ passed: true, code: 'TEST_PASSED' }) })
    assert.equal(result.status, 'blocked')
  })
  test('trusted-local requires task-specific acknowledgment and never starts an agent', () => {
    const item = simulated(agentConfig)
    const missing = assessTrustedLocal(item.stateRoot, item.manifest.id)
    assert.equal(missing.status, 'blocked')
    assert.ok(missing.checks.some((check) => check.code === 'TASK_TRUST_REQUIRED'))
    const acknowledged = assessTrustedLocal(item.stateRoot, item.manifest.id, {
      acknowledgedTaskId: item.manifest.id,
    })
    assert.equal(acknowledged.status, 'blocked')
    assert.ok(acknowledged.checks.some((check) => check.code === 'DISPOSABLE_FIXTURE_UNVERIFIED'))
    assert.ok(acknowledged.checks.some((check) => check.code === 'PLANNING_OS_BOUNDARY_UNVERIFIED'))
    assert.equal(acknowledged.agentsExecuted, false)
    assert.equal(budgetStatus(item.stateRoot, item.manifest.id).usedCalls, 0)
    assert.equal(readTask(item.stateRoot, item.manifest.id).entries.at(-1).state, 'snapshotted')
  })
  if (offlineDockerRequested) {
    const image = validateImageDigest(process.env.TEWAHEDO_V5_OFFLINE_IMAGE)
    const dockerExe = process.env.TEWAHEDO_V5_DOCKER_EXE ?? defaultDockerExecutable()
    const transport = createDockerTransport(dockerExe)
    await testAsync('opt-in local Docker planning and implementation fixtures', async () => {
      const planningItem = started()
      const planning = prepareOfflineFixture(planningItem.stateRoot, planningItem.manifest.id, {
        image, kind: 'planning', attemptId: 'offline-local-planning-1',
      })
      assert.equal((await runOfflineFixture(planning, { transport,
        allowLocalContainerExecution: true })).status, 'completed')
      const implementationItem = offlineImplementation()
      const implementation = prepareOfflineFixture(implementationItem.stateRoot, implementationItem.manifest.id, {
        image, kind: 'implementation', attemptId: 'offline-local-implementation-1',
        attemptPath: implementationItem.attemptPath, planPath: implementationItem.planPath,
      })
      assert.equal((await runOfflineFixture(implementation, { transport,
        allowLocalContainerExecution: true })).status, 'completed')
      assert.equal(readFileSync(join(implementationItem.attemptPath, 'src/example.ts'), 'utf8'), 'export const value = 2\n')
    })
    await testAsync('opt-in local Docker cancels a nested child process', async () => {
      const item = started()
      const prepared = prepareOfflineFixture(item.stateRoot, item.manifest.id, {
        image, kind: 'planning', attemptId: 'offline-local-nested-cancel-1', scenario: 'nested-cancel',
      })
      const controller = new AbortController()
      const running = runOfflineFixture(prepared, { transport, allowLocalContainerExecution: true,
        signal: controller.signal, timeoutMs: 15_000 })
      running.catch(() => {})
      let sawChild = false
      try {
        for (let index = 0; index < 40; index += 1) {
          if (existsSync(join(prepared.taskDirectory, 'container-attempts', prepared.attemptId, 'created.json'))) {
            const top = await transport.run(['top', readContainerRecord(prepared).containerId], { timeoutMs: 3000 })
            if (top.status === 0 && /sleep\s+120/.test(top.stdout)) { sawChild = true; break }
          }
          await new Promise((resolve) => setTimeout(resolve, 250))
        }
      } finally { controller.abort() }
      const result = await running
      assert.equal(sawChild, true, 'nested child must be observed before cancellation')
      assert.equal(result.status, 'cancelled')
      const after = await transport.run(['container', 'inspect', readContainerRecord(prepared).containerId,
        '--format', '{{json .}}'])
      assert.notEqual(after.status, 0, 'container and nested child must be gone')
    })
  }

  console.log(`${passed} passed, 0 failed`)
} catch {
  process.exitCode = 1
} finally {
  for (const base of offlineDockerRequested ? [] : temporaryRoots) {
    const target = resolve(base)
    const temporary = resolve(tmpdir())
    if (basename(target).startsWith('tewahedo-v5-selftest-') && target.startsWith(`${temporary}${process.platform === 'win32' ? '\\' : '/'}`)) {
      rmSync(target, { recursive: true, force: true })
    }
  }
}
