/** Shared Web Speech API helpers for Mezmur + Search Buddy voice input. */

const messages = {
  en: {
    insecure: 'Voice search needs a secure (HTTPS) connection. Please type your search.',
    unsupported: "Voice search isn't supported by this browser. You can still type your search.",
    notAllowed:
      'Microphone access was blocked. Allow microphone access in your browser settings and try again.',
    serviceNotAllowed:
      'Browser voice recognition is unavailable for this language right now. Trying a local fallback…',
    noSpeech: "I didn't hear anything. Try again.",
    audioCapture: 'No microphone was detected.',
    network: "Voice recognition couldn't connect. Try again.",
    langUnsupported:
      'This browser does not support the selected voice language. Try English, or type your search.',
    badGrammar: 'Voice search could not understand that input. Please try again, or type your search.',
    aborted: 'Voice search stopped.',
    failed: 'Voice search failed. Please type your search.',
    starting: 'Starting…',
    listening: 'Listening…',
    listeningCountdown: 'Listening… {seconds}s',
    listeningWith: 'Listening… {transcript}',
    heard: 'Heard: {transcript}',
    processing: 'Processing…',
    stopped: 'Voice search stopped.',
    startFailed: 'Could not start voice search. Please try again, or type your search.',
    amharicNote:
      'Amharic recognition uses your browser’s speech service when available. Offline voice is used if needed.',
    amharicNativeFallback:
      "Native Amharic voice recognition isn't available here. Using Amharic voice fallback…",
    amharicTextOnly:
      "Amharic voice recognition isn't supported on this device yet. You can still type your search in Amharic.",
    voiceLang: 'Voice language',
    searchByVoice: 'Search by voice',
    stop: 'Stop',
    startAria: 'Start voice search',
    stopAria: 'Stop voice search',
    preparingOffline: 'Preparing offline voice recognition…',
    downloadingModel: 'Downloading speech model… {progress}%',
    downloadingModelIndeterminate: 'Downloading speech model…',
    requestingMic: 'Requesting microphone…',
    recording: 'Recording… Tap stop when finished.',
    recordingCountdown: 'Recording… {seconds}s',
    transcribing: 'Transcribing…',
    offlineLocal: 'Voice is processed on your device.',
    tapAgainOffline: 'Browser voice was unavailable. Tap the microphone to record offline.',
    emptyTranscript: 'No speech detected. Try again, or type your search.',
    whisperFailed: 'Offline voice recognition failed. You can still type your search.',
    textOnly: "Voice search isn't available on this browser. You can still type your search.",
  },
  am: {
    insecure:
      '\u12e8\u12f5\u121d\u1345 \u134d\u1208\u130b \u1208\u12f0\u1205\u1295\u1290\u1275 \u121d\u12ad\u1295\u12eb\u1275 \u1260 HTTPS \u1265\u127b \u12ed\u1308\u129b\u120d\u1362 \u1260\u133d\u1201\u134d \u12ed\u1348\u120d\u1309\u1362',
    unsupported:
      '\u1260\u12da\u1205 \u12a0\u1233\u123d \u12e8\u12f5\u121d\u1345 \u134d\u1208\u130b \u12a0\u12ed\u1308\u129d\u121d\u1362 \u12a5\u1263\u12ad\u12ce \u1260\u133d\u1201\u134d \u12ed\u1348\u120d\u1309\u1362',
    notAllowed:
      '\u12e8\u121b\u12ed\u12ad\u122e\u134e\u1295 \u1348\u1243\u12f5 \u1270\u12a8\u120d\u12ad\u120f\u120d\u1362 \u1260\u12a0\u1233\u123d \u1245\u1295\u1325\u1266\u127d \u12ed\u134d\u1240\u12f1 \u12a5\u1295\u12f0\u1308\u1293 \u12ed\u121e\u12ad\u1229\u1362',
    serviceNotAllowed:
      '\u12e8\u12a0\u1233\u123d \u12f5\u121d\u1345 \u121b\u12c8\u1242\u12eb \u12a0\u120d\u1270\u1308\u1298\u121d\u1362 \u12e8\u12a0\u12ab\u1263\u12ed \u12f5\u130d\u134d \u12ed\u1300\u1240\u121b\u120d\u2026',
    noSpeech: '\u12f5\u121d\u1345 \u12a0\u120d\u1270\u1230\u121b\u121d\u1362 \u12a5\u1295\u12f0\u1308\u1293 \u12ed\u121e\u12ad\u1229\u1362',
    audioCapture: '\u121b\u12ed\u12ad\u122e\u134e\u1295 \u12a0\u120d\u1270\u1308\u1298\u121d\u1362',
    network:
      '\u12e8\u12f5\u121d\u1345 \u134d\u1208\u130b \u1218\u1308\u1293\u1298\u1275 \u12a0\u120d\u127b\u1208\u121d\u1362 \u12a5\u1295\u12f0\u1308\u1293 \u12ed\u121e\u12ad\u1229\u1362',
    langUnsupported:
      '\u12ed\u1205 \u12a0\u1233\u123d \u12e8\u1270\u1218\u1228\u1320\u12cd\u1295 \u124b\u1295\u124b \u12a0\u12ed\u12f0\u130d\u134d\u121d\u1362 \u12a5\u1295\u130d\u120a\u12dd\u129b \u12ed\u121e\u12ad\u1229 \u12c8\u12ed\u121d \u1260\u133d\u1201\u134d \u12ed\u1348\u120d\u1309\u1362',
    badGrammar:
      '\u12e8\u12f5\u121d\u1345 \u130d\u1265\u12a0\u1271 \u12a0\u120d\u1270\u1228\u12f3\u121d\u1362 \u12a5\u1295\u12f0\u1308\u1293 \u12ed\u121e\u12ad\u1229 \u12c8\u12ed\u121d \u1260\u133d\u1201\u134d \u12ed\u1348\u120d\u1309\u1362',
    aborted: '\u12e8\u12f5\u121d\u1345 \u134d\u1208\u130b \u1270\u124b\u122d\u1327\u120d\u1362',
    failed: '\u12e8\u12f5\u121d\u1345 \u134d\u1208\u130b \u12a0\u120d\u1270\u1233\u12ab\u121d\u1362 \u1260\u133d\u1201\u134d \u12ed\u121e\u12ad\u1229\u1362',
    starting: '\u12a5\u12e8\u1300\u121d\u122d \u1290\u12cd\u2026',
    listening: '\u12a5\u12e8\u1230\u121b \u1290\u12cd\u2026',
    listeningCountdown: '\u12a5\u12e8\u1230\u121b\u2026 {seconds}s',
    listeningWith: '\u12a5\u12e8\u1230\u121b\u2026 {transcript}',
    heard: '\u12e8\u1270\u1230\u121b\u12cd\u1366 {transcript}',
    processing: '\u12a5\u12e8\u1230\u122b \u1290\u12cd\u2026',
    stopped: '\u134d\u1208\u130b\u12cd \u1270\u124b\u122d\u1327\u120d\u1362',
    startFailed:
      '\u12e8\u12f5\u121d\u1345 \u134d\u1208\u130b \u120a\u1300\u121d\u122d \u12a0\u120d\u127b\u1208\u121d\u1362 \u12a5\u1295\u12f0\u1308\u1293 \u12ed\u121e\u12ad\u1229 \u12c8\u12ed\u121d \u1260\u133d\u1201\u134d \u12ed\u1348\u120d\u1309\u1362',
    amharicNote:
      'የአማርኛ ድምፅ ማወቂያ በአሳሾ አገልግሎት ይጠቀማል። አስፈላጊ ድምፅ እንደራሊ ይጠቀማል።',
    amharicNativeFallback:
      '\u12e8\u12a0\u1233\u123d \u12a0\u121b\u122d\u129b \u12f5\u121d\u1335 \u121b\u12c8\u1242\u12eb \u12a0\u120d\u1270\u1308\u1298\u121d\u1362 \u12e8\u12a0\u12ab\u1263\u12ed \u12f5\u130d\u134d \u12ed\u1300\u1240\u121b\u120d\u2026',
    amharicTextOnly:
      '\u12e8\u12a0\u121b\u122d\u129b \u12f5\u121d\u1335 \u121b\u12c8\u1242\u12eb \u1260\u12da\u1205 \u121c\u12ab\u122d \u12a0\u12ed\u1308\u129d\u121d\u1362 \u12a5\u1263\u12ad\u12ce \u1260\u12a0\u121b\u122d\u129b \u12ed\u1348\u120d\u1309\u1362',
    voiceLang: '\u12e8\u12f5\u121d\u1345 \u124b\u1295\u124b',
    searchByVoice: '\u1260\u12f5\u121d\u1345 \u1348\u120d\u130d',
    stop: '\u12a0\u1241\u121d',
    startAria: '\u12e8\u12f5\u121d\u1345 \u134d\u1208\u130b \u1300\u121d\u122d',
    stopAria: '\u12e8\u12f5\u121d\u1345 \u134d\u1208\u130b \u12a0\u1241\u121d',
    preparingOffline: '\u12e8\u12a0\u1235\u1348\u120b\u130a \u12f5\u121d\u1345 \u121b\u12c8\u1242\u12eb \u12a5\u12e8\u12a0\u12d8\u130b\u1305 \u1290\u12cd\u2026',
    downloadingModel: '\u12e8\u12f5\u121d\u1345 \u121e\u12f4\u120d \u12a5\u12e8\u12c8\u1228\u12f0 \u1290\u12cd\u2026 {progress}%',
    downloadingModelIndeterminate: '\u12e8\u12f5\u121d\u1345 \u121e\u12f4\u120d \u12a5\u12e8\u12c8\u1228\u12f0 \u1290\u12cd\u2026',
    requestingMic: '\u121b\u12ed\u12ad\u122e\u134e\u1295 \u12a5\u12e8\u1218\u1320\u12e8\u1245 \u1290\u12cd\u2026',
    recording: '\u12a5\u12e8\u1240\u12f5 \u1290\u12cd\u2026 \u1235\u1270\u1218\u120d\u1241 \u12a0\u1241\u121d \u12ed\u1305\u1231\u1362',
    recordingCountdown: '\u12a5\u12e8\u1240\u12f5\u2026 {seconds}s',
    transcribing: '\u12a5\u12e8\u1230\u122b \u1290\u12cd\u2026',
    offlineLocal: '\u12f5\u121d\u1335 \u1260\u121c\u12ab\u122d\u12ce \u120b\u12ed \u12ed\u1230\u122b\u120d\u1362',
    tapAgainOffline:
      '\u12e8\u12a0\u1233\u123d \u12f5\u121d\u1345 \u12a0\u120d\u1270\u1308\u1298\u121d\u1362 \u1208\u12a0\u1235\u1348\u120b\u130a \u1240\u12f3 \u121b\u12ed\u12ad\u122e\u134e\u1291\u1295 \u12ed\u1295\u12a9\u1362',
    emptyTranscript: '\u12f5\u121d\u1345 \u12a0\u120d\u1270\u1230\u121b\u121d\u1362 \u12a5\u1295\u12f0\u1308\u1293 \u12ed\u121e\u12ad\u1229\u1362',
    whisperFailed:
      '\u12e8\u12a0\u1235\u1348\u120b\u130a \u12f5\u121d\u1345 \u121b\u12c8\u1242\u12eb \u12a0\u120d\u1270\u1233\u12ab\u121d\u1362 \u1260\u133d\u1201\u134d \u1218\u1348\u1208\u130d \u12ed\u127b\u120b\u120d\u1362',
    textOnly:
      '\u1260\u12da\u1205 \u12a0\u1233\u123d \u12e8\u12f5\u121d\u1345 \u134d\u1208\u130b \u12a0\u12ed\u1308\u129d\u121d\u1362 \u1260\u133d\u1201\u134d \u12ed\u1348\u120d\u1309\u1362',
  },
} as const

/** UI locale → Web Speech BCP-47 tag. Keep app locale ids separate from recognition locales. */
export const speechLocales = {
  am: 'am-ET',
  en: 'en-US',
} as const

export type VoiceSearchLang = (typeof speechLocales)[keyof typeof speechLocales]
export type VoiceUiLang = 'en' | 'am'
export type VoicePhase =
  | 'idle'
  | 'starting'
  | 'listening'
  | 'starting-native'
  | 'listening-native'
  | 'native-failed'
  | 'loading-model'
  | 'requesting-mic'
  | 'recording'
  | 'processing'
  | 'success'
  | 'error'
  | 'unsupported'

export type SpeechResultLike = { transcript: string; isFinal?: boolean }
export type SpeechEventLike = {
  results: ArrayLike<ArrayLike<SpeechResultLike> & { isFinal?: boolean }>
  resultIndex: number
}
export type SpeechErrorLike = { error: string; message?: string }

export type BrowserSpeechRecognition = {
  lang: string
  continuous: boolean
  interimResults: boolean
  maxAlternatives: number
  onstart: (() => void) | null
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

export function toSpeechLocale(appLocale: string | null | undefined): VoiceSearchLang {
  return appLocale === 'am' ? speechLocales.am : speechLocales.en
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
    // Distinct from mic permission — speech service refused the language/request.
    'service-not-allowed': 'serviceNotAllowed',
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

/** Join all result pieces from resultIndex (keeps multi-word Ethiopic phrases intact). */
export function extractTranscript(event: SpeechEventLike): { transcript: string; isFinal: boolean } {
  const parts: string[] = []
  let isFinal = true
  for (let i = event.resultIndex; i < event.results.length; i += 1) {
    const row = event.results[i]
    const piece = row?.[0]?.transcript?.trim()
    if (piece) parts.push(piece)
    if (!row?.isFinal) isFinal = false
  }
  return { transcript: parts.join(' ').replace(/\s+/g, ' ').trim(), isFinal }
}

export function phaseStatus(
  phase: VoicePhase,
  transcript: string,
  ui: VoiceUiLang,
): string {
  switch (phase) {
    case 'starting':
    case 'starting-native':
      return msg(ui, 'starting')
    case 'listening':
    case 'listening-native':
      return transcript ? msg(ui, 'listeningWith', { transcript }) : msg(ui, 'listening')
    case 'loading-model':
      return msg(ui, 'preparingOffline')
    case 'requesting-mic':
      return msg(ui, 'requestingMic')
    case 'recording':
      return msg(ui, 'recording')
    case 'processing':
      return transcript ? msg(ui, 'heard', { transcript }) : msg(ui, 'transcribing')
    case 'native-failed':
      return msg(ui, 'tapAgainOffline')
    case 'unsupported':
      return msg(ui, 'textOnly')
    case 'idle':
    case 'success':
    case 'error':
    default:
      return ''
  }
}

export function voiceMessage(ui: VoiceUiLang, key: MsgKey, params?: Record<string, string>): string {
  return msg(ui, key, params)
}

export function voiceStoppedMessage(ui: VoiceUiLang): string {
  return msg(ui, 'stopped')
}

export function voiceStartFailedMessage(ui: VoiceUiLang): string {
  return msg(ui, 'startFailed')
}

export function amharicRecognitionNote(ui: VoiceUiLang): string {
  return msg(ui, 'amharicNote')
}

export function voiceUiLabels(ui: VoiceUiLang) {
  return {
    voiceLang: msg(ui, 'voiceLang'),
    searchByVoice: msg(ui, 'searchByVoice'),
    stop: msg(ui, 'stop'),
    startAria: msg(ui, 'startAria'),
    stopAria: msg(ui, 'stopAria'),
    starting: msg(ui, 'starting'),
    listening: msg(ui, 'listening'),
  }
}

export function voiceDebug(...args: unknown[]) {
  if (import.meta.env.DEV) {
    console.debug('[voice-search]', ...args)
  }
}

/** Stop recognition without relying on async onend to clear the ref. */
export function stopRecognition(recognition: BrowserSpeechRecognition | null | undefined) {
  if (!recognition) return
  recognition.onstart = null
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
