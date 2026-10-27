import { Link } from 'react-router-dom'
import { useTranslation } from '../../i18n'
import type { ChurchLibrarySearchResponse } from '../../lib/searchBuddy/churchLibrarySearch'
import styles from './SearchBuddy.module.css'

export type ChurchLibraryOutcome =
  | { kind: 'idle' }
  | { kind: 'loading'; query: string }
  | { kind: 'results'; query: string; response: ChurchLibrarySearchResponse }
  | { kind: 'empty'; query: string }
  | { kind: 'error'; query: string; notice: string }

function locator(hit: ChurchLibrarySearchResponse['results'][number]) {
  if (hit.locator_label) return hit.locator_label
  if (hit.page_start && hit.page_end && hit.page_start !== hit.page_end) return `Pages ${hit.page_start}–${hit.page_end}`
  if (hit.page_start) return `Page ${hit.page_start}`
  return hit.chapter_reference || 'Passage reference unavailable'
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

export function ChurchLibrarySources({ outcome }: { outcome: ChurchLibraryOutcome }) {
  const t = useTranslation()
  if (outcome.kind === 'idle' || outcome.kind === 'loading' || outcome.kind === 'empty') return null
  if (outcome.kind === 'error') return <p className={styles.message} role="status">{outcome.notice}</p>
  return (
    <section aria-labelledby="church-library-sources">
      <h3 id="church-library-sources">{t('searchBuddy.churchLibrarySources')}</h3>
      <p className={styles.relatedNote}>{t('searchBuddy.churchLibraryNote')}</p>
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
              <Link to={`/library/${hit.book_id}`} className={styles.websiteLink}>
                📖 {t('library.readBook')} →
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
