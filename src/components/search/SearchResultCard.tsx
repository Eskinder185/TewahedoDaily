import { Link } from 'react-router-dom'
import type { SiteSearchResult } from '../../lib/search/types'
import { resolveContentMediaUrl } from '../../lib/cms/contentMedia'
import styles from './SearchBuddy.module.css'

export function SearchResultCard({
  result,
  onOpen,
}: {
  result: SiteSearchResult
  onOpen?: (route: string) => void
}) {
  const image = result.imagePath ? resolveContentMediaUrl(result.imagePath) : ''

  return (
    <Link
      to={result.route}
      className={styles.card}
      onClick={() => onOpen?.(result.route)}
    >
      {image ? (
        <img className={styles.cardArt} src={image} alt="" loading="lazy" />
      ) : (
        <div className={styles.cardArtEmpty} aria-hidden />
      )}
      <div className={styles.cardBody}>
        <p className={styles.cardType}>{result.typeLabel}</p>
        {result.titleAmharic ? (
          <p className={styles.cardAm} lang="am">
            {result.titleAmharic}
          </p>
        ) : null}
        <h3 className={styles.cardTitle}>{result.title}</h3>
        {result.description ? <p className={styles.cardDesc}>{result.description}</p> : null}
        <span className={styles.cardOpen}>Open →</span>
      </div>
    </Link>
  )
}
