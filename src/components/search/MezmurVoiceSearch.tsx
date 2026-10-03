import { useEffect, useRef, useState } from 'react'
import { useLocale } from '../../lib/i18n/locale'
import {
  amharicRecognitionNote,
  detectVoiceSupport,
  extractTranscript,
  listeningStatus,
  stopRecognition,
  voiceErrorMessage,
  voiceStartFailedMessage,
  voiceStoppedMessage,
  voiceSupportMessage,
  voiceUiLabels,
  type BrowserSpeechRecognition,
  type VoiceSearchLang,
} from '../../lib/speech/voiceSearchSupport'
import styles from './MezmurVoiceSearch.module.css'

export function MezmurVoiceSearch({
  onTranscript,
  active = true,
  compact = false,
}: {
  onTranscript: (text: string) => void
  /** When false, stop any active recognition (e.g. Search Buddy panel closed). */
  active?: boolean
  compact?: boolean
}) {
  const { locale } = useLocale()
  const [languageOverride, setLanguageOverride] = useState<VoiceSearchLang | null>(null)
  const language = languageOverride ?? (locale === 'am' ? 'am-ET' : 'en-US')
  const [listening, setListening] = useState(false)
  const [status, setStatus] = useState('')
  const recognitionRef = useRef<BrowserSpeechRecognition | null>(null)
  const ui = locale === 'am' ? 'am' : 'en'
  const labels = voiceUiLabels(ui)

  useEffect(() => {
    return () => {
      stopRecognition(recognitionRef.current)
      recognitionRef.current = null
    }
  }, [])

  useEffect(() => {
    if (active) return
    if (!recognitionRef.current) return
    stopRecognition(recognitionRef.current)
    recognitionRef.current = null
    setListening(false)
  }, [active])

  useEffect(() => {
    if (typeof document === 'undefined') return
    const onVisibility = () => {
      if (document.visibilityState !== 'hidden') return
      if (!recognitionRef.current) return
      stopRecognition(recognitionRef.current)
      recognitionRef.current = null
      setListening(false)
      setStatus(voiceStoppedMessage(ui))
    }
    document.addEventListener('visibilitychange', onVisibility)
    return () => document.removeEventListener('visibilitychange', onVisibility)
  }, [ui])

  function toggleListening() {
    if (recognitionRef.current) {
      recognitionRef.current.stop()
      setStatus(voiceStoppedMessage(ui))
      return
    }

    const support = detectVoiceSupport()
    if (!support.ok) {
      setStatus(voiceSupportMessage(support.stage, ui))
      return
    }

    const recognition = new support.ctor()
    recognition.lang = language
    recognition.continuous = false
    recognition.interimResults = true
    recognition.maxAlternatives = 1
    recognition.onresult = (event) => {
      const { transcript, isFinal } = extractTranscript(event)
      if (!transcript) return
      // Keep the search field editable — user can revise before / after results settle.
      onTranscript(transcript)
      setStatus(listeningStatus(transcript, isFinal, ui))
    }
    recognition.onerror = (event) => {
      setStatus(voiceErrorMessage(event.error, ui))
    }
    recognition.onend = () => {
      if (recognitionRef.current === recognition) recognitionRef.current = null
      setListening(false)
    }
    recognitionRef.current = recognition
    try {
      // Must stay in the user-gesture call stack for mobile browsers.
      recognition.start()
      setListening(true)
      setStatus(
        language === 'am-ET'
          ? `${listeningStatus('', false, ui)} ${amharicRecognitionNote(ui)}`
          : listeningStatus('', false, ui),
      )
    } catch {
      recognitionRef.current = null
      setListening(false)
      setStatus(voiceStartFailedMessage(ui))
    }
  }

  return (
    <div className={compact ? `${styles.root} ${styles.compact}` : styles.root}>
      <label className={styles.language}>
        <span>{labels.voiceLang}</span>
        <select
          value={language}
          onChange={(event) => {
            recognitionRef.current?.stop()
            setLanguageOverride(event.target.value as VoiceSearchLang)
            if (event.target.value === 'am-ET') {
              setStatus(amharicRecognitionNote(ui))
            }
          }}
        >
          <option value="en-US">English</option>
          <option value="am-ET">አማርኛ</option>
        </select>
      </label>
      <button className={styles.button} type="button" onClick={toggleListening} aria-pressed={listening}>
        {listening ? labels.stop : labels.searchByVoice}
      </button>
      <p className={styles.status} role="status" aria-live="polite">
        {status}
      </p>
    </div>
  )
}
