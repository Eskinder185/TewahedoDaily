import { WHISPER_MAX_RECORD_MS, WHISPER_SAMPLE_RATE } from './speechTypes'

export type AudioCaptureSession = {
  stop: () => Promise<Float32Array>
  cancel: () => void
  getElapsedMs: () => number
}

function getAudioContextCtor(
  win: Window & typeof globalThis = window,
): typeof AudioContext | undefined {
  return (
    win.AudioContext ||
    (win as unknown as { webkitAudioContext?: typeof AudioContext }).webkitAudioContext
  )
}

/** Resample Float32 mono PCM to target rate (linear interpolation). */
export function resampleMono(input: Float32Array, fromRate: number, toRate: number): Float32Array {
  if (fromRate === toRate) return input
  if (input.length === 0) return input
  const ratio = fromRate / toRate
  const outLength = Math.max(1, Math.round(input.length / ratio))
  const output = new Float32Array(outLength)
  for (let i = 0; i < outLength; i += 1) {
    const srcIndex = i * ratio
    const left = Math.floor(srcIndex)
    const right = Math.min(left + 1, input.length - 1)
    const t = srcIndex - left
    output[i] = input[left] * (1 - t) + input[right] * t
  }
  return output
}

export function mixToMono(buffer: AudioBuffer): Float32Array {
  const { numberOfChannels, length } = buffer
  if (numberOfChannels === 1) return buffer.getChannelData(0).slice(0)
  const mono = new Float32Array(length)
  for (let c = 0; c < numberOfChannels; c += 1) {
    const channel = buffer.getChannelData(c)
    for (let i = 0; i < length; i += 1) mono[i] += channel[i] / numberOfChannels
  }
  return mono
}

/**
 * Start a short microphone recording from a user gesture.
 * Decodes MediaRecorder output → mono Float32 @ 16 kHz for Whisper.
 */
export async function startAudioCapture(
  options: {
    maxMs?: number
    onMaxDuration?: () => void
  } = {},
): Promise<AudioCaptureSession> {
  const maxMs = options.maxMs ?? WHISPER_MAX_RECORD_MS
  const stream = await navigator.mediaDevices.getUserMedia({
    audio: {
      echoCancellation: true,
      noiseSuppression: true,
      channelCount: 1,
    },
  })

  const mimeType = [
    'audio/webm;codecs=opus',
    'audio/webm',
    'audio/mp4',
    'audio/ogg;codecs=opus',
  ].find((candidate) => MediaRecorder.isTypeSupported(candidate))

  const recorder = mimeType
    ? new MediaRecorder(stream, { mimeType })
    : new MediaRecorder(stream)

  const chunks: BlobPart[] = []
  const startedAt = performance.now()
  let maxTimer: number | null = null
  let stopped = false

  recorder.ondataavailable = (event) => {
    if (event.data.size > 0) chunks.push(event.data)
  }

  const stopTracks = () => {
    stream.getTracks().forEach((track) => track.stop())
  }

  const decodeToWhisperPcm = async (): Promise<Float32Array> => {
    const blob = new Blob(chunks, { type: recorder.mimeType || 'audio/webm' })
    if (blob.size === 0) return new Float32Array(0)
    const AudioCtx = getAudioContextCtor()
    if (!AudioCtx) throw new Error('Web Audio is unavailable in this browser.')
    const ctx = new AudioCtx()
    try {
      if (ctx.state === 'suspended') await ctx.resume()
      const arrayBuffer = await blob.arrayBuffer()
      const decoded = await ctx.decodeAudioData(arrayBuffer.slice(0))
      const mono = mixToMono(decoded)
      return resampleMono(mono, decoded.sampleRate, WHISPER_SAMPLE_RATE)
    } finally {
      await ctx.close().catch(() => undefined)
    }
  }

  const stop = async (): Promise<Float32Array> => {
    if (stopped) return decodeToWhisperPcm()
    stopped = true
    if (maxTimer != null) window.clearTimeout(maxTimer)
    const pcm = await new Promise<Float32Array>((resolve, reject) => {
      recorder.onerror = () => {
        stopTracks()
        reject(new Error('Recording failed.'))
      }
      recorder.onstop = () => {
        stopTracks()
        void decodeToWhisperPcm().then(resolve).catch(reject)
      }
      if (recorder.state === 'recording') recorder.stop()
      else {
        stopTracks()
        resolve(new Float32Array(0))
      }
    })
    return pcm
  }

  const cancel = () => {
    if (stopped) return
    stopped = true
    if (maxTimer != null) window.clearTimeout(maxTimer)
    try {
      if (recorder.state === 'recording') recorder.stop()
    } catch {
      /* ignore */
    }
    stopTracks()
    chunks.length = 0
  }

  recorder.start(200)
  maxTimer = window.setTimeout(() => {
    options.onMaxDuration?.()
    void stop()
  }, maxMs)

  return {
    stop,
    cancel,
    getElapsedMs: () => performance.now() - startedAt,
  }
}

export function canCaptureAudio(
  win: (Window & typeof globalThis) | undefined = typeof window !== 'undefined' ? window : undefined,
): boolean {
  if (!win?.isSecureContext) return false
  if (!win.navigator?.mediaDevices?.getUserMedia) return false
  if (typeof win.MediaRecorder === 'undefined') return false
  return Boolean(getAudioContextCtor(win))
}
