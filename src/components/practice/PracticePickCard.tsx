import styles from './PracticePickCard.module.css'

type PracticePickCardProps = {
  title: string
  teaser: string
  onSelect: () => void
  selected?: boolean
}

export function PracticePickCard({
  title,
  teaser,
  onSelect,
  selected,
}: PracticePickCardProps) {
  return (
    <button
      type="button"
      className={`${styles.card} ${selected ? styles.selected : ''}`}
      onClick={onSelect}
      aria-pressed={selected}
    >
      <span className={styles.title}>{title}</span>
      <span className={styles.teaser}>{teaser}</span>
    </button>
  )
}
