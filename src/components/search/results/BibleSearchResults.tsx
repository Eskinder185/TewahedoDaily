import { Link } from 'react-router-dom'
import type { BibleSearchResponse } from '../../../lib/searchBuddy/apiTypes.ts'
import { resolveBibleDetailPath } from '../../../lib/search/bibleRoute.ts'
import { normalizeBibleSearchHit } from '../../../lib/search/structuredSearchApi.ts'
import { useSearchBuddyOptional } from '../../../lib/search/searchBuddySession.tsx'
import { bookChapterLabel, displayText } from './resultHelpers.ts'
import styles from './ResultCard.module.css'

export function BibleSearchResults({ data }: { data: BibleSearchResponse }) {
  const searchBuddy = useSearchBuddyOptional()
  const results = Array.isArray(data.results) ? data.results : []
  if (!results.length) {
    return <p className={styles.emptyNote}>No Bible passages matched that search.</p>
  }

  return (
    <div className={styles.stack} aria-label="Bible search results">
      {results.map((raw, index) => {
        const hit = normalizeBibleSearchHit(raw) || raw
        const ref = bookChapterLabel(hit)
        const excerpt = displayText(hit.excerpt, hit.text, hit.text_english, hit.text_amharic)
        const route = resolveBibleDetailPath(hit)
        const key = `${ref || 'hit'}-${index}`
        return (
          <article key={key} className={styles.card}>
            <p className={styles.eyebrow}>Bible</p>
            {ref ? <h3 className={styles.title}>{ref}</h3> : null}
            {excerpt ? <p className={styles.preview}>{excerpt}</p> : null}
            {route ? (
              <div className={styles.actions}>
                <Link
                  className={styles.actionPrimary}
                  to={route}
                  state={{ fromSearchBuddy: true }}
                  onClick={() => searchBuddy?.setOpen(false)}
                >
                  Open passage
                </Link>
              </div>
            ) : null}
          </article>
        )
      })}
    </div>
  )
}
