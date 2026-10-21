import { useMemo, useState } from 'react'
import { Link } from 'react-router-dom'
import { useTranslation } from '../../i18n'
import type { DayChurchContext } from '../../services/dayChurchContext'
import type { ResolvedCalendarCard } from '../../lib/calendar/resolveCalendarCard'
import type { CalendarLocaleMode } from '../../lib/calendar/calendarEnrichedContent'
import {
  displaySummary,
  localizeCalendarEventType,
  presentFast,
  presentMonthly,
  presentObservance,
  presentSeason,
  type PresentableCalendarEvent,
} from '../../lib/calendar/calendarPresentation'
import { useLocale } from '../../lib/i18n/locale'
import { CalendarEventDetails } from './CalendarEventDetails'
import { CalendarEventImage } from './CalendarEventImage'
import styles from './TodayInChurchPanel.module.css'

type Props = {
  context: DayChurchContext | null
  loading?: boolean
  error?: string | null
  onRetry?: () => void
  /** Optional presentation cards for images / overrides. */
  cards?: ResolvedCalendarCard[]
  /** Compact mode for homepage reuse. */
  compact?: boolean
  onLearnMore?: (event: PresentableCalendarEvent) => void
}

function toneClass(tone: string): string {
  switch (tone) {
    case 'christ':
      return styles.toneChrist
    case 'marian':
      return styles.toneMarian
    case 'angel':
      return styles.toneAngel
    case 'saint':
      return styles.toneSaint
    case 'cross':
      return styles.toneCross
    case 'fast':
      return styles.toneFast
    case 'season':
      return styles.toneSeason
    case 'eve':
      return styles.toneEve
    default:
      return styles.toneNeutral
  }
}

function EventMedia({
  event,
  major,
}: {
  event: PresentableCalendarEvent
  major?: boolean
}) {
  return (
    <CalendarEventImage
      src={event.hasImage ? event.imageUrl : null}
      alt={event.hasImage ? event.imageAlt : ''}
      position={event.objectPosition}
      className={styles.media}
      priority={Boolean(major)}
      fetchPriority={major ? 'high' : 'low'}
      sizes="(max-width: 720px) 100vw, 28rem"
    />
  )
}

function ExpandableEvent({
  event,
  lang,
  learnLabel,
  defaultOpen = false,
}: {
  event: PresentableCalendarEvent
  lang: CalendarLocaleMode
  learnLabel?: string
  defaultOpen?: boolean
}) {
  const t = useTranslation()
  const [open, setOpen] = useState(defaultOpen)
  const panelId = `cal-event-${event.kind}-${event.id}`
  const summary = displaySummary(event, lang)
  return (
    <article className={`${styles.expandRow} ${toneClass(event.tone)}`}>
      <div className={styles.expandMain}>
        <p className={styles.catLabel}>{localizeCalendarEventType(event.categoryLabel, t)}</p>
        <h3 className={styles.expandTitle}>{event.title}</h3>
        {event.titleAmharic ? (
          <p className={styles.amharic} lang="am">
            {event.titleAmharic}
          </p>
        ) : null}
        {event.ethiopianDateLabel ? (
          <p className={styles.metaLine}>
            {event.kind === 'monthly'
              ? `${t('calendar.page.monthlyLabel')} · ${event.ethiopianDateLabel}`
              : event.ethiopianDateLabel}
            {event.movableLabel ? ` · ${event.movableLabel}` : ''}
            {event.fastTypeLabel ? ` · ${event.fastTypeLabel}` : ''}
          </p>
        ) : event.fastTypeLabel || event.movableLabel ? (
          <p className={styles.metaLine}>
            {[event.fastTypeLabel, event.movableLabel].filter(Boolean).join(' · ')}
          </p>
        ) : null}
        {summary ? (
          <p className={styles.summary} lang={lang === 'am' ? 'am' : undefined}>
            {summary}
          </p>
        ) : null}
        <button
          type="button"
          className={styles.learnBtn}
          aria-expanded={open}
          aria-controls={panelId}
          onClick={() => setOpen((v) => !v)}
        >
          {open ? t('calendar.page.hideDetails') : learnLabel || t('calendar.page.learnMore')}
        </button>
      </div>
      {open ? (
        <div id={panelId} className={styles.expandPanel}>
          <CalendarEventDetails fields={event.fields} lang={lang} defaultOpenFirst />
        </div>
      ) : null}
    </article>
  )
}

export function TodayInChurchPanel({
  context,
  loading,
  error,
  onRetry,
  cards = [],
  compact = false,
}: Props) {
  const t = useTranslation()
  const { contentLocale: lang } = useLocale()

  const presented = useMemo(() => {
    if (!context) return null
    const ethName = context.ethiopianDate.monthName
    const primary = context.primaryObservance
      ? presentObservance(context.primaryObservance, cards, ethName)
      : null
    const others = context.observances
      .filter((o) => o.id !== primary?.id)
      .map((o) => presentObservance(o, cards, ethName))
    const fast = context.activeFast ? presentFast(context.activeFast, cards) : null
    const fastFree = context.fastFreeRule ? presentFast(context.fastFreeRule, cards) : null
    const related = (context.relatedFasts || []).map((f) => presentFast(f, cards))
    const season = context.season ? presentSeason(context.season, cards) : null
    const monthly = context.monthlyCommemorations.map((m) => presentMonthly(m, cards))
    return { primary, others, fast, fastFree, related, season, monthly }
  }, [context, cards])

  if (loading && !context) {
    return (
      <div className={styles.panel} role="status">
        <p className={styles.status}>{t('calendar.page.loadingDay')}</p>
      </div>
    )
  }

  if (error && !context) {
    return (
      <div className={styles.panel} role="alert">
        <p className={styles.status}>{error}</p>
        {onRetry ? (
          <button type="button" className={styles.learnBtn} onClick={onRetry}>
            {t('calendar.detail.tryAgain')}
          </button>
        ) : null}
      </div>
    )
  }

  if (!context || !presented) {
    return (
      <div className={styles.panel}>
        <p className={styles.status}>{t('calendar.page.selectDay')}</p>
      </div>
    )
  }

  const { primary, others, fast, fastFree, related, season, monthly } = presented
  const summaryText = primary
    ? displaySummary(primary, lang)
    : context.dayOneLiner

  return (
    <div className={`${styles.panel} ${compact ? styles.compact : ''}`}>
      <header className={styles.dayHero}>
        <div className={styles.dayHeroText}>
          <p className={styles.eyebrow}>
            {compact ? t('today.section.eyebrow') : t('calendar.page.selectedDay')}
          </p>
          <h2 className={styles.gregorian}>{context.gregorianLabel}</h2>
          <p className={styles.ethiopian}>{context.ethiopianLabel}</p>
        </div>
        {primary ? (
          <div className={`${styles.featured} ${primary.isMajor ? styles.featuredMajor : ''} ${toneClass(primary.tone)}`}>
            <EventMedia event={primary} major={primary.isMajor} />
            <div className={styles.featuredBody}>
              <p className={styles.catLabel}>
                {localizeCalendarEventType(primary.categoryLabel, t)}
              </p>
              <h3 className={styles.featuredTitle}>{primary.title}</h3>
              {primary.titleAmharic ? (
                <p className={styles.amharic} lang="am">
                  {primary.titleAmharic}
                </p>
              ) : null}
              {primary.ethiopianDateLabel ? (
                <p className={styles.metaLine}>
                  {primary.ethiopianDateLabel}
                  {primary.movableLabel ? ` · ${primary.movableLabel}` : ''}
                </p>
              ) : primary.movableLabel ? (
                <p className={styles.metaLine}>{primary.movableLabel}</p>
              ) : null}
              {summaryText ? (
                <p className={styles.summary} lang={lang === 'am' ? 'am' : undefined}>
                  {summaryText}
                </p>
              ) : null}
              <CalendarEventDetails fields={primary.fields} lang={lang} />
            </div>
          </div>
        ) : (
          <div className={styles.quietDay}>
            <p className={styles.summary}>{context.dayOneLiner}</p>
          </div>
        )}
      </header>

      {!compact ? (
        <section className={styles.strip} aria-label={t('calendar.page.glanceLabel')}>
          <div className={styles.stripRow}>
            <span className={styles.stripKey}>{t('calendar.page.fastHeading')}</span>
            <span className={styles.stripVal}>
              {context.fastingStatus.isFastDay
                ? context.fastingStatus.label || t('calendar.page.fastingToday')
                : context.fastingStatus.isFastFree
                  ? t('calendar.page.noWeeklyFast')
                  : t('calendar.page.noPeriodFast')}
            </span>
          </div>
          {season ? (
            <div className={styles.stripRow}>
              <span className={styles.stripKey}>{t('calendar.page.seasonLabel')}</span>
              <span className={styles.stripVal}>{season.title}</span>
            </div>
          ) : null}
          {monthly.length > 0 ? (
            <div className={styles.stripRow}>
              <span className={styles.stripKey}>{t('calendar.page.monthlyLabel')}</span>
              <span className={styles.stripVal}>
                {monthly.map((m) => m.title).join(' · ')}
              </span>
            </div>
          ) : null}
        </section>
      ) : null}

      {fast ? (
        <section className={styles.block} aria-labelledby="cal-fast-heading">
          <h3 id="cal-fast-heading" className={styles.blockTitle}>
            {t('calendar.page.fastingHeading')}
          </h3>
          <ExpandableEvent event={fast} lang={lang} learnLabel={t('calendar.page.aboutFast')} />
          {related.length > 0 ? (
            <div className={styles.relatedNote}>
              <p className={styles.metaLine}>{t('calendar.page.relatedFastNote')}</p>
              {related.map((r) => (
                <ExpandableEvent key={r.id} event={r} lang={lang} learnLabel={t('calendar.page.fastDetails')} />
              ))}
            </div>
          ) : null}
        </section>
      ) : null}

      {!fast && (fastFree || context.fastingStatus.isFastFree) ? (
        <section className={styles.block} aria-labelledby="cal-fastfree-heading">
          <h3 id="cal-fastfree-heading" className={styles.blockTitle}>
            {t('calendar.page.fastingHeading')}
          </h3>
          <article className={`${styles.expandRow} ${styles.toneFast}`}>
            <p className={styles.catLabel}>{t('calendar.page.fastFreeBadge')}</p>
            <h3 className={styles.expandTitle}>
              {fastFree?.title || context.fastingStatus.label || t('calendar.page.fastFreeDay')}
            </h3>
            {fastFree?.titleAmharic ? (
              <p className={styles.amharic} lang="am">
                {fastFree.titleAmharic}
              </p>
            ) : null}
            <p className={styles.summary}>
              {context.fastingStatus.exceptionNote ||
                fastFree?.summary ||
                t('calendar.page.noWeeklyFast')}
            </p>
            {fastFree ? (
              <CalendarEventDetails fields={fastFree.fields} lang={lang} />
            ) : null}
          </article>
        </section>
      ) : null}

      {season ? (
        <section className={styles.block} aria-labelledby="cal-season-heading">
          <h3 id="cal-season-heading" className={styles.blockTitle}>
            {t('calendar.page.seasonHeading')}
          </h3>
          <p className={styles.seasonHint}>{t('calendar.page.seasonHint')}</p>
          <ExpandableEvent event={season} lang={lang} learnLabel={t('calendar.page.learnMore')} />
        </section>
      ) : null}

      {monthly.length > 0 ? (
        <section className={styles.block} aria-labelledby="cal-monthly-heading">
          <h3 id="cal-monthly-heading" className={styles.blockTitle}>
            {t('calendar.page.monthlyLabel')}
          </h3>
          <div className={styles.stack}>
            {monthly.map((m) => (
              <ExpandableEvent key={m.id} event={m} lang={lang} />
            ))}
          </div>
        </section>
      ) : null}

      {others.length > 0 ? (
        <section className={styles.block} aria-labelledby="cal-other-heading">
          <h3 id="cal-other-heading" className={styles.blockTitle}>
            {t('calendar.page.observancesLabel')}
          </h3>
          <div className={styles.stack}>
            {others.map((o) => (
              <ExpandableEvent key={o.id} event={o} lang={lang} />
            ))}
          </div>
        </section>
      ) : null}

      <section className={styles.block} aria-labelledby="cal-synaxarium-heading">
        <h3 id="cal-synaxarium-heading" className={styles.blockTitle}>
          {t('calendar.page.synaxariumHeading')}
        </h3>
        {context.synaxarium.length ? (
          <ul className={styles.stack}>
            {context.synaxarium.map((item) => (
              <li key={item.id}>
                {context.synaxariumDaySlug ? (
                  <Link className={styles.dayLink} to={`/pray/synaxarium/${context.synaxariumDaySlug}`}>
                    {item.title}
                  </Link>
                ) : (
                  item.title
                )}
              </li>
            ))}
          </ul>
        ) : (
          <p className={styles.summary}>{t('calendar.page.synaxariumMissing')}</p>
        )}
      </section>

      {!compact ? (
        <section className={styles.block} aria-labelledby="cal-related-heading">
          <h3 id="cal-related-heading" className={styles.blockTitle}>
            {t('calendar.page.hymnsHeading')}
          </h3>
          {context.mezmurRecommendations.length ? (
            context.mezmurRecommendations.map((item) => (
              <article key={item.id} className={styles.resourceRow}>
                <div>
                  <p className={styles.expandTitle}>{item.title}</p>
                  {item.titleAmharic ? (
                    <p className={styles.amharic} lang="am">
                      {item.titleAmharic}
                    </p>
                  ) : null}
                </div>
                <Link className={styles.learnBtn} to={item.practiceHref}>
                  {item.title}
                </Link>
              </article>
            ))
          ) : (
            <p className={styles.summary}>{t('calendar.page.relatedMissing')}</p>
          )}
        </section>
      ) : null}
    </div>
  )
}

export type { PresentableCalendarEvent }
