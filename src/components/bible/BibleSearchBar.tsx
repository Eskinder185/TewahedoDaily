import { useEffect, useId, useMemo, useRef, useState, type FormEvent } from 'react'
import { Link } from 'react-router-dom'
import {
  displayBookName,
  hasBilingualBookNames,
  matchCatalogBooks,
} from '../../lib/bible/bibleCatalogPresentation'
import type { CanonicalBook } from '../../lib/bible/bibleTypes'
import { searchBibleShared } from '../../lib/search/sharedBibleSearch'
import type { SearchBuddyApiResponse } from '../../lib/searchBuddy/apiTypes'
import { looksLikeAmharicBibleReference } from '../../lib/searchBuddy/amharicStructuredSearch'
import type { SiteSearchResult } from '../../lib/search/types'
import { useLocale } from '../../lib/i18n/locale'
import { VoiceTranscriptionControl } from '../search/VoiceTranscriptionControl'
import { SearchBuddyResults } from '../search/results/SearchBuddyResults'
import styles from './BibleSearchBar.module.css'

const COPY = {
  en: {
    label: 'Search the Bible',
    placeholder: 'Search books, chapters, verses, or words…',
    searching: 'Searching…',
    empty: 'No matching books or verses were found.',
    error: 'Bible search is temporarily unavailable. Please try again.',
    open: 'Open →',
    clear: 'Clear',
    voiceAria: 'Search the Bible by voice',
    voiceHint: 'Review the transcript, then search.',
    books: 'Books',
    book: 'Bible book',
  },
  am: {
    label: '\u1218\u133d\u1210\u134d \u1245\u12f1\u1235\u1295 \u1348\u120d\u130d',
    placeholder:
      '\u1218\u133b\u1215\u134d\u1275\u1363 \u121d\u12d5\u122b\u134e\u127d\u1363 \u1241\u1325\u122e\u127d \u12c8\u12ed\u121d \u1243\u120b\u1275\u1295 \u1348\u120d\u1309\u2026',
    searching: '\u1260\u1218\u1348\u1208\u130d \u120b\u12ed\u2026',
    empty:
      '\u1270\u1218\u1233\u1233\u12ed \u1218\u133d\u1210\u134d \u12c8\u12ed\u121d \u1241\u1325\u122d \u12a0\u120d\u1270\u1308\u1298\u121d\u1362',
    error:
      '\u12e8\u1218\u133d\u1210\u134d \u1245\u12f1\u1235 \u134d\u1208\u130b \u1208\u130a\u12dc\u12cd \u12a0\u12ed\u1308\u129d\u121d\u1362 \u12a5\u1263\u12ad\u12ce \u12a5\u1295\u12f0\u1308\u1293 \u12ed\u121e\u12ad\u1229\u1362',
    open: '\u12ad\u1348\u1275 \u2192',
    clear: '\u12a0\u133d\u12f3',
    voiceAria: '\u1218\u133d\u1210\u134d \u1245\u12f1\u1235\u1295 \u1260\u12f5\u121d\u1335 \u1348\u120d\u130d',
    voiceHint: 'Review the transcript, then search.',
    books: '\u1218\u133b\u1215\u134d\u1275',
    book: '\u1218\u133d\u1210\u134d',
  },
} as const

function shouldSearchImmediately(query: string): boolean {
  // Debounce hint only — resolution is always POST /api/chat via resolveBibleQuery.
  // No local book-name / spoken-number parsing.
  if (looksLikeAmharicBibleReference(query)) return true
  if (/\d+\s*[:\u1365]\s*\d+/.test(query)) return true
  if (/[A-Za-z].*\d/.test(query)) return true
  return false
}

type Props = {
  /** Canonical catalog books for instant local book-name matches. */
  catalogBooks?: CanonicalBook[]
}

export function BibleSearchBar({ catalogBooks = [] }: Props) {
  const { uiLocale } = useLocale()
  const copy = COPY[uiLocale]
  const inputId = useId()
  const listId = useId()
  const [query, setQuery] = useState('')
  const [siteResults, setSiteResults] = useState<SiteSearchResult[]>([])
  const [structured, setStructured] = useState<SearchBuddyApiResponse | null>(null)
  const [status, setStatus] = useState<'idle' | 'loading' | 'empty' | 'error' | 'ready'>('idle')
  const [message, setMessage] = useState<string | null>(null)
  const [voicePending, setVoicePending] = useState(false)
  const requestIdRef = useRef(0)
  const abortRef = useRef<AbortController | null>(null)
  const debounceRef = useRef<number | null>(null)
  const inputRef = useRef<HTMLInputElement>(null)

  const bookHits = useMemo(
    () => matchCatalogBooks(query, catalogBooks, 8),
    [query, catalogBooks],
  )

  useEffect(() => {
    return () => {
      if (debounceRef.current != null) window.clearTimeout(debounceRef.current)
      abortRef.current?.abort()
    }
  }, [])

  async function runSearch(raw: string) {
    const q = raw.trim()
    setVoicePending(false)
    if (!q) {
      abortRef.current?.abort()
      setSiteResults([])
      setStructured(null)
      setStatus('idle')
      setMessage(null)
      return
    }
    const requestId = ++requestIdRef.current
    abortRef.current?.abort()
    const controller = new AbortController()
    abortRef.current = controller
    setStatus('loading')
    setMessage(null)
    try {
      // Shared resolveBibleQuery → POST /api/chat (same as Search Buddy Bible path).
      // Empty Amharic copy only after the backend resolver has finished.
      const response = await searchBibleShared(q, {
        language: uiLocale === 'am' ? 'am' : 'en',
        textLimit: 12,
        signal: controller.signal,
      })
      if (requestId !== requestIdRef.current) return
      setStructured(response.structured)
      // When structured bible_* is present, SearchBuddyResults owns the UI.
      setSiteResults(response.structured ? [] : response.siteResults)
      setMessage(response.intentMessage)
      setStatus(response.empty ? 'empty' : 'ready')
    } catch (_error) {
      if (controller.signal.aborted || requestId !== requestIdRef.current) return
      setSiteResults([])
      setStructured(null)
      setStatus('error')
      setMessage(copy.error)
    }
  }

  function scheduleSearch(next: string) {
    if (debounceRef.current != null) window.clearTimeout(debounceRef.current)
    const trimmed = next.trim()
    if (!trimmed) {
      void runSearch('')
      return
    }
    const delay = shouldSearchImmediately(trimmed) ? 80 : 320
    debounceRef.current = window.setTimeout(() => {
      void runSearch(trimmed)
    }, delay)
  }

  function applyTranscript(text: string) {
    // Editable before submit — same policy as Search Buddy composer (no auto-navigate).
    const transcript = text.trim()
    if (!transcript) return
    if (debounceRef.current != null) window.clearTimeout(debounceRef.current)
    setQuery(transcript)
    setVoicePending(true)
    setStatus('idle')
    setSiteResults([])
    setStructured(null)
    setMessage(null)
    window.setTimeout(() => inputRef.current?.focus(), 0)
  }

  function onSubmit(event: FormEvent) {
    event.preventDefault()
    if (debounceRef.current != null) window.clearTimeout(debounceRef.current)
    void runSearch(query)
  }

  const showStructured =
    structured &&
    (structured.type === 'bible_reference' ||
      structured.type === 'bible_chapter' ||
      structured.type === 'bible_search')

  const showBookHits = bookHits.length > 0 && !showStructured
  const showEmpty =
    status === 'empty' && !showBookHits && !showStructured && siteResults.length === 0

  return (
    <div className={styles.root}>
      <form className={styles.form} onSubmit={onSubmit} role="search">
        <label className={styles.srOnly} htmlFor={inputId}>
          {copy.label}
        </label>
        <div className={styles.field}>
          <span className={styles.icon} aria-hidden>
            ⌕
          </span>
          <input
            id={inputId}
            ref={inputRef}
            className={styles.input}
            value={query}
            onChange={(event) => {
              const next = event.target.value
              setQuery(next)
              setVoicePending(false)
              scheduleSearch(next)
            }}
            placeholder={copy.placeholder}
            autoComplete="off"
            enterKeyHint="search"
            aria-controls={listId}
            aria-expanded={
              siteResults.length > 0 || showBookHits || Boolean(showStructured)
            }
          />
          {query ? (
            <button
              type="button"
              className={styles.clear}
              onClick={() => {
                setQuery('')
                setVoicePending(false)
                void runSearch('')
              }}
            >
              {copy.clear}
            </button>
          ) : null}
        </div>
        <div className={styles.voiceRow}>
          <VoiceTranscriptionControl
            ariaLabel={copy.voiceAria}
            defaultLanguage="am"
            onTranscript={applyTranscript}
          />
          {voicePending ? (
            <p className={styles.voiceHint} role="status">
              {copy.voiceHint}
            </p>
          ) : null}
        </div>
      </form>

      {status === 'loading' ? (
        <p className={styles.status} role="status">
          {copy.searching}
        </p>
      ) : null}
      {showEmpty ? (
        <p className={styles.status} role="status">
          {copy.empty}
        </p>
      ) : null}
      {status === 'error' && message ? (
        <p className={styles.status} role="alert">
          {message}
        </p>
      ) : null}

      {showBookHits ? (
        <ul id={listId} className={styles.results} aria-label={copy.books}>
          {bookHits.map((book) => {
            const primary = displayBookName(book, uiLocale)
            const secondaryLang = uiLocale === 'am' ? 'en' : 'am'
            const secondary = displayBookName(book, secondaryLang)
            return (
              <li key={book.id}>
                <Link to={`/bible/${book.slug}`} className={styles.result}>
                  <div className={styles.resultBody}>
                    <p className={styles.resultType}>{copy.book}</p>
                    <h3 className={styles.resultTitle} lang={uiLocale}>
                      {primary}
                    </h3>
                    {hasBilingualBookNames(book) &&
                    secondary !== primary &&
                    secondary !== book.slug ? (
                      <p className={styles.resultMeta} lang={secondaryLang}>
                        {secondary}
                      </p>
                    ) : null}
                  </div>
                  <span className={styles.resultOpen}>{copy.open}</span>
                </Link>
              </li>
            )
          })}
        </ul>
      ) : null}

      {showStructured ? (
        <div id={listId} className={styles.structured} aria-label={copy.label}>
          <SearchBuddyResults response={structured} empty={false} />
        </div>
      ) : null}

      {!showStructured && siteResults.length > 0 ? (
        <ul
          id={showBookHits ? undefined : listId}
          className={styles.results}
          aria-label={copy.label}
        >
          {siteResults.map((result) => {
            const ethiopic =
              /[\u1200-\u137F]/.test(result.excerpt || '') ||
              Boolean(result.sourceLabel?.includes('Amharic'))
            return (
              <li key={`${result.sourceType}:${result.sourceId}`}>
                <Link to={result.route} className={styles.result}>
                  <div className={styles.resultBody}>
                    <p className={styles.resultType}>{result.typeLabel}</p>
                    <h3
                      className={styles.resultTitle}
                      lang={/[\u1200-\u137F]/.test(result.title) ? 'am' : undefined}
                    >
                      {result.title}
                    </h3>
                    {result.description ? (
                      <p className={styles.resultMeta}>{result.description}</p>
                    ) : null}
                    {result.excerpt ? (
                      <p className={styles.resultExcerpt} lang={ethiopic ? 'am' : undefined}>
                        {result.excerpt}
                      </p>
                    ) : null}
                  </div>
                  <span className={styles.resultOpen}>{copy.open}</span>
                </Link>
              </li>
            )
          })}
        </ul>
      ) : null}
    </div>
  )
}
