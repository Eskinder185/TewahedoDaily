import { useCallback } from 'react'
import { Link } from 'react-router-dom'
import { useAsync } from '../../lib/cms/useAsync'
import { publicMedia, type MezmurCard } from '../../lib/publicContent/service'
import s from './PublicContent.module.css'
import { useGlobalAudio } from '../../lib/publicContent/audio'
export function Artwork({
  reference,
  title = '',
}: {
  reference: string | null | undefined
  title?: string
}) {
  const image = useAsync(useCallback(() => publicMedia(reference), [reference]))
  return image.data ? (
    <img
      className={s.artwork}
      src={image.data}
      alt={title}
      loading="lazy"
      decoding="async"
    />
  ) : (
    <div className={s.artwork} aria-label="Mezmur artwork">
      ✣
    </div>
  )
}
export function Notice({
  loading,
  error,
  retry,
}: {
  loading: boolean
  error?: string
  retry: () => void
}) {
  return loading ? (
    <p role="status">Loading…</p>
  ) : error ? (
    <p role="alert">
      We couldn’t load this content. <button onClick={retry}>Try again</button>
    </p>
  ) : null
}
export function MezmurCards({ items }: { items: MezmurCard[] }) {
  const audio = useGlobalAudio()
  return (
    <div className={s.grid}>
      {items.map((item) => (
        <article className={s.card} key={item.id}>
          <Link to={`/practice/mezmur/${item.slug}`}>
            <Artwork reference={item.thumbnail_url} />
            <h2>{item.title}</h2>
            {item.title_amharic && <p lang="am">{item.title_amharic}</p>}
          </Link>
          <p>{item.singer_name || 'Singer not recorded'}</p>
          <p className={s.muted}>
            {item.category_name}
            {item.featured ? ' · Featured' : ''}
          </p>
          {item.audio_url && (
            <button onClick={() => audio.play(item, items)}>
              Play {item.title}
            </button>
          )}
        </article>
      ))}
    </div>
  )
}
export function Pagination({
  page,
  total,
  change,
}: {
  page: number
  total: number
  change: (page: number) => void
}) {
  return (
    <nav className={s.actions} aria-label="Results pages">
      <button disabled={page <= 1} onClick={() => change(page - 1)}>
        Previous
      </button>
      <span>
        Page {page} of {Math.max(1, Math.ceil(total / 24))}
      </span>
      <button disabled={page * 24 >= total} onClick={() => change(page + 1)}>
        Next
      </button>
    </nav>
  )
}
