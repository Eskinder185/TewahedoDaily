import { useEffect, useId, useRef, useState, type FormEvent } from 'react'
import { Link } from 'react-router-dom'
import { searchBible } from '../../lib/bible/bibleSearch'
import { parseBibleReference } from '../../lib/bible/parseBibleReference'
import type { SiteSearchResult } from '../../lib/search/types'
import { useLocale } from '../../lib/i18n/locale'
import { VoiceTranscriptionControl } from '../search/VoiceTranscriptionControl'
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
  },
} as const

function shouldSearchImmediately(query: string): boolean {
  return parseBibleReference(query).isReference
}

export function BibleSearchBar() {
  const { uiLocale } = useLocale()
  const copy = COPY[uiLocale]
  const inputId = useId()
  const listId = useId()
  const [query, setQuery] = useState('')
  const [results, setResults] = useState<SiteSearchResult[]>([])
  const [status, setStatus] = useState<'idle' | 'loading' | 'empty' | 'error' | 'ready'>('idle')
  const [message, setMessage] = useState<string | null>(null)
  const requestIdRef = useRef(0)
  const debounceRef = useRef<number | null>(null)
  const inputRef = useRef<HTMLInputElement>(null)

  useEffect(() => {
    return () => {
      if (debounceRef.current != null) window.clearTimeout(debounceRef.current)
    }
  }, [])

  async function runSearch(raw: string) {
    const q = raw.trim()
    if (!q) {
      setResults([])
      setStatus('idle')
      setMessage(null)
      return
    }
    const requestId = ++requestIdRef.current
    setStatus('loading')
    setMessage(null)
    try {
      const response = await searchBible(q, {
        language: uiLocale === 'am' ? 'am' : 'en',
        textLimit: 12,
      })
      if (requestId !== requestIdRef.current) return
      setResults(response.results)
      setMessage(response.intentMessage)
      setStatus(response.results.length ? 'ready' : 'empty')
    } catch {
      if (requestId !== requestIdRef.current) return
      setResults([])
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
    const transcript = text.trim()
    if (!transcript) return
    setQuery(transcript)
    scheduleSearch(transcript)
    window.setTimeout(() => inputRef.current?.focus(), 0)
  }

  function onSubmit(event: FormEvent) {
    event.preventDefault()
    if (debounceRef.current != null) window.clearTimeout(debounceRef.current)
    void runSearch(query)
  }

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
              scheduleSearch(next)
            }}
            placeholder={copy.placeholder}
            autoComplete="off"
            enterKeyHint="search"
            aria-controls={listId}
            aria-expanded={results.length > 0}
          />
          {query ? (
            <button
              type="button"
              className={styles.clear}
              onClick={() => {
                setQuery('')
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
            onTranscript={applyTranscript}
          />
        </div>
      </form>

      {status === 'loading' ? (
        <p className={styles.status} role="status">
          {copy.searching}
        </p>
      ) : null}
      {status === 'empty' ? (
        <p className={styles.status} role="status">
          {copy.empty}
        </p>
      ) : null}
      {status === 'error' && message ? (
        <p className={styles.status} role="alert">
          {message}
        </p>
      ) : null}

      {results.length > 0 ? (
        <ul id={listId} className={styles.results} aria-label={copy.label}>
          {results.map((result) => {
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
