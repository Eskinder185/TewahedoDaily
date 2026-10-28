import {
  useCallback,
  useEffect,
  useId,
  useLayoutEffect,
  useMemo,
  useRef,
  useState,
  type CSSProperties,
  type PointerEvent as ReactPointerEvent,
} from 'react'
import { createPortal } from 'react-dom'
import {
  LINES_PER_SLIDE_OPTIONS,
  buildPresentationSlides,
  clampSlideIndex,
  mapSlideIndex,
  resolveLanguage,
  type PresentationLanguage,
  type PresentationSlide,
  type PresentationSource,
} from '../../../lib/mezmur/presentationSlides'
import {
  PRESENTATION_THEMES,
  themeColors,
  type PresentationTheme,
} from '../../../lib/mezmur/presentationThemes'
import {
  FONT_MAX,
  FONT_MIN,
  FONT_STEP,
  readPresentationPrefs,
  writePresentationPrefs,
  type PresentationPrefs as Prefs,
} from '../../../lib/mezmur/presentationPrefs'
import styles from './MezmurPresentation.module.css'

export type MezmurPresentationProps = {
  source: PresentationSource
  initialLanguage?: PresentationLanguage | null
  uiLocale?: 'en' | 'am'
  onClose: () => void
}

const COPY = {
  en: {
    dialog: 'Mezmur presentation',
    exit: 'Exit',
    exitLong: 'Exit presentation',
    prev: 'Previous slide',
    next: 'Next slide',
    settings: 'Settings',
    settingsLong: 'Presentation settings',
    overview: 'Slides',
    overviewLong: 'Slide overview',
    fullscreen: 'Full screen',
    exitFullscreen: 'Leave full screen',
    language: 'Language',
    lines: 'Lines per slide',
    auto: 'Auto',
    size: 'Text size',
    smaller: 'Smaller text',
    larger: 'Larger text',
    align: 'Alignment',
    left: 'Left',
    center: 'Center',
    theme: 'Theme',
    titleSlide: 'Title slide',
    grouping: 'Keep verses and refrains together',
    translit: 'Show transliteration',
    contrast: 'High contrast',
    attribution: 'Source attribution in PowerPoint',
    download: 'Download PowerPoint (.pptx)',
    downloading: 'Preparing PowerPoint…',
    downloaded: (name: string) => `Downloaded ${name}`,
    downloadFailed: 'The PowerPoint file could not be created. Please try again.',
    fitWarning: 'Text was reduced to fit this slide. Choose fewer lines per slide or a smaller size.',
    slideOf: (n: number, total: number) => `Slide ${n} of ${total}`,
    noLyrics: 'No lyrics are available in this language.',
    approx: 'Transliteration is matched verse by verse; some lines are grouped.',
    hint: 'Tap or move the pointer to show controls · ← → to move · Esc to exit',
    close: 'Close',
    titleSlideLabel: 'Title',
  },
  am: {
    dialog: 'የመዝሙር ማቅረቢያ',
    exit: 'ውጣ',
    exitLong: 'ከማቅረቢያ ውጣ',
    prev: 'የቀደመው ስላይድ',
    next: 'ቀጣይ ስላይድ',
    settings: 'ቅንብሮች',
    settingsLong: 'የማቅረቢያ ቅንብሮች',
    overview: 'ስላይዶች',
    overviewLong: 'የስላይዶች ዝርዝር',
    fullscreen: 'ሙሉ ማያ',
    exitFullscreen: 'ከሙሉ ማያ ውጣ',
    language: 'ቋንቋ',
    lines: 'በስላይድ ያሉ መስመሮች',
    auto: 'ራስ-ሰር',
    size: 'የፊደል መጠን',
    smaller: 'አሳንስ',
    larger: 'አስፋ',
    align: 'አሰላለፍ',
    left: 'ግራ',
    center: 'መሃል',
    theme: 'ገጽታ',
    titleSlide: 'የርዕስ ስላይድ',
    grouping: 'ቁጥሮችንና አዝማቾችን አትለያይ',
    translit: 'የላቲን ንባብ አሳይ',
    contrast: 'ከፍተኛ ንፅፅር',
    attribution: 'በPowerPoint ውስጥ ምንጭ አክል',
    download: 'PowerPoint (.pptx) አውርድ',
    downloading: 'PowerPoint በማዘጋጀት ላይ…',
    downloaded: (name: string) => `${name} ወርዷል`,
    downloadFailed: 'የPowerPoint ፋይሉን መፍጠር አልተቻለም። እንደገና ይሞክሩ።',
    fitWarning: 'ጽሑፉ እንዲገጥም ተቀንሷል። ያነሱ መስመሮችን ወይም ትንሽ መጠን ይምረጡ።',
    slideOf: (n: number, total: number) => `ስላይድ ${n} ከ${total}`,
    noLyrics: 'በዚህ ቋንቋ ግጥም የለም።',
    approx: 'የላቲን ንባቡ በቁጥር ተዛምዷል፤ አንዳንድ መስመሮች ተሰብስበዋል።',
    hint: 'መቆጣጠሪያዎችን ለማየት ይንኩ · ← → ለመንቀሳቀስ · Esc ለመውጣት',
    close: 'ዝጋ',
    titleSlideLabel: 'ርዕስ',
  },
} as const

const HIDE_AFTER_MS = 3200

function fullscreenElement(): Element | null {
  const doc = document as Document & { webkitFullscreenElement?: Element | null }
  return document.fullscreenElement ?? doc.webkitFullscreenElement ?? null
}

async function enterFullscreen(el: HTMLElement): Promise<boolean> {
  const target = el as HTMLElement & { webkitRequestFullscreen?: () => Promise<void> | void }
  try {
    if (target.requestFullscreen) {
      await target.requestFullscreen({ navigationUI: 'hide' })
      return true
    }
    if (target.webkitRequestFullscreen) {
      await target.webkitRequestFullscreen()
      return true
    }
  } catch {
    /* denied (no user gesture, iPhone Safari, iframe) — the fixed full-viewport layout is the fallback */
  }
  return false
}

async function leaveFullscreen() {
  const doc = document as Document & { webkitExitFullscreen?: () => Promise<void> | void }
  try {
    if (document.exitFullscreen && document.fullscreenElement) await document.exitFullscreen()
    else if (doc.webkitExitFullscreen) await doc.webkitExitFullscreen()
  } catch {
    /* already left */
  }
}

function fullscreenSupported(): boolean {
  const el = document.documentElement as HTMLElement & { webkitRequestFullscreen?: unknown }
  return Boolean(document.fullscreenEnabled || el.webkitRequestFullscreen)
}

export default function MezmurPresentation({ source, initialLanguage, uiLocale = 'en', onClose }: MezmurPresentationProps) {
  const t = COPY[uiLocale] || COPY.en
  const rootRef = useRef<HTMLDivElement>(null)
  const stageRef = useRef<HTMLDivElement>(null)
  const textRef = useRef<HTMLDivElement>(null)
  const settingsBtnRef = useRef<HTMLButtonElement>(null)
  const hideTimer = useRef<number | null>(null)
  const swipeStart = useRef<{ x: number; y: number; id: number } | null>(null)
  const settingsId = useId()
  const overviewId = useId()

  const [prefs, setPrefs] = useState<Prefs>(() => {
    const stored = readPresentationPrefs()
    return { ...stored, language: initialLanguage ?? stored.language }
  })
  const language = resolveLanguage(source, prefs.language)
  const [index, setIndex] = useState(0)
  const [controlsVisible, setControlsVisible] = useState(true)
  const [panel, setPanel] = useState<'settings' | 'overview' | null>(null)
  const [isFullscreen, setIsFullscreen] = useState(false)
  const [canFullscreen] = useState(() => fullscreenSupported())
  const [capacity, setCapacity] = useState(4)
  const [unitPx, setUnitPx] = useState(0.5)
  const [stageBox, setStageBox] = useState<{ w: number; h: number }>({ w: 0, h: 0 })
  const [fitReduced, setFitReduced] = useState(false)
  const [status, setStatus] = useState('')
  const [exporting, setExporting] = useState(false)

  const update = useCallback(<K extends keyof Prefs>(key: K, value: Prefs[K]) => {
    setPrefs((prev) => {
      const next = { ...prev, [key]: value }
      writePresentationPrefs(next)
      return next
    })
  }, [])

  const slides = useMemo<PresentationSlide[]>(
    () =>
      buildPresentationSlides(source, {
        language: language ?? 'original',
        linesPerSlide: prefs.linesPerSlide,
        autoCapacity: capacity,
        includeTitleSlide: prefs.showTitle,
        groupBySection: prefs.grouping,
        showTransliteration: prefs.showTransliteration,
      }),
    [source, language, prefs.linesPerSlide, capacity, prefs.showTitle, prefs.grouping, prefs.showTransliteration],
  )

  // Keep the presenter's place when the slide list is rebuilt.
  const [prevSlides, setPrevSlides] = useState(slides)
  if (prevSlides !== slides) {
    setPrevSlides(slides)
    setIndex(mapSlideIndex(prevSlides, slides, index))
  }
  const current = slides[clampSlideIndex(index, slides.length)]
  const total = slides.length
  const position = clampSlideIndex(index, total)

  const go = useCallback(
    (delta: number) => setIndex((value) => clampSlideIndex(value + delta, total)),
    [total],
  )

  // --- controls auto-hide ---------------------------------------------------
  const reveal = useCallback(() => {
    setControlsVisible(true)
    if (hideTimer.current) window.clearTimeout(hideTimer.current)
    hideTimer.current = window.setTimeout(() => setControlsVisible(false), HIDE_AFTER_MS)
  }, [])
  useEffect(() => {
    reveal()
    return () => {
      if (hideTimer.current) window.clearTimeout(hideTimer.current)
    }
  }, [reveal])
  const showControls = controlsVisible || panel !== null

  // --- open / close lifecycle ----------------------------------------------
  useEffect(() => {
    const root = rootRef.current
    const previousFocus = document.activeElement as HTMLElement | null
    const { overflow } = document.body.style
    document.body.style.overflow = 'hidden'
    document.documentElement.dataset.mezmurPresenting = 'true'
    root?.focus()
    if (root) void enterFullscreen(root)
    const onChange = () => setIsFullscreen(Boolean(fullscreenElement()))
    document.addEventListener('fullscreenchange', onChange)
    document.addEventListener('webkitfullscreenchange', onChange)
    return () => {
      document.removeEventListener('fullscreenchange', onChange)
      document.removeEventListener('webkitfullscreenchange', onChange)
      document.body.style.overflow = overflow
      delete document.documentElement.dataset.mezmurPresenting
      void leaveFullscreen()
      previousFocus?.focus?.()
    }
  }, [])

  const exit = useCallback(() => {
    void leaveFullscreen()
    onClose()
  }, [onClose])

  // --- keyboard ---------------------------------------------------------------
  useEffect(() => {
    const onKey = (event: KeyboardEvent) => {
      const target = event.target as HTMLElement | null
      const typing = target && /^(INPUT|SELECT|TEXTAREA)$/.test(target.tagName) && (target as HTMLInputElement).type !== 'checkbox' && (target as HTMLInputElement).type !== 'radio'
      if (event.key === 'Escape') {
        event.preventDefault()
        if (panel) {
          setPanel(null)
          settingsBtnRef.current?.focus()
        } else exit()
        return
      }
      if (typing || event.altKey || event.ctrlKey || event.metaKey) return
      const onButton = target?.tagName === 'BUTTON'
      switch (event.key) {
        case 'ArrowRight':
        case 'ArrowDown':
        case 'PageDown':
          event.preventDefault()
          go(1)
          return
        case ' ':
          if (onButton) return // Space activates the focused button
          event.preventDefault()
          go(event.shiftKey ? -1 : 1)
          return
        case 'ArrowLeft':
        case 'ArrowUp':
        case 'PageUp':
          event.preventDefault()
          go(-1)
          return
        case 'Home':
          event.preventDefault()
          setIndex(0)
          return
        case 'End':
          event.preventDefault()
          setIndex(Math.max(0, total - 1))
          return
        case 'f':
        case 'F':
          if (rootRef.current) {
            if (fullscreenElement()) void leaveFullscreen()
            else void enterFullscreen(rootRef.current)
          }
          return
        default:
          reveal()
      }
    }
    window.addEventListener('keydown', onKey)
    return () => window.removeEventListener('keydown', onKey)
  }, [go, total, panel, exit, reveal])

  // --- stage size → auto capacity, and fit-to-slide -------------------------
  const both = language === 'both' && prefs.showTransliteration
  useLayoutEffect(() => {
    const stage = stageRef.current
    if (!stage) return
    const measure = () => {
      const rect = stage.getBoundingClientRect()
      const portrait = window.innerWidth / Math.max(1, window.innerHeight) <= 4 / 3
      const unit = portrait
        ? Math.min(rect.height / 1080, rect.width / 720)
        : Math.min(rect.height, (rect.width * 9) / 16) / 1080
      const fontPx = prefs.fontSize * unit
      const usable = rect.height * 0.74
      const perLine = fontPx * (both ? 1.4 + 0.72 * 1.35 + 0.3 : 1.45)
      const cap = Math.max(1, Math.min(8, Math.floor(usable / Math.max(1, perLine))))
      setCapacity((prev) => (prev === cap ? prev : cap))
      // Text is sized in px from the measured stage (not container-query units,
      // which some engines don't re-resolve synchronously while fitting).
      setUnitPx((prev) => (Math.abs(prev - unit) < 0.0005 ? prev : unit))
      const w = portrait ? rect.width : Math.min(rect.width, (rect.height * 16) / 9)
      const h = portrait ? rect.height : (w * 9) / 16
      setStageBox((prev) => (Math.abs(prev.w - w) < 0.5 && Math.abs(prev.h - h) < 0.5 ? prev : { w, h }))
    }
    measure()
    if (typeof ResizeObserver === 'undefined') return
    const ro = new ResizeObserver(measure)
    ro.observe(stage)
    return () => ro.disconnect()
  }, [prefs.fontSize, both])

  // Shrink the text (never below 12% of the chosen size) until the slide's
  // content fits inside the stage; tell the presenter when that happened.
  const basePx = useRef(32)
  basePx.current = prefs.fontSize * unitPx
  const refit = useCallback(() => {
    const box = textRef.current
    // Not laid out yet (e.g. mid full-screen transition): keep the last fit.
    if (!box || box.clientHeight <= 0 || box.clientWidth <= 0) return
    // Font size is written in px directly (no CSS variables in the loop), so
    // every measurement below sees the size that was just applied.
    const apply = (f: number) => {
      box.style.fontSize = `${(basePx.current * f).toFixed(2)}px`
    }
    apply(1)
    let scale = 1
    // Content is vertically centred, so overflow can spill above the box where
    // scrollHeight can't see it: measure the children directly.
    const measure = () => {
      const cs = getComputedStyle(box)
      const padY = parseFloat(cs.paddingTop) + parseFloat(cs.paddingBottom)
      const padX = parseFloat(cs.paddingLeft) + parseFloat(cs.paddingRight)
      const kids = Array.from(box.children) as HTMLElement[]
      if (!kids.length) return { needH: 0, needW: 0, availH: 1, availW: 1 }
      const first = kids[0].getBoundingClientRect()
      const last = kids[kids.length - 1].getBoundingClientRect()
      const lastMargin = parseFloat(getComputedStyle(kids[kids.length - 1]).marginBottom) || 0
      const needW = Math.max(...kids.map((k) => k.scrollWidth))
      return {
        needH: last.bottom + lastMargin - first.top,
        needW,
        availH: box.clientHeight - padY,
        availW: box.clientWidth - padX,
      }
    }
    for (let i = 0; i < 10; i++) {
      const { needH, needW, availH, availW } = measure()
      if (availH <= 0 || availW <= 0) break
      if (needH <= availH + 1 && needW <= availW + 1) break
      const ratio = Math.min(availH / needH, availW / needW)
      scale = Math.max(0.12, scale * ratio * 0.97)
      apply(scale)
      if (scale <= 0.12) break
    }
    const reduced = scale < 0.995
    setFitReduced((prev) => (prev === reduced ? prev : reduced))
  }, [])

  useLayoutEffect(() => {
    refit()
  }, [refit, current, prefs.fontSize, prefs.align, both, unitPx, stageBox])

  // Re-fit when the stage changes size (rotation, entering/leaving full screen,
  // window resize) and once web fonts have loaded.
  useEffect(() => {
    const stage = stageRef.current
    let frame = 0
    const schedule = () => {
      cancelAnimationFrame(frame)
      frame = requestAnimationFrame(refit)
    }
    const ro = typeof ResizeObserver !== 'undefined' ? new ResizeObserver(schedule) : null
    if (stage) ro?.observe(stage)
    if (textRef.current) ro?.observe(textRef.current)
    const late = window.setTimeout(refit, 400)
    document.addEventListener('fullscreenchange', schedule)
    window.addEventListener('resize', schedule)
    const fonts = (document as Document & { fonts?: FontFaceSet }).fonts
    fonts?.ready.then(schedule).catch(() => undefined)
    fonts?.addEventListener?.('loadingdone', schedule)
    return () => {
      cancelAnimationFrame(frame)
      window.clearTimeout(late)
      ro?.disconnect()
      document.removeEventListener('fullscreenchange', schedule)
      window.removeEventListener('resize', schedule)
      fonts?.removeEventListener?.('loadingdone', schedule)
    }
  }, [refit])

  // --- swipe ------------------------------------------------------------------
  const onPointerDown = (event: ReactPointerEvent) => {
    swipeStart.current = { x: event.clientX, y: event.clientY, id: event.pointerId }
  }
  const onPointerUp = (event: ReactPointerEvent) => {
    const start = swipeStart.current
    swipeStart.current = null
    if (!start || start.id !== event.pointerId) return
    const dx = event.clientX - start.x
    const dy = event.clientY - start.y
    if (Math.abs(dx) > 48 && Math.abs(dx) > Math.abs(dy) * 1.3) {
      go(dx < 0 ? 1 : -1)
      return
    }
    if (Math.abs(dx) < 10 && Math.abs(dy) < 10) {
      // A tap toggles the controls (a reliable way to bring them back).
      if (showControls && panel === null) setControlsVisible(false)
      else reveal()
    }
  }

  // --- PowerPoint export ------------------------------------------------------
  const exportPptx = async () => {
    if (exporting) return
    setExporting(true)
    setStatus(t.downloading)
    try {
      const { downloadPptx } = await import('../../../lib/mezmur/pptxExport')
      const { fileName } = await downloadPptx({
        slides,
        title: source.title,
        fontSize: prefs.fontSize,
        theme: prefs.theme,
        highContrast: prefs.highContrast,
        align: prefs.align,
        attribution: source.attribution,
        includeAttribution: prefs.includeAttribution,
      })
      setStatus(t.downloaded(fileName))
    } catch {
      setStatus(t.downloadFailed)
    } finally {
      setExporting(false)
    }
  }

  const colors = themeColors(prefs.theme, prefs.highContrast)
  const rootStyle = {
    '--p-bg': colors.background,
    '--p-text': colors.text,
    '--p-secondary': colors.secondary,
    '--p-accent': colors.accent,
    '--p-size': String(prefs.fontSize),
  } as CSSProperties

  const languageOptions = source.languages
  const progress = total > 0 ? ((position + 1) / total) * 100 : 0

  const body = (
    <div
      ref={rootRef}
      className={`${styles.root} ${showControls ? styles.controlsOn : styles.controlsOff} ${prefs.highContrast ? styles.highContrast : ''}`}
      style={rootStyle}
      role="dialog"
      aria-modal="true"
      aria-label={`${t.dialog}: ${source.title}`}
      tabIndex={-1}
      data-testid="mezmur-presentation"
      data-fullscreen={isFullscreen ? 'true' : 'false'}
      onPointerMove={(event) => {
        if (event.pointerType === 'mouse') reveal()
      }}
      onFocusCapture={(event) => {
        if (event.target !== rootRef.current) reveal()
      }}
    >
      <header className={styles.topBar} aria-hidden={!showControls || undefined}>
        <button type="button" className={styles.exitBtn} onClick={exit} aria-label={t.exitLong} data-testid="presentation-exit">
          <span aria-hidden="true">✕</span>
          <span className={styles.btnText}>{t.exit}</span>
        </button>
        <p className={styles.deckTitle} lang={source.original?.isEthiopic ? source.original.code : undefined}>{source.title}</p>
        <div className={styles.topActions}>
          <button
            type="button"
            className={styles.iconBtn}
            onClick={() => setPanel((p) => (p === 'overview' ? null : 'overview'))}
            aria-expanded={panel === 'overview'}
            aria-controls={overviewId}
            aria-label={t.overviewLong}
            title={t.overviewLong}
          >
            <span aria-hidden="true">▦</span>
            <span className={styles.btnText}>{t.overview}</span>
          </button>
          <button
            ref={settingsBtnRef}
            type="button"
            className={styles.iconBtn}
            onClick={() => setPanel((p) => (p === 'settings' ? null : 'settings'))}
            aria-expanded={panel === 'settings'}
            aria-controls={settingsId}
            aria-label={t.settingsLong}
            title={t.settingsLong}
            data-testid="presentation-settings-toggle"
          >
            <span aria-hidden="true">Aa</span>
            <span className={styles.btnText}>{t.settings}</span>
          </button>
          {canFullscreen ? (
            <button
              type="button"
              className={styles.iconBtn}
              onClick={() => {
                if (!rootRef.current) return
                if (isFullscreen) void leaveFullscreen()
                else void enterFullscreen(rootRef.current)
              }}
              aria-pressed={isFullscreen}
              aria-label={isFullscreen ? t.exitFullscreen : t.fullscreen}
              title={isFullscreen ? t.exitFullscreen : t.fullscreen}
            >
              <span aria-hidden="true">{isFullscreen ? '⤡' : '⛶'}</span>
            </button>
          ) : null}
        </div>
      </header>

      <div
        ref={stageRef}
        className={styles.stageArea}
        onPointerDown={onPointerDown}
        onPointerUp={onPointerUp}
        onPointerCancel={() => {
          swipeStart.current = null
        }}
      >
        <div className={styles.stage} data-testid="presentation-stage" style={{ '--p-unit': `${unitPx}px`, ...(stageBox.w ? { width: `${stageBox.w}px`, height: `${stageBox.h}px` } : {}) } as CSSProperties}>
          {current?.type === 'title' ? (
            <div ref={textRef} className={`${styles.text} ${styles.titleSlide}`} data-align="center">
              <h2 className={styles.slideTitle} lang={current.isEthiopic ? current.lang : undefined}>
                {current.title}
              </h2>
              {current.subtitle ? <p className={styles.slideSubtitle}>{current.subtitle}</p> : null}
              {current.singer ? <p className={styles.slideSinger}>{current.singer}</p> : null}
            </div>
          ) : current ? (
            <div
              ref={textRef}
              className={`${styles.text} ${current.isEthiopic ? styles.ethiopic : styles.latin}`}
              data-align={prefs.align}
              data-testid="presentation-slide-text"
            >
              {current.label ? <p className={styles.label}>{current.label}</p> : null}
              <div className={styles.lines} lang={current.lang}>
                {current.lines.map((line, i) => (
                  <p key={i} className={styles.line}>
                    <span className={styles.primary}>{line.text}</span>
                    {line.secondary ? (
                      <span className={styles.secondary} lang="en">
                        {line.secondary}
                      </span>
                    ) : null}
                  </p>
                ))}
              </div>
            </div>
          ) : (
            <div ref={textRef} className={styles.text} data-align="center">
              <p className={styles.empty}>{t.noLyrics}</p>
            </div>
          )}
        </div>
      </div>

      <footer className={styles.bottomBar} aria-hidden={!showControls || undefined}>
        <button type="button" className={styles.navBtn} onClick={() => go(-1)} disabled={position <= 0} aria-label={t.prev} data-testid="presentation-prev">
          <span aria-hidden="true">←</span>
        </button>
        <div className={styles.progressWrap}>
          <span className={styles.counter} data-testid="presentation-counter">
            {total ? position + 1 : 0} / {total}
          </span>
          <div
            className={styles.progress}
            role="progressbar"
            aria-label={t.slideOf(total ? position + 1 : 0, total)}
            aria-valuemin={1}
            aria-valuemax={Math.max(1, total)}
            aria-valuenow={total ? position + 1 : 0}
          >
            <span style={{ width: `${progress}%` }} />
          </div>
          {fitReduced ? (
            <p className={styles.fitWarning} role="status" data-testid="presentation-fit-warning">
              {t.fitWarning}
            </p>
          ) : null}
        </div>
        <button type="button" className={styles.navBtn} onClick={() => go(1)} disabled={position >= total - 1} aria-label={t.next} data-testid="presentation-next">
          <span aria-hidden="true">→</span>
        </button>
      </footer>

      <p className={styles.srOnly} aria-live="polite">
        {total ? t.slideOf(position + 1, total) : ''}
      </p>
      {!showControls ? <p className={styles.peekHint} aria-hidden="true">{t.hint}</p> : null}

      {panel === 'overview' ? (
        <aside id={overviewId} className={styles.panel} aria-label={t.overviewLong} data-testid="presentation-overview">
          <div className={styles.panelHead}>
            <h2>{t.overviewLong}</h2>
            <button type="button" className={styles.iconBtn} onClick={() => setPanel(null)} aria-label={t.close}>
              ✕
            </button>
          </div>
          <ol className={styles.overviewList}>
            {slides.map((slide, i) => (
              <li key={slide.id}>
                <button
                  type="button"
                  className={styles.overviewItem}
                  aria-current={i === position ? 'true' : undefined}
                  onClick={() => {
                    setIndex(i)
                    setPanel(null)
                  }}
                >
                  <span className={styles.overviewNum}>{i + 1}</span>
                  <span className={styles.overviewText} lang={slide.isEthiopic ? slide.lang : undefined}>
                    {slide.type === 'title' ? `${t.titleSlideLabel}: ${slide.title}` : slide.lines.map((l) => l.text).join(' / ')}
                  </span>
                </button>
              </li>
            ))}
          </ol>
        </aside>
      ) : null}

      {panel === 'settings' ? (
        <aside id={settingsId} className={styles.panel} aria-label={t.settingsLong} data-testid="presentation-settings">
          <div className={styles.panelHead}>
            <h2>{t.settingsLong}</h2>
            <button type="button" className={styles.iconBtn} onClick={() => setPanel(null)} aria-label={t.close}>
              ✕
            </button>
          </div>

          <fieldset className={styles.field}>
            <legend>{t.language}</legend>
            <div className={styles.segmented}>
              {languageOptions.map((option) => (
                <button
                  key={option.id}
                  type="button"
                  aria-pressed={language === option.id}
                  disabled={!option.available}
                  title={option.available ? undefined : option.reason}
                  onClick={() => update('language', option.id)}
                  data-testid={`presentation-lang-${option.id}`}
                >
                  {uiLocale === 'am' ? option.labelAm : option.labelEn}
                </button>
              ))}
            </div>
            {language === 'both' && source.bothAlignment === 'sections' ? <p className={styles.note}>{t.approx}</p> : null}
          </fieldset>

          <fieldset className={styles.field}>
            <legend>{t.lines}</legend>
            <div className={styles.segmented}>
              {LINES_PER_SLIDE_OPTIONS.map((value) => (
                <button
                  key={String(value)}
                  type="button"
                  aria-pressed={prefs.linesPerSlide === value}
                  onClick={() => update('linesPerSlide', value)}
                  data-testid={`presentation-lines-${value}`}
                >
                  {value === 'auto' ? t.auto : value}
                </button>
              ))}
            </div>
          </fieldset>

          <fieldset className={styles.field}>
            <legend>{t.size}</legend>
            <div className={styles.sizeRow}>
              <button
                type="button"
                className={styles.sizeBtn}
                onClick={() => update('fontSize', Math.max(FONT_MIN, prefs.fontSize - FONT_STEP))}
                disabled={prefs.fontSize <= FONT_MIN}
                aria-label={t.smaller}
                data-testid="presentation-font-down"
              >
                A−
              </button>
              <input
                type="range"
                min={FONT_MIN}
                max={FONT_MAX}
                step={FONT_STEP}
                value={prefs.fontSize}
                onChange={(event) => update('fontSize', Number(event.target.value))}
                aria-label={t.size}
                aria-valuetext={`${prefs.fontSize}`}
              />
              <output className={styles.sizeValue} data-testid="presentation-font-value">{prefs.fontSize}</output>
              <button
                type="button"
                className={styles.sizeBtn}
                onClick={() => update('fontSize', Math.min(FONT_MAX, prefs.fontSize + FONT_STEP))}
                disabled={prefs.fontSize >= FONT_MAX}
                aria-label={t.larger}
                data-testid="presentation-font-up"
              >
                A+
              </button>
            </div>
          </fieldset>

          <fieldset className={styles.field}>
            <legend>{t.align}</legend>
            <div className={styles.segmented}>
              {(['left', 'center'] as const).map((value) => (
                <button key={value} type="button" aria-pressed={prefs.align === value} onClick={() => update('align', value)}>
                  {value === 'left' ? t.left : t.center}
                </button>
              ))}
            </div>
          </fieldset>

          <fieldset className={styles.field}>
            <legend>{t.theme}</legend>
            <div className={styles.segmented}>
              {(Object.keys(PRESENTATION_THEMES) as PresentationTheme[]).map((value) => (
                <button
                  key={value}
                  type="button"
                  aria-pressed={prefs.theme === value}
                  onClick={() => update('theme', value)}
                  data-testid={`presentation-theme-${value}`}
                >
                  <span className={styles.swatch} style={{ background: PRESENTATION_THEMES[value].colors.background }} aria-hidden="true" />
                  {uiLocale === 'am' ? PRESENTATION_THEMES[value].labelAm : PRESENTATION_THEMES[value].labelEn}
                </button>
              ))}
            </div>
          </fieldset>

          <div className={styles.toggles}>
            <label>
              <input type="checkbox" checked={prefs.showTitle} onChange={(e) => update('showTitle', e.target.checked)} data-testid="presentation-title-toggle" />
              {t.titleSlide}
            </label>
            <label>
              <input type="checkbox" checked={prefs.grouping} onChange={(e) => update('grouping', e.target.checked)} />
              {t.grouping}
            </label>
            <label className={language === 'both' ? undefined : styles.disabledLabel}>
              <input
                type="checkbox"
                checked={prefs.showTransliteration}
                disabled={language !== 'both'}
                onChange={(e) => update('showTransliteration', e.target.checked)}
              />
              {t.translit}
            </label>
            <label>
              <input type="checkbox" checked={prefs.highContrast} onChange={(e) => update('highContrast', e.target.checked)} />
              {t.contrast}
            </label>
            {source.attribution ? (
              <label>
                <input type="checkbox" checked={prefs.includeAttribution} onChange={(e) => update('includeAttribution', e.target.checked)} />
                {t.attribution}
              </label>
            ) : null}
          </div>

          <button type="button" className={styles.downloadBtn} onClick={exportPptx} disabled={exporting || !slides.length} data-testid="presentation-download-pptx">
            {exporting ? t.downloading : t.download}
          </button>
          <p className={styles.panelStatus} role="status" aria-live="polite">
            {status}
          </p>
        </aside>
      ) : null}
    </div>
  )

  return createPortal(body, document.body)
}
