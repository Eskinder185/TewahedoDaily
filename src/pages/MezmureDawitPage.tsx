import { useEffect, useId, useLayoutEffect, useMemo, useState } from 'react'
import { Link, useSearchParams } from 'react-router-dom'
import { PageSection } from '../components/ui/PageSection'
import { PageLoadingFallback } from '../components/ui/PageLoadingFallback'
import { SanctuaryHero } from '../components/prayers/SanctuaryHero'
import { PrayerReader } from '../components/prayers/PrayerReader'
import { loadPrayerCollection } from '../lib/prayers/prayerSupabase'
import type { CollectionPrayer } from '../lib/prayers/prayerCollections'
import { formatPsalmLabel, getPsalmNumber } from '../lib/prayers/psalmNumber'
import { prayerCollectionPath } from '../lib/prayers/prayerSlug'
import { DAILY_COLLECTION_SLUGS } from '../lib/prayers/dailyPrayerRhythmSchedule'
import { useUiLabel } from '../lib/i18n/uiLabels'
import { isMobileViewport, scrollTargetIntoView } from '../lib/scrollUtils'
import styles from './MezmureDawitPage.module.css'

const JUMP_TARGETS = [1, 25, 50, 75, 100, 125, 150]

function psalmNumberOf(prayer: CollectionPrayer): number {
  return (
    prayer.psalmNumber ??
    getPsalmNumber(prayer) ??
    prayer.order
  )
}

function parseBound(raw: string | null): number | null {
  if (!raw) return null
  const n = Number.parseInt(raw, 10)
  if (!Number.isFinite(n) || n < 1 || n > 150) return null
  return n
}

export function MezmureDawitPage() {
  const t = useUiLabel()
  const readerTabsUid = useId()
  const [readerTab, setReaderTab] = useState('amharic')
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
  const [showPsalmIndexOnMobile, setShowPsalmIndexOnMobile] = useState(true)
  const [prayers, setPrayers] = useState<CollectionPrayer[] | null>(null)
  const [error, setError] = useState<string>()
  const [reloadTick, setReloadTick] = useState(0)

  useEffect(() => {
    let active = true
    setPrayers(null)
    setError(undefined)
    void loadPrayerCollection('mezmure-dawit')
      .then((bundle) => {
        if (!active) return
        setPrayers(bundle?.prayers ?? [])
      })
      .catch((cause) => {
        if (!active) return
        if (import.meta.env.DEV) console.error('[mezmure-dawit]', cause)
        setError("We couldn't load Mezmure Dawit.")
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

  const indexFromParam = useMemo(() => {
    const n = Number.parseInt(selectedRaw, 10)
    if (!Number.isFinite(n)) return 0
    const i = sorted.findIndex((p) => psalmNumberOf(p) === n)
    return i >= 0 ? i : 0
  }, [selectedRaw, sorted])

  const [index, setIndex] = useState(indexFromParam)

  useEffect(() => {
    setIndex(indexFromParam)
  }, [indexFromParam])

  useEffect(() => {
    const p = sorted[index]
    if (!p) return
    const nextN = String(psalmNumberOf(p))
    if (nextN === selectedRaw) return
    const next = new URLSearchParams(params)
    next.set('n', nextN)
    if (rangeActive) {
      next.set('from', String(rangeActive.from))
      next.set('to', String(rangeActive.to))
    }
    setParams(next, { replace: true })
  }, [index, params, selectedRaw, rangeActive, setParams, sorted])

  const active = sorted[index] ?? sorted[0]
  const activeNumber = active ? psalmNumberOf(active) : 0
  const titlePrimary =
    active?.titles?.amharic?.trim() ||
    active?.title?.trim() ||
    (activeNumber ? formatPsalmLabel(activeNumber) : '')

  useEffect(() => {
    const firstAvailable =
      (active?.text.amharic.trim() && 'amharic') ||
      (active?.text.geez.trim() && 'geez') ||
      (active?.text.english.trim() && 'english') ||
      'amharic'
    setReaderTab(firstAvailable)
  }, [active?.id, active?.text.amharic, active?.text.geez, active?.text.english])

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
    if (!needle) return sorted
    const exactNumber = Number.parseInt(needle, 10)
    const wantsExactNumber =
      Number.isFinite(exactNumber) && String(exactNumber) === needle && exactNumber >= 1 && exactNumber <= 150

    return sorted.filter((p) => {
      const number = psalmNumberOf(p)
      if (wantsExactNumber) return number === exactNumber
      const sn = String(number)
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
  }, [q, sorted])

  const writeParams = (n: number) => {
    const next = new URLSearchParams()
    next.set('n', String(n))
    if (rangeActive) {
      next.set('from', String(rangeActive.from))
      next.set('to', String(rangeActive.to))
    }
    setParams(next)
  }

  const go = (i: number) => {
    const nextIndex = Math.max(0, Math.min(sorted.length - 1, i))
    setIndex(nextIndex)
    const p = sorted[nextIndex]
    if (p) {
      writeParams(psalmNumberOf(p))
      if (isMobileViewport()) setShowPsalmIndexOnMobile(false)
    }
  }

  const handlePsalmSelect = (prayer: CollectionPrayer) => {
    const i = sorted.findIndex((x) => x.id === prayer.id)
    if (i >= 0) {
      go(i)
      // Keep the search box independent of selection so the full numeric index stays visible.
      setQ('')
    }
  }

  const clearRange = () => {
    const next = new URLSearchParams()
    if (active) next.set('n', String(psalmNumberOf(active)))
    setParams(next)
  }

  if (prayers === null && !error) return <PageLoadingFallback />

  if (error) {
    return (
      <PageSection variant="tint">
        <p>{error}</p>
        <button type="button" onClick={() => setReloadTick((n) => n + 1)}>
          Try again
        </button>
      </PageSection>
    )
  }

  const readingMode =
    isMobileViewport() && !showPsalmIndexOnMobile ? styles.readingModeSection : ''

  const jumpTargets = JUMP_TARGETS.filter((n) => sorted.some((p) => psalmNumberOf(p) === n))

  return (
    <PageSection variant="tint" className={readingMode}>
      <nav className={styles.nav} aria-label="Breadcrumb">
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
              Today&apos;s reading: Psalms {rangeActive.from}–{rangeActive.to}
            </p>
            <div className={styles.rangeActions}>
              <button type="button" className={styles.rangeClear} onClick={clearRange}>
                View full Mezmure Dawit
              </button>
              <Link
                className={styles.rangeClear}
                to={prayerCollectionPath(DAILY_COLLECTION_SLUGS.mezmureDawit)}
              >
                Open collection
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
                const i = sorted.findIndex((p) => psalmNumberOf(p) === n)
                if (i >= 0) go(i)
              }}
            >
              {formatPsalmLabel(n)}
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
            {rangeActive ? `Psalms ${rangeActive.from}–${rangeActive.to}` : t('prayerMezmurIndex')}
          </p>
          <ul className={styles.index}>
            {filtered.map((p) => {
              const number = psalmNumberOf(p)
              const on = p.id === active?.id
              return (
                <li key={p.id}>
                  <button
                    type="button"
                    className={`${styles.indexBtn} ${on ? styles.indexBtnOn : ''}`}
                    aria-current={on ? 'true' : undefined}
                    onClick={() => handlePsalmSelect(p)}
                  >
                    <span className={styles.indexNum}>{number}</span>
                    <span className={styles.indexTitle}>
                      <span className={styles.indexPsalm}>{formatPsalmLabel(number)}</span>
                      {p.titles?.amharic || p.title ? (
                        <span lang="am">{p.titles?.amharic || p.title}</span>
                      ) : null}
                    </span>
                  </button>
                </li>
              )
            })}
          </ul>
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
              ← Back to psalm index
            </button>
          ) : null}
          <div className={styles.sticky}>
            <div className={styles.stickyInner}>
              <div className={styles.stickyTitles}>
                <p className={styles.psalmNo}>{active ? formatPsalmLabel(activeNumber) : ''}</p>
                <h2 className={styles.h2} lang="am">
                  {titlePrimary}
                </h2>
              </div>
              <div className={styles.stickyControls}>
                <div className={styles.navRow}>
                  <button
                    type="button"
                    className={styles.navBtn}
                    onClick={() => go(index - 1)}
                    disabled={index <= 0}
                  >
                    {t('prayerMezmurPrev')}
                  </button>
                  <button
                    type="button"
                    className={styles.navBtn}
                    onClick={() => go(index + 1)}
                    disabled={index >= sorted.length - 1}
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
                  selectedId={readerTab}
                  onTabChange={setReaderTab}
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
                aria-label={titlePrimary || 'Psalm reading'}
              />
              <PrayerReader
                text={active.text}
                titles={active.titles}
                showTitle
                split="panel"
                selectedId={readerTab}
                onTabChange={setReaderTab}
                ariaIdPrefix={readerTabsUid}
              />
            </div>
          ) : sorted.length === 0 ? (
            <p role="status">No psalms found for this range.</p>
          ) : null}
        </article>
      </div>
    </PageSection>
  )
}
