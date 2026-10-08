/**
 * Thin reusable wrapper around MezmurVoiceSearch for page search bars.
 * Transcription-only: fills the caller's input state via onTranscript.
 * Does not call /api/chat or invent answers.
 */
import { MezmurVoiceSearch } from './MezmurVoiceSearch'

export type VoiceTranscriptionControlProps = {
  onTranscript: (text: string) => void
  /** Idle microphone aria-label, e.g. "Search hymns by voice". */
  ariaLabel?: string
  compact?: boolean
  helperCaption?: string
  active?: boolean
}

export function VoiceTranscriptionControl({
  onTranscript,
  ariaLabel,
  compact = true,
  helperCaption,
  active = true,
}: VoiceTranscriptionControlProps) {
  return (
    <MezmurVoiceSearch
      compact={compact}
      active={active}
      helperCaption={helperCaption}
      startAriaLabel={ariaLabel}
      onTranscript={onTranscript}
    />
  )
}
