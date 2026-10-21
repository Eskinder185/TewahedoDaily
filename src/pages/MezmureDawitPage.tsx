import { useEffect, useId, useLayoutEffect, useMemo, useState } from 'react'
import { Link, useSearchParams } from 'react-router-dom'
import { PageSection } from '../components/ui/PageSection'
import { PageLoadingFallback } from '../components/ui/PageLoadingFallback'
import { SanctuaryHero } from '../components/prayers/SanctuaryHero'
import { PrayerReader } from '../components/prayers/PrayerReader'
import type { PrayerLang } from '../components/prayers/prayerLang'
import { loadPrayerCollection } from '../lib/prayers/prayerSupabase'
import type { CollectionPrayer } from '../lib/prayers/prayerCollections'
import { getPsalmNumber } from '../lib/prayers/psalmNumber'
import {
  parseRequestedPsalmNumber,
  resolvePsalmReading,
  retainedPsalmReading,
  type PsalmReading,
} from '../lib/prayers/psalmReading'
import { useReaderLanguage } from '../lib/prayers/useReaderLanguage'
import { prayerCollectionPath } from '../lib/prayers/prayerSlug'
import { DAILY_COLLECTION_SLUGS } from '../lib/prayers/dailyPrayerRhythmSchedule'
import { useUiLabel } from '../lib/i18n/uiLabels'
import { isMobileViewport, scrollTargetIntoView } from '../lib/scrollUtils'
import { useReadingProgressTracker } from '../lib/userContent/useReadingProgressTracker'
import styles from './MezmureDawitPage.module.css'

const JUMP_TARGETS = [1, 25, 50, 75, 100, 125, 150]

type PsalmRow = { number: number; prayer: CollectionPrayer }

function psalmNumberOf(prayer: CollectionPrayer): number {
  return prayer.psalmNumber ?? getPsalmNumber(prayer) ?? prayer.order
}

function parseBound(raw: string | null): number | null {
  if (!raw) return null
  const n = Number.parseInt(raw, 10)
  if (!Number.isFinite(n) || n < 1 || n > 150) return null
  return n
}

function fill(template: string, values: Record<string, string | number>) {
  return template.replace(/\{(\w+)\}/g, (match, key: string) =>
    values[key] == null ? match : String(values[key]),
  )
}

function isPrayerLang(value: string): value is PrayerLang {
  return value === 'amharic' || value === 'geez' || value === 'english'
}

export function MezmureDawitPage() {
  const t = useUiLabel()
  const readerTabsUid = useId()
  const [params, setParams] = useSearchParams()
  const fromParam = parseBound(params.get('from'))
  const toParam = parseBound(params.get('to'))
  const rangeActive =
    fromParam != null && toParam != null && fromParam <= toParam
      ? { from: fromParam, to: toParam }
      : null
  // `n` = selected Psalm number (URL). `q` = independent search box — never sync them.
  // Previously wiring `n` into `q` filtered the index to every number containing that digit
  // (selecting Psalm 1 showed 1, 10, 11, 12… instead of 1, 2, 3…).
  const selectedRaw = params.get('n') ?? ''
  const [q, setQ] = useState('')
  // Mobile: prefer the reader when a psalm is already selected (TD-07).
  const [showPsalmIndexOnMobile, setShowPsalmIndexOnMobile] = useState(() => !params.get('n'))
  const [prayers, setPrayers] = useState<CollectionPrayer[] | null>(null)
  const [error, setError] = useState(false)
  const [reloadTick, setReloadTick] = useState(0)
  const [previousNumber, setPreviousNumber] = useState<number | null>(null)

  const selectedPsalm = parseRequestedPsalmNumber(selectedRaw)
  const psalmLabel = (number: number) => fill(t('prayerMezmurPsalmLabel'), { number })

  useReadingProgressTracker({
    contentType: 'psalm',
    contentSlug: selectedPsalm != null ? `psalm-${selectedPsalm}` : 'mezmure-dawit',
    collectionSlug: DAILY_COLLECTION_SLUGS.mezmureDawit,
    title: selectedPsalm != null ? psalmLabel(selectedPsalm) : t('prayerMezmurTitle'),
    route:
      selectedPsalm != null
        ? `${prayerCollectionPath(DAILY_COLLECTION_SLUGS.mezmureDawit)}?n=${selectedPsalm}`
        : prayerCollectionPath(DAILY_COLLECTION_SLUGS.mezmureDawit),
  })

  useEffect(() => {
    let active = true
    setPrayers(null)
    setError(false)
    void loadPrayerCollection('mezmure-dawit')
      .then((bundle) => {
        if (!active) return
        setPrayers(bundle?.prayers ?? [])
      })
      .catch((cause) => {
        if (!active) return
        if (import.meta.env.DEV) console.error('[mezmure-dawit]', cause)
        setError(true)
        setPrayers([])
      })
    return () => {
      active = false
    }
  }, [reloadTick])

  const allSorted = useMemo(() => prayers ?? [], [prayers])

  const sorted = useMemo(() => {
    if (!rangeActive) return allSorted
    return allSorted.filter((p) => {
      const n = psalmNumberOf(p)
      return n >= rangeActive.from && n <= rangeActive.to
    })
  }, [allSorted, rangeActive])

  const rows = useMemo<PsalmRow[]>(
    () => sorted.map((prayer) => ({ number: psalmNumberOf(prayer), prayer })),
    [sorted],
  )

  const previous = useMemo(
    () => rows.find((row) => row.number === previousNumber) ?? null,
    [previousNumber, rows],
  )

  const ready = prayers !== null
  const urlReading = useMemo(
    () => (ready ? resolvePsalmReading(rows, selectedRaw, previous) : null),
    [previous, ready, rows, selectedRaw],
  )

  const searchNumber = parseRequestedPsalmNumber(q)
  const searchMissing =
    ready && searchNumber != null && !rows.some((row) => row.number === searchNumber)

  const visible: PsalmReading<PsalmRow> | null = useMemo(() => {
    if (!urlReading) return null
    if (!searchMissing || searchNumber == null) return urlReading
    return resolvePsalmReading(rows, String(searchNumber), retainedPsalmReading(urlReading))
  }, [rows, searchMissing, searchNumber, urlReading])

  useEffect(() => {
    if (!urlReading || urlReading.status !== 'match' || !urlReading.display) return
    setPreviousNumber(urlReading.display.number)
  }, [urlReading])

  useEffect(() => {
    // Normalize a matched number only. Never rewrite a missing request to Psalm 1.
    if (!ready || !visible || visible.status !== 'match' || searchMissing) return
    const display = visible.display
    if (!display) return
    const nextN = String(display.number)
    if (nextN === selectedRaw) return
    const next = new URLSearchParams(params)
    next.set('n', nextN)
    if (rangeActive) {
      next.set('from', String(rangeActive.from))
      next.set('to', String(rangeActive.to))
    }
    setParams(next, { replace: true })
  }, [params, rangeActive, ready, searchMissing, selectedRaw, setParams, visible])

  const active = visible?.display?.prayer ?? null
  const activeNumber = visible?.display?.number ?? 0
  const showPrevious = visible?.displayRole === 'previous'
  const missingNumber = visible?.status === 'missing' ? visible.missingNumber : null
  const { readerLanguage, setReaderLanguage } = useReaderLanguage(active?.text ?? null)
  const titlePrimary =
    active?.titles?.amharic?.trim() ||
    active?.title?.trim() ||
    (activeNumber ? psalmLabel(activeNumber) : '')

  useLayoutEffect(() => {
    if (!active) return
    if (isMobileViewport() && showPsalmIndexOnMobile) return
    scrollTargetIntoView('#mezmur-reader', { smooth: false, flush: true })
    requestAnimationFrame(() => {
      if (isMobileViewport() && !showPsalmIndexOnMobile) {
        document.getElementById('mezmur-reader')?.focus({ preventScroll: true })
      }
    })
  }, [active?.id, showPsalmIndexOnMobile])

  const filtered = useMemo(() => {
    const needle = q.trim().toLowerCase()
    if (!needle) return rows
    const exactNumber = parseRequestedPsalmNumber(needle)
    if (exactNumber != null) return rows.filter((row) => row.number === exactNumber)

    return rows.filter((row) => {
      const p = row.prayer
      const sn = String(row.number)
      const blob = [
        p.title,
        p.transliterationTitle,
        p.titles?.amharic,
        p.titles?.geez,
        p.titles?.english,
        p.slug,
      ]
        .filter(Boolean)
        .join(' ')
        .toLowerCase()
      return sn === needle || sn.startsWith(needle) || blob.includes(needle)
    })
  }, [q, rows])

  const writeParams = (n: number) => {
    const next = new URLSearchParams()
    next.set('n', String(n))
    if (rangeActive) {
      next.set('from', String(rangeActive.from))
      next.set('to', String(rangeActive.to))
    }
    setParams(next)
  }

  const displayIndex = visible?.display
    ? rows.findIndex((row) => row.number === visible.display?.number)
    : -1

  const go = (delta: number) => {
    if (displayIndex < 0) return
    const next = rows[displayIndex + delta]
    if (!next) return
    setPreviousNumber(next.number)
    writeParams(next.number)
    setQ('')
    if (isMobileViewport()) setShowPsalmIndexOnMobile(false)
  }

  const handlePsalmSelect = (row: PsalmRow) => {
    setPreviousNumber(row.number)
    writeParams(row.number)
    setQ('')
    if (isMobileViewport()) setShowPsalmIndexOnMobile(false)
  }

  const clearRange = () => {
    const next = new URLSearchParams()
    if (visible?.display && visible.displayRole !== 'previous') {
      next.set('n', String(visible.display.number))
    }
    setParams(next)
  }

  if (prayers === null && !error) return <PageLoadingFallback />

  if (error) {
    return (
      <PageSection variant="tint">
        <p>{t('prayerMezmurLoadError')}</p>
        <button type="button" onClick={() => setReloadTick((n) => n + 1)}>
          {t('prayerMezmurTryAgain')}
        </button>
      </PageSection>
    )
  }

  const readingMode =
    isMobileViewport() && !showPsalmIndexOnMobile ? styles.readingModeSection : ''

  const jumpTargets = JUMP_TARGETS.filter((n) => rows.some((row) => row.number === n))
  const missingMessage =
    missingNumber != null ? fill(t('prayerMezmurUnavailable'), { number: missingNumber }) : ''

  return (
    <PageSection variant="tint" className={readingMode}>
      <nav className={styles.nav} aria-label={t('prayerMezmurBreadcrumb')}>
        <Link className={styles.crumb} to="/pray">
          {t('navPrayers')}
        </Link>
        <span className={styles.crumbSep} aria-hidden>
          /
        </span>
        <span className={styles.crumbCurrent}>{t('prayerMezmurTitle')}</span>
      </nav>

      <div className={styles.preReader}>
        <SanctuaryHero eyebrow={t('prayerMezmurEyebrow')} title={t('prayerMezmurTitle')}>
          <p>{t('prayerMezmurIntro')}</p>
        </SanctuaryHero>

        {rangeActive ? (
          <div className={styles.rangeBanner} role="status">
            <p>
              {fill(t('prayerMezmurTodayRange'), {
                from: rangeActive.from,
                to: rangeActive.to,
              })}
            </p>
            <div className={styles.rangeActions}>
              <button type="button" className={styles.rangeClear} onClick={clearRange}>
                {t('prayerMezmurViewFull')}
              </button>
              <Link
                className={styles.rangeClear}
                to={prayerCollectionPath(DAILY_COLLECTION_SLUGS.mezmureDawit)}
              >
                {t('prayerMezmurOpenCollection')}
              </Link>
            </div>
          </div>
        ) : null}

        <div className={styles.jumpRow}>
          {jumpTargets.map((n) => (
            <button
              key={n}
              type="button"
              className={styles.jumpChip}
              onClick={() => {
                const row = rows.find((item) => item.number === n)
                if (row) handlePsalmSelect(row)
              }}
            >
              {psalmLabel(n)}
            </button>
          ))}
        </div>
      </div>

      <div className={`${styles.layout} ${!showPsalmIndexOnMobile ? styles.layoutReaderOnly : ''}`}>
        <aside
          className={`${styles.aside} ${!showPsalmIndexOnMobile ? styles.asideHidden : ''}`}
          id="mezmur-index"
        >
          <label className={styles.searchLabel} htmlFor="psalm-search">
            {t('prayerMezmurSearch')}
          </label>
          <input
            id="psalm-search"
            className={styles.search}
            type="search"
            inputMode="numeric"
            value={q}
            onChange={(e) => setQ(e.target.value)}
            placeholder={rangeActive ? `${rangeActive.from}–${rangeActive.to}` : '1–150'}
            autoComplete="off"
          />

          <p className={styles.indexLabel}>
            {rangeActive
              ? fill(t('prayerMezmurRangeLabel'), { from: rangeActive.from, to: rangeActive.to })
              : t('prayerMezmurIndex')}
          </p>
          {filtered.length === 0 ? (
            <p className={styles.indexEmpty} role="status">
              {missingMessage || t('prayerMezmurNoMatch')}
            </p>
          ) : (
            <ul className={styles.index}>
              {filtered.map((row) => {
                const on = visible?.displayRole === 'match' && row.number === activeNumber
                return (
                  <li key={row.prayer.id}>
                    <button
                      type="button"
                      className={`${styles.indexBtn} ${on ? styles.indexBtnOn : ''}`}
                      aria-current={on ? 'true' : undefined}
                      onClick={() => handlePsalmSelect(row)}
                    >
                      <span className={styles.indexNum}>{row.number}</span>
                      <span className={styles.indexTitle}>
                        <span className={styles.indexPsalm}>{psalmLabel(row.number)}</span>
                        {row.prayer.titles?.amharic || row.prayer.title ? (
                          <span lang="am">{row.prayer.titles?.amharic || row.prayer.title}</span>
                        ) : null}
                      </span>
                    </button>
                  </li>
                )
              })}
            </ul>
          )}
        </aside>

        <article
          className={`${styles.reader} ${!showPsalmIndexOnMobile ? styles.readerFullMobile : ''}`}
          id="mezmur-reader"
          tabIndex={-1}
        >
          {!showPsalmIndexOnMobile ? (
            <button
              className={styles.backButton}
              onClick={() => setShowPsalmIndexOnMobile(true)}
              type="button"
            >
              ← {t('prayerMezmurBack')}
            </button>
          ) : null}
          <div className={styles.sticky}>
            <div className={styles.stickyInner}>
              <div className={styles.stickyTitles}>
                {missingMessage ? (
                  <p className={`${styles.rangeBanner} ${styles.missingNotice}`} role="status">
                    {missingMessage}
                  </p>
                ) : null}
                {showPrevious ? (
                  <p className={styles.previousReading}>{t('prayerMezmurPreviousReading')}</p>
                ) : null}
                {active ? (
                  <>
                    <p className={styles.psalmNo}>{psalmLabel(activeNumber)}</p>
                    <h2 className={styles.h2} lang="am">
                      {titlePrimary}
                    </h2>
                  </>
                ) : null}
              </div>
              <div className={styles.stickyControls}>
                <div className={styles.navRow}>
                  <button
                    type="button"
                    className={styles.navBtn}
                    onClick={() => go(-1)}
                    disabled={displayIndex <= 0}
                  >
                    {t('prayerMezmurPrev')}
                  </button>
                  <button
                    type="button"
                    className={styles.navBtn}
                    onClick={() => go(1)}
                    disabled={displayIndex < 0 || displayIndex >= rows.length - 1}
                  >
                    {t('prayerMezmurNext')}
                  </button>
                </div>
              </div>
            </div>

            {active ? (
              <div className={styles.langStripe}>
                <PrayerReader
                  text={active.text}
                  titles={active.titles}
                  split="tablist"
                  selectedId={readerLanguage}
                  onTabChange={(id) => {
                    if (isPrayerLang(id)) setReaderLanguage(id)
                  }}
                  ariaIdPrefix={readerTabsUid}
                />
              </div>
            ) : null}
          </div>

          {active ? (
            <div className={styles.readerTabs} key={active.id}>
              <div
                id="mezmur-reading-start"
                tabIndex={-1}
                className={styles.readingLandmark}
                aria-label={
                  showPrevious
                    ? `${t('prayerMezmurPreviousReading')}. ${titlePrimary || psalmLabel(activeNumber)}`
                    : titlePrimary || psalmLabel(activeNumber)
                }
              />
              <PrayerReader
                text={active.text}
                titles={active.titles}
                showTitle
                split="panel"
                selectedId={readerLanguage}
                onTabChange={(id) => {
                  if (isPrayerLang(id)) setReaderLanguage(id)
                }}
                ariaIdPrefix={readerTabsUid}
              />
            </div>
          ) : rows.length === 0 ? (
            <p role="status">{t('prayerMezmurRangeEmpty')}</p>
          ) : missingMessage ? null : null}
        </article>
      </div>
    </PageSection>
  )
}
