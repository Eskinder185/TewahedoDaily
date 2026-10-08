/**
 * Shared voice transcription entry for Bible, Hymns, and other page search bars.
 * Wraps MezmurVoiceSearch (also used by Search Buddy composer) so typed and voice
 * queries hit the same onTranscript → search function path.
 *
 * - English: browser SpeechRecognition when available
 * - Amharic: POST /api/transcribe when VITE_TEWAHEDO_AI_API_URL is set
 * - No in-browser Whisper / heavy speech models
 * - 15s max recording (VOICE_MAX_DURATION_MS)
 */
import { MezmurVoiceSearch, type VoiceInputLanguage } from './MezmurVoiceSearch'

export type VoiceTranscriptionControlProps = {
  onTranscript: (text: string) => void
  /** Idle microphone aria-label, e.g. "Search hymns by voice". */
  ariaLabel?: string
  compact?: boolean
  helperCaption?: string
  active?: boolean
  /** Mezmur page should pass "am" so the badge is አማ by default. */
  defaultLanguage?: VoiceInputLanguage
}

export function VoiceTranscriptionControl({
  onTranscript,
  ariaLabel,
  compact = true,
  helperCaption,
  active = true,
  defaultLanguage = 'en',
}: VoiceTranscriptionControlProps) {
  return (
    <MezmurVoiceSearch
      compact={compact}
      active={active}
      helperCaption={helperCaption}
      startAriaLabel={ariaLabel}
      defaultLanguage={defaultLanguage}
      onTranscript={onTranscript}
    />
  )
}
