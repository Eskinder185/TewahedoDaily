import { useEffect, useState } from 'react'
import { useTranslation } from '../../i18n'
import {
  fetchFaithAndOrderSection,
  layoutFaithAndOrderResults,
  type FaithAndOrderManifest,
  type FaithAndOrderParagraph,
  type FaithAndOrderSearchResponse,
  type FaithAndOrderSectionRef,
  type FaithAndOrderSource,
} from '../../lib/searchBuddy/faithAndOrderSearch.ts'
import {
  isSearchBuddyAbort,
  searchBuddyRetryAfterSeconds,
  searchBuddyUserNotice,
} from '../../lib/searchBuddy/errorMessages.ts'
import { useLocale } from '../../lib/i18n/locale'
import styles from './SearchBuddy.module.css'

const EXAMPLE_SECTION_IDS = [
  's000008',
  's000082',
  's000207',
  's000301',
  's000345',
  's000611',
  's000730',
]

export type SectionTarget = {
  version: string
  sectionId: string
  paragraphId: string | null
  sectionTitle: string
  highlightNumber: number | null
}

export type FaithAndOrderOutcome =
  | { kind: 'idle' }
  | { kind: 'loading'; query: string }
  | { kind: 'matches'; query: string; response: FaithAndOrderSearchResponse }
  | { kind: 'empty'; query: string; response: FaithAndOrderSearchResponse }
  | { kind: 'error'; query: string; notice: string; retryAvailableAt?: number }

function languageLabel(language: string, t: (key: string) => string): string {
  if (language === 'en') return t('searchBuddy.faith.languageEnglish')
  return language
}

function SourceNotices({ source }: { source: FaithAndOrderSource | FaithAndOrderManifest | null }) {
  const t = useTranslation()
  return (
    <div className={styles.sourceNotice}>
      {source?.title ? (
        <p className={styles.documentTitle} lang="en">
          {source.title}
        </p>
      ) : null}
      <p>{t('searchBuddy.faith.uploadedCopy')}</p>
      {source?.editorial_status === 'source_transcription_unreviewed' ? (
        <p>{t('searchBuddy.faith.unreviewed')}</p>
      ) : source?.editorial_status ? (
        <p lang="en">{source.editorial_status}</p>
      ) : null}
      <p>{t('searchBuddy.faith.locatorNote')}</p>
      <p>{t('searchBuddy.faith.editionNote')}</p>
      {source ? (
        <p>
          {t('searchBuddy.faith.sourceLanguage')}: {languageLabel(source.language, t)}
          {typeof source.paragraph_count === 'number' && source.paragraph_count > 0
            ? ` · ${t('searchBuddy.faith.paragraphCount', { count: source.paragraph_count })}`
            : ''}
        </p>
      ) : null}
      {source?.translation_available === false ? <p>{t('searchBuddy.faith.noTranslation')}</p> : null}
    </div>
  )
}

function ParagraphBlock({
  paragraph,
  role,
  selected = false,
}: {
  paragraph: FaithAndOrderParagraph
  role: 'match' | 'context' | 'reader'
  selected?: boolean
}) {
  const t = useTranslation()
  const label = selected
    ? t('searchBuddy.faith.selectedPassage')
    : role === 'context'
      ? t('searchBuddy.faith.contextLabel')
      : role === 'match'
        ? t('searchBuddy.faith.matchingPassage')
        : ''
  return (
    <div
      id={`faith-order-paragraph-${paragraph.id}`}
      className={selected ? styles.passageSelected : role === 'context' ? styles.contextGroup : styles.matchPassage}
      data-paragraph-id={paragraph.id}
      tabIndex={selected ? -1 : undefined}
      aria-current={selected ? 'true' : undefined}
    >
      {label ? <p className={styles.contextLabel}>{label}</p> : null}
      <p
        className={paragraph.is_heading ? styles.passageHeading : styles.passageText}
        lang={paragraph.language === 'en' ? 'en' : undefined}
      >
        {paragraph.text}
      </p>
      <p className={styles.passageLocator}>
        {t('searchBuddy.faith.paragraphLocator', { number: paragraph.paragraph_number })}
        {' · '}
        {t('searchBuddy.faith.sourceLanguage')}: {languageLabel(paragraph.language, t)}
      </p>
    </div>
  )
}

function RetryButton({
  availableAt,
  busy,
  onRetry,
}: {
  availableAt?: number
  busy?: boolean
  onRetry: () => void
}) {
  const t = useTranslation()
  const [now, setNow] = useState(() => Date.now())
  const waiting = availableAt != null && availableAt > now
  useEffect(() => {
    if (!waiting) return
    const id = window.setInterval(() => setNow(Date.now()), 1000)
    return () => window.clearInterval(id)
  }, [waiting, availableAt])
  const seconds = waiting && availableAt != null ? Math.max(1, Math.ceil((availableAt - now) / 1000)) : 0
  return (
    <button type="button" className={styles.retryBtn} onClick={onRetry} disabled={busy || waiting}>
      {waiting ? t('searchBuddy.retryWait', { seconds }) : t('searchBuddy.retry')}
    </button>
  )
}

function exampleSections(manifest: FaithAndOrderManifest): FaithAndOrderSectionRef[] {
  const byId = new Map(manifest.sections.map((section) => [section.id, section]))
  return EXAMPLE_SECTION_IDS.flatMap((id) => {
    const section = byId.get(id)
    return section ? [section] : []
  })
}

export function FaithAndOrderSearchPane({
  manifest,
  manifestState,
  manifestNotice,
  outcome,
  onSearchTitle,
  onOpenToc,
  onOpenSection,
  onKeywordSearch,
  onRetryManifest,
  onRetrySearch,
  busy,
}: {
  manifest: FaithAndOrderManifest | null
  manifestState: 'idle' | 'loading' | 'ready' | 'error'
  manifestNotice: string | null
  outcome: FaithAndOrderOutcome
  onSearchTitle: (title: string) => void
  onOpenToc: () => void
  onOpenSection: (target: SectionTarget) => void
  onKeywordSearch: () => void
  onRetryManifest: () => void
  onRetrySearch: (query: string) => void
  busy: boolean
}) {
  const t = useTranslation()
  const source = outcome.kind === 'matches' || outcome.kind === 'empty' ? outcome.response.source : manifest
  const examples = manifest ? exampleSections(manifest) : []

  return (
    <div className={styles.thread}>
      <SourceNotices source={source} />
      {manifestState === 'loading' && outcome.kind === 'idle' ? (
        <p className={styles.loadingText} role="status">
          {t('searchBuddy.faith.manifestLoading')}
        </p>
      ) : null}
      {manifestState === 'error' && manifestNotice ? (
        <div className={styles.errorBlock} role="alert">
          <p className={styles.message}>{manifestNotice}</p>
          <button type="button" className={styles.retryBtn} onClick={onRetryManifest} disabled={busy}>
            {t('searchBuddy.retry')}
          </button>
        </div>
      ) : null}

      {outcome.kind === 'idle' && manifest ? (
        <>
          <h3 className={styles.faithHeading}>{t('searchBuddy.faith.welcomeTitle')}</h3>
          <p className={styles.message}>{t('searchBuddy.faith.welcomeCopy')}</p>
          <ul className={styles.exampleList} aria-label={t('searchBuddy.faith.examplesAria')}>
            {examples.map((section) => (
              <li key={section.id}>
                <button
                  type="button"
                  className={styles.exampleButton}
                  lang="en"
                  onClick={() => onSearchTitle(section.title)}
                >
                  {section.title}
                </button>
              </li>
            ))}
          </ul>
          <button type="button" className={styles.seeMore} onClick={onOpenToc}>
            {t('searchBuddy.faith.toc')}
          </button>
        </>
      ) : null}

      {outcome.kind === 'loading' ? (
        <p className={styles.loadingText} role="status">
          {t('searchBuddy.faith.searching')}
        </p>
      ) : null}

      {outcome.kind === 'error' ? (
        <div className={styles.errorBlock} role="alert">
          <p className={styles.queryEcho}>
            <span className={styles.queryLabelPrefix}>{t('searchBuddy.faith.queryLabel')}</span>{' '}
            <span>{outcome.query}</span>
          </p>
          <p className={styles.message}>{outcome.notice}</p>
          <RetryButton
            availableAt={outcome.retryAvailableAt}
            busy={busy}
            onRetry={() => onRetrySearch(outcome.query)}
          />
        </div>
      ) : null}

      {outcome.kind === 'empty' ? (
        <div className={styles.emptyState}>
          <p className={styles.queryEcho}>
            <span className={styles.queryLabelPrefix}>{t('searchBuddy.faith.queryLabel')}</span>{' '}
            <span>{outcome.query}</span>
          </p>
          <p className={styles.emptyTitle} role="status">
            {t('searchBuddy.faith.noPassage')}
          </p>
          <p className={styles.message}>{t('searchBuddy.faith.emptyHint')}</p>
          <div className={styles.emptyActions}>
            <button type="button" className={styles.primaryAction} onClick={onKeywordSearch}>
              {t('searchBuddy.faith.keywordSearch')}
            </button>
            <button type="button" className={styles.seeMore} onClick={onOpenToc} disabled={!manifest}>
              {t('searchBuddy.faith.toc')}
            </button>
          </div>
        </div>
      ) : null}

      {outcome.kind === 'matches' ? (
        <FaithAndOrderPassageList
          response={outcome.response}
          onOpenSection={onOpenSection}
        />
      ) : null}
    </div>
  )
}

function FaithAndOrderPassageList({
  response,
  onOpenSection,
}: {
  response: FaithAndOrderSearchResponse
  onOpenSection: (target: SectionTarget) => void
}) {
  const t = useTranslation()
  const cards = layoutFaithAndOrderResults(response.results)
  return (
    <div>
      <p className={styles.queryEcho}>
        <span className={styles.queryLabelPrefix}>{t('searchBuddy.faith.queryLabel')}</span>{' '}
        <span>{response.query}</span>
      </p>
      <p className={styles.matchCount}>
        {cards.length === 1
          ? t('searchBuddy.faith.matchCountOne')
          : t('searchBuddy.faith.matchCount', { count: cards.length })}
      </p>
      <ul className={styles.passageList} aria-label={t('searchBuddy.faith.resultsAria')}>
        {cards.map((card) => (
          <li key={card.match.id}>
            <article className={styles.passageCard} aria-labelledby={`faith-order-section-${card.match.id}`}>
              <p className={styles.documentTitle} lang="en">
                {response.source.title}
              </p>
              <h3 id={`faith-order-section-${card.match.id}`} className={styles.sectionTitle} lang="en">
                {card.match.section_title}
              </h3>
              {card.contextBefore.map((paragraph) => (
                <ParagraphBlock key={paragraph.id} paragraph={paragraph} role="context" />
              ))}
              <ParagraphBlock paragraph={card.match} role="match" />
              {card.contextAfter.map((paragraph) => (
                <ParagraphBlock key={paragraph.id} paragraph={paragraph} role="context" />
              ))}
              <button
                type="button"
                className={styles.primaryAction}
                aria-label={t('searchBuddy.faith.openSectionAria', { title: card.match.section_title })}
                onClick={() =>
                  onOpenSection({
                    version: card.match.version,
                    sectionId: card.match.section_id,
                    paragraphId: card.match.id,
                    sectionTitle: card.match.section_title,
                    highlightNumber: card.match.paragraph_number,
                  })
                }
              >
                {t('searchBuddy.faith.openSection')}
              </button>
            </article>
          </li>
        ))}
      </ul>
    </div>
  )
}

export function FaithAndOrderToc({
  manifest,
  onOpenSection,
}: {
  manifest: FaithAndOrderManifest
  onOpenSection: (target: SectionTarget) => void
}) {
  const t = useTranslation()
  return (
    <div className={styles.thread}>
      <SourceNotices source={manifest} />
      <h3 className={styles.faithHeading}>{t('searchBuddy.faith.toc')}</h3>
      <nav aria-label={t('searchBuddy.faith.tocAria')}>
        <ol className={styles.tocList}>
          {manifest.sections.map((section) => (
            <li key={section.id}>
              <button
                type="button"
                className={styles.exampleButton}
                lang="en"
                onClick={() =>
                  onOpenSection({
                    version: manifest.version,
                    sectionId: section.id,
                    paragraphId: null,
                    sectionTitle: section.title,
                    highlightNumber: section.start_paragraph,
                  })
                }
              >
                {section.title}
              </button>
            </li>
          ))}
        </ol>
      </nav>
    </div>
  )
}

export function FaithAndOrderSectionReader({ target }: { target: SectionTarget }) {
  const t = useTranslation()
  const { uiLocale } = useLocale()
  const [reloadKey, setReloadKey] = useState(0)
  const [status, setStatus] = useState<'loading' | 'ready' | 'error'>('loading')
  const [notice, setNotice] = useState<string | null>(null)
  const [retryAvailableAt, setRetryAvailableAt] = useState<number | undefined>(undefined)
  const [paragraphs, setParagraphs] = useState<FaithAndOrderParagraph[] | null>(null)
  const [source, setSource] = useState<FaithAndOrderSource | null>(null)
  const [focusId, setFocusId] = useState<string | null>(target.paragraphId)

  useEffect(() => {
    const controller = new AbortController()
    let cancelled = false
    fetchFaithAndOrderSection(target.version, target.sectionId, { signal: controller.signal })
      .then((section) => {
        if (cancelled) return
        setSource(section.source)
        setParagraphs(section.paragraphs)
        const selected =
          section.paragraphs.find((paragraph) => paragraph.id === target.paragraphId) ||
          section.paragraphs.find((paragraph) => paragraph.paragraph_number === target.highlightNumber) ||
          null
        setFocusId(selected?.id ?? null)
        setStatus('ready')
      })
      .catch((error) => {
        if (cancelled || isSearchBuddyAbort(error)) return
        const retrySeconds = searchBuddyRetryAfterSeconds(error)
        setRetryAvailableAt(
          retrySeconds != null && retrySeconds > 0 ? Date.now() + retrySeconds * 1000 : undefined,
        )
        setNotice(searchBuddyUserNotice(error, uiLocale) || t('searchBuddy.errors.unknown'))
        setStatus('error')
      })
    return () => {
      cancelled = true
      controller.abort()
    }
  }, [target.version, target.sectionId, target.paragraphId, target.highlightNumber, reloadKey, uiLocale, t])

  useEffect(() => {
    if (status !== 'ready' || !focusId) return
    const el = document.getElementById(`faith-order-paragraph-${focusId}`)
    if (!el) return
    el.scrollIntoView({ block: 'center' })
    if (el instanceof HTMLElement) el.focus()
  }, [status, focusId, paragraphs])

  return (
    <article className={styles.thread} aria-label={t('searchBuddy.faith.readerAria')}>
      <SourceNotices source={source} />
      <h3 className={styles.sectionTitle} lang="en">
        {target.sectionTitle}
      </h3>
      {status === 'loading' ? (
        <p className={styles.loadingText} role="status">
          {t('searchBuddy.faith.sectionLoading')}
        </p>
      ) : null}
      {status === 'error' && notice ? (
        <div className={styles.errorBlock} role="alert">
          <p className={styles.message}>{notice}</p>
          <RetryButton
            availableAt={retryAvailableAt}
            onRetry={() => {
              setStatus('loading')
              setNotice(null)
              setParagraphs(null)
              setReloadKey((key) => key + 1)
            }}
          />
        </div>
      ) : null}
      {status === 'ready' && paragraphs ? (
        <div>
          {paragraphs.map((paragraph, index) => (
            <ParagraphBlock
              key={`${paragraph.id}:${index}`}
              paragraph={paragraph}
              role="reader"
              selected={paragraph.id === focusId}
            />
          ))}
        </div>
      ) : null}
    </article>
  )
}
