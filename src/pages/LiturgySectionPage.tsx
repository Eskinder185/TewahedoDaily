import { useEffect, useMemo, useRef, useState } from 'react'
import { Link, useLocation, useNavigate, useParams } from 'react-router-dom'
import { PageSection } from '../components/ui/PageSection'
import { PageLoadingFallback } from '../components/ui/PageLoadingFallback'
import {
  LiturgyEntryRenderer,
  LiturgyGroupRenderer,
} from '../components/liturgy/LiturgyEntryRenderer'
import {
  getLiturgyEntriesForSection,
  getLiturgySectionBySlug,
  getLiturgySections,
} from '../lib/prayers/liturgySupabase'
import {
  availableLangModes,
  defaultLangMode,
  groupLiturgyEntriesForDisplay,
  isGenericProvenanceText,
  type LiturgyLangMode,
} from '../lib/prayers/liturgyPresentation'
import type { LiturgyEntry, LiturgySection } from '../lib/prayers/prayerLibraryTypes'
import { useTranslation } from '../i18n'
import styles from './LiturgySectionPage.module.css'

function langLabel(mode: LiturgyLangMode): string {
  switch (mode) {
    case 'amharic':
      return 'Amharic'
    case 'english':
      return 'English'
    case 'transliteration':
      return 'Transliteration'
    case 'both':
      return 'Both'
  }
}

export function LiturgySectionPage() {
  const tr = useTranslation()
  const navigate = useNavigate()
  const location = useLocation()
  const readerRef = useRef<HTMLElement | null>(null)
  const { collectionSlug = 'divine-liturgy', sectionSlug, prayerSlug } = useParams()
  const resolvedSectionSlug = sectionSlug || prayerSlug
  const [section, setSection] = useState<LiturgySection | null>()
  const [sections, setSections] = useState<LiturgySection[]>([])
  const [entries, setEntries] = useState<LiturgyEntry[]>([])
  const [lang, setLang] = useState<LiturgyLangMode | null>(null)
  const [error, setError] = useState<string>()
  const [reloadTick, setReloadTick] = useState(0)
  const [sourceOpen, setSourceOpen] = useState(false)

  const langs = useMemo(() => availableLangModes(entries), [entries])
  const blocks = useMemo(() => groupLiturgyEntriesForDisplay(entries), [entries])
  const frontMatter = useMemo(
    () => blocks.filter((block) => block.kind === 'frontMatter'),
    [blocks],
  )
  const readingBlocks = useMemo(
    () => blocks.filter((block) => block.kind !== 'frontMatter'),
    [blocks],
  )

  useEffect(() => {
    if (!langs.length) {
      setLang(null)
      return
    }
    setLang((current) => (current && langs.includes(current) ? current : defaultLangMode(langs)))
  }, [langs])

  useEffect(() => {
    let active = true
    setSection(undefined)
    setError(undefined)
    setSourceOpen(false)
    if (!resolvedSectionSlug) {
      setSection(null)
      return
    }
    void (async () => {
      try {
        const next = await getLiturgySectionBySlug(collectionSlug, resolvedSectionSlug)
        if (!active) return
        if (!next) {
          setSection(null)
          setSections([])
          setEntries([])
          return
        }
        const [nextEntries, siblingSections] = await Promise.all([
          getLiturgyEntriesForSection(next.id, next.collectionId),
          getLiturgySections(next.collectionId),
        ])
        if (!active) return
        setSection(next)
        setEntries(nextEntries)
        setSections(siblingSections)
      } catch (cause) {
        if (!active) return
        const message =
          cause && typeof cause === 'object' && 'message' in cause
            ? String((cause as { message?: unknown }).message)
            : "We couldn't load this Liturgy section."
        if (import.meta.env.DEV) {
          const e = cause as { code?: string; message?: string; details?: string }
          console.error('[liturgy] section', {
            code: e.code,
            message: e.message,
            details: e.details,
            cause,
          })
        }
        setError(import.meta.env.DEV ? message : "We couldn't load this Liturgy section.")
        setSection(null)
      }
    })()
    return () => {
      active = false
    }
  }, [collectionSlug, resolvedSectionSlug, reloadTick])

  useEffect(() => {
    if (!section) return
    window.requestAnimationFrame(() => {
      readerRef.current?.scrollIntoView({ behavior: 'smooth', block: 'start' })
      if (!location.hash) window.scrollTo({ top: 0, behavior: 'smooth' })
    })
  }, [section?.id, location.hash])

  useEffect(() => {
    if (!entries.length) return
    const hash = location.hash.replace(/^#/, '')
    if (!hash.startsWith('entry-')) return
    const target = document.getElementById(hash)
    if (target) {
      window.requestAnimationFrame(() => {
        target.scrollIntoView({ behavior: 'smooth', block: 'start' })
      })
    }
  }, [entries, location.hash, blocks])

  const sectionIndex = sections.findIndex((item) => item.id === section?.id)
  const previous = sectionIndex > 0 ? sections[sectionIndex - 1] : null
  const next = sectionIndex >= 0 && sectionIndex < sections.length - 1 ? sections[sectionIndex + 1] : null
  const showDescription =
    section?.description && !isGenericProvenanceText(section.description) ? section.description : ''
  const progress =
    sections.length > 1 && sectionIndex >= 0
      ? Math.round(((sectionIndex + 1) / sections.length) * 100)
      : 0

  if (section === undefined && !error) return <PageLoadingFallback />

  if (error) {
    return (
      <PageSection variant="tint">
        <div className={styles.notFound}>
          <Link className={styles.backLink} to={`/pray/${collectionSlug}`}>
            Back to Liturgy
          </Link>
          <h1>{error}</h1>
          <button type="button" className={styles.retryBtn} onClick={() => setReloadTick((n) => n + 1)}>
            Try again
          </button>
        </div>
      </PageSection>
    )
  }

  if (!section) {
    return (
      <PageSection variant="tint">
        <div className={styles.notFound}>
          <Link className={styles.backLink} to={`/pray/${collectionSlug}`}>
            Back to Liturgy
          </Link>
          <h1>{tr('prayers.detail.notFoundTitle')}</h1>
        </div>
      </PageSection>
    )
  }

  return (
    <PageSection variant="tint">
      <article className={styles.shell}>
        <nav className={styles.topNav} aria-label={tr('prayers.navigation.aria')}>
          <Link className={styles.backLink} to={`/pray/${collectionSlug}`}>
            ← Liturgy sections
          </Link>
        </nav>

        <header className={styles.header}>
          <p className={styles.eyebrow}>Divine Liturgy</p>
          <h1 className={styles.title}>{section.title}</h1>
          {section.titleAmharic ? (
            <p className={styles.subtitle} lang="am">
              {section.titleAmharic}
            </p>
          ) : null}
          {showDescription ? <p className={styles.subtitle}>{showDescription}</p> : null}
          {sections.length > 1 ? (
            <p className={styles.progress} aria-hidden>
              Section {sectionIndex + 1} of {sections.length}
              <span className={styles.progressBar}>
                <span style={{ width: `${progress}%` }} />
              </span>
            </p>
          ) : null}
        </header>

        {frontMatter.length > 0 ? (
          <details
            className={styles.frontMatter}
            open={sourceOpen}
            onToggle={(event) => setSourceOpen((event.target as HTMLDetailsElement).open)}
          >
            <summary className={styles.frontMatterTitle}>Source / Edition Information</summary>
            <div className={styles.frontMatterBody}>
              {frontMatter.map((block) =>
                block.kind === 'frontMatter' ? (
                  <ul key={block.id} className={styles.frontMatterList}>
                    {block.lines.map((line, index) => (
                      <li key={`${block.id}-${index}`}>{line}</li>
                    ))}
                  </ul>
                ) : null,
              )}
            </div>
          </details>
        ) : null}

        <div className={styles.toolbar}>
          {langs.length > 1 ? (
            <div className={styles.langTabs} role="tablist" aria-label="Language">
              {langs.map((tab) => {
                const panelId = 'liturgy-reader'
                const tabId = `liturgy-lang-${tab}`
                return (
                  <button
                    key={tab}
                    id={tabId}
                    type="button"
                    role="tab"
                    aria-selected={lang === tab}
                    aria-controls={panelId}
                    tabIndex={lang === tab ? 0 : -1}
                    className={`${styles.langTab}${lang === tab ? ` ${styles.langTabActive}` : ''}`}
                    onClick={() => setLang(tab)}
                  >
                    {langLabel(tab)}
                  </button>
                )
              })}
            </div>
          ) : (
            <span />
          )}

          {sections.length > 1 ? (
            <label className={styles.toc}>
              <span className={styles.tocLabel}>Sections</span>
              <select
                className={styles.tocSelect}
                value={section.slug}
                aria-label="Liturgy sections"
                onChange={(event) => {
                  navigate(`/pray/${collectionSlug}/${event.target.value}`)
                }}
              >
                {sections.map((item, index) => (
                  <option key={item.id} value={item.slug}>
                    {String(index + 1).padStart(2, '0')} · {item.title}
                  </option>
                ))}
              </select>
            </label>
          ) : null}
        </div>

        <section
          id="liturgy-reader"
          ref={readerRef}
          className={styles.reader}
          role={langs.length > 1 ? 'tabpanel' : undefined}
          aria-labelledby={langs.length > 1 ? `liturgy-lang-${lang}` : undefined}
          aria-label="Liturgy text"
        >
          {entries.length === 0 ? (
            <p className={styles.empty}>No published entries in this section.</p>
          ) : (
            readingBlocks.map((block) => {
              if (block.kind === 'group') {
                return (
                  <LiturgyGroupRenderer
                    key={block.id}
                    speaker={block.speaker}
                    contentType={block.contentType}
                    entries={block.entries}
                    lang={lang}
                    sectionTitle={section.title}
                  />
                )
              }
              if (block.kind === 'entry') {
                return (
                  <LiturgyEntryRenderer
                    key={block.entry.id}
                    entry={block.entry}
                    lang={lang}
                    sectionTitle={section.title}
                  />
                )
              }
              return null
            })
          )}
        </section>

        <nav className={styles.sectionNav} aria-label="Section navigation">
          {previous ? (
            <Link to={`/pray/${collectionSlug}/${previous.slug}`}>← {previous.title}</Link>
          ) : (
            <span />
          )}
          {next ? <Link to={`/pray/${collectionSlug}/${next.slug}`}>{next.title} →</Link> : null}
        </nav>
      </article>
    </PageSection>
  )
}
