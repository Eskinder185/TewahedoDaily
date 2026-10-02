import { useTranslation } from '../../i18n'
import { useLocale } from '../../lib/i18n/locale'
import {
  cardCategoryBadge,
  resolveCardSummary,
  type CalendarCard,
} from '../../lib/synaxarium/calendarCards'
import { CalendarEventImage } from './CalendarEventImage'
import styles from './CalendarCardFace.module.css'

function visualKindFromType(type: string): 'feast' | 'fast' | 'commemoration' {
  const t = type.toLowerCase()
  if (t.includes('feast') || t.includes('season')) return 'feast'
  if (t.includes('fast')) return 'fast'
  return 'commemoration'
}

export type CalendarCardFaceProps = {
  card: CalendarCard
  variant?: 'strip' | 'home'
  className?: string
  onSeeMore: (card: CalendarCard) => void
  onOpenDate?: (card: CalendarCard) => void
  /** When false, hide Open date (e.g. preview without navigation). */
  showOpenDate?: boolean
}

/** Shared calendar card face for Calendar strip + homepage carousel. */
export function CalendarCardFace({
  card,
  variant = 'strip',
  className = '',
  onSeeMore,
  onOpenDate,
  showOpenDate = true,
}: CalendarCardFaceProps) {
  const t = useTranslation()
  const { locale } = useLocale()
  const visualKind = visualKindFromType(card.type)
  const summary = resolveCardSummary(card, locale)
  const category = cardCategoryBadge(card)
  const seeMoreLabel = card.learnMoreLabel || t('calendar.page.seeMore')
  const titleForLocale =
    locale === 'am' ? card.titleAmharic || card.title : card.title
  const amharicSecondary =
    locale === 'am'
      ? card.title !== titleForLocale
        ? card.title
        : ''
      : card.titleAmharic

  return (
    <article
      className={`${styles.card} ${styles[`kind_${visualKind}`]} ${styles[variant]} ${className}`.trim()}
    >
      <CalendarEventImage
        src={card.imageUrl}
        alt={card.imageAlt || t('calendar.page.observanceImage', { title: card.title })}
        position={card.imagePosition || card.objectPosition}
        className={styles.media}
        fetchPriority="low"
        sizes={
          variant === 'home'
            ? '(max-width: 767px) 100vw, 45vw'
            : '(max-width: 820px) 86vw, 19rem'
        }
      />
      <div className={styles.body}>
        <p className={styles.type}>{category}</p>
        <h2 className={styles.title}>{titleForLocale}</h2>
        {amharicSecondary ? (
          <p className={styles.titleAm} lang={locale === 'am' ? undefined : 'am'}>
            {amharicSecondary}
          </p>
        ) : null}
        <p className={styles.date}>{card.gregorianLabel}</p>
        <p className={styles.dateSecondary}>{card.ethiopianLabel}</p>
        {summary ? <p className={styles.summary}>{summary}</p> : null}
        <div className={styles.actions}>
          <button
            type="button"
            className={styles.seeMore}
            onClick={() => onSeeMore(card)}
            aria-label={`${seeMoreLabel}: ${card.title}`}
          >
            {seeMoreLabel}
          </button>
          {showOpenDate && onOpenDate ? (
            <button
              type="button"
              className={styles.openDate}
              onClick={() => onOpenDate(card)}
              aria-label={`${t('calendar.page.openDate')}: ${card.title}`}
            >
              {t('calendar.page.openDate')}
            </button>
          ) : null}
        </div>
      </div>
    </article>
  )
}
