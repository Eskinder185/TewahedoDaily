import { useEffect, useMemo, useRef, useState } from 'react'
import type { PublicMezmur } from '../../lib/publicContent/service'
import {
  buildPrintableLyricsHtml,
  buildSlides,
  formatLyricsForCopy,
  normalizeVerifiedRelations,
  parseLyricSections,
  shareHymnLink,
} from '../../lib/hymns/lyrics'
import { useLocale } from '../../lib/i18n/locale'
import { Link } from 'react-router-dom'
import styles from './HymnLyricsExperience.module.css'

type Props = { item: PublicMezmur; canonical: string }
type Theme = 'dark' | 'parchment'

const labels = {
  en: {
    tools: 'Lyrics tools', copy: 'Copy', copied: 'Lyrics copied', share: 'Share', pdf: 'PDF',
    slides: 'Slides', live: 'Live',
    unavailable: 'Lyrics are not available for this hymn.', reader: 'Lyrics reader', textSize: 'Text size',
    numbering: 'Verse numbers', transliteration: 'Transliteration', attribution: 'Include source attribution',
    close: 'Close', previous: 'Previous slide', next: 'Next slide', fullscreen: 'Toggle fullscreen',
    lines: 'Lines per slide', printSlides: 'Print / save slides as PDF', printLyrics: 'Print / save as PDF',
  },
  am: {
    tools: 'የመዝሙር መሣሪያዎች', copy: 'ቅዳ', copied: 'ግጥሙ ተቀድቷል', share: 'አጋራ', pdf: 'PDF',
    slides: 'ስላይዶች', live: 'በቀጥታ',
    unavailable: 'የዚህ መዝሙር ግጥም አልተገኘም።', reader: 'የመዝሙር ንባብ', textSize: 'የፊደል መጠን',
    numbering: 'የቁጥር ምልክቶች', transliteration: 'በላቲን ፊደል', attribution: 'የምንጭ ማጣቀሻ አክል',
    close: 'ዝጋ', previous: 'የቀደመው', next: 'ቀጣይ', fullscreen: 'ሙሉ ማያ', lines: 'በስላይድ ያሉ መስመሮች',
    printSlides: 'ስላይዶችን አትም / PDF አስቀምጥ', printLyrics: 'አትም / PDF አስቀምጥ',
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

export function HymnLyricsExperience({ item, canonical }: Props) {
  const { uiLocale } = useLocale()
  const t = labels[uiLocale]
  const lyrics = item.lyrics_amharic?.trim() || item.lyrics_english?.trim() || item.lyrics_oromo?.trim() || ''
  const sections = useMemo(() => parseLyricSections(lyrics, item.structured_lyrics), [lyrics, item.structured_lyrics])
  const [message, setMessage] = useState('')
  const [includeAttribution, setIncludeAttribution] = useState(true)
  const [fontSize, setFontSize] = useState(24)
  const [readerTheme, setReaderTheme] = useState<Theme>('parchment')
  const [numbered, setNumbered] = useState(true)
  const [showTransliteration, setShowTransliteration] = useState(true)
  const [linesPerSlide, setLinesPerSlide] = useState(4)
  const [presentation, setPresentation] = useState<'preview' | 'live' | null>(null)
  const [slideIndex, setSlideIndex] = useState(0)
  const [liveFontSize, setLiveFontSize] = useState(48)
  const liveRef = useRef<HTMLDivElement>(null)
  const slides = useMemo(() => buildSlides(sections, linesPerSlide), [sections, linesPerSlide])
  const relations = useMemo(() => normalizeVerifiedRelations(item.related_content), [item.related_content])
  const activeSlide = slides[Math.min(slideIndex, Math.max(0, slides.length - 1))]
  const attribution = item.source_info || item.source || null

  useEffect(() => {
    if (!presentation) return
    const onKey = (event: KeyboardEvent) => {
      if (event.key === 'Escape') setPresentation(null)
      if (event.key === 'ArrowRight' || event.key === 'ArrowDown') setSlideIndex((value) => Math.min(slides.length - 1, value + 1))
      if (event.key === 'ArrowLeft' || event.key === 'ArrowUp') setSlideIndex((value) => Math.max(0, value - 1))
    }
    window.addEventListener('keydown', onKey)
    return () => window.removeEventListener('keydown', onKey)
  }, [presentation, slides.length])

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
      openPrintDocument(buildPrintableLyricsHtml({
        title: item.title_amharic || item.title,
        subtitle: item.title_amharic ? item.title : null,
        performer: item.singer_name,
        metadata: [item.category_name || item.category || '', item.occasion || ''].filter(Boolean),
        sections,
        attribution,
      }))
    } catch (error) { setMessage(error instanceof Error ? error.message : 'Unable to open PDF view.') }
  }

  const printSlides = () => {
    try {
      openPrintDocument(buildPrintableLyricsHtml({
        title: item.title_amharic || item.title,
        sections: slides.map((slide) => ({ ...slide, kind: 'other' as const })),
        attribution,
        slides: true,
        theme: readerTheme,
      }))
    } catch (error) { setMessage(error instanceof Error ? error.message : 'Unable to open slide view.') }
  }

  const toggleFullscreen = async () => {
    try {
      if (document.fullscreenElement) await document.exitFullscreen()
      else await liveRef.current?.requestFullscreen()
    } catch { setMessage('Fullscreen is not available in this browser.') }
  }

  if (!lyrics) return <p className={styles.unavailable} role="status">{t.unavailable}</p>

  return (
    <section className={styles.experience} aria-labelledby="lyrics-tools-title">
      <div className={styles.toolsHeader}>
        <div>
          <p className={styles.eyebrow}>{t.tools}</p>
          <h2 id="lyrics-tools-title">{item.title_amharic || item.title}</h2>
          {item.title_amharic && item.title ? <p className={styles.subtitle}>{item.title}</p> : null}
        </div>
        <div className={styles.actions} role="toolbar" aria-label={t.tools}>
          <button type="button" onClick={copyLyrics}>{t.copy}</button>
          <button type="button" onClick={share}>{t.share}</button>
          <button type="button" onClick={printLyrics}>{t.pdf}</button>
          <button type="button" onClick={() => { setSlideIndex(0); setPresentation('preview') }}>{t.slides}</button>
          <button type="button" className={styles.liveButton} onClick={() => { setSlideIndex(0); setPresentation('live') }}>{t.live}</button>
        </div>
      </div>
      <div className={styles.options}>
        <label><input type="checkbox" checked={includeAttribution} onChange={(event) => setIncludeAttribution(event.target.checked)} /> {t.attribution}</label>
        <label><input type="checkbox" checked={numbered} onChange={(event) => setNumbered(event.target.checked)} /> {t.numbering}</label>
        {item.transliteration?.trim() ? <label><input type="checkbox" checked={showTransliteration} onChange={(event) => setShowTransliteration(event.target.checked)} /> {t.transliteration}</label> : null}
        <label>{t.textSize} <input aria-label={t.textSize} type="range" min="18" max="40" step="2" value={fontSize} onChange={(event) => setFontSize(Number(event.target.value))} /></label>
        <div className={styles.segmented} role="group" aria-label="Reading theme">
          <button type="button" aria-pressed={readerTheme === 'parchment'} onClick={() => setReaderTheme('parchment')}>Parchment</button>
          <button type="button" aria-pressed={readerTheme === 'dark'} onClick={() => setReaderTheme('dark')}>Dark</button>
        </div>
      </div>

      <div className={`${styles.reader} ${readerTheme === 'dark' ? styles.dark : ''}`} style={{ '--reader-size': `${fontSize}px` } as React.CSSProperties}>
        <h3>{t.reader}</h3>
        {sections.map((section) => (
          <article key={section.id} className={styles.section}>
            <p className={styles.sectionLabel}>{numbered ? section.label : section.kind === 'chorus' ? section.label : ''}</p>
            <p lang="am">{section.lines.join('\n')}</p>
          </article>
        ))}
        {showTransliteration && item.transliteration?.trim() ? <div className={styles.transliteration}><h3>{t.transliteration}</h3><p>{item.transliteration}</p></div> : null}
      </div>
      <p className={styles.status} role="status" aria-live="polite">{message}</p>
      {relations.length ? (
        <nav className={styles.relations} aria-label="Verified related content">
          <h3>{uiLocale === 'am' ? 'ተዛማጅ ይዘት' : 'Related content'}</h3>
          <ul>{relations.map((relation) => <li key={`${relation.type}:${relation.href}`}><span>{relation.type}</span><Link to={relation.href}>{relation.label}</Link></li>)}</ul>
        </nav>
      ) : null}

      {presentation && activeSlide ? (
        <div ref={liveRef} className={`${styles.presentation} ${readerTheme === 'parchment' ? styles.presentationParchment : ''}`} role="dialog" aria-modal="true" aria-label={presentation === 'live' ? t.live : t.slides}>
          <div className={styles.presentationTop}>
            <span>{activeSlide.label}</span><span>{slideIndex + 1} / {slides.length}</span>
          </div>
          <div className={styles.slideText} lang="am" style={{ fontSize: `${liveFontSize}px` }}>{activeSlide.lines.join('\n')}</div>
          <div className={styles.presentationControls}>
            <button type="button" aria-label={t.previous} onClick={() => setSlideIndex((value) => Math.max(0, value - 1))} disabled={slideIndex === 0}>←</button>
            <button type="button" aria-label="Decrease presentation text size" onClick={() => setLiveFontSize((value) => Math.max(28, value - 4))}>A−</button>
            <button type="button" aria-label="Increase presentation text size" onClick={() => setLiveFontSize((value) => Math.min(88, value + 4))}>A+</button>
            <button type="button" onClick={() => setReaderTheme((value) => value === 'dark' ? 'parchment' : 'dark')}>{readerTheme === 'dark' ? '☀' : '☾'}</button>
            {presentation === 'preview' ? <label>{t.lines}<select value={linesPerSlide} onChange={(event) => { setLinesPerSlide(Number(event.target.value)); setSlideIndex(0) }}>{[2,3,4,5,6,7,8].map((value) => <option key={value}>{value}</option>)}</select></label> : null}
            {presentation === 'preview' ? <button type="button" onClick={printSlides}>{t.printSlides}</button> : null}
            <button type="button" aria-label={t.fullscreen} onClick={toggleFullscreen}>⛶</button>
            <button type="button" aria-label={t.next} onClick={() => setSlideIndex((value) => Math.min(slides.length - 1, value + 1))} disabled={slideIndex === slides.length - 1}>→</button>
            <button type="button" onClick={() => setPresentation(null)}>{t.close}</button>
          </div>
        </div>
      ) : null}
    </section>
  )
}
