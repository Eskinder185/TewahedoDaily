import { useCallback, useEffect, useMemo, useRef, useState } from 'react'
import { Link, useLocation } from 'react-router-dom'
import { LanguageTriToggle } from '../components/prayers/LanguageTriToggle'
import { PrayerReadingText } from '../components/prayers/PrayerReadingText'
import type { PrayerLang } from '../components/prayers/prayerLang'
import { PageLoadingFallback } from '../components/ui/PageLoadingFallback'
import { PageSection } from '../components/ui/PageSection'
import { useTranslation } from '../i18n'
import { useUiLabel } from '../lib/i18n/uiLabels'
import { useLocale } from '../lib/i18n/locale'
import {
  htmlLangForPrayerLang,
  preferredPrayerLangFromLocale,
  prayerBodyForLang,
  resolvePrayerLang,
} from '../lib/prayers/prayerLanguage'
import {
  loadPrayerCollection,
  type PrayerCollectionBundle,
} from '../lib/prayers/prayerSupabase'
import {
  auditZewterBundle,
  buildZewterReadingBlocks,
  logZewterDevAudit,
  zewterContinuousPath,
  zewterPrayerAnchorId,
  zewterSectionAnchorId,
  ZEWTER_COLLECTION_SLUG,
} from '../lib/prayers/zeweterContinuous'
import { useReadingProgressTracker } from '../lib/userContent/useReadingProgressTracker'
import styles from './ZeweterContinuousPage.module.css'

const FONT_MIN = 0.9
const FONT_MAX = 1.35
const FONT_STEP = 0.08

function prayerDisplayTitle(
  prayer: PrayerCollectionBundle['prayers'][number],
  preferred: PrayerLang,
): { title: string; bodyLang: PrayerLang } {
  const titles = prayer.titles ?? {
    amharic: '',
    geez: '',
    english: '',
    fallback: prayer.title,
  }
  const bodyLang = resolvePrayerLang(prayer.text, preferred) || preferred
  const order: PrayerLang[] = [preferred, 'amharic', 'geez', 'english']
  for (const lang of order) {
    const pick =
      lang === 'amharic' ? titles.amharic : lang === 'geez' ? titles.geez : titles.english
    if (pick.trim()) return { title: pick.trim(), bodyLang }
  }
  return { title: titles.fallback.trim() || prayer.title, bodyLang }
}

export function ZeweterContinuousPage() {
  const t = useUiLabel()
  const tr = useTranslation()
  const { locale } = useLocale()
  const location = useLocation()
  const [bundle, setBundle] = useState<PrayerCollectionBundle | null>()
  const [error, setError] = useState<string>()
  const [reloadTick, setReloadTick] = useState(0)
  const [lang, setLang] = useState<PrayerLang>(() => preferredPrayerLangFromLocale(locale))
  const [fontScale, setFontScale] = useState(1)
  const [tocOpen, setTocOpen] = useState(false)
  const [progress, setProgress] = useState(0)
  const articleRef = useRef<HTMLElement | null>(null)
  const tocRef = useRef<HTMLElement | null>(null)

  useReadingProgressTracker({
    contentType: 'collection',
    contentSlug: ZEWTER_COLLECTION_SLUG,
    collectionSlug: ZEWTER_COLLECTION_SLUG,
    title: 'Zeweter Tselot',
    route: zewterContinuousPath(),
    positionPercent: progress,
  })

  useEffect(() => {
    setLang(preferredPrayerLangFromLocale(locale))
  }, [locale])

  useEffect(() => {
    let active = true
    queueMicrotask(() => {
      if (!active) return
      setBundle(undefined)
      setError(undefined)
    })
    void loadPrayerCollection(ZEWTER_COLLECTION_SLUG)
      .then((result) => {
        if (!active) return
        if (result) {
          const audit = auditZewterBundle(result)
          logZewterDevAudit(audit)
        }
        setBundle(result)
      })
      .catch((cause) => {
        if (!active) return
        const message =
          cause && typeof cause === 'object' && 'message' in cause
            ? String((cause as { message?: unknown }).message)
            : "We couldn't load Zeweter Tselot."
        if (import.meta.env.DEV) console.error('[zeweter] continuous load', cause)
        setError(import.meta.env.DEV ? message : "We couldn't load Zeweter Tselot.")
        setBundle(null)
      })
    return () => {
      active = false
    }
  }, [reloadTick])

  const blocks = useMemo(() => (bundle ? buildZewterReadingBlocks(bundle) : []), [bundle])
  const prayers = useMemo(
    () => blocks.filter((block): block is Extract<typeof block, { kind: 'prayer' }> => block.kind === 'prayer'),
    [blocks],
  )

  useEffect(() => {
    const title = bundle?.collection.title || t('prayerZeweterTitle')
    document.title = `Tewahedo Daily | ${title}`
  }, [bundle, t])

  // Scroll progress across the continuous article.
  useEffect(() => {
    const onScroll = () => {
      const el = articleRef.current
      if (!el) return
      const rect = el.getBoundingClientRect()
      const total = el.offsetHeight - window.innerHeight
      if (total <= 0) {
        setProgress(rect.bottom <= window.innerHeight ? 100 : 0)
        return
      }
      const scrolled = Math.min(Math.max(-rect.top, 0), total)
      setProgress(Math.round((scrolled / total) * 100))
    }
    onScroll()
    window.addEventListener('scroll', onScroll, { passive: true })
    window.addEventListener('resize', onScroll)
    return () => {
      window.removeEventListener('scroll', onScroll)
      window.removeEventListener('resize', onScroll)
    }
  }, [blocks.length])

  // Honor hash deep-links after content loads.
  useEffect(() => {
    if (!bundle || !prayers.length) return
    const raw = (location.hash || '').replace(/^#/, '')
    if (!raw) return
    const id = decodeURIComponent(raw)
    const frame = window.requestAnimationFrame(() => {
      const target = document.getElementById(id)
      if (!target) return
      target.scrollIntoView({ behavior: 'smooth', block: 'start' })
      if (target instanceof HTMLElement) {
        target.setAttribute('tabindex', '-1')
        target.focus({ preventScroll: true })
      }
    })
    return () => window.cancelAnimationFrame(frame)
  }, [bundle, prayers.length, location.hash])

  const jumpTo = useCallback((anchorId: string) => {
    setTocOpen(false)
    const target = document.getElementById(anchorId)
    if (target) {
      target.scrollIntoView({ behavior: 'smooth', block: 'start' })
      if (target instanceof HTMLElement) {
        target.setAttribute('tabindex', '-1')
        target.focus({ preventScroll: true })
      }
    }
    const url = zewterContinuousPath(anchorId)
    window.history.replaceState(null, '', url)
  }, [])

  if (bundle === undefined && !error) return <PageLoadingFallback />

  if (error) {
    return (
      <PageSection variant="tint">
        <div className={styles.notFound}>
          <Link className={styles.backLink} to="/pray">
            {tr('prayers.navigation.backToCollections')}
          </Link>
          <h1>{error}</h1>
          <button type="button" className={styles.primaryBtn} onClick={() => setReloadTick((n) => n + 1)}>
            Try again
          </button>
        </div>
      </PageSection>
    )
  }

  if (!bundle || prayers.length === 0) {
    return (
      <PageSection variant="tint">
        <div className={styles.notFound}>
          <Link className={styles.backLink} to="/pray">
            {tr('prayers.navigation.backToCollections')}
          </Link>
          <h1>{t('prayerZeweterTitle')}</h1>
          <p>No published prayers were found for this collection.</p>
        </div>
      </PageSection>
    )
  }

  const collectionTitle = bundle.collection.title || t('prayerZeweterTitle')
  const amharicTitle = bundle.collection.amharicTitle || 'ዘወትር ጸሎት'

  return (
    <PageSection variant="tint">
      <div
        className={styles.shell}
        style={{ ['--zeweter-font-scale' as string]: String(fontScale) }}
      >
        <div
          className={styles.progressTrack}
          role="progressbar"
          aria-label={t('prayerZeweterProgressAria')}
          aria-valuemin={0}
          aria-valuemax={100}
          aria-valuenow={progress}
        >
          <div className={styles.progressFill} style={{ width: `${progress}%` }} />
        </div>

        <nav className={`${styles.topNav} ${styles.noPrint}`} aria-label={tr('prayers.navigation.aria')}>
          <Link className={styles.backLink} to="/pray">
            {tr('prayers.navigation.backToCollections')}
          </Link>
        </nav>

        <header className={styles.head}>
          <p className={styles.eyebrow}>{t('prayerZeweterEyebrow')}</p>
          <h1 className={styles.title}>{collectionTitle}</h1>
          {amharicTitle && amharicTitle !== collectionTitle ? (
            <p className={styles.amharic} lang="am">
              {amharicTitle}
            </p>
          ) : null}
          <p className={styles.deck}>{t('prayerZeweterIntro')}</p>
        </header>

        <div className={`${styles.stickyBar} ${styles.noPrint}`} role="region" aria-label={t('prayerZeweterControlsAria')}>
          <LanguageTriToggle
            value={lang}
            onChange={setLang}
            labels={{
              amharic: t('prayerLangAmharic'),
              geez: t('prayerLangGeez'),
              english: t('prayerLangEnglish'),
            }}
            idPrefix="zeweter-lang"
            className={styles.langToggle}
          />
          <div className={styles.sizeGroup} role="group" aria-label={t('prayerZeweterTextSize')}>
            <button
              type="button"
              className={styles.sizeBtn}
              aria-label="Decrease text size"
              disabled={fontScale <= FONT_MIN + 0.001}
              onClick={() => setFontScale((v) => Math.max(FONT_MIN, +(v - FONT_STEP).toFixed(2)))}
            >
              {t('prayerZeweterTextSmaller')}
            </button>
            <button
              type="button"
              className={styles.sizeBtn}
              aria-label="Increase text size"
              disabled={fontScale >= FONT_MAX - 0.001}
              onClick={() => setFontScale((v) => Math.min(FONT_MAX, +(v + FONT_STEP).toFixed(2)))}
            >
              {t('prayerZeweterTextLarger')}
            </button>
          </div>
          <button
            type="button"
            className={styles.tocBtn}
            aria-expanded={tocOpen}
            aria-controls="zeweter-contents"
            onClick={() => setTocOpen((open) => !open)}
          >
            {t('prayerZeweterContents')}
          </button>
          <span className={styles.progressLabel} aria-hidden="true">
            {progress}%
          </span>
        </div>

        {tocOpen ? (
          <nav
            id="zeweter-contents"
            ref={tocRef}
            className={`${styles.toc} ${styles.noPrint}`}
            aria-label={t('prayerZeweterContentsAria')}
          >
            <div className={styles.tocHead}>
              <strong>{t('prayerZeweterContents')}</strong>
              <button type="button" className={styles.tocClose} onClick={() => setTocOpen(false)}>
                {t('prayerZeweterCloseContents')}
              </button>
            </div>
            <ol className={styles.tocList}>
              {prayers.map(({ prayer }) => {
                const { title } = prayerDisplayTitle(prayer, lang)
                const anchor = zewterPrayerAnchorId(prayer.slug)
                return (
                  <li key={prayer.id}>
                    <a
                      href={`#${anchor}`}
                      onClick={(event) => {
                        event.preventDefault()
                        jumpTo(anchor)
                      }}
                    >
                      {title}
                    </a>
                  </li>
                )
              })}
            </ol>
          </nav>
        ) : null}

        <div>
          <article ref={articleRef} className={styles.reading} aria-label={t('prayerZeweterReading')}>
            {blocks.map((block) => {
              if (block.kind === 'section') {
                const sectionId = zewterSectionAnchorId(block.slug)
                return (
                  <section key={`section-${block.id}`} id={sectionId} className={styles.sectionHeading} tabIndex={-1}>
                    <h2 className={styles.sectionTitle}>
                      {block.titleAmharic || block.title}
                    </h2>
                    {block.titleAmharic && block.title && block.titleAmharic !== block.title ? (
                      <p className={styles.sectionSub}>{block.title}</p>
                    ) : null}
                  </section>
                )
              }

              const { prayer } = block
              const { title, bodyLang } = prayerDisplayTitle(prayer, lang)
              const body = prayerBodyForLang(prayer.text, bodyLang)
              const anchor = zewterPrayerAnchorId(prayer.slug)
              const secondary =
                prayer.transliterationTitle &&
                prayer.transliterationTitle !== title
                  ? prayer.transliterationTitle
                  : null

              return (
                <section key={prayer.id} id={anchor} className={styles.prayer} tabIndex={-1}>
                  <header className={styles.prayerHead}>
                    <h2 className={styles.prayerTitle} lang={htmlLangForPrayerLang(bodyLang)}>
                      {title}
                    </h2>
                    {secondary ? <p className={styles.prayerSub}>{secondary}</p> : null}
                  </header>
                  {body ? (
                    <PrayerReadingText text={body} lang={bodyLang} variant="plain" allowCollapse={false} />
                  ) : (
                    <p className={styles.empty}>{t('prayerReaderEmpty')}</p>
                  )}
                  <hr className={styles.divider} />
                </section>
              )
            })}
          </article>
        </div>
      </div>
    </PageSection>
  )
}
