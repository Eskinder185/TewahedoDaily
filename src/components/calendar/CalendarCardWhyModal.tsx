import { useEffect, useId, useLayoutEffect, useRef } from 'react'
import { useTranslation } from '../../i18n'
import { useLocale } from '../../lib/i18n/locale'
import { useUiLabel } from '../../lib/i18n/uiLabels'
import {
  cardCategoryBadge,
  resolveCardFasting,
  resolveCardImageCaption,
  resolveCardImportant,
  resolveCardScripture,
  resolveCardSeason,
  resolveCardSummary,
  resolveCardWhatIsIt,
  resolveCardWhy,
  type CalendarCard,
} from '../../lib/synaxarium/calendarCards'
import { CalendarEventImage } from './CalendarEventImage'
import styles from './CalendarCardWhyModal.module.css'

type Props = {
  open: boolean
  card: CalendarCard | null
  onClose: () => void
  onOpenDate: (card: CalendarCard) => void
}

function Paragraphs({ text, className }: { text: string; className: string }) {
  return (
    <>
      {text
        .split(/\n+/)
        .map((p) => p.trim())
        .filter(Boolean)
        .map((para, i) => (
          <p key={i} className={className}>
            {para}
          </p>
        ))}
    </>
  )
}

export function CalendarCardWhyModal({ open, card, onClose, onOpenDate }: Props) {
  const t = useTranslation()
  const ui = useUiLabel()
  const { locale } = useLocale()
  const panelRef = useRef<HTMLDivElement>(null)
  const titleId = useId()

  useEffect(() => {
    if (!open) return
    const onKey = (e: KeyboardEvent) => {
      if (e.key === 'Escape') onClose()
    }
    window.addEventListener('keydown', onKey)
    return () => window.removeEventListener('keydown', onKey)
  }, [open, onClose])

  useEffect(() => {
    if (open) panelRef.current?.focus()
  }, [open, card?.id])

  useLayoutEffect(() => {
    if (!open) return
    const el = panelRef.current
    if (el) el.scrollTop = 0
  }, [open, card?.id])

  useEffect(() => {
    if (!open) return
    const prev = document.body.style.overflow
    document.body.style.overflow = 'hidden'
    return () => {
      document.body.style.overflow = prev
    }
  }, [open])

  if (!open || !card) return null

  const category = cardCategoryBadge(card)
  const summary = resolveCardSummary(card, locale)
  const whatIsIt = resolveCardWhatIsIt(card, locale)
  const why = resolveCardWhy(card, locale)
  const important = resolveCardImportant(card, locale)
  const fasting = resolveCardFasting(card, locale)
  const season = resolveCardSeason(card, locale)
  const caption = resolveCardImageCaption(card, locale)
  const scriptures = resolveCardScripture(card)
  const canOpenDate = Boolean(card.dayId || card.daySlug)

  return (
    <div className={styles.backdrop} role="presentation" onClick={onClose}>
      <div
        className={styles.panel}
        role="dialog"
        aria-modal="true"
        aria-labelledby={titleId}
        tabIndex={-1}
        ref={panelRef}
        onClick={(e) => e.stopPropagation()}
      >
        <header className={styles.head}>
          <div>
            <p className={styles.eyebrow}>{t('calendar.page.seeMore')}</p>
            {category ? <p className={styles.badge}>{category}</p> : null}
            <h2 id={titleId} className={styles.title}>
              {card.title}
            </h2>
            {card.titleAmharic ? (
              <p className={styles.titleAm} lang="am">
                {card.titleAmharic}
              </p>
            ) : null}
            <p className={styles.dates}>
              <span>{card.gregorianLabel}</span>
              <span aria-hidden> · </span>
              <span lang="am">{card.ethiopianLabel}</span>
            </p>
          </div>
          <button
            type="button"
            className={styles.close}
            onClick={onClose}
            aria-label={ui('dialogClose')}
          >
            {ui('dialogClose')}
          </button>
        </header>

        <div className={styles.body}>
          <figure className={styles.media}>
            <CalendarEventImage
              src={card.imageUrl}
              alt={card.imageAlt || card.title}
              position={card.imagePosition || card.objectPosition}
              className={styles.imageFrame}
              sizes="(max-width: 640px) 100vw, 36rem"
            />
            {caption ? (
              <figcaption className={styles.caption}>{caption}</figcaption>
            ) : null}
          </figure>

          {summary ? (
            <section className={styles.block} aria-label={t('calendar.page.summaryHeading')}>
              <p className={styles.summary}>{summary}</p>
            </section>
          ) : null}

          {whatIsIt ? (
            <section className={styles.block}>
              <h3 className={styles.blockTitle}>{t('calendar.page.whatIsThisHeading')}</h3>
              <Paragraphs text={whatIsIt} className={styles.prose} />
            </section>
          ) : null}

          {why ? (
            <section className={styles.block}>
              <h3 className={styles.blockTitle}>{t('calendar.page.whyHeading')}</h3>
              <Paragraphs text={why} className={styles.prose} />
            </section>
          ) : null}

          {important ? (
            <section className={styles.block}>
              <h3 className={styles.blockTitle}>{t('calendar.page.importantHeading')}</h3>
              <Paragraphs text={important} className={styles.prose} />
            </section>
          ) : null}

          {scriptures.length ? (
            <section className={styles.block}>
              <h3 className={styles.blockTitle}>{t('calendar.page.scriptureHeading')}</h3>
              <ul className={styles.scriptureList}>
                {scriptures.map((ref) => (
                  <li key={ref}>{ref}</li>
                ))}
              </ul>
            </section>
          ) : null}

          {fasting ? (
            <section className={styles.block}>
              <h3 className={styles.blockTitle}>{t('calendar.page.fastingHeading')}</h3>
              <Paragraphs text={fasting} className={styles.prose} />
            </section>
          ) : null}

          {season ? (
            <section className={styles.block}>
              <h3 className={styles.blockTitle}>{t('calendar.page.seasonHeading')}</h3>
              <Paragraphs text={season} className={styles.prose} />
            </section>
          ) : null}

          {!summary && !whatIsIt && !why && !important && !scriptures.length && !fasting && !season ? (
            <p className={styles.empty}>{t('calendar.page.whyEmpty')}</p>
          ) : null}

          <div className={styles.actions}>
            {canOpenDate ? (
              <button
                type="button"
                className={styles.primaryBtn}
                onClick={() => {
                  onOpenDate(card)
                  onClose()
                }}
              >
                {t('calendar.page.openDate')}
              </button>
            ) : null}
            <button type="button" className={styles.secondaryBtn} onClick={onClose}>
              {ui('dialogClose')}
            </button>
          </div>
        </div>
      </div>
    </div>
  )
}
