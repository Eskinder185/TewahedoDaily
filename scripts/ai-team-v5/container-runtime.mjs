import { randomUUID } from 'node:crypto'
import { spawn, spawnSync } from 'node:child_process'
import { closeSync, existsSync, fsyncSync, mkdirSync, openSync, readFileSync, realpathSync, readdirSync, renameSync, writeSync } from 'node:fs'
import { dirname, isAbsolute, join, relative, resolve } from 'node:path'
import { assessResume, readTask, withTaskLock } from './state.mjs'
import { assertSafeEntry, hash, inventory, isInside, verifyWorkspace } from './workspace.mjs'
import { validateCodexOutput } from './isolation.mjs'

const IMAGE = /^[a-z0-9][a-z0-9._/-]*@sha256:[a-f0-9]{64}$/
const ID = /^sha256:[a-f0-9]{64}$/
const CONTAINER_ID = /^[a-f0-9]{64}$/
const ATTEMPT = /^[a-z][a-z0-9-]{2,60}$/
const LOCAL_ENDPOINT = /^npipe:\/\/\/\/\.\/pipe\/(?:docker_engine|dockerDesktopLinuxEngine)$/i
const FIXTURE_SHELL = '/bin/sh'
const FIXTURE_SCRIPT = [
  'set -eu',
  'mode="$1"',
  'command -v busybox >/dev/null',
  'for applet in cat grep id ip sleep wget; do busybox --list | busybox grep -qx "$applet"; done',
  'if test "$2" = nested-cancel; then',
  '  busybox sleep 120 &',
  '  printf "nested_child_started=ok\\n"',
  '  wait "$!"',
  '  exit 88',
  'fi',
  'test "$2" = checks',
  'test "$(busybox id -u)" = 10001',
  'busybox grep -Eq "^CapEff:[[:space:]]*0000000000000000$" /proc/self/status',
  'busybox grep -Eq "^NoNewPrivs:[[:space:]]*1$" /proc/self/status',
  'test "$(busybox cat /sys/fs/cgroup/memory.max)" = 1073741824',
  'test "$(busybox cat /sys/fs/cgroup/pids.max)" = 64',
  'set -- $(busybox cat /sys/fs/cgroup/cpu.max)',
  'test "$1" = 200000 && test "$2" = 100000',
  'printf "privileges=ok\\nresources=ok\\n"',
  'if busybox cat /task/secret-sentinel >/dev/null 2>&1; then exit 81; fi',
  'printf "sentinel_denied=ok\\n"',
  'routes="$(busybox ip route)"',
  'if printf "%s\\n" "$routes" | busybox grep -q default; then exit 82; fi',
  'if busybox wget -T 2 -q -O /tmp/v5-network http://198.51.100.1/ >/dev/null 2>&1; then exit 83; fi',
  'printf "network_denied=ok\\n"',
  'if (printf x > /etc/v5-forbidden) 2>/dev/null; then exit 84; fi',
  'printf "root_readonly=ok\\n"',
  'if test "$mode" = planning; then',
  '  test "$(busybox cat /task/source/src/example.ts)" = "export const value = 1"',
  '  if (printf x > /task/source/src/example.ts) 2>/dev/null; then exit 85; fi',
  '  printf "snapshot_readonly=ok\\n"',
  'elif test "$mode" = implementation; then',
  '  test "$(busybox cat /task/plan.json)" = "{\\"version\\":1}"',
  '  if (printf x > /task/plan.json) 2>/dev/null; then exit 86; fi',
  '  printf "plan_readonly=ok\\n"',
  '  printf "export const value = 2\\n" > /task/work/src/example.ts',
  '  test "$(busybox cat /task/work/src/example.ts)" = "export const value = 2"',
  '  printf "work_write=ok\\n"',
  'else exit 87; fi',
  'printf "fixture=V5_OFFLINE_V1:%s\\n" "$mode"',
].join('\n')
const FIXTURE_CMD = (kind, scenario = 'checks') => ['-eu', '-c', FIXTURE_SCRIPT, '--', kind, scenario]
const EVIDENCE = ['privileges', 'resources', 'sentinel_denied', 'network_denied', 'root_readonly']
const TMPFS = Object.freeze({
  '/tmp': 'rw,nosuid,noexec,size=64m,mode=1777,uid=10001,gid=10001',
  '/home/agent': 'rw,nosuid,noexec,size=32m,mode=0700,uid=10001,gid=10001',
})
const MAX_OUTPUT = 65_536

function fail(code) { throw new Error(code) }
function same(a, b) { return process.platform === 'win32' ? a.toLowerCase() === b.toLowerCase() : a === b }
function safePath(path, type) {
  if (typeof path !== 'string' || /[,=\r\n]/.test(path) || !isAbsolute(path) ||
      !same(resolve(path), path) || !existsSync(path)) fail('DOCKER_PATH_INVALID')
  if (!same(realpathSync(path), path)) fail('DOCKER_PATH_ALIAS')
  let cursor = path
  while (true) {
    const entry = assertSafeEntry(cursor)
    if (cursor === path && (type === 'file' ? !entry.isFile() : !entry.isDirectory())) fail('DOCKER_PATH_TYPE_INVALID')
    const parent = dirname(cursor)
    if (parent === cursor) break
    cursor = parent
  }
  return path
}

function allFiles(root) {
  const files = []
  const walk = (directory) => {
    for (const name of readdirSync(directory)) {
      const path = join(directory, name)
      if (!isInside(root, path)) fail('DOCKER_PATH_ESCAPE')
      const entry = assertSafeEntry(path)
      if (entry.isDirectory()) walk(path)
      else files.push(relative(root, path).replaceAll('\\', '/'))
    }
  }
  walk(root)
  return files.sort()
}

function exactInventory(root, expected) {
  const actual = inventory(root)
  if (actual.hash !== expected || JSON.stringify(allFiles(root)) !== JSON.stringify(actual.files.map((file) => file.path).sort())) {
    fail('DOCKER_SOURCE_STALE')
  }
}

function json(output, code) {
  try { return JSON.parse(output) } catch { fail(code) }
}

function commandResult(result, code) {
  if (!result || result.timedOut || result.cancelled || result.outputLimit || result.status !== 0) fail(code)
  return result.stdout ?? ''
}

export function validateImageDigest(image) {
  if (typeof image !== 'string' || !IMAGE.test(image)) fail('DOCKER_IMAGE_DIGEST_INVALID')
  return image
}

export function createDockerTransport(dockerExe) {
  if (['DOCKER_HOST', 'DOCKER_CONTEXT', 'DOCKER_TLS_VERIFY', 'DOCKER_CERT_PATH'].some((name) => process.env[name])) {
    fail('DOCKER_REMOTE_CONTEXT_FORBIDDEN')
  }
  safePath(dockerExe, 'file')
  if (!/\.exe$/i.test(dockerExe)) fail('DOCKER_EXECUTABLE_INVALID')
  return {
    kind: 'docker',
    run(args, { timeoutMs = 5000, signal = null } = {}) {
      if (!Array.isArray(args) || args.some((arg) => typeof arg !== 'string' || arg.includes('\0')) ||
          !Number.isSafeInteger(timeoutMs) || timeoutMs < 1 || timeoutMs > 300_000) fail('DOCKER_COMMAND_INVALID')
      if (signal?.aborted) return Promise.resolve({ status: null, cancelled: true, stdout: '', stderr: '' })
      return new Promise((done) => {
        let child
        try { child = spawn(dockerExe, args, { shell: false, windowsHide: true, stdio: ['ignore', 'pipe', 'pipe'] }) }
        catch { done({ status: null, stdout: '', stderr: '' }); return }
        let stdout = ''
        let stderr = ''
        let outputLimit = false
        let timedOut = false
        let cancelled = false
        let finished = false
        let hardTimer
        const finish = (status) => {
          if (finished) return
          finished = true
          clearTimeout(timer)
          clearTimeout(hardTimer)
          signal?.removeEventListener('abort', abort)
          done({ status, stdout, stderr, outputLimit, timedOut, cancelled })
        }
        const stop = () => {
          try { child.kill() } catch { /* reported by result */ }
          if (finished) return
          if (!hardTimer) hardTimer = setTimeout(() => finish(null), 500)
        }
        const timer = setTimeout(() => { timedOut = true; stop() }, timeoutMs)
        const abort = () => { cancelled = true; stop() }
        signal?.addEventListener('abort', abort, { once: true })
        const capture = (key, chunk) => {
          const value = Buffer.from(chunk).toString('utf8')
          if (stdout.length + stderr.length + value.length > MAX_OUTPUT) { outputLimit = true; stop(); return }
          if (key === 'stdout') stdout += value
          else stderr += value
        }
        child.stdout.on('data', (chunk) => capture('stdout', chunk))
        child.stderr.on('data', (chunk) => capture('stderr', chunk))
        child.on('error', () => finish(null))
        child.on('close', finish)
      })
    },
  }
}

export function defaultDockerExecutable() {
  const result = spawnSync(process.platform === 'win32' ? 'where.exe' : 'which',
    [process.platform === 'win32' ? 'docker.exe' : 'docker'],
    { encoding: 'utf8', shell: false, windowsHide: true, timeout: 3000, maxBuffer: 4096 })
  const path = result.status === 0 ? result.stdout.split(/\r?\n/).find(Boolean) : null
  return path && /\.exe$/i.test(path) ? path : null
}

export async function probeLocalDocker(image, transport) {
  validateImageDigest(image)
  if (!transport || typeof transport.run !== 'function') fail('DOCKER_TRANSPORT_UNAVAILABLE')
  const context = json(commandResult(await transport.run(['context', 'inspect', '--format', '{{json .}}']),
    'DOCKER_CONTEXT_UNAVAILABLE'), 'DOCKER_CONTEXT_INVALID')
  const selected = Array.isArray(context) ? context[0] : context
  if (!LOCAL_ENDPOINT.test(selected?.Endpoints?.docker?.Host ?? '')) fail('DOCKER_REMOTE_CONTEXT_FORBIDDEN')
  const info = json(commandResult(await transport.run(['info', '--format', '{{json .}}']), 'DOCKER_DAEMON_UNAVAILABLE'), 'DOCKER_INFO_INVALID')
  if (info.OSType !== 'linux') fail('DOCKER_LINUX_REQUIRED')
  const inspected = json(commandResult(await transport.run(['image', 'inspect', image, '--format', '{{json .}}']), 'DOCKER_IMAGE_UNAVAILABLE'), 'DOCKER_IMAGE_INSPECT_INVALID')
  const imageInfo = Array.isArray(inspected) ? inspected[0] : inspected
  if (imageInfo?.Os !== 'linux' || !ID.test(imageInfo.Id) || !imageInfo.RepoDigests?.includes(image)) fail('DOCKER_IMAGE_IDENTITY_MISMATCH')
  if (!imageInfo.Config || !Object.hasOwn(imageInfo.Config, 'Volumes') ||
      (imageInfo.Config.Volumes !== null && (typeof imageInfo.Config.Volumes !== 'object' || Array.isArray(imageInfo.Config.Volumes)))) fail('DOCKER_IMAGE_INSPECT_INVALID')
  if (Object.keys(imageInfo.Config.Volumes ?? {}).length) fail('DOCKER_IMAGE_DECLARED_VOLUMES')
  if (JSON.stringify(imageInfo.Config.Shell) !== JSON.stringify([FIXTURE_SHELL, '-c'])) fail('DOCKER_FIXTURE_SHELL_UNVERIFIED')
  return { status: 'verified', code: 'DOCKER_OFFLINE_READY', imageId: imageInfo.Id, daemonOs: 'linux' }
}

export function prepareOfflineFixture(stateRoot, taskId, { image, kind, attemptId, attemptPath = null, planPath = null, scenario = 'checks' }) {
  validateImageDigest(image)
  if (!['planning', 'implementation'].includes(kind) || !ATTEMPT.test(attemptId) ||
      !['checks', 'nested-cancel'].includes(scenario) || (scenario === 'nested-cancel' && kind !== 'planning')) fail('DOCKER_FIXTURE_INVALID')
  const resume = assessResume(stateRoot, taskId)
  if (resume.overall !== 'reusable' || resume.lock?.status !== 'none') fail('DOCKER_CHECKPOINT_STALE')
  const { manifest, paths, entries } = readTask(stateRoot, taskId)
  verifyWorkspace(manifest.repository, stateRoot, taskId, manifest.workspace, manifest.sourceInventoryHash)
  safePath(paths.taskDirectory, 'directory')
  safePath(paths.snapshot, 'directory')
  exactInventory(paths.snapshot, manifest.sourceInventoryHash)
  const mounts = []
  if (kind === 'planning') {
    if (attemptPath !== null || planPath !== null) fail('DOCKER_MOUNT_SCOPE_INVALID')
    mounts.push({ source: paths.snapshot, target: '/task/source', readOnly: true })
  } else {
    const attemptsRoot = join(paths.taskDirectory, 'attempts')
    if (!attemptPath || !planPath || !existsSync(attemptsRoot) || !assertSafeEntry(attemptsRoot).isDirectory() ||
        !/^implementation-[1-9]\d*$/.test(attemptPath.split(/[\\/]/).at(-1)) ||
        !same(resolve(attemptPath, '..'), resolve(attemptsRoot)) ||
        !same(resolve(planPath, '..'), resolve(join(paths.taskDirectory, 'plans')))) fail('DOCKER_MOUNT_SCOPE_INVALID')
    safePath(attemptPath, 'directory')
    safePath(planPath, 'file')
    exactInventory(attemptPath, manifest.sourceInventoryHash)
    const planRelative = relative(paths.taskDirectory, planPath).replaceAll('\\', '/')
    if (!entries.some((entry) => entry.detail.artifacts?.[planRelative] === hash(readFileSync(planPath)))) fail('DOCKER_PLAN_UNVERIFIED')
    mounts.push({ source: attemptPath, target: '/task/work', readOnly: false },
      { source: planPath, target: '/task/plan.json', readOnly: true })
  }
  const name = `tewahedo-v5-${taskId}-${attemptId}`
  return { taskId, taskDirectory: paths.taskDirectory, repository: manifest.repository,
    snapshotHash: manifest.sourceInventoryHash, image, kind, attemptId, name, mounts,
    attemptPath, planPath, scenario,
    policyHash: hash(JSON.stringify({ image, kind, mounts, scenario, network: 'none', shell: FIXTURE_SHELL, script: FIXTURE_SCRIPT })) }
}

export function dockerCreateArguments(prepared, imageId) {
  if (!prepared || !ID.test(imageId) || !['planning', 'implementation'].includes(prepared.kind) ||
      !['checks', 'nested-cancel'].includes(prepared.scenario) ||
      (prepared.scenario === 'nested-cancel' && prepared.kind !== 'planning') ||
      !Array.isArray(prepared.mounts) || prepared.mounts.length !== (prepared.kind === 'planning' ? 1 : 2)) fail('DOCKER_POLICY_INVALID')
  const expected = prepared.kind === 'planning' ? [['/task/source', true]] : [['/task/work', false], ['/task/plan.json', true]]
  if (prepared.mounts.some((mount, index) => mount.target !== expected[index][0] || mount.readOnly !== expected[index][1] ||
      !isInside(prepared.taskDirectory, mount.source) || !existsSync(mount.source) ||
      !same(mount.source, prepared.kind === 'planning' ? join(prepared.taskDirectory, 'baseline-snapshot')
        : index === 0 ? prepared.attemptPath : prepared.planPath))) fail('DOCKER_MOUNT_SCOPE_INVALID')
  for (const mount of prepared.mounts) safePath(mount.source, mount.target === '/task/plan.json' ? 'file' : 'directory')
  const args = ['create', '--name', prepared.name,
    '--label', `tewahedo.v5.policy=${prepared.policyHash}`,
    '--label', `tewahedo.v5.attempt=${prepared.attemptId}`,
    '--network', 'none', '--read-only', '--entrypoint', FIXTURE_SHELL,
    '--user', '10001:10001', '--cap-drop', 'ALL', '--security-opt', 'no-new-privileges:true',
    '--pids-limit', '64', '--memory', '1073741824', '--memory-swap', '1073741824',
    '--cpus', '2', '--ulimit', 'nofile=1024:1024', '--ipc', 'none', '--cgroupns', 'private',
    '--init', '--stop-timeout', '5', '--env', 'HOME=/home/agent',
    '--tmpfs', `/tmp:${TMPFS['/tmp']}`, '--tmpfs', `/home/agent:${TMPFS['/home/agent']}`]
  for (const mount of prepared.mounts) {
    args.push('--mount', `type=bind,source=${mount.source},target=${mount.target}${mount.readOnly ? ',readonly' : ''}`)
  }
  args.push('--workdir', prepared.kind === 'planning' ? '/task/source' : '/task/work', imageId, ...FIXTURE_CMD(prepared.kind, prepared.scenario))
  return args
}

export function verifyContainerInspect(prepared, imageId, containerId, inspected) {
  const item = Array.isArray(inspected) ? inspected[0] : inspected
  const host = item?.HostConfig
  const config = item?.Config
  if (!CONTAINER_ID.test(containerId) || !item?.Id?.startsWith(containerId) || item?.Image !== imageId ||
      item?.Name !== `/${prepared.name}` || !host || !config ||
      host.NetworkMode !== 'none' || host.ReadonlyRootfs !== true || host.Privileged !== false ||
      !['', 'private'].includes(host.PidMode) || host.IpcMode !== 'none' ||
      host.CgroupnsMode !== 'private' || !['', 'private'].includes(host.UTSMode) ||
      !['', 'private'].includes(host.UsernsMode) ||
      host.PidsLimit !== 64 || host.Memory !== 1073741824 || host.MemorySwap !== 1073741824 ||
      host.NanoCpus !== 2_000_000_000 || !host.CapDrop?.includes('ALL') ||
      !host.SecurityOpt?.includes('no-new-privileges:true') || config.User !== '10001:10001' ||
      host.Init !== true || host.StopTimeout !== 5 ||
      config.WorkingDir !== (prepared.kind === 'planning' ? '/task/source' : '/task/work') ||
      JSON.stringify(config.Entrypoint) !== JSON.stringify([FIXTURE_SHELL]) ||
      JSON.stringify(config.Cmd) !== JSON.stringify(FIXTURE_CMD(prepared.kind, prepared.scenario)) ||
      config.Labels?.['tewahedo.v5.policy'] !== prepared.policyHash ||
      config.Labels?.['tewahedo.v5.attempt'] !== prepared.attemptId ||
      host.PortBindings && Object.keys(host.PortBindings).length ||
      host.Devices?.length || host.Binds?.length ||
      Object.entries(TMPFS).some(([path, value]) => host.Tmpfs?.[path] !== value) ||
      !config.Env?.includes('HOME=/home/agent') ||
      config.Env.some((value) => !/^(?:HOME|PATH|LANG|NODE_ENV)=/.test(value))) fail('DOCKER_INSPECTION_MISMATCH')
  const mounts = item.Mounts ?? []
  if (mounts.length !== prepared.mounts.length || mounts.some((mount, index) =>
    mount.Type !== 'bind' || mount.Destination !== prepared.mounts[index].target ||
    mount.RW === prepared.mounts[index].readOnly || !same(resolve(mount.Source), resolve(prepared.mounts[index].source)))) {
    fail('DOCKER_INSPECTION_MISMATCH')
  }
  return { status: 'verified', code: 'DOCKER_CONTAINER_POLICY_VERIFIED', containerId }
}

function atomicRecord(path, value) {
  const temporary = `${path}.${randomUUID()}.tmp`
  const bytes = Buffer.from(`${JSON.stringify(value)}\n`)
  let fd
  try {
    fd = openSync(temporary, 'wx')
    writeSync(fd, bytes)
    fsyncSync(fd)
    closeSync(fd)
    fd = undefined
    if (existsSync(path)) fail('DOCKER_RECORD_EXISTS')
    renameSync(temporary, path)
  } finally { if (fd !== undefined) closeSync(fd) }
}

function attemptDirectory(prepared) {
  const root = join(prepared.taskDirectory, 'container-attempts')
  if (!existsSync(root)) mkdirSync(root)
  safePath(root, 'directory')
  return join(root, prepared.attemptId)
}

function recordCreated(prepared, containerId, imageId) {
  withTaskLock(prepared.taskDirectory, () => {
    const directory = attemptDirectory(prepared)
    if (existsSync(directory)) fail('DOCKER_ATTEMPT_EXISTS')
    mkdirSync(directory)
    const record = { version: 1, taskId: prepared.taskId, attemptId: prepared.attemptId,
      containerId, imageId, policyHash: prepared.policyHash, kind: prepared.kind,
      snapshotHash: prepared.snapshotHash }
    record.hash = hash(JSON.stringify(record))
    atomicRecord(join(directory, 'created.json'), record)
  })
}

export function readContainerRecord(prepared) {
  const directory = attemptDirectory(prepared)
  safePath(directory, 'directory')
  const path = join(directory, 'created.json')
  safePath(path, 'file')
  const record = json(readFileSync(path, 'utf8'), 'DOCKER_RECORD_CORRUPTED')
  const { hash: recordedHash, ...content } = record
  if (hash(JSON.stringify(content)) !== recordedHash || record.taskId !== prepared.taskId ||
      record.attemptId !== prepared.attemptId || record.policyHash !== prepared.policyHash ||
      !CONTAINER_ID.test(record.containerId) || !ID.test(record.imageId)) fail('DOCKER_RECORD_CORRUPTED')
  return record
}

async function inspectContainer(transport, containerId) {
  return json(commandResult(await transport.run(['container', 'inspect', containerId, '--format', '{{json .}}']),
    'DOCKER_CONTAINER_INSPECT_FAILED'), 'DOCKER_CONTAINER_INSPECT_INVALID')
}

async function terminate(transport, containerId) {
  let stopped
  try { stopped = await transport.run(['stop', '--time', '5', containerId], { timeoutMs: 10_000 }) } catch { stopped = null }
  let inspected
  try { inspected = await inspectContainer(transport, containerId) } catch { inspected = null }
  if (stopped?.status === 0 && inspected?.State?.Running === false) return true
  try { await transport.run(['kill', containerId], { timeoutMs: 5000 }) } catch { /* inspect determines outcome */ }
  try { inspected = await inspectContainer(transport, containerId) } catch { inspected = null }
  return inspected?.State?.Running === false
}

async function cleanupCreated(transport, containerId, prepared) {
  let inspected
  try { inspected = await inspectContainer(transport, containerId) } catch { fail('DOCKER_CLEANUP_UNCONFIRMED') }
  if (inspected?.Id !== containerId || inspected?.Name !== `/${prepared.name}` ||
      inspected?.Config?.Labels?.['tewahedo.v5.policy'] !== prepared.policyHash ||
      inspected?.Config?.Labels?.['tewahedo.v5.attempt'] !== prepared.attemptId) fail('DOCKER_CLEANUP_UNCONFIRMED')
  if (inspected?.State?.Running !== false && !(await terminate(transport, containerId))) fail('DOCKER_TERMINATION_UNCONFIRMED')
  let removed
  try { removed = await transport.run(['rm', containerId], { timeoutMs: 10_000 }) } catch { removed = null }
  const after = await transport.run(['container', 'inspect', containerId, '--format', '{{json .}}'])
  if (removed?.status !== 0 || after?.status === 0) fail('DOCKER_CLEANUP_UNCONFIRMED')
}

export function validateFixtureEvidence(output, kind) {
  if (typeof output !== 'string' || !['planning', 'implementation'].includes(kind)) fail('DOCKER_FIXTURE_EVIDENCE_INVALID')
  const expected = [...EVIDENCE, ...(kind === 'planning' ? ['snapshot_readonly'] : ['plan_readonly', 'work_write'])]
  const lines = output.trim().split(/\r?\n/)
  const required = [...expected.map((key) => `${key}=ok`), `fixture=V5_OFFLINE_V1:${kind}`]
  if (lines.length !== required.length || required.some((line, index) => lines[index] !== line)) fail('DOCKER_FIXTURE_EVIDENCE_INVALID')
  return { status: 'verified', checks: expected }
}

export async function runOfflineFixture(prepared, { transport, allowLocalContainerExecution = false,
  signal = null, timeoutMs = 30_000 } = {}) {
  if (!(allowLocalContainerExecution === true && process.env.TEWAHEDO_V5_ALLOW_OFFLINE_DOCKER === '1')) {
    fail('LOCAL_CONTAINER_EXECUTION_DISABLED')
  }
  if (signal?.aborted) fail('DOCKER_CANCELLED_BEFORE_CREATE')
  if (!Number.isSafeInteger(timeoutMs) || timeoutMs < 1 || timeoutMs > 300_000) fail('DOCKER_TIMEOUT_INVALID')
  const current = prepareOfflineFixture(dirname(dirname(prepared.taskDirectory)), prepared.taskId, prepared)
  if (current.policyHash !== prepared.policyHash || current.name !== prepared.name ||
      current.taskDirectory !== prepared.taskDirectory || current.repository !== prepared.repository ||
      current.snapshotHash !== prepared.snapshotHash || current.scenario !== prepared.scenario ||
      JSON.stringify(current.mounts) !== JSON.stringify(prepared.mounts)) {
    fail('DOCKER_POLICY_STALE')
  }
  if (existsSync(join(prepared.taskDirectory, 'container-attempts', prepared.attemptId))) fail('DOCKER_ATTEMPT_EXISTS')
  const ready = await probeLocalDocker(prepared.image, transport)
  const orphan = await transport.run(['container', 'inspect', prepared.name, '--format', '{{json .}}'])
  if (orphan?.status === 0) fail('DOCKER_ORPHAN_UNCERTAIN')
  const args = dockerCreateArguments(prepared, ready.imageId)
  let created = null
  try {
    let creation
    try { creation = await transport.run(args, { timeoutMs: 10_000 }) } catch { creation = null }
    if (creation?.status === 0 && CONTAINER_ID.test(creation.stdout?.trim())) {
      created = creation.stdout.trim()
    } else {
      const orphan = await transport.run(['container', 'inspect', prepared.name, '--format', '{{json .}}'])
      if (orphan?.status !== 0) fail('DOCKER_CREATE_FAILED')
      const found = json(orphan.stdout, 'DOCKER_CREATE_UNCERTAIN')
      if (!CONTAINER_ID.test(found?.Id) || found?.Name !== `/${prepared.name}` ||
          found?.Config?.Labels?.['tewahedo.v5.policy'] !== prepared.policyHash ||
          found?.Config?.Labels?.['tewahedo.v5.attempt'] !== prepared.attemptId) fail('DOCKER_CREATE_UNCERTAIN')
      created = found.Id
      recordCreated(prepared, created, ready.imageId)
      fail('DOCKER_CREATE_UNCERTAIN')
    }
    recordCreated(prepared, created, ready.imageId)
    const inspected = await inspectContainer(transport, created)
    verifyContainerInspect(prepared, ready.imageId, created, inspected)
    const { manifest } = readTask(dirname(dirname(prepared.taskDirectory)), prepared.taskId)
    verifyWorkspace(manifest.repository, dirname(dirname(prepared.taskDirectory)), prepared.taskId,
      manifest.workspace, manifest.sourceInventoryHash)
    const beforeRepositoryHash = inventory(manifest.repository).hash
    let started
    try { started = await transport.run(['start', '--attach', created], { timeoutMs, signal }) }
    catch { started = { status: null } }
    if (started?.status === 127) fail('DOCKER_FIXTURE_COMMAND_UNAVAILABLE')
    let final
    try { final = await inspectContainer(transport, created) } catch { final = null }
    const uncertain = started?.timedOut || started?.cancelled || started?.outputLimit ||
      started?.status !== 0 || final?.State?.Running !== false
    if (uncertain && !(await terminate(transport, created))) fail('DOCKER_TERMINATION_UNCONFIRMED')
    verifyWorkspace(manifest.repository, dirname(dirname(prepared.taskDirectory)), prepared.taskId,
      manifest.workspace, manifest.sourceInventoryHash)
    if (inventory(manifest.repository).hash !== beforeRepositoryHash) fail('DOCKER_MAIN_REPOSITORY_CHANGED')
    let outputVerification = 'not_verified'
    if (!uncertain) {
      if (prepared.scenario !== 'checks') fail('DOCKER_CANCELLATION_NOT_OBSERVED')
      validateFixtureEvidence(started.stdout, prepared.kind)
      if (prepared.kind === 'implementation') {
        validateCodexOutput(dirname(dirname(prepared.taskDirectory)), prepared.taskId,
          prepared.attemptPath, beforeRepositoryHash)
        if (readFileSync(join(prepared.attemptPath, 'src', 'example.ts'), 'utf8') !== 'export const value = 2\n') fail('DOCKER_WORK_WRITE_MISSING')
      }
      outputVerification = 'verified'
    }
    const status = uncertain ? started?.timedOut ? 'timed_out' : started?.cancelled ? 'cancelled' : 'uncertain' : 'completed'
    const code = uncertain ? status === 'timed_out' ? 'DOCKER_TIMEOUT' : status === 'cancelled' ? 'DOCKER_CANCELLED' : 'DOCKER_OUTCOME_UNCERTAIN' : 'DOCKER_FIXTURE_COMPLETED'
    const directory = attemptDirectory(prepared)
    const outcome = { version: 1, containerId: created, status, code, usage: 'not_applicable',
      outputHash: hash(started?.stdout ?? ''), outputBytes: Buffer.byteLength(started?.stdout ?? ''),
      previousHash: readContainerRecord(prepared).hash }
    outcome.hash = hash(JSON.stringify(outcome))
    withTaskLock(prepared.taskDirectory, () => atomicRecord(join(directory, 'outcome.json'), outcome))
    return { status, code, attemptId: prepared.attemptId, containerId: created,
      inspection: 'verified', outputVerification, network: 'none', usage: 'not_applicable', rawOutputLogged: false }
  } finally {
    if (created) await cleanupCreated(transport, created, prepared)
  }
}
