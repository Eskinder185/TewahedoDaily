import { Link } from 'react-router-dom'
import { LOCAL_PREVIEW } from '../../lib/localPreview'
import s from './LocalPreviewBanner.module.css'

/** Visible on every local-preview page that renders it; renders nothing (and is removed from production bundles) otherwise. */
export function LocalPreviewBanner({ showReviewLink = true }: { showReviewLink?: boolean }) {
  if (!LOCAL_PREVIEW) return null
  return (
    <aside className={s.banner} role="note" data-local-preview-banner>
      <strong className={s.tag}>LOCAL PREVIEW</strong>
      <span className={s.text}>
        Playing the bundled and generated content on this computer only. Hosted writes are blocked; nothing here is published.
      </span>
      {showReviewLink ? <Link className={s.link} to="/play/local-review">Review all 834 drafts</Link> : <Link className={s.link} to="/play">Back to Play</Link>}
    </aside>
  )
}
