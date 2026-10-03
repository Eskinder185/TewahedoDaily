import type { WhisperWorkerIn, WhisperWorkerOut } from './speechTypes'

type ProgressInfo = {
  status?: string
  progress?: number
  file?: string
}

type AsrPipeline = (
  audio: Float32Array,
  options?: Record<string, unknown>,
) => Promise<{ text?: string } | Array<{ text?: string }>>

const workerScope = globalThis as unknown as {
  postMessage: (message: WhisperWorkerOut) => void
  onmessage: ((event: MessageEvent<WhisperWorkerIn>) => void) | null
  addEventListener: typeof addEventListener
}

let pipelinePromise: Promise<AsrPipeline> | null = null
let loadedModelId: string | null = null

function post(message: WhisperWorkerOut) {
  workerScope.postMessage(message)
}

async function getPipeline(modelId: string): Promise<AsrPipeline> {
  if (pipelinePromise && loadedModelId === modelId) return pipelinePromise

  pipelinePromise = (async () => {
    const { pipeline, env } = await import('@huggingface/transformers')
    env.allowLocalModels = false
    env.useBrowserCache = true

    post({ type: 'progress', status: 'loading', progress: 0 })

    const progress_callback = (info: ProgressInfo) => {
      const progress =
        typeof info.progress === 'number' ? Math.max(0, Math.min(100, info.progress)) : undefined
      post({
        type: 'progress',
        status: info.status || 'loading',
        progress,
      })
    }

    let asr: AsrPipeline
    try {
      asr = (await pipeline('automatic-speech-recognition', modelId, {
        dtype: 'q8',
        device: 'webgpu',
        progress_callback,
      })) as unknown as AsrPipeline
    } catch {
      asr = (await pipeline('automatic-speech-recognition', modelId, {
        dtype: 'q8',
        progress_callback,
      })) as unknown as AsrPipeline
    }

    loadedModelId = modelId
    post({ type: 'ready', modelId })
    return asr
  })()

  try {
    return await pipelinePromise
  } catch (error) {
    pipelinePromise = null
    loadedModelId = null
    throw error
  }
}

workerScope.onmessage = async (event: MessageEvent<WhisperWorkerIn>) => {
  const message = event.data
  try {
    if (message.type === 'load') {
      await getPipeline(message.modelId)
      return
    }

    if (message.type === 'dispose') {
      pipelinePromise = null
      loadedModelId = null
      return
    }

    if (message.type === 'transcribe') {
      const asr = await getPipeline(loadedModelId || 'Xenova/whisper-tiny')
      post({ type: 'progress', status: 'transcribing' })

      const output = await asr(message.audio, {
        language: message.language,
        task: 'transcribe',
        return_timestamps: false,
      })

      const text = Array.isArray(output)
        ? (output[0]?.text || '').trim()
        : (output.text || '').trim()
      post({ type: 'result', text })
    }
  } catch (error) {
    const messageText = error instanceof Error ? error.message : 'Whisper transcription failed.'
    post({ type: 'error', message: messageText })
  }
}

export {}
