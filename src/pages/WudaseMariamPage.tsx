import { useEffect, useLayoutEffect, useMemo, useState } from 'react'
import { Link, useSearchParams } from 'react-router-dom'
import { PageSection } from '../components/ui/PageSection'
import { SanctuaryHero } from '../components/prayers/SanctuaryHero'
import { PrayerTextTabs } from '../components/prayers/PrayerTextTabs'
import {
  WUDASE_DAY_ORDER,
  WUDASE_PRAYERS,
} from '../lib/prayers/wudaseData'
import type { TselotPrayer } from '../lib/practice/types'
import { useUiLabel } from '../lib/i18n/uiLabels'
import type { UiLabelKey } from '../lib/i18n/uiLabels'
import { isMobileViewport, scrollTargetIntoView } from '../lib/scrollUtils'
import styles from './WudaseMariamPage.module.css'

const DAY_LABEL_KEYS: UiLabelKey[] = [
  'prayerDayMon',
  'prayerDayTue',
  'prayerDayWed',
  'prayerDayThu',
  'prayerDayFri',
  'prayerDaySat',
  'prayerDaySun',
]

function defaultDayId(): string {
  const js = new Date().getDay()
  const monFirstIndex = js === 0 ? 6 : js - 1
  return WUDASE_DAY_ORDER[monFirstIndex] ?? WUDASE_DAY_ORDER[0]
}

export function WudaseMariamPage() {
  const t = useUiLabel()
  const [params, setParams] = useSearchParams()
  const paramDay = (params.get('day') ?? '').toLowerCase()
  const [showDayTabsOnMobile, setShowDayTabsOnMobile] = useState(true)

  const byId = useMemo(() => {
    const m = new Map<string, TselotPrayer>()
    for (const p of WUDASE_PRAYERS) m.set(p.id, p)
    return m
  }, [])

  const ordered = useMemo(() => {
    return WUDASE_DAY_ORDER.map((id) => byId.get(id)).filter(
      (p): p is TselotPrayer => Boolean(p),
    )
  }, [byId])

  const fallbackId = defaultDayId()
  const order = WUDASE_DAY_ORDER as readonly string[]
  const activeId = order.includes(paramDay) ? paramDay : fallbackId

  useEffect(() => {
    const order = WUDASE_DAY_ORDER as readonly string[]
    if (!paramDay || !order.includes(paramDay)) {
      setParams({ day: fallbackId }, { replace: true })
    }
  }, [paramDay, fallbackId, setParams])

  const active = byId.get(activeId) ?? ordered[0]

  useLayoutEffect(() => {
    if (isMobileViewport() && showDayTabsOnMobile) return
    scrollTargetIntoView('#wudase-reader', { smooth: false, flush: true })
    requestAnimationFrame(() => {
      if (isMobileViewport() && !showDayTabsOnMobile) {
        document.getElementById('wudase-reader')?.focus({ preventScroll: true })
      }
    })
  }, [activeId, showDayTabsOnMobile])

  // Handle day selection - immediate opening on mobile
  const handleDaySelect = (dayId: string) => {
    setParams({ day: dayId })

    if (isMobileViewport()) {
      setShowDayTabsOnMobile(false)
    }
  }

  // Show day tabs again when needed
  const showDayTabs = () => {
    setShowDayTabsOnMobile(true)
  }

  const readingMode =
    isMobileViewport() && !showDayTabsOnMobile ? styles.readingModeSection : ''

  return (
    <PageSection variant="tint" className={readingMode}>
      <nav className={styles.nav} aria-label="Breadcrumb">
        <Link className={styles.crumb} to="/prayers">
          {t('navPrayers')}
        </Link>
        <span className={styles.crumbSep} aria-hidden>
          /
        </span>
        <span className={styles.crumbCurrent}>{t('prayerWudaseTitle')}</span>
      </nav>

      <div className={styles.preReader}>
        <SanctuaryHero eyebrow={t('prayerWudaseEyebrow')} title={t('prayerWudaseTitle')}>
          <p>{t('prayerWudaseIntro')}</p>
        </SanctuaryHero>

        <div className={styles.jumpRow}>
          <a href="#wudase-days" className={styles.jumpChip}>
            Day selector
          </a>
          <a href="#wudase-reader" className={styles.jumpChip}>
            Reading panel
          </a>
        </div>
      </div>

      <p className={`${styles.tabsLabel} ${!showDayTabsOnMobile ? styles.tabsLabelHidden : ''}`}>{t('prayerWudaseDays')}</p>
      <div
        className={`${styles.tabs} ${!showDayTabsOnMobile ? styles.tabsHidden : ''}`}
        id="wudase-days"
        role="tablist"
        aria-label={t('prayerWudaseDays')}
      >
        {WUDASE_DAY_ORDER.map((id, i) => {
          const p = byId.get(id)
          const labelKey = DAY_LABEL_KEYS[i]
          const short = labelKey ? t(labelKey) : ''
          const on = id === activeId
          return (
            <button
              key={id}
              type="button"
              role="tab"
              aria-selected={on}
              aria-controls="wudase-reader"
              className={`${styles.tab} ${on ? styles.tabOn : ''}`}
              onClick={() => handleDaySelect(id)}
            >
              <span className={styles.tabShort}>{short}</span>
              {p?.title ? (
                <span className={styles.tabTitle} lang="am">
                  {p.title.replace(/^ውዳሴ ማርያም\s*/i, '').trim() || p.title}
                </span>
              ) : null}
            </button>
          )
        })}
      </div>

      <article
        className={`${styles.reader} ${!showDayTabsOnMobile ? styles.readerFullMobile : ''}`}
        id="wudase-reader"
        key={activeId}
        tabIndex={-1}
      >
        {!showDayTabsOnMobile && (
          <button 
            className={styles.backButton}
            onClick={showDayTabs}
            type="button"
          >
            ← Back to days
          </button>
        )}
        <header className={styles.dayHead}>
          <div>
            <h2 className={styles.h2}>{active?.title}</h2>
            {active?.transliterationTitle?.trim() ? (
              <p className={styles.sub}>{active.transliterationTitle}</p>
            ) : null}
          </div>
        </header>

        <div
          id="wudase-reading-start"
          tabIndex={-1}
          className={styles.readingLandmark}
          aria-label={active?.title ?? 'Prayer reading'}
        />

        {active ? (
          <PrayerTextTabs
            text={active.text}
            summary={active.summary}
            transliteration={active.transliteration}
          />
        ) : null}
      </article>
    </PageSection>
  )
}
