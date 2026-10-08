import type { AiAssistantResponse } from '../../../lib/searchBuddy/apiTypes.ts'
import { textOrNull } from './resultHelpers.ts'
import styles from './ResultCard.module.css'

export function AiResponseCard({ data }: { data: AiAssistantResponse }) {
  const answer = textOrNull(data.answer) || textOrNull(data.message)
  const sources = Array.isArray(data.sources) ? data.sources : []

  if (!answer) {
    return (
      <p className={styles.emptyNote} role="status">
        The assistant did not return a response.
      </p>
    )
  }

  return (
    <article className={`${styles.card} ${styles.aiCard}`} aria-label="Assistant note">
      <p className={styles.aiLabel}>Assistant note</p>
      <p className={styles.aiBody}>{answer}</p>
      {sources.length ? (
        <ul className={styles.aiSources}>
          {sources.map((source, index) => {
            const title = textOrNull(source.title) || `Source ${index + 1}`
            const url = textOrNull(source.url)
            return (
              <li key={`${title}-${index}`}>
                {url ? (
                  <a href={url} target="_blank" rel="noopener noreferrer">
                    {title}
                  </a>
                ) : (
                  <span>{title}</span>
                )}
                {textOrNull(source.excerpt) ? ` — ${source.excerpt}` : null}
              </li>
            )
          })}
        </ul>
      ) : null}
    </article>
  )
}
