import { useEffect, useId, useMemo, useState } from 'react'
import { Link, useSearchParams } from 'react-router-dom'
import { PageSection } from '../components/ui/PageSection'
import { SanctuaryHero } from '../components/prayers/SanctuaryHero'
import { PrayerTextTabs } from '../components/prayers/PrayerTextTabs'
import { PSALMS } from '../lib/prayers/psalmData'
import { useUiLabel } from '../lib/i18n/uiLabels'
import { forceScrollToTopOnMobile, isMobileViewport } from '../lib/scrollUtils'
import styles from './MezmureDawitPage.module.css'

export function MezmureDawitPage() {
  const t = useUiLabel()
  const readerTabsUid = useId()
  const [readerTab, setReaderTab] = useState('amharic')
  const [params, setParams] = useSearchParams()
  const qRaw = params.get('n') ?? ''
  const [q, setQ] = useState(qRaw)
  const [showPsalmIndexOnMobile, setShowPsalmIndexOnMobile] = useState(true)

  useEffect(() => {
    setQ(qRaw)
  }, [qRaw])

  const sorted = useMemo(
    () => [...PSALMS].sort((a, b) => a.number - b.number),
    [],
  )

  const indexFromParam = useMemo(() => {
    const n = Number.parseInt(qRaw, 10)
    if (!Number.isFinite(n)) return 0
    const i = sorted.findIndex((p) => p.number === n)
    return i >= 0 ? i : 0
  }, [qRaw, sorted])

  const [index, setIndex] = useState(indexFromParam)

  useEffect(() => {
    setIndex(indexFromParam)
  }, [indexFromParam])

  useEffect(() => {
    const p = sorted[index]
    if (p && String(p.number) !== qRaw) {
      setParams({ n: String(p.number) }, { replace: true })
    }
  }, [index, qRaw, setParams, sorted])

  const active = sorted[index] ?? sorted[0]
  const titlePrimary = active?.title.amharic.trim() ?? ''

  useEffect(() => {
    setReaderTab('amharic')
  }, [active?.id])

  const filtered = useMemo(() => {
    const needle = q.trim().toLowerCase()
    if (!needle) return sorted
    return sorted.filter((p) => {
      const sn = String(p.number)
      const ta = p.title.amharic + p.title.geez + p.title.english
      return (
        sn.includes(needle) ||
        ta.toLowerCase().includes(needle) ||
        p.id.toLowerCase().includes(needle)
      )
    })
  }, [q, sorted])

  const go = (i: number) => {
    const next = Math.max(0, Math.min(sorted.length - 1, i))
    setIndex(next)
    const p = sorted[next]
    if (p) {
      setParams({ n: String(p.number) })
      // On mobile: hide psalm index and scroll to top immediately
      if (isMobileViewport()) {
        setShowPsalmIndexOnMobile(false)
        forceScrollToTopOnMobile()
      }
    }
  }

  // Handle psalm selection from index
  const handlePsalmSelect = (psalm: any) => {
    const i = sorted.findIndex((x) => x.id === psalm.id)
    if (i >= 0) {
      go(i)
      setQ(String(psalm.number))
    }
  }

  // Show psalm index again when needed
  const showPsalmIndex = () => {
    setShowPsalmIndexOnMobile(true)
  }

  return (
    <PageSection variant="tint">
      <nav className={styles.nav} aria-label="Breadcrumb">
        <Link className={styles.crumb} to="/prayers">
          {t('navPrayers')}
        </Link>
        <span className={styles.crumbSep} aria-hidden>
          /
        </span>
        <span className={styles.crumbCurrent}>{t('prayerMezmurTitle')}</span>
      </nav>

      <SanctuaryHero eyebrow={t('prayerMezmurEyebrow')} title={t('prayerMezmurTitle')}>
        <p>{t('prayerMezmurIntro')}</p>
      </SanctuaryHero>

      <div className={styles.jumpRow}>
        <a href="#mezmur-index" className={styles.jumpChip}>
          Psalm index
        </a>
        <a href="#mezmur-reader" className={styles.jumpChip}>
          Reading panel
        </a>
      </div>

      <div className={`${styles.layout} ${!showPsalmIndexOnMobile ? styles.layoutReaderOnly : ''}`}>
        <aside className={`${styles.aside} ${!showPsalmIndexOnMobile ? styles.asideHidden : ''}`} id="mezmur-index">
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
            placeholder="1–150"
            autoComplete="off"
          />

          <p className={styles.indexLabel}>{t('prayerMezmurIndex')}</p>
          <ul className={styles.index}>
            {filtered.map((p) => {
              const on = p.id === active?.id
              return (
                <li key={p.id}>
                  <button
                    type="button"
                    className={`${styles.indexBtn} ${on ? styles.indexBtnOn : ''}`}
                    onClick={() => handlePsalmSelect(p)}
                  >
                    <span className={styles.indexNum}>{p.number}</span>
                    <span className={styles.indexTitle} lang="am">
                      {p.title.amharic}
                    </span>
                  </button>
                </li>
              )
            })}
          </ul>
        </aside>

        <article className={`${styles.reader} ${!showPsalmIndexOnMobile ? styles.readerFullMobile : ''}`} id="mezmur-reader">
          {!showPsalmIndexOnMobile && (
            <button 
              className={styles.backButton}
              onClick={showPsalmIndex}
              type="button"
            >
              ← Back to psalm index
            </button>
          )}
          <div className={styles.sticky}>
            <div className={styles.stickyInner}>
              <div className={styles.stickyTitles}>
                <p className={styles.psalmNo}>
                  {active ? `№ ${active.number}` : ''}
                </p>
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
                <PrayerTextTabs
                  text={active.text}
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
              <PrayerTextTabs
                text={active.text}
                split="panel"
                selectedId={readerTab}
                onTabChange={setReaderTab}
                ariaIdPrefix={readerTabsUid}
              />
            </div>
          ) : null}
        </article>
      </div>
    </PageSection>
  )
}
