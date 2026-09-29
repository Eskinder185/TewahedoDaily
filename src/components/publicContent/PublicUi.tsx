import { useCallback } from 'react'
import { Link } from 'react-router-dom'
import { useAsync } from '../../lib/cms/useAsync'
import { publicMedia, type MezmurCard } from '../../lib/publicContent/service'
import { parseYoutubeVideoId } from '../../data/utils/youtube'
import s from './PublicContent.module.css'
import { useGlobalAudio } from '../../lib/publicContent/audio'

const LANGUAGE_LABEL: Record<string, string> = {
  am: 'Amharic',
  en: 'English',
  om: 'Oromo',
  gez: "Ge'ez",
}

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
    <div className={s.artwork} aria-hidden>
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
  if (loading) return <p role="status">Loading…</p>
  if (!error) return null
  if (import.meta.env.DEV) {
    console.error('[public mezmur] UI notice:', error)
  }
  return (
    <p role="alert">
      {error}{' '}
      <button type="button" onClick={retry}>
        Try again
      </button>
    </p>
  )
}

export function MezmurCards({ items }: { items: MezmurCard[] }) {
  const audio = useGlobalAudio()
  return (
    <div className={s.grid}>
      {items.map((item) => {
        const languages = item.languages
          .map((code) => LANGUAGE_LABEL[code] || code)
          .filter(Boolean)
        const meta = [
          item.form === 'werb' ? 'Werb' : null,
          ...languages,
          item.category_name,
          item.featured ? 'Featured' : null,
        ].filter(Boolean)
        const hasYoutube = Boolean(parseYoutubeVideoId(item.youtube_url || ''))

        return (
          <article className={s.card} key={item.id}>
            <Link to={`/practice/mezmur/${item.slug}`}>
              <Artwork reference={item.thumbnail_url} title={item.title} />
              <h2>{item.title}</h2>
              {item.title_amharic ? <p lang="am">{item.title_amharic}</p> : null}
            </Link>
            {item.singer_name ? <p>{item.singer_name}</p> : null}
            {meta.length ? <p className={s.muted}>{meta.join(' · ')}</p> : null}
            <div className={s.actions}>
              {item.audio_url ? (
                <button type="button" onClick={() => audio.play(item, items)}>
                  Play audio
                </button>
              ) : null}
              {hasYoutube ? (
                <Link to={`/practice/mezmur/${item.slug}`}>Open hymn</Link>
              ) : (
                <Link to={`/practice/mezmur/${item.slug}`}>Read lyrics</Link>
              )}
            </div>
          </article>
        )
      })}
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
  const pages = Math.max(1, Math.ceil(total / 24))
  return (
    <nav className={s.actions} aria-label="Results pages">
      <button type="button" disabled={page <= 1} onClick={() => change(page - 1)}>
        Previous
      </button>
      <span>
        Page {page} of {pages}
      </span>
      <button
        type="button"
        disabled={page * 24 >= total}
        onClick={() => change(page + 1)}
      >
        Next
      </button>
    </nav>
  )
}
