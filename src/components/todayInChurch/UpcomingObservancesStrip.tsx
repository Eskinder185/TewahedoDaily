import { useCallback, useEffect, useMemo, useRef, useState } from 'react'
import type { UpcomingObservance } from '../../lib/churchCalendar'
import {
  buildObservanceCardDates,
  simpleObservanceKindLabel,
  upcomingObservanceSortKey,
} from '../../lib/churchCalendar'
import { assignObservanceRowArts } from '../../content/nextObservancesArtPool'
import {
  COMPANION_OBSERVANCES,
  isCompanionObservanceId,
} from '../../content/nextObservancesCompanions'
import { calendarImageManifest } from '../../content/calendarImageManifest'
import { CalendarImage } from '../calendar/CalendarImage'
import styles from './UpcomingObservancesStrip.module.css'

type Props = {
  items: UpcomingObservance[]
  onActivate?: (item: UpcomingObservance) => void
  highlightedId?: string | null
}

type TabId = 'all' | UpcomingObservance['kind']

const TABS: Array<{ id: TabId; label: string }> = [
  { id: 'all', label: 'All' },
  { id: 'feast', label: 'Feasts' },
  { id: 'fast', label: 'Fasts' },
  { id: 'commemoration', label: 'Saints' },
]

const fallbackThumb = calendarImageManifest.anchors.todayInChurch

function useCoarsePrimaryPointer(): boolean {
  const [coarse, setCoarse] = useState(() =>
    typeof window !== 'undefined' ? window.matchMedia('(hover: none)').matches : false,
  )
  useEffect(() => {
    const mq = window.matchMedia('(hover: none)')
    const onChange = () => setCoarse(mq.matches)
    mq.addEventListener('change', onChange)
    return () => mq.removeEventListener('change', onChange)
  }, [])
  return coarse
}

function mergeDeck(items: UpcomingObservance[]): UpcomingObservance[] {
  const seen = new Set<string>()
  const out: UpcomingObservance[] = []
  for (const i of items) {
    if (seen.has(i.id)) continue
    seen.add(i.id)
    out.push(i)
  }
  for (const c of COMPANION_OBSERVANCES) {
    if (seen.has(c.id)) continue
    seen.add(c.id)
    out.push(c)
  }
  return out
}

/** Civil timeline using anchors, then loose dates in copy, then browse-only companions. */
function sortChronological(a: UpcomingObservance, b: UpcomingObservance): number {
  const ka = upcomingObservanceSortKey(a, isCompanionObservanceId(a.id))
  const kb = upcomingObservanceSortKey(b, isCompanionObservanceId(b.id))
  if (ka !== kb) return ka - kb
  return a.title.localeCompare(b.title, undefined, { sensitivity: 'base' })
}

function cardSummary(item: UpcomingObservance, hasImage: boolean): string {
  const own = item.shortDescription?.trim()
  if (own) return own
  const bucket =
    item.kind === 'fast'
      ? 'fasting, repentance, and holy preparation'
      : item.kind === 'feast'
        ? 'the festal rhythm of the Church year'
        : 'the communion of saints in Ethiopian Orthodox memory'
  if (hasImage) {
    return `Sacred art for ${item.title} — a visual companion to ${bucket}.`
  }
  return `A reverent note for ${item.title}, inviting prayer around ${bucket}.`
}

export function UpcomingObservancesStrip({
  items,
  onActivate,
  highlightedId = null,
}: Props) {
  const [tab, setTab] = useState<TabId>('all')
  const [expandedSummaryId, setExpandedSummaryId] = useState<string | null>(null)
  const [scrollHint, setScrollHint] = useState({ start: false, end: false })
  const trackRef = useRef<HTMLDivElement>(null)
  const coarsePointer = useCoarsePrimaryPointer()

  const deck = useMemo(() => mergeDeck(items), [items])

  const filtered = useMemo(() => {
    const rows = tab === 'all' ? [...deck] : deck.filter((i) => i.kind === tab)
    return [...rows].sort(sortChronological)
  }, [deck, tab])

  const rows = useMemo(() => assignObservanceRowArts(filtered), [filtered])

  const updateScrollHint = useCallback(() => {
    const el = trackRef.current
    if (!el) return
    const { scrollLeft, scrollWidth, clientWidth } = el
    const max = scrollWidth - clientWidth
    setScrollHint({
      start: scrollLeft > 4,
      end: scrollLeft < max - 4,
    })
  }, [])

  useEffect(() => {
    const el = trackRef.current
    if (!el) return
    updateScrollHint()
    el.addEventListener('scroll', updateScrollHint, { passive: true })
    const ro = new ResizeObserver(updateScrollHint)
    ro.observe(el)
    return () => {
      el.removeEventListener('scroll', updateScrollHint)
      ro.disconnect()
    }
  }, [rows, tab, updateScrollHint])

  useEffect(() => {
    setExpandedSummaryId(null)
    const el = trackRef.current
    if (el) el.scrollTo({ left: 0, behavior: 'auto' })
  }, [tab])

  const scrollByDir = useCallback((dir: -1 | 1) => {
    const el = trackRef.current
    if (!el) return
    const step = Math.min(el.clientWidth * 0.72, 360) * dir
    el.scrollBy({ left: step, behavior: 'smooth' })
  }, [])

  const toggleSummaryTap = useCallback(
    (id: string) => {
      if (!coarsePointer) return
      setExpandedSummaryId((cur) => (cur === id ? null : id))
    },
    [coarsePointer],
  )

  const onCardActivate = useCallback(
    (e: React.MouseEvent, item: UpcomingObservance) => {
      e.stopPropagation()
      onActivate?.(item)
    },
    [onActivate],
  )

  return (
    <section className={styles.section} aria-labelledby="upcoming-heading">
      <header className={styles.sectionHead}>
        <h3 id="upcoming-heading" className={styles.heading}>
          Next observances
        </h3>
        <p className={styles.hint}>
          One gallery in civil-calendar order when an anchor exists; otherwise the clearest window from the data.
          Summaries and fuller meaning open on hover (desktop) or tap (mobile). Confirm every date with your parish
          books.
        </p>
      </header>

      <div className={styles.tablist} role="tablist" aria-label="Observance category">
        {TABS.map((t) => {
          const selected = tab === t.id
          return (
            <button
              key={t.id}
              id={`observance-tab-${t.id}`}
              type="button"
              role="tab"
              aria-selected={selected}
              className={`${styles.tab} ${selected ? styles.tabOn : ''}`}
              onClick={() => setTab(t.id)}
            >
              {t.label}
            </button>
          )
        })}
      </div>

      <div
        className={styles.carousel}
        role="tabpanel"
        id={`observances-panel-${tab}`}
        aria-labelledby={`observance-tab-${tab}`}
      >
        {rows.length === 0 ? (
          <p className={styles.empty}>Nothing in this category yet.</p>
        ) : (
          <>
            <div
              className={`${styles.edgeFade} ${styles.edgeFadeLeft} ${scrollHint.start ? styles.edgeFadeOn : ''}`}
              aria-hidden
            />
            <div
              className={`${styles.edgeFade} ${styles.edgeFadeRight} ${scrollHint.end ? styles.edgeFadeOn : ''}`}
              aria-hidden
            />

            <button
              type="button"
              className={`${styles.navBtn} ${styles.navPrev}`}
              aria-label="Scroll gallery left"
              onClick={() => scrollByDir(-1)}
            >
              <span aria-hidden>‹</span>
            </button>
            <button
              type="button"
              className={`${styles.navBtn} ${styles.navNext}`}
              aria-label="Scroll gallery right"
              onClick={() => scrollByDir(1)}
            >
              <span aria-hidden>›</span>
            </button>

            <div
              key={tab}
              ref={trackRef}
              className={styles.track}
              data-tab={tab}
            >
              {rows.map((row, index) => {
                const { item } = row
                const typeLabel = simpleObservanceKindLabel(item.kind)
                const cardDates = buildObservanceCardDates(item)
                const interactive = Boolean(onActivate) && !isCompanionObservanceId(item.id)
                const highlighted = highlightedId === item.id
                const hasImage = row.mode === 'image'
                const summary = cardSummary(item, hasImage)
                const meaning = item.meaning?.trim()
                const summaryOpen = expandedSummaryId === item.id

                const cardClass = [
                  styles.card,
                  styles[`kind_${item.kind}`],
                  highlighted ? styles.cardActive : '',
                  summaryOpen ? styles.summaryOpen : '',
                  coarsePointer ? styles.cardTouchable : '',
                ]
                  .filter(Boolean)
                  .join(' ')

                const dock = (
                  <div className={styles.dock}>
                    <span className={styles.typeChip}>{typeLabel}</span>
                    <h4 className={styles.cardTitle}>{item.title}</h4>
                    <p className={styles.datePrimary}>{cardDates.primary}</p>
                    {cardDates.secondary ? (
                      <p className={styles.dateSecondary}>{cardDates.secondary}</p>
                    ) : null}
                    {interactive && item.gregorianAnchorIso ? (
                      <button
                        type="button"
                        className={styles.openDay}
                        onClick={(e) => onCardActivate(e, item)}
                      >
                        Open this day in the calendar
                      </button>
                    ) : null}
                    {coarsePointer ? (
                      <p className={styles.tapHint}>{summaryOpen ? 'Tap card to close details' : 'Tap card for details'}</p>
                    ) : null}
                  </div>
                )

                const reveal = (
                  <div className={styles.reveal} aria-hidden={!summaryOpen && !coarsePointer}>
                    <p className={styles.revealSummary}>{summary}</p>
                    {meaning && meaning !== summary ? (
                      <p className={styles.revealMeaning}>{meaning}</p>
                    ) : null}
                    {item.observance?.trim() ? (
                      <p className={styles.revealObservance}>{item.observance.trim()}</p>
                    ) : null}
                    {item.scheduling === 'movable' && item.ruleSummary ? (
                      <p className={styles.revealTranslit}>{item.ruleSummary}</p>
                    ) : null}
                    {item.transliterationTitle ? (
                      <p className={styles.revealTranslit}>{item.transliterationTitle}</p>
                    ) : null}
                  </div>
                )

                const visual =
                  row.mode === 'image' ? (
                    <div className={styles.visual}>
                      <CalendarImage
                        src={row.art.src}
                        fallbackSrc={fallbackThumb}
                        alt=""
                        className={styles.heroImg}
                      />
                      {dock}
                      {reveal}
                    </div>
                  ) : (
                    <div className={`${styles.visual} ${styles.visualPlaceholder}`}>
                      <div className={`${styles.heroPlaceholder} ${styles[`ph_${item.kind}`]}`} aria-hidden>
                        <span className={styles.phIcon}>✦</span>
                      </div>
                      {dock}
                      {reveal}
                    </div>
                  )

                return (
                  <div
                    key={item.id}
                    className={styles.slide}
                    style={{ '--enter-i': index } as React.CSSProperties}
                  >
                    <article
                      className={cardClass}
                      onClick={coarsePointer ? () => toggleSummaryTap(item.id) : undefined}
                      aria-expanded={coarsePointer ? summaryOpen : undefined}
                    >
                      {visual}
                    </article>
                  </div>
                )
              })}
            </div>
          </>
        )}
      </div>
    </section>
  )
}
