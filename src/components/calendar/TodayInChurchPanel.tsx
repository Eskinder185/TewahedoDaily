import { useMemo, useState } from 'react'
import { Link } from 'react-router-dom'
import type {
  DayChurchContext,
  DayCommemorationItem,
  DayMezmurRecommendation,
} from '../../services/dayChurchContext'
import styles from './TodayInChurchPanel.module.css'

type Props = {
  context: DayChurchContext | null
  loading?: boolean
  error?: string | null
  onRetry?: () => void
}

type LiturgyTab = 'overview' | 'readings' | 'liturgy' | 'mezmur'

const TABS: Array<{ id: LiturgyTab; label: string }> = [
  { id: 'overview', label: 'Overview' },
  { id: 'readings', label: 'Readings' },
  { id: 'liturgy', label: 'Liturgy' },
  { id: 'mezmur', label: 'Mezmur' },
]

function badgeClass(tone: string) {
  switch (tone) {
    case 'feast':
      return styles.badgeFeast
    case 'fast':
      return styles.badgeFast
    case 'saint':
      return styles.badgeSaint
    case 'season':
      return styles.badgeSeason
    case 'mary':
      return styles.badgeMary
    case 'angel':
      return styles.badgeAngel
    default:
      return styles.badgeNeutral
  }
}

function MezmurCard({ item }: { item: DayMezmurRecommendation }) {
  return (
    <article className={styles.mezmurCard}>
      {item.thumbnailUrl ? (
        <img className={styles.mezmurThumb} src={item.thumbnailUrl} alt={item.imageAlt} loading="lazy" />
      ) : (
        <div className={styles.mezmurThumbEmpty} aria-hidden />
      )}
      <div className={styles.mezmurBody}>
        <p className={styles.mezmurTitle}>{item.title}</p>
        {item.titleAmharic ? (
          <p className={styles.mezmurAmharic} lang="am">
            {item.titleAmharic}
          </p>
        ) : null}
        <p className={styles.mezmurMeta}>
          {[item.language, item.category].filter(Boolean).join(' · ')}
        </p>
        <div className={styles.mezmurActions}>
          {item.playHref ? (
            <a className={styles.btnGhost} href={item.playHref} target="_blank" rel="noreferrer">
              Play
            </a>
          ) : null}
          <Link className={styles.btnPrimary} to={item.practiceHref}>
            Practice
          </Link>
        </div>
      </div>
    </article>
  )
}

function SynaxariumList({ items, daySlug }: { items: DayCommemorationItem[]; daySlug: string | null }) {
  const [showAll, setShowAll] = useState(false)
  const [openId, setOpenId] = useState<string | null>(null)
  const visible = showAll ? items : items.slice(0, 3)

  return (
    <div className={styles.stackGap}>
      {visible.map((item) => {
        const open = openId === item.id
        return (
          <article key={item.id} className={`${styles.accordionItem} ${open ? styles.accordionOpen : ''}`}>
            <button
              type="button"
              className={styles.accordionHead}
              aria-expanded={open}
              onClick={() => setOpenId(open ? null : item.id)}
            >
              <span className={styles.accordionType}>{item.typeLabel}</span>
              <span className={styles.accordionTitle}>{item.title}</span>
              {!open && item.summary ? (
                <span className={styles.accordionPreview}>{item.summary}</span>
              ) : null}
              <span className={styles.accordionToggle}>{open ? 'Show less' : 'Read more'}</span>
            </button>
            {open ? (
              <div className={styles.accordionBody}>
                <p>{item.longerSummary || item.summary}</p>
              </div>
            ) : null}
          </article>
        )
      })}
      {items.length > 3 ? (
        <button type="button" className={styles.textLink} onClick={() => setShowAll((v) => !v)}>
          {showAll ? 'Show fewer commemorations' : `View all ${items.length} commemorations`}
        </button>
      ) : null}
      <Link
        className={styles.textLink}
        to={daySlug ? `/pray/synaxarium/${daySlug}` : '/pray/synaxarium'}
      >
        View full Synaxarium
      </Link>
    </div>
  )
}

function LiturgyTabs({ context }: { context: DayChurchContext }) {
  const [tab, setTab] = useState<LiturgyTab>('overview')
  const liturgy = context.liturgySummary

  return (
    <section className={styles.card} aria-labelledby="liturgy-guidance-title">
      <p className={styles.sectionKicker}>Worship</p>
      <h3 id="liturgy-guidance-title" className={styles.sectionTitle}>
        Liturgical guidance
      </h3>

      <div className={styles.tabList} role="tablist" aria-label="Liturgical guidance">
        {TABS.map((item) => (
          <button
            key={item.id}
            type="button"
            role="tab"
            aria-selected={tab === item.id}
            className={`${styles.tab} ${tab === item.id ? styles.tabActive : ''}`}
            onClick={() => setTab(item.id)}
          >
            {item.label}
          </button>
        ))}
      </div>

      <div className={styles.tabPanel} role="tabpanel">
        {tab === 'overview' ? (
          <div className={styles.stackGap}>
            <div className={styles.summaryRow}>
              {context.primaryObservance ? (
                <div>
                  <p className={styles.infoLabel}>Feast</p>
                  <p className={styles.infoValue}>{context.primaryObservance.title}</p>
                </div>
              ) : null}
              {context.activeFast ? (
                <div>
                  <p className={styles.infoLabel}>Fast</p>
                  <p className={styles.infoValue}>{context.activeFast.name}</p>
                </div>
              ) : null}
              {context.season ? (
                <div>
                  <p className={styles.infoLabel}>Season</p>
                  <p className={styles.infoValue}>{context.season.title}</p>
                </div>
              ) : null}
            </div>
            <p className={styles.muted}>
              {liturgy?.liturgicalEmphasis || 'Pray with attentiveness to today’s commemorations.'}
            </p>
            <div className={styles.flowChips}>
              {(liturgy?.serviceFlow || ['Opening', 'Readings', 'Anaphora', 'Communion']).map(
                (step, index, arr) => (
                  <span key={step} className={styles.flowChip}>
                    {step}
                    {index < arr.length - 1 ? <span aria-hidden> → </span> : null}
                  </span>
                ),
              )}
            </div>
          </div>
        ) : null}

        {tab === 'readings' ? (
          <div className={styles.stackGap}>
            <p className={styles.muted}>{liturgy?.readingsPatternLabel}</p>
            {liturgy?.readings?.length ? (
              <ol className={styles.readingList}>
                {liturgy.readings.map((reading) => (
                  <li key={reading.id} className={styles.readingItem}>
                    <span className={styles.readingIndex}>{reading.order}</span>
                    <div>
                      <p className={styles.readingLabel}>{reading.label}</p>
                      <p className={styles.readingRef}>{reading.reference}</p>
                    </div>
                  </li>
                ))}
              </ol>
            ) : (
              <div className={styles.fallbackBox}>
                <p>Standard reading pattern for this observance</p>
                <p className={styles.muted}>Typical pattern: Epistle · Acts · Psalm · Gospel</p>
              </div>
            )}
            <Link className={styles.btnPrimary} to={liturgy?.openHref || '/pray/divine-liturgy'}>
              Open liturgy readings
            </Link>
          </div>
        ) : null}

        {tab === 'liturgy' ? (
          <div className={styles.richCard}>
            <p className={styles.infoLabel}>Anaphora / Liturgy</p>
            <h4 className={styles.richTitle}>
              {liturgy?.anaphoraTitle || 'Standard anaphora is used for this day'}
            </h4>
            <p>{liturgy?.anaphoraSummary}</p>
            <Link className={styles.btnPrimary} to={liturgy?.openHref || '/pray/divine-liturgy'}>
              Open Divine Liturgy
            </Link>
          </div>
        ) : null}

        {tab === 'mezmur' ? (
          <div className={styles.stackGap}>
            {context.mezmurRecommendations.length ? (
              context.mezmurRecommendations.map((item) => <MezmurCard key={item.id} item={item} />)
            ) : (
              <Link className={styles.btnGhost} to="/practice">
                Explore Mezmur Library
              </Link>
            )}
          </div>
        ) : null}
      </div>
    </section>
  )
}

export function TodayInChurchPanel({ context, loading, error, onRetry }: Props) {
  const dateRef = useMemo(() => {
    if (!context) return ''
    return `${context.weekdayLabel}, ${context.gregorianLabel} / ${context.ethiopianLabel} — ${context.dayTitle}`
  }, [context])

  if (loading && !context) {
    return (
      <aside className={styles.root} aria-busy="true" aria-label="Today in Church">
        <div className={styles.skeletonHero} />
        <div className={styles.skeletonCard} />
        <div className={styles.skeletonCard} />
      </aside>
    )
  }

  if (error && !context) {
    return (
      <aside className={styles.root} aria-label="Today in Church">
        <div className={styles.card}>
          <p className={styles.errorText}>{error}</p>
          {onRetry ? (
            <button type="button" className={styles.btnGhost} onClick={onRetry}>
              Try again
            </button>
          ) : null}
        </div>
      </aside>
    )
  }

  if (!context) {
    return (
      <aside className={styles.root} aria-label="Today in Church">
        <div className={styles.card}>
          <p className={styles.muted}>Select a day on the calendar to open today’s observances.</p>
        </div>
      </aside>
    )
  }

  const showFastSeason = Boolean(context.activeFast || context.season)

  return (
    <aside
      className={`${styles.root} ${loading ? styles.rootRefreshing : ''}`}
      aria-labelledby="today-in-church-title"
    >
      <header className={`${styles.card} ${styles.heroCard}`}>
        <p className={styles.sectionKicker}>Today in Church</p>
        <p className={styles.heroGregorian}>
          {context.weekdayLabel}, {context.gregorianLabel}
        </p>
        <p className={styles.heroEthiopian} lang="am">
          {context.ethiopianLabel}
        </p>
        <h2 id="today-in-church-title" className={styles.heroTitle}>
          {context.dayTitle}
        </h2>
        <p className={styles.heroSummary}>{context.dayOneLiner}</p>
        {context.badges.length ? (
          <div className={styles.badgeRow}>
            {context.badges.map((badge) => (
              <span key={badge.id} className={`${styles.badge} ${badgeClass(badge.tone)}`}>
                {badge.label}
              </span>
            ))}
          </div>
        ) : null}
      </header>

      {context.primaryObservance ? (
        <section className={styles.card} aria-labelledby="current-observance-title">
          <p className={styles.sectionKicker}>Current observance</p>
          <h3 id="current-observance-title" className={styles.sectionTitle}>
            {context.primaryObservance.title}
          </h3>
          {context.primaryObservance.titleAmharic ? (
            <p className={styles.amharicLine} lang="am">
              {context.primaryObservance.titleAmharic}
            </p>
          ) : null}
          {context.primaryObservance.description ? (
            <p className={styles.bodyText}>{context.primaryObservance.description}</p>
          ) : null}
          {context.observances.length > 1 ? (
            <ul className={styles.simpleList}>
              {context.observances
                .filter((o) => o.id !== context.primaryObservance?.id)
                .map((o) => (
                  <li key={o.id}>{o.title}</li>
                ))}
            </ul>
          ) : null}
        </section>
      ) : null}

      {showFastSeason ? (
        <section className={styles.card} aria-labelledby="fast-season-title">
          <p className={styles.sectionKicker}>Fast / Season</p>
          <h3 id="fast-season-title" className={styles.srOnly}>
            Fast and season
          </h3>
          <div className={styles.compactGrid}>
            {context.activeFast ? (
              <div className={styles.compactItem}>
                <p className={styles.infoLabel}>Fast</p>
                <p className={styles.infoValue}>{context.activeFast.name}</p>
              </div>
            ) : null}
            {context.season ? (
              <div className={styles.compactItem}>
                <p className={styles.infoLabel}>Season</p>
                <p className={styles.infoValue}>{context.season.title}</p>
              </div>
            ) : null}
          </div>
        </section>
      ) : null}

      {context.monthlyCommemorations.length ? (
        <section className={styles.card} aria-labelledby="monthly-title">
          <p className={styles.sectionKicker}>Recurring</p>
          <h3 id="monthly-title" className={styles.sectionTitle}>
            Monthly commemorations
          </h3>
          <ul className={styles.simpleList}>
            {context.monthlyCommemorations.map((item) => (
              <li key={item.id}>
                <strong>{item.title}</strong>
                {item.titleAmharic ? (
                  <span className={styles.listAmharic} lang="am">
                    {' '}
                    · {item.titleAmharic}
                  </span>
                ) : null}
              </li>
            ))}
          </ul>
        </section>
      ) : null}

      {context.synaxariumAvailable && context.synaxarium.length ? (
        <section className={styles.card} aria-labelledby="commemorations-title">
          <p className={styles.sectionKicker}>Synaxarium</p>
          <h3 id="commemorations-title" className={styles.sectionTitle}>
            Today&apos;s commemorations
          </h3>
          <SynaxariumList items={context.synaxarium} daySlug={context.synaxariumDaySlug} />
        </section>
      ) : null}

      <LiturgyTabs context={context} />

      {context.mezmurRecommendations.length ? (
        <section className={styles.card} aria-labelledby="mezmur-title">
          <p className={styles.sectionKicker}>Hymns</p>
          <h3 id="mezmur-title" className={styles.sectionTitle}>
            Recommended mezmur
          </h3>
          <div className={styles.stackGap}>
            {context.mezmurRecommendations.map((item) => (
              <MezmurCard key={item.id} item={item} />
            ))}
          </div>
        </section>
      ) : (
        <section className={styles.card}>
          <Link className={styles.btnGhost} to="/practice">
            Explore Mezmur Library
          </Link>
        </section>
      )}

      <section className={styles.card} aria-labelledby="why-title">
        <p className={styles.sectionKicker}>Reflection</p>
        <h3 id="why-title" className={styles.sectionTitle}>
          Why this day matters
        </h3>
        <p className={styles.whyText}>{context.whyThisDay}</p>
      </section>

      <section className={styles.card} aria-labelledby="actions-title">
        <p className={styles.sectionKicker}>Continue</p>
        <h3 id="actions-title" className={styles.sectionTitle}>
          Quick actions
        </h3>
        <div className={styles.actionGrid}>
          {context.practiceLinks.map((link) => (
            <Link key={link.href + link.label} className={styles.actionTile} to={link.href}>
              {link.label}
            </Link>
          ))}
          <button
            type="button"
            className={styles.actionTile}
            onClick={() => void navigator.clipboard?.writeText(dateRef)}
          >
            Copy date reference
          </button>
        </div>
      </section>
    </aside>
  )
}
