import { useEffect, useId, useMemo, useState } from 'react'
import { Link } from 'react-router-dom'
import type { ChurchDaySnapshot } from '../../lib/churchCalendar'
import {
  formatRelatedEntryLabels,
  type EotcCalendarDatasetRow,
} from '../../lib/eotcCalendar'
import { TabPanel } from '../ui/TabPanel'
import { useUiLabel } from '../../lib/i18n/uiLabels'
import {
  calendarImageManifest,
  resolveCommemorationImage,
  resolveEventImageById,
  resolveSelectedDayHeroImage,
} from '../../content/calendarImageManifest'
import { dayObservanceChips } from './churchDayChips'
import { CalendarImage } from './CalendarImage'
import styles from './ChurchDayDetailBody.module.css'

type Props = {
  snapshot: ChurchDaySnapshot
  /** `/calendar` mobile: cap hero size, wrap tabs, defer decorative image below reading. */
  calendarPageLayout?: boolean
  /** When set (calendar page), overview tab shows ordered EOTC JSON rows instead of the generic liturgical guide block. */
  eotcOrderedRows?: EotcCalendarDatasetRow[]
}

const ANCHOR = calendarImageManifest.anchors.todayInChurch

export function ChurchDayDetailBody({
  snapshot,
  calendarPageLayout = false,
  eotcOrderedRows,
}: Props) {
  const t = useUiLabel()
  const tabShellId = useId()
  const nativeSelectId = `${tabShellId}-cal-select`
  const [tab, setTab] = useState('overview')
  const [isLiturgicalGuideExpanded, setIsLiturgicalGuideExpanded] = useState(false)
  const chips = useMemo(() => dayObservanceChips(snapshot), [snapshot])

  useEffect(() => {
    setTab('overview')
    setIsLiturgicalGuideExpanded(false)
  }, [snapshot.gregorian.labelLong])

  const tabs = useMemo(() => {
    const showEotcCalendar = Boolean(
      calendarPageLayout && eotcOrderedRows && eotcOrderedRows.length > 0,
    )
    const eotcRows = eotcOrderedRows ?? []
    const { commemoration, season, fasting } = snapshot
    const hero = resolveSelectedDayHeroImage(snapshot)
    const heroFallback = resolveCommemorationImage(
      commemoration.title,
      commemoration.transliterationTitle,
      commemoration.catalogEventId,
    )
    const lead =
      commemoration.shortDescription?.trim() || commemoration.whyTodayShort

    const observanceBody = (
      <div className={styles.stack}>
        <p className={styles.p}>{commemoration.observance}</p>
        <div className={styles.supportRow}>
          <div className={styles.supportCard}>
            <figure className={styles.supportFig}>
              <CalendarImage
                src={calendarImageManifest.support.upcomingHolyDays}
                fallbackSrc={ANCHOR}
                className={styles.supportImg}
              />
            </figure>
            <div className={styles.supportBody}>
              <p className={styles.supportLabel}>{t('calendarInParish')}</p>
              <p className={styles.supportText}>{season.summary}</p>
            </div>
          </div>
          <div className={styles.supportCard}>
            <figure className={styles.supportFig}>
              <CalendarImage
                src={calendarImageManifest.remembrance.ethiopianSaints}
                fallbackSrc={ANCHOR}
                className={styles.supportImg}
              />
            </figure>
            <div className={styles.supportBody}>
              <p className={styles.supportLabel}>{t('calendarAtHome')}</p>
              <p className={styles.supportText}>
                {fasting.weeklyFast
                  ? `${fasting.weeklyFast}. `
                  : 'No standing Wednesday/Friday fast on this weekday. '}
                {fasting.seasonalFast ?? ''}
              </p>
            </div>
          </div>
        </div>
        <p className={styles.pMuted}>
          <strong>Season:</strong> {season.summary} — {season.shortDescription}
        </p>
      </div>
    )

    const practiceBody = (
      <div className={styles.stack}>
        <p className={styles.pMuted}>{t('calendarDayPrayerLead')}</p>
        <div className={styles.split}>
          <Link className={styles.linkCard} to="/prayers/zeweter">
            <figure className={styles.linkCardFigure}>
              <CalendarImage
                src={calendarImageManifest.support.feastDayPreparation}
                fallbackSrc={ANCHOR}
                className={styles.linkCardImg}
              />
            </figure>
            <p className={styles.linkCardK}>{t('read')}</p>
            <p className={styles.linkCardT}>Daily prayers — Zeweter Tselot</p>
          </Link>
          <Link className={styles.linkCard} to="/prayers/mezmure-dawit">
            <figure className={styles.linkCardFigure}>
              <CalendarImage
                src={calendarImageManifest.support.joyfulFeastSeason}
                fallbackSrc={ANCHOR}
                className={styles.linkCardImg}
              />
            </figure>
            <p className={styles.linkCardK}>{t('read')}</p>
            <p className={styles.linkCardT}>Mezmure Dawit (Psalms)</p>
          </Link>
          <Link className={styles.linkCard} to="/practice">
            <figure className={styles.linkCardFigure}>
              <CalendarImage
                src={calendarImageManifest.support.sacredCalendarContinuity}
                fallbackSrc={ANCHOR}
                className={styles.linkCardImg}
              />
            </figure>
            <p className={styles.linkCardK}>{t('practiceVerb')}</p>
            <p className={styles.linkCardT}>Chants and faithful rehearsal</p>
          </Link>
        </div>
        <p className={styles.pMuted}>{t('calendarDayChantLead')}</p>
      </div>
    )

    const notesBody = (
      <div className={styles.stack}>
        <p className={styles.notesLead}>
          A pastoral line from the snapshot — confirm every fast and feast with your parish calendar and spiritual father.
        </p>
        <p className={styles.p}>{commemoration.whyTodayLong}</p>
      </div>
    )

    const primaryEotcExtended =
      showEotcCalendar && eotcRows[0]?.entry.content.extended?.trim()

    const meaningBody = primaryEotcExtended ? (
      <div className={styles.stack}>
        <p className={styles.p}>{primaryEotcExtended}</p>
        {commemoration.meaning.trim() ? (
          <details className={styles.moreBlock}>
            <summary>{t('calendarMeaningMoreFromGuide')}</summary>
            <div className={styles.moreInner}>{commemoration.meaning}</div>
          </details>
        ) : null}
      </div>
    ) : commemoration.meaning.trim() ? (
      <p className={styles.p}>{commemoration.meaning}</p>
    ) : (
      <p className={styles.pMuted}>{t('prayerTabSummaryEmpty')}</p>
    )

    return [
      {
        id: 'overview',
        label: t('calendarDayTabOverview'),
        content: (
          <div
            className={`${styles.stack} ${styles.overviewStack} ${calendarPageLayout ? styles.overviewStackCalendarPage : ''}`.trim()}
          >
            <figure className={styles.heroWrap}>
              <CalendarImage
                src={hero}
                fallbackSrc={heroFallback}
                className={styles.hero}
                loading="eager"
                fetchPriority="high"
                sizes="(max-width: 719px) 100vw, min(42rem, 90vw)"
              />
            </figure>
            <div className={styles.chipRow}>
              {chips.map((c) => (
                <span key={c} className={styles.chip}>
                  {c}
                </span>
              ))}
            </div>

            {showEotcCalendar ? (
              <div className={styles.eotcOverviewSecondary}>
                <p className={styles.eotcOverviewLead}>{t('calendarOverviewEotcTabLead')}</p>
                <details className={styles.eotcRefDetails}>
                  <summary>{t('calendarOverviewEotcRefSummary')}</summary>
                  <ul className={styles.eotcRefList}>
                    {eotcRows.map((row) => {
                      const e = row.entry
                      const title = e.englishTitle?.trim() || e.title
                      const badge = e.display.calendarBadge?.trim()
                      const cat =
                        e.category.secondary.length > 0
                          ? `${e.category.primary} · ${e.category.secondary.join(' · ')}`
                          : e.category.primary
                      return (
                        <li key={e.id} className={styles.eotcRefItem}>
                          <div className={styles.eotcRefItemTop}>
                            {badge ? <span className={styles.eotcRefBadge}>{badge}</span> : null}
                            <span className={styles.eotcRefTitle}>{title}</span>
                          </div>
                          <p className={styles.eotcRefMeta}>
                            {cat} · {e.observance.fastStatus} · {e.observance.liturgicalTone}
                          </p>
                          {e.content.relatedEntries.length > 0 ? (
                            <p className={styles.eotcRefRelated}>
                              <span className={styles.eotcMetaLabel}>Related</span>
                              {formatRelatedEntryLabels(e.content.relatedEntries)}
                            </p>
                          ) : null}
                        </li>
                      )
                    })}
                  </ul>
                </details>
                {snapshot.movableOnDay.length > 0 ? (
                  <details className={styles.movablePack}>
                    <summary>{t('calendarMovableOnDaySummary')}</summary>
                    <div className={styles.movableInner}>
                      {snapshot.movableOnDay.map((m) => (
                        <article key={m.id} className={styles.movableCard}>
                          <figure className={styles.movableFig} aria-hidden>
                            <CalendarImage
                              src={resolveEventImageById(m.catalogEventId) ?? heroFallback}
                              fallbackSrc={heroFallback}
                              className={styles.movableImg}
                            />
                          </figure>
                          <div className={styles.movableBody}>
                            <h4 className={styles.movableTitle}>{m.title}</h4>
                            {m.transliterationTitle ? (
                              <p className={styles.movableTranslit}>{m.transliterationTitle}</p>
                            ) : null}
                            <p className={styles.movableLead}>{m.shortDescription}</p>
                            {m.ruleSummary ? (
                              <p className={styles.movableMeta}>
                                <span className={styles.movableMetaK}>
                                  {t('calendarMovableRuleLabel')}
                                </span>{' '}
                                {m.ruleSummary}
                              </p>
                            ) : null}
                            {m.relatedPrayerHint ? (
                              <p className={styles.movableMeta}>
                                <span className={styles.movableMetaK}>
                                  {t('calendarMovablePrayerLabel')}
                                </span>{' '}
                                {m.relatedPrayerHint}
                              </p>
                            ) : null}
                            {m.relatedChantHint ? (
                              <p className={styles.movableMeta}>
                                <span className={styles.movableMetaK}>
                                  {t('calendarMovableChantLabel')}
                                </span>{' '}
                                {m.relatedChantHint}
                              </p>
                            ) : null}
                          </div>
                        </article>
                      ))}
                    </div>
                  </details>
                ) : null}
              </div>
            ) : (
              <>
                {/* Liturgical Guide Header */}
                <div className={styles.liturgicalGuideHeader}>
                  <div className={styles.dateCluster}>
                    <h3 className={styles.observanceTitle}>{commemoration.title}</h3>
                    {commemoration.transliterationTitle && (
                      <p className={styles.observanceSubtitle}>
                        {commemoration.transliterationTitle}
                      </p>
                    )}
                  </div>
                  <div className={styles.dateLabels}>
                    <p className={styles.gregorianDate}>{snapshot.gregorian.labelLong}</p>
                    <p className={styles.ethiopianDate}>{snapshot.ethiopian.labelLong}</p>
                  </div>
                </div>

                {/* Daily Liturgical Guide */}
                <div className={styles.dailyGuideSection}>
                  <div className={styles.dailyGuideHeader}>Today's Liturgical Guide</div>
                  <div className={styles.dailyGuideContent}>
                    {commemoration.summary && (
                      <div className={styles.educationalSummary}>
                        <h4 className={styles.summaryTitle}>What this day represents</h4>
                        <p className={styles.summaryText}>{commemoration.summary}</p>
                      </div>
                    )}

                    {isLiturgicalGuideExpanded && (
                      <>
                        {commemoration.significance?.trim() && (
                          <div className={styles.educationalSummary}>
                            <h4 className={styles.summaryTitle}>Why it matters</h4>
                            <p className={styles.summaryText}>{commemoration.significance}</p>
                          </div>
                        )}

                        {commemoration.practicalGuidance?.trim() && (
                          <div className={styles.educationalSummary}>
                            <h4 className={styles.summaryTitle}>How to observe</h4>
                            <p className={styles.summaryText}>
                              {commemoration.practicalGuidance}
                            </p>
                          </div>
                        )}

                        {commemoration.prayAndChant?.trim() && (
                          <div className={styles.educationalSummary}>
                            <h4 className={styles.summaryTitle}>Prayer & Chant Guidance</h4>
                            <p className={styles.summaryText}>{commemoration.prayAndChant}</p>
                          </div>
                        )}

                        {commemoration.notes?.trim() && (
                          <div className={styles.educationalSummary}>
                            <h4 className={styles.summaryTitle}>Notes</h4>
                            <p className={styles.summaryText}>{commemoration.notes}</p>
                          </div>
                        )}
                      </>
                    )}

                    {(commemoration.significance?.trim() ||
                      commemoration.practicalGuidance?.trim() ||
                      commemoration.prayAndChant?.trim() ||
                      commemoration.notes?.trim()) && (
                      <button
                        className={styles.seeMoreButton}
                        onClick={() => setIsLiturgicalGuideExpanded(!isLiturgicalGuideExpanded)}
                        type="button"
                      >
                        {isLiturgicalGuideExpanded
                          ? 'See less'
                          : 'See more liturgical guidance'}
                      </button>
                    )}
                  </div>
                </div>

                {snapshot.movableOnDay.length > 0 ? (
                  <details className={styles.movablePack}>
                    <summary>{t('calendarMovableOnDaySummary')}</summary>
                    <div className={styles.movableInner}>
                      {snapshot.movableOnDay.map((m) => (
                        <article key={m.id} className={styles.movableCard}>
                          <figure className={styles.movableFig} aria-hidden>
                            <CalendarImage
                              src={resolveEventImageById(m.catalogEventId) ?? heroFallback}
                              fallbackSrc={heroFallback}
                              className={styles.movableImg}
                            />
                          </figure>
                          <div className={styles.movableBody}>
                            <h4 className={styles.movableTitle}>{m.title}</h4>
                            {m.transliterationTitle ? (
                              <p className={styles.movableTranslit}>{m.transliterationTitle}</p>
                            ) : null}
                            <p className={styles.movableLead}>{m.shortDescription}</p>
                            {m.ruleSummary ? (
                              <p className={styles.movableMeta}>
                                <span className={styles.movableMetaK}>
                                  {t('calendarMovableRuleLabel')}
                                </span>{' '}
                                {m.ruleSummary}
                              </p>
                            ) : null}
                            {m.relatedPrayerHint ? (
                              <p className={styles.movableMeta}>
                                <span className={styles.movableMetaK}>
                                  {t('calendarMovablePrayerLabel')}
                                </span>{' '}
                                {m.relatedPrayerHint}
                              </p>
                            ) : null}
                            {m.relatedChantHint ? (
                              <p className={styles.movableMeta}>
                                <span className={styles.movableMetaK}>
                                  {t('calendarMovableChantLabel')}
                                </span>{' '}
                                {m.relatedChantHint}
                              </p>
                            ) : null}
                          </div>
                        </article>
                      ))}
                    </div>
                  </details>
                ) : null}
              </>
            )}
            {commemoration.subtitle ? (
              <p className={styles.subtitle}>{commemoration.subtitle}</p>
            ) : null}
            {!showEotcCalendar ? (
              <>
                <p className={styles.p}>{lead}</p>
                {commemoration.meaning.trim() ? (
                  <details className={styles.moreBlock}>
                    <summary>{t('calendarWhyMatters')}</summary>
                    <div className={styles.moreInner}>{commemoration.meaning}</div>
                  </details>
                ) : null}
              </>
            ) : null}
          </div>
        ),
      },
      {
        id: 'meaning',
        label: t('calendarDayTabMeaning'),
        content: meaningBody,
      },
      {
        id: 'observance',
        label: t('calendarDayTabObservance'),
        content: observanceBody,
      },
      {
        id: 'practice',
        label: t('calendarDayTabPractice'),
        content: practiceBody,
      },
      {
        id: 'notes',
        label: t('calendarDayTabNotes'),
        content: notesBody,
      },
    ]
  }, [
    snapshot,
    t,
    chips,
    calendarPageLayout,
    eotcOrderedRows,
    isLiturgicalGuideExpanded,
  ])

  return (
    <div
      className={`${styles.wrap} ${calendarPageLayout ? styles.wrapCalendarPageMobile : ''}`.trim()}
      key={snapshot.gregorian.labelLong}
    >
      <label htmlFor={nativeSelectId} className={styles.srOnly}>
        {t('calendarDayTabsAria')}
      </label>
      <select
        id={nativeSelectId}
        className={styles.mobileSelect}
        value={tab}
        onChange={(e) => setTab(e.target.value)}
        aria-controls={`${tabShellId}-panel`}
      >
        {tabs.map((x) => (
          <option key={x.id} value={x.id}>
            {x.label}
          </option>
        ))}
      </select>
      <TabPanel
        className={styles.tabRoot}
        variant="compact"
        compactWrap={calendarPageLayout}
        tablistAriaLabel={t('calendarDayTabsAria')}
        ariaIdPrefix={tabShellId}
        tabs={tabs}
        initialId="overview"
        selectedId={tab}
        onSelectedIdChange={setTab}
      />
    </div>
  )
}
