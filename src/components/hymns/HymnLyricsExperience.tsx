import { lazy, Suspense, useEffect, useId, useMemo, useRef, useState, type ReactNode } from 'react'
import type { PublicMezmur } from '../../lib/publicContent/service'
import {
  buildPrintableLyricsHtml,
  formatLyricsForCopy,
  parseLyricSections,
} from '../../lib/hymns/lyrics'
import { parseStructuredLyrics } from '../../lib/mezmur/structuredLyricsParser'
import {
  buildPresentationSource,
  isLanguageAvailable,
  type PresentationLanguage,
} from '../../lib/mezmur/presentationSlides'
import { useLocale } from '../../lib/i18n/locale'
import { currentMezmurUrl } from '../../lib/hymns/shareLink'
import styles from './HymnLyricsExperience.module.css'

// The presentation view and the PowerPoint generator are only downloaded when used.
const loadPresentation = () => import('./presentation/MezmurPresentation')
const MezmurPresentation = lazy(loadPresentation)

export type LyricsTheme = 'parchment' | 'ivory' | 'gold' | 'navy' | 'dark'
export type LyricsFontSize = 18 | 22 | 26 | 32

type Props = {
  item: PublicMezmur
  canonical: string
  isLoading?: boolean
  isError?: boolean
  onRetry?: () => void
  /** Extra compact toolbar actions (e.g. the favourite button). */
  toolbarExtras?: ReactNode
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
    lyricsHeading: 'Lyrics',
    present: 'Present Mezmur',
    presentShort: 'Present',
    presentHint: 'Open a full-screen lyric presentation',
    share: 'Share link',
    copyLink: 'Copy link',
    linkCopied: 'Link copied',
    more: 'More actions',
    copy: 'Copy lyrics',
    copied: 'Lyrics copied',
    printLyrics: 'Print / save as PDF',
    downloadPptx: 'Download PowerPoint (.pptx)',
    preparingPptx: 'Preparing PowerPoint…',
    pptxDone: (name: string) => `Downloaded ${name}`,
    pptxFailed: 'The PowerPoint file could not be created. Please try again.',
    readingSettings: 'Reading settings',
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
    loadingPresentation: 'Opening presentation…',
  },
  am: {
    tools: 'የመዝሙር መሣሪያዎች',
    lyricsHeading: 'ግጥም',
    present: 'መዝሙሩን አቅርብ',
    presentShort: 'አቅርብ',
    presentHint: 'ግጥሙን በሙሉ ማያ አቅርብ',
    share: 'ማገናኛ አጋራ',
    copyLink: 'ማገናኛ ቅዳ',
    linkCopied: 'ማገናኛው ተቀድቷል',
    more: 'ተጨማሪ',
    copy: 'ግጥሙን ቅዳ',
    copied: 'ግጥሙ ተቀድቷል',
    printLyrics: 'አትም / PDF አስቀምጥ',
    downloadPptx: 'PowerPoint (.pptx) አውርድ',
    preparingPptx: 'PowerPoint በማዘጋጀት ላይ…',
    pptxDone: (name: string) => `${name} ወርዷል`,
    pptxFailed: 'የPowerPoint ፋይሉን መፍጠር አልተቻለም። እንደገና ይሞክሩ።',
    readingSettings: 'የንባብ ቅንብሮች',
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
    loadingPresentation: 'ማቅረቢያውን በመክፈት ላይ…',
  },
} as const

const READER_PREFS_KEY = 'td.mezmurReader.v1'

function readReaderPref<T>(key: string, fallback: T): T {
  try {
    const raw = window.localStorage.getItem(READER_PREFS_KEY)
    const parsed = raw ? (JSON.parse(raw) as Record<string, unknown>) : {}
    return key in parsed ? (parsed[key] as T) : fallback
  } catch {
    return fallback
  }
}

function writeReaderPref(key: string, value: unknown) {
  try {
    const raw = window.localStorage.getItem(READER_PREFS_KEY)
    const parsed = raw ? (JSON.parse(raw) as Record<string, unknown>) : {}
    parsed[key] = value
    window.localStorage.setItem(READER_PREFS_KEY, JSON.stringify(parsed))
  } catch {
    /* storage unavailable */
  }
}

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

async function copyText(text: string): Promise<boolean> {
  try {
    await navigator.clipboard.writeText(text)
    return true
  } catch {
    return false
  }
}

function presentationLanguageFor(readerLang: LyricLanguageId, originalCode: string | undefined): PresentationLanguage {
  if (readerLang === 'both') return 'both'
  if (readerLang === 'transliteration') return 'transliteration'
  if (readerLang === 'en') return originalCode === 'en' ? 'original' : 'english'
  return 'original'
}

const isWide = () => typeof window !== 'undefined' && window.matchMedia?.('(min-width: 960px)').matches

export function HymnLyricsExperience({ item, canonical, isLoading = false, isError = false, onRetry, toolbarExtras }: Props) {
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

  const [selectedLang, setSelectedLangState] = useState<LyricLanguageId | null>(() => readReaderPref<LyricLanguageId | null>('lang', null))
  const setSelectedLang = (id: LyricLanguageId) => {
    setSelectedLangState(id)
    writeReaderPref('lang', id)
  }

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
  const [fontSize, setFontSizeState] = useState<LyricsFontSize>(() => {
    const v = readReaderPref<number>('fontSize', 22)
    return ([18, 22, 26, 32] as const).includes(v as LyricsFontSize) ? (v as LyricsFontSize) : 22
  })
  const [readerTheme, setReaderThemeState] = useState<LyricsTheme>(() => {
    const v = readReaderPref<string>('theme', 'parchment')
    return (['parchment', 'ivory', 'gold', 'navy', 'dark'] as const).includes(v as LyricsTheme) ? (v as LyricsTheme) : 'parchment'
  })
  const setFontSize = (v: LyricsFontSize) => {
    setFontSizeState(v)
    writeReaderPref('fontSize', v)
  }
  const setReaderTheme = (v: LyricsTheme) => {
    setReaderThemeState(v)
    writeReaderPref('theme', v)
  }
  const [numbered, setNumbered] = useState(true)
  const [showTransliteration, setShowTransliteration] = useState(true)
  const [settingsOpen, setSettingsOpen] = useState(() => Boolean(isWide()))
  const [menuOpen, setMenuOpen] = useState(false)
  const [presenting, setPresenting] = useState(false)
  const [exporting, setExporting] = useState(false)
  const settingsId = useId()
  const menuId = useId()
  const menuRef = useRef<HTMLDivElement>(null)
  const menuButtonRef = useRef<HTMLButtonElement>(null)
  const presentButtonRef = useRef<HTMLButtonElement>(null)
  const tabsRef = useRef<HTMLDivElement>(null)
  const [tabsOverflow, setTabsOverflow] = useState(false)
  const updateTabsOverflow = () => {
    const el = tabsRef.current
    const more = Boolean(el && el.scrollLeft + el.clientWidth < el.scrollWidth - 4)
    setTabsOverflow((prev) => (prev === more ? prev : more))
  }
  useEffect(() => {
    const el = tabsRef.current
    if (!el || typeof ResizeObserver === 'undefined') return
    const ro = new ResizeObserver(() => {
      const more = el.scrollLeft + el.clientWidth < el.scrollWidth - 4
      setTabsOverflow((prev) => (prev === more ? prev : more))
    })
    ro.observe(el)
    return () => ro.disconnect()
  }, [availableLangs.length])

  const presentationSource = useMemo(() => buildPresentationSource(item), [item])
  const attribution = item.source || null
  const sourceUrl = safeExternalLink(item.source)

  // Dedicated transliteration content for inline view when reading a non-transliteration version
  const inlineTransliteration =
    activeLang !== 'transliteration'
      ? (item.lyrics_transliteration || item.transliteration)?.trim()
      : null

  const flash = (text: string) => {
    setMessage(text)
    window.setTimeout(() => setMessage((current) => (current === text ? '' : current)), 2200)
  }

  // More menu: close on outside click / Escape, focus the first item when opened.
  useEffect(() => {
    if (!menuOpen) return
    const first = menuRef.current?.querySelector<HTMLElement>('[role="menuitem"]')
    first?.focus()
    const onDown = (event: PointerEvent) => {
      if (!menuRef.current?.contains(event.target as Node) && !menuButtonRef.current?.contains(event.target as Node)) {
        setMenuOpen(false)
      }
    }
    const onKey = (event: KeyboardEvent) => {
      if (event.key === 'Escape') {
        setMenuOpen(false)
        menuButtonRef.current?.focus()
      }
      if (event.key === 'ArrowDown' || event.key === 'ArrowUp') {
        const items = Array.from(menuRef.current?.querySelectorAll<HTMLElement>('[role="menuitem"]') || [])
        const i = items.indexOf(document.activeElement as HTMLElement)
        const next = event.key === 'ArrowDown' ? (i + 1) % items.length : (i - 1 + items.length) % items.length
        items[next]?.focus()
        event.preventDefault()
      }
    }
    document.addEventListener('pointerdown', onDown)
    document.addEventListener('keydown', onKey)
    return () => {
      document.removeEventListener('pointerdown', onDown)
      document.removeEventListener('keydown', onKey)
    }
  }, [menuOpen])

  const copyLyrics = async () => {
    setMenuOpen(false)
    const text = formatLyricsForCopy({
      title: item.title_amharic || item.title,
      subtitle: item.title_amharic ? item.title : null,
      performer: item.singer_name,
      sections,
      attribution,
      includeAttribution,
    })
    if (!(await copyText(text))) window.prompt('Copy lyrics', text)
    flash(t.copied)
  }

  const copyLink = async () => {
    setMenuOpen(false)
    const url = currentMezmurUrl()
    if (await copyText(url)) flash(t.linkCopied)
    else window.prompt(t.copyLink, url)
  }

  const shareLink = async () => {
    const url = currentMezmurUrl()
    const nav = navigator as Navigator & { share?: (data: ShareData) => Promise<void>; canShare?: (data: ShareData) => boolean }
    const data: ShareData = { title: item.title_amharic || item.title, url }
    if (typeof nav.share === 'function' && (!nav.canShare || nav.canShare(data))) {
      try {
        await nav.share(data)
        return
      } catch (error) {
        if ((error as DOMException)?.name === 'AbortError') return
        // fall through to copying the link
      }
    }
    if (await copyText(url)) flash(t.linkCopied)
    else window.prompt(t.copyLink, url)
  }

  const printLyrics = () => {
    setMenuOpen(false)
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
      flash(error instanceof Error ? error.message : 'Unable to open PDF view.')
    }
  }

  const initialPresentationLanguage = (): PresentationLanguage => {
    const wanted = presentationLanguageFor(activeLang, presentationSource.original?.code)
    return isLanguageAvailable(presentationSource, wanted) ? wanted : presentationSource.defaultLanguage || 'original'
  }

  const downloadPowerPoint = async () => {
    setMenuOpen(false)
    if (exporting) return
    setExporting(true)
    setMessage(t.preparingPptx)
    try {
      const [{ buildPresentationSlides, autoLinesCapacity }, { readPresentationPrefs }, { downloadPptx }] = await Promise.all([
        import('../../lib/mezmur/presentationSlides'),
        import('../../lib/mezmur/presentationPrefs'),
        import('../../lib/mezmur/pptxExport'),
      ])
      const prefs = readPresentationPrefs()
      const language = prefs.language && isLanguageAvailable(presentationSource, prefs.language) ? prefs.language : initialPresentationLanguage()
      const slides = buildPresentationSlides(presentationSource, {
        language,
        linesPerSlide: prefs.linesPerSlide,
        autoCapacity: autoLinesCapacity(prefs.fontSize, language === 'both' && prefs.showTransliteration),
        includeTitleSlide: prefs.showTitle,
        groupBySection: prefs.grouping,
        showTransliteration: prefs.showTransliteration,
      })
      const { fileName } = await downloadPptx({
        slides,
        title: presentationSource.title,
        fontSize: prefs.fontSize,
        theme: prefs.theme,
        highContrast: prefs.highContrast,
        align: prefs.align,
        attribution: presentationSource.attribution,
        includeAttribution: prefs.includeAttribution,
      })
      flash(t.pptxDone(fileName))
    } catch {
      flash(t.pptxFailed)
    } finally {
      setExporting(false)
    }
  }

  const closePresentation = () => {
    setPresenting(false)
    window.setTimeout(() => presentButtonRef.current?.focus(), 0)
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
      <h2 id="lyrics-tools-title" className={styles.srOnly}>
        {t.lyricsHeading}
      </h2>

      {/* Compact toolbar: language, Present, share, favourite, settings, more */}
      <div className={styles.toolbar}>
        <div className={styles.langRow}>
          {availableLangs.length > 1 ? (
            <div
              ref={tabsRef}
              className={styles.languageTabsBar}
              data-overflow={tabsOverflow ? 'true' : undefined}
              onScroll={updateTabsOverflow}
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
                  tabIndex={activeLang === tab.id ? 0 : -1}
                  className={`${styles.languageTab} ${activeLang === tab.id ? styles.languageTabActive : ''}`}
                  onClick={() => setSelectedLang(tab.id)}
                  onKeyDown={(event) => {
                    if (event.key !== 'ArrowRight' && event.key !== 'ArrowLeft') return
                    const i = availableLangs.findIndex((l) => l.id === tab.id)
                    const next = availableLangs[(i + (event.key === 'ArrowRight' ? 1 : availableLangs.length - 1)) % availableLangs.length]
                    setSelectedLang(next.id)
                    document.getElementById(`lyrics-tab-${next.id}`)?.focus()
                  }}
                >
                  {uiLocale === 'am' ? tab.labelAm : tab.labelEn}
                </button>
              ))}
            </div>
          ) : (
            <p className={styles.singleLanguage}>{uiLocale === 'am' ? currentLyric.labelAm : currentLyric.labelEn}</p>
          )}
          <button
            type="button"
            className={`${styles.iconButton} ${settingsOpen ? styles.iconButtonActive : ''}`}
            onClick={() => setSettingsOpen((open) => !open)}
            aria-expanded={settingsOpen}
            aria-controls={settingsId}
            aria-label={t.readingSettings}
            title={t.readingSettings}
            data-testid="reading-settings-toggle"
          >
            <span aria-hidden="true" className={styles.aaGlyph}>Aa</span>
          </button>
        </div>

        <div className={styles.actions} role="toolbar" aria-label={t.tools}>
          <button
            ref={presentButtonRef}
            type="button"
            className={styles.presentButton}
            onClick={() => {
              setMenuOpen(false)
              setPresenting(true)
            }}
            onPointerEnter={() => void loadPresentation()}
            onFocus={() => void loadPresentation()}
            title={t.presentHint}
            aria-label={t.present}
            data-testid="present-mezmur"
          >
            <span aria-hidden="true" className={styles.presentIcon}>▶</span>
            <span className={styles.presentLong}>{t.present}</span>
            <span className={styles.presentShort} aria-hidden="true">{t.presentShort}</span>
          </button>
          <button
            type="button"
            className={styles.iconButton}
            onClick={() => void shareLink()}
            aria-label={t.share}
            title={t.share}
            data-testid="share-link"
          >
            <svg aria-hidden="true" viewBox="0 0 24 24" width="20" height="20" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
              <path d="M4 12v7a1 1 0 0 0 1 1h14a1 1 0 0 0 1-1v-7" />
              <path d="M12 3v12" />
              <path d="m7 8 5-5 5 5" />
            </svg>
          </button>
          {toolbarExtras}
          <div className={styles.menuWrap}>
            <button
              ref={menuButtonRef}
              type="button"
              className={styles.iconButton}
              aria-haspopup="menu"
              aria-expanded={menuOpen}
              aria-controls={menuId}
              aria-label={t.more}
              title={t.more}
              onClick={() => setMenuOpen((open) => !open)}
              data-testid="more-actions"
            >
              <span aria-hidden="true">⋯</span>
            </button>
            {menuOpen ? (
              <div ref={menuRef} id={menuId} role="menu" aria-label={t.more} className={styles.menu}>
                <button type="button" role="menuitem" onClick={() => void copyLink()} data-testid="menu-copy-link">
                  {t.copyLink}
                </button>
                <button type="button" role="menuitem" onClick={() => void copyLyrics()}>
                  {t.copy}
                </button>
                <button type="button" role="menuitem" onClick={() => void downloadPowerPoint()} disabled={exporting} data-testid="menu-download-pptx">
                  {t.downloadPptx}
                </button>
                <button type="button" role="menuitem" onClick={printLyrics}>
                  {t.printLyrics}
                </button>
              </div>
            ) : null}
          </div>
        </div>
      </div>

      {/* Collapsible reading settings */}
      <div id={settingsId} className={styles.options} hidden={!settingsOpen} data-testid="reading-settings">
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

      <p className={styles.status} role="status" aria-live="polite">
        {message}
      </p>

      {/* Active Tab Panel with Lyrics */}
      <div
        id={`lyrics-tabpanel-${currentLyric.id}`}
        role="tabpanel"
        aria-labelledby={availableLangs.length > 1 ? `lyrics-tab-${currentLyric.id}` : 'lyrics-tools-title'}
        className={`${styles.reader} ${themeClass}`}
        style={{ '--reader-size': `${fontSize}px` } as React.CSSProperties}
        data-testid="lyrics-reader"
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

      {presenting ? (
        <Suspense
          fallback={
            <p className={styles.presentLoading} role="status">
              {t.loadingPresentation}
            </p>
          }
        >
          <MezmurPresentation
            source={presentationSource}
            initialLanguage={initialPresentationLanguage()}
            uiLocale={uiLocale}
            onClose={closePresentation}
          />
        </Suspense>
      ) : null}
    </section>
  )
}
