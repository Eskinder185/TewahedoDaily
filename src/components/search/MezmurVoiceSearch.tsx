import { useEffect, useId, useRef, useState, type MouseEvent } from 'react'
import {
  AiClientError,
  canAttemptAmharicTranscription,
  transcribeAudio,
} from '../../lib/ai'
import { useLocale } from '../../lib/i18n/locale'
import { decideNativeFallback, isWhisperCapable } from '../../lib/speech/fallbackDecision'
import {
  canRecordAudioBlob,
  startAudioBlobCapture,
  type AudioBlobSession,
} from '../../lib/speech/recordAudioBlob'
import {
  VOICE_MAX_DURATION_MS,
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

const VOICE_MAX_SECONDS = Math.round(VOICE_MAX_DURATION_MS / 1000)

export type VoiceInputLanguage = 'en' | 'am'

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
  startAriaLabel,
  defaultLanguage = 'en',
  amharicOnly = false,
}: {
  onTranscript: (text: string) => void
  onFinalTranscript?: (text: string) => void
  active?: boolean
  compact?: boolean
  /** Optional muted caption (e.g. transliteration letter guidance). */
  helperCaption?: string
  /** Idle-state microphone aria-label (context-specific: hymns / Bible / assistant). */
  startAriaLabel?: string
  /**
   * Initial voice language. Mezmur Practice should pass "am" so the badge is አማ
   * and recording uses POST /api/transcribe (not browser SpeechRecognition).
   */
  defaultLanguage?: VoiceInputLanguage
  /**
   * Mezmur Practice: lock to Amharic + POST /api/transcribe.
   * Hides the EN language chip and never starts browser SpeechRecognition.
   */
  amharicOnly?: boolean
}) {
  const { locale } = useLocale()
  const langGroupId = useId()
  const [voiceLang, setVoiceLang] = useState<VoiceInputLanguage>(
    amharicOnly ? 'am' : defaultLanguage,
  )
  const [langMenuOpen, setLangMenuOpen] = useState(false)
  const [phase, setPhase] = useState<VoicePhase>('idle')
  const [status, setStatus] = useState('')
  const recognitionRef = useRef<BrowserSpeechRecognition | null>(null)
  const recordSessionRef = useRef<AudioBlobSession | null>(null)
  const transcribeAbortRef = useRef<AbortController | null>(null)
  const mountedRef = useRef(true)
  const phaseRef = useRef<VoicePhase>('idle')
  const ignoreAbortedRef = useRef(false)
  const startWatchdogRef = useRef<number | null>(null)
  const voiceTimeoutRef = useRef<number | null>(null)
  const voiceCountdownRef = useRef<number | null>(null)
  const voiceSessionRef = useRef(0)
  const amharicFinishRef = useRef(false)
  const heardFinalRef = useRef(false)
  const ui = locale === 'am' ? 'am' : 'en'
  const labels = voiceUiLabels(ui)
  const nativeSupport = detectVoiceSupport()
  const whisperCapable = isWhisperCapable()
  const amharicReady = canAttemptAmharicTranscription()
  const canRecordAmharic = canRecordAudioBlob()

  function setPhaseSafe(next: VoicePhase) {
    phaseRef.current = next
    if (mountedRef.current) setPhase(next)
  }

  function setStatusSafe(next: string) {
    if (mountedRef.current) setStatus(next)
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

  function abortTranscription() {
    if (transcribeAbortRef.current) {
      transcribeAbortRef.current.abort()
      transcribeAbortRef.current = null
    }
  }

  function cancelRecordingSession() {
    const session = recordSessionRef.current
    recordSessionRef.current = null
    session?.cancel()
  }

  function startVoiceTimeout(sessionId: number, onTimeout: () => void, countdownLabel: 'listening' | 'amharic') {
    clearVoiceTimeout()
    let secondsLeft = VOICE_MAX_SECONDS
    const tickStatus = () => {
      if (voiceSessionRef.current !== sessionId) return
      if (countdownLabel === 'amharic') {
        setStatusSafe(`Recording Amharic… ${secondsLeft}s`)
        return
      }
      if (phaseRef.current === 'listening-native') {
        setStatusSafe(voiceMessage(ui, 'listeningCountdown', { seconds: String(secondsLeft) }))
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
    }, VOICE_MAX_DURATION_MS)
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
    setStatusSafe(voiceMessage(ui, 'textOnly'))
  }

  function stopAll(reason: 'user' | 'inactive' | 'unmount') {
    voiceSessionRef.current += 1
    clearVoiceTimeout()
    clearStartWatchdog()
    hardStopNative(reason)
    abortTranscription()
    cancelRecordingSession()
    disposeWhisperClient()
    if (reason === 'user' || reason === 'inactive') {
      setPhaseSafe('idle')
      setStatusSafe(voiceStoppedMessage(ui))
    }
  }

  useEffect(() => {
    mountedRef.current = true
    disposeWhisperClient()
    return () => {
      mountedRef.current = false
      stopAll('unmount')
    }
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

  const showAmharicOption = amharicReady && canRecordAmharic
  // Mezmur: keep አማ (never auto-flip to EN). Search Buddy (default en) may fall back.
  const lockAmharicDefault = amharicOnly || defaultLanguage === 'am'

  useEffect(() => {
    if (amharicOnly && voiceLang !== 'am') setVoiceLang('am')
  }, [amharicOnly, voiceLang])

  useEffect(() => {
    if (voiceLang === 'am' && !showAmharicOption && !lockAmharicDefault) {
      setVoiceLang('en')
    }
  }, [voiceLang, showAmharicOption, lockAmharicDefault])

  useEffect(() => {
    if (!langMenuOpen) return
    const onKey = (e: KeyboardEvent) => {
      if (e.key === 'Escape') setLangMenuOpen(false)
    }
    document.addEventListener('keydown', onKey)
    return () => document.removeEventListener('keydown', onKey)
  }, [langMenuOpen])

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
      setStatusSafe(voiceErrorMessage(code, ui))
      return
    }
    if (decision.action === 'retry') {
      setPhaseSafe('error')
      setStatusSafe(voiceErrorMessage(code, ui))
      return
    }
    if (decision.action === 'idle') {
      setPhaseSafe('idle')
      setStatusSafe(voiceStoppedMessage(ui))
      return
    }
    if (code === 'audio-capture') {
      setPhaseSafe('error')
      setStatusSafe(voiceErrorMessage(code, ui))
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
      }, 'listening')
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
        setStatusSafe(phaseStatus('processing', transcript, ui))
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
        setStatusSafe(voiceMessage(ui, 'noSpeech'))
      }
    }

    recognitionRef.current = recognition
    ignoreAbortedRef.current = false
    setPhaseSafe('starting-native')
    setStatusSafe(phaseStatus('starting-native', '', ui))
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

  function amharicTranscriptionErrorMessage(error: unknown): string {
    if (error instanceof AiClientError) {
      if (error.code === 'aborted') return ''
      if (error.code === 'transcription_failed' && error.message.trim()) return error.message
      if (error.code === 'not_configured') {
        return import.meta.env.DEV
          ? error.message
          : 'Amharic voice transcription is temporarily unavailable.'
      }
    }
    return 'Amharic voice transcription is temporarily unavailable.'
  }

  async function finishAmharicRecording(sessionId: number, session: AudioBlobSession) {
    if (amharicFinishRef.current) return
    amharicFinishRef.current = true
    clearVoiceTimeout()
    setPhaseSafe('processing')
    setStatusSafe(voiceMessage(ui, 'transcribing'))

    let blob: Blob
    try {
      blob = await session.stop()
    } catch {
      if (!mountedRef.current) return
      recordSessionRef.current = null
      setPhaseSafe('error')
      setStatusSafe(voiceMessage(ui, 'audioCapture'))
      return
    } finally {
      if (recordSessionRef.current === session) recordSessionRef.current = null
    }

    if (!mountedRef.current) return
    // A newer voice session started — drop this stale recording.
    if (voiceSessionRef.current !== sessionId) return

    const controller = new AbortController()
    transcribeAbortRef.current = controller
    try {
      const result = await transcribeAudio(blob, {
        signal: controller.signal,
        language: 'am',
      })
      if (!mountedRef.current) return
      if (controller.signal.aborted) return

      const transcript = result.text?.trim() || ''
      if (import.meta.env.DEV) {
        console.log('Amharic transcript response', result)
        console.log('Setting search input to', transcript)
      }
      if (!transcript) {
        setPhaseSafe('error')
        setStatusSafe(voiceMessage(ui, 'emptyTranscript'))
        return
      }

      // Always push into the Search Buddy / parent input. Do not gate on session
      // bumps from accidental Stop clicks during "Transcribing…".
      onTranscript(transcript)
      onFinalTranscript?.(transcript)
      setPhaseSafe('idle')
      setStatusSafe(voiceMessage(ui, 'heard', { transcript }))
    } catch (error) {
      if (!mountedRef.current) return
      if (error instanceof AiClientError && error.code === 'aborted') {
        setPhaseSafe('idle')
        setStatusSafe(voiceStoppedMessage(ui))
        return
      }
      const notice = amharicTranscriptionErrorMessage(error)
      if (!notice) {
        setPhaseSafe('idle')
        setStatusSafe(voiceStoppedMessage(ui))
        return
      }
      setPhaseSafe('error')
      setStatusSafe(notice)
    } finally {
      if (transcribeAbortRef.current === controller) transcribeAbortRef.current = null
    }
  }

  async function startAmharicRecording() {
    if (!amharicReady) {
      setPhaseSafe('error')
      setStatusSafe(
        import.meta.env.DEV
          ? 'Developer: set VITE_TEWAHEDO_AI_API_URL to enable Amharic transcription.'
          : 'Amharic voice is temporarily unavailable. You can still type your search.',
      )
      return
    }
    if (!canRecordAmharic) {
      setPhaseSafe('error')
      setStatusSafe(voiceMessage(ui, 'unsupported'))
      return
    }

    const sessionId = ++voiceSessionRef.current
    amharicFinishRef.current = false
    setPhaseSafe('requesting-mic')
    setStatusSafe(voiceMessage(ui, 'requestingMic'))

    try {
      // Capture auto-stops at 15s; UI countdown also finishes once (guarded).
      const session = await startAudioBlobCapture({
        maxMs: VOICE_MAX_DURATION_MS,
        onMaxDuration: () => {
          if (voiceSessionRef.current !== sessionId) return
          void finishAmharicRecording(sessionId, session)
        },
      })
      if (voiceSessionRef.current !== sessionId || !mountedRef.current) {
        session.cancel()
        return
      }
      recordSessionRef.current = session
      setPhaseSafe('recording')
      // Countdown status only — stop is driven by MediaRecorder max or manual Stop.
      startVoiceTimeout(sessionId, () => {
        /* capture max timer handles stop */
      }, 'amharic')
      setStatusSafe(`Recording Amharic… ${VOICE_MAX_SECONDS}s`)
    } catch (error) {
      if (voiceSessionRef.current !== sessionId || !mountedRef.current) return
      const name = error instanceof DOMException ? error.name : ''
      setPhaseSafe('error')
      if (name === 'NotAllowedError' || name === 'PermissionDeniedError') {
        setStatusSafe(voiceErrorMessage('not-allowed', ui))
      } else if (name === 'NotFoundError' || name === 'DevicesNotFoundError') {
        setStatusSafe(voiceErrorMessage('audio-capture', ui))
      } else {
        setStatusSafe(voiceMessage(ui, 'startFailed'))
      }
    }
  }

  function toggleListening(
    event: MouseEvent<HTMLButtonElement>,
    langOverride?: VoiceInputLanguage,
  ) {
    event.preventDefault()
    event.stopPropagation()

    // While uploading/transcribing, ignore clicks — aborting here was dropping
    // successful transcripts before they reached the Search Buddy input.
    if (phaseRef.current === 'processing' || phaseRef.current === 'requesting-mic') {
      return
    }

    if (phaseRef.current === 'recording' && recordSessionRef.current) {
      const sessionId = voiceSessionRef.current
      const session = recordSessionRef.current
      void finishAmharicRecording(sessionId, session)
      return
    }

    if (
      phaseRef.current === 'starting-native' ||
      phaseRef.current === 'listening-native' ||
      recognitionRef.current
    ) {
      stopAll('user')
      return
    }

    const lang = amharicOnly ? 'am' : (langOverride ?? voiceLang)
    // Mezmur Amharic path: MediaRecorder → POST /api/transcribe only.
    if (lang === 'am' || amharicOnly) {
      void startAmharicRecording()
      return
    }

    if (!nativeSupport.ok) {
      showUnavailableFallback('unsupported')
      return
    }

    startNativeRecognition()
  }

  const busy =
    phase === 'starting-native' ||
    phase === 'listening-native' ||
    phase === 'requesting-mic' ||
    phase === 'recording' ||
    phase === 'processing'
  const sessionActive =
    phase === 'starting-native' ||
    phase === 'listening-native' ||
    phase === 'requesting-mic' ||
    phase === 'recording' ||
    phase === 'processing'
  const disabled =
    phase === 'processing' ||
    phase === 'requesting-mic' ||
    (voiceLang === 'en' && phase === 'unsupported')

  // Mezmur (amharicOnly / default am): always አማ unless the user picks English.
  // Otherwise only advertise Amharic when /api/transcribe is reachable.
  const effectiveLang: VoiceInputLanguage = amharicOnly
    ? 'am'
    : voiceLang === 'am' && (showAmharicOption || lockAmharicDefault)
      ? 'am'
      : 'en'

  const idleAria =
    startAriaLabel ||
    (effectiveLang === 'am' ? 'Start Amharic voice search' : labels.startAria)

  const ariaLabel =
    phase === 'recording'
      ? 'Stop Amharic recording'
      : phase === 'processing' && effectiveLang === 'am'
        ? 'Transcribing Amharic recording'
        : busy
          ? labels.stopAria
          : idleAria

  const sessionTitle =
    phase === 'processing'
      ? voiceMessage(ui, 'transcribing')
      : phase === 'requesting-mic'
        ? voiceMessage(ui, 'requestingMic')
        : phase === 'recording'
          ? 'Recording…'
          : phase === 'listening-native' || phase === 'starting-native'
            ? voiceMessage(ui, 'listening')
            : ''

  function selectLang(next: VoiceInputLanguage) {
    setVoiceLang(next)
    setLangMenuOpen(false)
  }

  function cancelSession(event: MouseEvent<HTMLButtonElement>) {
    event.preventDefault()
    event.stopPropagation()
    stopAll('user')
    setStatusSafe('')
  }

  function stopOrFinish(event: MouseEvent<HTMLButtonElement>) {
    toggleListening(event)
  }

  const micIcon = (
    <svg className={styles.micIcon} viewBox="0 0 24 24" aria-hidden focusable="false">
      <path
        fill="currentColor"
        d="M12 14a3 3 0 0 0 3-3V6a3 3 0 1 0-6 0v5a3 3 0 0 0 3 3Zm5-3a5 5 0 0 1-10 0H5a7 7 0 0 0 6 6.92V21h2v-3.08A7 7 0 0 0 19 11h-2Z"
      />
    </svg>
  )

  const showLangPicker = !amharicOnly && (showAmharicOption || lockAmharicDefault)

  if (compact) {
    return (
      <div className={`${styles.root} ${styles.compact}`}>
        <div className={styles.composerBar}>
          {amharicOnly ? (
            <span className={styles.langChip} aria-label="Voice language Amharic">
              አማ
            </span>
          ) : showLangPicker ? (
            <>
              <button
                type="button"
                className={`${styles.langChip} ${langMenuOpen ? styles.langChipOpen : ''}`}
                aria-haspopup="listbox"
                aria-expanded={langMenuOpen}
                aria-controls={langGroupId}
                disabled={busy}
                onClick={() => setLangMenuOpen((open) => !open)}
              >
                {effectiveLang === 'am' ? 'አማ' : 'EN'}
                <span aria-hidden>▾</span>
              </button>
              {langMenuOpen ? (
                <div
                  id={langGroupId}
                  className={styles.langMenu}
                  role="listbox"
                  aria-label="Voice language"
                >
                  <button
                    type="button"
                    role="option"
                    aria-selected={effectiveLang === 'en'}
                    className={`${styles.langOption} ${effectiveLang === 'en' ? styles.langOptionActive : ''}`}
                    onClick={() => selectLang('en')}
                  >
                    English
                  </button>
                  <button
                    type="button"
                    role="option"
                    aria-selected={effectiveLang === 'am'}
                    className={`${styles.langOption} ${effectiveLang === 'am' ? styles.langOptionActive : ''}`}
                    onClick={() => selectLang('am')}
                  >
                    አማርኛ
                  </button>
                </div>
              ) : null}
            </>
          ) : (
            <span className={styles.srOnly}>English voice</span>
          )}

          <button
            type="button"
            className={`${styles.micBtn} ${sessionActive ? styles.micBtnListening : ''} ${phase === 'error' || phase === 'native-failed' ? styles.micBtnError : ''}`}
            onClick={(e) => {
              setLangMenuOpen(false)
              if (voiceLang !== effectiveLang) setVoiceLang(effectiveLang)
              toggleListening(e, effectiveLang)
            }}
            disabled={disabled}
            aria-pressed={busy}
            aria-label={ariaLabel}
          >
            {micIcon}
          </button>
        </div>

        {sessionActive ? (
          <div className={styles.voiceSession} role="status" aria-live="polite">
            <div className={styles.voiceSessionHead}>
              <span
                className={`${styles.voicePulse} ${phase === 'processing' ? styles.voicePulseProcessing : ''}`}
                aria-hidden
              />
              <div className={styles.voiceSessionCopy}>
                <p className={styles.voiceSessionTitle}>{sessionTitle}</p>
                {status ? <p className={styles.voiceSessionStatus}>{status}</p> : null}
                <p className={styles.voiceSessionStatus}>
                  {effectiveLang === 'am' ? 'አማርኛ · up to 15s' : 'English · up to 15s'}
                </p>
              </div>
            </div>
            <div className={styles.voiceSessionActions}>
              {phase === 'recording' ||
              phase === 'listening-native' ||
              phase === 'starting-native' ? (
                <button
                  type="button"
                  className={`${styles.voiceAction} ${styles.voiceActionPrimary}`}
                  onClick={stopOrFinish}
                >
                  {phase === 'recording' ? 'Stop & use' : 'Stop'}
                </button>
              ) : null}
              {phase !== 'processing' ? (
                <button
                  type="button"
                  className={`${styles.voiceAction} ${styles.voiceActionSecondary}`}
                  onClick={cancelSession}
                >
                  Cancel
                </button>
              ) : (
                <button
                  type="button"
                  className={`${styles.voiceAction} ${styles.voiceActionSecondary}`}
                  disabled
                >
                  {voiceMessage(ui, 'transcribing')}
                </button>
              )}
            </div>
          </div>
        ) : null}

        {!sessionActive && status ? (
          <p
            className={`${styles.idleHint} ${phase === 'error' || phase === 'unsupported' || phase === 'native-failed' ? styles.statusError : ''}`}
            role="status"
            aria-live="polite"
          >
            {status}
          </p>
        ) : null}

        {helperCaption && !sessionActive ? (
          <p className={styles.helperCaption}>{helperCaption}</p>
        ) : null}
      </div>
    )
  }

  return (
    <div className={styles.root}>
      {showLangPicker ? (
        <div
          className={styles.langToggle}
          role="radiogroup"
          aria-label="Voice search language"
          id={langGroupId}
        >
          <button
            type="button"
            className={`${styles.langBtn} ${effectiveLang === 'en' ? styles.langBtnActive : ''}`}
            role="radio"
            aria-checked={effectiveLang === 'en'}
            disabled={busy}
            onClick={() => setVoiceLang('en')}
          >
            English
          </button>
          <button
            type="button"
            className={`${styles.langBtn} ${effectiveLang === 'am' ? styles.langBtnActive : ''}`}
            role="radio"
            aria-checked={effectiveLang === 'am'}
            disabled={busy}
            onClick={() => setVoiceLang('am')}
          >
            አማርኛ
          </button>
        </div>
      ) : null}

      <button
        className={`${styles.button} ${busy ? styles.buttonListening : ''} ${phase === 'error' || phase === 'native-failed' ? styles.buttonError : ''}`}
        type="button"
        onClick={(e) => {
          if (voiceLang !== effectiveLang) setVoiceLang(effectiveLang)
          toggleListening(e, effectiveLang)
        }}
        disabled={disabled}
        aria-pressed={busy}
        aria-label={ariaLabel}
      >
        {busy
          ? phase === 'processing'
            ? voiceMessage(ui, 'transcribing')
            : labels.stop
          : labels.searchByVoice}
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
