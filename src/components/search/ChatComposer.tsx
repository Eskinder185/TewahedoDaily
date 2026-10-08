import {
  useEffect,
  useId,
  type FormEvent,
  type KeyboardEvent,
  type RefObject,
} from 'react'
import { MezmurVoiceSearch } from './MezmurVoiceSearch'
import styles from './SearchBuddy.module.css'

type Props = {
  value: string
  onChange: (value: string) => void
  onSubmit: () => void
  busy: boolean
  voiceActive: boolean
  voiceRemountKey: number
  inputRef: RefObject<HTMLTextAreaElement | null>
  placeholder: string
  inputAria: string
  sendLabel: string
  sendBusyLabel: string
}

const MAX_TEXTAREA_PX = 140

export function ChatComposer({
  value,
  onChange,
  onSubmit,
  busy,
  voiceActive,
  voiceRemountKey,
  inputRef,
  placeholder,
  inputAria,
  sendLabel,
  sendBusyLabel,
}: Props) {
  const inputId = useId()

  useEffect(() => {
    const el = inputRef.current
    if (!el) return
    el.style.height = 'auto'
    el.style.height = `${Math.min(el.scrollHeight, MAX_TEXTAREA_PX)}px`
  }, [value, inputRef])

  function handleSubmit(e: FormEvent) {
    e.preventDefault()
    if (!value.trim() || busy) return
    onSubmit()
  }

  function onKeyDown(e: KeyboardEvent<HTMLTextAreaElement>) {
    if (e.key === 'Enter' && !e.shiftKey) {
      e.preventDefault()
      if (!value.trim() || busy) return
      onSubmit()
    }
  }

  return (
    <div className={styles.composer}>
      <form className={styles.form} onSubmit={handleSubmit}>
        <label className={styles.srOnly} htmlFor={inputId}>
          {inputAria}
        </label>
        <div className={styles.composerField}>
          <textarea
            id={inputId}
            ref={inputRef}
            className={styles.composerTextarea}
            value={value}
            onChange={(e) => onChange(e.target.value)}
            onKeyDown={onKeyDown}
            placeholder={placeholder}
            autoComplete="off"
            rows={1}
            enterKeyHint="send"
            spellCheck={false}
            aria-label={inputAria}
          />
        </div>
        <div className={styles.composerActions}>
          <div className={styles.composerTools}>
            <MezmurVoiceSearch
              key={voiceRemountKey}
              compact
              active={voiceActive}
              onTranscript={(text) => {
                const transcript = text.trim()
                if (!transcript) return
                onChange(transcript)
                window.setTimeout(() => {
                  inputRef.current?.focus()
                }, 0)
              }}
            />
          </div>
          <button
            type="submit"
            className={styles.submitBtn}
            disabled={busy || !value.trim()}
            aria-label={busy ? sendBusyLabel : sendLabel}
          >
            {busy ? sendBusyLabel : sendLabel}
          </button>
        </div>
      </form>
    </div>
  )
}
