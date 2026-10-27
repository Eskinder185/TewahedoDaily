import { useEffect, useMemo, useRef, useState } from 'react'
import type { PublicMezmur } from '../../lib/publicContent/service'
import {
  buildPrintableLyricsHtml,
  buildSlides,
  formatLyricsForCopy,
  parseLyricSections,
  shareHymnLink,
} from '../../lib/hymns/lyrics'
import { parseStructuredLyrics } from '../../lib/mezmur/structuredLyricsParser'
import {
  buildLiveLyricsInfo,
  type LiveLyricsSlide,
  type LivePresentationMode,
} from '../../lib/mezmur/liveLyrics'
import { useLocale } from '../../lib/i18n/locale'
import styles from './HymnLyricsExperience.module.css'

export type LyricsTheme = 'parchment' | 'ivory' | 'gold' | 'navy' | 'dark'
export type LyricsFontSize = 18 | 22 | 26 | 32

type Props = {
  item: PublicMezmur
  canonical: string
  isLoading?: boolean
  isError?: boolean
  onRetry?: () => void
}

type LyricLanguageId = 'am' | 'gez' | 'en' | 'om' | 'ti' | 'transliteration' | 'both'

interface AvailableLyric {
  id: LyricLanguageId
  labelEn: string
  labelAm: string
  lyrics: string
  isEthiopic: boolean
  langCode: string
}

const labels = {
  en: {
    tools: 'Lyrics tools',
    copy: 'Copy',
    copied: 'Lyrics copied',
    share: 'Share',
    pdf: 'PDF',
    slides: 'Slides',
    live: 'Live',
    unavailable: 'Lyrics are not available for this hymn.',
    fetchErrorTitle: 'Unable to load lyrics',
    fetchErrorText:
      'Could not load lyrics for this hymn. Please check your connection and try again.',
    tryAgain: 'Try again',
    notRepublishedTitle: 'Hymn lyrics',
    notRepublishedText:
      'The lyrics are not republished on TewahedoDaily. Listen with the video or open the authorized source.',
    missingLyricsTitle: 'Lyrics transcription pending',
    missingLyricsText:
      'Lyrics have not been transcribed for this hymn yet. You can still listen to the recording or contribute the lyrics.',
    contributeLyrics: 'Contribute lyrics',
    loadingLyrics: 'Loading lyrics...',
    openSource: 'Open authorized source ↗',
    reader: 'Lyrics reader',
    textSize: 'Size',
    theme: 'Theme',
    languageTabsLabel: 'Lyric languages',
    numbering: 'Verse numbers',
    transliteration: 'Transliteration',
    inlineTransliteration: 'Show transliteration below',
    attribution: 'Include source attribution',
    close: 'Close',
    previous: 'Previous slide',
    next: 'Next slide',
    fullscreen: 'Toggle fullscreen',
    lines: 'Lines per slide',
    printSlides: 'Print / save slides as PDF',
    printLyrics: 'Print / save as PDF',
  },
  am: {
    tools: 'የመዝሙር መሣሪያዎች',
    copy: 'ቅዳ',
    copied: 'ግጥሙ ተቀድቷል',
    share: 'አጋራ',
    pdf: 'PDF',
    slides: 'ስላይዶች',
    live: 'በቀጥታ',
    unavailable: 'የዚህ መዝሙር ግጥም አልተገኘም።',
    fetchErrorTitle: 'ግጥሙን መጫን አልተቻለም',
    fetchErrorText:
      'የዚህን መዝሙር ግጥም መጫን አልተቻለም። እባክዎ ግንኙነትዎን ያረጋግጡና እንደገና ይሞክሩ።',
    tryAgain: 'እንደገና ሞክር',
    notRepublishedTitle: 'የመዝሙር ግጥም',
    notRepublishedText:
      'ግጥሙ በTewahedoDaily ላይ አልተባዛም። መዝሙሩን በቪዲዮው ያዳምጡ ወይም የተፈቀደውን ምንጭ ይክፈቱ።',
    missingLyricsTitle: 'የመዝሙር ግጥም ገና አልተጻፈም',
    missingLyricsText:
      'የዚህ መዝሙር ግጥም ገና አልተጻፈም። መዝሙሩን በቪዲዮው ማዳመጥ ወይም ግጥሙን ማበርከት ይችላሉ።',
    contributeLyrics: 'ግጥም አበርክት',
    loadingLyrics: 'ግጥም በመጫን ላይ...',
    openSource: 'የተፈቀደውን ምንጭ ክፈት ↗',
    reader: 'የመዝሙር ንባብ',
    textSize: 'መጠን',
    theme: 'ገጽታ',
    languageTabsLabel: 'የግጥም ቋንቋዎች',
    numbering: 'የቁጥር ምልክቶች',
    transliteration: 'በላቲን ፊደል',
    inlineTransliteration: 'የላቲን ንባብ ከሥር አሳይ',
    attribution: 'የምንጭ ማጣቀሻ አክል',
    close: 'ዝጋ',
    previous: 'የቀደመው',
    next: 'ቀጣይ',
    fullscreen: 'ሙሉ ማያ',
    lines: 'በስላይድ ያሉ መስመሮች',
    printSlides: 'ስላይዶችን አትም / PDF አስቀምጥ',
    printLyrics: 'አትም / PDF አስቀምጥ',
  },
} as const

function openPrintDocument(html: string) {
  const target = window.open('', '_blank')
  if (!target) throw new Error('Pop-up blocked. Allow pop-ups to create the printable document.')
  target.opener = null
  target.document.open()
  target.document.write(html)
  target.document.close()
  target.setTimeout(() => target.print(), 250)
}

function safeExternalLink(value: string | null | undefined): string | null {
  if (!value?.trim()) return null
  try {
    const url = new URL(value)
    return url.protocol === 'https:' ? url.href : null
  } catch {
    return null
  }
}

export function HymnLyricsExperience({ item, canonical, isLoading = false, isError = false, onRetry }: Props) {
  const { uiLocale } = useLocale()
  const t = labels[uiLocale]
  const lyricsTigrinya = (item as { lyrics_tigrinya?: string | null }).lyrics_tigrinya

  // Detect all non-empty lyric columns
  const availableLangs = useMemo<AvailableLyric[]>(() => {
    const list: AvailableLyric[] = []
    const amharic = item.lyrics_amharic?.trim()
    const geez = item.lyrics_geez?.trim()
    const english = item.lyrics_english?.trim()
    const oromo = item.lyrics_oromo?.trim()
    const tigrinyaExplicit = lyricsTigrinya?.trim()
    const transliteration = (item.lyrics_transliteration || item.transliteration)?.trim()

    const prime = (item.language || item.primary_language || '').toLowerCase()
    const isTigrinyaPrimary = prime === 'ti' || prime === 'tigrinya'

    if (tigrinyaExplicit) {
      list.push({
        id: 'ti',
        labelEn: 'Tigrinya',
        labelAm: 'ትግርኛ',
        lyrics: tigrinyaExplicit,
        isEthiopic: true,
        langCode: 'ti',
      })
    }

    if (amharic) {
      if (isTigrinyaPrimary && !tigrinyaExplicit) {
        list.push({
          id: 'ti',
          labelEn: 'Tigrinya',
          labelAm: 'ትግርኛ',
          lyrics: amharic,
          isEthiopic: true,
          langCode: 'ti',
        })
      } else {
        list.push({
          id: 'am',
          labelEn: 'Amharic',
          labelAm: 'አማርኛ',
          lyrics: amharic,
          isEthiopic: true,
          langCode: 'am',
        })
      }
    }
    if (geez) {
      list.push({
        id: 'gez',
        labelEn: 'Geʽez',
        labelAm: 'ግዕዝ',
        lyrics: geez,
        isEthiopic: true,
        langCode: 'gez',
      })
    }
    if (english) {
      list.push({
        id: 'en',
        labelEn: 'English',
        labelAm: 'English',
        lyrics: english,
        isEthiopic: false,
        langCode: 'en',
      })
    }
    if (oromo) {
      list.push({
        id: 'om',
        labelEn: 'Oromo',
        labelAm: 'Afaan Oromoo',
        lyrics: oromo,
        isEthiopic: false,
        langCode: 'om',
      })
    }
    if (transliteration) {
      list.push({
        id: 'transliteration',
        labelEn: 'Transliteration',
        labelAm: 'ላቲን (ድምጽ)',
        lyrics: transliteration,
        isEthiopic: false,
        langCode: 'en',
      })
    }

    // Both option: paired original Ethiopic text and Latin transliteration
    const hasEthiopicText = Boolean(amharic || geez || tigrinyaExplicit)
    if (hasEthiopicText && transliteration) {
      list.push({
        id: 'both',
        labelEn: 'Both',
        labelAm: 'ጎን ለጎን (ሁለቱም)',
        lyrics: amharic || geez || tigrinyaExplicit || '',
        isEthiopic: true,
        langCode: 'both',
      })
    }

    return list
  }, [
    item.lyrics_amharic,
    item.lyrics_geez,
    item.lyrics_english,
    item.lyrics_oromo,
    item.lyrics_transliteration,
    item.transliteration,
    lyricsTigrinya,
    item.language,
    item.primary_language,
  ])

  // Initial selected language based on mezmur primary language
  const defaultLangId = useMemo<LyricLanguageId>(() => {
    if (!availableLangs.length) return 'am'
    const prime = (item.language || item.primary_language || '').toLowerCase()
    if (prime.startsWith('gez') || prime === 'geez') {
      const match = availableLangs.find((l) => l.id === 'gez')
      if (match) return match.id
    }
    if (prime.startsWith('ti') || prime === 'tigrinya') {
      const match = availableLangs.find((l) => l.id === 'ti')
      if (match) return match.id
    }
    if (prime.startsWith('en')) {
      const match = availableLangs.find((l) => l.id === 'en')
      if (match) return match.id
    }
    if (prime.startsWith('om')) {
      const match = availableLangs.find((l) => l.id === 'om')
      if (match) return match.id
    }
    return availableLangs[0].id
  }, [availableLangs, item.language, item.primary_language])

  const [selectedLang, setSelectedLang] = useState<LyricLanguageId | null>(null)

  // Derived active language: if user selected a language that exists, use it; otherwise fallback to defaultLangId
  const activeLang =
    selectedLang && availableLangs.some((l) => l.id === selectedLang)
      ? selectedLang
      : defaultLangId

  const currentLyric = availableLangs.find((l) => l.id === activeLang) || availableLangs[0]
  const currentLyricsText = currentLyric?.lyrics || ''
  const sections = useMemo(() => parseLyricSections(currentLyricsText), [currentLyricsText])

  const isBothMode = activeLang === 'both'
  const origTextForBoth =
    item.lyrics_amharic ||
    item.lyrics_geez ||
    ((item as { lyrics_tigrinya?: string | null }).lyrics_tigrinya) ||
    ''
  const translitTextForBoth = item.lyrics_transliteration || item.transliteration || ''
  const structuredBoth = useMemo(
    () => parseStructuredLyrics(origTextForBoth, translitTextForBoth, item.lyrics_english || undefined),
    [origTextForBoth, translitTextForBoth, item.lyrics_english]
  )

  const [message, setMessage] = useState('')
  const [includeAttribution, setIncludeAttribution] = useState(true)
  const [fontSize, setFontSize] = useState<LyricsFontSize>(22)
  const [readerTheme, setReaderTheme] = useState<LyricsTheme>('parchment')
  const [numbered, setNumbered] = useState(true)
  const [showTransliteration, setShowTransliteration] = useState(true)
  const [linesPerSlide, setLinesPerSlide] = useState(4)
  const [presentation, setPresentation] = useState<'preview' | 'live' | null>(null)
  const [slideIndex, setSlideIndex] = useState(0)
  const [liveFontSize, setLiveFontSize] = useState(48)
  const [userLiveMode, setUserLiveMode] = useState<LivePresentationMode | null>(null)
  const liveRef = useRef<HTMLDivElement>(null)

  const isLive = presentation === 'live'
  const liveInfo = useMemo(() => buildLiveLyricsInfo(item), [item])

  const effectiveLiveMode = useMemo<LivePresentationMode>(() => {
    if (userLiveMode === 'both' && liveInfo.hasOriginal && liveInfo.hasTransliteration) return 'both'
    if (userLiveMode === 'transliteration' && liveInfo.hasTransliteration) return 'transliteration'
    if (userLiveMode === 'original' && liveInfo.hasOriginal) return 'original'
    return liveInfo.defaultMode
  }, [userLiveMode, liveInfo.defaultMode, liveInfo.hasOriginal, liveInfo.hasTransliteration])

  // In Live mode, slides are synchronized section-for-section across original and transliteration;
  // in Preview mode, slides are chunked by linesPerSlide.
  const previewSlides = useMemo(() => buildSlides(sections, linesPerSlide), [sections, linesPerSlide])
  const activeSlideList = isLive ? liveInfo.slides : previewSlides
  const totalSlideCount = activeSlideList.length

  const activeSlide = activeSlideList[Math.min(slideIndex, Math.max(0, totalSlideCount - 1))]
  const activeLiveSlide = isLive ? (activeSlide as LiveLyricsSlide | undefined) : undefined
  const attribution = item.source || null
  const sourceUrl = safeExternalLink(item.source)

  // Dedicated transliteration content for inline view when reading a non-transliteration version
  const inlineTransliteration =
    activeLang !== 'transliteration'
      ? (item.lyrics_transliteration || item.transliteration)?.trim()
      : null

  useEffect(() => {
    if (!presentation) return
    const onKey = (event: KeyboardEvent) => {
      if (event.key === 'Escape') setPresentation(null)
      if (event.key === 'ArrowRight' || event.key === 'ArrowDown')
        setSlideIndex((value) => Math.min(totalSlideCount - 1, value + 1))
      if (event.key === 'ArrowLeft' || event.key === 'ArrowUp')
        setSlideIndex((value) => Math.max(0, value - 1))
    }
    window.addEventListener('keydown', onKey)
    return () => window.removeEventListener('keydown', onKey)
  }, [presentation, totalSlideCount])

  const copyLyrics = async () => {
    const text = formatLyricsForCopy({
      title: item.title_amharic || item.title,
      subtitle: item.title_amharic ? item.title : null,
      performer: item.singer_name,
      sections,
      attribution,
      includeAttribution,
    })
    try {
      await navigator.clipboard.writeText(text)
    } catch {
      window.prompt('Copy lyrics', text)
    }
    setMessage(t.copied)
    window.setTimeout(() => setMessage(''), 1800)
  }

  const share = async () => {
    const data = { title: item.title_amharic || item.title, text: item.title, url: canonical }
    try {
      const result = await shareHymnLink(navigator, data)
      if (result === 'copied') {
        setMessage(uiLocale === 'am' ? 'ማገናኛው ተቀድቷል' : 'Link copied')
      }
    } catch (error) {
      if ((error as DOMException)?.name !== 'AbortError') window.prompt('Copy link', canonical)
    }
  }

  const printLyrics = () => {
    try {
      openPrintDocument(
        buildPrintableLyricsHtml({
          title: item.title_amharic || item.title,
          subtitle: item.title_amharic ? item.title : null,
          performer: item.singer_name,
          metadata: [item.category_name || item.category || '', item.occasion || ''].filter(
            Boolean,
          ),
          sections,
          attribution,
        }),
      )
    } catch (error) {
      setMessage(error instanceof Error ? error.message : 'Unable to open PDF view.')
    }
  }

  const printSlides = () => {
    try {
      openPrintDocument(
        buildPrintableLyricsHtml({
          title: item.title_amharic || item.title,
          sections: previewSlides.map((slide) => ({ ...slide, kind: 'other' as const })),
          attribution,
          slides: true,
          theme: readerTheme === 'dark' ? 'dark' : 'parchment',
        }),
      )
    } catch (error) {
      setMessage(error instanceof Error ? error.message : 'Unable to open slide view.')
    }
  }

  const toggleFullscreen = async () => {
    try {
      if (document.fullscreenElement) await document.exitFullscreen()
      else await liveRef.current?.requestFullscreen()
    } catch {
      setMessage('Fullscreen is not available in this browser.')
    }
  }

  // State 1: Fetch Error State
  if (isError) {
    return (
      <section
        className={styles.unavailable}
        aria-labelledby="lyrics-error-title"
        data-testid="lyrics-error-state"
        role="alert"
      >
        <div className={styles.noticeIcon} aria-hidden="true">
          ⚠️
        </div>
        <h2 id="lyrics-error-title">{t.fetchErrorTitle}</h2>
        <p role="status">{t.fetchErrorText}</p>
        {onRetry ? (
          <p className={styles.sourceAction}>
            <button type="button" onClick={onRetry} className={styles.contributeButton}>
              {t.tryAgain}
            </button>
          </p>
        ) : null}
      </section>
    )
  }

  // State 2: Loading State
  if (isLoading) {
    return (
      <section
        className={styles.loadingState}
        aria-busy="true"
        role="status"
        data-testid="lyrics-loading-state"
      >
        <div className={styles.loadingSpinner} aria-hidden="true" />
        <p>{t.loadingLyrics}</p>
      </section>
    )
  }

  // State 3 & 4: No authorized lyrics available
  if (availableLangs.length === 0) {
    const isExplicitlyRestricted =
      item.rights_status === 'external_only' ||
      item.rights_status === 'restricted'

    // If lyrics are stored but restricted from public display:
    if (isExplicitlyRestricted) {
      return (
        <section
          className={styles.unavailable}
          aria-labelledby="lyrics-restricted-title"
          data-testid="lyrics-restricted-state"
        >
          <div className={styles.noticeIcon} aria-hidden="true">
            🔒
          </div>
          <h2 id="lyrics-restricted-title">{t.notRepublishedTitle}</h2>
          <p role="status">{t.notRepublishedText}</p>
          {sourceUrl ? (
            <p className={styles.sourceAction}>
              <a
                id="source-link"
                href={sourceUrl}
                target="_blank"
                rel="noreferrer"
                className={styles.sourceLink}
              >
                {t.openSource}
              </a>
            </p>
          ) : null}
        </section>
      )
    }

    // Missing Lyrics Notice (Genuinely not transcribed)
    const contributeParams = new URLSearchParams()
    if (item.id) contributeParams.set('content_id', item.id)
    if (item.title_amharic || item.title) {
      contributeParams.set('title', item.title_amharic || item.title)
    }
    contributeParams.set('type', 'lyrics')
    if (canonical) contributeParams.set('page', canonical)
    const contributeHref = `/suggest-correction?${contributeParams.toString()}`

    return (
      <section
        className={styles.missingLyricsNotice}
        aria-labelledby="lyrics-missing-title"
        data-testid="lyrics-missing-state"
      >
        <div className={styles.noticeIcon} aria-hidden="true">
          ✍️
        </div>
        <h2 id="lyrics-missing-title">{t.missingLyricsTitle}</h2>
        <p role="status">{t.missingLyricsText}</p>
        <div className={styles.missingActions}>
          <a id="contribute-link" href={contributeHref} className={styles.contributeButton}>
            {t.contributeLyrics}
          </a>
          {sourceUrl ? (
            <a
              id="source-link"
              href={sourceUrl}
              target="_blank"
              rel="noreferrer"
              className={styles.sourceLink}
            >
              {t.openSource}
            </a>
          ) : null}
        </div>
      </section>
    )
  }

  // State 4: Full Active Reading Experience
  const themeClass =
    readerTheme === 'dark'
      ? styles.themeDark
      : readerTheme === 'navy'
        ? styles.themeNavy
        : readerTheme === 'gold'
          ? styles.themeGold
          : readerTheme === 'ivory'
            ? styles.themeIvory
            : styles.themeParchment

  const typographyClass = currentLyric.isEthiopic ? styles.ethiopicTypography : styles.latinTypography

  return (
    <section
      className={styles.experience}
      aria-labelledby="lyrics-tools-title"
      data-testid="lyrics-reading-experience"
    >
      {/* Header bar */}
      <div className={styles.toolsHeader}>
        <div>
          <p className={styles.eyebrow}>{t.tools}</p>
          <h2 id="lyrics-tools-title">{item.title_amharic || item.title}</h2>
          {item.title_amharic && item.title ? (
            <p className={styles.subtitle}>{item.title}</p>
          ) : null}
        </div>
        <div className={styles.actions} role="toolbar" aria-label={t.tools}>
          <button type="button" onClick={copyLyrics}>
            {t.copy}
          </button>
          <button type="button" onClick={share}>
            {t.share}
          </button>
          <button type="button" onClick={printLyrics}>
            {t.pdf}
          </button>
          <button
            type="button"
            onClick={() => {
              setSlideIndex(0)
              setPresentation('preview')
            }}
          >
            {t.slides}
          </button>
          <button
            type="button"
            className={styles.liveButton}
            onClick={() => {
              setSlideIndex(0)
              setPresentation('live')
            }}
          >
            {t.live}
          </button>
        </div>
      </div>

      {/* Language Tabs Selector (when multiple versions exist) */}
      {availableLangs.length > 1 ? (
        <div
          className={styles.languageTabsBar}
          role="tablist"
          aria-label={t.languageTabsLabel}
        >
          {availableLangs.map((tab) => (
            <button
              key={tab.id}
              id={`lyrics-tab-${tab.id}`}
              type="button"
              role="tab"
              aria-selected={activeLang === tab.id}
              aria-controls={`lyrics-tabpanel-${tab.id}`}
              className={`${styles.languageTab} ${activeLang === tab.id ? styles.languageTabActive : ''}`}
              onClick={() => setSelectedLang(tab.id)}
            >
              {uiLocale === 'am' ? tab.labelAm : tab.labelEn}
            </button>
          ))}
        </div>
      ) : null}

      {/* Reading Options & Controls */}
      <div className={styles.options}>
        {/* Font size segmented buttons: S (18px), M (22px), L (26px), XL (32px) */}
        <div className={styles.controlGroup}>
          <span className={styles.controlLabel}>{t.textSize}:</span>
          <div className={styles.segmented} role="group" aria-label={t.textSize}>
            {([18, 22, 26, 32] as const).map((sz) => (
              <button
                key={sz}
                type="button"
                aria-pressed={fontSize === sz}
                className={fontSize === sz ? styles.segmentedActive : ''}
                onClick={() => setFontSize(sz)}
              >
                {sz === 18 ? 'S' : sz === 22 ? 'M' : sz === 26 ? 'L' : 'XL'}
              </button>
            ))}
          </div>
        </div>

        {/* 5 Reading Themes: Parchment, Ivory, Gold, Navy, Dark */}
        <div className={styles.controlGroup}>
          <span className={styles.controlLabel}>{t.theme}:</span>
          <div className={styles.segmented} role="group" aria-label={t.theme}>
            {(['parchment', 'ivory', 'gold', 'navy', 'dark'] as const).map((thm) => (
              <button
                key={thm}
                type="button"
                aria-pressed={readerTheme === thm}
                className={readerTheme === thm ? styles.segmentedActive : ''}
                onClick={() => setReaderTheme(thm)}
              >
                {thm === 'parchment'
                  ? 'Parchment'
                  : thm === 'ivory'
                    ? 'Ivory'
                    : thm === 'gold'
                      ? 'Gold'
                      : thm === 'navy'
                        ? 'Navy'
                        : 'Dark'}
              </button>
            ))}
          </div>
        </div>

        <label className={styles.checkboxLabel}>
          <input
            type="checkbox"
            checked={numbered}
            onChange={(event) => setNumbered(event.target.checked)}
          />{' '}
          {t.numbering}
        </label>

        <label className={styles.checkboxLabel}>
          <input
            type="checkbox"
            checked={includeAttribution}
            onChange={(event) => setIncludeAttribution(event.target.checked)}
          />{' '}
          {t.attribution}
        </label>

        {inlineTransliteration ? (
          <label className={styles.checkboxLabel}>
            <input
              type="checkbox"
              checked={showTransliteration}
              onChange={(event) => setShowTransliteration(event.target.checked)}
            />{' '}
            {t.inlineTransliteration}
          </label>
        ) : null}
      </div>

      {/* Active Tab Panel with Lyrics */}
      <div
        id={`lyrics-tabpanel-${currentLyric.id}`}
        role="tabpanel"
        aria-labelledby={`lyrics-tab-${currentLyric.id}`}
        className={`${styles.reader} ${themeClass}`}
        style={{ '--reader-size': `${fontSize}px` } as React.CSSProperties}
      >
        <h3 className={styles.readerHeading}>{t.reader}</h3>
        {isBothMode ? (
          <div className={styles.bothContainer} data-testid="lyrics-both-container">
            {structuredBoth.sections.map((sec, idx) => {
              const displayLabel = numbered
                ? uiLocale === 'am'
                  ? sec.labelAmharic
                  : sec.label
                : sec.kind === 'chorus'
                  ? uiLocale === 'am'
                    ? sec.labelAmharic
                    : sec.label
                  : ''
              return (
                <article key={sec.id || idx} className={styles.section}>
                  {displayLabel ? <p className={styles.sectionLabel}>{displayLabel}</p> : null}
                  <div className={styles.bothPairedSection}>
                    {sec.lines.map((line) => (
                      <div key={line.id} className={styles.linePair}>
                        <span className={`${styles.lineOriginal} ${styles.ethiopicTypography}`}>
                          {line.cleanOriginal}
                          {line.repetitionCount > 1 ? ` (${line.repetitionCount}×)` : ''}
                        </span>
                        {line.cleanTransliteration ? (
                          <span className={`${styles.lineTranslit} ${styles.latinTypography}`}>
                            {line.cleanTransliteration}
                            {line.repetitionCount > 1 ? ` (${line.repetitionCount}×)` : ''}
                          </span>
                        ) : null}
                      </div>
                    ))}
                  </div>
                </article>
              )
            })}
          </div>
        ) : (
          sections.map((section) => {
            const displayLabel = numbered ? section.label : section.kind === 'chorus' ? section.label : ''
            return (
              <article key={section.id} className={styles.section}>
                {displayLabel ? <p className={styles.sectionLabel}>{displayLabel}</p> : null}
                <p
                  lang={currentLyric.langCode}
                  className={`${styles.stanzaText} ${typographyClass}`}
                >
                  {section.lines.join('\n')}
                </p>
              </article>
            )
          })
        )}

        {/* Inline transliteration view if enabled and not already on transliteration tab */}
        {showTransliteration && inlineTransliteration ? (
          <div className={styles.transliteration}>
            <h3>{t.transliteration}</h3>
            <p>{inlineTransliteration}</p>
          </div>
        ) : null}
      </div>

      <p className={styles.status} role="status" aria-live="polite">
        {message}
      </p>

      {/* Slide / Live Presentation Dialog */}
      {presentation && activeSlide ? (
        <div
          ref={liveRef}
          className={`${styles.presentation} ${
            readerTheme === 'dark'
              ? styles.presentationDark
              : readerTheme === 'ivory'
                ? styles.presentationIvory
                : readerTheme === 'gold'
                  ? styles.presentationGold
                  : readerTheme === 'navy'
                    ? styles.presentationNavy
                    : styles.presentationParchment
          }`}
          role="dialog"
          aria-modal="true"
          aria-label={isLive ? t.live : t.slides}
          data-testid="presentation-dialog"
        >
          <div className={styles.presentationTop}>
            <span>{activeSlide.label}</span>
            <span data-testid="live-slide-counter">
              {slideIndex + 1} / {totalSlideCount}
            </span>
          </div>

          {isLive && activeLiveSlide ? (
            <div className={styles.liveSlideContainer} data-testid="live-slide-container">
              {effectiveLiveMode === 'both' ? (
                <div className={styles.liveBothContainer}>
                  {activeLiveSlide.origLines.length ? (
                    <p
                      className={`${styles.liveOrigText} ${liveInfo.isEthiopic ? styles.ethiopicTypography : styles.latinTypography}`}
                      lang={liveInfo.langCode}
                      style={{ fontSize: `${Math.round(liveFontSize * 0.88)}px` }}
                      data-testid="live-orig-text"
                    >
                      {activeLiveSlide.origLines.join('\n')}
                    </p>
                  ) : null}

                  {activeLiveSlide.origLines.length && activeLiveSlide.translitLines.length ? (
                    <div className={styles.liveBothDivider} aria-hidden="true" />
                  ) : null}

                  {activeLiveSlide.translitLines.length ? (
                    <p
                      className={`${styles.liveTranslitText} ${styles.latinTypography}`}
                      lang="en"
                      style={{ fontSize: `${Math.round(liveFontSize * 0.72)}px` }}
                      data-testid="live-translit-text"
                    >
                      {activeLiveSlide.translitLines.join('\n')}
                    </p>
                  ) : null}
                </div>
              ) : effectiveLiveMode === 'transliteration' ? (
                <p
                  className={`${styles.slideText} ${styles.latinTypography}`}
                  lang="en"
                  style={{ fontSize: `${liveFontSize}px` }}
                  data-testid="live-translit-text"
                >
                  {activeLiveSlide.translitLines.length
                    ? activeLiveSlide.translitLines.join('\n')
                    : activeLiveSlide.origLines.join('\n')}
                </p>
              ) : (
                <p
                  className={`${styles.slideText} ${liveInfo.isEthiopic ? styles.ethiopicTypography : styles.latinTypography}`}
                  lang={liveInfo.langCode}
                  style={{ fontSize: `${liveFontSize}px` }}
                  data-testid="live-orig-text"
                >
                  {activeLiveSlide.origLines.length
                    ? activeLiveSlide.origLines.join('\n')
                    : activeLiveSlide.translitLines.join('\n')}
                </p>
              )}
            </div>
          ) : (
            <div
              className={`${styles.slideText} ${typographyClass}`}
              lang={currentLyric.langCode}
              style={{ fontSize: `${liveFontSize}px` }}
            >
              {activeSlide.lines.join('\n')}
            </div>
          )}

          <div className={styles.presentationControls}>
            <button
              type="button"
              aria-label={t.previous}
              onClick={() => setSlideIndex((value) => Math.max(0, value - 1))}
              disabled={slideIndex === 0}
            >
              ←
            </button>
            <button
              type="button"
              aria-label="Decrease presentation text size"
              onClick={() => setLiveFontSize((value) => Math.max(24, value - 4))}
            >
              A−
            </button>
            <button
              type="button"
              aria-label="Increase presentation text size"
              onClick={() => setLiveFontSize((value) => Math.min(88, value + 4))}
            >
              A+
            </button>
            <button
              type="button"
              aria-label="Toggle reader theme"
              onClick={() =>
                setReaderTheme((value) => (value === 'dark' ? 'parchment' : 'dark'))
              }
            >
              {readerTheme === 'dark' ? '☀' : '☾'}
            </button>

            {isLive ? (
              <div
                className={styles.liveModeToggle}
                role="group"
                aria-label={uiLocale === 'am' ? 'የቋንቋ ምርጫ' : 'Language display mode'}
                data-testid="live-language-controls"
              >
                <button
                  type="button"
                  id="live-mode-original"
                  className={`${styles.liveModeButton} ${effectiveLiveMode === 'original' ? styles.liveModeButtonActive : ''}`}
                  onClick={() => setUserLiveMode('original')}
                  disabled={!liveInfo.hasOriginal}
                  title={uiLocale === 'am' ? 'ኦሪጅናል ግጥም' : 'Original language lyrics'}
                  aria-pressed={effectiveLiveMode === 'original'}
                >
                  {uiLocale === 'am' ? 'ኦሪጅናል' : 'Original'}
                </button>
                <button
                  type="button"
                  id="live-mode-transliteration"
                  className={`${styles.liveModeButton} ${effectiveLiveMode === 'transliteration' ? styles.liveModeButtonActive : ''}`}
                  onClick={() => setUserLiveMode('transliteration')}
                  disabled={!liveInfo.hasTransliteration}
                  title={uiLocale === 'am' ? 'ላቲን (ድምጽ)' : 'Latin transliteration'}
                  aria-pressed={effectiveLiveMode === 'transliteration'}
                >
                  {uiLocale === 'am' ? 'ላቲን' : 'Transliteration'}
                </button>
                <button
                  type="button"
                  id="live-mode-both"
                  className={`${styles.liveModeButton} ${effectiveLiveMode === 'both' ? styles.liveModeButtonActive : ''}`}
                  onClick={() => setUserLiveMode('both')}
                  disabled={!liveInfo.hasOriginal || !liveInfo.hasTransliteration}
                  title={uiLocale === 'am' ? 'ሁለቱም' : 'Both Original & Transliteration'}
                  aria-pressed={effectiveLiveMode === 'both'}
                >
                  {uiLocale === 'am' ? 'ሁለቱም' : 'Both'}
                </button>
              </div>
            ) : null}

            {presentation === 'preview' ? (
              <label>
                {t.lines}
                <select
                  value={linesPerSlide}
                  onChange={(event) => {
                    setLinesPerSlide(Number(event.target.value))
                    setSlideIndex(0)
                  }}
                >
                  {[2, 3, 4, 5, 6, 7, 8].map((value) => (
                    <option key={value}>{value}</option>
                  ))}
                </select>
              </label>
            ) : null}
            {presentation === 'preview' ? (
              <button type="button" onClick={printSlides}>
                {t.printSlides}
              </button>
            ) : null}
            <button
              type="button"
              aria-label={t.fullscreen}
              onClick={toggleFullscreen}
            >
              ⛶
            </button>
            <button
              type="button"
              aria-label={t.next}
              onClick={() =>
                setSlideIndex((value) => Math.min(totalSlideCount - 1, value + 1))
              }
              disabled={slideIndex >= totalSlideCount - 1}
            >
              →
            </button>
            <button type="button" onClick={() => setPresentation(null)}>
              {t.close}
            </button>
          </div>
        </div>
      ) : null}
    </section>
  )
}
