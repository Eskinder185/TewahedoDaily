import { useEffect, useRef, useState, type MouseEvent } from 'react'
import { useLocale } from '../../lib/i18n/locale'
import { decideNativeFallback, isWhisperCapable } from '../../lib/speech/fallbackDecision'
import {
  VOICE_MAX_LISTEN_MS,
  VOICE_RECOGNITION_LANG,
  type NativeSpeechErrorCode,
} from '../../lib/speech/speechTypes'
import {
  detectVoiceSupport,
  extractTranscript,
  phaseStatus,
  stopRecognition,
  voiceDebug,
  voiceErrorMessage,
  voiceMessage,
  voiceStoppedMessage,
  voiceUiLabels,
  type BrowserSpeechRecognition,
  type VoicePhase,
} from '../../lib/speech/voiceSearchSupport'
import { disposeWhisperClient } from '../../lib/speech/whisperClient'
import styles from './MezmurVoiceSearch.module.css'

const VOICE_MAX_SECONDS = Math.round(VOICE_MAX_LISTEN_MS / 1000)

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
  helperCaption,
}: {
  onTranscript: (text: string) => void
  onFinalTranscript?: (text: string) => void
  active?: boolean
  compact?: boolean
  /** Optional muted caption (e.g. transliteration letter guidance). */
  helperCaption?: string
}) {
  const { locale } = useLocale()
  const [phase, setPhase] = useState<VoicePhase>('idle')
  const [status, setStatus] = useState('')
  const recognitionRef = useRef<BrowserSpeechRecognition | null>(null)
  const phaseRef = useRef<VoicePhase>('idle')
  const ignoreAbortedRef = useRef(false)
  const startWatchdogRef = useRef<number | null>(null)
  const voiceTimeoutRef = useRef<number | null>(null)
  const voiceCountdownRef = useRef<number | null>(null)
  const voiceSessionRef = useRef(0)
  const heardFinalRef = useRef(false)
  const ui = locale === 'am' ? 'am' : 'en'
  const labels = voiceUiLabels(ui)
  const nativeSupport = detectVoiceSupport()
  const whisperCapable = isWhisperCapable()

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

  function clearVoiceTimeout() {
    if (voiceTimeoutRef.current != null) {
      window.clearTimeout(voiceTimeoutRef.current)
      voiceTimeoutRef.current = null
    }
    if (voiceCountdownRef.current != null) {
      window.clearInterval(voiceCountdownRef.current)
      voiceCountdownRef.current = null
    }
  }

  function startVoiceTimeout(sessionId: number, onTimeout: () => void) {
    clearVoiceTimeout()
    let secondsLeft = VOICE_MAX_SECONDS
    const tickStatus = () => {
      if (voiceSessionRef.current !== sessionId) return
      if (phaseRef.current === 'listening-native') {
        setStatus(voiceMessage(ui, 'listeningCountdown', { seconds: String(secondsLeft) }))
      }
    }
    tickStatus()
    voiceCountdownRef.current = window.setInterval(() => {
      if (voiceSessionRef.current !== sessionId) {
        clearVoiceTimeout()
        return
      }
      secondsLeft = Math.max(0, secondsLeft - 1)
      if (secondsLeft > 0) tickStatus()
    }, 1000)
    voiceTimeoutRef.current = window.setTimeout(() => {
      voiceTimeoutRef.current = null
      if (voiceCountdownRef.current != null) {
        window.clearInterval(voiceCountdownRef.current)
        voiceCountdownRef.current = null
      }
      if (voiceSessionRef.current !== sessionId) return
      voiceDebug('voice max duration', { sessionId })
      onTimeout()
    }, VOICE_MAX_LISTEN_MS)
  }

  function hardStopNative(reason: string) {
    clearStartWatchdog()
    clearVoiceTimeout()
    const recognition = recognitionRef.current
    if (!recognition) return
    ignoreAbortedRef.current = true
    recognitionRef.current = null
    stopRecognition(recognition)
    voiceDebug('hardStopNative', reason)
  }

  /** Soft stop keeps handlers so final results can still arrive. */
  function softStopNative(reason: string) {
    clearStartWatchdog()
    clearVoiceTimeout()
    const recognition = recognitionRef.current
    if (!recognition) return
    voiceDebug('softStopNative', reason)
    try {
      recognition.stop()
    } catch {
      /* ignore */
    }
  }

  function showUnavailableFallback(reason: string) {
    voiceDebug('voice unavailable', { reason, lang: VOICE_RECOGNITION_LANG })
    setPhaseSafe('error')
    setStatus(voiceMessage(ui, 'textOnly'))
  }

  function stopAll(reason: 'user' | 'inactive' | 'unmount') {
    voiceSessionRef.current += 1
    clearVoiceTimeout()
    hardStopNative(reason)
    disposeWhisperClient()
    if (reason === 'user' || reason === 'inactive') {
      setPhaseSafe('idle')
      setStatus(voiceStoppedMessage(ui))
    }
  }

  useEffect(() => {
    disposeWhisperClient()
    if (!nativeSupport.ok) {
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

  function handleNativeFailure(code: NativeSpeechErrorCode) {
    hardStopNative(code)
    const decision = decideNativeFallback(code, whisperCapable)
    voiceDebug('native failure decision', { code, lang: VOICE_RECOGNITION_LANG, decision, whisperCapable })

    if (decision.action === 'whisper') {
      showUnavailableFallback(decision.reason)
      return
    }
    if (decision.action === 'permission') {
      setPhaseSafe('error')
      setStatus(voiceErrorMessage(code, ui))
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
    if (code === 'audio-capture') {
      setPhaseSafe('error')
      setStatus(voiceErrorMessage(code, ui))
      return
    }
    showUnavailableFallback(decision.reason)
  }

  function startNativeRecognition() {
    if (!nativeSupport.ok) {
      showUnavailableFallback('unsupported')
      return
    }

    const sessionId = ++voiceSessionRef.current
    heardFinalRef.current = false

    const recognition = new nativeSupport.ctor()
    recognition.continuous = false
    recognition.interimResults = false
    recognition.maxAlternatives = 1

    recognition.onstart = () => {
      clearStartWatchdog()
      ignoreAbortedRef.current = false
      if (voiceSessionRef.current !== sessionId) return
      setPhaseSafe('listening-native')
      startVoiceTimeout(sessionId, () => {
        softStopNative('max-listen')
      })
      voiceDebug('native onstart', { lang: recognition.lang, sessionId })
    }

    recognition.onresult = (speechEvent) => {
      const { transcript, isFinal } = extractTranscript(speechEvent)
      if (!transcript) return
      onTranscript(transcript)
      if (isFinal) {
        heardFinalRef.current = true
        clearVoiceTimeout()
        onFinalTranscript?.(transcript)
        setPhaseSafe('processing')
        setStatus(phaseStatus('processing', transcript, ui))
      }
    }

    recognition.onerror = (speechEvent) => {
      clearStartWatchdog()
      clearVoiceTimeout()
      if (import.meta.env.DEV) {
        console.debug('SpeechRecognition error', {
          error: speechEvent.error,
          message: speechEvent.message,
          locale: recognition.lang,
        })
      }
      voiceDebug('native onerror', {
        error: speechEvent.error,
        message: speechEvent.message,
        locale: recognition.lang,
      })
      if (speechEvent.error === 'aborted' && ignoreAbortedRef.current) {
        ignoreAbortedRef.current = false
        return
      }
      handleNativeFailure(mapNativeError(speechEvent.error))
    }

    recognition.onend = () => {
      clearStartWatchdog()
      clearVoiceTimeout()
      if (recognitionRef.current === recognition) recognitionRef.current = null
      const prior = phaseRef.current
      if (prior === 'processing' || heardFinalRef.current) {
        setPhaseSafe('idle')
        return
      }
      if (prior === 'listening-native' || prior === 'starting-native') {
        setPhaseSafe('error')
        setStatus(voiceMessage(ui, 'noSpeech'))
      }
    }

    recognitionRef.current = recognition
    ignoreAbortedRef.current = false
    setPhaseSafe('starting-native')
    setStatus(phaseStatus('starting-native', '', ui))
    startWatchdogRef.current = window.setTimeout(() => {
      if (phaseRef.current === 'starting-native' && recognitionRef.current === recognition) {
        handleNativeFailure('start-timeout')
      }
    }, 4000)

    try {
      recognition.lang = VOICE_RECOGNITION_LANG
      voiceDebug('native start', { lang: recognition.lang, sessionId })
      recognition.start()
    } catch (error) {
      clearStartWatchdog()
      clearVoiceTimeout()
      recognitionRef.current = null
      voiceDebug('native start threw', error)
      handleNativeFailure('start-threw')
    }
  }

  function toggleListening(event: MouseEvent<HTMLButtonElement>) {
    event.preventDefault()
    event.stopPropagation()

    const busyPhases: VoicePhase[] = ['starting-native', 'listening-native', 'processing']
    if (busyPhases.includes(phaseRef.current) || recognitionRef.current) {
      stopAll('user')
      return
    }

    if (!nativeSupport.ok) {
      showUnavailableFallback('unsupported')
      return
    }

    startNativeRecognition()
  }

  const busy =
    phase === 'starting-native' || phase === 'listening-native' || phase === 'processing'
  const disabled = phase === 'unsupported'

  const buttonLabel =
    phase === 'starting-native'
      ? labels.starting
      : phase === 'listening-native' || phase === 'processing'
        ? labels.stop
        : labels.searchByVoice

  return (
    <div className={compact ? `${styles.root} ${styles.compact}` : styles.root}>
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
      {helperCaption ? <p className={styles.helperCaption}>{helperCaption}</p> : null}
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
