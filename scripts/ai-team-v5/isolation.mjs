import { existsSync, readdirSync } from 'node:fs'
import { join, relative, resolve } from 'node:path'
import { assessResume, readTask } from './state.mjs'
import { assertSafeEntry, inventory, isInside, verifyWorkspace } from './workspace.mjs'

function fail(code) { throw new Error(code) }

export function assessPlanningIsolation(stateRoot, taskId, { boundaryProbe = null } = {}) {
  const resume = assessResume(stateRoot, taskId)
  if (resume.overall !== 'reusable') return { overall: 'blocked', code: 'PLANNING_SNAPSHOT_STALE',
    snapshot: 'blocked', osBoundary: 'blocked' }
  const { manifest } = readTask(stateRoot, taskId)
  try {
    verifyWorkspace(manifest.repository, stateRoot, taskId, manifest.workspace, manifest.sourceInventoryHash)
  } catch {
    return { overall: 'blocked', code: 'PLANNING_SNAPSHOT_STALE', snapshot: 'blocked', osBoundary: 'blocked' }
  }
  let evidence = null
  if (boundaryProbe) {
    try { evidence = boundaryProbe({ snapshot: manifest.snapshot, repository: manifest.repository }) } catch { /* unverified */ }
  }
  const enforced = evidence?.enforced === true && evidence?.snapshotReadOnly === true &&
    evidence?.repositoryDenied === true && evidence?.otherPathsDenied === true &&
    evidence?.snapshot === manifest.snapshot && evidence?.repository === manifest.repository
  return { overall: enforced ? 'verified' : 'blocked', code: enforced ? 'PLANNING_OS_BOUNDARY_VERIFIED' : 'PLANNING_OS_BOUNDARY_UNVERIFIED',
    snapshot: 'verified', osBoundary: enforced ? 'verified' : 'blocked' }
}

function allFiles(root) {
  const files = []
  const walk = (directory) => {
    for (const name of readdirSync(directory)) {
      const path = join(directory, name)
      if (!isInside(root, path)) fail('CODEX_WORKSPACE_ESCAPE')
      const entry = assertSafeEntry(path)
      if (entry.isDirectory()) walk(path)
      else files.push(relative(root, path).replaceAll('\\', '/'))
    }
  }
  walk(root)
  return files.sort()
}

export function validateCodexOutput(stateRoot, taskId, attemptPath, beforeRepositoryHash) {
  const { manifest, paths } = readTask(stateRoot, taskId)
  const attemptsRoot = join(paths.taskDirectory, 'attempts')
  if (typeof attemptPath !== 'string' || !existsSync(attemptsRoot) ||
      !assertSafeEntry(attemptsRoot).isDirectory() ||
      resolve(attemptPath, '..') !== resolve(attemptsRoot) ||
      !/^implementation-[1-9]\d*$/.test(attemptPath.split(/[\\/]/).at(-1)) ||
      !existsSync(attemptPath) || !assertSafeEntry(attemptPath).isDirectory()) fail('CODEX_WORKSPACE_ESCAPE')
  const before = inventory(manifest.snapshot)
  if (before.hash !== manifest.sourceInventoryHash) fail('CODEX_SNAPSHOT_STALE')
  const after = inventory(attemptPath)
  if (JSON.stringify(allFiles(attemptPath)) !== JSON.stringify(before.files.map((file) => file.path).sort())) {
    fail('CODEX_OUTPUT_UNAUTHORIZED_PATH')
  }
  const changed = after.files.filter((file, index) => file.path !== before.files[index]?.path ||
    file.hash !== before.files[index]?.hash).map((file) => file.path)
  if (!changed.length || changed.some((path) => !manifest.allowedPaths?.includes(path))) fail('CODEX_OUTPUT_OUT_OF_SCOPE')
  if (typeof beforeRepositoryHash !== 'string' || inventory(manifest.repository).hash !== beforeRepositoryHash) {
    fail('CODEX_MAIN_REPOSITORY_CHANGED')
  }
  return { status: 'verified', code: 'CODEX_OUTPUT_SCOPE_VERIFIED', changedPaths: changed,
    outputHash: after.hash, mainRepositoryInventoryUnchanged: true,
    osWriteBoundary: 'unverified' }
}
