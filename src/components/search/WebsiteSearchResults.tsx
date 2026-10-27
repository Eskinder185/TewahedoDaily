import { Link } from 'react-router-dom'
import { useTranslation } from '../../i18n'
import { isPublicContentRoute } from '../../lib/search/searchCore'
import { isNavigationResult } from '../../lib/search/siteSearchStatus'
import type { SiteSearchResponse, SiteSearchResult, SiteSourceReport } from '../../lib/search/types'
import styles from './SearchBuddy.module.css'

export type WebsiteOutcome =
  | { kind: 'idle' }
  | { kind: 'loading'; query: string }
  | { kind: 'results'; query: string; response: SiteSearchResponse }
  | { kind: 'empty'; query: string; response: SiteSearchResponse }
  | {
      kind: 'error'
      query: string
      notice: string
      retryAvailableAt?: number
      response?: SiteSearchResponse
    }

function sourceLabel(name: string, t: (key: string) => string): string {
  const key = `searchBuddy.website.sources.${name}`
  const label = t(key)
  return label === key ? name : label
}

function resultTypeLabel(result: SiteSearchResult, t: (key: string) => string): string {
  const key = `searchBuddy.website.types.${result.sourceType}`
  const label = t(key)
  return label === key ? result.typeLabel : label
}

function resultHref(result: SiteSearchResult): string | null {
  if (!isPublicContentRoute(result.route)) return null
  if (result.sourceType !== 'bible-verse' || result.route.includes('#')) return result.route
  const verse = /:(\d+)\s*$/.exec(result.title)
  if (!verse) return result.route
  return `${result.route}#verse-${verse[1]}`
}

function excerptLang(result: SiteSearchResult): 'en' | 'am' | undefined {
  const label = (result.sourceLabel || '').toLowerCase()
  if (label.includes('amharic') && !label.includes('english')) return 'am'
  if (label.includes('english') || result.sourceType.startsWith('bible')) return 'en'
  return undefined
}

function FailedCatalogs({ sources }: { sources: SiteSourceReport[] }) {
  const t = useTranslation()
  const failed = sources.filter((source) => source.status === 'failed')
  if (!failed.length) return null
  return (
    <div role="alert">
      <p className={styles.message}>{t('searchBuddy.website.catalogFailed')}</p>
      <ul className={styles.failureList}>
        {failed.map((source) => (
          <li key={source.name}>{sourceLabel(source.name, t)}</li>
        ))}
      </ul>
    </div>
  )
}

function ResultList({
  results,
  label,
  onOpen,
}: {
  results: SiteSearchResult[]
  label: string
  onOpen: () => void
}) {
  const t = useTranslation()
  if (!results.length) return null
  return (
    <div>
      <h4 className={styles.faithHeading}>{label}</h4>
      <ul className={styles.passageList} aria-label={label}>
        {results.map((result) => {
          const href = resultHref(result)
          if (!href) return null
          const excerpt = result.excerpt?.trim() || result.description?.trim() || ''
          const amharic = result.titleAmharic.trim()
          return (
            <li key={`${result.sourceType}:${result.sourceId}`}>
              <article className={styles.passageCard}>
                <p className={styles.contextLabel}>{resultTypeLabel(result, t)}</p>
                <h3 className={styles.sectionTitle}>
                  <Link className={styles.websiteLink} to={href} onClick={onOpen}>
                    {result.title}
                  </Link>
                </h3>
                {amharic && amharic !== result.title ? <p lang="am">{amharic}</p> : null}
                {excerpt ? (
                  <p className={styles.websiteExcerpt} lang={excerptLang(result)}>
                    {excerpt}
                  </p>
                ) : null}
                {result.dateLabel ? <p className={styles.passageLocator}>{result.dateLabel}</p> : null}
                <Link className={styles.openResult} to={href} onClick={onOpen}>
                  {t('searchBuddy.open')}
                </Link>
              </article>
            </li>
          )
        })}
      </ul>
    </div>
  )
}

export type DomainFilterKind = 'all' | 'bible' | 'mezmur' | 'prayer' | 'calendar' | 'library'

function matchesDomain(result: SiteSearchResult, domain?: DomainFilterKind): boolean {
  if (!domain || domain === 'all') return true
  if (domain === 'bible') return result.sourceType.startsWith('bible')
  if (domain === 'mezmur') {
    return (
      result.sourceType === 'mezmur' ||
      result.sourceType === 'zemari' ||
      result.sourceType.startsWith('hymn')
    )
  }
  if (domain === 'prayer') {
    return (
      result.sourceType.startsWith('prayer') ||
      result.sourceType === 'liturgy' ||
      result.sourceType === 'guide'
    )
  }
  if (domain === 'calendar') {
    return (
      result.sourceType === 'calendar' ||
      result.sourceType.startsWith('synaxarium') ||
      result.sourceType === 'feast' ||
      result.sourceType === 'saint'
    )
  }
  if (domain === 'library') {
    return result.sourceType === 'church_library' || result.sourceType === 'learn'
  }
  return true
}

export function WebsiteSearchPane({
  outcome,
  onRetry,
  onOpen,
  hideQueryEcho = false,
  domainFilter = 'all',
}: {
  outcome: WebsiteOutcome
  onRetry: (query: string) => void
  onOpen: () => void
  hideQueryEcho?: boolean
  domainFilter?: DomainFilterKind
}) {
  const t = useTranslation()
  if (outcome.kind === 'idle') return null
  const response = outcome.kind === 'error' ? outcome.response : outcome.kind === 'loading' ? undefined : outcome.response

  return (
    <div className={styles.thread}>
      {outcome.kind === 'loading' ? (
        <p className={styles.loadingText} role="status">
          {t('searchBuddy.website.searching')}
        </p>
      ) : null}
      {outcome.kind === 'error' ? (
        <div className={styles.errorBlock} role="alert">
          {hideQueryEcho ? null : (
            <p className={styles.queryEcho}>
              <span className={styles.queryLabelPrefix}>{t('searchBuddy.faith.queryLabel')}</span>{' '}
              <span>{outcome.query}</span>
            </p>
          )}
          <p className={styles.message}>{outcome.notice}</p>
          {outcome.response ? (
            <ul className={styles.failureList}>
              {outcome.response.sources
                .filter((source) => source.status === 'failed')
                .map((source) => (
                  <li key={source.name}>{sourceLabel(source.name, t)}</li>
                ))}
            </ul>
          ) : null}
          <button type="button" className={styles.retryBtn} onClick={() => onRetry(outcome.query)}>
            {t('searchBuddy.retry')}
          </button>
        </div>
      ) : null}
      {outcome.kind === 'empty' ? (
        <div className={styles.emptyState}>
          {hideQueryEcho ? null : (
            <p className={styles.queryEcho}>
              <span className={styles.queryLabelPrefix}>{t('searchBuddy.faith.queryLabel')}</span>{' '}
              <span>{outcome.query}</span>
            </p>
          )}
          <p className={styles.emptyTitle} role="status">
            {t('searchBuddy.website.noRecords')}
          </p>
          <FailedCatalogs sources={outcome.response.sources} />
        </div>
      ) : null}
      {outcome.kind === 'results' && response ? (
        <div>
          {hideQueryEcho ? null : (
            <p className={styles.queryEcho}>
              <span className={styles.queryLabelPrefix}>{t('searchBuddy.faith.queryLabel')}</span>{' '}
              <span>{outcome.query}</span>
            </p>
          )}
          <p className={styles.matchCount}>
            {response.results.length === 1
              ? t('searchBuddy.website.matchCountOne')
              : t('searchBuddy.website.matchCount', { count: response.results.length })}
          </p>
          <FailedCatalogs sources={response.sources} />
          <ResultList
            results={response.results.filter((result) => !isNavigationResult(result) && matchesDomain(result, domainFilter))}
            label={t('searchBuddy.website.records')}
            onOpen={onOpen}
          />
          <ResultList
            results={response.results.filter((result) => isNavigationResult(result))}
            label={t('searchBuddy.website.pages')}
            onOpen={onOpen}
          />
        </div>
      ) : null}
    </div>
  )
}
