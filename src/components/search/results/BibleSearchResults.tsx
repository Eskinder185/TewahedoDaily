import type { BibleSearchResponse } from '../../../lib/searchBuddy/apiTypes.ts'
import { bookChapterLabel, displayText } from './resultHelpers.ts'
import styles from './ResultCard.module.css'

export function BibleSearchResults({ data }: { data: BibleSearchResponse }) {
  const results = Array.isArray(data.results) ? data.results : []
  if (!results.length) {
    return <p className={styles.emptyNote}>No Bible passages matched that search.</p>
  }

  return (
    <div className={styles.stack} aria-label="Bible search results">
      {results.map((hit, index) => {
        const ref = bookChapterLabel(hit)
        const excerpt = displayText(hit.excerpt, hit.text, hit.text_english, hit.text_amharic)
        const key = `${ref || 'hit'}-${index}`
        return (
          <article key={key} className={styles.card}>
            <p className={styles.eyebrow}>Bible</p>
            {ref ? <h3 className={styles.title}>{ref}</h3> : null}
            {excerpt ? <p className={styles.preview}>{excerpt}</p> : null}
          </article>
        )
      })}
    </div>
  )
}
