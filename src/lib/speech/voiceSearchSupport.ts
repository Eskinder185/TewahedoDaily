/** Shared Web Speech API helpers for Mezmur + Search Buddy voice input. */

const messages = {
  "en": {
    "insecure": "Voice search needs a secure (HTTPS) connection. Please type your search.",
    "unsupported": "Voice search is unavailable in this browser. Please type your search.",
    "notAllowed": "Microphone permission was denied. You can still type your search.",
    "noSpeech": "No speech heard. Please try again, or type your search.",
    "audioCapture": "No microphone was found or audio capture failed. You can still type your search.",
    "network": "Voice recognition could not reach the network. Check your connection, or type your search.",
    "langUnsupported": "This browser does not support the selected voice language. Try English, or type your search.",
    "badGrammar": "Voice search could not understand that input. Please try again, or type your search.",
    "aborted": "Voice search stopped.",
    "failed": "Voice search failed. Please type your search.",
    "listening": "Listening…",
    "listeningWith": "Listening… {transcript}",
    "heard": "Heard: {transcript}",
    "stopped": "Voice search stopped.",
    "startFailed": "Could not start voice search.",
    "amharicNote": "Amharic voice recognition depends on your browser and has not been verified here. Typed search remains available.",
    "voiceLang": "Voice language",
    "searchByVoice": "Search by voice",
    "stop": "Stop"
  },
  "am": {
    "insecure": "የድምፅ ፍለጋ ለደህንነት ምክንያት በ HTTPS ብቻ ይገኛል። በጽሁፍ ይፈልጉ።",
    "unsupported": "በዚህ አሳሽ የድምፅ ፍለጋ አይገኝም። እባክዎ በጽሁፍ ይፈልጉ።",
    "notAllowed": "የማይክሮፎን ፈቃድ አልተሰጠም። በጽሁፍ መፈለግ ይችላሉ።",
    "noSpeech": "ድምፅ አልተሰማም። እባክዎ እንደገና ይሞክሩ ወይም በጽሁፍ ይፈልጉ።",
    "audioCapture": "ማይክሮፎን አልተገኘም ወይም ድምፅ ማንሳት አልተሳካም። በጽሁፍ መፈለግ ይችላሉ።",
    "network": "የድምፅ ፍለጋ ከኔትወርክ ጋር መገናኘት አልቻለም። ግንኙነትዎን ይፈትሹ ወይም በጽሁፍ ይፈልጉ።",
    "langUnsupported": "ይህ አሳሽ የተመረጠውን ቋንቋ አይደግፍም። እንግሊዝኛ ይሞክሩ ወይም በጽሁፍ ይፈልጉ።",
    "badGrammar": "የድምፅ ግብአቱ አልተረዳም። እንደገና ይሞክሩ ወይም በጽሁፍ ይፈልጉ።",
    "aborted": "የድምፅ ፍለጋ ተቋርጧል።",
    "failed": "የድምፅ ፍለጋ አልተሳካም። በጽሁፍ ይሞክሩ።",
    "listening": "እየሰማ ነው…",
    "listeningWith": "እየሰማ… {transcript}",
    "heard": "የተሰማው፦ {transcript}",
    "stopped": "ፍለጋው ተቋርጧል።",
    "startFailed": "የድምፅ ፍለጋ ሊጀምር አልቻለም።",
    "amharicNote": "የአማርኛ ድምፅ ማወቂያ በአሳሾ ላይ የተመካ ነው፤ እዚህ ላይ አልተረጋገጠም። ጽሁፍ ማስገባት ይቻላል።",
    "voiceLang": "የድምፅ ቋንቋ",
    "searchByVoice": "በድምፅ ፈልግ",
    "stop": "አቁም"
  }
} as const

export type VoiceSearchLang = 'am-ET' | 'en-US'
export type VoiceUiLang = 'en' | 'am'

export type SpeechResultLike = { transcript: string; isFinal?: boolean }
export type SpeechEventLike = {
  results: ArrayLike<ArrayLike<SpeechResultLike> & { isFinal?: boolean }>
  resultIndex: number
}
export type SpeechErrorLike = { error: string }

export type BrowserSpeechRecognition = {
  lang: string
  continuous: boolean
  interimResults: boolean
  maxAlternatives: number
  onresult: ((event: SpeechEventLike) => void) | null
  onerror: ((event: SpeechErrorLike) => void) | null
  onend: (() => void) | null
  start: () => void
  stop: () => void
  abort: () => void
}

export type SpeechConstructor = new () => BrowserSpeechRecognition

export type VoiceSupportState =
  | { ok: true; ctor: SpeechConstructor }
  | { ok: false; stage: 'no-window' | 'insecure-context' | 'unsupported' }

type MsgKey = keyof typeof messages.en

function msg(ui: VoiceUiLang, key: MsgKey, params?: Record<string, string>): string {
  let text: string = (ui === 'am' ? messages.am : messages.en)[key]
  if (!params) return text
  for (const [name, value] of Object.entries(params)) {
    text = text.replaceAll(`{${name}}`, value)
  }
  return text
}

export function getSpeechConstructor(
  win: (Window & typeof globalThis) | undefined = typeof window !== 'undefined' ? window : undefined,
): SpeechConstructor | undefined {
  if (!win) return undefined
  const browser = win as typeof win & {
    SpeechRecognition?: SpeechConstructor
    webkitSpeechRecognition?: SpeechConstructor
  }
  return browser.SpeechRecognition ?? browser.webkitSpeechRecognition
}

/** Identify whether recognition can start before calling start(). */
export function detectVoiceSupport(
  win: (Window & typeof globalThis) | undefined = typeof window !== 'undefined' ? window : undefined,
): VoiceSupportState {
  if (!win) return { ok: false, stage: 'no-window' }
  if (win.isSecureContext === false) return { ok: false, stage: 'insecure-context' }
  const ctor = getSpeechConstructor(win)
  if (!ctor) return { ok: false, stage: 'unsupported' }
  return { ok: true, ctor }
}

export function voiceSupportMessage(
  stage: Exclude<VoiceSupportState, { ok: true }>['stage'],
  ui: VoiceUiLang,
): string {
  if (stage === 'insecure-context') return msg(ui, 'insecure')
  return msg(ui, 'unsupported')
}

/** Map SpeechRecognition error codes to clear, typed-search-friendly copy. */
export function voiceErrorMessage(errorCode: string, ui: VoiceUiLang): string {
  const byCode: Record<string, MsgKey> = {
    'not-allowed': 'notAllowed',
    'service-not-allowed': 'notAllowed',
    'no-speech': 'noSpeech',
    'audio-capture': 'audioCapture',
    network: 'network',
    'language-not-supported': 'langUnsupported',
    'bad-grammar': 'badGrammar',
    aborted: 'aborted',
  }
  const key = byCode[errorCode]
  return key ? msg(ui, key) : msg(ui, 'failed')
}

export function extractTranscript(event: SpeechEventLike): { transcript: string; isFinal: boolean } {
  let transcript = ''
  for (let i = event.resultIndex; i < event.results.length; i += 1) {
    const piece = event.results[i]?.[0]?.transcript?.trim()
    if (piece) transcript = piece
  }
  const last = event.results[event.results.length - 1] as { isFinal?: boolean } | undefined
  return { transcript, isFinal: Boolean(last?.isFinal) }
}

export function listeningStatus(transcript: string, isFinal: boolean, ui: VoiceUiLang): string {
  if (!transcript) return msg(ui, 'listening')
  return isFinal ? msg(ui, 'heard', { transcript }) : msg(ui, 'listeningWith', { transcript })
}

export function voiceStoppedMessage(ui: VoiceUiLang): string {
  return msg(ui, 'stopped')
}

export function voiceStartFailedMessage(ui: VoiceUiLang): string {
  return msg(ui, 'startFailed')
}

/** Do not claim Amharic recognition works without a successful spoken Amharic test. */
export function amharicRecognitionNote(ui: VoiceUiLang): string {
  return msg(ui, 'amharicNote')
}

export function voiceUiLabels(ui: VoiceUiLang) {
  return {
    voiceLang: msg(ui, 'voiceLang'),
    searchByVoice: msg(ui, 'searchByVoice'),
    stop: msg(ui, 'stop'),
  }
}

export function stopRecognition(recognition: BrowserSpeechRecognition | null | undefined) {
  if (!recognition) return
  recognition.onresult = null
  recognition.onerror = null
  recognition.onend = null
  try {
    recognition.abort()
  } catch {
    try {
      recognition.stop()
    } catch {
      /* ignore */
    }
  }
}
