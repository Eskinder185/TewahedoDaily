import { useMemo, useState } from 'react'
import { Link } from 'react-router-dom'
import type { DayChurchContext } from '../../services/dayChurchContext'
import type { ResolvedCalendarCard } from '../../lib/calendar/resolveCalendarCard'
import type { CalendarLocaleMode } from '../../lib/calendar/calendarEnrichedContent'
import {
  displaySummary,
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
  learnLabel = 'Learn more',
  defaultOpen = false,
}: {
  event: PresentableCalendarEvent
  lang: CalendarLocaleMode
  learnLabel?: string
  defaultOpen?: boolean
}) {
  const [open, setOpen] = useState(defaultOpen)
  const panelId = `cal-event-${event.kind}-${event.id}`
  const summary =
    lang === 'both'
      ? null
      : displaySummary(event, lang)
  return (
    <article className={`${styles.expandRow} ${toneClass(event.tone)}`}>
      <div className={styles.expandMain}>
        <p className={styles.catLabel}>{event.categoryLabel}</p>
        <h3 className={styles.expandTitle}>{event.title}</h3>
        {event.titleAmharic ? (
          <p className={styles.amharic} lang="am">
            {event.titleAmharic}
          </p>
        ) : null}
        {event.ethiopianDateLabel ? (
          <p className={styles.metaLine}>
            {event.kind === 'monthly'
              ? `Monthly commemoration · ${event.ethiopianDateLabel}`
              : event.ethiopianDateLabel}
            {event.movableLabel ? ` · ${event.movableLabel}` : ''}
            {event.fastTypeLabel ? ` · ${event.fastTypeLabel}` : ''}
          </p>
        ) : event.fastTypeLabel || event.movableLabel ? (
          <p className={styles.metaLine}>
            {[event.fastTypeLabel, event.movableLabel].filter(Boolean).join(' · ')}
          </p>
        ) : null}
        {lang === 'both' ? (
          <div className={styles.summaryStack}>
            {event.summaryAmharic ? (
              <p className={styles.summaryAm} lang="am">
                {event.summaryAmharic}
              </p>
            ) : null}
            {event.summary || event.description ? (
              <p className={styles.summary}>{event.summary || event.description}</p>
            ) : null}
          </div>
        ) : summary ? (
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
          {open ? 'Hide details' : learnLabel}
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
        <p className={styles.status}>Loading today’s church calendar…</p>
      </div>
    )
  }

  if (error && !context) {
    return (
      <div className={styles.panel} role="alert">
        <p className={styles.status}>{error}</p>
        {onRetry ? (
          <button type="button" className={styles.learnBtn} onClick={onRetry}>
            Try again
          </button>
        ) : null}
      </div>
    )
  }

  if (!context || !presented) {
    return (
      <div className={styles.panel}>
        <p className={styles.status}>Select a day to see observances, fasts, and seasons.</p>
      </div>
    )
  }

  const { primary, others, fast, fastFree, related, season, monthly } = presented
  const summaryText =
    primary && lang !== 'both'
      ? displaySummary(primary, lang)
      : primary
        ? primary.summary || primary.description
        : context.dayOneLiner

  return (
    <div className={`${styles.panel} ${compact ? styles.compact : ''}`}>
      <header className={styles.dayHero}>
        <div className={styles.dayHeroText}>
          <p className={styles.eyebrow}>{compact ? 'Today in Church' : 'Selected day'}</p>
          <h2 className={styles.gregorian}>{context.gregorianLabel}</h2>
          <p className={styles.ethiopian}>{context.ethiopianLabel}</p>
        </div>
        {primary ? (
          <div className={`${styles.featured} ${primary.isMajor ? styles.featuredMajor : ''} ${toneClass(primary.tone)}`}>
            <EventMedia event={primary} major={primary.isMajor} />
            <div className={styles.featuredBody}>
              <p className={styles.catLabel}>
                {primary.isEveOrPreparation ? primary.categoryLabel : primary.categoryLabel}
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
              {lang === 'both' ? (
                <div className={styles.summaryStack}>
                  {primary.summaryAmharic ? (
                    <p className={styles.summaryAm} lang="am">
                      {primary.summaryAmharic}
                    </p>
                  ) : null}
                  {(primary.summary || primary.description) && (
                    <p className={styles.summary}>{primary.summary || primary.description}</p>
                  )}
                </div>
              ) : summaryText ? (
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
        <section className={styles.strip} aria-label="Today at a glance">
          <div className={styles.stripRow}>
            <span className={styles.stripKey}>Fast</span>
            <span className={styles.stripVal}>
              {context.fastingStatus.isFastDay
                ? context.fastingStatus.label || 'Fasting today'
                : context.fastingStatus.isFastFree
                  ? 'No regular Wednesday/Friday fast today'
                  : 'No period fast today'}
            </span>
          </div>
          {season ? (
            <div className={styles.stripRow}>
              <span className={styles.stripKey}>Season</span>
              <span className={styles.stripVal}>{season.title}</span>
            </div>
          ) : null}
          {monthly.length > 0 ? (
            <div className={styles.stripRow}>
              <span className={styles.stripKey}>Monthly</span>
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
            Fasting today
          </h3>
          <ExpandableEvent event={fast} lang={lang} learnLabel="About this fast" />
          {related.length > 0 ? (
            <div className={styles.relatedNote}>
              <p className={styles.metaLine}>
                Related fast components (same fasting observance, not additional days):
              </p>
              {related.map((r) => (
                <ExpandableEvent key={r.id} event={r} lang={lang} learnLabel="Details" />
              ))}
            </div>
          ) : null}
        </section>
      ) : null}

      {!fast && (fastFree || context.fastingStatus.isFastFree) ? (
        <section className={styles.block} aria-labelledby="cal-fastfree-heading">
          <h3 id="cal-fastfree-heading" className={styles.blockTitle}>
            Fasting
          </h3>
          <article className={`${styles.expandRow} ${styles.toneFast}`}>
            <p className={styles.catLabel}>FAST-FREE</p>
            <h3 className={styles.expandTitle}>
              {fastFree?.title || context.fastingStatus.label || 'Fast-free day'}
            </h3>
            {fastFree?.titleAmharic ? (
              <p className={styles.amharic} lang="am">
                {fastFree.titleAmharic}
              </p>
            ) : null}
            <p className={styles.summary}>
              {context.fastingStatus.exceptionNote ||
                fastFree?.summary ||
                'No regular Wednesday/Friday fast today.'}
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
            Current season
          </h3>
          <p className={styles.seasonHint}>
            A liturgical season describes the church year. It does not automatically impose fasting.
          </p>
          <ExpandableEvent event={season} lang={lang} learnLabel="Learn more" />
        </section>
      ) : null}

      {monthly.length > 0 ? (
        <section className={styles.block} aria-labelledby="cal-monthly-heading">
          <h3 id="cal-monthly-heading" className={styles.blockTitle}>
            Monthly commemorations
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
            Also today
          </h3>
          <div className={styles.stack}>
            {others.map((o) => (
              <ExpandableEvent key={o.id} event={o} lang={lang} />
            ))}
          </div>
        </section>
      ) : null}

      {!compact && (context.mezmurRecommendations.length > 0 || context.practiceLinks.length > 0) ? (
        <section className={styles.block} aria-labelledby="cal-related-heading">
          <h3 id="cal-related-heading" className={styles.blockTitle}>
            Related resources
          </h3>
          {context.mezmurRecommendations.slice(0, 3).map((item) => (
            <article key={item.id} className={styles.resourceRow}>
              <div>
                <p className={styles.expandTitle}>{item.title}</p>
                {item.titleAmharic ? (
                  <p className={styles.amharic} lang="am">
                    {item.titleAmharic}
                  </p>
                ) : null}
                {item.matchReason ? <p className={styles.metaLine}>{item.matchReason}</p> : null}
              </div>
              <Link className={styles.learnBtn} to={item.practiceHref}>
                Open hymn
              </Link>
            </article>
          ))}
          <div className={styles.linkRow}>
            {context.practiceLinks.map((link) => (
              <Link key={link.href + link.label} className={styles.textLink} to={link.href}>
                {link.label}
              </Link>
            ))}
          </div>
        </section>
      ) : null}
    </div>
  )
}

export type { PresentableCalendarEvent }
