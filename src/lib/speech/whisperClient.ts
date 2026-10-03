import {
  WHISPER_MODEL_ID,
  WHISPER_SAMPLE_RATE,
  type WhisperWorkerIn,
  type WhisperWorkerOut,
} from './speechTypes'

type ProgressHandler = (info: { status: string; progress?: number }) => void

type Pending = {
  resolve: (text: string) => void
  reject: (error: Error) => void
  onProgress?: ProgressHandler
}

let worker: Worker | null = null
let readyModelId: string | null = null
let loadPromise: Promise<void> | null = null
let pendingTranscribe: Pending | null = null

function ensureWorker(): Worker {
  if (worker) return worker
  worker = new Worker(new URL('./whisperWorker.ts', import.meta.url), { type: 'module' })
  worker.onmessage = (event: MessageEvent<WhisperWorkerOut>) => {
    const message = event.data
    if (message.type === 'progress') {
      pendingTranscribe?.onProgress?.({
        status: message.status,
        progress: message.progress,
      })
      return
    }
    if (message.type === 'ready') {
      readyModelId = message.modelId
      return
    }
    if (message.type === 'result') {
      pendingTranscribe?.resolve(message.text)
      pendingTranscribe = null
      return
    }
    if (message.type === 'error') {
      pendingTranscribe?.reject(new Error(message.message))
      pendingTranscribe = null
      loadPromise = null
    }
  }
  worker.onerror = (event) => {
    pendingTranscribe?.reject(new Error(event.message || 'Whisper worker failed.'))
    pendingTranscribe = null
    loadPromise = null
  }
  return worker
}

function post(message: WhisperWorkerIn) {
  ensureWorker().postMessage(message)
}

export function isWhisperClientAvailable(): boolean {
  return typeof Worker !== 'undefined'
}

/** Lazy-load / warm the Whisper model (singleton per session). */
export async function ensureWhisperLoaded(
  onProgress?: ProgressHandler,
  modelId: string = WHISPER_MODEL_ID,
): Promise<void> {
  if (readyModelId === modelId) return
  if (loadPromise) {
    await loadPromise
    return
  }

  loadPromise = new Promise<void>((resolve, reject) => {
    const w = ensureWorker()
    const onMessage = (event: MessageEvent<WhisperWorkerOut>) => {
      const message = event.data
      if (message.type === 'progress') {
        onProgress?.({ status: message.status, progress: message.progress })
      }
      if (message.type === 'ready' && message.modelId === modelId) {
        w.removeEventListener('message', onMessage)
        resolve()
      }
      if (message.type === 'error') {
        w.removeEventListener('message', onMessage)
        loadPromise = null
        reject(new Error(message.message))
      }
    }
    w.addEventListener('message', onMessage)
    post({ type: 'load', modelId })
  })

  await loadPromise
}

export async function transcribeWithWhisper(
  audio: Float32Array,
  language: 'am' | 'en',
  onProgress?: ProgressHandler,
): Promise<string> {
  if (audio.length < 1600) {
    // < ~0.1s at 16 kHz
    throw new Error('Recording was too short. Try again.')
  }
  await ensureWhisperLoaded(onProgress)
  if (pendingTranscribe) {
    throw new Error('Another transcription is already running.')
  }

  return new Promise<string>((resolve, reject) => {
    pendingTranscribe = {
      resolve,
      reject,
      onProgress,
    }
    // Transfer the underlying buffer for lower memory copy cost when safe.
    const copy = audio.slice(0)
    ensureWorker().postMessage(
      {
        type: 'transcribe',
        audio: copy,
        language,
        sampleRate: WHISPER_SAMPLE_RATE,
      } satisfies WhisperWorkerIn,
      [copy.buffer],
    )
  })
}

export function disposeWhisperClient() {
  if (pendingTranscribe) {
    pendingTranscribe.reject(new Error('Voice search cancelled.'))
    pendingTranscribe = null
  }
  if (worker) {
    post({ type: 'dispose' })
    worker.terminate()
    worker = null
  }
  readyModelId = null
  loadPromise = null
}
