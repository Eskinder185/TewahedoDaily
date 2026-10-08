import { VOICE_MAX_DURATION_MS } from './speechTypes.ts'

export type AudioBlobSession = {
  stop: () => Promise<Blob>
  cancel: () => void
  getElapsedMs: () => number
  mimeType: string
}

function pickMimeType(): string | undefined {
  if (typeof MediaRecorder === 'undefined') return undefined
  return [
    'audio/webm;codecs=opus',
    'audio/webm',
    'audio/mp4',
    'audio/ogg;codecs=opus',
  ].find((candidate) => MediaRecorder.isTypeSupported(candidate))
}

/** True when getUserMedia + MediaRecorder are available (no Web Audio required). */
export function canRecordAudioBlob(
  win: (Window & typeof globalThis) | undefined = typeof window !== 'undefined' ? window : undefined,
): boolean {
  if (!win?.isSecureContext) return false
  if (!win.navigator?.mediaDevices?.getUserMedia) return false
  return typeof win.MediaRecorder !== 'undefined'
}

/**
 * Record a short microphone clip as a Blob for server transcription.
 * Stops tracks on stop/cancel. Max duration defaults to 15s.
 */
export async function startAudioBlobCapture(
  options: {
    maxMs?: number
    onMaxDuration?: () => void
  } = {},
): Promise<AudioBlobSession> {
  const maxMs = options.maxMs ?? VOICE_MAX_DURATION_MS
  const stream = await navigator.mediaDevices.getUserMedia({
    audio: {
      echoCancellation: true,
      noiseSuppression: true,
      channelCount: 1,
    },
  })

  const mimeType = pickMimeType()
  const recorder = mimeType
    ? new MediaRecorder(stream, { mimeType })
    : new MediaRecorder(stream)

  const chunks: BlobPart[] = []
  const startedAt = performance.now()
  let maxTimer: number | null = null
  let stopped = false
  let stopPromise: Promise<Blob> | null = null

  recorder.ondataavailable = (event) => {
    if (event.data.size > 0) chunks.push(event.data)
  }

  const stopTracks = () => {
    for (const track of stream.getTracks()) {
      try {
        track.stop()
      } catch {
        /* ignore */
      }
    }
  }

  const clearMaxTimer = () => {
    if (maxTimer != null) {
      window.clearTimeout(maxTimer)
      maxTimer = null
    }
  }

  const stop = async (): Promise<Blob> => {
    if (stopPromise) return stopPromise
    stopped = true
    clearMaxTimer()

    stopPromise = new Promise<Blob>((resolve, reject) => {
      const finish = () => {
        stopTracks()
        const type = recorder.mimeType || mimeType || 'audio/webm'
        resolve(new Blob(chunks, { type }))
      }

      recorder.onerror = () => {
        stopTracks()
        reject(new Error('MediaRecorder failed.'))
      }

      if (recorder.state === 'inactive') {
        finish()
        return
      }

      recorder.onstop = finish
      try {
        if (recorder.state === 'recording' || recorder.state === 'paused') {
          recorder.requestData?.()
          recorder.stop()
        } else {
          finish()
        }
      } catch (error) {
        stopTracks()
        reject(error instanceof Error ? error : new Error('Could not stop recording.'))
      }
    })

    return stopPromise
  }

  const cancel = () => {
    if (stopped) {
      stopTracks()
      return
    }
    stopped = true
    clearMaxTimer()
    try {
      if (recorder.state === 'recording' || recorder.state === 'paused') recorder.stop()
    } catch {
      /* ignore */
    }
    stopTracks()
    chunks.length = 0
  }

  maxTimer = window.setTimeout(() => {
    maxTimer = null
    if (stopped) return
    void stop().then(() => {
      options.onMaxDuration?.()
    })
  }, maxMs)

  try {
    recorder.start(250)
  } catch (error) {
    clearMaxTimer()
    stopTracks()
    throw error instanceof Error ? error : new Error('Could not start recording.')
  }

  return {
    stop,
    cancel,
    getElapsedMs: () => performance.now() - startedAt,
    mimeType: recorder.mimeType || mimeType || 'audio/webm',
  }
}
