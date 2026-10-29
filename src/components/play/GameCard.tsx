import { Link } from 'react-router-dom'
import type { AppLocale } from '../../lib/i18n/locale'
import type { PlayArt } from '../../lib/play/imageCatalog'
import styles from './PlayComponents.module.css'

type Text = Record<AppLocale, string>

export type PlayGameCard = {
  id: string
  route: string
  title: Text
  description: Text
  category: Text
  art: PlayArt
  /** Short facts shown on the card (e.g. "12 feasts", "5 min"). */
  meta?: Text
  /** Levels this game supports; the hub's level choice is passed on as ?level=. */
  levels?: boolean
  /** Unavailable games render as a non-link card with an explanation. */
  unavailable?: Text
  /** Small ribbon such as "New". */
  badge?: Text
}

export function GameCard({ game, locale, level, size = 'regular' }: { game: PlayGameCard; locale: AppLocale; level?: string; size?: 'regular' | 'feature' }) {
  const am = locale === 'am'
  const to = game.levels && level ? `${game.route}?level=${level}` : game.route
  const className = `${styles.gameCard} ${size === 'feature' ? styles.gameCardFeature : ''} ${game.unavailable ? styles.gameCardUnavailable : ''}`
  const body = (
    <>
      <div className={styles.cardMedia}>
        <img
          src={game.art.src}
          alt=""
          loading={size === 'feature' ? 'eager' : 'lazy'}
          decoding="async"
          width={800}
          height={600}
          style={game.art.focus ? { objectPosition: game.art.focus } : undefined}
        />
        <span className={styles.cardChip}>{game.category[locale]}</span>
        {game.badge ? <span className={styles.cardBadge}>{game.badge[locale]}</span> : null}
      </div>
      <div className={styles.cardBody}>
        <h3>{game.title[locale]}</h3>
        <p>{game.description[locale]}</p>
        <div className={styles.cardFooter}>
          {game.unavailable ? (
            <span className={styles.cardStatus}>{game.unavailable[locale]}</span>
          ) : (
            <>
              {game.meta ? <span className={styles.cardMeta}>{game.meta[locale]}</span> : <span />}
              <span className={styles.cardPlay} aria-hidden="true">
                {am ? 'ይጫወቱ' : 'Play'}
                <svg viewBox="0 0 24 24" width="18" height="18" fill="none" stroke="currentColor" strokeWidth="2.2" strokeLinecap="round" strokeLinejoin="round"><path d="M5 12h14M13 6l6 6-6 6" /></svg>
              </span>
            </>
          )}
        </div>
      </div>
    </>
  )

  if (game.unavailable) {
    return (
      <article className={className} aria-label={`${game.title[locale]} — ${game.unavailable[locale]}`} data-game-card data-unavailable>
        {body}
      </article>
    )
  }
  return (
    <Link className={className} to={to} data-game-card>
      {body}
    </Link>
  )
}
