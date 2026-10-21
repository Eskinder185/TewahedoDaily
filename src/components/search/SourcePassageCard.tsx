import { useEffect, useState } from 'react'
import { useTranslation } from '../../i18n'
import type {
  FaithAndOrderSearchHit,
  FaithAndOrderSearchResponse,
} from '../../lib/searchBuddy/faithAndOrderSearch.ts'
import { selectFaithAndOrderPassage, type TeachingTopic } from '../../lib/searchBuddy/teachingTopics.ts'
import styles from './SearchBuddy.module.css'

export type DocumentOutcome =
  | { kind: 'idle' }
  | { kind: 'loading'; query: string; topic: TeachingTopic }
  | {
      kind: 'matches'
      query: string
      topic: TeachingTopic
      response: FaithAndOrderSearchResponse
    }
  | {
      kind: 'empty'
      query: string
      topic: TeachingTopic
      response: FaithAndOrderSearchResponse
    }
  | {
      kind: 'error'
      query: string
      topic: TeachingTopic
      notice: string
      retryAvailableAt?: number
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

function PassageQuote({
  hit,
  related,
}: {
  hit: FaithAndOrderSearchHit
  related: boolean
}) {
  const t = useTranslation()
  return (
    <article className={styles.passageCard}>
      {related ? <p className={styles.relatedNote}>{t('searchBuddy.faith.relatedPassage')}</p> : null}
      <blockquote className={styles.sourceQuote} lang="en">
        <p className={hit.is_heading ? styles.passageHeading : styles.passageText}>{hit.text}</p>
      </blockquote>
      <p className={styles.attribution}>
        {t('searchBuddy.faith.attribution', {
          section: hit.section_title,
          number: hit.paragraph_number,
        })}
      </p>
    </article>
  )
}

export function SourcePassagePane({
  outcome,
  busy,
  onRetry,
}: {
  outcome: DocumentOutcome
  busy: boolean
  onRetry: (query: string, topic: TeachingTopic) => void
}) {
  const t = useTranslation()
  if (outcome.kind === 'idle') return null

  if (outcome.kind === 'loading') {
    return (
      <p className={styles.loadingText} role="status">
        {t('searchBuddy.faith.searchingPassage')}
      </p>
    )
  }

  if (outcome.kind === 'error') {
    return (
      <div className={styles.errorBlock} role="alert">
        <p className={styles.message}>{outcome.notice}</p>
        <RetryButton
          availableAt={outcome.retryAvailableAt}
          busy={busy}
          onRetry={() => onRetry(outcome.query, outcome.topic)}
        />
      </div>
    )
  }

  const selected =
    outcome.kind === 'matches' ? selectFaithAndOrderPassage(outcome.topic, outcome.response) : { kind: 'none' as const, topic: outcome.topic }

  if (selected.kind === 'validated' || selected.kind === 'related') {
    return <PassageQuote hit={selected.hit} related={selected.kind === 'related'} />
  }

  return (
    <p className={styles.message} role="status">
      {t('searchBuddy.faith.noSupportingPassage')}
    </p>
  )
}
