import { useEffect, useRef, useState, type MouseEvent } from 'react'
import { useLocale } from '../../lib/i18n/locale'
import { canCaptureAudio, startAudioCapture, type AudioCaptureSession } from '../../lib/speech/audioCapture'
import { decideNativeFallback, isWhisperCapable, whisperLanguageFromSpeechLang } from '../../lib/speech/fallbackDecision'
import {
  amharicRecognitionNote,
  detectVoiceSupport,
  extractTranscript,
  phaseStatus,
  stopRecognition,
  toSpeechLocale,
  voiceDebug,
  voiceErrorMessage,
  voiceMessage,
  voiceStoppedMessage,
  voiceUiLabels,
  type BrowserSpeechRecognition,
  type VoicePhase,
  type VoiceSearchLang,
} from '../../lib/speech/voiceSearchSupport'
import { ensureWhisperLoaded, isWhisperClientAvailable, transcribeWithWhisper } from '../../lib/speech/whisperClient'
import type { NativeSpeechErrorCode } from '../../lib/speech/speechTypes'
import styles from './MezmurVoiceSearch.module.css'

function mapNativeError(code: string): NativeSpeechErrorCode {
  const known: NativeSpeechErrorCode[] = [
    'not-allowed',
    'service-not-allowed',
    'no-speech',
    'audio-capture',
    'network',
    'language-not-supported',
    'bad-grammar',
    'aborted',
  ]
  return (known as string[]).includes(code) ? (code as NativeSpeechErrorCode) : 'unknown'
}

export function MezmurVoiceSearch({
  onTranscript,
  onFinalTranscript,
  active = true,
  compact = false,
}: {
  onTranscript: (text: string) => void
  onFinalTranscript?: (text: string) => void
  active?: boolean
  compact?: boolean
}) {
  const { locale } = useLocale()
  const [languageOverride, setLanguageOverride] = useState<VoiceSearchLang | null>(null)
  const language = languageOverride ?? toSpeechLocale(locale)
  const [phase, setPhase] = useState<VoicePhase>('idle')
  const [status, setStatus] = useState('')
  const recognitionRef = useRef<BrowserSpeechRecognition | null>(null)
  const captureRef = useRef<AudioCaptureSession | null>(null)
  const phaseRef = useRef<VoicePhase>('idle')
  const ignoreAbortedRef = useRef(false)
  const startWatchdogRef = useRef<number | null>(null)
  const preferWhisperNextTapRef = useRef(false)
  const cancelledRef = useRef(false)
  const ui = locale === 'am' ? 'am' : 'en'
  const labels = voiceUiLabels(ui)
  const nativeSupport = detectVoiceSupport()
  const whisperCapable = isWhisperCapable() && isWhisperClientAvailable() && canCaptureAudio()

  function setPhaseSafe(next: VoicePhase) {
    phaseRef.current = next
    setPhase(next)
  }

  function clearStartWatchdog() {
    if (startWatchdogRef.current != null) {
      window.clearTimeout(startWatchdogRef.current)
      startWatchdogRef.current = null
    }
  }

  function hardStopNative(reason: string) {
    clearStartWatchdog()
    const recognition = recognitionRef.current
    if (!recognition) return
    ignoreAbortedRef.current = true
    recognitionRef.current = null
    stopRecognition(recognition)
    voiceDebug('hardStopNative', reason)
  }

  function cancelCapture() {
    captureRef.current?.cancel()
    captureRef.current = null
  }

  function stopAll(reason: 'user' | 'inactive' | 'unmount' | 'lang-change') {
    cancelledRef.current = true
    hardStopNative(reason)
    cancelCapture()
    if (reason === 'lang-change') {
      setPhaseSafe('idle')
      setStatus('')
      return
    }
    if (reason === 'user' || reason === 'inactive') {
      setPhaseSafe('idle')
      setStatus(voiceStoppedMessage(ui))
    }
  }

  useEffect(() => {
    if (!nativeSupport.ok && !whisperCapable) {
      setPhaseSafe('unsupported')
      setStatus(voiceMessage(ui, 'textOnly'))
    }
    return () => stopAll('unmount')
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [])

  useEffect(() => {
    if (active) return
    stopAll('inactive')
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [active])

  useEffect(() => {
    if (typeof document === 'undefined') return
    const onVisibility = () => {
      if (document.visibilityState === 'hidden') stopAll('inactive')
    }
    document.addEventListener('visibilitychange', onVisibility)
    return () => document.removeEventListener('visibilitychange', onVisibility)
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [ui])

  async function runWhisperFallback(trigger: string) {
    if (!whisperCapable) {
      setPhaseSafe('error')
      setStatus(voiceMessage(ui, 'textOnly'))
      return
    }

    cancelledRef.current = false
    voiceDebug('whisper fallback', trigger)
    preferWhisperNextTapRef.current = false

    try {
      setPhaseSafe('requesting-mic')
      setStatus(phaseStatus('requesting-mic', '', ui))
      const capture = await startAudioCapture({
        onMaxDuration: () => {
          voiceDebug('max recording duration')
        },
      })
      if (cancelledRef.current) {
        capture.cancel()
        return
      }
      captureRef.current = capture
      setPhaseSafe('recording')
      setStatus(`${phaseStatus('recording', '', ui)} ${voiceMessage(ui, 'offlineLocal')}`)

      // Warm model while user speaks (lazy; singleton).
      void ensureWhisperLoaded((info) => {
        if (phaseRef.current !== 'recording' && phaseRef.current !== 'loading-model') return
        if (typeof info.progress === 'number') {
          setStatus(voiceMessage(ui, 'downloadingModel', { progress: String(Math.round(info.progress)) }))
        }
      }).catch((error) => voiceDebug('prefetch model failed', error))
    } catch (error) {
      voiceDebug('getUserMedia failed', error)
      const name = error instanceof DOMException ? error.name : ''
      if (name === 'NotAllowedError' || name === 'PermissionDeniedError') {
        setPhaseSafe('error')
        setStatus(voiceErrorMessage('not-allowed', ui))
        return
      }
      if (name === 'NotFoundError') {
        setPhaseSafe('error')
        setStatus(voiceErrorMessage('audio-capture', ui))
        return
      }
      // Lost user-gesture or transient failure: ask for an explicit second tap.
      preferWhisperNextTapRef.current = true
      setPhaseSafe('native-failed')
      setStatus(voiceMessage(ui, 'tapAgainOffline'))
    }
  }

  async function finishWhisperRecording() {
    const capture = captureRef.current
    if (!capture) return
    captureRef.current = null
    try {
      setPhaseSafe('loading-model')
      setStatus(voiceMessage(ui, 'preparingOffline'))
      const pcm = await capture.stop()
      if (cancelledRef.current) return
      if (pcm.length === 0) {
        setPhaseSafe('error')
        setStatus(voiceMessage(ui, 'emptyTranscript'))
        return
      }

      setPhaseSafe('processing')
      setStatus(voiceMessage(ui, 'transcribing'))
      const text = await transcribeWithWhisper(
        pcm,
        whisperLanguageFromSpeechLang(language),
        (info) => {
          if (info.status === 'transcribing') {
            setStatus(voiceMessage(ui, 'transcribing'))
            return
          }
          if (typeof info.progress === 'number') {
            setStatus(voiceMessage(ui, 'downloadingModel', { progress: String(Math.round(info.progress)) }))
          } else if (info.status === 'loading' || info.status === 'initiate' || info.status === 'download') {
            setStatus(voiceMessage(ui, 'downloadingModelIndeterminate'))
          }
        },
      )
      if (cancelledRef.current) return
      const transcript = text.trim()
      if (!transcript) {
        setPhaseSafe('error')
        setStatus(voiceMessage(ui, 'emptyTranscript'))
        return
      }
      // Raw Ethiopic/Latin from the model — no transliteration/translation.
      onTranscript(transcript)
      onFinalTranscript?.(transcript)
      setPhaseSafe('success')
      setStatus(phaseStatus('processing', transcript, ui))
      window.setTimeout(() => {
        if (phaseRef.current === 'success') setPhaseSafe('idle')
      }, 1200)
    } catch (error) {
      voiceDebug('whisper finish failed', error)
      if (cancelledRef.current) return
      setPhaseSafe('error')
      setStatus(voiceMessage(ui, 'whisperFailed'))
    }
  }

  function handleNativeFailure(code: NativeSpeechErrorCode) {
    hardStopNative(code)
    const decision = decideNativeFallback(code, whisperCapable)
    voiceDebug('native failure decision', code, decision)
    if (decision.action === 'permission') {
      setPhaseSafe('error')
      setStatus(voiceErrorMessage(code === 'service-not-allowed' ? 'not-allowed' : code, ui))
      return
    }
    if (decision.action === 'retry') {
      setPhaseSafe('error')
      setStatus(voiceErrorMessage(code, ui))
      return
    }
    if (decision.action === 'idle') {
      setPhaseSafe('idle')
      setStatus(voiceStoppedMessage(ui))
      return
    }
    if (decision.action === 'text-only') {
      setPhaseSafe('error')
      setStatus(voiceMessage(ui, 'textOnly'))
      return
    }
    // whisper
    void runWhisperFallback(decision.reason)
  }

  function startNativeRecognition() {
    if (!nativeSupport.ok) {
      void runWhisperFallback('unsupported')
      return
    }

    const recognition = new nativeSupport.ctor()
    recognition.lang = language
    recognition.continuous = false
    recognition.interimResults = false
    recognition.maxAlternatives = 1

    recognition.onstart = () => {
      clearStartWatchdog()
      ignoreAbortedRef.current = false
      setPhaseSafe('listening-native')
      setStatus(phaseStatus('listening-native', '', ui))
      voiceDebug('native onstart', { lang: language })
    }

    recognition.onresult = (speechEvent) => {
      const { transcript, isFinal } = extractTranscript(speechEvent)
      if (!transcript) return
      onTranscript(transcript)
      if (isFinal) {
        onFinalTranscript?.(transcript)
        setPhaseSafe('processing')
        setStatus(phaseStatus('processing', transcript, ui))
      }
    }

    recognition.onerror = (speechEvent) => {
      clearStartWatchdog()
      if (speechEvent.error === 'aborted' && ignoreAbortedRef.current) {
        ignoreAbortedRef.current = false
        return
      }
      handleNativeFailure(mapNativeError(speechEvent.error))
    }

    recognition.onend = () => {
      clearStartWatchdog()
      if (recognitionRef.current === recognition) recognitionRef.current = null
      const prior = phaseRef.current
      if (prior === 'processing') {
        setPhaseSafe('idle')
        return
      }
      if (prior === 'listening-native' || prior === 'starting-native') {
        // Ended with no usable transcript and no error path.
        setPhaseSafe('idle')
      }
    }

    recognitionRef.current = recognition
    ignoreAbortedRef.current = false
    cancelledRef.current = false
    setPhaseSafe('starting-native')
    setStatus(phaseStatus('starting-native', '', ui))
    startWatchdogRef.current = window.setTimeout(() => {
      if (phaseRef.current === 'starting-native' && recognitionRef.current === recognition) {
        handleNativeFailure('start-timeout')
      }
    }, 4000)

    try {
      recognition.start()
    } catch (error) {
      clearStartWatchdog()
      recognitionRef.current = null
      voiceDebug('native start threw', error)
      handleNativeFailure('start-threw')
    }
  }

  function toggleListening(event: MouseEvent<HTMLButtonElement>) {
    event.preventDefault()
    event.stopPropagation()

    const busyPhases: VoicePhase[] = [
      'starting-native',
      'listening-native',
      'requesting-mic',
      'recording',
      'loading-model',
      'processing',
    ]
    if (busyPhases.includes(phaseRef.current) || recognitionRef.current || captureRef.current) {
      if (phaseRef.current === 'recording') {
        void finishWhisperRecording()
        return
      }
      stopAll('user')
      return
    }

    if (!nativeSupport.ok && !whisperCapable) {
      setPhaseSafe('unsupported')
      setStatus(voiceMessage(ui, 'textOnly'))
      return
    }

    if (preferWhisperNextTapRef.current || !nativeSupport.ok) {
      void runWhisperFallback(preferWhisperNextTapRef.current ? 'second-tap' : 'unsupported')
      return
    }

    startNativeRecognition()
  }

  const busy =
    phase === 'starting-native' ||
    phase === 'listening-native' ||
    phase === 'requesting-mic' ||
    phase === 'recording' ||
    phase === 'loading-model' ||
    phase === 'processing'
  const disabled = phase === 'unsupported'

  const buttonLabel =
    phase === 'starting-native' || phase === 'requesting-mic' || phase === 'loading-model'
      ? labels.starting
      : phase === 'recording'
        ? labels.stop
        : phase === 'listening-native' || phase === 'processing'
          ? labels.stop
          : labels.searchByVoice

  return (
    <div className={compact ? `${styles.root} ${styles.compact}` : styles.root}>
      <label className={styles.language}>
        <span>{labels.voiceLang}</span>
        <select
          value={language}
          disabled={busy}
          onChange={(event) => {
            stopAll('lang-change')
            preferWhisperNextTapRef.current = false
            const next = event.target.value as VoiceSearchLang
            setLanguageOverride(next)
            setStatus(next === 'am-ET' ? amharicRecognitionNote(ui) : '')
            voiceDebug('language override', next)
          }}
        >
          <option value="en-US">English</option>
          <option value="am-ET">አማርኛ</option>
        </select>
      </label>
      <button
        className={`${styles.button} ${busy ? styles.buttonListening : ''} ${phase === 'error' || phase === 'native-failed' ? styles.buttonError : ''}`}
        type="button"
        onClick={toggleListening}
        disabled={disabled}
        aria-pressed={busy}
        aria-label={busy ? labels.stopAria : labels.startAria}
      >
        {buttonLabel}
      </button>
      <p
        className={`${styles.status} ${phase === 'error' || phase === 'unsupported' || phase === 'native-failed' ? styles.statusError : ''}`}
        role="status"
        aria-live="polite"
      >
        {status}
      </p>
    </div>
  )
}
