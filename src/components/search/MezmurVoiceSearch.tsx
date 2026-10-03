import { useEffect, useRef, useState } from 'react'
import { useLocale } from '../../lib/i18n/locale'
import styles from './MezmurVoiceSearch.module.css'

type SpeechResult = { transcript: string }
type SpeechEvent = { results: ArrayLike<ArrayLike<SpeechResult>>; resultIndex: number }
type SpeechError = { error: string }
type BrowserSpeechRecognition = {
  lang: string
  interimResults: boolean
  maxAlternatives: number
  onresult: ((event: SpeechEvent) => void) | null
  onerror: ((event: SpeechError) => void) | null
  onend: (() => void) | null
  start: () => void
  stop: () => void
  abort: () => void
}
type SpeechConstructor = new () => BrowserSpeechRecognition

function speechConstructor(): SpeechConstructor | undefined {
  if (typeof window === 'undefined') return undefined
  const browser = window as typeof window & {
    SpeechRecognition?: SpeechConstructor
    webkitSpeechRecognition?: SpeechConstructor
  }
  return browser.SpeechRecognition ?? browser.webkitSpeechRecognition
}

export function MezmurVoiceSearch({ onTranscript }: { onTranscript: (text: string) => void }) {
  const { locale } = useLocale()
  const [languageOverride, setLanguageOverride] = useState<'am-ET' | 'en-US' | null>(null)
  const language = languageOverride ?? (locale === 'am' ? 'am-ET' : 'en-US')
  const [listening, setListening] = useState(false)
  const [status, setStatus] = useState('')
  const recognitionRef = useRef<BrowserSpeechRecognition | null>(null)
  const amharicUi = locale === 'am'

  useEffect(() => () => {
    const recognition = recognitionRef.current
    if (recognition) {
      recognition.onresult = null
      recognition.onerror = null
      recognition.onend = null
      recognition.abort()
      recognitionRef.current = null
    }
  }, [])

  function toggleListening() {
    if (recognitionRef.current) {
      recognitionRef.current.stop()
      setStatus(amharicUi ? 'ፍለጋው ተቋርጧል።' : 'Voice search stopped.')
      return
    }

    const Recognition = speechConstructor()
    if (!Recognition) {
      setStatus(amharicUi
        ? 'በዚህ አሳሽ የድምፅ ፍለጋ አይገኝም። እባክዎ በጽሑፍ ይፈልጉ።'
        : 'Voice search is unavailable in this browser. Please type your search.')
      return
    }

    const recognition = new Recognition()
    recognition.lang = language
    recognition.interimResults = false
    recognition.maxAlternatives = 1
    recognition.onresult = (event) => {
      const transcript = event.results[event.resultIndex]?.[0]?.transcript?.trim()
      if (!transcript) return
      onTranscript(transcript)
      setStatus(amharicUi ? `የተሰማው፦ ${transcript}` : `Heard: ${transcript}`)
    }
    recognition.onerror = (event) => {
      const messages: Record<string, string> = amharicUi
        ? {
            'not-allowed': 'የማይክሮፎን ፈቃድ አልተሰጠም። በጽሑፍ መፈለግ ይችላሉ።',
            'no-speech': 'ድምፅ አልተሰማም። እባክዎ እንደገና ይሞክሩ።',
            'language-not-supported': 'ይህ አሳሽ የተመረጠውን ቋንቋ አይደግፍም።',
          }
        : {
            'not-allowed': 'Microphone permission was denied. You can still type your search.',
            'no-speech': 'No speech heard. Please try again.',
            'language-not-supported': 'This browser does not support the selected voice language.',
          }
      setStatus(messages[event.error] ?? (amharicUi
        ? 'የድምፅ ፍለጋ አልተሳካም። በጽሑፍ ይሞክሩ።'
        : 'Voice search failed. Please type your search.'))
    }
    recognition.onend = () => {
      if (recognitionRef.current === recognition) recognitionRef.current = null
      setListening(false)
    }
    recognitionRef.current = recognition
    try {
      recognition.start()
      setListening(true)
      setStatus(amharicUi ? 'እየሰማ ነው…' : 'Listening…')
    } catch {
      recognitionRef.current = null
      setListening(false)
      setStatus(amharicUi ? 'የድምፅ ፍለጋ ሊጀምር አልቻለም።' : 'Could not start voice search.')
    }
  }

  return (
    <div className={styles.root}>
      <label className={styles.language}>
        <span>{amharicUi ? 'የድምፅ ቋንቋ' : 'Voice language'}</span>
        <select
          value={language}
          onChange={(event) => {
            recognitionRef.current?.stop()
            setLanguageOverride(event.target.value as 'am-ET' | 'en-US')
          }}
        >
          <option value="en-US">English</option>
          <option value="am-ET">አማርኛ</option>
        </select>
      </label>
      <button className={styles.button} type="button" onClick={toggleListening} aria-pressed={listening}>
        {listening ? (amharicUi ? 'አቁም' : 'Stop') : (amharicUi ? '🎙 በድምፅ ፈልግ' : '🎙 Search by voice')}
      </button>
      <p className={styles.status} role="status" aria-live="polite">{status}</p>
    </div>
  )
}
