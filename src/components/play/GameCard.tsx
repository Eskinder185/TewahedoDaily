import type { ReactNode } from 'react'
import { Link } from 'react-router-dom'
import type { AppLocale } from '../../lib/i18n/locale'
import styles from './PlayComponents.module.css'

export type PlayGameCard = {
  id: string
  icon: ReactNode
  title: Record<AppLocale, string>
  description: Record<AppLocale, string>
  category: Record<AppLocale, string>
  milestone: number
  route: string
  accent: 'gold' | 'blue' | 'green' | 'red' | 'purple' | 'teal'
}

export function GameCard({ game, locale }: { game: PlayGameCard; locale: AppLocale }) {
  const status = locale === 'am' ? 'አሁን ይጫወቱ' : 'Play now'
  const preview = locale === 'am' ? 'የጨዋታ ቅድመ እይታ' : 'Game preview'

  return (
    <article className={`${styles.gameCard} ${styles[`accent${game.accent}`]}`} data-game-card>
      <div className={styles.gameCardTop}>
        <span className={styles.gameIcon} aria-hidden="true">{game.icon}</span>
        <span className={styles.gameCategory}>{game.category[locale]}</span>
      </div>
      <div className={styles.gameCardBody}>
        <p className={styles.gameEyebrow}>{preview}</p>
        <h3>{game.title[locale]}</h3>
        <p>{game.description[locale]}</p>
      </div>
      <Link className={styles.comingSoon} aria-label={`${status}: ${game.title[locale]}`} to={game.route}>{status} →</Link>
    </article>
  )
}
