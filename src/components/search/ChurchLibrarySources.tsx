import { Link } from 'react-router-dom'
import { useTranslation } from '../../i18n'
import type { ChurchLibrarySearchResponse } from '../../lib/searchBuddy/churchLibrarySearch'
import styles from './SearchBuddy.module.css'

export type ChurchLibraryOutcome =
  | { kind: 'idle' }
  | { kind: 'loading'; query: string }
  | { kind: 'results'; query: string; response: ChurchLibrarySearchResponse }
  | { kind: 'empty'; query: string; response?: ChurchLibrarySearchResponse }
  | { kind: 'error'; query: string; notice: string }

/**
 * Source reference: chapter › section · pages. Page numbers come only from the
 * passage row (set at import when the source layout is known); never guessed.
 */
function locator(hit: ChurchLibrarySearchResponse['results'][number]) {
  const place = [hit.chapter_reference, hit.locator_label]
    .filter((part): part is string => Boolean(part && part.trim()))
    .filter((part, index, all) => all.indexOf(part) === index)
    .join(' › ')
  let pages = ''
  if (hit.page_start && hit.page_end && hit.page_start !== hit.page_end) pages = `pp. ${hit.page_start}–${hit.page_end}`
  else if (hit.page_start) pages = `p. ${hit.page_start}`
  const label = [place, pages].filter(Boolean).join(' · ')
  return label || 'Passage reference unavailable'
}

function safeSourceUrl(value: string | null) {
  if (!value) return null
  try {
    const url = new URL(value)
    return url.protocol === 'https:' || url.protocol === 'http:' ? url.toString() : null
  } catch {
    return null
  }
}

export function ChurchLibrarySources({
  outcome,
  showEmptyNotice = false,
  onRetry,
}: {
  outcome: ChurchLibraryOutcome
  /** Show the "no source evidence" notice for teaching questions or library-only searches. */
  showEmptyNotice?: boolean
  onRetry?: (query: string) => void
}) {
  const t = useTranslation()
  if (outcome.kind === 'idle' || outcome.kind === 'loading') return null
  if (outcome.kind === 'empty') {
    if (!showEmptyNotice) return null
    // No indexed passage cleared the relevance floor: say so instead of
    // implying the Church Library supports an answer.
    const notice = outcome.response?.availability === 'no_indexed_content'
      ? 'The Church Library has public books, but no searchable passages are indexed yet.'
      : outcome.response?.availability === 'no_public_books'
        ? 'No Church Library books are currently authorized for public retrieval.'
        : t('searchBuddy.churchLibraryNoEvidence')
    return <p className={styles.relatedNote} role="status">{notice}</p>
  }
  if (outcome.kind === 'error') return (
    <div className={styles.message} role="status">
      <p>{outcome.notice}</p>
      {onRetry ? <button type="button" onClick={() => onRetry(outcome.query)}>Retry Church Library search</button> : null}
    </div>
  )
  return (
    <section aria-labelledby="church-library-sources">
      <h3 id="church-library-sources">{t('searchBuddy.churchLibrarySources')}</h3>
      <p className={styles.relatedNote}>{t('searchBuddy.churchLibraryNote')}</p>
      {outcome.response.answer ? (
        <div className={styles.passageCard} role="status">
          <strong>Source-grounded answer</strong>
          <p className={styles.passageText}>{outcome.response.answer}</p>
          <small>This is an exact excerpt from the highest-ranked source; the citation below identifies it.</small>
        </div>
      ) : null}
      {outcome.response.results.map((hit) => {
        const sourceUrl = safeSourceUrl(hit.source_url)
        return (
          <article className={styles.passageCard} key={hit.passage_id}>
            <blockquote className={styles.sourceQuote} lang={hit.language === 'am' || hit.language === 'gez' ? 'am' : 'en'}>
              <p className={styles.passageText}>{hit.excerpt}</p>
            </blockquote>
            <p className={styles.attribution}>
              <strong>{hit.title}</strong>{hit.author ? ` — ${hit.author}` : ''} · {locator(hit)}
            </p>
            <div style={{ display: 'flex', gap: '1rem', marginTop: '0.5rem', fontSize: '0.875rem' }}>
              <Link to={`/library/${hit.book_id}?passage=${encodeURIComponent(hit.passage_id)}`} className={styles.websiteLink}>
                📖 {t('searchBuddy.churchLibraryOpenSource')} →
              </Link>
              {sourceUrl ? (
                <a href={sourceUrl} target="_blank" rel="noreferrer">
                  {t('searchBuddy.churchLibraryOpenSource')}
                </a>
              ) : null}
            </div>
          </article>
        )
      })}
    </section>
  )
}
