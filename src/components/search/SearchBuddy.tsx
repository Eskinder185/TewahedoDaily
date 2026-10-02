import { useEffect, useId, useRef, useState, type FormEvent } from 'react'
import { createPortal } from 'react-dom'
import { useAuth } from '../../lib/auth/useAuth'
import { buildAssistantReply, searchSite } from '../../lib/search/searchSite'
import type { SiteSearchResult } from '../../lib/search/types'
import { SearchResultCard } from './SearchResultCard'
import styles from './SearchBuddy.module.css'

const STARTERS = [
  'Find Meskel hymns',
  'Learn how to pray',
  'Find a Zemari',
  'Show fasting information',
  'Open Calendar',
  'Find prayers',
]

export function SearchBuddy() {
  const { user } = useAuth()
  const [open, setOpen] = useState(false)
  const [query, setQuery] = useState('')
  const [busy, setBusy] = useState(false)
  const [message, setMessage] = useState(
    'Ask for a hymn, prayer, Zemari, feast, or page — I will take you there.',
  )
  const [results, setResults] = useState<SiteSearchResult[]>([])
  const titleId = useId()
  const inputRef = useRef<HTMLInputElement>(null)
  const closeRef = useRef<HTMLButtonElement>(null)

  useEffect(() => {
    if (!open) return
    const t = window.setTimeout(() => inputRef.current?.focus(), 40)
    const onKey = (e: KeyboardEvent) => {
      if (e.key === 'Escape') setOpen(false)
    }
    document.addEventListener('keydown', onKey)
    const prev = document.body.style.overflow
    document.body.style.overflow = 'hidden'
    return () => {
      window.clearTimeout(t)
      document.removeEventListener('keydown', onKey)
      document.body.style.overflow = prev
    }
  }, [open])

  async function runSearch(raw: string) {
    const q = raw.trim()
    if (!q) return
    setBusy(true)
    setMessage('Searching Tewahedo Daily…')
    try {
      const response = await searchSite(q, {
        limit: 10,
        includePersonal: true,
        userId: user?.id ?? null,
      })
      setResults(response.results)
      setMessage(buildAssistantReply(response))
      if (
        response.results.length === 1 &&
        (response.results[0].matchKind === 'intent' || response.results[0].matchKind === 'personal')
      ) {
        // Soft hint only — user still clicks Open
      }
    } catch {
      setResults([])
      setMessage('Search is temporarily unavailable. Try browsing Hymns Practice or Pray.')
    } finally {
      setBusy(false)
    }
  }

  function onSubmit(e: FormEvent) {
    e.preventDefault()
    void runSearch(query)
  }

  const panel =
    open &&
    createPortal(
      <div className={styles.root}>
        <button
          type="button"
          className={styles.backdrop}
          aria-label="Close assistant"
          onClick={() => setOpen(false)}
        />
        <section
          className={styles.panel}
          role="dialog"
          aria-modal="true"
          aria-labelledby={titleId}
        >
          <header className={styles.header}>
            <div>
              <h2 id={titleId}>Tewahedo Daily Assistant</h2>
              <p>Find hymns, prayers, saints, calendar events, and pages.</p>
            </div>
            <button
              ref={closeRef}
              type="button"
              className={styles.close}
              aria-label="Close"
              onClick={() => setOpen(false)}
            >
              ×
            </button>
          </header>
          <div className={styles.body}>
            <form className={styles.form} onSubmit={onSubmit}>
              <input
                ref={inputRef}
                value={query}
                onChange={(e) => setQuery(e.target.value)}
                placeholder="Find Meskel hymns, Calendar, a Zemari…"
                aria-label="Search Tewahedo Daily"
                autoComplete="off"
              />
              <button type="submit" disabled={busy || !query.trim()}>
                {busy ? '…' : 'Find'}
              </button>
            </form>

            {!results.length ? (
              <div className={styles.suggestions}>
                {STARTERS.map((s) => (
                  <button
                    key={s}
                    type="button"
                    className={styles.chip}
                    onClick={() => {
                      setQuery(s)
                      void runSearch(s)
                    }}
                  >
                    {s}
                  </button>
                ))}
              </div>
            ) : null}

            <p className={styles.message} role="status">
              {message}
            </p>

            {busy ? <p className={styles.status}>Looking…</p> : null}

            <div className={styles.results}>
              {results.map((result) => (
                <SearchResultCard
                  key={`${result.sourceType}:${result.sourceId}:${result.route}`}
                  result={result}
                  onOpen={() => {
                    setOpen(false)
                  }}
                />
              ))}
            </div>
          </div>
        </section>
      </div>,
      document.body,
    )

  return (
    <>
      <button
        type="button"
        className={styles.fab}
        aria-haspopup="dialog"
        aria-expanded={open}
        onClick={() => setOpen(true)}
      >
        Find Something
      </button>
      {panel}
    </>
  )
}
