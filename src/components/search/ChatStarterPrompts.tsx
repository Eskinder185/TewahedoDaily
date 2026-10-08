import styles from './SearchBuddy.module.css'

export const CHAT_STARTER_PROMPTS = [
  "What's on the church calendar today?",
  'Am I fasting today?',
  'Open John 3:16',
  'Find a prayer',
  'Show me a Gena hymn',
  'Who is commemorated today?',
] as const

type Props = {
  prompts?: readonly string[]
  disabled?: boolean
  onSelect: (prompt: string) => void
  title: string
  copy: string
  groupAria: string
  welcomeId?: string
}

export function ChatStarterPrompts({
  prompts = CHAT_STARTER_PROMPTS,
  disabled,
  onSelect,
  title,
  copy,
  groupAria,
  welcomeId,
}: Props) {
  return (
    <div className={styles.welcome} id={welcomeId}>
      <p className={styles.welcomeTitle}>{title}</p>
      <p className={styles.welcomeCopy}>{copy}</p>
      <div className={styles.suggestions} role="group" aria-label={groupAria}>
        {prompts.map((prompt) => (
          <button
            key={prompt}
            type="button"
            className={styles.chip}
            disabled={disabled}
            onClick={() => onSelect(prompt)}
          >
            {prompt}
          </button>
        ))}
      </div>
    </div>
  )
}
