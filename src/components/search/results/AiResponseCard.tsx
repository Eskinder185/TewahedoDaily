import { useTranslation } from '../../../i18n'
import type { AiAssistantResponse } from '../../../lib/searchBuddy/apiTypes.ts'
import { textOrNull } from './resultHelpers.ts'
import styles from './ResultCard.module.css'

export function AiResponseCard({ data }: { data: AiAssistantResponse }) {
  const t = useTranslation()
  const answer = textOrNull(data.answer) || textOrNull(data.message)
  const sources = Array.isArray(data.sources) ? data.sources : []

  if (!answer) {
    return (
      <p className={styles.emptyNote} role="status">
        {t('searchBuddy.aiEmpty')}
      </p>
    )
  }

  return (
    <article className={`${styles.card} ${styles.aiCard}`} aria-label={t('searchBuddy.aiAnswerLabel')}>
      <p className={styles.aiLabel}>{t('searchBuddy.aiAnswerLabel')}</p>
      <p className={styles.aiBody}>{answer}</p>
      {sources.length ? (
        <div className={styles.aiSourcesBlock}>
          <p className={styles.aiSourcesHeading}>{t('searchBuddy.sourcesHeading')}</p>
          <ul className={styles.aiSources}>
            {sources.map((source, index) => {
              const title =
                textOrNull(source.title) || t('searchBuddy.sourceN', { n: String(index + 1) })
              const url = textOrNull(source.url)
              const excerpt = textOrNull(source.excerpt)
              return (
                <li key={`${title}-${index}`}>
                  {url ? (
                    <a href={url} target="_blank" rel="noopener noreferrer">
                      {title}
                    </a>
                  ) : (
                    <span>{title}</span>
                  )}
                  {excerpt ? (
                    <span className={styles.aiSourceExcerpt}> — {excerpt}</span>
                  ) : null}
                </li>
              )
            })}
          </ul>
        </div>
      ) : (
        <p className={styles.aiNoSources}>{t('searchBuddy.noSources')}</p>
      )}
    </article>
  )
}
