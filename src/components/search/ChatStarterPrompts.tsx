import { useTranslation } from '../../i18n'
import styles from './SearchBuddy.module.css'

const STARTER_KEYS = [
  'searchBuddy.prompts.calendar',
  'searchBuddy.prompts.fasting',
  'searchBuddy.prompts.john',
  'searchBuddy.prompts.prayer',
  'searchBuddy.prompts.gena',
  'searchBuddy.prompts.commemorated',
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
  prompts,
  disabled,
  onSelect,
  title,
  copy,
  groupAria,
  welcomeId,
}: Props) {
  const t = useTranslation()
  const items = prompts ?? STARTER_KEYS.map((key) => t(key))
  return (
    <div className={styles.welcome} id={welcomeId}>
      <p className={styles.welcomeTitle}>{title}</p>
      <p className={styles.welcomeCopy}>{copy}</p>
      <div className={styles.suggestions} role="group" aria-label={groupAria}>
        {items.map((prompt) => (
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
