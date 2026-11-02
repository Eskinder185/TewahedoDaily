import { createHash } from 'node:crypto'
import { isAbsolute, resolve } from 'node:path'

const MAX_OUTPUT_BYTES = 65_536
const MAX_TIMEOUT_MS = 300_000

function fail(code) { throw new Error(code) }

export function validateProcessSpec(spec) {
  if (!spec || typeof spec !== 'object' || !isAbsolute(spec.executable) ||
      !/\.exe$/i.test(spec.executable) || !Array.isArray(spec.args) ||
      spec.args.some((arg) => typeof arg !== 'string' || arg.includes('\0') || arg.length > 4096) ||
      !isAbsolute(spec.cwd) || !Number.isSafeInteger(spec.timeoutMs) ||
      spec.timeoutMs < 1 || spec.timeoutMs > MAX_TIMEOUT_MS ||
      typeof spec.stdin !== 'string' || Buffer.byteLength(spec.stdin) > MAX_OUTPUT_BYTES ||
      !['claude', 'codex'].includes(spec.agent) ||
      (spec.agent === 'claude' && (spec.writeRoot !== null || spec.cwd !== spec.snapshot)) ||
      (spec.agent === 'codex' && (spec.writeRoot !== spec.cwd || !isAbsolute(spec.writeRoot))) ||
      !spec.env || typeof spec.env !== 'object' || Array.isArray(spec.env) ||
      Object.entries(spec.env).some(([name, value]) => !/^[A-Z_][A-Z0-9_]*$/.test(name) || typeof value !== 'string')) {
    fail('AGENT_PROCESS_SPEC_INVALID')
  }
  if (resolve(spec.cwd) !== spec.cwd) fail('AGENT_PROCESS_PATH_INVALID')
  return spec
}

// A process factory must be injected. This phase has no production spawn path.
export function executeFakeProcess(spec, { spawnProcess, signal = null, onStdout = null } = {}) {
  validateProcessSpec(spec)
  if (typeof spawnProcess !== 'function') fail('REAL_AGENTS_DISABLED')
  if (onStdout !== null && typeof onStdout !== 'function') fail('AGENT_OUTPUT_HANDLER_INVALID')
  if (signal?.aborted) return Promise.resolve({ status: 'cancelled', code: 'AGENT_CANCELLED', stdoutBytes: 0, stderrBytes: 0 })
  return new Promise((resolveResult) => {
    let child
    try {
      child = spawnProcess(spec.executable, [...spec.args], {
        cwd: spec.cwd, env: { ...spec.env }, shell: false, windowsHide: true,
        stdio: ['pipe', 'pipe', 'pipe'],
      })
      if (!child || typeof child.on !== 'function' || typeof child.kill !== 'function') fail('AGENT_PROCESS_START_FAILED')
    } catch {
      resolveResult({ status: 'failed', code: 'AGENT_PROCESS_START_FAILED', stdoutBytes: 0, stderrBytes: 0 })
      return
    }
    const digest = createHash('sha256')
    let stdoutBytes = 0
    let stderrBytes = 0
    let finished = false
    let stopCode = null
    let graceTimer
    const finish = (status, code) => {
      if (finished) return
      finished = true
      clearTimeout(timer)
      clearTimeout(graceTimer)
      signal?.removeEventListener('abort', cancel)
      resolveResult({ status, code, stdoutBytes, stderrBytes, stdoutHash: digest.digest('hex') })
    }
    const stop = (code) => {
      if (finished || stopCode) return
      stopCode = code
      try { child.kill('SIGTERM') } catch { /* failure is reported after grace */ }
      if (finished) return
      graceTimer = setTimeout(() => {
        try { child.kill('SIGKILL') } catch { /* already exited */ }
        finish(code === 'AGENT_TIMEOUT' ? 'timed_out' : code === 'AGENT_CANCELLED' ? 'cancelled' : 'failed', code)
      }, 100)
    }
    const cancel = () => stop('AGENT_CANCELLED')
    const timer = setTimeout(() => stop('AGENT_TIMEOUT'), spec.timeoutMs)
    signal?.addEventListener('abort', cancel, { once: true })
    try { child.stdin?.end(spec.stdin) } catch { stop('AGENT_PROCESS_FAILED') }
    child.stdout?.on('data', (chunk) => {
      if (finished) return
      const bytes = Buffer.from(chunk)
      stdoutBytes += bytes.length
      if (stdoutBytes + stderrBytes > MAX_OUTPUT_BYTES) { stop('AGENT_OUTPUT_LIMIT'); return }
      digest.update(bytes)
      try { onStdout?.(bytes) } catch { stop('AGENT_OUTPUT_HANDLER_FAILED') }
    })
    child.stderr?.on('data', (chunk) => {
      if (finished) return
      stderrBytes += Buffer.byteLength(chunk)
      if (stdoutBytes + stderrBytes > MAX_OUTPUT_BYTES) stop('AGENT_OUTPUT_LIMIT')
    })
    child.on('error', () => stop('AGENT_PROCESS_FAILED'))
    child.on('close', (exitCode) => {
      if (stopCode) finish(stopCode === 'AGENT_TIMEOUT' ? 'timed_out' : stopCode === 'AGENT_CANCELLED' ? 'cancelled' : 'failed', stopCode)
      else finish(exitCode === 0 ? 'succeeded' : 'failed', exitCode === 0 ? 'AGENT_EXIT_OK' : 'AGENT_EXIT_NONZERO')
    })
  })
}
